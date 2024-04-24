; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113170 () Bool)

(assert start!113170)

(declare-fun b!1340239 () Bool)

(declare-fun res!888812 () Bool)

(declare-fun e!763355 () Bool)

(assert (=> b!1340239 (=> (not res!888812) (not e!763355))))

(declare-datatypes ((array!91003 0))(
  ( (array!91004 (arr!43954 (Array (_ BitVec 32) (_ BitVec 64))) (size!44505 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91003)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91003 (_ BitVec 32)) Bool)

(assert (=> b!1340239 (= res!888812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340240 () Bool)

(declare-fun res!888816 () Bool)

(assert (=> b!1340240 (=> (not res!888816) (not e!763355))))

(declare-datatypes ((List!31138 0))(
  ( (Nil!31135) (Cons!31134 (h!32352 (_ BitVec 64)) (t!45462 List!31138)) )
))
(declare-fun noDuplicate!2088 (List!31138) Bool)

(assert (=> b!1340240 (= res!888816 (noDuplicate!2088 Nil!31135))))

(declare-fun b!1340241 () Bool)

(declare-fun res!888815 () Bool)

(assert (=> b!1340241 (=> (not res!888815) (not e!763355))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54449 0))(
  ( (V!54450 (val!18579 Int)) )
))
(declare-datatypes ((ValueCell!17606 0))(
  ( (ValueCellFull!17606 (v!21221 V!54449)) (EmptyCell!17606) )
))
(declare-datatypes ((array!91005 0))(
  ( (array!91006 (arr!43955 (Array (_ BitVec 32) ValueCell!17606)) (size!44506 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91005)

(assert (=> b!1340241 (= res!888815 (and (= (size!44506 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44505 _keys!1571) (size!44506 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340242 () Bool)

(declare-fun e!763354 () Bool)

(assert (=> b!1340242 (= e!763355 e!763354)))

(declare-fun res!888814 () Bool)

(assert (=> b!1340242 (=> res!888814 e!763354)))

(declare-fun contains!9034 (List!31138 (_ BitVec 64)) Bool)

(assert (=> b!1340242 (= res!888814 (contains!9034 Nil!31135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1340243 () Bool)

(declare-fun e!763353 () Bool)

(declare-fun tp_is_empty!37009 () Bool)

(assert (=> b!1340243 (= e!763353 tp_is_empty!37009)))

(declare-fun res!888813 () Bool)

(assert (=> start!113170 (=> (not res!888813) (not e!763355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113170 (= res!888813 (validMask!0 mask!1977))))

(assert (=> start!113170 e!763355))

(assert (=> start!113170 true))

(declare-fun e!763356 () Bool)

(declare-fun array_inv!33411 (array!91005) Bool)

(assert (=> start!113170 (and (array_inv!33411 _values!1303) e!763356)))

(declare-fun array_inv!33412 (array!91003) Bool)

(assert (=> start!113170 (array_inv!33412 _keys!1571)))

(declare-fun b!1340244 () Bool)

(declare-fun res!888811 () Bool)

(assert (=> b!1340244 (=> (not res!888811) (not e!763355))))

(assert (=> b!1340244 (= res!888811 (and (bvsle #b00000000000000000000000000000000 (size!44505 _keys!1571)) (bvslt (size!44505 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!57217 () Bool)

(declare-fun mapRes!57217 () Bool)

(declare-fun tp!108916 () Bool)

(assert (=> mapNonEmpty!57217 (= mapRes!57217 (and tp!108916 e!763353))))

(declare-fun mapRest!57217 () (Array (_ BitVec 32) ValueCell!17606))

(declare-fun mapKey!57217 () (_ BitVec 32))

(declare-fun mapValue!57217 () ValueCell!17606)

(assert (=> mapNonEmpty!57217 (= (arr!43955 _values!1303) (store mapRest!57217 mapKey!57217 mapValue!57217))))

(declare-fun mapIsEmpty!57217 () Bool)

(assert (=> mapIsEmpty!57217 mapRes!57217))

(declare-fun b!1340245 () Bool)

(assert (=> b!1340245 (= e!763354 (contains!9034 Nil!31135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1340246 () Bool)

(declare-fun e!763351 () Bool)

(assert (=> b!1340246 (= e!763356 (and e!763351 mapRes!57217))))

(declare-fun condMapEmpty!57217 () Bool)

(declare-fun mapDefault!57217 () ValueCell!17606)

(assert (=> b!1340246 (= condMapEmpty!57217 (= (arr!43955 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17606)) mapDefault!57217)))))

(declare-fun b!1340247 () Bool)

(assert (=> b!1340247 (= e!763351 tp_is_empty!37009)))

(assert (= (and start!113170 res!888813) b!1340241))

(assert (= (and b!1340241 res!888815) b!1340239))

(assert (= (and b!1340239 res!888812) b!1340244))

(assert (= (and b!1340244 res!888811) b!1340240))

(assert (= (and b!1340240 res!888816) b!1340242))

(assert (= (and b!1340242 (not res!888814)) b!1340245))

(assert (= (and b!1340246 condMapEmpty!57217) mapIsEmpty!57217))

(assert (= (and b!1340246 (not condMapEmpty!57217)) mapNonEmpty!57217))

(get-info :version)

(assert (= (and mapNonEmpty!57217 ((_ is ValueCellFull!17606) mapValue!57217)) b!1340243))

(assert (= (and b!1340246 ((_ is ValueCellFull!17606) mapDefault!57217)) b!1340247))

(assert (= start!113170 b!1340246))

(declare-fun m!1228763 () Bool)

(assert (=> b!1340239 m!1228763))

(declare-fun m!1228765 () Bool)

(assert (=> b!1340245 m!1228765))

(declare-fun m!1228767 () Bool)

(assert (=> mapNonEmpty!57217 m!1228767))

(declare-fun m!1228769 () Bool)

(assert (=> b!1340240 m!1228769))

(declare-fun m!1228771 () Bool)

(assert (=> b!1340242 m!1228771))

(declare-fun m!1228773 () Bool)

(assert (=> start!113170 m!1228773))

(declare-fun m!1228775 () Bool)

(assert (=> start!113170 m!1228775))

(declare-fun m!1228777 () Bool)

(assert (=> start!113170 m!1228777))

(check-sat tp_is_empty!37009 (not b!1340245) (not start!113170) (not b!1340239) (not mapNonEmpty!57217) (not b!1340240) (not b!1340242))
(check-sat)
(get-model)

(declare-fun d!144557 () Bool)

(declare-fun res!888857 () Bool)

(declare-fun e!763397 () Bool)

(assert (=> d!144557 (=> res!888857 e!763397)))

(assert (=> d!144557 (= res!888857 ((_ is Nil!31135) Nil!31135))))

(assert (=> d!144557 (= (noDuplicate!2088 Nil!31135) e!763397)))

(declare-fun b!1340306 () Bool)

(declare-fun e!763398 () Bool)

(assert (=> b!1340306 (= e!763397 e!763398)))

(declare-fun res!888858 () Bool)

(assert (=> b!1340306 (=> (not res!888858) (not e!763398))))

(assert (=> b!1340306 (= res!888858 (not (contains!9034 (t!45462 Nil!31135) (h!32352 Nil!31135))))))

(declare-fun b!1340307 () Bool)

(assert (=> b!1340307 (= e!763398 (noDuplicate!2088 (t!45462 Nil!31135)))))

(assert (= (and d!144557 (not res!888857)) b!1340306))

(assert (= (and b!1340306 res!888858) b!1340307))

(declare-fun m!1228811 () Bool)

(assert (=> b!1340306 m!1228811))

(declare-fun m!1228813 () Bool)

(assert (=> b!1340307 m!1228813))

(assert (=> b!1340240 d!144557))

(declare-fun b!1340316 () Bool)

(declare-fun e!763407 () Bool)

(declare-fun e!763405 () Bool)

(assert (=> b!1340316 (= e!763407 e!763405)))

(declare-fun lt!594295 () (_ BitVec 64))

(assert (=> b!1340316 (= lt!594295 (select (arr!43954 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43926 0))(
  ( (Unit!43927) )
))
(declare-fun lt!594294 () Unit!43926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!91003 (_ BitVec 64) (_ BitVec 32)) Unit!43926)

(assert (=> b!1340316 (= lt!594294 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!594295 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!91003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1340316 (arrayContainsKey!0 _keys!1571 lt!594295 #b00000000000000000000000000000000)))

(declare-fun lt!594293 () Unit!43926)

(assert (=> b!1340316 (= lt!594293 lt!594294)))

(declare-fun res!888863 () Bool)

(declare-datatypes ((SeekEntryResult!10011 0))(
  ( (MissingZero!10011 (index!42415 (_ BitVec 32))) (Found!10011 (index!42416 (_ BitVec 32))) (Intermediate!10011 (undefined!10823 Bool) (index!42417 (_ BitVec 32)) (x!119590 (_ BitVec 32))) (Undefined!10011) (MissingVacant!10011 (index!42418 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!91003 (_ BitVec 32)) SeekEntryResult!10011)

(assert (=> b!1340316 (= res!888863 (= (seekEntryOrOpen!0 (select (arr!43954 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10011 #b00000000000000000000000000000000)))))

(assert (=> b!1340316 (=> (not res!888863) (not e!763405))))

(declare-fun bm!65099 () Bool)

(declare-fun call!65102 () Bool)

(assert (=> bm!65099 (= call!65102 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1340317 () Bool)

(declare-fun e!763406 () Bool)

(assert (=> b!1340317 (= e!763406 e!763407)))

(declare-fun c!126696 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340317 (= c!126696 (validKeyInArray!0 (select (arr!43954 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1340318 () Bool)

(assert (=> b!1340318 (= e!763405 call!65102)))

(declare-fun b!1340319 () Bool)

(assert (=> b!1340319 (= e!763407 call!65102)))

(declare-fun d!144559 () Bool)

(declare-fun res!888864 () Bool)

(assert (=> d!144559 (=> res!888864 e!763406)))

(assert (=> d!144559 (= res!888864 (bvsge #b00000000000000000000000000000000 (size!44505 _keys!1571)))))

(assert (=> d!144559 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!763406)))

(assert (= (and d!144559 (not res!888864)) b!1340317))

(assert (= (and b!1340317 c!126696) b!1340316))

(assert (= (and b!1340317 (not c!126696)) b!1340319))

(assert (= (and b!1340316 res!888863) b!1340318))

(assert (= (or b!1340318 b!1340319) bm!65099))

(declare-fun m!1228815 () Bool)

(assert (=> b!1340316 m!1228815))

(declare-fun m!1228817 () Bool)

(assert (=> b!1340316 m!1228817))

(declare-fun m!1228819 () Bool)

(assert (=> b!1340316 m!1228819))

(assert (=> b!1340316 m!1228815))

(declare-fun m!1228821 () Bool)

(assert (=> b!1340316 m!1228821))

(declare-fun m!1228823 () Bool)

(assert (=> bm!65099 m!1228823))

(assert (=> b!1340317 m!1228815))

(assert (=> b!1340317 m!1228815))

(declare-fun m!1228825 () Bool)

(assert (=> b!1340317 m!1228825))

(assert (=> b!1340239 d!144559))

(declare-fun d!144561 () Bool)

(assert (=> d!144561 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113170 d!144561))

(declare-fun d!144563 () Bool)

(assert (=> d!144563 (= (array_inv!33411 _values!1303) (bvsge (size!44506 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113170 d!144563))

(declare-fun d!144565 () Bool)

(assert (=> d!144565 (= (array_inv!33412 _keys!1571) (bvsge (size!44505 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113170 d!144565))

(declare-fun d!144567 () Bool)

(declare-fun lt!594298 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!661 (List!31138) (InoxSet (_ BitVec 64)))

(assert (=> d!144567 (= lt!594298 (select (content!661 Nil!31135) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!763413 () Bool)

(assert (=> d!144567 (= lt!594298 e!763413)))

(declare-fun res!888869 () Bool)

(assert (=> d!144567 (=> (not res!888869) (not e!763413))))

(assert (=> d!144567 (= res!888869 ((_ is Cons!31134) Nil!31135))))

(assert (=> d!144567 (= (contains!9034 Nil!31135 #b0000000000000000000000000000000000000000000000000000000000000000) lt!594298)))

(declare-fun b!1340324 () Bool)

(declare-fun e!763412 () Bool)

(assert (=> b!1340324 (= e!763413 e!763412)))

(declare-fun res!888870 () Bool)

(assert (=> b!1340324 (=> res!888870 e!763412)))

(assert (=> b!1340324 (= res!888870 (= (h!32352 Nil!31135) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1340325 () Bool)

(assert (=> b!1340325 (= e!763412 (contains!9034 (t!45462 Nil!31135) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144567 res!888869) b!1340324))

(assert (= (and b!1340324 (not res!888870)) b!1340325))

(declare-fun m!1228827 () Bool)

(assert (=> d!144567 m!1228827))

(declare-fun m!1228829 () Bool)

(assert (=> d!144567 m!1228829))

(declare-fun m!1228831 () Bool)

(assert (=> b!1340325 m!1228831))

(assert (=> b!1340242 d!144567))

(declare-fun d!144569 () Bool)

(declare-fun lt!594299 () Bool)

(assert (=> d!144569 (= lt!594299 (select (content!661 Nil!31135) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!763415 () Bool)

(assert (=> d!144569 (= lt!594299 e!763415)))

(declare-fun res!888871 () Bool)

(assert (=> d!144569 (=> (not res!888871) (not e!763415))))

(assert (=> d!144569 (= res!888871 ((_ is Cons!31134) Nil!31135))))

(assert (=> d!144569 (= (contains!9034 Nil!31135 #b1000000000000000000000000000000000000000000000000000000000000000) lt!594299)))

(declare-fun b!1340326 () Bool)

(declare-fun e!763414 () Bool)

(assert (=> b!1340326 (= e!763415 e!763414)))

(declare-fun res!888872 () Bool)

(assert (=> b!1340326 (=> res!888872 e!763414)))

(assert (=> b!1340326 (= res!888872 (= (h!32352 Nil!31135) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1340327 () Bool)

(assert (=> b!1340327 (= e!763414 (contains!9034 (t!45462 Nil!31135) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144569 res!888871) b!1340326))

(assert (= (and b!1340326 (not res!888872)) b!1340327))

(assert (=> d!144569 m!1228827))

(declare-fun m!1228833 () Bool)

(assert (=> d!144569 m!1228833))

(declare-fun m!1228835 () Bool)

(assert (=> b!1340327 m!1228835))

(assert (=> b!1340245 d!144569))

(declare-fun condMapEmpty!57226 () Bool)

(declare-fun mapDefault!57226 () ValueCell!17606)

(assert (=> mapNonEmpty!57217 (= condMapEmpty!57226 (= mapRest!57217 ((as const (Array (_ BitVec 32) ValueCell!17606)) mapDefault!57226)))))

(declare-fun e!763420 () Bool)

(declare-fun mapRes!57226 () Bool)

(assert (=> mapNonEmpty!57217 (= tp!108916 (and e!763420 mapRes!57226))))

(declare-fun b!1340335 () Bool)

(assert (=> b!1340335 (= e!763420 tp_is_empty!37009)))

(declare-fun b!1340334 () Bool)

(declare-fun e!763421 () Bool)

(assert (=> b!1340334 (= e!763421 tp_is_empty!37009)))

(declare-fun mapIsEmpty!57226 () Bool)

(assert (=> mapIsEmpty!57226 mapRes!57226))

(declare-fun mapNonEmpty!57226 () Bool)

(declare-fun tp!108925 () Bool)

(assert (=> mapNonEmpty!57226 (= mapRes!57226 (and tp!108925 e!763421))))

(declare-fun mapRest!57226 () (Array (_ BitVec 32) ValueCell!17606))

(declare-fun mapKey!57226 () (_ BitVec 32))

(declare-fun mapValue!57226 () ValueCell!17606)

(assert (=> mapNonEmpty!57226 (= mapRest!57217 (store mapRest!57226 mapKey!57226 mapValue!57226))))

(assert (= (and mapNonEmpty!57217 condMapEmpty!57226) mapIsEmpty!57226))

(assert (= (and mapNonEmpty!57217 (not condMapEmpty!57226)) mapNonEmpty!57226))

(assert (= (and mapNonEmpty!57226 ((_ is ValueCellFull!17606) mapValue!57226)) b!1340334))

(assert (= (and mapNonEmpty!57217 ((_ is ValueCellFull!17606) mapDefault!57226)) b!1340335))

(declare-fun m!1228837 () Bool)

(assert (=> mapNonEmpty!57226 m!1228837))

(check-sat tp_is_empty!37009 (not b!1340325) (not mapNonEmpty!57226) (not b!1340316) (not d!144567) (not b!1340307) (not b!1340306) (not b!1340327) (not d!144569) (not b!1340317) (not bm!65099))
(check-sat)
