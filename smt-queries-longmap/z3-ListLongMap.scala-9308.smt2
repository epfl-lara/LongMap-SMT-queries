; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111486 () Bool)

(assert start!111486)

(declare-fun b!1318202 () Bool)

(declare-fun res!874615 () Bool)

(declare-fun e!752181 () Bool)

(assert (=> b!1318202 (=> (not res!874615) (not e!752181))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52785 0))(
  ( (V!52786 (val!17955 Int)) )
))
(declare-datatypes ((ValueCell!16982 0))(
  ( (ValueCellFull!16982 (v!20579 V!52785)) (EmptyCell!16982) )
))
(declare-datatypes ((array!88541 0))(
  ( (array!88542 (arr!42742 (Array (_ BitVec 32) ValueCell!16982)) (size!43293 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88541)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!88543 0))(
  ( (array!88544 (arr!42743 (Array (_ BitVec 32) (_ BitVec 64))) (size!43294 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88543)

(assert (=> b!1318202 (= res!874615 (and (= (size!43293 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43294 _keys!1609) (size!43293 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318203 () Bool)

(declare-fun e!752180 () Bool)

(declare-fun e!752182 () Bool)

(declare-fun mapRes!55283 () Bool)

(assert (=> b!1318203 (= e!752180 (and e!752182 mapRes!55283))))

(declare-fun condMapEmpty!55283 () Bool)

(declare-fun mapDefault!55283 () ValueCell!16982)

(assert (=> b!1318203 (= condMapEmpty!55283 (= (arr!42742 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16982)) mapDefault!55283)))))

(declare-fun b!1318204 () Bool)

(declare-fun res!874614 () Bool)

(assert (=> b!1318204 (=> (not res!874614) (not e!752181))))

(assert (=> b!1318204 (= res!874614 (and (bvsle #b00000000000000000000000000000000 (size!43294 _keys!1609)) (bvslt (size!43294 _keys!1609) #b01111111111111111111111111111111)))))

(declare-fun b!1318205 () Bool)

(declare-fun res!874616 () Bool)

(assert (=> b!1318205 (=> (not res!874616) (not e!752181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88543 (_ BitVec 32)) Bool)

(assert (=> b!1318205 (= res!874616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55283 () Bool)

(declare-fun tp!105389 () Bool)

(declare-fun e!752183 () Bool)

(assert (=> mapNonEmpty!55283 (= mapRes!55283 (and tp!105389 e!752183))))

(declare-fun mapRest!55283 () (Array (_ BitVec 32) ValueCell!16982))

(declare-fun mapKey!55283 () (_ BitVec 32))

(declare-fun mapValue!55283 () ValueCell!16982)

(assert (=> mapNonEmpty!55283 (= (arr!42742 _values!1337) (store mapRest!55283 mapKey!55283 mapValue!55283))))

(declare-fun mapIsEmpty!55283 () Bool)

(assert (=> mapIsEmpty!55283 mapRes!55283))

(declare-fun b!1318206 () Bool)

(declare-fun tp_is_empty!35761 () Bool)

(assert (=> b!1318206 (= e!752182 tp_is_empty!35761)))

(declare-fun res!874613 () Bool)

(assert (=> start!111486 (=> (not res!874613) (not e!752181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111486 (= res!874613 (validMask!0 mask!2019))))

(assert (=> start!111486 e!752181))

(assert (=> start!111486 true))

(declare-fun array_inv!32551 (array!88541) Bool)

(assert (=> start!111486 (and (array_inv!32551 _values!1337) e!752180)))

(declare-fun array_inv!32552 (array!88543) Bool)

(assert (=> start!111486 (array_inv!32552 _keys!1609)))

(declare-fun b!1318207 () Bool)

(declare-datatypes ((List!30322 0))(
  ( (Nil!30319) (Cons!30318 (h!31536 (_ BitVec 64)) (t!43922 List!30322)) )
))
(declare-fun noDuplicate!2077 (List!30322) Bool)

(assert (=> b!1318207 (= e!752181 (not (noDuplicate!2077 Nil!30319)))))

(declare-fun b!1318208 () Bool)

(assert (=> b!1318208 (= e!752183 tp_is_empty!35761)))

(assert (= (and start!111486 res!874613) b!1318202))

(assert (= (and b!1318202 res!874615) b!1318205))

(assert (= (and b!1318205 res!874616) b!1318204))

(assert (= (and b!1318204 res!874614) b!1318207))

(assert (= (and b!1318203 condMapEmpty!55283) mapIsEmpty!55283))

(assert (= (and b!1318203 (not condMapEmpty!55283)) mapNonEmpty!55283))

(get-info :version)

(assert (= (and mapNonEmpty!55283 ((_ is ValueCellFull!16982) mapValue!55283)) b!1318208))

(assert (= (and b!1318203 ((_ is ValueCellFull!16982) mapDefault!55283)) b!1318206))

(assert (= start!111486 b!1318203))

(declare-fun m!1206547 () Bool)

(assert (=> b!1318205 m!1206547))

(declare-fun m!1206549 () Bool)

(assert (=> mapNonEmpty!55283 m!1206549))

(declare-fun m!1206551 () Bool)

(assert (=> start!111486 m!1206551))

(declare-fun m!1206553 () Bool)

(assert (=> start!111486 m!1206553))

(declare-fun m!1206555 () Bool)

(assert (=> start!111486 m!1206555))

(declare-fun m!1206557 () Bool)

(assert (=> b!1318207 m!1206557))

(check-sat (not start!111486) (not b!1318205) (not mapNonEmpty!55283) tp_is_empty!35761 (not b!1318207))
(check-sat)
(get-model)

(declare-fun d!143143 () Bool)

(assert (=> d!143143 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111486 d!143143))

(declare-fun d!143145 () Bool)

(assert (=> d!143145 (= (array_inv!32551 _values!1337) (bvsge (size!43293 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111486 d!143145))

(declare-fun d!143147 () Bool)

(assert (=> d!143147 (= (array_inv!32552 _keys!1609) (bvsge (size!43294 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111486 d!143147))

(declare-fun d!143149 () Bool)

(declare-fun res!874645 () Bool)

(declare-fun e!752218 () Bool)

(assert (=> d!143149 (=> res!874645 e!752218)))

(assert (=> d!143149 (= res!874645 ((_ is Nil!30319) Nil!30319))))

(assert (=> d!143149 (= (noDuplicate!2077 Nil!30319) e!752218)))

(declare-fun b!1318255 () Bool)

(declare-fun e!752219 () Bool)

(assert (=> b!1318255 (= e!752218 e!752219)))

(declare-fun res!874646 () Bool)

(assert (=> b!1318255 (=> (not res!874646) (not e!752219))))

(declare-fun contains!8601 (List!30322 (_ BitVec 64)) Bool)

(assert (=> b!1318255 (= res!874646 (not (contains!8601 (t!43922 Nil!30319) (h!31536 Nil!30319))))))

(declare-fun b!1318256 () Bool)

(assert (=> b!1318256 (= e!752219 (noDuplicate!2077 (t!43922 Nil!30319)))))

(assert (= (and d!143149 (not res!874645)) b!1318255))

(assert (= (and b!1318255 res!874646) b!1318256))

(declare-fun m!1206583 () Bool)

(assert (=> b!1318255 m!1206583))

(declare-fun m!1206585 () Bool)

(assert (=> b!1318256 m!1206585))

(assert (=> b!1318207 d!143149))

(declare-fun d!143151 () Bool)

(declare-fun res!874652 () Bool)

(declare-fun e!752228 () Bool)

(assert (=> d!143151 (=> res!874652 e!752228)))

(assert (=> d!143151 (= res!874652 (bvsge #b00000000000000000000000000000000 (size!43294 _keys!1609)))))

(assert (=> d!143151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!752228)))

(declare-fun b!1318265 () Bool)

(declare-fun e!752226 () Bool)

(declare-fun call!64746 () Bool)

(assert (=> b!1318265 (= e!752226 call!64746)))

(declare-fun b!1318266 () Bool)

(declare-fun e!752227 () Bool)

(assert (=> b!1318266 (= e!752228 e!752227)))

(declare-fun c!126035 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318266 (= c!126035 (validKeyInArray!0 (select (arr!42743 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun bm!64743 () Bool)

(assert (=> bm!64743 (= call!64746 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1318267 () Bool)

(assert (=> b!1318267 (= e!752227 e!752226)))

(declare-fun lt!586773 () (_ BitVec 64))

(assert (=> b!1318267 (= lt!586773 (select (arr!42743 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43381 0))(
  ( (Unit!43382) )
))
(declare-fun lt!586772 () Unit!43381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88543 (_ BitVec 64) (_ BitVec 32)) Unit!43381)

(assert (=> b!1318267 (= lt!586772 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586773 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1318267 (arrayContainsKey!0 _keys!1609 lt!586773 #b00000000000000000000000000000000)))

(declare-fun lt!586774 () Unit!43381)

(assert (=> b!1318267 (= lt!586774 lt!586772)))

(declare-fun res!874651 () Bool)

(declare-datatypes ((SeekEntryResult!9994 0))(
  ( (MissingZero!9994 (index!42347 (_ BitVec 32))) (Found!9994 (index!42348 (_ BitVec 32))) (Intermediate!9994 (undefined!10806 Bool) (index!42349 (_ BitVec 32)) (x!117059 (_ BitVec 32))) (Undefined!9994) (MissingVacant!9994 (index!42350 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88543 (_ BitVec 32)) SeekEntryResult!9994)

(assert (=> b!1318267 (= res!874651 (= (seekEntryOrOpen!0 (select (arr!42743 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!9994 #b00000000000000000000000000000000)))))

(assert (=> b!1318267 (=> (not res!874651) (not e!752226))))

(declare-fun b!1318268 () Bool)

(assert (=> b!1318268 (= e!752227 call!64746)))

(assert (= (and d!143151 (not res!874652)) b!1318266))

(assert (= (and b!1318266 c!126035) b!1318267))

(assert (= (and b!1318266 (not c!126035)) b!1318268))

(assert (= (and b!1318267 res!874651) b!1318265))

(assert (= (or b!1318265 b!1318268) bm!64743))

(declare-fun m!1206587 () Bool)

(assert (=> b!1318266 m!1206587))

(assert (=> b!1318266 m!1206587))

(declare-fun m!1206589 () Bool)

(assert (=> b!1318266 m!1206589))

(declare-fun m!1206591 () Bool)

(assert (=> bm!64743 m!1206591))

(assert (=> b!1318267 m!1206587))

(declare-fun m!1206593 () Bool)

(assert (=> b!1318267 m!1206593))

(declare-fun m!1206595 () Bool)

(assert (=> b!1318267 m!1206595))

(assert (=> b!1318267 m!1206587))

(declare-fun m!1206597 () Bool)

(assert (=> b!1318267 m!1206597))

(assert (=> b!1318205 d!143151))

(declare-fun b!1318276 () Bool)

(declare-fun e!752233 () Bool)

(assert (=> b!1318276 (= e!752233 tp_is_empty!35761)))

(declare-fun mapNonEmpty!55292 () Bool)

(declare-fun mapRes!55292 () Bool)

(declare-fun tp!105398 () Bool)

(declare-fun e!752234 () Bool)

(assert (=> mapNonEmpty!55292 (= mapRes!55292 (and tp!105398 e!752234))))

(declare-fun mapValue!55292 () ValueCell!16982)

(declare-fun mapKey!55292 () (_ BitVec 32))

(declare-fun mapRest!55292 () (Array (_ BitVec 32) ValueCell!16982))

(assert (=> mapNonEmpty!55292 (= mapRest!55283 (store mapRest!55292 mapKey!55292 mapValue!55292))))

(declare-fun condMapEmpty!55292 () Bool)

(declare-fun mapDefault!55292 () ValueCell!16982)

(assert (=> mapNonEmpty!55283 (= condMapEmpty!55292 (= mapRest!55283 ((as const (Array (_ BitVec 32) ValueCell!16982)) mapDefault!55292)))))

(assert (=> mapNonEmpty!55283 (= tp!105389 (and e!752233 mapRes!55292))))

(declare-fun b!1318275 () Bool)

(assert (=> b!1318275 (= e!752234 tp_is_empty!35761)))

(declare-fun mapIsEmpty!55292 () Bool)

(assert (=> mapIsEmpty!55292 mapRes!55292))

(assert (= (and mapNonEmpty!55283 condMapEmpty!55292) mapIsEmpty!55292))

(assert (= (and mapNonEmpty!55283 (not condMapEmpty!55292)) mapNonEmpty!55292))

(assert (= (and mapNonEmpty!55292 ((_ is ValueCellFull!16982) mapValue!55292)) b!1318275))

(assert (= (and mapNonEmpty!55283 ((_ is ValueCellFull!16982) mapDefault!55292)) b!1318276))

(declare-fun m!1206599 () Bool)

(assert (=> mapNonEmpty!55292 m!1206599))

(check-sat (not b!1318266) (not bm!64743) (not mapNonEmpty!55292) (not b!1318267) (not b!1318255) tp_is_empty!35761 (not b!1318256))
(check-sat)
