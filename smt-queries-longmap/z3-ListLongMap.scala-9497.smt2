; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112814 () Bool)

(assert start!112814)

(declare-fun b_free!30985 () Bool)

(declare-fun b_next!30985 () Bool)

(assert (=> start!112814 (= b_free!30985 (not b_next!30985))))

(declare-fun tp!108592 () Bool)

(declare-fun b_and!49895 () Bool)

(assert (=> start!112814 (= tp!108592 b_and!49895)))

(declare-fun b!1336940 () Bool)

(declare-fun res!886973 () Bool)

(declare-fun e!761512 () Bool)

(assert (=> b!1336940 (=> (not res!886973) (not e!761512))))

(declare-datatypes ((V!54297 0))(
  ( (V!54298 (val!18522 Int)) )
))
(declare-datatypes ((ValueCell!17549 0))(
  ( (ValueCellFull!17549 (v!21154 V!54297)) (EmptyCell!17549) )
))
(declare-datatypes ((array!90761 0))(
  ( (array!90762 (arr!43842 (Array (_ BitVec 32) ValueCell!17549)) (size!44393 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90761)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90763 0))(
  ( (array!90764 (arr!43843 (Array (_ BitVec 32) (_ BitVec 64))) (size!44394 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90763)

(assert (=> b!1336940 (= res!886973 (and (= (size!44393 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44394 _keys!1590) (size!44393 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336941 () Bool)

(declare-fun res!886972 () Bool)

(assert (=> b!1336941 (=> (not res!886972) (not e!761512))))

(assert (=> b!1336941 (= res!886972 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336942 () Bool)

(declare-fun e!761515 () Bool)

(declare-fun e!761511 () Bool)

(declare-fun mapRes!57016 () Bool)

(assert (=> b!1336942 (= e!761515 (and e!761511 mapRes!57016))))

(declare-fun condMapEmpty!57016 () Bool)

(declare-fun mapDefault!57016 () ValueCell!17549)

(assert (=> b!1336942 (= condMapEmpty!57016 (= (arr!43842 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17549)) mapDefault!57016)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54297)

(declare-fun zeroValue!1262 () V!54297)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun b!1336943 () Bool)

(declare-datatypes ((tuple2!23920 0))(
  ( (tuple2!23921 (_1!11971 (_ BitVec 64)) (_2!11971 V!54297)) )
))
(declare-datatypes ((List!31067 0))(
  ( (Nil!31064) (Cons!31063 (h!32281 tuple2!23920) (t!45325 List!31067)) )
))
(declare-datatypes ((ListLongMap!21585 0))(
  ( (ListLongMap!21586 (toList!10808 List!31067)) )
))
(declare-fun contains!8983 (ListLongMap!21585 (_ BitVec 64)) Bool)

(declare-fun +!4762 (ListLongMap!21585 tuple2!23920) ListLongMap!21585)

(declare-fun getCurrentListMapNoExtraKeys!6411 (array!90763 array!90761 (_ BitVec 32) (_ BitVec 32) V!54297 V!54297 (_ BitVec 32) Int) ListLongMap!21585)

(declare-fun get!22123 (ValueCell!17549 V!54297) V!54297)

(declare-fun dynLambda!3716 (Int (_ BitVec 64)) V!54297)

(assert (=> b!1336943 (= e!761512 (not (contains!8983 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))))

(declare-fun b!1336944 () Bool)

(declare-fun res!886975 () Bool)

(assert (=> b!1336944 (=> (not res!886975) (not e!761512))))

(declare-datatypes ((List!31068 0))(
  ( (Nil!31065) (Cons!31064 (h!32282 (_ BitVec 64)) (t!45326 List!31068)) )
))
(declare-fun arrayNoDuplicates!0 (array!90763 (_ BitVec 32) List!31068) Bool)

(assert (=> b!1336944 (= res!886975 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31065))))

(declare-fun b!1336945 () Bool)

(declare-fun res!886976 () Bool)

(assert (=> b!1336945 (=> (not res!886976) (not e!761512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90763 (_ BitVec 32)) Bool)

(assert (=> b!1336945 (= res!886976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336946 () Bool)

(declare-fun res!886970 () Bool)

(assert (=> b!1336946 (=> (not res!886970) (not e!761512))))

(assert (=> b!1336946 (= res!886970 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44394 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57016 () Bool)

(assert (=> mapIsEmpty!57016 mapRes!57016))

(declare-fun b!1336947 () Bool)

(declare-fun res!886974 () Bool)

(assert (=> b!1336947 (=> (not res!886974) (not e!761512))))

(declare-fun getCurrentListMap!5766 (array!90763 array!90761 (_ BitVec 32) (_ BitVec 32) V!54297 V!54297 (_ BitVec 32) Int) ListLongMap!21585)

(assert (=> b!1336947 (= res!886974 (contains!8983 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336948 () Bool)

(declare-fun tp_is_empty!36895 () Bool)

(assert (=> b!1336948 (= e!761511 tp_is_empty!36895)))

(declare-fun res!886969 () Bool)

(assert (=> start!112814 (=> (not res!886969) (not e!761512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112814 (= res!886969 (validMask!0 mask!1998))))

(assert (=> start!112814 e!761512))

(declare-fun array_inv!33329 (array!90761) Bool)

(assert (=> start!112814 (and (array_inv!33329 _values!1320) e!761515)))

(assert (=> start!112814 true))

(declare-fun array_inv!33330 (array!90763) Bool)

(assert (=> start!112814 (array_inv!33330 _keys!1590)))

(assert (=> start!112814 tp!108592))

(assert (=> start!112814 tp_is_empty!36895))

(declare-fun b!1336949 () Bool)

(declare-fun e!761514 () Bool)

(assert (=> b!1336949 (= e!761514 tp_is_empty!36895)))

(declare-fun b!1336950 () Bool)

(declare-fun res!886971 () Bool)

(assert (=> b!1336950 (=> (not res!886971) (not e!761512))))

(assert (=> b!1336950 (= res!886971 (not (= (select (arr!43843 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336951 () Bool)

(declare-fun res!886968 () Bool)

(assert (=> b!1336951 (=> (not res!886968) (not e!761512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336951 (= res!886968 (validKeyInArray!0 (select (arr!43843 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!57016 () Bool)

(declare-fun tp!108591 () Bool)

(assert (=> mapNonEmpty!57016 (= mapRes!57016 (and tp!108591 e!761514))))

(declare-fun mapKey!57016 () (_ BitVec 32))

(declare-fun mapValue!57016 () ValueCell!17549)

(declare-fun mapRest!57016 () (Array (_ BitVec 32) ValueCell!17549))

(assert (=> mapNonEmpty!57016 (= (arr!43842 _values!1320) (store mapRest!57016 mapKey!57016 mapValue!57016))))

(assert (= (and start!112814 res!886969) b!1336940))

(assert (= (and b!1336940 res!886973) b!1336945))

(assert (= (and b!1336945 res!886976) b!1336944))

(assert (= (and b!1336944 res!886975) b!1336946))

(assert (= (and b!1336946 res!886970) b!1336947))

(assert (= (and b!1336947 res!886974) b!1336950))

(assert (= (and b!1336950 res!886971) b!1336951))

(assert (= (and b!1336951 res!886968) b!1336941))

(assert (= (and b!1336941 res!886972) b!1336943))

(assert (= (and b!1336942 condMapEmpty!57016) mapIsEmpty!57016))

(assert (= (and b!1336942 (not condMapEmpty!57016)) mapNonEmpty!57016))

(get-info :version)

(assert (= (and mapNonEmpty!57016 ((_ is ValueCellFull!17549) mapValue!57016)) b!1336949))

(assert (= (and b!1336942 ((_ is ValueCellFull!17549) mapDefault!57016)) b!1336948))

(assert (= start!112814 b!1336942))

(declare-fun b_lambda!24107 () Bool)

(assert (=> (not b_lambda!24107) (not b!1336943)))

(declare-fun t!45324 () Bool)

(declare-fun tb!12061 () Bool)

(assert (=> (and start!112814 (= defaultEntry!1323 defaultEntry!1323) t!45324) tb!12061))

(declare-fun result!25201 () Bool)

(assert (=> tb!12061 (= result!25201 tp_is_empty!36895)))

(assert (=> b!1336943 t!45324))

(declare-fun b_and!49897 () Bool)

(assert (= b_and!49895 (and (=> t!45324 result!25201) b_and!49897)))

(declare-fun m!1225217 () Bool)

(assert (=> b!1336943 m!1225217))

(declare-fun m!1225219 () Bool)

(assert (=> b!1336943 m!1225219))

(declare-fun m!1225221 () Bool)

(assert (=> b!1336943 m!1225221))

(declare-fun m!1225223 () Bool)

(assert (=> b!1336943 m!1225223))

(declare-fun m!1225225 () Bool)

(assert (=> b!1336943 m!1225225))

(assert (=> b!1336943 m!1225219))

(declare-fun m!1225227 () Bool)

(assert (=> b!1336943 m!1225227))

(assert (=> b!1336943 m!1225217))

(assert (=> b!1336943 m!1225221))

(declare-fun m!1225229 () Bool)

(assert (=> b!1336943 m!1225229))

(assert (=> b!1336943 m!1225223))

(assert (=> b!1336943 m!1225227))

(declare-fun m!1225231 () Bool)

(assert (=> b!1336943 m!1225231))

(declare-fun m!1225233 () Bool)

(assert (=> b!1336945 m!1225233))

(assert (=> b!1336951 m!1225229))

(assert (=> b!1336951 m!1225229))

(declare-fun m!1225235 () Bool)

(assert (=> b!1336951 m!1225235))

(declare-fun m!1225237 () Bool)

(assert (=> b!1336944 m!1225237))

(declare-fun m!1225239 () Bool)

(assert (=> mapNonEmpty!57016 m!1225239))

(assert (=> b!1336950 m!1225229))

(declare-fun m!1225241 () Bool)

(assert (=> b!1336947 m!1225241))

(assert (=> b!1336947 m!1225241))

(declare-fun m!1225243 () Bool)

(assert (=> b!1336947 m!1225243))

(declare-fun m!1225245 () Bool)

(assert (=> start!112814 m!1225245))

(declare-fun m!1225247 () Bool)

(assert (=> start!112814 m!1225247))

(declare-fun m!1225249 () Bool)

(assert (=> start!112814 m!1225249))

(check-sat (not b!1336951) tp_is_empty!36895 (not mapNonEmpty!57016) (not b!1336947) (not start!112814) (not b!1336944) (not b!1336943) (not b_next!30985) b_and!49897 (not b_lambda!24107) (not b!1336945))
(check-sat b_and!49897 (not b_next!30985))
(get-model)

(declare-fun b_lambda!24113 () Bool)

(assert (= b_lambda!24107 (or (and start!112814 b_free!30985) b_lambda!24113)))

(check-sat (not b!1336951) tp_is_empty!36895 (not b!1336945) (not mapNonEmpty!57016) (not b!1336947) (not start!112814) (not b!1336944) (not b!1336943) (not b_lambda!24113) (not b_next!30985) b_and!49897)
(check-sat b_and!49897 (not b_next!30985))
(get-model)

(declare-fun d!143965 () Bool)

(assert (=> d!143965 (= (validKeyInArray!0 (select (arr!43843 _keys!1590) from!1980)) (and (not (= (select (arr!43843 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43843 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1336951 d!143965))

(declare-fun b!1337038 () Bool)

(declare-fun e!761552 () Bool)

(declare-fun e!761553 () Bool)

(assert (=> b!1337038 (= e!761552 e!761553)))

(declare-fun lt!592955 () (_ BitVec 64))

(assert (=> b!1337038 (= lt!592955 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43828 0))(
  ( (Unit!43829) )
))
(declare-fun lt!592956 () Unit!43828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90763 (_ BitVec 64) (_ BitVec 32)) Unit!43828)

(assert (=> b!1337038 (= lt!592956 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!592955 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1337038 (arrayContainsKey!0 _keys!1590 lt!592955 #b00000000000000000000000000000000)))

(declare-fun lt!592954 () Unit!43828)

(assert (=> b!1337038 (= lt!592954 lt!592956)))

(declare-fun res!887035 () Bool)

(declare-datatypes ((SeekEntryResult!10003 0))(
  ( (MissingZero!10003 (index!42383 (_ BitVec 32))) (Found!10003 (index!42384 (_ BitVec 32))) (Intermediate!10003 (undefined!10815 Bool) (index!42385 (_ BitVec 32)) (x!119304 (_ BitVec 32))) (Undefined!10003) (MissingVacant!10003 (index!42386 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90763 (_ BitVec 32)) SeekEntryResult!10003)

(assert (=> b!1337038 (= res!887035 (= (seekEntryOrOpen!0 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10003 #b00000000000000000000000000000000)))))

(assert (=> b!1337038 (=> (not res!887035) (not e!761553))))

(declare-fun bm!64887 () Bool)

(declare-fun call!64890 () Bool)

(assert (=> bm!64887 (= call!64890 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1337039 () Bool)

(assert (=> b!1337039 (= e!761552 call!64890)))

(declare-fun b!1337041 () Bool)

(declare-fun e!761554 () Bool)

(assert (=> b!1337041 (= e!761554 e!761552)))

(declare-fun c!126302 () Bool)

(assert (=> b!1337041 (= c!126302 (validKeyInArray!0 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!143967 () Bool)

(declare-fun res!887036 () Bool)

(assert (=> d!143967 (=> res!887036 e!761554)))

(assert (=> d!143967 (= res!887036 (bvsge #b00000000000000000000000000000000 (size!44394 _keys!1590)))))

(assert (=> d!143967 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!761554)))

(declare-fun b!1337040 () Bool)

(assert (=> b!1337040 (= e!761553 call!64890)))

(assert (= (and d!143967 (not res!887036)) b!1337041))

(assert (= (and b!1337041 c!126302) b!1337038))

(assert (= (and b!1337041 (not c!126302)) b!1337039))

(assert (= (and b!1337038 res!887035) b!1337040))

(assert (= (or b!1337040 b!1337039) bm!64887))

(declare-fun m!1225319 () Bool)

(assert (=> b!1337038 m!1225319))

(declare-fun m!1225321 () Bool)

(assert (=> b!1337038 m!1225321))

(declare-fun m!1225323 () Bool)

(assert (=> b!1337038 m!1225323))

(assert (=> b!1337038 m!1225319))

(declare-fun m!1225325 () Bool)

(assert (=> b!1337038 m!1225325))

(declare-fun m!1225327 () Bool)

(assert (=> bm!64887 m!1225327))

(assert (=> b!1337041 m!1225319))

(assert (=> b!1337041 m!1225319))

(declare-fun m!1225329 () Bool)

(assert (=> b!1337041 m!1225329))

(assert (=> b!1336945 d!143967))

(declare-fun d!143969 () Bool)

(assert (=> d!143969 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112814 d!143969))

(declare-fun d!143971 () Bool)

(assert (=> d!143971 (= (array_inv!33329 _values!1320) (bvsge (size!44393 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112814 d!143971))

(declare-fun d!143973 () Bool)

(assert (=> d!143973 (= (array_inv!33330 _keys!1590) (bvsge (size!44394 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112814 d!143973))

(declare-fun bm!64890 () Bool)

(declare-fun call!64893 () Bool)

(declare-fun c!126305 () Bool)

(assert (=> bm!64890 (= call!64893 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126305 (Cons!31064 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) Nil!31065) Nil!31065)))))

(declare-fun b!1337052 () Bool)

(declare-fun e!761564 () Bool)

(declare-fun e!761565 () Bool)

(assert (=> b!1337052 (= e!761564 e!761565)))

(assert (=> b!1337052 (= c!126305 (validKeyInArray!0 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337053 () Bool)

(declare-fun e!761563 () Bool)

(declare-fun contains!8986 (List!31068 (_ BitVec 64)) Bool)

(assert (=> b!1337053 (= e!761563 (contains!8986 Nil!31065 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337054 () Bool)

(assert (=> b!1337054 (= e!761565 call!64893)))

(declare-fun b!1337055 () Bool)

(assert (=> b!1337055 (= e!761565 call!64893)))

(declare-fun b!1337056 () Bool)

(declare-fun e!761566 () Bool)

(assert (=> b!1337056 (= e!761566 e!761564)))

(declare-fun res!887043 () Bool)

(assert (=> b!1337056 (=> (not res!887043) (not e!761564))))

(assert (=> b!1337056 (= res!887043 (not e!761563))))

(declare-fun res!887044 () Bool)

(assert (=> b!1337056 (=> (not res!887044) (not e!761563))))

(assert (=> b!1337056 (= res!887044 (validKeyInArray!0 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!143975 () Bool)

(declare-fun res!887045 () Bool)

(assert (=> d!143975 (=> res!887045 e!761566)))

(assert (=> d!143975 (= res!887045 (bvsge #b00000000000000000000000000000000 (size!44394 _keys!1590)))))

(assert (=> d!143975 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31065) e!761566)))

(assert (= (and d!143975 (not res!887045)) b!1337056))

(assert (= (and b!1337056 res!887044) b!1337053))

(assert (= (and b!1337056 res!887043) b!1337052))

(assert (= (and b!1337052 c!126305) b!1337055))

(assert (= (and b!1337052 (not c!126305)) b!1337054))

(assert (= (or b!1337055 b!1337054) bm!64890))

(assert (=> bm!64890 m!1225319))

(declare-fun m!1225331 () Bool)

(assert (=> bm!64890 m!1225331))

(assert (=> b!1337052 m!1225319))

(assert (=> b!1337052 m!1225319))

(assert (=> b!1337052 m!1225329))

(assert (=> b!1337053 m!1225319))

(assert (=> b!1337053 m!1225319))

(declare-fun m!1225333 () Bool)

(assert (=> b!1337053 m!1225333))

(assert (=> b!1337056 m!1225319))

(assert (=> b!1337056 m!1225319))

(assert (=> b!1337056 m!1225329))

(assert (=> b!1336944 d!143975))

(declare-fun d!143977 () Bool)

(declare-fun e!761569 () Bool)

(assert (=> d!143977 e!761569))

(declare-fun res!887051 () Bool)

(assert (=> d!143977 (=> (not res!887051) (not e!761569))))

(declare-fun lt!592966 () ListLongMap!21585)

(assert (=> d!143977 (= res!887051 (contains!8983 lt!592966 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!592965 () List!31067)

(assert (=> d!143977 (= lt!592966 (ListLongMap!21586 lt!592965))))

(declare-fun lt!592968 () Unit!43828)

(declare-fun lt!592967 () Unit!43828)

(assert (=> d!143977 (= lt!592968 lt!592967)))

(declare-datatypes ((Option!762 0))(
  ( (Some!761 (v!21157 V!54297)) (None!760) )
))
(declare-fun getValueByKey!711 (List!31067 (_ BitVec 64)) Option!762)

(assert (=> d!143977 (= (getValueByKey!711 lt!592965 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!761 (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!361 (List!31067 (_ BitVec 64) V!54297) Unit!43828)

(assert (=> d!143977 (= lt!592967 (lemmaContainsTupThenGetReturnValue!361 lt!592965 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!490 (List!31067 (_ BitVec 64) V!54297) List!31067)

(assert (=> d!143977 (= lt!592965 (insertStrictlySorted!490 (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143977 (= (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!592966)))

(declare-fun b!1337061 () Bool)

(declare-fun res!887050 () Bool)

(assert (=> b!1337061 (=> (not res!887050) (not e!761569))))

(assert (=> b!1337061 (= res!887050 (= (getValueByKey!711 (toList!10808 lt!592966) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!761 (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1337062 () Bool)

(declare-fun contains!8987 (List!31067 tuple2!23920) Bool)

(assert (=> b!1337062 (= e!761569 (contains!8987 (toList!10808 lt!592966) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143977 res!887051) b!1337061))

(assert (= (and b!1337061 res!887050) b!1337062))

(declare-fun m!1225335 () Bool)

(assert (=> d!143977 m!1225335))

(declare-fun m!1225337 () Bool)

(assert (=> d!143977 m!1225337))

(declare-fun m!1225339 () Bool)

(assert (=> d!143977 m!1225339))

(declare-fun m!1225341 () Bool)

(assert (=> d!143977 m!1225341))

(declare-fun m!1225343 () Bool)

(assert (=> b!1337061 m!1225343))

(declare-fun m!1225345 () Bool)

(assert (=> b!1337062 m!1225345))

(assert (=> b!1336943 d!143977))

(declare-fun d!143979 () Bool)

(declare-fun e!761570 () Bool)

(assert (=> d!143979 e!761570))

(declare-fun res!887053 () Bool)

(assert (=> d!143979 (=> (not res!887053) (not e!761570))))

(declare-fun lt!592970 () ListLongMap!21585)

(assert (=> d!143979 (= res!887053 (contains!8983 lt!592970 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!592969 () List!31067)

(assert (=> d!143979 (= lt!592970 (ListLongMap!21586 lt!592969))))

(declare-fun lt!592972 () Unit!43828)

(declare-fun lt!592971 () Unit!43828)

(assert (=> d!143979 (= lt!592972 lt!592971)))

(assert (=> d!143979 (= (getValueByKey!711 lt!592969 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!761 (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143979 (= lt!592971 (lemmaContainsTupThenGetReturnValue!361 lt!592969 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143979 (= lt!592969 (insertStrictlySorted!490 (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143979 (= (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!592970)))

(declare-fun b!1337063 () Bool)

(declare-fun res!887052 () Bool)

(assert (=> b!1337063 (=> (not res!887052) (not e!761570))))

(assert (=> b!1337063 (= res!887052 (= (getValueByKey!711 (toList!10808 lt!592970) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!761 (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1337064 () Bool)

(assert (=> b!1337064 (= e!761570 (contains!8987 (toList!10808 lt!592970) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143979 res!887053) b!1337063))

(assert (= (and b!1337063 res!887052) b!1337064))

(declare-fun m!1225347 () Bool)

(assert (=> d!143979 m!1225347))

(declare-fun m!1225349 () Bool)

(assert (=> d!143979 m!1225349))

(declare-fun m!1225351 () Bool)

(assert (=> d!143979 m!1225351))

(declare-fun m!1225353 () Bool)

(assert (=> d!143979 m!1225353))

(declare-fun m!1225355 () Bool)

(assert (=> b!1337063 m!1225355))

(declare-fun m!1225357 () Bool)

(assert (=> b!1337064 m!1225357))

(assert (=> b!1336943 d!143979))

(declare-fun lt!592993 () ListLongMap!21585)

(declare-fun b!1337089 () Bool)

(declare-fun e!761589 () Bool)

(assert (=> b!1337089 (= e!761589 (= lt!592993 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1337090 () Bool)

(declare-fun res!887065 () Bool)

(declare-fun e!761588 () Bool)

(assert (=> b!1337090 (=> (not res!887065) (not e!761588))))

(assert (=> b!1337090 (= res!887065 (not (contains!8983 lt!592993 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337091 () Bool)

(declare-fun e!761585 () Bool)

(assert (=> b!1337091 (= e!761588 e!761585)))

(declare-fun c!126314 () Bool)

(declare-fun e!761587 () Bool)

(assert (=> b!1337091 (= c!126314 e!761587)))

(declare-fun res!887062 () Bool)

(assert (=> b!1337091 (=> (not res!887062) (not e!761587))))

(assert (=> b!1337091 (= res!887062 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44394 _keys!1590)))))

(declare-fun b!1337092 () Bool)

(declare-fun lt!592992 () Unit!43828)

(declare-fun lt!592990 () Unit!43828)

(assert (=> b!1337092 (= lt!592992 lt!592990)))

(declare-fun lt!592987 () (_ BitVec 64))

(declare-fun lt!592988 () V!54297)

(declare-fun lt!592991 () (_ BitVec 64))

(declare-fun lt!592989 () ListLongMap!21585)

(assert (=> b!1337092 (not (contains!8983 (+!4762 lt!592989 (tuple2!23921 lt!592991 lt!592988)) lt!592987))))

(declare-fun addStillNotContains!497 (ListLongMap!21585 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43828)

(assert (=> b!1337092 (= lt!592990 (addStillNotContains!497 lt!592989 lt!592991 lt!592988 lt!592987))))

(assert (=> b!1337092 (= lt!592987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1337092 (= lt!592988 (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1337092 (= lt!592991 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun call!64896 () ListLongMap!21585)

(assert (=> b!1337092 (= lt!592989 call!64896)))

(declare-fun e!761591 () ListLongMap!21585)

(assert (=> b!1337092 (= e!761591 (+!4762 call!64896 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337093 () Bool)

(declare-fun isEmpty!1085 (ListLongMap!21585) Bool)

(assert (=> b!1337093 (= e!761589 (isEmpty!1085 lt!592993))))

(declare-fun b!1337094 () Bool)

(assert (=> b!1337094 (= e!761587 (validKeyInArray!0 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1337094 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1337095 () Bool)

(assert (=> b!1337095 (= e!761585 e!761589)))

(declare-fun c!126316 () Bool)

(assert (=> b!1337095 (= c!126316 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44394 _keys!1590)))))

(declare-fun b!1337096 () Bool)

(assert (=> b!1337096 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44394 _keys!1590)))))

(assert (=> b!1337096 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44393 _values!1320)))))

(declare-fun e!761590 () Bool)

(declare-fun apply!1041 (ListLongMap!21585 (_ BitVec 64)) V!54297)

(assert (=> b!1337096 (= e!761590 (= (apply!1041 lt!592993 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!64893 () Bool)

(assert (=> bm!64893 (= call!64896 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1337097 () Bool)

(assert (=> b!1337097 (= e!761591 call!64896)))

(declare-fun b!1337098 () Bool)

(declare-fun e!761586 () ListLongMap!21585)

(assert (=> b!1337098 (= e!761586 e!761591)))

(declare-fun c!126317 () Bool)

(assert (=> b!1337098 (= c!126317 (validKeyInArray!0 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun d!143981 () Bool)

(assert (=> d!143981 e!761588))

(declare-fun res!887063 () Bool)

(assert (=> d!143981 (=> (not res!887063) (not e!761588))))

(assert (=> d!143981 (= res!887063 (not (contains!8983 lt!592993 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143981 (= lt!592993 e!761586)))

(declare-fun c!126315 () Bool)

(assert (=> d!143981 (= c!126315 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44394 _keys!1590)))))

(assert (=> d!143981 (validMask!0 mask!1998)))

(assert (=> d!143981 (= (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!592993)))

(declare-fun b!1337099 () Bool)

(assert (=> b!1337099 (= e!761586 (ListLongMap!21586 Nil!31064))))

(declare-fun b!1337100 () Bool)

(assert (=> b!1337100 (= e!761585 e!761590)))

(assert (=> b!1337100 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44394 _keys!1590)))))

(declare-fun res!887064 () Bool)

(assert (=> b!1337100 (= res!887064 (contains!8983 lt!592993 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1337100 (=> (not res!887064) (not e!761590))))

(assert (= (and d!143981 c!126315) b!1337099))

(assert (= (and d!143981 (not c!126315)) b!1337098))

(assert (= (and b!1337098 c!126317) b!1337092))

(assert (= (and b!1337098 (not c!126317)) b!1337097))

(assert (= (or b!1337092 b!1337097) bm!64893))

(assert (= (and d!143981 res!887063) b!1337090))

(assert (= (and b!1337090 res!887065) b!1337091))

(assert (= (and b!1337091 res!887062) b!1337094))

(assert (= (and b!1337091 c!126314) b!1337100))

(assert (= (and b!1337091 (not c!126314)) b!1337095))

(assert (= (and b!1337100 res!887064) b!1337096))

(assert (= (and b!1337095 c!126316) b!1337089))

(assert (= (and b!1337095 (not c!126316)) b!1337093))

(declare-fun b_lambda!24115 () Bool)

(assert (=> (not b_lambda!24115) (not b!1337092)))

(assert (=> b!1337092 t!45324))

(declare-fun b_and!49907 () Bool)

(assert (= b_and!49897 (and (=> t!45324 result!25201) b_and!49907)))

(declare-fun b_lambda!24117 () Bool)

(assert (=> (not b_lambda!24117) (not b!1337096)))

(assert (=> b!1337096 t!45324))

(declare-fun b_and!49909 () Bool)

(assert (= b_and!49907 (and (=> t!45324 result!25201) b_and!49909)))

(declare-fun m!1225359 () Bool)

(assert (=> b!1337090 m!1225359))

(assert (=> b!1337096 m!1225223))

(declare-fun m!1225361 () Bool)

(assert (=> b!1337096 m!1225361))

(declare-fun m!1225363 () Bool)

(assert (=> b!1337096 m!1225363))

(declare-fun m!1225365 () Bool)

(assert (=> b!1337096 m!1225365))

(assert (=> b!1337096 m!1225223))

(declare-fun m!1225367 () Bool)

(assert (=> b!1337096 m!1225367))

(assert (=> b!1337096 m!1225365))

(assert (=> b!1337096 m!1225361))

(declare-fun m!1225369 () Bool)

(assert (=> bm!64893 m!1225369))

(assert (=> b!1337089 m!1225369))

(assert (=> b!1337094 m!1225361))

(assert (=> b!1337094 m!1225361))

(declare-fun m!1225371 () Bool)

(assert (=> b!1337094 m!1225371))

(assert (=> b!1337100 m!1225361))

(assert (=> b!1337100 m!1225361))

(declare-fun m!1225373 () Bool)

(assert (=> b!1337100 m!1225373))

(assert (=> b!1337098 m!1225361))

(assert (=> b!1337098 m!1225361))

(assert (=> b!1337098 m!1225371))

(declare-fun m!1225375 () Bool)

(assert (=> d!143981 m!1225375))

(assert (=> d!143981 m!1225245))

(assert (=> b!1337092 m!1225223))

(declare-fun m!1225377 () Bool)

(assert (=> b!1337092 m!1225377))

(declare-fun m!1225379 () Bool)

(assert (=> b!1337092 m!1225379))

(assert (=> b!1337092 m!1225365))

(assert (=> b!1337092 m!1225223))

(assert (=> b!1337092 m!1225367))

(assert (=> b!1337092 m!1225365))

(assert (=> b!1337092 m!1225361))

(assert (=> b!1337092 m!1225377))

(declare-fun m!1225381 () Bool)

(assert (=> b!1337092 m!1225381))

(declare-fun m!1225383 () Bool)

(assert (=> b!1337092 m!1225383))

(declare-fun m!1225385 () Bool)

(assert (=> b!1337093 m!1225385))

(assert (=> b!1336943 d!143981))

(declare-fun d!143983 () Bool)

(declare-fun c!126320 () Bool)

(assert (=> d!143983 (= c!126320 ((_ is ValueCellFull!17549) (select (arr!43842 _values!1320) from!1980)))))

(declare-fun e!761594 () V!54297)

(assert (=> d!143983 (= (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!761594)))

(declare-fun b!1337105 () Bool)

(declare-fun get!22125 (ValueCell!17549 V!54297) V!54297)

(assert (=> b!1337105 (= e!761594 (get!22125 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337106 () Bool)

(declare-fun get!22126 (ValueCell!17549 V!54297) V!54297)

(assert (=> b!1337106 (= e!761594 (get!22126 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143983 c!126320) b!1337105))

(assert (= (and d!143983 (not c!126320)) b!1337106))

(assert (=> b!1337105 m!1225221))

(assert (=> b!1337105 m!1225223))

(declare-fun m!1225387 () Bool)

(assert (=> b!1337105 m!1225387))

(assert (=> b!1337106 m!1225221))

(assert (=> b!1337106 m!1225223))

(declare-fun m!1225389 () Bool)

(assert (=> b!1337106 m!1225389))

(assert (=> b!1336943 d!143983))

(declare-fun d!143985 () Bool)

(declare-fun e!761600 () Bool)

(assert (=> d!143985 e!761600))

(declare-fun res!887068 () Bool)

(assert (=> d!143985 (=> res!887068 e!761600)))

(declare-fun lt!593004 () Bool)

(assert (=> d!143985 (= res!887068 (not lt!593004))))

(declare-fun lt!593002 () Bool)

(assert (=> d!143985 (= lt!593004 lt!593002)))

(declare-fun lt!593005 () Unit!43828)

(declare-fun e!761599 () Unit!43828)

(assert (=> d!143985 (= lt!593005 e!761599)))

(declare-fun c!126323 () Bool)

(assert (=> d!143985 (= c!126323 lt!593002)))

(declare-fun containsKey!737 (List!31067 (_ BitVec 64)) Bool)

(assert (=> d!143985 (= lt!593002 (containsKey!737 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (=> d!143985 (= (contains!8983 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153) lt!593004)))

(declare-fun b!1337113 () Bool)

(declare-fun lt!593003 () Unit!43828)

(assert (=> b!1337113 (= e!761599 lt!593003)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!483 (List!31067 (_ BitVec 64)) Unit!43828)

(assert (=> b!1337113 (= lt!593003 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun isDefined!520 (Option!762) Bool)

(assert (=> b!1337113 (isDefined!520 (getValueByKey!711 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun b!1337114 () Bool)

(declare-fun Unit!43830 () Unit!43828)

(assert (=> b!1337114 (= e!761599 Unit!43830)))

(declare-fun b!1337115 () Bool)

(assert (=> b!1337115 (= e!761600 (isDefined!520 (getValueByKey!711 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153)))))

(assert (= (and d!143985 c!126323) b!1337113))

(assert (= (and d!143985 (not c!126323)) b!1337114))

(assert (= (and d!143985 (not res!887068)) b!1337115))

(declare-fun m!1225391 () Bool)

(assert (=> d!143985 m!1225391))

(declare-fun m!1225393 () Bool)

(assert (=> b!1337113 m!1225393))

(declare-fun m!1225395 () Bool)

(assert (=> b!1337113 m!1225395))

(assert (=> b!1337113 m!1225395))

(declare-fun m!1225397 () Bool)

(assert (=> b!1337113 m!1225397))

(assert (=> b!1337115 m!1225395))

(assert (=> b!1337115 m!1225395))

(assert (=> b!1337115 m!1225397))

(assert (=> b!1336943 d!143985))

(declare-fun d!143987 () Bool)

(declare-fun e!761602 () Bool)

(assert (=> d!143987 e!761602))

(declare-fun res!887069 () Bool)

(assert (=> d!143987 (=> res!887069 e!761602)))

(declare-fun lt!593008 () Bool)

(assert (=> d!143987 (= res!887069 (not lt!593008))))

(declare-fun lt!593006 () Bool)

(assert (=> d!143987 (= lt!593008 lt!593006)))

(declare-fun lt!593009 () Unit!43828)

(declare-fun e!761601 () Unit!43828)

(assert (=> d!143987 (= lt!593009 e!761601)))

(declare-fun c!126324 () Bool)

(assert (=> d!143987 (= c!126324 lt!593006)))

(assert (=> d!143987 (= lt!593006 (containsKey!737 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!143987 (= (contains!8983 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!593008)))

(declare-fun b!1337116 () Bool)

(declare-fun lt!593007 () Unit!43828)

(assert (=> b!1337116 (= e!761601 lt!593007)))

(assert (=> b!1337116 (= lt!593007 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> b!1337116 (isDefined!520 (getValueByKey!711 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1337117 () Bool)

(declare-fun Unit!43831 () Unit!43828)

(assert (=> b!1337117 (= e!761601 Unit!43831)))

(declare-fun b!1337118 () Bool)

(assert (=> b!1337118 (= e!761602 (isDefined!520 (getValueByKey!711 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143987 c!126324) b!1337116))

(assert (= (and d!143987 (not c!126324)) b!1337117))

(assert (= (and d!143987 (not res!887069)) b!1337118))

(declare-fun m!1225399 () Bool)

(assert (=> d!143987 m!1225399))

(declare-fun m!1225401 () Bool)

(assert (=> b!1337116 m!1225401))

(declare-fun m!1225403 () Bool)

(assert (=> b!1337116 m!1225403))

(assert (=> b!1337116 m!1225403))

(declare-fun m!1225405 () Bool)

(assert (=> b!1337116 m!1225405))

(assert (=> b!1337118 m!1225403))

(assert (=> b!1337118 m!1225403))

(assert (=> b!1337118 m!1225405))

(assert (=> b!1336947 d!143987))

(declare-fun b!1337161 () Bool)

(declare-fun e!761629 () Bool)

(assert (=> b!1337161 (= e!761629 (validKeyInArray!0 (select (arr!43843 _keys!1590) from!1980)))))

(declare-fun b!1337162 () Bool)

(declare-fun e!761633 () Bool)

(declare-fun lt!593061 () ListLongMap!21585)

(assert (=> b!1337162 (= e!761633 (= (apply!1041 lt!593061 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun d!143989 () Bool)

(declare-fun e!761632 () Bool)

(assert (=> d!143989 e!761632))

(declare-fun res!887090 () Bool)

(assert (=> d!143989 (=> (not res!887090) (not e!761632))))

(assert (=> d!143989 (= res!887090 (or (bvsge from!1980 (size!44394 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44394 _keys!1590)))))))

(declare-fun lt!593070 () ListLongMap!21585)

(assert (=> d!143989 (= lt!593061 lt!593070)))

(declare-fun lt!593064 () Unit!43828)

(declare-fun e!761637 () Unit!43828)

(assert (=> d!143989 (= lt!593064 e!761637)))

(declare-fun c!126342 () Bool)

(declare-fun e!761635 () Bool)

(assert (=> d!143989 (= c!126342 e!761635)))

(declare-fun res!887095 () Bool)

(assert (=> d!143989 (=> (not res!887095) (not e!761635))))

(assert (=> d!143989 (= res!887095 (bvslt from!1980 (size!44394 _keys!1590)))))

(declare-fun e!761641 () ListLongMap!21585)

(assert (=> d!143989 (= lt!593070 e!761641)))

(declare-fun c!126339 () Bool)

(assert (=> d!143989 (= c!126339 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143989 (validMask!0 mask!1998)))

(assert (=> d!143989 (= (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593061)))

(declare-fun b!1337163 () Bool)

(declare-fun e!761640 () ListLongMap!21585)

(declare-fun call!64911 () ListLongMap!21585)

(assert (=> b!1337163 (= e!761640 call!64911)))

(declare-fun bm!64908 () Bool)

(declare-fun call!64914 () Bool)

(assert (=> bm!64908 (= call!64914 (contains!8983 lt!593061 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337164 () Bool)

(declare-fun res!887092 () Bool)

(assert (=> b!1337164 (=> (not res!887092) (not e!761632))))

(declare-fun e!761638 () Bool)

(assert (=> b!1337164 (= res!887092 e!761638)))

(declare-fun c!126341 () Bool)

(assert (=> b!1337164 (= c!126341 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1337165 () Bool)

(declare-fun e!761631 () Bool)

(assert (=> b!1337165 (= e!761631 (not call!64914))))

(declare-fun b!1337166 () Bool)

(declare-fun e!761636 () Bool)

(assert (=> b!1337166 (= e!761636 (= (apply!1041 lt!593061 (select (arr!43843 _keys!1590) from!1980)) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337166 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44393 _values!1320)))))

(assert (=> b!1337166 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44394 _keys!1590)))))

(declare-fun bm!64909 () Bool)

(declare-fun call!64917 () ListLongMap!21585)

(declare-fun call!64915 () ListLongMap!21585)

(assert (=> bm!64909 (= call!64917 call!64915)))

(declare-fun b!1337167 () Bool)

(declare-fun lt!593058 () Unit!43828)

(assert (=> b!1337167 (= e!761637 lt!593058)))

(declare-fun lt!593066 () ListLongMap!21585)

(assert (=> b!1337167 (= lt!593066 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593067 () (_ BitVec 64))

(assert (=> b!1337167 (= lt!593067 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593068 () (_ BitVec 64))

(assert (=> b!1337167 (= lt!593068 (select (arr!43843 _keys!1590) from!1980))))

(declare-fun lt!593054 () Unit!43828)

(declare-fun addStillContains!1191 (ListLongMap!21585 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43828)

(assert (=> b!1337167 (= lt!593054 (addStillContains!1191 lt!593066 lt!593067 zeroValue!1262 lt!593068))))

(assert (=> b!1337167 (contains!8983 (+!4762 lt!593066 (tuple2!23921 lt!593067 zeroValue!1262)) lt!593068)))

(declare-fun lt!593065 () Unit!43828)

(assert (=> b!1337167 (= lt!593065 lt!593054)))

(declare-fun lt!593072 () ListLongMap!21585)

(assert (=> b!1337167 (= lt!593072 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593059 () (_ BitVec 64))

(assert (=> b!1337167 (= lt!593059 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593057 () (_ BitVec 64))

(assert (=> b!1337167 (= lt!593057 (select (arr!43843 _keys!1590) from!1980))))

(declare-fun lt!593063 () Unit!43828)

(declare-fun addApplyDifferent!570 (ListLongMap!21585 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43828)

(assert (=> b!1337167 (= lt!593063 (addApplyDifferent!570 lt!593072 lt!593059 minValue!1262 lt!593057))))

(assert (=> b!1337167 (= (apply!1041 (+!4762 lt!593072 (tuple2!23921 lt!593059 minValue!1262)) lt!593057) (apply!1041 lt!593072 lt!593057))))

(declare-fun lt!593075 () Unit!43828)

(assert (=> b!1337167 (= lt!593075 lt!593063)))

(declare-fun lt!593062 () ListLongMap!21585)

(assert (=> b!1337167 (= lt!593062 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593069 () (_ BitVec 64))

(assert (=> b!1337167 (= lt!593069 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593055 () (_ BitVec 64))

(assert (=> b!1337167 (= lt!593055 (select (arr!43843 _keys!1590) from!1980))))

(declare-fun lt!593074 () Unit!43828)

(assert (=> b!1337167 (= lt!593074 (addApplyDifferent!570 lt!593062 lt!593069 zeroValue!1262 lt!593055))))

(assert (=> b!1337167 (= (apply!1041 (+!4762 lt!593062 (tuple2!23921 lt!593069 zeroValue!1262)) lt!593055) (apply!1041 lt!593062 lt!593055))))

(declare-fun lt!593071 () Unit!43828)

(assert (=> b!1337167 (= lt!593071 lt!593074)))

(declare-fun lt!593060 () ListLongMap!21585)

(assert (=> b!1337167 (= lt!593060 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593073 () (_ BitVec 64))

(assert (=> b!1337167 (= lt!593073 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593056 () (_ BitVec 64))

(assert (=> b!1337167 (= lt!593056 (select (arr!43843 _keys!1590) from!1980))))

(assert (=> b!1337167 (= lt!593058 (addApplyDifferent!570 lt!593060 lt!593073 minValue!1262 lt!593056))))

(assert (=> b!1337167 (= (apply!1041 (+!4762 lt!593060 (tuple2!23921 lt!593073 minValue!1262)) lt!593056) (apply!1041 lt!593060 lt!593056))))

(declare-fun bm!64910 () Bool)

(declare-fun call!64913 () ListLongMap!21585)

(assert (=> bm!64910 (= call!64913 call!64917)))

(declare-fun b!1337168 () Bool)

(assert (=> b!1337168 (= e!761631 e!761633)))

(declare-fun res!887094 () Bool)

(assert (=> b!1337168 (= res!887094 call!64914)))

(assert (=> b!1337168 (=> (not res!887094) (not e!761633))))

(declare-fun bm!64911 () Bool)

(declare-fun c!126338 () Bool)

(declare-fun call!64916 () ListLongMap!21585)

(assert (=> bm!64911 (= call!64916 (+!4762 (ite c!126339 call!64915 (ite c!126338 call!64917 call!64913)) (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1337169 () Bool)

(declare-fun call!64912 () Bool)

(assert (=> b!1337169 (= e!761638 (not call!64912))))

(declare-fun bm!64912 () Bool)

(assert (=> bm!64912 (= call!64915 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1337170 () Bool)

(assert (=> b!1337170 (= e!761635 (validKeyInArray!0 (select (arr!43843 _keys!1590) from!1980)))))

(declare-fun b!1337171 () Bool)

(declare-fun res!887096 () Bool)

(assert (=> b!1337171 (=> (not res!887096) (not e!761632))))

(declare-fun e!761630 () Bool)

(assert (=> b!1337171 (= res!887096 e!761630)))

(declare-fun res!887088 () Bool)

(assert (=> b!1337171 (=> res!887088 e!761630)))

(assert (=> b!1337171 (= res!887088 (not e!761629))))

(declare-fun res!887091 () Bool)

(assert (=> b!1337171 (=> (not res!887091) (not e!761629))))

(assert (=> b!1337171 (= res!887091 (bvslt from!1980 (size!44394 _keys!1590)))))

(declare-fun bm!64913 () Bool)

(assert (=> bm!64913 (= call!64912 (contains!8983 lt!593061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337172 () Bool)

(declare-fun Unit!43832 () Unit!43828)

(assert (=> b!1337172 (= e!761637 Unit!43832)))

(declare-fun b!1337173 () Bool)

(declare-fun e!761634 () Bool)

(assert (=> b!1337173 (= e!761638 e!761634)))

(declare-fun res!887089 () Bool)

(assert (=> b!1337173 (= res!887089 call!64912)))

(assert (=> b!1337173 (=> (not res!887089) (not e!761634))))

(declare-fun b!1337174 () Bool)

(assert (=> b!1337174 (= e!761632 e!761631)))

(declare-fun c!126337 () Bool)

(assert (=> b!1337174 (= c!126337 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337175 () Bool)

(assert (=> b!1337175 (= e!761634 (= (apply!1041 lt!593061 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1337176 () Bool)

(assert (=> b!1337176 (= e!761640 call!64913)))

(declare-fun b!1337177 () Bool)

(assert (=> b!1337177 (= e!761641 (+!4762 call!64916 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1337178 () Bool)

(assert (=> b!1337178 (= e!761630 e!761636)))

(declare-fun res!887093 () Bool)

(assert (=> b!1337178 (=> (not res!887093) (not e!761636))))

(assert (=> b!1337178 (= res!887093 (contains!8983 lt!593061 (select (arr!43843 _keys!1590) from!1980)))))

(assert (=> b!1337178 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44394 _keys!1590)))))

(declare-fun bm!64914 () Bool)

(assert (=> bm!64914 (= call!64911 call!64916)))

(declare-fun b!1337179 () Bool)

(declare-fun e!761639 () ListLongMap!21585)

(assert (=> b!1337179 (= e!761641 e!761639)))

(assert (=> b!1337179 (= c!126338 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337180 () Bool)

(declare-fun c!126340 () Bool)

(assert (=> b!1337180 (= c!126340 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1337180 (= e!761639 e!761640)))

(declare-fun b!1337181 () Bool)

(assert (=> b!1337181 (= e!761639 call!64911)))

(assert (= (and d!143989 c!126339) b!1337177))

(assert (= (and d!143989 (not c!126339)) b!1337179))

(assert (= (and b!1337179 c!126338) b!1337181))

(assert (= (and b!1337179 (not c!126338)) b!1337180))

(assert (= (and b!1337180 c!126340) b!1337163))

(assert (= (and b!1337180 (not c!126340)) b!1337176))

(assert (= (or b!1337163 b!1337176) bm!64910))

(assert (= (or b!1337181 bm!64910) bm!64909))

(assert (= (or b!1337181 b!1337163) bm!64914))

(assert (= (or b!1337177 bm!64909) bm!64912))

(assert (= (or b!1337177 bm!64914) bm!64911))

(assert (= (and d!143989 res!887095) b!1337170))

(assert (= (and d!143989 c!126342) b!1337167))

(assert (= (and d!143989 (not c!126342)) b!1337172))

(assert (= (and d!143989 res!887090) b!1337171))

(assert (= (and b!1337171 res!887091) b!1337161))

(assert (= (and b!1337171 (not res!887088)) b!1337178))

(assert (= (and b!1337178 res!887093) b!1337166))

(assert (= (and b!1337171 res!887096) b!1337164))

(assert (= (and b!1337164 c!126341) b!1337173))

(assert (= (and b!1337164 (not c!126341)) b!1337169))

(assert (= (and b!1337173 res!887089) b!1337175))

(assert (= (or b!1337173 b!1337169) bm!64913))

(assert (= (and b!1337164 res!887092) b!1337174))

(assert (= (and b!1337174 c!126337) b!1337168))

(assert (= (and b!1337174 (not c!126337)) b!1337165))

(assert (= (and b!1337168 res!887094) b!1337162))

(assert (= (or b!1337168 b!1337165) bm!64908))

(declare-fun b_lambda!24119 () Bool)

(assert (=> (not b_lambda!24119) (not b!1337166)))

(assert (=> b!1337166 t!45324))

(declare-fun b_and!49911 () Bool)

(assert (= b_and!49909 (and (=> t!45324 result!25201) b_and!49911)))

(declare-fun m!1225407 () Bool)

(assert (=> bm!64913 m!1225407))

(declare-fun m!1225409 () Bool)

(assert (=> b!1337175 m!1225409))

(declare-fun m!1225411 () Bool)

(assert (=> bm!64912 m!1225411))

(declare-fun m!1225413 () Bool)

(assert (=> b!1337162 m!1225413))

(declare-fun m!1225415 () Bool)

(assert (=> bm!64908 m!1225415))

(assert (=> b!1337170 m!1225229))

(assert (=> b!1337170 m!1225229))

(assert (=> b!1337170 m!1225235))

(declare-fun m!1225417 () Bool)

(assert (=> b!1337177 m!1225417))

(declare-fun m!1225419 () Bool)

(assert (=> bm!64911 m!1225419))

(assert (=> b!1337161 m!1225229))

(assert (=> b!1337161 m!1225229))

(assert (=> b!1337161 m!1225235))

(assert (=> b!1337178 m!1225229))

(assert (=> b!1337178 m!1225229))

(declare-fun m!1225421 () Bool)

(assert (=> b!1337178 m!1225421))

(assert (=> d!143989 m!1225245))

(assert (=> b!1337167 m!1225229))

(declare-fun m!1225423 () Bool)

(assert (=> b!1337167 m!1225423))

(declare-fun m!1225425 () Bool)

(assert (=> b!1337167 m!1225425))

(assert (=> b!1337167 m!1225411))

(declare-fun m!1225427 () Bool)

(assert (=> b!1337167 m!1225427))

(declare-fun m!1225429 () Bool)

(assert (=> b!1337167 m!1225429))

(declare-fun m!1225431 () Bool)

(assert (=> b!1337167 m!1225431))

(declare-fun m!1225433 () Bool)

(assert (=> b!1337167 m!1225433))

(assert (=> b!1337167 m!1225427))

(declare-fun m!1225435 () Bool)

(assert (=> b!1337167 m!1225435))

(declare-fun m!1225437 () Bool)

(assert (=> b!1337167 m!1225437))

(declare-fun m!1225439 () Bool)

(assert (=> b!1337167 m!1225439))

(declare-fun m!1225441 () Bool)

(assert (=> b!1337167 m!1225441))

(assert (=> b!1337167 m!1225431))

(declare-fun m!1225443 () Bool)

(assert (=> b!1337167 m!1225443))

(declare-fun m!1225445 () Bool)

(assert (=> b!1337167 m!1225445))

(declare-fun m!1225447 () Bool)

(assert (=> b!1337167 m!1225447))

(assert (=> b!1337167 m!1225423))

(declare-fun m!1225449 () Bool)

(assert (=> b!1337167 m!1225449))

(declare-fun m!1225451 () Bool)

(assert (=> b!1337167 m!1225451))

(assert (=> b!1337167 m!1225435))

(assert (=> b!1337166 m!1225229))

(assert (=> b!1337166 m!1225221))

(assert (=> b!1337166 m!1225221))

(assert (=> b!1337166 m!1225223))

(assert (=> b!1337166 m!1225225))

(assert (=> b!1337166 m!1225223))

(assert (=> b!1337166 m!1225229))

(declare-fun m!1225453 () Bool)

(assert (=> b!1337166 m!1225453))

(assert (=> b!1336947 d!143989))

(declare-fun condMapEmpty!57025 () Bool)

(declare-fun mapDefault!57025 () ValueCell!17549)

(assert (=> mapNonEmpty!57016 (= condMapEmpty!57025 (= mapRest!57016 ((as const (Array (_ BitVec 32) ValueCell!17549)) mapDefault!57025)))))

(declare-fun e!761646 () Bool)

(declare-fun mapRes!57025 () Bool)

(assert (=> mapNonEmpty!57016 (= tp!108591 (and e!761646 mapRes!57025))))

(declare-fun mapIsEmpty!57025 () Bool)

(assert (=> mapIsEmpty!57025 mapRes!57025))

(declare-fun b!1337188 () Bool)

(declare-fun e!761647 () Bool)

(assert (=> b!1337188 (= e!761647 tp_is_empty!36895)))

(declare-fun b!1337189 () Bool)

(assert (=> b!1337189 (= e!761646 tp_is_empty!36895)))

(declare-fun mapNonEmpty!57025 () Bool)

(declare-fun tp!108607 () Bool)

(assert (=> mapNonEmpty!57025 (= mapRes!57025 (and tp!108607 e!761647))))

(declare-fun mapKey!57025 () (_ BitVec 32))

(declare-fun mapRest!57025 () (Array (_ BitVec 32) ValueCell!17549))

(declare-fun mapValue!57025 () ValueCell!17549)

(assert (=> mapNonEmpty!57025 (= mapRest!57016 (store mapRest!57025 mapKey!57025 mapValue!57025))))

(assert (= (and mapNonEmpty!57016 condMapEmpty!57025) mapIsEmpty!57025))

(assert (= (and mapNonEmpty!57016 (not condMapEmpty!57025)) mapNonEmpty!57025))

(assert (= (and mapNonEmpty!57025 ((_ is ValueCellFull!17549) mapValue!57025)) b!1337188))

(assert (= (and mapNonEmpty!57016 ((_ is ValueCellFull!17549) mapDefault!57025)) b!1337189))

(declare-fun m!1225455 () Bool)

(assert (=> mapNonEmpty!57025 m!1225455))

(declare-fun b_lambda!24121 () Bool)

(assert (= b_lambda!24117 (or (and start!112814 b_free!30985) b_lambda!24121)))

(declare-fun b_lambda!24123 () Bool)

(assert (= b_lambda!24115 (or (and start!112814 b_free!30985) b_lambda!24123)))

(declare-fun b_lambda!24125 () Bool)

(assert (= b_lambda!24119 (or (and start!112814 b_free!30985) b_lambda!24125)))

(check-sat (not b!1337106) (not b!1337162) (not b!1337089) (not b!1337178) (not b!1337116) (not d!143989) (not b!1337093) (not b!1337100) (not bm!64890) (not d!143981) (not b!1337115) (not b!1337098) (not b!1337053) (not d!143985) (not b_lambda!24123) (not b!1337177) (not b!1337161) (not bm!64908) tp_is_empty!36895 (not b!1337094) (not bm!64912) (not b!1337062) (not b!1337166) (not bm!64893) (not b!1337056) (not b_lambda!24125) b_and!49911 (not b!1337167) (not b!1337090) (not bm!64911) (not b!1337105) (not d!143979) (not b_lambda!24121) (not b!1337064) (not b!1337041) (not b!1337175) (not b!1337052) (not mapNonEmpty!57025) (not b!1337096) (not d!143977) (not bm!64913) (not b!1337063) (not b!1337170) (not b!1337092) (not b_lambda!24113) (not b!1337113) (not b!1337061) (not b_next!30985) (not bm!64887) (not b!1337118) (not d!143987) (not b!1337038))
(check-sat b_and!49911 (not b_next!30985))
(get-model)

(declare-fun d!143991 () Bool)

(assert (=> d!143991 (= (get!22126 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337106 d!143991))

(declare-fun d!143993 () Bool)

(declare-fun isEmpty!1086 (Option!762) Bool)

(assert (=> d!143993 (= (isDefined!520 (getValueByKey!711 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)) (not (isEmpty!1086 (getValueByKey!711 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38263 () Bool)

(assert (= bs!38263 d!143993))

(assert (=> bs!38263 m!1225403))

(declare-fun m!1225457 () Bool)

(assert (=> bs!38263 m!1225457))

(assert (=> b!1337118 d!143993))

(declare-fun c!126347 () Bool)

(declare-fun d!143995 () Bool)

(assert (=> d!143995 (= c!126347 (and ((_ is Cons!31063) (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!11971 (h!32281 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(declare-fun e!761652 () Option!762)

(assert (=> d!143995 (= (getValueByKey!711 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!761652)))

(declare-fun b!1337198 () Bool)

(assert (=> b!1337198 (= e!761652 (Some!761 (_2!11971 (h!32281 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))))

(declare-fun b!1337201 () Bool)

(declare-fun e!761653 () Option!762)

(assert (=> b!1337201 (= e!761653 None!760)))

(declare-fun b!1337200 () Bool)

(assert (=> b!1337200 (= e!761653 (getValueByKey!711 (t!45325 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(declare-fun b!1337199 () Bool)

(assert (=> b!1337199 (= e!761652 e!761653)))

(declare-fun c!126348 () Bool)

(assert (=> b!1337199 (= c!126348 (and ((_ is Cons!31063) (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (not (= (_1!11971 (h!32281 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153))))))

(assert (= (and d!143995 c!126347) b!1337198))

(assert (= (and d!143995 (not c!126347)) b!1337199))

(assert (= (and b!1337199 c!126348) b!1337200))

(assert (= (and b!1337199 (not c!126348)) b!1337201))

(declare-fun m!1225459 () Bool)

(assert (=> b!1337200 m!1225459))

(assert (=> b!1337118 d!143995))

(declare-fun d!143997 () Bool)

(declare-fun get!22127 (Option!762) V!54297)

(assert (=> d!143997 (= (apply!1041 (+!4762 lt!593072 (tuple2!23921 lt!593059 minValue!1262)) lt!593057) (get!22127 (getValueByKey!711 (toList!10808 (+!4762 lt!593072 (tuple2!23921 lt!593059 minValue!1262))) lt!593057)))))

(declare-fun bs!38264 () Bool)

(assert (= bs!38264 d!143997))

(declare-fun m!1225461 () Bool)

(assert (=> bs!38264 m!1225461))

(assert (=> bs!38264 m!1225461))

(declare-fun m!1225463 () Bool)

(assert (=> bs!38264 m!1225463))

(assert (=> b!1337167 d!143997))

(declare-fun d!143999 () Bool)

(declare-fun e!761654 () Bool)

(assert (=> d!143999 e!761654))

(declare-fun res!887098 () Bool)

(assert (=> d!143999 (=> (not res!887098) (not e!761654))))

(declare-fun lt!593077 () ListLongMap!21585)

(assert (=> d!143999 (= res!887098 (contains!8983 lt!593077 (_1!11971 (tuple2!23921 lt!593069 zeroValue!1262))))))

(declare-fun lt!593076 () List!31067)

(assert (=> d!143999 (= lt!593077 (ListLongMap!21586 lt!593076))))

(declare-fun lt!593079 () Unit!43828)

(declare-fun lt!593078 () Unit!43828)

(assert (=> d!143999 (= lt!593079 lt!593078)))

(assert (=> d!143999 (= (getValueByKey!711 lt!593076 (_1!11971 (tuple2!23921 lt!593069 zeroValue!1262))) (Some!761 (_2!11971 (tuple2!23921 lt!593069 zeroValue!1262))))))

(assert (=> d!143999 (= lt!593078 (lemmaContainsTupThenGetReturnValue!361 lt!593076 (_1!11971 (tuple2!23921 lt!593069 zeroValue!1262)) (_2!11971 (tuple2!23921 lt!593069 zeroValue!1262))))))

(assert (=> d!143999 (= lt!593076 (insertStrictlySorted!490 (toList!10808 lt!593062) (_1!11971 (tuple2!23921 lt!593069 zeroValue!1262)) (_2!11971 (tuple2!23921 lt!593069 zeroValue!1262))))))

(assert (=> d!143999 (= (+!4762 lt!593062 (tuple2!23921 lt!593069 zeroValue!1262)) lt!593077)))

(declare-fun b!1337202 () Bool)

(declare-fun res!887097 () Bool)

(assert (=> b!1337202 (=> (not res!887097) (not e!761654))))

(assert (=> b!1337202 (= res!887097 (= (getValueByKey!711 (toList!10808 lt!593077) (_1!11971 (tuple2!23921 lt!593069 zeroValue!1262))) (Some!761 (_2!11971 (tuple2!23921 lt!593069 zeroValue!1262)))))))

(declare-fun b!1337203 () Bool)

(assert (=> b!1337203 (= e!761654 (contains!8987 (toList!10808 lt!593077) (tuple2!23921 lt!593069 zeroValue!1262)))))

(assert (= (and d!143999 res!887098) b!1337202))

(assert (= (and b!1337202 res!887097) b!1337203))

(declare-fun m!1225465 () Bool)

(assert (=> d!143999 m!1225465))

(declare-fun m!1225467 () Bool)

(assert (=> d!143999 m!1225467))

(declare-fun m!1225469 () Bool)

(assert (=> d!143999 m!1225469))

(declare-fun m!1225471 () Bool)

(assert (=> d!143999 m!1225471))

(declare-fun m!1225473 () Bool)

(assert (=> b!1337202 m!1225473))

(declare-fun m!1225475 () Bool)

(assert (=> b!1337203 m!1225475))

(assert (=> b!1337167 d!143999))

(declare-fun d!144001 () Bool)

(assert (=> d!144001 (= (apply!1041 (+!4762 lt!593060 (tuple2!23921 lt!593073 minValue!1262)) lt!593056) (apply!1041 lt!593060 lt!593056))))

(declare-fun lt!593082 () Unit!43828)

(declare-fun choose!1958 (ListLongMap!21585 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43828)

(assert (=> d!144001 (= lt!593082 (choose!1958 lt!593060 lt!593073 minValue!1262 lt!593056))))

(declare-fun e!761657 () Bool)

(assert (=> d!144001 e!761657))

(declare-fun res!887101 () Bool)

(assert (=> d!144001 (=> (not res!887101) (not e!761657))))

(assert (=> d!144001 (= res!887101 (contains!8983 lt!593060 lt!593056))))

(assert (=> d!144001 (= (addApplyDifferent!570 lt!593060 lt!593073 minValue!1262 lt!593056) lt!593082)))

(declare-fun b!1337207 () Bool)

(assert (=> b!1337207 (= e!761657 (not (= lt!593056 lt!593073)))))

(assert (= (and d!144001 res!887101) b!1337207))

(declare-fun m!1225477 () Bool)

(assert (=> d!144001 m!1225477))

(declare-fun m!1225479 () Bool)

(assert (=> d!144001 m!1225479))

(assert (=> d!144001 m!1225435))

(assert (=> d!144001 m!1225437))

(assert (=> d!144001 m!1225451))

(assert (=> d!144001 m!1225435))

(assert (=> b!1337167 d!144001))

(declare-fun d!144003 () Bool)

(assert (=> d!144003 (= (apply!1041 (+!4762 lt!593072 (tuple2!23921 lt!593059 minValue!1262)) lt!593057) (apply!1041 lt!593072 lt!593057))))

(declare-fun lt!593083 () Unit!43828)

(assert (=> d!144003 (= lt!593083 (choose!1958 lt!593072 lt!593059 minValue!1262 lt!593057))))

(declare-fun e!761658 () Bool)

(assert (=> d!144003 e!761658))

(declare-fun res!887102 () Bool)

(assert (=> d!144003 (=> (not res!887102) (not e!761658))))

(assert (=> d!144003 (= res!887102 (contains!8983 lt!593072 lt!593057))))

(assert (=> d!144003 (= (addApplyDifferent!570 lt!593072 lt!593059 minValue!1262 lt!593057) lt!593083)))

(declare-fun b!1337208 () Bool)

(assert (=> b!1337208 (= e!761658 (not (= lt!593057 lt!593059)))))

(assert (= (and d!144003 res!887102) b!1337208))

(declare-fun m!1225481 () Bool)

(assert (=> d!144003 m!1225481))

(declare-fun m!1225483 () Bool)

(assert (=> d!144003 m!1225483))

(assert (=> d!144003 m!1225427))

(assert (=> d!144003 m!1225429))

(assert (=> d!144003 m!1225441))

(assert (=> d!144003 m!1225427))

(assert (=> b!1337167 d!144003))

(declare-fun d!144005 () Bool)

(declare-fun e!761660 () Bool)

(assert (=> d!144005 e!761660))

(declare-fun res!887103 () Bool)

(assert (=> d!144005 (=> res!887103 e!761660)))

(declare-fun lt!593086 () Bool)

(assert (=> d!144005 (= res!887103 (not lt!593086))))

(declare-fun lt!593084 () Bool)

(assert (=> d!144005 (= lt!593086 lt!593084)))

(declare-fun lt!593087 () Unit!43828)

(declare-fun e!761659 () Unit!43828)

(assert (=> d!144005 (= lt!593087 e!761659)))

(declare-fun c!126349 () Bool)

(assert (=> d!144005 (= c!126349 lt!593084)))

(assert (=> d!144005 (= lt!593084 (containsKey!737 (toList!10808 (+!4762 lt!593066 (tuple2!23921 lt!593067 zeroValue!1262))) lt!593068))))

(assert (=> d!144005 (= (contains!8983 (+!4762 lt!593066 (tuple2!23921 lt!593067 zeroValue!1262)) lt!593068) lt!593086)))

(declare-fun b!1337209 () Bool)

(declare-fun lt!593085 () Unit!43828)

(assert (=> b!1337209 (= e!761659 lt!593085)))

(assert (=> b!1337209 (= lt!593085 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 (+!4762 lt!593066 (tuple2!23921 lt!593067 zeroValue!1262))) lt!593068))))

(assert (=> b!1337209 (isDefined!520 (getValueByKey!711 (toList!10808 (+!4762 lt!593066 (tuple2!23921 lt!593067 zeroValue!1262))) lt!593068))))

(declare-fun b!1337210 () Bool)

(declare-fun Unit!43833 () Unit!43828)

(assert (=> b!1337210 (= e!761659 Unit!43833)))

(declare-fun b!1337211 () Bool)

(assert (=> b!1337211 (= e!761660 (isDefined!520 (getValueByKey!711 (toList!10808 (+!4762 lt!593066 (tuple2!23921 lt!593067 zeroValue!1262))) lt!593068)))))

(assert (= (and d!144005 c!126349) b!1337209))

(assert (= (and d!144005 (not c!126349)) b!1337210))

(assert (= (and d!144005 (not res!887103)) b!1337211))

(declare-fun m!1225485 () Bool)

(assert (=> d!144005 m!1225485))

(declare-fun m!1225487 () Bool)

(assert (=> b!1337209 m!1225487))

(declare-fun m!1225489 () Bool)

(assert (=> b!1337209 m!1225489))

(assert (=> b!1337209 m!1225489))

(declare-fun m!1225491 () Bool)

(assert (=> b!1337209 m!1225491))

(assert (=> b!1337211 m!1225489))

(assert (=> b!1337211 m!1225489))

(assert (=> b!1337211 m!1225491))

(assert (=> b!1337167 d!144005))

(declare-fun d!144007 () Bool)

(assert (=> d!144007 (= (apply!1041 (+!4762 lt!593062 (tuple2!23921 lt!593069 zeroValue!1262)) lt!593055) (apply!1041 lt!593062 lt!593055))))

(declare-fun lt!593088 () Unit!43828)

(assert (=> d!144007 (= lt!593088 (choose!1958 lt!593062 lt!593069 zeroValue!1262 lt!593055))))

(declare-fun e!761661 () Bool)

(assert (=> d!144007 e!761661))

(declare-fun res!887104 () Bool)

(assert (=> d!144007 (=> (not res!887104) (not e!761661))))

(assert (=> d!144007 (= res!887104 (contains!8983 lt!593062 lt!593055))))

(assert (=> d!144007 (= (addApplyDifferent!570 lt!593062 lt!593069 zeroValue!1262 lt!593055) lt!593088)))

(declare-fun b!1337212 () Bool)

(assert (=> b!1337212 (= e!761661 (not (= lt!593055 lt!593069)))))

(assert (= (and d!144007 res!887104) b!1337212))

(declare-fun m!1225493 () Bool)

(assert (=> d!144007 m!1225493))

(declare-fun m!1225495 () Bool)

(assert (=> d!144007 m!1225495))

(assert (=> d!144007 m!1225423))

(assert (=> d!144007 m!1225449))

(assert (=> d!144007 m!1225433))

(assert (=> d!144007 m!1225423))

(assert (=> b!1337167 d!144007))

(declare-fun d!144009 () Bool)

(declare-fun e!761662 () Bool)

(assert (=> d!144009 e!761662))

(declare-fun res!887106 () Bool)

(assert (=> d!144009 (=> (not res!887106) (not e!761662))))

(declare-fun lt!593090 () ListLongMap!21585)

(assert (=> d!144009 (= res!887106 (contains!8983 lt!593090 (_1!11971 (tuple2!23921 lt!593059 minValue!1262))))))

(declare-fun lt!593089 () List!31067)

(assert (=> d!144009 (= lt!593090 (ListLongMap!21586 lt!593089))))

(declare-fun lt!593092 () Unit!43828)

(declare-fun lt!593091 () Unit!43828)

(assert (=> d!144009 (= lt!593092 lt!593091)))

(assert (=> d!144009 (= (getValueByKey!711 lt!593089 (_1!11971 (tuple2!23921 lt!593059 minValue!1262))) (Some!761 (_2!11971 (tuple2!23921 lt!593059 minValue!1262))))))

(assert (=> d!144009 (= lt!593091 (lemmaContainsTupThenGetReturnValue!361 lt!593089 (_1!11971 (tuple2!23921 lt!593059 minValue!1262)) (_2!11971 (tuple2!23921 lt!593059 minValue!1262))))))

(assert (=> d!144009 (= lt!593089 (insertStrictlySorted!490 (toList!10808 lt!593072) (_1!11971 (tuple2!23921 lt!593059 minValue!1262)) (_2!11971 (tuple2!23921 lt!593059 minValue!1262))))))

(assert (=> d!144009 (= (+!4762 lt!593072 (tuple2!23921 lt!593059 minValue!1262)) lt!593090)))

(declare-fun b!1337213 () Bool)

(declare-fun res!887105 () Bool)

(assert (=> b!1337213 (=> (not res!887105) (not e!761662))))

(assert (=> b!1337213 (= res!887105 (= (getValueByKey!711 (toList!10808 lt!593090) (_1!11971 (tuple2!23921 lt!593059 minValue!1262))) (Some!761 (_2!11971 (tuple2!23921 lt!593059 minValue!1262)))))))

(declare-fun b!1337214 () Bool)

(assert (=> b!1337214 (= e!761662 (contains!8987 (toList!10808 lt!593090) (tuple2!23921 lt!593059 minValue!1262)))))

(assert (= (and d!144009 res!887106) b!1337213))

(assert (= (and b!1337213 res!887105) b!1337214))

(declare-fun m!1225497 () Bool)

(assert (=> d!144009 m!1225497))

(declare-fun m!1225499 () Bool)

(assert (=> d!144009 m!1225499))

(declare-fun m!1225501 () Bool)

(assert (=> d!144009 m!1225501))

(declare-fun m!1225503 () Bool)

(assert (=> d!144009 m!1225503))

(declare-fun m!1225505 () Bool)

(assert (=> b!1337213 m!1225505))

(declare-fun m!1225507 () Bool)

(assert (=> b!1337214 m!1225507))

(assert (=> b!1337167 d!144009))

(declare-fun d!144011 () Bool)

(assert (=> d!144011 (= (apply!1041 (+!4762 lt!593062 (tuple2!23921 lt!593069 zeroValue!1262)) lt!593055) (get!22127 (getValueByKey!711 (toList!10808 (+!4762 lt!593062 (tuple2!23921 lt!593069 zeroValue!1262))) lt!593055)))))

(declare-fun bs!38265 () Bool)

(assert (= bs!38265 d!144011))

(declare-fun m!1225509 () Bool)

(assert (=> bs!38265 m!1225509))

(assert (=> bs!38265 m!1225509))

(declare-fun m!1225511 () Bool)

(assert (=> bs!38265 m!1225511))

(assert (=> b!1337167 d!144011))

(declare-fun d!144013 () Bool)

(declare-fun e!761663 () Bool)

(assert (=> d!144013 e!761663))

(declare-fun res!887108 () Bool)

(assert (=> d!144013 (=> (not res!887108) (not e!761663))))

(declare-fun lt!593094 () ListLongMap!21585)

(assert (=> d!144013 (= res!887108 (contains!8983 lt!593094 (_1!11971 (tuple2!23921 lt!593073 minValue!1262))))))

(declare-fun lt!593093 () List!31067)

(assert (=> d!144013 (= lt!593094 (ListLongMap!21586 lt!593093))))

(declare-fun lt!593096 () Unit!43828)

(declare-fun lt!593095 () Unit!43828)

(assert (=> d!144013 (= lt!593096 lt!593095)))

(assert (=> d!144013 (= (getValueByKey!711 lt!593093 (_1!11971 (tuple2!23921 lt!593073 minValue!1262))) (Some!761 (_2!11971 (tuple2!23921 lt!593073 minValue!1262))))))

(assert (=> d!144013 (= lt!593095 (lemmaContainsTupThenGetReturnValue!361 lt!593093 (_1!11971 (tuple2!23921 lt!593073 minValue!1262)) (_2!11971 (tuple2!23921 lt!593073 minValue!1262))))))

(assert (=> d!144013 (= lt!593093 (insertStrictlySorted!490 (toList!10808 lt!593060) (_1!11971 (tuple2!23921 lt!593073 minValue!1262)) (_2!11971 (tuple2!23921 lt!593073 minValue!1262))))))

(assert (=> d!144013 (= (+!4762 lt!593060 (tuple2!23921 lt!593073 minValue!1262)) lt!593094)))

(declare-fun b!1337215 () Bool)

(declare-fun res!887107 () Bool)

(assert (=> b!1337215 (=> (not res!887107) (not e!761663))))

(assert (=> b!1337215 (= res!887107 (= (getValueByKey!711 (toList!10808 lt!593094) (_1!11971 (tuple2!23921 lt!593073 minValue!1262))) (Some!761 (_2!11971 (tuple2!23921 lt!593073 minValue!1262)))))))

(declare-fun b!1337216 () Bool)

(assert (=> b!1337216 (= e!761663 (contains!8987 (toList!10808 lt!593094) (tuple2!23921 lt!593073 minValue!1262)))))

(assert (= (and d!144013 res!887108) b!1337215))

(assert (= (and b!1337215 res!887107) b!1337216))

(declare-fun m!1225513 () Bool)

(assert (=> d!144013 m!1225513))

(declare-fun m!1225515 () Bool)

(assert (=> d!144013 m!1225515))

(declare-fun m!1225517 () Bool)

(assert (=> d!144013 m!1225517))

(declare-fun m!1225519 () Bool)

(assert (=> d!144013 m!1225519))

(declare-fun m!1225521 () Bool)

(assert (=> b!1337215 m!1225521))

(declare-fun m!1225523 () Bool)

(assert (=> b!1337216 m!1225523))

(assert (=> b!1337167 d!144013))

(declare-fun d!144015 () Bool)

(assert (=> d!144015 (= (apply!1041 lt!593062 lt!593055) (get!22127 (getValueByKey!711 (toList!10808 lt!593062) lt!593055)))))

(declare-fun bs!38266 () Bool)

(assert (= bs!38266 d!144015))

(declare-fun m!1225525 () Bool)

(assert (=> bs!38266 m!1225525))

(assert (=> bs!38266 m!1225525))

(declare-fun m!1225527 () Bool)

(assert (=> bs!38266 m!1225527))

(assert (=> b!1337167 d!144015))

(declare-fun d!144017 () Bool)

(assert (=> d!144017 (= (apply!1041 lt!593060 lt!593056) (get!22127 (getValueByKey!711 (toList!10808 lt!593060) lt!593056)))))

(declare-fun bs!38267 () Bool)

(assert (= bs!38267 d!144017))

(declare-fun m!1225529 () Bool)

(assert (=> bs!38267 m!1225529))

(assert (=> bs!38267 m!1225529))

(declare-fun m!1225531 () Bool)

(assert (=> bs!38267 m!1225531))

(assert (=> b!1337167 d!144017))

(declare-fun lt!593103 () ListLongMap!21585)

(declare-fun e!761668 () Bool)

(declare-fun b!1337217 () Bool)

(assert (=> b!1337217 (= e!761668 (= lt!593103 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1337218 () Bool)

(declare-fun res!887112 () Bool)

(declare-fun e!761667 () Bool)

(assert (=> b!1337218 (=> (not res!887112) (not e!761667))))

(assert (=> b!1337218 (= res!887112 (not (contains!8983 lt!593103 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337219 () Bool)

(declare-fun e!761664 () Bool)

(assert (=> b!1337219 (= e!761667 e!761664)))

(declare-fun c!126350 () Bool)

(declare-fun e!761666 () Bool)

(assert (=> b!1337219 (= c!126350 e!761666)))

(declare-fun res!887109 () Bool)

(assert (=> b!1337219 (=> (not res!887109) (not e!761666))))

(assert (=> b!1337219 (= res!887109 (bvslt from!1980 (size!44394 _keys!1590)))))

(declare-fun b!1337220 () Bool)

(declare-fun lt!593102 () Unit!43828)

(declare-fun lt!593100 () Unit!43828)

(assert (=> b!1337220 (= lt!593102 lt!593100)))

(declare-fun lt!593098 () V!54297)

(declare-fun lt!593101 () (_ BitVec 64))

(declare-fun lt!593099 () ListLongMap!21585)

(declare-fun lt!593097 () (_ BitVec 64))

(assert (=> b!1337220 (not (contains!8983 (+!4762 lt!593099 (tuple2!23921 lt!593101 lt!593098)) lt!593097))))

(assert (=> b!1337220 (= lt!593100 (addStillNotContains!497 lt!593099 lt!593101 lt!593098 lt!593097))))

(assert (=> b!1337220 (= lt!593097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1337220 (= lt!593098 (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1337220 (= lt!593101 (select (arr!43843 _keys!1590) from!1980))))

(declare-fun call!64918 () ListLongMap!21585)

(assert (=> b!1337220 (= lt!593099 call!64918)))

(declare-fun e!761670 () ListLongMap!21585)

(assert (=> b!1337220 (= e!761670 (+!4762 call!64918 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337221 () Bool)

(assert (=> b!1337221 (= e!761668 (isEmpty!1085 lt!593103))))

(declare-fun b!1337222 () Bool)

(assert (=> b!1337222 (= e!761666 (validKeyInArray!0 (select (arr!43843 _keys!1590) from!1980)))))

(assert (=> b!1337222 (bvsge from!1980 #b00000000000000000000000000000000)))

(declare-fun b!1337223 () Bool)

(assert (=> b!1337223 (= e!761664 e!761668)))

(declare-fun c!126352 () Bool)

(assert (=> b!1337223 (= c!126352 (bvslt from!1980 (size!44394 _keys!1590)))))

(declare-fun b!1337224 () Bool)

(assert (=> b!1337224 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44394 _keys!1590)))))

(assert (=> b!1337224 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44393 _values!1320)))))

(declare-fun e!761669 () Bool)

(assert (=> b!1337224 (= e!761669 (= (apply!1041 lt!593103 (select (arr!43843 _keys!1590) from!1980)) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!64915 () Bool)

(assert (=> bm!64915 (= call!64918 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1337225 () Bool)

(assert (=> b!1337225 (= e!761670 call!64918)))

(declare-fun b!1337226 () Bool)

(declare-fun e!761665 () ListLongMap!21585)

(assert (=> b!1337226 (= e!761665 e!761670)))

(declare-fun c!126353 () Bool)

(assert (=> b!1337226 (= c!126353 (validKeyInArray!0 (select (arr!43843 _keys!1590) from!1980)))))

(declare-fun d!144019 () Bool)

(assert (=> d!144019 e!761667))

(declare-fun res!887110 () Bool)

(assert (=> d!144019 (=> (not res!887110) (not e!761667))))

(assert (=> d!144019 (= res!887110 (not (contains!8983 lt!593103 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144019 (= lt!593103 e!761665)))

(declare-fun c!126351 () Bool)

(assert (=> d!144019 (= c!126351 (bvsge from!1980 (size!44394 _keys!1590)))))

(assert (=> d!144019 (validMask!0 mask!1998)))

(assert (=> d!144019 (= (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593103)))

(declare-fun b!1337227 () Bool)

(assert (=> b!1337227 (= e!761665 (ListLongMap!21586 Nil!31064))))

(declare-fun b!1337228 () Bool)

(assert (=> b!1337228 (= e!761664 e!761669)))

(assert (=> b!1337228 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44394 _keys!1590)))))

(declare-fun res!887111 () Bool)

(assert (=> b!1337228 (= res!887111 (contains!8983 lt!593103 (select (arr!43843 _keys!1590) from!1980)))))

(assert (=> b!1337228 (=> (not res!887111) (not e!761669))))

(assert (= (and d!144019 c!126351) b!1337227))

(assert (= (and d!144019 (not c!126351)) b!1337226))

(assert (= (and b!1337226 c!126353) b!1337220))

(assert (= (and b!1337226 (not c!126353)) b!1337225))

(assert (= (or b!1337220 b!1337225) bm!64915))

(assert (= (and d!144019 res!887110) b!1337218))

(assert (= (and b!1337218 res!887112) b!1337219))

(assert (= (and b!1337219 res!887109) b!1337222))

(assert (= (and b!1337219 c!126350) b!1337228))

(assert (= (and b!1337219 (not c!126350)) b!1337223))

(assert (= (and b!1337228 res!887111) b!1337224))

(assert (= (and b!1337223 c!126352) b!1337217))

(assert (= (and b!1337223 (not c!126352)) b!1337221))

(declare-fun b_lambda!24127 () Bool)

(assert (=> (not b_lambda!24127) (not b!1337220)))

(assert (=> b!1337220 t!45324))

(declare-fun b_and!49913 () Bool)

(assert (= b_and!49911 (and (=> t!45324 result!25201) b_and!49913)))

(declare-fun b_lambda!24129 () Bool)

(assert (=> (not b_lambda!24129) (not b!1337224)))

(assert (=> b!1337224 t!45324))

(declare-fun b_and!49915 () Bool)

(assert (= b_and!49913 (and (=> t!45324 result!25201) b_and!49915)))

(declare-fun m!1225533 () Bool)

(assert (=> b!1337218 m!1225533))

(assert (=> b!1337224 m!1225223))

(assert (=> b!1337224 m!1225229))

(declare-fun m!1225535 () Bool)

(assert (=> b!1337224 m!1225535))

(assert (=> b!1337224 m!1225221))

(assert (=> b!1337224 m!1225223))

(assert (=> b!1337224 m!1225225))

(assert (=> b!1337224 m!1225221))

(assert (=> b!1337224 m!1225229))

(declare-fun m!1225537 () Bool)

(assert (=> bm!64915 m!1225537))

(assert (=> b!1337217 m!1225537))

(assert (=> b!1337222 m!1225229))

(assert (=> b!1337222 m!1225229))

(assert (=> b!1337222 m!1225235))

(assert (=> b!1337228 m!1225229))

(assert (=> b!1337228 m!1225229))

(declare-fun m!1225539 () Bool)

(assert (=> b!1337228 m!1225539))

(assert (=> b!1337226 m!1225229))

(assert (=> b!1337226 m!1225229))

(assert (=> b!1337226 m!1225235))

(declare-fun m!1225541 () Bool)

(assert (=> d!144019 m!1225541))

(assert (=> d!144019 m!1225245))

(assert (=> b!1337220 m!1225223))

(declare-fun m!1225543 () Bool)

(assert (=> b!1337220 m!1225543))

(declare-fun m!1225545 () Bool)

(assert (=> b!1337220 m!1225545))

(assert (=> b!1337220 m!1225221))

(assert (=> b!1337220 m!1225223))

(assert (=> b!1337220 m!1225225))

(assert (=> b!1337220 m!1225221))

(assert (=> b!1337220 m!1225229))

(assert (=> b!1337220 m!1225543))

(declare-fun m!1225547 () Bool)

(assert (=> b!1337220 m!1225547))

(declare-fun m!1225549 () Bool)

(assert (=> b!1337220 m!1225549))

(declare-fun m!1225551 () Bool)

(assert (=> b!1337221 m!1225551))

(assert (=> b!1337167 d!144019))

(declare-fun d!144021 () Bool)

(assert (=> d!144021 (contains!8983 (+!4762 lt!593066 (tuple2!23921 lt!593067 zeroValue!1262)) lt!593068)))

(declare-fun lt!593106 () Unit!43828)

(declare-fun choose!1959 (ListLongMap!21585 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43828)

(assert (=> d!144021 (= lt!593106 (choose!1959 lt!593066 lt!593067 zeroValue!1262 lt!593068))))

(assert (=> d!144021 (contains!8983 lt!593066 lt!593068)))

(assert (=> d!144021 (= (addStillContains!1191 lt!593066 lt!593067 zeroValue!1262 lt!593068) lt!593106)))

(declare-fun bs!38268 () Bool)

(assert (= bs!38268 d!144021))

(assert (=> bs!38268 m!1225431))

(assert (=> bs!38268 m!1225431))

(assert (=> bs!38268 m!1225443))

(declare-fun m!1225553 () Bool)

(assert (=> bs!38268 m!1225553))

(declare-fun m!1225555 () Bool)

(assert (=> bs!38268 m!1225555))

(assert (=> b!1337167 d!144021))

(declare-fun d!144023 () Bool)

(declare-fun e!761671 () Bool)

(assert (=> d!144023 e!761671))

(declare-fun res!887114 () Bool)

(assert (=> d!144023 (=> (not res!887114) (not e!761671))))

(declare-fun lt!593108 () ListLongMap!21585)

(assert (=> d!144023 (= res!887114 (contains!8983 lt!593108 (_1!11971 (tuple2!23921 lt!593067 zeroValue!1262))))))

(declare-fun lt!593107 () List!31067)

(assert (=> d!144023 (= lt!593108 (ListLongMap!21586 lt!593107))))

(declare-fun lt!593110 () Unit!43828)

(declare-fun lt!593109 () Unit!43828)

(assert (=> d!144023 (= lt!593110 lt!593109)))

(assert (=> d!144023 (= (getValueByKey!711 lt!593107 (_1!11971 (tuple2!23921 lt!593067 zeroValue!1262))) (Some!761 (_2!11971 (tuple2!23921 lt!593067 zeroValue!1262))))))

(assert (=> d!144023 (= lt!593109 (lemmaContainsTupThenGetReturnValue!361 lt!593107 (_1!11971 (tuple2!23921 lt!593067 zeroValue!1262)) (_2!11971 (tuple2!23921 lt!593067 zeroValue!1262))))))

(assert (=> d!144023 (= lt!593107 (insertStrictlySorted!490 (toList!10808 lt!593066) (_1!11971 (tuple2!23921 lt!593067 zeroValue!1262)) (_2!11971 (tuple2!23921 lt!593067 zeroValue!1262))))))

(assert (=> d!144023 (= (+!4762 lt!593066 (tuple2!23921 lt!593067 zeroValue!1262)) lt!593108)))

(declare-fun b!1337230 () Bool)

(declare-fun res!887113 () Bool)

(assert (=> b!1337230 (=> (not res!887113) (not e!761671))))

(assert (=> b!1337230 (= res!887113 (= (getValueByKey!711 (toList!10808 lt!593108) (_1!11971 (tuple2!23921 lt!593067 zeroValue!1262))) (Some!761 (_2!11971 (tuple2!23921 lt!593067 zeroValue!1262)))))))

(declare-fun b!1337231 () Bool)

(assert (=> b!1337231 (= e!761671 (contains!8987 (toList!10808 lt!593108) (tuple2!23921 lt!593067 zeroValue!1262)))))

(assert (= (and d!144023 res!887114) b!1337230))

(assert (= (and b!1337230 res!887113) b!1337231))

(declare-fun m!1225557 () Bool)

(assert (=> d!144023 m!1225557))

(declare-fun m!1225559 () Bool)

(assert (=> d!144023 m!1225559))

(declare-fun m!1225561 () Bool)

(assert (=> d!144023 m!1225561))

(declare-fun m!1225563 () Bool)

(assert (=> d!144023 m!1225563))

(declare-fun m!1225565 () Bool)

(assert (=> b!1337230 m!1225565))

(declare-fun m!1225567 () Bool)

(assert (=> b!1337231 m!1225567))

(assert (=> b!1337167 d!144023))

(declare-fun d!144025 () Bool)

(assert (=> d!144025 (= (apply!1041 (+!4762 lt!593060 (tuple2!23921 lt!593073 minValue!1262)) lt!593056) (get!22127 (getValueByKey!711 (toList!10808 (+!4762 lt!593060 (tuple2!23921 lt!593073 minValue!1262))) lt!593056)))))

(declare-fun bs!38269 () Bool)

(assert (= bs!38269 d!144025))

(declare-fun m!1225569 () Bool)

(assert (=> bs!38269 m!1225569))

(assert (=> bs!38269 m!1225569))

(declare-fun m!1225571 () Bool)

(assert (=> bs!38269 m!1225571))

(assert (=> b!1337167 d!144025))

(declare-fun d!144027 () Bool)

(assert (=> d!144027 (= (apply!1041 lt!593072 lt!593057) (get!22127 (getValueByKey!711 (toList!10808 lt!593072) lt!593057)))))

(declare-fun bs!38270 () Bool)

(assert (= bs!38270 d!144027))

(declare-fun m!1225573 () Bool)

(assert (=> bs!38270 m!1225573))

(assert (=> bs!38270 m!1225573))

(declare-fun m!1225575 () Bool)

(assert (=> bs!38270 m!1225575))

(assert (=> b!1337167 d!144027))

(declare-fun d!144029 () Bool)

(assert (=> d!144029 (= (isDefined!520 (getValueByKey!711 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153)) (not (isEmpty!1086 (getValueByKey!711 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))))

(declare-fun bs!38271 () Bool)

(assert (= bs!38271 d!144029))

(assert (=> bs!38271 m!1225395))

(declare-fun m!1225577 () Bool)

(assert (=> bs!38271 m!1225577))

(assert (=> b!1337115 d!144029))

(declare-fun c!126354 () Bool)

(declare-fun d!144031 () Bool)

(assert (=> d!144031 (= c!126354 (and ((_ is Cons!31063) (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (= (_1!11971 (h!32281 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)))))

(declare-fun e!761672 () Option!762)

(assert (=> d!144031 (= (getValueByKey!711 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153) e!761672)))

(declare-fun b!1337232 () Bool)

(assert (=> b!1337232 (= e!761672 (Some!761 (_2!11971 (h!32281 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))))

(declare-fun b!1337235 () Bool)

(declare-fun e!761673 () Option!762)

(assert (=> b!1337235 (= e!761673 None!760)))

(declare-fun b!1337234 () Bool)

(assert (=> b!1337234 (= e!761673 (getValueByKey!711 (t!45325 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) k0!1153))))

(declare-fun b!1337233 () Bool)

(assert (=> b!1337233 (= e!761672 e!761673)))

(declare-fun c!126355 () Bool)

(assert (=> b!1337233 (= c!126355 (and ((_ is Cons!31063) (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (not (= (_1!11971 (h!32281 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153))))))

(assert (= (and d!144031 c!126354) b!1337232))

(assert (= (and d!144031 (not c!126354)) b!1337233))

(assert (= (and b!1337233 c!126355) b!1337234))

(assert (= (and b!1337233 (not c!126355)) b!1337235))

(declare-fun m!1225579 () Bool)

(assert (=> b!1337234 m!1225579))

(assert (=> b!1337115 d!144031))

(declare-fun d!144033 () Bool)

(declare-fun e!761675 () Bool)

(assert (=> d!144033 e!761675))

(declare-fun res!887115 () Bool)

(assert (=> d!144033 (=> res!887115 e!761675)))

(declare-fun lt!593113 () Bool)

(assert (=> d!144033 (= res!887115 (not lt!593113))))

(declare-fun lt!593111 () Bool)

(assert (=> d!144033 (= lt!593113 lt!593111)))

(declare-fun lt!593114 () Unit!43828)

(declare-fun e!761674 () Unit!43828)

(assert (=> d!144033 (= lt!593114 e!761674)))

(declare-fun c!126356 () Bool)

(assert (=> d!144033 (= c!126356 lt!593111)))

(assert (=> d!144033 (= lt!593111 (containsKey!737 (toList!10808 lt!592993) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144033 (= (contains!8983 lt!592993 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593113)))

(declare-fun b!1337236 () Bool)

(declare-fun lt!593112 () Unit!43828)

(assert (=> b!1337236 (= e!761674 lt!593112)))

(assert (=> b!1337236 (= lt!593112 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 lt!592993) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337236 (isDefined!520 (getValueByKey!711 (toList!10808 lt!592993) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337237 () Bool)

(declare-fun Unit!43834 () Unit!43828)

(assert (=> b!1337237 (= e!761674 Unit!43834)))

(declare-fun b!1337238 () Bool)

(assert (=> b!1337238 (= e!761675 (isDefined!520 (getValueByKey!711 (toList!10808 lt!592993) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144033 c!126356) b!1337236))

(assert (= (and d!144033 (not c!126356)) b!1337237))

(assert (= (and d!144033 (not res!887115)) b!1337238))

(declare-fun m!1225581 () Bool)

(assert (=> d!144033 m!1225581))

(declare-fun m!1225583 () Bool)

(assert (=> b!1337236 m!1225583))

(declare-fun m!1225585 () Bool)

(assert (=> b!1337236 m!1225585))

(assert (=> b!1337236 m!1225585))

(declare-fun m!1225587 () Bool)

(assert (=> b!1337236 m!1225587))

(assert (=> b!1337238 m!1225585))

(assert (=> b!1337238 m!1225585))

(assert (=> b!1337238 m!1225587))

(assert (=> b!1337090 d!144033))

(declare-fun d!144035 () Bool)

(assert (=> d!144035 (= (get!22125 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21154 (select (arr!43842 _values!1320) from!1980)))))

(assert (=> b!1337105 d!144035))

(declare-fun b!1337239 () Bool)

(declare-fun e!761680 () Bool)

(declare-fun lt!593121 () ListLongMap!21585)

(assert (=> b!1337239 (= e!761680 (= lt!593121 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1337240 () Bool)

(declare-fun res!887119 () Bool)

(declare-fun e!761679 () Bool)

(assert (=> b!1337240 (=> (not res!887119) (not e!761679))))

(assert (=> b!1337240 (= res!887119 (not (contains!8983 lt!593121 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337241 () Bool)

(declare-fun e!761676 () Bool)

(assert (=> b!1337241 (= e!761679 e!761676)))

(declare-fun c!126357 () Bool)

(declare-fun e!761678 () Bool)

(assert (=> b!1337241 (= c!126357 e!761678)))

(declare-fun res!887116 () Bool)

(assert (=> b!1337241 (=> (not res!887116) (not e!761678))))

(assert (=> b!1337241 (= res!887116 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44394 _keys!1590)))))

(declare-fun b!1337242 () Bool)

(declare-fun lt!593120 () Unit!43828)

(declare-fun lt!593118 () Unit!43828)

(assert (=> b!1337242 (= lt!593120 lt!593118)))

(declare-fun lt!593115 () (_ BitVec 64))

(declare-fun lt!593119 () (_ BitVec 64))

(declare-fun lt!593116 () V!54297)

(declare-fun lt!593117 () ListLongMap!21585)

(assert (=> b!1337242 (not (contains!8983 (+!4762 lt!593117 (tuple2!23921 lt!593119 lt!593116)) lt!593115))))

(assert (=> b!1337242 (= lt!593118 (addStillNotContains!497 lt!593117 lt!593119 lt!593116 lt!593115))))

(assert (=> b!1337242 (= lt!593115 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1337242 (= lt!593116 (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1337242 (= lt!593119 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)))))

(declare-fun call!64919 () ListLongMap!21585)

(assert (=> b!1337242 (= lt!593117 call!64919)))

(declare-fun e!761682 () ListLongMap!21585)

(assert (=> b!1337242 (= e!761682 (+!4762 call!64919 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337243 () Bool)

(assert (=> b!1337243 (= e!761680 (isEmpty!1085 lt!593121))))

(declare-fun b!1337244 () Bool)

(assert (=> b!1337244 (= e!761678 (validKeyInArray!0 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1337244 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1337245 () Bool)

(assert (=> b!1337245 (= e!761676 e!761680)))

(declare-fun c!126359 () Bool)

(assert (=> b!1337245 (= c!126359 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44394 _keys!1590)))))

(declare-fun b!1337246 () Bool)

(assert (=> b!1337246 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44394 _keys!1590)))))

(assert (=> b!1337246 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44393 _values!1320)))))

(declare-fun e!761681 () Bool)

(assert (=> b!1337246 (= e!761681 (= (apply!1041 lt!593121 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!64916 () Bool)

(assert (=> bm!64916 (= call!64919 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1337247 () Bool)

(assert (=> b!1337247 (= e!761682 call!64919)))

(declare-fun b!1337248 () Bool)

(declare-fun e!761677 () ListLongMap!21585)

(assert (=> b!1337248 (= e!761677 e!761682)))

(declare-fun c!126360 () Bool)

(assert (=> b!1337248 (= c!126360 (validKeyInArray!0 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(declare-fun d!144037 () Bool)

(assert (=> d!144037 e!761679))

(declare-fun res!887117 () Bool)

(assert (=> d!144037 (=> (not res!887117) (not e!761679))))

(assert (=> d!144037 (= res!887117 (not (contains!8983 lt!593121 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144037 (= lt!593121 e!761677)))

(declare-fun c!126358 () Bool)

(assert (=> d!144037 (= c!126358 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44394 _keys!1590)))))

(assert (=> d!144037 (validMask!0 mask!1998)))

(assert (=> d!144037 (= (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323) lt!593121)))

(declare-fun b!1337249 () Bool)

(assert (=> b!1337249 (= e!761677 (ListLongMap!21586 Nil!31064))))

(declare-fun b!1337250 () Bool)

(assert (=> b!1337250 (= e!761676 e!761681)))

(assert (=> b!1337250 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44394 _keys!1590)))))

(declare-fun res!887118 () Bool)

(assert (=> b!1337250 (= res!887118 (contains!8983 lt!593121 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1337250 (=> (not res!887118) (not e!761681))))

(assert (= (and d!144037 c!126358) b!1337249))

(assert (= (and d!144037 (not c!126358)) b!1337248))

(assert (= (and b!1337248 c!126360) b!1337242))

(assert (= (and b!1337248 (not c!126360)) b!1337247))

(assert (= (or b!1337242 b!1337247) bm!64916))

(assert (= (and d!144037 res!887117) b!1337240))

(assert (= (and b!1337240 res!887119) b!1337241))

(assert (= (and b!1337241 res!887116) b!1337244))

(assert (= (and b!1337241 c!126357) b!1337250))

(assert (= (and b!1337241 (not c!126357)) b!1337245))

(assert (= (and b!1337250 res!887118) b!1337246))

(assert (= (and b!1337245 c!126359) b!1337239))

(assert (= (and b!1337245 (not c!126359)) b!1337243))

(declare-fun b_lambda!24131 () Bool)

(assert (=> (not b_lambda!24131) (not b!1337242)))

(assert (=> b!1337242 t!45324))

(declare-fun b_and!49917 () Bool)

(assert (= b_and!49915 (and (=> t!45324 result!25201) b_and!49917)))

(declare-fun b_lambda!24133 () Bool)

(assert (=> (not b_lambda!24133) (not b!1337246)))

(assert (=> b!1337246 t!45324))

(declare-fun b_and!49919 () Bool)

(assert (= b_and!49917 (and (=> t!45324 result!25201) b_and!49919)))

(declare-fun m!1225589 () Bool)

(assert (=> b!1337240 m!1225589))

(assert (=> b!1337246 m!1225223))

(declare-fun m!1225591 () Bool)

(assert (=> b!1337246 m!1225591))

(declare-fun m!1225593 () Bool)

(assert (=> b!1337246 m!1225593))

(declare-fun m!1225595 () Bool)

(assert (=> b!1337246 m!1225595))

(assert (=> b!1337246 m!1225223))

(declare-fun m!1225597 () Bool)

(assert (=> b!1337246 m!1225597))

(assert (=> b!1337246 m!1225595))

(assert (=> b!1337246 m!1225591))

(declare-fun m!1225599 () Bool)

(assert (=> bm!64916 m!1225599))

(assert (=> b!1337239 m!1225599))

(assert (=> b!1337244 m!1225591))

(assert (=> b!1337244 m!1225591))

(declare-fun m!1225601 () Bool)

(assert (=> b!1337244 m!1225601))

(assert (=> b!1337250 m!1225591))

(assert (=> b!1337250 m!1225591))

(declare-fun m!1225603 () Bool)

(assert (=> b!1337250 m!1225603))

(assert (=> b!1337248 m!1225591))

(assert (=> b!1337248 m!1225591))

(assert (=> b!1337248 m!1225601))

(declare-fun m!1225605 () Bool)

(assert (=> d!144037 m!1225605))

(assert (=> d!144037 m!1225245))

(assert (=> b!1337242 m!1225223))

(declare-fun m!1225607 () Bool)

(assert (=> b!1337242 m!1225607))

(declare-fun m!1225609 () Bool)

(assert (=> b!1337242 m!1225609))

(assert (=> b!1337242 m!1225595))

(assert (=> b!1337242 m!1225223))

(assert (=> b!1337242 m!1225597))

(assert (=> b!1337242 m!1225595))

(assert (=> b!1337242 m!1225591))

(assert (=> b!1337242 m!1225607))

(declare-fun m!1225611 () Bool)

(assert (=> b!1337242 m!1225611))

(declare-fun m!1225613 () Bool)

(assert (=> b!1337242 m!1225613))

(declare-fun m!1225615 () Bool)

(assert (=> b!1337243 m!1225615))

(assert (=> b!1337089 d!144037))

(declare-fun d!144039 () Bool)

(assert (=> d!144039 (isDefined!520 (getValueByKey!711 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun lt!593124 () Unit!43828)

(declare-fun choose!1960 (List!31067 (_ BitVec 64)) Unit!43828)

(assert (=> d!144039 (= lt!593124 (choose!1960 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun e!761685 () Bool)

(assert (=> d!144039 e!761685))

(declare-fun res!887122 () Bool)

(assert (=> d!144039 (=> (not res!887122) (not e!761685))))

(declare-fun isStrictlySorted!867 (List!31067) Bool)

(assert (=> d!144039 (= res!887122 (isStrictlySorted!867 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))

(assert (=> d!144039 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) lt!593124)))

(declare-fun b!1337253 () Bool)

(assert (=> b!1337253 (= e!761685 (containsKey!737 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (= (and d!144039 res!887122) b!1337253))

(assert (=> d!144039 m!1225403))

(assert (=> d!144039 m!1225403))

(assert (=> d!144039 m!1225405))

(declare-fun m!1225617 () Bool)

(assert (=> d!144039 m!1225617))

(declare-fun m!1225619 () Bool)

(assert (=> d!144039 m!1225619))

(assert (=> b!1337253 m!1225399))

(assert (=> b!1337116 d!144039))

(assert (=> b!1337116 d!143993))

(assert (=> b!1337116 d!143995))

(declare-fun d!144041 () Bool)

(assert (=> d!144041 (= (apply!1041 lt!593061 (select (arr!43843 _keys!1590) from!1980)) (get!22127 (getValueByKey!711 (toList!10808 lt!593061) (select (arr!43843 _keys!1590) from!1980))))))

(declare-fun bs!38272 () Bool)

(assert (= bs!38272 d!144041))

(assert (=> bs!38272 m!1225229))

(declare-fun m!1225621 () Bool)

(assert (=> bs!38272 m!1225621))

(assert (=> bs!38272 m!1225621))

(declare-fun m!1225623 () Bool)

(assert (=> bs!38272 m!1225623))

(assert (=> b!1337166 d!144041))

(assert (=> b!1337166 d!143983))

(declare-fun d!144043 () Bool)

(assert (=> d!144043 (isDefined!520 (getValueByKey!711 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun lt!593125 () Unit!43828)

(assert (=> d!144043 (= lt!593125 (choose!1960 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun e!761686 () Bool)

(assert (=> d!144043 e!761686))

(declare-fun res!887123 () Bool)

(assert (=> d!144043 (=> (not res!887123) (not e!761686))))

(assert (=> d!144043 (= res!887123 (isStrictlySorted!867 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144043 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153) lt!593125)))

(declare-fun b!1337254 () Bool)

(assert (=> b!1337254 (= e!761686 (containsKey!737 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (= (and d!144043 res!887123) b!1337254))

(assert (=> d!144043 m!1225395))

(assert (=> d!144043 m!1225395))

(assert (=> d!144043 m!1225397))

(declare-fun m!1225625 () Bool)

(assert (=> d!144043 m!1225625))

(declare-fun m!1225627 () Bool)

(assert (=> d!144043 m!1225627))

(assert (=> b!1337254 m!1225391))

(assert (=> b!1337113 d!144043))

(assert (=> b!1337113 d!144029))

(assert (=> b!1337113 d!144031))

(declare-fun d!144045 () Bool)

(declare-fun e!761688 () Bool)

(assert (=> d!144045 e!761688))

(declare-fun res!887124 () Bool)

(assert (=> d!144045 (=> res!887124 e!761688)))

(declare-fun lt!593128 () Bool)

(assert (=> d!144045 (= res!887124 (not lt!593128))))

(declare-fun lt!593126 () Bool)

(assert (=> d!144045 (= lt!593128 lt!593126)))

(declare-fun lt!593129 () Unit!43828)

(declare-fun e!761687 () Unit!43828)

(assert (=> d!144045 (= lt!593129 e!761687)))

(declare-fun c!126361 () Bool)

(assert (=> d!144045 (= c!126361 lt!593126)))

(assert (=> d!144045 (= lt!593126 (containsKey!737 (toList!10808 lt!592993) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144045 (= (contains!8983 lt!592993 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593128)))

(declare-fun b!1337255 () Bool)

(declare-fun lt!593127 () Unit!43828)

(assert (=> b!1337255 (= e!761687 lt!593127)))

(assert (=> b!1337255 (= lt!593127 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 lt!592993) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337255 (isDefined!520 (getValueByKey!711 (toList!10808 lt!592993) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337256 () Bool)

(declare-fun Unit!43835 () Unit!43828)

(assert (=> b!1337256 (= e!761687 Unit!43835)))

(declare-fun b!1337257 () Bool)

(assert (=> b!1337257 (= e!761688 (isDefined!520 (getValueByKey!711 (toList!10808 lt!592993) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144045 c!126361) b!1337255))

(assert (= (and d!144045 (not c!126361)) b!1337256))

(assert (= (and d!144045 (not res!887124)) b!1337257))

(declare-fun m!1225629 () Bool)

(assert (=> d!144045 m!1225629))

(declare-fun m!1225631 () Bool)

(assert (=> b!1337255 m!1225631))

(declare-fun m!1225633 () Bool)

(assert (=> b!1337255 m!1225633))

(assert (=> b!1337255 m!1225633))

(declare-fun m!1225635 () Bool)

(assert (=> b!1337255 m!1225635))

(assert (=> b!1337257 m!1225633))

(assert (=> b!1337257 m!1225633))

(assert (=> b!1337257 m!1225635))

(assert (=> d!143981 d!144045))

(assert (=> d!143981 d!143969))

(declare-fun d!144047 () Bool)

(declare-fun e!761690 () Bool)

(assert (=> d!144047 e!761690))

(declare-fun res!887125 () Bool)

(assert (=> d!144047 (=> res!887125 e!761690)))

(declare-fun lt!593132 () Bool)

(assert (=> d!144047 (= res!887125 (not lt!593132))))

(declare-fun lt!593130 () Bool)

(assert (=> d!144047 (= lt!593132 lt!593130)))

(declare-fun lt!593133 () Unit!43828)

(declare-fun e!761689 () Unit!43828)

(assert (=> d!144047 (= lt!593133 e!761689)))

(declare-fun c!126362 () Bool)

(assert (=> d!144047 (= c!126362 lt!593130)))

(assert (=> d!144047 (= lt!593130 (containsKey!737 (toList!10808 lt!592970) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144047 (= (contains!8983 lt!592970 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!593132)))

(declare-fun b!1337258 () Bool)

(declare-fun lt!593131 () Unit!43828)

(assert (=> b!1337258 (= e!761689 lt!593131)))

(assert (=> b!1337258 (= lt!593131 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 lt!592970) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> b!1337258 (isDefined!520 (getValueByKey!711 (toList!10808 lt!592970) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1337259 () Bool)

(declare-fun Unit!43836 () Unit!43828)

(assert (=> b!1337259 (= e!761689 Unit!43836)))

(declare-fun b!1337260 () Bool)

(assert (=> b!1337260 (= e!761690 (isDefined!520 (getValueByKey!711 (toList!10808 lt!592970) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (= (and d!144047 c!126362) b!1337258))

(assert (= (and d!144047 (not c!126362)) b!1337259))

(assert (= (and d!144047 (not res!887125)) b!1337260))

(declare-fun m!1225637 () Bool)

(assert (=> d!144047 m!1225637))

(declare-fun m!1225639 () Bool)

(assert (=> b!1337258 m!1225639))

(assert (=> b!1337258 m!1225355))

(assert (=> b!1337258 m!1225355))

(declare-fun m!1225641 () Bool)

(assert (=> b!1337258 m!1225641))

(assert (=> b!1337260 m!1225355))

(assert (=> b!1337260 m!1225355))

(assert (=> b!1337260 m!1225641))

(assert (=> d!143979 d!144047))

(declare-fun d!144049 () Bool)

(declare-fun c!126363 () Bool)

(assert (=> d!144049 (= c!126363 (and ((_ is Cons!31063) lt!592969) (= (_1!11971 (h!32281 lt!592969)) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun e!761691 () Option!762)

(assert (=> d!144049 (= (getValueByKey!711 lt!592969 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) e!761691)))

(declare-fun b!1337261 () Bool)

(assert (=> b!1337261 (= e!761691 (Some!761 (_2!11971 (h!32281 lt!592969))))))

(declare-fun b!1337264 () Bool)

(declare-fun e!761692 () Option!762)

(assert (=> b!1337264 (= e!761692 None!760)))

(declare-fun b!1337263 () Bool)

(assert (=> b!1337263 (= e!761692 (getValueByKey!711 (t!45325 lt!592969) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1337262 () Bool)

(assert (=> b!1337262 (= e!761691 e!761692)))

(declare-fun c!126364 () Bool)

(assert (=> b!1337262 (= c!126364 (and ((_ is Cons!31063) lt!592969) (not (= (_1!11971 (h!32281 lt!592969)) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(assert (= (and d!144049 c!126363) b!1337261))

(assert (= (and d!144049 (not c!126363)) b!1337262))

(assert (= (and b!1337262 c!126364) b!1337263))

(assert (= (and b!1337262 (not c!126364)) b!1337264))

(declare-fun m!1225643 () Bool)

(assert (=> b!1337263 m!1225643))

(assert (=> d!143979 d!144049))

(declare-fun d!144051 () Bool)

(assert (=> d!144051 (= (getValueByKey!711 lt!592969 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!761 (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!593136 () Unit!43828)

(declare-fun choose!1961 (List!31067 (_ BitVec 64) V!54297) Unit!43828)

(assert (=> d!144051 (= lt!593136 (choose!1961 lt!592969 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun e!761695 () Bool)

(assert (=> d!144051 e!761695))

(declare-fun res!887130 () Bool)

(assert (=> d!144051 (=> (not res!887130) (not e!761695))))

(assert (=> d!144051 (= res!887130 (isStrictlySorted!867 lt!592969))))

(assert (=> d!144051 (= (lemmaContainsTupThenGetReturnValue!361 lt!592969 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!593136)))

(declare-fun b!1337269 () Bool)

(declare-fun res!887131 () Bool)

(assert (=> b!1337269 (=> (not res!887131) (not e!761695))))

(assert (=> b!1337269 (= res!887131 (containsKey!737 lt!592969 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1337270 () Bool)

(assert (=> b!1337270 (= e!761695 (contains!8987 lt!592969 (tuple2!23921 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (= (and d!144051 res!887130) b!1337269))

(assert (= (and b!1337269 res!887131) b!1337270))

(assert (=> d!144051 m!1225349))

(declare-fun m!1225645 () Bool)

(assert (=> d!144051 m!1225645))

(declare-fun m!1225647 () Bool)

(assert (=> d!144051 m!1225647))

(declare-fun m!1225649 () Bool)

(assert (=> b!1337269 m!1225649))

(declare-fun m!1225651 () Bool)

(assert (=> b!1337270 m!1225651))

(assert (=> d!143979 d!144051))

(declare-fun d!144053 () Bool)

(declare-fun e!761706 () Bool)

(assert (=> d!144053 e!761706))

(declare-fun res!887137 () Bool)

(assert (=> d!144053 (=> (not res!887137) (not e!761706))))

(declare-fun lt!593139 () List!31067)

(assert (=> d!144053 (= res!887137 (isStrictlySorted!867 lt!593139))))

(declare-fun e!761708 () List!31067)

(assert (=> d!144053 (= lt!593139 e!761708)))

(declare-fun c!126376 () Bool)

(assert (=> d!144053 (= c!126376 (and ((_ is Cons!31063) (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!11971 (h!32281 (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144053 (isStrictlySorted!867 (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144053 (= (insertStrictlySorted!490 (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!593139)))

(declare-fun b!1337291 () Bool)

(assert (=> b!1337291 (= e!761706 (contains!8987 lt!593139 (tuple2!23921 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1337292 () Bool)

(declare-fun e!761710 () List!31067)

(declare-fun call!64928 () List!31067)

(assert (=> b!1337292 (= e!761710 call!64928)))

(declare-fun b!1337293 () Bool)

(declare-fun e!761709 () List!31067)

(declare-fun call!64926 () List!31067)

(assert (=> b!1337293 (= e!761709 call!64926)))

(declare-fun bm!64923 () Bool)

(assert (=> bm!64923 (= call!64926 call!64928)))

(declare-fun e!761707 () List!31067)

(declare-fun b!1337294 () Bool)

(assert (=> b!1337294 (= e!761707 (insertStrictlySorted!490 (t!45325 (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun bm!64924 () Bool)

(declare-fun call!64927 () List!31067)

(assert (=> bm!64924 (= call!64928 call!64927)))

(declare-fun c!126375 () Bool)

(declare-fun b!1337295 () Bool)

(assert (=> b!1337295 (= c!126375 (and ((_ is Cons!31063) (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvsgt (_1!11971 (h!32281 (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> b!1337295 (= e!761710 e!761709)))

(declare-fun b!1337296 () Bool)

(assert (=> b!1337296 (= e!761709 call!64926)))

(declare-fun c!126374 () Bool)

(declare-fun b!1337297 () Bool)

(assert (=> b!1337297 (= e!761707 (ite c!126374 (t!45325 (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (ite c!126375 (Cons!31063 (h!32281 (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (t!45325 (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) Nil!31064)))))

(declare-fun b!1337298 () Bool)

(assert (=> b!1337298 (= e!761708 e!761710)))

(assert (=> b!1337298 (= c!126374 (and ((_ is Cons!31063) (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!11971 (h!32281 (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1337299 () Bool)

(declare-fun res!887136 () Bool)

(assert (=> b!1337299 (=> (not res!887136) (not e!761706))))

(assert (=> b!1337299 (= res!887136 (containsKey!737 lt!593139 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun bm!64925 () Bool)

(declare-fun $colon$colon!669 (List!31067 tuple2!23920) List!31067)

(assert (=> bm!64925 (= call!64927 ($colon$colon!669 e!761707 (ite c!126376 (h!32281 (toList!10808 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (tuple2!23921 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun c!126373 () Bool)

(assert (=> bm!64925 (= c!126373 c!126376)))

(declare-fun b!1337300 () Bool)

(assert (=> b!1337300 (= e!761708 call!64927)))

(assert (= (and d!144053 c!126376) b!1337300))

(assert (= (and d!144053 (not c!126376)) b!1337298))

(assert (= (and b!1337298 c!126374) b!1337292))

(assert (= (and b!1337298 (not c!126374)) b!1337295))

(assert (= (and b!1337295 c!126375) b!1337296))

(assert (= (and b!1337295 (not c!126375)) b!1337293))

(assert (= (or b!1337296 b!1337293) bm!64923))

(assert (= (or b!1337292 bm!64923) bm!64924))

(assert (= (or b!1337300 bm!64924) bm!64925))

(assert (= (and bm!64925 c!126373) b!1337294))

(assert (= (and bm!64925 (not c!126373)) b!1337297))

(assert (= (and d!144053 res!887137) b!1337299))

(assert (= (and b!1337299 res!887136) b!1337291))

(declare-fun m!1225653 () Bool)

(assert (=> b!1337294 m!1225653))

(declare-fun m!1225655 () Bool)

(assert (=> b!1337299 m!1225655))

(declare-fun m!1225657 () Bool)

(assert (=> bm!64925 m!1225657))

(declare-fun m!1225659 () Bool)

(assert (=> b!1337291 m!1225659))

(declare-fun m!1225661 () Bool)

(assert (=> d!144053 m!1225661))

(declare-fun m!1225663 () Bool)

(assert (=> d!144053 m!1225663))

(assert (=> d!143979 d!144053))

(declare-fun d!144055 () Bool)

(declare-fun e!761712 () Bool)

(assert (=> d!144055 e!761712))

(declare-fun res!887138 () Bool)

(assert (=> d!144055 (=> res!887138 e!761712)))

(declare-fun lt!593142 () Bool)

(assert (=> d!144055 (= res!887138 (not lt!593142))))

(declare-fun lt!593140 () Bool)

(assert (=> d!144055 (= lt!593142 lt!593140)))

(declare-fun lt!593143 () Unit!43828)

(declare-fun e!761711 () Unit!43828)

(assert (=> d!144055 (= lt!593143 e!761711)))

(declare-fun c!126377 () Bool)

(assert (=> d!144055 (= c!126377 lt!593140)))

(assert (=> d!144055 (= lt!593140 (containsKey!737 (toList!10808 lt!593061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144055 (= (contains!8983 lt!593061 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593142)))

(declare-fun b!1337301 () Bool)

(declare-fun lt!593141 () Unit!43828)

(assert (=> b!1337301 (= e!761711 lt!593141)))

(assert (=> b!1337301 (= lt!593141 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 lt!593061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337301 (isDefined!520 (getValueByKey!711 (toList!10808 lt!593061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337302 () Bool)

(declare-fun Unit!43837 () Unit!43828)

(assert (=> b!1337302 (= e!761711 Unit!43837)))

(declare-fun b!1337303 () Bool)

(assert (=> b!1337303 (= e!761712 (isDefined!520 (getValueByKey!711 (toList!10808 lt!593061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144055 c!126377) b!1337301))

(assert (= (and d!144055 (not c!126377)) b!1337302))

(assert (= (and d!144055 (not res!887138)) b!1337303))

(declare-fun m!1225665 () Bool)

(assert (=> d!144055 m!1225665))

(declare-fun m!1225667 () Bool)

(assert (=> b!1337301 m!1225667))

(declare-fun m!1225669 () Bool)

(assert (=> b!1337301 m!1225669))

(assert (=> b!1337301 m!1225669))

(declare-fun m!1225671 () Bool)

(assert (=> b!1337301 m!1225671))

(assert (=> b!1337303 m!1225669))

(assert (=> b!1337303 m!1225669))

(assert (=> b!1337303 m!1225671))

(assert (=> bm!64908 d!144055))

(declare-fun d!144057 () Bool)

(assert (=> d!144057 (= (validKeyInArray!0 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000)) (and (not (= (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337041 d!144057))

(declare-fun d!144059 () Bool)

(declare-fun e!761714 () Bool)

(assert (=> d!144059 e!761714))

(declare-fun res!887139 () Bool)

(assert (=> d!144059 (=> res!887139 e!761714)))

(declare-fun lt!593146 () Bool)

(assert (=> d!144059 (= res!887139 (not lt!593146))))

(declare-fun lt!593144 () Bool)

(assert (=> d!144059 (= lt!593146 lt!593144)))

(declare-fun lt!593147 () Unit!43828)

(declare-fun e!761713 () Unit!43828)

(assert (=> d!144059 (= lt!593147 e!761713)))

(declare-fun c!126378 () Bool)

(assert (=> d!144059 (= c!126378 lt!593144)))

(assert (=> d!144059 (= lt!593144 (containsKey!737 (toList!10808 lt!592966) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144059 (= (contains!8983 lt!592966 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593146)))

(declare-fun b!1337304 () Bool)

(declare-fun lt!593145 () Unit!43828)

(assert (=> b!1337304 (= e!761713 lt!593145)))

(assert (=> b!1337304 (= lt!593145 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 lt!592966) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1337304 (isDefined!520 (getValueByKey!711 (toList!10808 lt!592966) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337305 () Bool)

(declare-fun Unit!43838 () Unit!43828)

(assert (=> b!1337305 (= e!761713 Unit!43838)))

(declare-fun b!1337306 () Bool)

(assert (=> b!1337306 (= e!761714 (isDefined!520 (getValueByKey!711 (toList!10808 lt!592966) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144059 c!126378) b!1337304))

(assert (= (and d!144059 (not c!126378)) b!1337305))

(assert (= (and d!144059 (not res!887139)) b!1337306))

(declare-fun m!1225673 () Bool)

(assert (=> d!144059 m!1225673))

(declare-fun m!1225675 () Bool)

(assert (=> b!1337304 m!1225675))

(assert (=> b!1337304 m!1225343))

(assert (=> b!1337304 m!1225343))

(declare-fun m!1225677 () Bool)

(assert (=> b!1337304 m!1225677))

(assert (=> b!1337306 m!1225343))

(assert (=> b!1337306 m!1225343))

(assert (=> b!1337306 m!1225677))

(assert (=> d!143977 d!144059))

(declare-fun c!126379 () Bool)

(declare-fun d!144061 () Bool)

(assert (=> d!144061 (= c!126379 (and ((_ is Cons!31063) lt!592965) (= (_1!11971 (h!32281 lt!592965)) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!761715 () Option!762)

(assert (=> d!144061 (= (getValueByKey!711 lt!592965 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!761715)))

(declare-fun b!1337307 () Bool)

(assert (=> b!1337307 (= e!761715 (Some!761 (_2!11971 (h!32281 lt!592965))))))

(declare-fun b!1337310 () Bool)

(declare-fun e!761716 () Option!762)

(assert (=> b!1337310 (= e!761716 None!760)))

(declare-fun b!1337309 () Bool)

(assert (=> b!1337309 (= e!761716 (getValueByKey!711 (t!45325 lt!592965) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337308 () Bool)

(assert (=> b!1337308 (= e!761715 e!761716)))

(declare-fun c!126380 () Bool)

(assert (=> b!1337308 (= c!126380 (and ((_ is Cons!31063) lt!592965) (not (= (_1!11971 (h!32281 lt!592965)) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!144061 c!126379) b!1337307))

(assert (= (and d!144061 (not c!126379)) b!1337308))

(assert (= (and b!1337308 c!126380) b!1337309))

(assert (= (and b!1337308 (not c!126380)) b!1337310))

(declare-fun m!1225679 () Bool)

(assert (=> b!1337309 m!1225679))

(assert (=> d!143977 d!144061))

(declare-fun d!144063 () Bool)

(assert (=> d!144063 (= (getValueByKey!711 lt!592965 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!761 (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!593148 () Unit!43828)

(assert (=> d!144063 (= lt!593148 (choose!1961 lt!592965 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!761717 () Bool)

(assert (=> d!144063 e!761717))

(declare-fun res!887140 () Bool)

(assert (=> d!144063 (=> (not res!887140) (not e!761717))))

(assert (=> d!144063 (= res!887140 (isStrictlySorted!867 lt!592965))))

(assert (=> d!144063 (= (lemmaContainsTupThenGetReturnValue!361 lt!592965 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593148)))

(declare-fun b!1337311 () Bool)

(declare-fun res!887141 () Bool)

(assert (=> b!1337311 (=> (not res!887141) (not e!761717))))

(assert (=> b!1337311 (= res!887141 (containsKey!737 lt!592965 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337312 () Bool)

(assert (=> b!1337312 (= e!761717 (contains!8987 lt!592965 (tuple2!23921 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144063 res!887140) b!1337311))

(assert (= (and b!1337311 res!887141) b!1337312))

(assert (=> d!144063 m!1225337))

(declare-fun m!1225681 () Bool)

(assert (=> d!144063 m!1225681))

(declare-fun m!1225683 () Bool)

(assert (=> d!144063 m!1225683))

(declare-fun m!1225685 () Bool)

(assert (=> b!1337311 m!1225685))

(declare-fun m!1225687 () Bool)

(assert (=> b!1337312 m!1225687))

(assert (=> d!143977 d!144063))

(declare-fun d!144065 () Bool)

(declare-fun e!761718 () Bool)

(assert (=> d!144065 e!761718))

(declare-fun res!887143 () Bool)

(assert (=> d!144065 (=> (not res!887143) (not e!761718))))

(declare-fun lt!593149 () List!31067)

(assert (=> d!144065 (= res!887143 (isStrictlySorted!867 lt!593149))))

(declare-fun e!761720 () List!31067)

(assert (=> d!144065 (= lt!593149 e!761720)))

(declare-fun c!126384 () Bool)

(assert (=> d!144065 (= c!126384 (and ((_ is Cons!31063) (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvslt (_1!11971 (h!32281 (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144065 (isStrictlySorted!867 (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))))

(assert (=> d!144065 (= (insertStrictlySorted!490 (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593149)))

(declare-fun b!1337313 () Bool)

(assert (=> b!1337313 (= e!761718 (contains!8987 lt!593149 (tuple2!23921 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1337314 () Bool)

(declare-fun e!761722 () List!31067)

(declare-fun call!64931 () List!31067)

(assert (=> b!1337314 (= e!761722 call!64931)))

(declare-fun b!1337315 () Bool)

(declare-fun e!761721 () List!31067)

(declare-fun call!64929 () List!31067)

(assert (=> b!1337315 (= e!761721 call!64929)))

(declare-fun bm!64926 () Bool)

(assert (=> bm!64926 (= call!64929 call!64931)))

(declare-fun e!761719 () List!31067)

(declare-fun b!1337316 () Bool)

(assert (=> b!1337316 (= e!761719 (insertStrictlySorted!490 (t!45325 (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!64927 () Bool)

(declare-fun call!64930 () List!31067)

(assert (=> bm!64927 (= call!64931 call!64930)))

(declare-fun b!1337317 () Bool)

(declare-fun c!126383 () Bool)

(assert (=> b!1337317 (= c!126383 (and ((_ is Cons!31063) (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvsgt (_1!11971 (h!32281 (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1337317 (= e!761722 e!761721)))

(declare-fun b!1337318 () Bool)

(assert (=> b!1337318 (= e!761721 call!64929)))

(declare-fun b!1337319 () Bool)

(declare-fun c!126382 () Bool)

(assert (=> b!1337319 (= e!761719 (ite c!126382 (t!45325 (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (ite c!126383 (Cons!31063 (h!32281 (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (t!45325 (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) Nil!31064)))))

(declare-fun b!1337320 () Bool)

(assert (=> b!1337320 (= e!761720 e!761722)))

(assert (=> b!1337320 (= c!126382 (and ((_ is Cons!31063) (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!11971 (h!32281 (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1337321 () Bool)

(declare-fun res!887142 () Bool)

(assert (=> b!1337321 (=> (not res!887142) (not e!761718))))

(assert (=> b!1337321 (= res!887142 (containsKey!737 lt!593149 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!64928 () Bool)

(assert (=> bm!64928 (= call!64930 ($colon$colon!669 e!761719 (ite c!126384 (h!32281 (toList!10808 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (tuple2!23921 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126381 () Bool)

(assert (=> bm!64928 (= c!126381 c!126384)))

(declare-fun b!1337322 () Bool)

(assert (=> b!1337322 (= e!761720 call!64930)))

(assert (= (and d!144065 c!126384) b!1337322))

(assert (= (and d!144065 (not c!126384)) b!1337320))

(assert (= (and b!1337320 c!126382) b!1337314))

(assert (= (and b!1337320 (not c!126382)) b!1337317))

(assert (= (and b!1337317 c!126383) b!1337318))

(assert (= (and b!1337317 (not c!126383)) b!1337315))

(assert (= (or b!1337318 b!1337315) bm!64926))

(assert (= (or b!1337314 bm!64926) bm!64927))

(assert (= (or b!1337322 bm!64927) bm!64928))

(assert (= (and bm!64928 c!126381) b!1337316))

(assert (= (and bm!64928 (not c!126381)) b!1337319))

(assert (= (and d!144065 res!887143) b!1337321))

(assert (= (and b!1337321 res!887142) b!1337313))

(declare-fun m!1225689 () Bool)

(assert (=> b!1337316 m!1225689))

(declare-fun m!1225691 () Bool)

(assert (=> b!1337321 m!1225691))

(declare-fun m!1225693 () Bool)

(assert (=> bm!64928 m!1225693))

(declare-fun m!1225695 () Bool)

(assert (=> b!1337313 m!1225695))

(declare-fun m!1225697 () Bool)

(assert (=> d!144065 m!1225697))

(declare-fun m!1225699 () Bool)

(assert (=> d!144065 m!1225699))

(assert (=> d!143977 d!144065))

(declare-fun d!144067 () Bool)

(declare-fun e!761724 () Bool)

(assert (=> d!144067 e!761724))

(declare-fun res!887144 () Bool)

(assert (=> d!144067 (=> res!887144 e!761724)))

(declare-fun lt!593152 () Bool)

(assert (=> d!144067 (= res!887144 (not lt!593152))))

(declare-fun lt!593150 () Bool)

(assert (=> d!144067 (= lt!593152 lt!593150)))

(declare-fun lt!593153 () Unit!43828)

(declare-fun e!761723 () Unit!43828)

(assert (=> d!144067 (= lt!593153 e!761723)))

(declare-fun c!126385 () Bool)

(assert (=> d!144067 (= c!126385 lt!593150)))

(assert (=> d!144067 (= lt!593150 (containsKey!737 (toList!10808 lt!593061) (select (arr!43843 _keys!1590) from!1980)))))

(assert (=> d!144067 (= (contains!8983 lt!593061 (select (arr!43843 _keys!1590) from!1980)) lt!593152)))

(declare-fun b!1337323 () Bool)

(declare-fun lt!593151 () Unit!43828)

(assert (=> b!1337323 (= e!761723 lt!593151)))

(assert (=> b!1337323 (= lt!593151 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 lt!593061) (select (arr!43843 _keys!1590) from!1980)))))

(assert (=> b!1337323 (isDefined!520 (getValueByKey!711 (toList!10808 lt!593061) (select (arr!43843 _keys!1590) from!1980)))))

(declare-fun b!1337324 () Bool)

(declare-fun Unit!43839 () Unit!43828)

(assert (=> b!1337324 (= e!761723 Unit!43839)))

(declare-fun b!1337325 () Bool)

(assert (=> b!1337325 (= e!761724 (isDefined!520 (getValueByKey!711 (toList!10808 lt!593061) (select (arr!43843 _keys!1590) from!1980))))))

(assert (= (and d!144067 c!126385) b!1337323))

(assert (= (and d!144067 (not c!126385)) b!1337324))

(assert (= (and d!144067 (not res!887144)) b!1337325))

(assert (=> d!144067 m!1225229))

(declare-fun m!1225701 () Bool)

(assert (=> d!144067 m!1225701))

(assert (=> b!1337323 m!1225229))

(declare-fun m!1225703 () Bool)

(assert (=> b!1337323 m!1225703))

(assert (=> b!1337323 m!1225229))

(assert (=> b!1337323 m!1225621))

(assert (=> b!1337323 m!1225621))

(declare-fun m!1225705 () Bool)

(assert (=> b!1337323 m!1225705))

(assert (=> b!1337325 m!1225229))

(assert (=> b!1337325 m!1225621))

(assert (=> b!1337325 m!1225621))

(assert (=> b!1337325 m!1225705))

(assert (=> b!1337178 d!144067))

(declare-fun d!144069 () Bool)

(declare-fun e!761725 () Bool)

(assert (=> d!144069 e!761725))

(declare-fun res!887146 () Bool)

(assert (=> d!144069 (=> (not res!887146) (not e!761725))))

(declare-fun lt!593155 () ListLongMap!21585)

(assert (=> d!144069 (= res!887146 (contains!8983 lt!593155 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!593154 () List!31067)

(assert (=> d!144069 (= lt!593155 (ListLongMap!21586 lt!593154))))

(declare-fun lt!593157 () Unit!43828)

(declare-fun lt!593156 () Unit!43828)

(assert (=> d!144069 (= lt!593157 lt!593156)))

(assert (=> d!144069 (= (getValueByKey!711 lt!593154 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!761 (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144069 (= lt!593156 (lemmaContainsTupThenGetReturnValue!361 lt!593154 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144069 (= lt!593154 (insertStrictlySorted!490 (toList!10808 call!64916) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144069 (= (+!4762 call!64916 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!593155)))

(declare-fun b!1337326 () Bool)

(declare-fun res!887145 () Bool)

(assert (=> b!1337326 (=> (not res!887145) (not e!761725))))

(assert (=> b!1337326 (= res!887145 (= (getValueByKey!711 (toList!10808 lt!593155) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!761 (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1337327 () Bool)

(assert (=> b!1337327 (= e!761725 (contains!8987 (toList!10808 lt!593155) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!144069 res!887146) b!1337326))

(assert (= (and b!1337326 res!887145) b!1337327))

(declare-fun m!1225707 () Bool)

(assert (=> d!144069 m!1225707))

(declare-fun m!1225709 () Bool)

(assert (=> d!144069 m!1225709))

(declare-fun m!1225711 () Bool)

(assert (=> d!144069 m!1225711))

(declare-fun m!1225713 () Bool)

(assert (=> d!144069 m!1225713))

(declare-fun m!1225715 () Bool)

(assert (=> b!1337326 m!1225715))

(declare-fun m!1225717 () Bool)

(assert (=> b!1337327 m!1225717))

(assert (=> b!1337177 d!144069))

(declare-fun d!144071 () Bool)

(assert (=> d!144071 (= (apply!1041 lt!593061 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22127 (getValueByKey!711 (toList!10808 lt!593061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38273 () Bool)

(assert (= bs!38273 d!144071))

(assert (=> bs!38273 m!1225669))

(assert (=> bs!38273 m!1225669))

(declare-fun m!1225719 () Bool)

(assert (=> bs!38273 m!1225719))

(assert (=> b!1337162 d!144071))

(assert (=> b!1337161 d!143965))

(declare-fun b!1337328 () Bool)

(declare-fun e!761726 () Bool)

(declare-fun e!761727 () Bool)

(assert (=> b!1337328 (= e!761726 e!761727)))

(declare-fun lt!593159 () (_ BitVec 64))

(assert (=> b!1337328 (= lt!593159 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!593160 () Unit!43828)

(assert (=> b!1337328 (= lt!593160 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593159 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1337328 (arrayContainsKey!0 _keys!1590 lt!593159 #b00000000000000000000000000000000)))

(declare-fun lt!593158 () Unit!43828)

(assert (=> b!1337328 (= lt!593158 lt!593160)))

(declare-fun res!887147 () Bool)

(assert (=> b!1337328 (= res!887147 (= (seekEntryOrOpen!0 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1590 mask!1998) (Found!10003 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1337328 (=> (not res!887147) (not e!761727))))

(declare-fun bm!64929 () Bool)

(declare-fun call!64932 () Bool)

(assert (=> bm!64929 (= call!64932 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1337329 () Bool)

(assert (=> b!1337329 (= e!761726 call!64932)))

(declare-fun b!1337331 () Bool)

(declare-fun e!761728 () Bool)

(assert (=> b!1337331 (= e!761728 e!761726)))

(declare-fun c!126386 () Bool)

(assert (=> b!1337331 (= c!126386 (validKeyInArray!0 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!144073 () Bool)

(declare-fun res!887148 () Bool)

(assert (=> d!144073 (=> res!887148 e!761728)))

(assert (=> d!144073 (= res!887148 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44394 _keys!1590)))))

(assert (=> d!144073 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998) e!761728)))

(declare-fun b!1337330 () Bool)

(assert (=> b!1337330 (= e!761727 call!64932)))

(assert (= (and d!144073 (not res!887148)) b!1337331))

(assert (= (and b!1337331 c!126386) b!1337328))

(assert (= (and b!1337331 (not c!126386)) b!1337329))

(assert (= (and b!1337328 res!887147) b!1337330))

(assert (= (or b!1337330 b!1337329) bm!64929))

(declare-fun m!1225721 () Bool)

(assert (=> b!1337328 m!1225721))

(declare-fun m!1225723 () Bool)

(assert (=> b!1337328 m!1225723))

(declare-fun m!1225725 () Bool)

(assert (=> b!1337328 m!1225725))

(assert (=> b!1337328 m!1225721))

(declare-fun m!1225727 () Bool)

(assert (=> b!1337328 m!1225727))

(declare-fun m!1225729 () Bool)

(assert (=> bm!64929 m!1225729))

(assert (=> b!1337331 m!1225721))

(assert (=> b!1337331 m!1225721))

(declare-fun m!1225731 () Bool)

(assert (=> b!1337331 m!1225731))

(assert (=> bm!64887 d!144073))

(declare-fun d!144075 () Bool)

(assert (=> d!144075 (= (apply!1041 lt!593061 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22127 (getValueByKey!711 (toList!10808 lt!593061) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38274 () Bool)

(assert (= bs!38274 d!144075))

(declare-fun m!1225733 () Bool)

(assert (=> bs!38274 m!1225733))

(assert (=> bs!38274 m!1225733))

(declare-fun m!1225735 () Bool)

(assert (=> bs!38274 m!1225735))

(assert (=> b!1337175 d!144075))

(declare-fun d!144077 () Bool)

(assert (=> d!144077 (arrayContainsKey!0 _keys!1590 lt!592955 #b00000000000000000000000000000000)))

(declare-fun lt!593163 () Unit!43828)

(declare-fun choose!13 (array!90763 (_ BitVec 64) (_ BitVec 32)) Unit!43828)

(assert (=> d!144077 (= lt!593163 (choose!13 _keys!1590 lt!592955 #b00000000000000000000000000000000))))

(assert (=> d!144077 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!144077 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!592955 #b00000000000000000000000000000000) lt!593163)))

(declare-fun bs!38275 () Bool)

(assert (= bs!38275 d!144077))

(assert (=> bs!38275 m!1225323))

(declare-fun m!1225737 () Bool)

(assert (=> bs!38275 m!1225737))

(assert (=> b!1337038 d!144077))

(declare-fun d!144079 () Bool)

(declare-fun res!887153 () Bool)

(declare-fun e!761733 () Bool)

(assert (=> d!144079 (=> res!887153 e!761733)))

(assert (=> d!144079 (= res!887153 (= (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) lt!592955))))

(assert (=> d!144079 (= (arrayContainsKey!0 _keys!1590 lt!592955 #b00000000000000000000000000000000) e!761733)))

(declare-fun b!1337336 () Bool)

(declare-fun e!761734 () Bool)

(assert (=> b!1337336 (= e!761733 e!761734)))

(declare-fun res!887154 () Bool)

(assert (=> b!1337336 (=> (not res!887154) (not e!761734))))

(assert (=> b!1337336 (= res!887154 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44394 _keys!1590)))))

(declare-fun b!1337337 () Bool)

(assert (=> b!1337337 (= e!761734 (arrayContainsKey!0 _keys!1590 lt!592955 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!144079 (not res!887153)) b!1337336))

(assert (= (and b!1337336 res!887154) b!1337337))

(assert (=> d!144079 m!1225319))

(declare-fun m!1225739 () Bool)

(assert (=> b!1337337 m!1225739))

(assert (=> b!1337038 d!144079))

(declare-fun b!1337350 () Bool)

(declare-fun e!761741 () SeekEntryResult!10003)

(declare-fun e!761742 () SeekEntryResult!10003)

(assert (=> b!1337350 (= e!761741 e!761742)))

(declare-fun lt!593170 () (_ BitVec 64))

(declare-fun lt!593171 () SeekEntryResult!10003)

(assert (=> b!1337350 (= lt!593170 (select (arr!43843 _keys!1590) (index!42385 lt!593171)))))

(declare-fun c!126395 () Bool)

(assert (=> b!1337350 (= c!126395 (= lt!593170 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337351 () Bool)

(assert (=> b!1337351 (= e!761742 (Found!10003 (index!42385 lt!593171)))))

(declare-fun b!1337352 () Bool)

(assert (=> b!1337352 (= e!761741 Undefined!10003)))

(declare-fun e!761743 () SeekEntryResult!10003)

(declare-fun b!1337353 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90763 (_ BitVec 32)) SeekEntryResult!10003)

(assert (=> b!1337353 (= e!761743 (seekKeyOrZeroReturnVacant!0 (x!119304 lt!593171) (index!42385 lt!593171) (index!42385 lt!593171) (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(declare-fun d!144081 () Bool)

(declare-fun lt!593172 () SeekEntryResult!10003)

(assert (=> d!144081 (and (or ((_ is Undefined!10003) lt!593172) (not ((_ is Found!10003) lt!593172)) (and (bvsge (index!42384 lt!593172) #b00000000000000000000000000000000) (bvslt (index!42384 lt!593172) (size!44394 _keys!1590)))) (or ((_ is Undefined!10003) lt!593172) ((_ is Found!10003) lt!593172) (not ((_ is MissingZero!10003) lt!593172)) (and (bvsge (index!42383 lt!593172) #b00000000000000000000000000000000) (bvslt (index!42383 lt!593172) (size!44394 _keys!1590)))) (or ((_ is Undefined!10003) lt!593172) ((_ is Found!10003) lt!593172) ((_ is MissingZero!10003) lt!593172) (not ((_ is MissingVacant!10003) lt!593172)) (and (bvsge (index!42386 lt!593172) #b00000000000000000000000000000000) (bvslt (index!42386 lt!593172) (size!44394 _keys!1590)))) (or ((_ is Undefined!10003) lt!593172) (ite ((_ is Found!10003) lt!593172) (= (select (arr!43843 _keys!1590) (index!42384 lt!593172)) (select (arr!43843 _keys!1590) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10003) lt!593172) (= (select (arr!43843 _keys!1590) (index!42383 lt!593172)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10003) lt!593172) (= (select (arr!43843 _keys!1590) (index!42386 lt!593172)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144081 (= lt!593172 e!761741)))

(declare-fun c!126393 () Bool)

(assert (=> d!144081 (= c!126393 (and ((_ is Intermediate!10003) lt!593171) (undefined!10815 lt!593171)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90763 (_ BitVec 32)) SeekEntryResult!10003)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!144081 (= lt!593171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) mask!1998) (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(assert (=> d!144081 (validMask!0 mask!1998)))

(assert (=> d!144081 (= (seekEntryOrOpen!0 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) lt!593172)))

(declare-fun b!1337354 () Bool)

(declare-fun c!126394 () Bool)

(assert (=> b!1337354 (= c!126394 (= lt!593170 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337354 (= e!761742 e!761743)))

(declare-fun b!1337355 () Bool)

(assert (=> b!1337355 (= e!761743 (MissingZero!10003 (index!42385 lt!593171)))))

(assert (= (and d!144081 c!126393) b!1337352))

(assert (= (and d!144081 (not c!126393)) b!1337350))

(assert (= (and b!1337350 c!126395) b!1337351))

(assert (= (and b!1337350 (not c!126395)) b!1337354))

(assert (= (and b!1337354 c!126394) b!1337355))

(assert (= (and b!1337354 (not c!126394)) b!1337353))

(declare-fun m!1225741 () Bool)

(assert (=> b!1337350 m!1225741))

(assert (=> b!1337353 m!1225319))

(declare-fun m!1225743 () Bool)

(assert (=> b!1337353 m!1225743))

(assert (=> d!144081 m!1225319))

(declare-fun m!1225745 () Bool)

(assert (=> d!144081 m!1225745))

(declare-fun m!1225747 () Bool)

(assert (=> d!144081 m!1225747))

(assert (=> d!144081 m!1225745))

(assert (=> d!144081 m!1225319))

(declare-fun m!1225749 () Bool)

(assert (=> d!144081 m!1225749))

(assert (=> d!144081 m!1225245))

(declare-fun m!1225751 () Bool)

(assert (=> d!144081 m!1225751))

(declare-fun m!1225753 () Bool)

(assert (=> d!144081 m!1225753))

(assert (=> b!1337038 d!144081))

(declare-fun d!144083 () Bool)

(declare-fun e!761745 () Bool)

(assert (=> d!144083 e!761745))

(declare-fun res!887155 () Bool)

(assert (=> d!144083 (=> res!887155 e!761745)))

(declare-fun lt!593175 () Bool)

(assert (=> d!144083 (= res!887155 (not lt!593175))))

(declare-fun lt!593173 () Bool)

(assert (=> d!144083 (= lt!593175 lt!593173)))

(declare-fun lt!593176 () Unit!43828)

(declare-fun e!761744 () Unit!43828)

(assert (=> d!144083 (= lt!593176 e!761744)))

(declare-fun c!126396 () Bool)

(assert (=> d!144083 (= c!126396 lt!593173)))

(assert (=> d!144083 (= lt!593173 (containsKey!737 (toList!10808 lt!592993) (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> d!144083 (= (contains!8983 lt!592993 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) lt!593175)))

(declare-fun b!1337356 () Bool)

(declare-fun lt!593174 () Unit!43828)

(assert (=> b!1337356 (= e!761744 lt!593174)))

(assert (=> b!1337356 (= lt!593174 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 lt!592993) (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1337356 (isDefined!520 (getValueByKey!711 (toList!10808 lt!592993) (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1337357 () Bool)

(declare-fun Unit!43840 () Unit!43828)

(assert (=> b!1337357 (= e!761744 Unit!43840)))

(declare-fun b!1337358 () Bool)

(assert (=> b!1337358 (= e!761745 (isDefined!520 (getValueByKey!711 (toList!10808 lt!592993) (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(assert (= (and d!144083 c!126396) b!1337356))

(assert (= (and d!144083 (not c!126396)) b!1337357))

(assert (= (and d!144083 (not res!887155)) b!1337358))

(assert (=> d!144083 m!1225361))

(declare-fun m!1225755 () Bool)

(assert (=> d!144083 m!1225755))

(assert (=> b!1337356 m!1225361))

(declare-fun m!1225757 () Bool)

(assert (=> b!1337356 m!1225757))

(assert (=> b!1337356 m!1225361))

(declare-fun m!1225759 () Bool)

(assert (=> b!1337356 m!1225759))

(assert (=> b!1337356 m!1225759))

(declare-fun m!1225761 () Bool)

(assert (=> b!1337356 m!1225761))

(assert (=> b!1337358 m!1225361))

(assert (=> b!1337358 m!1225759))

(assert (=> b!1337358 m!1225759))

(assert (=> b!1337358 m!1225761))

(assert (=> b!1337100 d!144083))

(assert (=> d!143989 d!143969))

(declare-fun d!144085 () Bool)

(declare-fun res!887160 () Bool)

(declare-fun e!761750 () Bool)

(assert (=> d!144085 (=> res!887160 e!761750)))

(assert (=> d!144085 (= res!887160 (and ((_ is Cons!31063) (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!11971 (h!32281 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!144085 (= (containsKey!737 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!761750)))

(declare-fun b!1337363 () Bool)

(declare-fun e!761751 () Bool)

(assert (=> b!1337363 (= e!761750 e!761751)))

(declare-fun res!887161 () Bool)

(assert (=> b!1337363 (=> (not res!887161) (not e!761751))))

(assert (=> b!1337363 (= res!887161 (and (or (not ((_ is Cons!31063) (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) (bvsle (_1!11971 (h!32281 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)) ((_ is Cons!31063) (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (bvslt (_1!11971 (h!32281 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1337364 () Bool)

(assert (=> b!1337364 (= e!761751 (containsKey!737 (t!45325 (toList!10808 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(assert (= (and d!144085 (not res!887160)) b!1337363))

(assert (= (and b!1337363 res!887161) b!1337364))

(declare-fun m!1225763 () Bool)

(assert (=> b!1337364 m!1225763))

(assert (=> d!143987 d!144085))

(assert (=> b!1337056 d!144057))

(declare-fun d!144087 () Bool)

(assert (=> d!144087 (= (validKeyInArray!0 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (and (not (= (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337098 d!144087))

(declare-fun d!144089 () Bool)

(declare-fun e!761753 () Bool)

(assert (=> d!144089 e!761753))

(declare-fun res!887162 () Bool)

(assert (=> d!144089 (=> res!887162 e!761753)))

(declare-fun lt!593179 () Bool)

(assert (=> d!144089 (= res!887162 (not lt!593179))))

(declare-fun lt!593177 () Bool)

(assert (=> d!144089 (= lt!593179 lt!593177)))

(declare-fun lt!593180 () Unit!43828)

(declare-fun e!761752 () Unit!43828)

(assert (=> d!144089 (= lt!593180 e!761752)))

(declare-fun c!126397 () Bool)

(assert (=> d!144089 (= c!126397 lt!593177)))

(assert (=> d!144089 (= lt!593177 (containsKey!737 (toList!10808 lt!593061) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144089 (= (contains!8983 lt!593061 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593179)))

(declare-fun b!1337365 () Bool)

(declare-fun lt!593178 () Unit!43828)

(assert (=> b!1337365 (= e!761752 lt!593178)))

(assert (=> b!1337365 (= lt!593178 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 lt!593061) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337365 (isDefined!520 (getValueByKey!711 (toList!10808 lt!593061) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337366 () Bool)

(declare-fun Unit!43841 () Unit!43828)

(assert (=> b!1337366 (= e!761752 Unit!43841)))

(declare-fun b!1337367 () Bool)

(assert (=> b!1337367 (= e!761753 (isDefined!520 (getValueByKey!711 (toList!10808 lt!593061) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144089 c!126397) b!1337365))

(assert (= (and d!144089 (not c!126397)) b!1337366))

(assert (= (and d!144089 (not res!887162)) b!1337367))

(declare-fun m!1225765 () Bool)

(assert (=> d!144089 m!1225765))

(declare-fun m!1225767 () Bool)

(assert (=> b!1337365 m!1225767))

(assert (=> b!1337365 m!1225733))

(assert (=> b!1337365 m!1225733))

(declare-fun m!1225769 () Bool)

(assert (=> b!1337365 m!1225769))

(assert (=> b!1337367 m!1225733))

(assert (=> b!1337367 m!1225733))

(assert (=> b!1337367 m!1225769))

(assert (=> bm!64913 d!144089))

(assert (=> bm!64893 d!144037))

(declare-fun d!144091 () Bool)

(declare-fun res!887163 () Bool)

(declare-fun e!761754 () Bool)

(assert (=> d!144091 (=> res!887163 e!761754)))

(assert (=> d!144091 (= res!887163 (and ((_ is Cons!31063) (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (= (_1!11971 (h!32281 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)))))

(assert (=> d!144091 (= (containsKey!737 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153) e!761754)))

(declare-fun b!1337368 () Bool)

(declare-fun e!761755 () Bool)

(assert (=> b!1337368 (= e!761754 e!761755)))

(declare-fun res!887164 () Bool)

(assert (=> b!1337368 (=> (not res!887164) (not e!761755))))

(assert (=> b!1337368 (= res!887164 (and (or (not ((_ is Cons!31063) (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) (bvsle (_1!11971 (h!32281 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)) ((_ is Cons!31063) (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (bvslt (_1!11971 (h!32281 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)))))

(declare-fun b!1337369 () Bool)

(assert (=> b!1337369 (= e!761755 (containsKey!737 (t!45325 (toList!10808 (+!4762 (+!4762 (getCurrentListMapNoExtraKeys!6411 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) k0!1153))))

(assert (= (and d!144091 (not res!887163)) b!1337368))

(assert (= (and b!1337368 res!887164) b!1337369))

(declare-fun m!1225771 () Bool)

(assert (=> b!1337369 m!1225771))

(assert (=> d!143985 d!144091))

(assert (=> b!1337170 d!143965))

(declare-fun d!144093 () Bool)

(declare-fun lt!593183 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!656 (List!31068) (InoxSet (_ BitVec 64)))

(assert (=> d!144093 (= lt!593183 (select (content!656 Nil!31065) (select (arr!43843 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun e!761761 () Bool)

(assert (=> d!144093 (= lt!593183 e!761761)))

(declare-fun res!887169 () Bool)

(assert (=> d!144093 (=> (not res!887169) (not e!761761))))

(assert (=> d!144093 (= res!887169 ((_ is Cons!31064) Nil!31065))))

(assert (=> d!144093 (= (contains!8986 Nil!31065 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000)) lt!593183)))

(declare-fun b!1337374 () Bool)

(declare-fun e!761760 () Bool)

(assert (=> b!1337374 (= e!761761 e!761760)))

(declare-fun res!887170 () Bool)

(assert (=> b!1337374 (=> res!887170 e!761760)))

(assert (=> b!1337374 (= res!887170 (= (h!32282 Nil!31065) (select (arr!43843 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337375 () Bool)

(assert (=> b!1337375 (= e!761760 (contains!8986 (t!45326 Nil!31065) (select (arr!43843 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!144093 res!887169) b!1337374))

(assert (= (and b!1337374 (not res!887170)) b!1337375))

(declare-fun m!1225773 () Bool)

(assert (=> d!144093 m!1225773))

(assert (=> d!144093 m!1225319))

(declare-fun m!1225775 () Bool)

(assert (=> d!144093 m!1225775))

(assert (=> b!1337375 m!1225319))

(declare-fun m!1225777 () Bool)

(assert (=> b!1337375 m!1225777))

(assert (=> b!1337053 d!144093))

(assert (=> b!1337052 d!144057))

(declare-fun d!144095 () Bool)

(declare-fun lt!593186 () Bool)

(declare-fun content!657 (List!31067) (InoxSet tuple2!23920))

(assert (=> d!144095 (= lt!593186 (select (content!657 (toList!10808 lt!592970)) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun e!761767 () Bool)

(assert (=> d!144095 (= lt!593186 e!761767)))

(declare-fun res!887175 () Bool)

(assert (=> d!144095 (=> (not res!887175) (not e!761767))))

(assert (=> d!144095 (= res!887175 ((_ is Cons!31063) (toList!10808 lt!592970)))))

(assert (=> d!144095 (= (contains!8987 (toList!10808 lt!592970) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!593186)))

(declare-fun b!1337380 () Bool)

(declare-fun e!761766 () Bool)

(assert (=> b!1337380 (= e!761767 e!761766)))

(declare-fun res!887176 () Bool)

(assert (=> b!1337380 (=> res!887176 e!761766)))

(assert (=> b!1337380 (= res!887176 (= (h!32281 (toList!10808 lt!592970)) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1337381 () Bool)

(assert (=> b!1337381 (= e!761766 (contains!8987 (t!45325 (toList!10808 lt!592970)) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!144095 res!887175) b!1337380))

(assert (= (and b!1337380 (not res!887176)) b!1337381))

(declare-fun m!1225779 () Bool)

(assert (=> d!144095 m!1225779))

(declare-fun m!1225781 () Bool)

(assert (=> d!144095 m!1225781))

(declare-fun m!1225783 () Bool)

(assert (=> b!1337381 m!1225783))

(assert (=> b!1337064 d!144095))

(declare-fun d!144097 () Bool)

(assert (=> d!144097 (= (apply!1041 lt!592993 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22127 (getValueByKey!711 (toList!10808 lt!592993) (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(declare-fun bs!38276 () Bool)

(assert (= bs!38276 d!144097))

(assert (=> bs!38276 m!1225361))

(assert (=> bs!38276 m!1225759))

(assert (=> bs!38276 m!1225759))

(declare-fun m!1225785 () Bool)

(assert (=> bs!38276 m!1225785))

(assert (=> b!1337096 d!144097))

(declare-fun d!144099 () Bool)

(declare-fun c!126398 () Bool)

(assert (=> d!144099 (= c!126398 ((_ is ValueCellFull!17549) (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun e!761768 () V!54297)

(assert (=> d!144099 (= (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!761768)))

(declare-fun b!1337382 () Bool)

(assert (=> b!1337382 (= e!761768 (get!22125 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337383 () Bool)

(assert (=> b!1337383 (= e!761768 (get!22126 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144099 c!126398) b!1337382))

(assert (= (and d!144099 (not c!126398)) b!1337383))

(assert (=> b!1337382 m!1225365))

(assert (=> b!1337382 m!1225223))

(declare-fun m!1225787 () Bool)

(assert (=> b!1337382 m!1225787))

(assert (=> b!1337383 m!1225365))

(assert (=> b!1337383 m!1225223))

(declare-fun m!1225789 () Bool)

(assert (=> b!1337383 m!1225789))

(assert (=> b!1337096 d!144099))

(assert (=> bm!64912 d!144019))

(declare-fun call!64933 () Bool)

(declare-fun bm!64930 () Bool)

(declare-fun c!126399 () Bool)

(assert (=> bm!64930 (= call!64933 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126399 (Cons!31064 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126305 (Cons!31064 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) Nil!31065) Nil!31065)) (ite c!126305 (Cons!31064 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) Nil!31065) Nil!31065))))))

(declare-fun b!1337384 () Bool)

(declare-fun e!761770 () Bool)

(declare-fun e!761771 () Bool)

(assert (=> b!1337384 (= e!761770 e!761771)))

(assert (=> b!1337384 (= c!126399 (validKeyInArray!0 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1337385 () Bool)

(declare-fun e!761769 () Bool)

(assert (=> b!1337385 (= e!761769 (contains!8986 (ite c!126305 (Cons!31064 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) Nil!31065) Nil!31065) (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1337386 () Bool)

(assert (=> b!1337386 (= e!761771 call!64933)))

(declare-fun b!1337387 () Bool)

(assert (=> b!1337387 (= e!761771 call!64933)))

(declare-fun b!1337388 () Bool)

(declare-fun e!761772 () Bool)

(assert (=> b!1337388 (= e!761772 e!761770)))

(declare-fun res!887177 () Bool)

(assert (=> b!1337388 (=> (not res!887177) (not e!761770))))

(assert (=> b!1337388 (= res!887177 (not e!761769))))

(declare-fun res!887178 () Bool)

(assert (=> b!1337388 (=> (not res!887178) (not e!761769))))

(assert (=> b!1337388 (= res!887178 (validKeyInArray!0 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!144101 () Bool)

(declare-fun res!887179 () Bool)

(assert (=> d!144101 (=> res!887179 e!761772)))

(assert (=> d!144101 (= res!887179 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44394 _keys!1590)))))

(assert (=> d!144101 (= (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126305 (Cons!31064 (select (arr!43843 _keys!1590) #b00000000000000000000000000000000) Nil!31065) Nil!31065)) e!761772)))

(assert (= (and d!144101 (not res!887179)) b!1337388))

(assert (= (and b!1337388 res!887178) b!1337385))

(assert (= (and b!1337388 res!887177) b!1337384))

(assert (= (and b!1337384 c!126399) b!1337387))

(assert (= (and b!1337384 (not c!126399)) b!1337386))

(assert (= (or b!1337387 b!1337386) bm!64930))

(assert (=> bm!64930 m!1225721))

(declare-fun m!1225791 () Bool)

(assert (=> bm!64930 m!1225791))

(assert (=> b!1337384 m!1225721))

(assert (=> b!1337384 m!1225721))

(assert (=> b!1337384 m!1225731))

(assert (=> b!1337385 m!1225721))

(assert (=> b!1337385 m!1225721))

(declare-fun m!1225793 () Bool)

(assert (=> b!1337385 m!1225793))

(assert (=> b!1337388 m!1225721))

(assert (=> b!1337388 m!1225721))

(assert (=> b!1337388 m!1225731))

(assert (=> bm!64890 d!144101))

(declare-fun d!144103 () Bool)

(declare-fun c!126400 () Bool)

(assert (=> d!144103 (= c!126400 (and ((_ is Cons!31063) (toList!10808 lt!592970)) (= (_1!11971 (h!32281 (toList!10808 lt!592970))) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun e!761773 () Option!762)

(assert (=> d!144103 (= (getValueByKey!711 (toList!10808 lt!592970) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) e!761773)))

(declare-fun b!1337389 () Bool)

(assert (=> b!1337389 (= e!761773 (Some!761 (_2!11971 (h!32281 (toList!10808 lt!592970)))))))

(declare-fun b!1337392 () Bool)

(declare-fun e!761774 () Option!762)

(assert (=> b!1337392 (= e!761774 None!760)))

(declare-fun b!1337391 () Bool)

(assert (=> b!1337391 (= e!761774 (getValueByKey!711 (t!45325 (toList!10808 lt!592970)) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1337390 () Bool)

(assert (=> b!1337390 (= e!761773 e!761774)))

(declare-fun c!126401 () Bool)

(assert (=> b!1337390 (= c!126401 (and ((_ is Cons!31063) (toList!10808 lt!592970)) (not (= (_1!11971 (h!32281 (toList!10808 lt!592970))) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(assert (= (and d!144103 c!126400) b!1337389))

(assert (= (and d!144103 (not c!126400)) b!1337390))

(assert (= (and b!1337390 c!126401) b!1337391))

(assert (= (and b!1337390 (not c!126401)) b!1337392))

(declare-fun m!1225795 () Bool)

(assert (=> b!1337391 m!1225795))

(assert (=> b!1337063 d!144103))

(declare-fun d!144105 () Bool)

(declare-fun lt!593187 () Bool)

(assert (=> d!144105 (= lt!593187 (select (content!657 (toList!10808 lt!592966)) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!761776 () Bool)

(assert (=> d!144105 (= lt!593187 e!761776)))

(declare-fun res!887180 () Bool)

(assert (=> d!144105 (=> (not res!887180) (not e!761776))))

(assert (=> d!144105 (= res!887180 ((_ is Cons!31063) (toList!10808 lt!592966)))))

(assert (=> d!144105 (= (contains!8987 (toList!10808 lt!592966) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!593187)))

(declare-fun b!1337393 () Bool)

(declare-fun e!761775 () Bool)

(assert (=> b!1337393 (= e!761776 e!761775)))

(declare-fun res!887181 () Bool)

(assert (=> b!1337393 (=> res!887181 e!761775)))

(assert (=> b!1337393 (= res!887181 (= (h!32281 (toList!10808 lt!592966)) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337394 () Bool)

(assert (=> b!1337394 (= e!761775 (contains!8987 (t!45325 (toList!10808 lt!592966)) (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144105 res!887180) b!1337393))

(assert (= (and b!1337393 (not res!887181)) b!1337394))

(declare-fun m!1225797 () Bool)

(assert (=> d!144105 m!1225797))

(declare-fun m!1225799 () Bool)

(assert (=> d!144105 m!1225799))

(declare-fun m!1225801 () Bool)

(assert (=> b!1337394 m!1225801))

(assert (=> b!1337062 d!144105))

(assert (=> b!1337094 d!144087))

(declare-fun d!144107 () Bool)

(declare-fun e!761777 () Bool)

(assert (=> d!144107 e!761777))

(declare-fun res!887183 () Bool)

(assert (=> d!144107 (=> (not res!887183) (not e!761777))))

(declare-fun lt!593189 () ListLongMap!21585)

(assert (=> d!144107 (= res!887183 (contains!8983 lt!593189 (_1!11971 (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!593188 () List!31067)

(assert (=> d!144107 (= lt!593189 (ListLongMap!21586 lt!593188))))

(declare-fun lt!593191 () Unit!43828)

(declare-fun lt!593190 () Unit!43828)

(assert (=> d!144107 (= lt!593191 lt!593190)))

(assert (=> d!144107 (= (getValueByKey!711 lt!593188 (_1!11971 (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!761 (_2!11971 (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144107 (= lt!593190 (lemmaContainsTupThenGetReturnValue!361 lt!593188 (_1!11971 (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11971 (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144107 (= lt!593188 (insertStrictlySorted!490 (toList!10808 (ite c!126339 call!64915 (ite c!126338 call!64917 call!64913))) (_1!11971 (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11971 (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!144107 (= (+!4762 (ite c!126339 call!64915 (ite c!126338 call!64917 call!64913)) (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!593189)))

(declare-fun b!1337395 () Bool)

(declare-fun res!887182 () Bool)

(assert (=> b!1337395 (=> (not res!887182) (not e!761777))))

(assert (=> b!1337395 (= res!887182 (= (getValueByKey!711 (toList!10808 lt!593189) (_1!11971 (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!761 (_2!11971 (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1337396 () Bool)

(assert (=> b!1337396 (= e!761777 (contains!8987 (toList!10808 lt!593189) (ite (or c!126339 c!126338) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!144107 res!887183) b!1337395))

(assert (= (and b!1337395 res!887182) b!1337396))

(declare-fun m!1225803 () Bool)

(assert (=> d!144107 m!1225803))

(declare-fun m!1225805 () Bool)

(assert (=> d!144107 m!1225805))

(declare-fun m!1225807 () Bool)

(assert (=> d!144107 m!1225807))

(declare-fun m!1225809 () Bool)

(assert (=> d!144107 m!1225809))

(declare-fun m!1225811 () Bool)

(assert (=> b!1337395 m!1225811))

(declare-fun m!1225813 () Bool)

(assert (=> b!1337396 m!1225813))

(assert (=> bm!64911 d!144107))

(declare-fun c!126402 () Bool)

(declare-fun d!144109 () Bool)

(assert (=> d!144109 (= c!126402 (and ((_ is Cons!31063) (toList!10808 lt!592966)) (= (_1!11971 (h!32281 (toList!10808 lt!592966))) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!761778 () Option!762)

(assert (=> d!144109 (= (getValueByKey!711 (toList!10808 lt!592966) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!761778)))

(declare-fun b!1337397 () Bool)

(assert (=> b!1337397 (= e!761778 (Some!761 (_2!11971 (h!32281 (toList!10808 lt!592966)))))))

(declare-fun b!1337400 () Bool)

(declare-fun e!761779 () Option!762)

(assert (=> b!1337400 (= e!761779 None!760)))

(declare-fun b!1337399 () Bool)

(assert (=> b!1337399 (= e!761779 (getValueByKey!711 (t!45325 (toList!10808 lt!592966)) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337398 () Bool)

(assert (=> b!1337398 (= e!761778 e!761779)))

(declare-fun c!126403 () Bool)

(assert (=> b!1337398 (= c!126403 (and ((_ is Cons!31063) (toList!10808 lt!592966)) (not (= (_1!11971 (h!32281 (toList!10808 lt!592966))) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) from!1980) (get!22123 (select (arr!43842 _values!1320) from!1980) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!144109 c!126402) b!1337397))

(assert (= (and d!144109 (not c!126402)) b!1337398))

(assert (= (and b!1337398 c!126403) b!1337399))

(assert (= (and b!1337398 (not c!126403)) b!1337400))

(declare-fun m!1225815 () Bool)

(assert (=> b!1337399 m!1225815))

(assert (=> b!1337061 d!144109))

(declare-fun d!144111 () Bool)

(declare-fun isEmpty!1087 (List!31067) Bool)

(assert (=> d!144111 (= (isEmpty!1085 lt!592993) (isEmpty!1087 (toList!10808 lt!592993)))))

(declare-fun bs!38277 () Bool)

(assert (= bs!38277 d!144111))

(declare-fun m!1225817 () Bool)

(assert (=> bs!38277 m!1225817))

(assert (=> b!1337093 d!144111))

(declare-fun d!144113 () Bool)

(assert (=> d!144113 (not (contains!8983 (+!4762 lt!592989 (tuple2!23921 lt!592991 lt!592988)) lt!592987))))

(declare-fun lt!593194 () Unit!43828)

(declare-fun choose!1962 (ListLongMap!21585 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43828)

(assert (=> d!144113 (= lt!593194 (choose!1962 lt!592989 lt!592991 lt!592988 lt!592987))))

(declare-fun e!761782 () Bool)

(assert (=> d!144113 e!761782))

(declare-fun res!887186 () Bool)

(assert (=> d!144113 (=> (not res!887186) (not e!761782))))

(assert (=> d!144113 (= res!887186 (not (contains!8983 lt!592989 lt!592987)))))

(assert (=> d!144113 (= (addStillNotContains!497 lt!592989 lt!592991 lt!592988 lt!592987) lt!593194)))

(declare-fun b!1337404 () Bool)

(assert (=> b!1337404 (= e!761782 (not (= lt!592991 lt!592987)))))

(assert (= (and d!144113 res!887186) b!1337404))

(assert (=> d!144113 m!1225377))

(assert (=> d!144113 m!1225377))

(assert (=> d!144113 m!1225379))

(declare-fun m!1225819 () Bool)

(assert (=> d!144113 m!1225819))

(declare-fun m!1225821 () Bool)

(assert (=> d!144113 m!1225821))

(assert (=> b!1337092 d!144113))

(declare-fun d!144115 () Bool)

(declare-fun e!761783 () Bool)

(assert (=> d!144115 e!761783))

(declare-fun res!887188 () Bool)

(assert (=> d!144115 (=> (not res!887188) (not e!761783))))

(declare-fun lt!593196 () ListLongMap!21585)

(assert (=> d!144115 (= res!887188 (contains!8983 lt!593196 (_1!11971 (tuple2!23921 lt!592991 lt!592988))))))

(declare-fun lt!593195 () List!31067)

(assert (=> d!144115 (= lt!593196 (ListLongMap!21586 lt!593195))))

(declare-fun lt!593198 () Unit!43828)

(declare-fun lt!593197 () Unit!43828)

(assert (=> d!144115 (= lt!593198 lt!593197)))

(assert (=> d!144115 (= (getValueByKey!711 lt!593195 (_1!11971 (tuple2!23921 lt!592991 lt!592988))) (Some!761 (_2!11971 (tuple2!23921 lt!592991 lt!592988))))))

(assert (=> d!144115 (= lt!593197 (lemmaContainsTupThenGetReturnValue!361 lt!593195 (_1!11971 (tuple2!23921 lt!592991 lt!592988)) (_2!11971 (tuple2!23921 lt!592991 lt!592988))))))

(assert (=> d!144115 (= lt!593195 (insertStrictlySorted!490 (toList!10808 lt!592989) (_1!11971 (tuple2!23921 lt!592991 lt!592988)) (_2!11971 (tuple2!23921 lt!592991 lt!592988))))))

(assert (=> d!144115 (= (+!4762 lt!592989 (tuple2!23921 lt!592991 lt!592988)) lt!593196)))

(declare-fun b!1337405 () Bool)

(declare-fun res!887187 () Bool)

(assert (=> b!1337405 (=> (not res!887187) (not e!761783))))

(assert (=> b!1337405 (= res!887187 (= (getValueByKey!711 (toList!10808 lt!593196) (_1!11971 (tuple2!23921 lt!592991 lt!592988))) (Some!761 (_2!11971 (tuple2!23921 lt!592991 lt!592988)))))))

(declare-fun b!1337406 () Bool)

(assert (=> b!1337406 (= e!761783 (contains!8987 (toList!10808 lt!593196) (tuple2!23921 lt!592991 lt!592988)))))

(assert (= (and d!144115 res!887188) b!1337405))

(assert (= (and b!1337405 res!887187) b!1337406))

(declare-fun m!1225823 () Bool)

(assert (=> d!144115 m!1225823))

(declare-fun m!1225825 () Bool)

(assert (=> d!144115 m!1225825))

(declare-fun m!1225827 () Bool)

(assert (=> d!144115 m!1225827))

(declare-fun m!1225829 () Bool)

(assert (=> d!144115 m!1225829))

(declare-fun m!1225831 () Bool)

(assert (=> b!1337405 m!1225831))

(declare-fun m!1225833 () Bool)

(assert (=> b!1337406 m!1225833))

(assert (=> b!1337092 d!144115))

(assert (=> b!1337092 d!144099))

(declare-fun d!144117 () Bool)

(declare-fun e!761784 () Bool)

(assert (=> d!144117 e!761784))

(declare-fun res!887190 () Bool)

(assert (=> d!144117 (=> (not res!887190) (not e!761784))))

(declare-fun lt!593200 () ListLongMap!21585)

(assert (=> d!144117 (= res!887190 (contains!8983 lt!593200 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!593199 () List!31067)

(assert (=> d!144117 (= lt!593200 (ListLongMap!21586 lt!593199))))

(declare-fun lt!593202 () Unit!43828)

(declare-fun lt!593201 () Unit!43828)

(assert (=> d!144117 (= lt!593202 lt!593201)))

(assert (=> d!144117 (= (getValueByKey!711 lt!593199 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!761 (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144117 (= lt!593201 (lemmaContainsTupThenGetReturnValue!361 lt!593199 (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144117 (= lt!593199 (insertStrictlySorted!490 (toList!10808 call!64896) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144117 (= (+!4762 call!64896 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!593200)))

(declare-fun b!1337407 () Bool)

(declare-fun res!887189 () Bool)

(assert (=> b!1337407 (=> (not res!887189) (not e!761784))))

(assert (=> b!1337407 (= res!887189 (= (getValueByKey!711 (toList!10808 lt!593200) (_1!11971 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!761 (_2!11971 (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1337408 () Bool)

(assert (=> b!1337408 (= e!761784 (contains!8987 (toList!10808 lt!593200) (tuple2!23921 (select (arr!43843 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22123 (select (arr!43842 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3716 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144117 res!887190) b!1337407))

(assert (= (and b!1337407 res!887189) b!1337408))

(declare-fun m!1225835 () Bool)

(assert (=> d!144117 m!1225835))

(declare-fun m!1225837 () Bool)

(assert (=> d!144117 m!1225837))

(declare-fun m!1225839 () Bool)

(assert (=> d!144117 m!1225839))

(declare-fun m!1225841 () Bool)

(assert (=> d!144117 m!1225841))

(declare-fun m!1225843 () Bool)

(assert (=> b!1337407 m!1225843))

(declare-fun m!1225845 () Bool)

(assert (=> b!1337408 m!1225845))

(assert (=> b!1337092 d!144117))

(declare-fun d!144119 () Bool)

(declare-fun e!761786 () Bool)

(assert (=> d!144119 e!761786))

(declare-fun res!887191 () Bool)

(assert (=> d!144119 (=> res!887191 e!761786)))

(declare-fun lt!593205 () Bool)

(assert (=> d!144119 (= res!887191 (not lt!593205))))

(declare-fun lt!593203 () Bool)

(assert (=> d!144119 (= lt!593205 lt!593203)))

(declare-fun lt!593206 () Unit!43828)

(declare-fun e!761785 () Unit!43828)

(assert (=> d!144119 (= lt!593206 e!761785)))

(declare-fun c!126404 () Bool)

(assert (=> d!144119 (= c!126404 lt!593203)))

(assert (=> d!144119 (= lt!593203 (containsKey!737 (toList!10808 (+!4762 lt!592989 (tuple2!23921 lt!592991 lt!592988))) lt!592987))))

(assert (=> d!144119 (= (contains!8983 (+!4762 lt!592989 (tuple2!23921 lt!592991 lt!592988)) lt!592987) lt!593205)))

(declare-fun b!1337409 () Bool)

(declare-fun lt!593204 () Unit!43828)

(assert (=> b!1337409 (= e!761785 lt!593204)))

(assert (=> b!1337409 (= lt!593204 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10808 (+!4762 lt!592989 (tuple2!23921 lt!592991 lt!592988))) lt!592987))))

(assert (=> b!1337409 (isDefined!520 (getValueByKey!711 (toList!10808 (+!4762 lt!592989 (tuple2!23921 lt!592991 lt!592988))) lt!592987))))

(declare-fun b!1337410 () Bool)

(declare-fun Unit!43842 () Unit!43828)

(assert (=> b!1337410 (= e!761785 Unit!43842)))

(declare-fun b!1337411 () Bool)

(assert (=> b!1337411 (= e!761786 (isDefined!520 (getValueByKey!711 (toList!10808 (+!4762 lt!592989 (tuple2!23921 lt!592991 lt!592988))) lt!592987)))))

(assert (= (and d!144119 c!126404) b!1337409))

(assert (= (and d!144119 (not c!126404)) b!1337410))

(assert (= (and d!144119 (not res!887191)) b!1337411))

(declare-fun m!1225847 () Bool)

(assert (=> d!144119 m!1225847))

(declare-fun m!1225849 () Bool)

(assert (=> b!1337409 m!1225849))

(declare-fun m!1225851 () Bool)

(assert (=> b!1337409 m!1225851))

(assert (=> b!1337409 m!1225851))

(declare-fun m!1225853 () Bool)

(assert (=> b!1337409 m!1225853))

(assert (=> b!1337411 m!1225851))

(assert (=> b!1337411 m!1225851))

(assert (=> b!1337411 m!1225853))

(assert (=> b!1337092 d!144119))

(declare-fun condMapEmpty!57026 () Bool)

(declare-fun mapDefault!57026 () ValueCell!17549)

(assert (=> mapNonEmpty!57025 (= condMapEmpty!57026 (= mapRest!57025 ((as const (Array (_ BitVec 32) ValueCell!17549)) mapDefault!57026)))))

(declare-fun e!761787 () Bool)

(declare-fun mapRes!57026 () Bool)

(assert (=> mapNonEmpty!57025 (= tp!108607 (and e!761787 mapRes!57026))))

(declare-fun mapIsEmpty!57026 () Bool)

(assert (=> mapIsEmpty!57026 mapRes!57026))

(declare-fun b!1337412 () Bool)

(declare-fun e!761788 () Bool)

(assert (=> b!1337412 (= e!761788 tp_is_empty!36895)))

(declare-fun b!1337413 () Bool)

(assert (=> b!1337413 (= e!761787 tp_is_empty!36895)))

(declare-fun mapNonEmpty!57026 () Bool)

(declare-fun tp!108608 () Bool)

(assert (=> mapNonEmpty!57026 (= mapRes!57026 (and tp!108608 e!761788))))

(declare-fun mapRest!57026 () (Array (_ BitVec 32) ValueCell!17549))

(declare-fun mapKey!57026 () (_ BitVec 32))

(declare-fun mapValue!57026 () ValueCell!17549)

(assert (=> mapNonEmpty!57026 (= mapRest!57025 (store mapRest!57026 mapKey!57026 mapValue!57026))))

(assert (= (and mapNonEmpty!57025 condMapEmpty!57026) mapIsEmpty!57026))

(assert (= (and mapNonEmpty!57025 (not condMapEmpty!57026)) mapNonEmpty!57026))

(assert (= (and mapNonEmpty!57026 ((_ is ValueCellFull!17549) mapValue!57026)) b!1337412))

(assert (= (and mapNonEmpty!57025 ((_ is ValueCellFull!17549) mapDefault!57026)) b!1337413))

(declare-fun m!1225855 () Bool)

(assert (=> mapNonEmpty!57026 m!1225855))

(declare-fun b_lambda!24135 () Bool)

(assert (= b_lambda!24133 (or (and start!112814 b_free!30985) b_lambda!24135)))

(declare-fun b_lambda!24137 () Bool)

(assert (= b_lambda!24129 (or (and start!112814 b_free!30985) b_lambda!24137)))

(declare-fun b_lambda!24139 () Bool)

(assert (= b_lambda!24131 (or (and start!112814 b_free!30985) b_lambda!24139)))

(declare-fun b_lambda!24141 () Bool)

(assert (= b_lambda!24127 (or (and start!112814 b_free!30985) b_lambda!24141)))

(check-sat (not b_lambda!24125) (not d!144059) (not d!144093) (not b!1337407) (not d!144003) (not b!1337395) (not d!144045) (not b!1337312) (not b_lambda!24123) (not b!1337367) (not d!144033) (not d!144047) (not b!1337294) (not b!1337200) (not b!1337211) (not d!143997) (not b!1337260) (not b!1337365) (not b!1337242) (not b!1337375) (not b!1337234) (not b!1337239) (not d!144067) (not b!1337257) (not b!1337391) (not b!1337325) (not d!144029) (not b!1337383) (not b!1337304) (not b!1337220) tp_is_empty!36895 (not b!1337238) (not b!1337327) (not d!144069) (not d!144117) (not d!144021) (not d!144041) (not bm!64916) (not b!1337248) (not b!1337399) (not b!1337240) (not b!1337214) (not b!1337224) (not d!144107) (not b!1337364) (not d!144051) (not b!1337228) (not b!1337255) (not b!1337221) (not b!1337258) (not d!144095) (not d!144083) (not bm!64928) (not b!1337243) (not b!1337382) (not b_lambda!24121) (not d!144053) (not d!144119) (not d!143999) (not b!1337394) (not d!144105) (not d!144013) (not b!1337321) (not b!1337356) (not b!1337381) (not b!1337337) (not b!1337369) (not d!144039) (not b!1337250) (not b!1337385) (not d!144111) (not d!144043) (not d!144081) (not b!1337353) (not d!144023) (not bm!64930) (not d!144071) b_and!49919 (not d!144063) (not d!144005) (not b_lambda!24139) (not b!1337326) (not d!144019) (not d!144077) (not b!1337358) (not d!144015) (not d!144007) (not b!1337263) (not d!144017) (not b!1337311) (not b!1337270) (not b!1337291) (not b!1337218) (not d!144001) (not b!1337215) (not b!1337222) (not b!1337313) (not b!1337406) (not bm!64925) (not mapNonEmpty!57026) (not b!1337309) (not b!1337405) (not b!1337316) (not b!1337269) (not b!1337209) (not b!1337230) (not b!1337396) (not b!1337299) (not b!1337254) (not b!1337306) (not d!144055) (not bm!64929) (not b!1337244) (not d!144065) (not b!1337328) (not d!144097) (not b_lambda!24135) (not b!1337388) (not b!1337246) (not d!144075) (not d!144089) (not b!1337411) (not d!144009) (not d!144025) (not b_lambda!24113) (not b!1337384) (not b!1337408) (not b_lambda!24137) (not d!144011) (not b!1337301) (not d!144027) (not b_lambda!24141) (not b!1337253) (not b!1337236) (not d!144113) (not b!1337331) (not b_next!30985) (not b!1337216) (not b!1337217) (not b!1337303) (not b!1337409) (not b!1337231) (not d!144037) (not b!1337213) (not d!144115) (not d!143993) (not bm!64915) (not b!1337323) (not b!1337203) (not b!1337226) (not b!1337202))
(check-sat b_and!49919 (not b_next!30985))
