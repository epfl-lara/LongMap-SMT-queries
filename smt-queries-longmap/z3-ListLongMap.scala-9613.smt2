; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113706 () Bool)

(assert start!113706)

(declare-fun b_free!31591 () Bool)

(declare-fun b_next!31591 () Bool)

(assert (=> start!113706 (= b_free!31591 (not b_next!31591))))

(declare-fun tp!110593 () Bool)

(declare-fun b_and!50971 () Bool)

(assert (=> start!113706 (= tp!110593 b_and!50971)))

(declare-fun b!1349502 () Bool)

(declare-fun res!895290 () Bool)

(declare-fun e!767677 () Bool)

(assert (=> b!1349502 (=> (not res!895290) (not e!767677))))

(declare-datatypes ((array!91963 0))(
  ( (array!91964 (arr!44434 (Array (_ BitVec 32) (_ BitVec 64))) (size!44986 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91963)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349502 (= res!895290 (not (validKeyInArray!0 (select (arr!44434 _keys!1571) from!1960))))))

(declare-fun mapIsEmpty!58107 () Bool)

(declare-fun mapRes!58107 () Bool)

(assert (=> mapIsEmpty!58107 mapRes!58107))

(declare-fun b!1349503 () Bool)

(declare-fun e!767680 () Bool)

(declare-fun e!767678 () Bool)

(assert (=> b!1349503 (= e!767680 (and e!767678 mapRes!58107))))

(declare-fun condMapEmpty!58107 () Bool)

(declare-datatypes ((V!55225 0))(
  ( (V!55226 (val!18870 Int)) )
))
(declare-datatypes ((ValueCell!17897 0))(
  ( (ValueCellFull!17897 (v!21525 V!55225)) (EmptyCell!17897) )
))
(declare-datatypes ((array!91965 0))(
  ( (array!91966 (arr!44435 (Array (_ BitVec 32) ValueCell!17897)) (size!44987 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91965)

(declare-fun mapDefault!58107 () ValueCell!17897)

(assert (=> b!1349503 (= condMapEmpty!58107 (= (arr!44435 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17897)) mapDefault!58107)))))

(declare-fun minValue!1245 () V!55225)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55225)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun b!1349505 () Bool)

(declare-datatypes ((tuple2!24408 0))(
  ( (tuple2!24409 (_1!12215 (_ BitVec 64)) (_2!12215 V!55225)) )
))
(declare-datatypes ((List!31539 0))(
  ( (Nil!31536) (Cons!31535 (h!32744 tuple2!24408) (t!46187 List!31539)) )
))
(declare-datatypes ((ListLongMap!22065 0))(
  ( (ListLongMap!22066 (toList!11048 List!31539)) )
))
(declare-fun contains!9159 (ListLongMap!22065 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5879 (array!91963 array!91965 (_ BitVec 32) (_ BitVec 32) V!55225 V!55225 (_ BitVec 32) Int) ListLongMap!22065)

(assert (=> b!1349505 (= e!767677 (not (contains!9159 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142)))))

(declare-fun b!1349506 () Bool)

(declare-fun e!767676 () Bool)

(declare-fun tp_is_empty!37591 () Bool)

(assert (=> b!1349506 (= e!767676 tp_is_empty!37591)))

(declare-fun b!1349507 () Bool)

(declare-fun res!895289 () Bool)

(assert (=> b!1349507 (=> (not res!895289) (not e!767677))))

(assert (=> b!1349507 (= res!895289 (and (= (size!44987 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44986 _keys!1571) (size!44987 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1349508 () Bool)

(assert (=> b!1349508 (= e!767678 tp_is_empty!37591)))

(declare-fun b!1349509 () Bool)

(declare-fun res!895291 () Bool)

(assert (=> b!1349509 (=> (not res!895291) (not e!767677))))

(assert (=> b!1349509 (= res!895291 (not (= (select (arr!44434 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1349510 () Bool)

(declare-fun res!895293 () Bool)

(assert (=> b!1349510 (=> (not res!895293) (not e!767677))))

(assert (=> b!1349510 (= res!895293 (contains!9159 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!58107 () Bool)

(declare-fun tp!110592 () Bool)

(assert (=> mapNonEmpty!58107 (= mapRes!58107 (and tp!110592 e!767676))))

(declare-fun mapKey!58107 () (_ BitVec 32))

(declare-fun mapRest!58107 () (Array (_ BitVec 32) ValueCell!17897))

(declare-fun mapValue!58107 () ValueCell!17897)

(assert (=> mapNonEmpty!58107 (= (arr!44435 _values!1303) (store mapRest!58107 mapKey!58107 mapValue!58107))))

(declare-fun b!1349504 () Bool)

(declare-fun res!895294 () Bool)

(assert (=> b!1349504 (=> (not res!895294) (not e!767677))))

(declare-datatypes ((List!31540 0))(
  ( (Nil!31537) (Cons!31536 (h!32745 (_ BitVec 64)) (t!46188 List!31540)) )
))
(declare-fun arrayNoDuplicates!0 (array!91963 (_ BitVec 32) List!31540) Bool)

(assert (=> b!1349504 (= res!895294 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31537))))

(declare-fun res!895292 () Bool)

(assert (=> start!113706 (=> (not res!895292) (not e!767677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113706 (= res!895292 (validMask!0 mask!1977))))

(assert (=> start!113706 e!767677))

(assert (=> start!113706 tp_is_empty!37591))

(assert (=> start!113706 true))

(declare-fun array_inv!33669 (array!91963) Bool)

(assert (=> start!113706 (array_inv!33669 _keys!1571)))

(declare-fun array_inv!33670 (array!91965) Bool)

(assert (=> start!113706 (and (array_inv!33670 _values!1303) e!767680)))

(assert (=> start!113706 tp!110593))

(declare-fun b!1349511 () Bool)

(declare-fun res!895295 () Bool)

(assert (=> b!1349511 (=> (not res!895295) (not e!767677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91963 (_ BitVec 32)) Bool)

(assert (=> b!1349511 (= res!895295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1349512 () Bool)

(declare-fun res!895288 () Bool)

(assert (=> b!1349512 (=> (not res!895288) (not e!767677))))

(assert (=> b!1349512 (= res!895288 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113706 res!895292) b!1349507))

(assert (= (and b!1349507 res!895289) b!1349511))

(assert (= (and b!1349511 res!895295) b!1349504))

(assert (= (and b!1349504 res!895294) b!1349512))

(assert (= (and b!1349512 res!895288) b!1349510))

(assert (= (and b!1349510 res!895293) b!1349509))

(assert (= (and b!1349509 res!895291) b!1349502))

(assert (= (and b!1349502 res!895290) b!1349505))

(assert (= (and b!1349503 condMapEmpty!58107) mapIsEmpty!58107))

(assert (= (and b!1349503 (not condMapEmpty!58107)) mapNonEmpty!58107))

(get-info :version)

(assert (= (and mapNonEmpty!58107 ((_ is ValueCellFull!17897) mapValue!58107)) b!1349506))

(assert (= (and b!1349503 ((_ is ValueCellFull!17897) mapDefault!58107)) b!1349508))

(assert (= start!113706 b!1349503))

(declare-fun m!1236155 () Bool)

(assert (=> start!113706 m!1236155))

(declare-fun m!1236157 () Bool)

(assert (=> start!113706 m!1236157))

(declare-fun m!1236159 () Bool)

(assert (=> start!113706 m!1236159))

(declare-fun m!1236161 () Bool)

(assert (=> b!1349502 m!1236161))

(assert (=> b!1349502 m!1236161))

(declare-fun m!1236163 () Bool)

(assert (=> b!1349502 m!1236163))

(declare-fun m!1236165 () Bool)

(assert (=> b!1349510 m!1236165))

(assert (=> b!1349510 m!1236165))

(declare-fun m!1236167 () Bool)

(assert (=> b!1349510 m!1236167))

(declare-fun m!1236169 () Bool)

(assert (=> b!1349511 m!1236169))

(declare-fun m!1236171 () Bool)

(assert (=> mapNonEmpty!58107 m!1236171))

(assert (=> b!1349509 m!1236161))

(declare-fun m!1236173 () Bool)

(assert (=> b!1349505 m!1236173))

(assert (=> b!1349505 m!1236173))

(declare-fun m!1236175 () Bool)

(assert (=> b!1349505 m!1236175))

(declare-fun m!1236177 () Bool)

(assert (=> b!1349504 m!1236177))

(check-sat (not b!1349511) (not b!1349502) b_and!50971 (not b!1349505) (not b_next!31591) tp_is_empty!37591 (not b!1349510) (not mapNonEmpty!58107) (not start!113706) (not b!1349504))
(check-sat b_and!50971 (not b_next!31591))
(get-model)

(declare-fun b!1349587 () Bool)

(declare-fun e!767717 () Bool)

(declare-fun e!767719 () Bool)

(assert (=> b!1349587 (= e!767717 e!767719)))

(declare-fun lt!596430 () (_ BitVec 64))

(assert (=> b!1349587 (= lt!596430 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!44044 0))(
  ( (Unit!44045) )
))
(declare-fun lt!596432 () Unit!44044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!91963 (_ BitVec 64) (_ BitVec 32)) Unit!44044)

(assert (=> b!1349587 (= lt!596432 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596430 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!91963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1349587 (arrayContainsKey!0 _keys!1571 lt!596430 #b00000000000000000000000000000000)))

(declare-fun lt!596431 () Unit!44044)

(assert (=> b!1349587 (= lt!596431 lt!596432)))

(declare-fun res!895349 () Bool)

(declare-datatypes ((SeekEntryResult!10059 0))(
  ( (MissingZero!10059 (index!42607 (_ BitVec 32))) (Found!10059 (index!42608 (_ BitVec 32))) (Intermediate!10059 (undefined!10871 Bool) (index!42609 (_ BitVec 32)) (x!120775 (_ BitVec 32))) (Undefined!10059) (MissingVacant!10059 (index!42610 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!91963 (_ BitVec 32)) SeekEntryResult!10059)

(assert (=> b!1349587 (= res!895349 (= (seekEntryOrOpen!0 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10059 #b00000000000000000000000000000000)))))

(assert (=> b!1349587 (=> (not res!895349) (not e!767719))))

(declare-fun d!144575 () Bool)

(declare-fun res!895348 () Bool)

(declare-fun e!767718 () Bool)

(assert (=> d!144575 (=> res!895348 e!767718)))

(assert (=> d!144575 (= res!895348 (bvsge #b00000000000000000000000000000000 (size!44986 _keys!1571)))))

(assert (=> d!144575 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!767718)))

(declare-fun b!1349588 () Bool)

(declare-fun call!65184 () Bool)

(assert (=> b!1349588 (= e!767719 call!65184)))

(declare-fun bm!65181 () Bool)

(assert (=> bm!65181 (= call!65184 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1349589 () Bool)

(assert (=> b!1349589 (= e!767717 call!65184)))

(declare-fun b!1349590 () Bool)

(assert (=> b!1349590 (= e!767718 e!767717)))

(declare-fun c!126587 () Bool)

(assert (=> b!1349590 (= c!126587 (validKeyInArray!0 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144575 (not res!895348)) b!1349590))

(assert (= (and b!1349590 c!126587) b!1349587))

(assert (= (and b!1349590 (not c!126587)) b!1349589))

(assert (= (and b!1349587 res!895349) b!1349588))

(assert (= (or b!1349588 b!1349589) bm!65181))

(declare-fun m!1236227 () Bool)

(assert (=> b!1349587 m!1236227))

(declare-fun m!1236229 () Bool)

(assert (=> b!1349587 m!1236229))

(declare-fun m!1236231 () Bool)

(assert (=> b!1349587 m!1236231))

(assert (=> b!1349587 m!1236227))

(declare-fun m!1236233 () Bool)

(assert (=> b!1349587 m!1236233))

(declare-fun m!1236235 () Bool)

(assert (=> bm!65181 m!1236235))

(assert (=> b!1349590 m!1236227))

(assert (=> b!1349590 m!1236227))

(declare-fun m!1236237 () Bool)

(assert (=> b!1349590 m!1236237))

(assert (=> b!1349511 d!144575))

(declare-fun d!144577 () Bool)

(assert (=> d!144577 (= (validKeyInArray!0 (select (arr!44434 _keys!1571) from!1960)) (and (not (= (select (arr!44434 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44434 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349502 d!144577))

(declare-fun d!144579 () Bool)

(declare-fun e!767725 () Bool)

(assert (=> d!144579 e!767725))

(declare-fun res!895352 () Bool)

(assert (=> d!144579 (=> res!895352 e!767725)))

(declare-fun lt!596442 () Bool)

(assert (=> d!144579 (= res!895352 (not lt!596442))))

(declare-fun lt!596444 () Bool)

(assert (=> d!144579 (= lt!596442 lt!596444)))

(declare-fun lt!596443 () Unit!44044)

(declare-fun e!767724 () Unit!44044)

(assert (=> d!144579 (= lt!596443 e!767724)))

(declare-fun c!126590 () Bool)

(assert (=> d!144579 (= c!126590 lt!596444)))

(declare-fun containsKey!744 (List!31539 (_ BitVec 64)) Bool)

(assert (=> d!144579 (= lt!596444 (containsKey!744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144579 (= (contains!9159 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!596442)))

(declare-fun b!1349597 () Bool)

(declare-fun lt!596441 () Unit!44044)

(assert (=> b!1349597 (= e!767724 lt!596441)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!491 (List!31539 (_ BitVec 64)) Unit!44044)

(assert (=> b!1349597 (= lt!596441 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-datatypes ((Option!778 0))(
  ( (Some!777 (v!21528 V!55225)) (None!776) )
))
(declare-fun isDefined!534 (Option!778) Bool)

(declare-fun getValueByKey!727 (List!31539 (_ BitVec 64)) Option!778)

(assert (=> b!1349597 (isDefined!534 (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1349598 () Bool)

(declare-fun Unit!44046 () Unit!44044)

(assert (=> b!1349598 (= e!767724 Unit!44046)))

(declare-fun b!1349599 () Bool)

(assert (=> b!1349599 (= e!767725 (isDefined!534 (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144579 c!126590) b!1349597))

(assert (= (and d!144579 (not c!126590)) b!1349598))

(assert (= (and d!144579 (not res!895352)) b!1349599))

(declare-fun m!1236239 () Bool)

(assert (=> d!144579 m!1236239))

(declare-fun m!1236241 () Bool)

(assert (=> b!1349597 m!1236241))

(declare-fun m!1236243 () Bool)

(assert (=> b!1349597 m!1236243))

(assert (=> b!1349597 m!1236243))

(declare-fun m!1236245 () Bool)

(assert (=> b!1349597 m!1236245))

(assert (=> b!1349599 m!1236243))

(assert (=> b!1349599 m!1236243))

(assert (=> b!1349599 m!1236245))

(assert (=> b!1349510 d!144579))

(declare-fun bm!65196 () Bool)

(declare-fun call!65204 () ListLongMap!22065)

(declare-fun call!65199 () ListLongMap!22065)

(assert (=> bm!65196 (= call!65204 call!65199)))

(declare-fun b!1349642 () Bool)

(declare-fun c!126604 () Bool)

(assert (=> b!1349642 (= c!126604 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!767753 () ListLongMap!22065)

(declare-fun e!767754 () ListLongMap!22065)

(assert (=> b!1349642 (= e!767753 e!767754)))

(declare-fun lt!596507 () ListLongMap!22065)

(declare-fun e!767752 () Bool)

(declare-fun b!1349643 () Bool)

(declare-fun apply!1034 (ListLongMap!22065 (_ BitVec 64)) V!55225)

(declare-fun get!22468 (ValueCell!17897 V!55225) V!55225)

(declare-fun dynLambda!3818 (Int (_ BitVec 64)) V!55225)

(assert (=> b!1349643 (= e!767752 (= (apply!1034 lt!596507 (select (arr!44434 _keys!1571) from!1960)) (get!22468 (select (arr!44435 _values!1303) from!1960) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349643 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44987 _values!1303)))))

(assert (=> b!1349643 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun b!1349645 () Bool)

(declare-fun e!767763 () Bool)

(declare-fun e!767755 () Bool)

(assert (=> b!1349645 (= e!767763 e!767755)))

(declare-fun c!126608 () Bool)

(assert (=> b!1349645 (= c!126608 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65197 () Bool)

(declare-fun call!65203 () ListLongMap!22065)

(declare-fun call!65200 () ListLongMap!22065)

(assert (=> bm!65197 (= call!65203 call!65200)))

(declare-fun b!1349646 () Bool)

(declare-fun res!895371 () Bool)

(assert (=> b!1349646 (=> (not res!895371) (not e!767763))))

(declare-fun e!767762 () Bool)

(assert (=> b!1349646 (= res!895371 e!767762)))

(declare-fun c!126606 () Bool)

(assert (=> b!1349646 (= c!126606 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1349647 () Bool)

(declare-fun call!65202 () ListLongMap!22065)

(assert (=> b!1349647 (= e!767754 call!65202)))

(declare-fun b!1349648 () Bool)

(declare-fun call!65205 () Bool)

(assert (=> b!1349648 (= e!767755 (not call!65205))))

(declare-fun b!1349649 () Bool)

(declare-fun e!767758 () Bool)

(assert (=> b!1349649 (= e!767758 (= (apply!1034 lt!596507 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1349650 () Bool)

(declare-fun e!767761 () ListLongMap!22065)

(declare-fun +!4888 (ListLongMap!22065 tuple2!24408) ListLongMap!22065)

(assert (=> b!1349650 (= e!767761 (+!4888 call!65200 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun c!126603 () Bool)

(declare-fun bm!65198 () Bool)

(declare-fun c!126605 () Bool)

(assert (=> bm!65198 (= call!65200 (+!4888 (ite c!126603 call!65199 (ite c!126605 call!65204 call!65202)) (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun bm!65199 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6536 (array!91963 array!91965 (_ BitVec 32) (_ BitVec 32) V!55225 V!55225 (_ BitVec 32) Int) ListLongMap!22065)

(assert (=> bm!65199 (= call!65199 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun bm!65200 () Bool)

(assert (=> bm!65200 (= call!65205 (contains!9159 lt!596507 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349651 () Bool)

(declare-fun res!895377 () Bool)

(assert (=> b!1349651 (=> (not res!895377) (not e!767763))))

(declare-fun e!767756 () Bool)

(assert (=> b!1349651 (= res!895377 e!767756)))

(declare-fun res!895375 () Bool)

(assert (=> b!1349651 (=> res!895375 e!767756)))

(declare-fun e!767757 () Bool)

(assert (=> b!1349651 (= res!895375 (not e!767757))))

(declare-fun res!895376 () Bool)

(assert (=> b!1349651 (=> (not res!895376) (not e!767757))))

(assert (=> b!1349651 (= res!895376 (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun bm!65201 () Bool)

(assert (=> bm!65201 (= call!65202 call!65204)))

(declare-fun b!1349652 () Bool)

(assert (=> b!1349652 (= e!767761 e!767753)))

(assert (=> b!1349652 (= c!126605 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349653 () Bool)

(declare-fun e!767764 () Bool)

(assert (=> b!1349653 (= e!767762 e!767764)))

(declare-fun res!895378 () Bool)

(declare-fun call!65201 () Bool)

(assert (=> b!1349653 (= res!895378 call!65201)))

(assert (=> b!1349653 (=> (not res!895378) (not e!767764))))

(declare-fun b!1349654 () Bool)

(assert (=> b!1349654 (= e!767754 call!65203)))

(declare-fun b!1349655 () Bool)

(assert (=> b!1349655 (= e!767764 (= (apply!1034 lt!596507 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1349644 () Bool)

(assert (=> b!1349644 (= e!767756 e!767752)))

(declare-fun res!895373 () Bool)

(assert (=> b!1349644 (=> (not res!895373) (not e!767752))))

(assert (=> b!1349644 (= res!895373 (contains!9159 lt!596507 (select (arr!44434 _keys!1571) from!1960)))))

(assert (=> b!1349644 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun d!144581 () Bool)

(assert (=> d!144581 e!767763))

(declare-fun res!895374 () Bool)

(assert (=> d!144581 (=> (not res!895374) (not e!767763))))

(assert (=> d!144581 (= res!895374 (or (bvsge from!1960 (size!44986 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)))))))

(declare-fun lt!596509 () ListLongMap!22065)

(assert (=> d!144581 (= lt!596507 lt!596509)))

(declare-fun lt!596503 () Unit!44044)

(declare-fun e!767760 () Unit!44044)

(assert (=> d!144581 (= lt!596503 e!767760)))

(declare-fun c!126607 () Bool)

(declare-fun e!767759 () Bool)

(assert (=> d!144581 (= c!126607 e!767759)))

(declare-fun res!895379 () Bool)

(assert (=> d!144581 (=> (not res!895379) (not e!767759))))

(assert (=> d!144581 (= res!895379 (bvslt from!1960 (size!44986 _keys!1571)))))

(assert (=> d!144581 (= lt!596509 e!767761)))

(assert (=> d!144581 (= c!126603 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144581 (validMask!0 mask!1977)))

(assert (=> d!144581 (= (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596507)))

(declare-fun b!1349656 () Bool)

(assert (=> b!1349656 (= e!767755 e!767758)))

(declare-fun res!895372 () Bool)

(assert (=> b!1349656 (= res!895372 call!65205)))

(assert (=> b!1349656 (=> (not res!895372) (not e!767758))))

(declare-fun b!1349657 () Bool)

(assert (=> b!1349657 (= e!767757 (validKeyInArray!0 (select (arr!44434 _keys!1571) from!1960)))))

(declare-fun b!1349658 () Bool)

(assert (=> b!1349658 (= e!767762 (not call!65201))))

(declare-fun b!1349659 () Bool)

(assert (=> b!1349659 (= e!767759 (validKeyInArray!0 (select (arr!44434 _keys!1571) from!1960)))))

(declare-fun bm!65202 () Bool)

(assert (=> bm!65202 (= call!65201 (contains!9159 lt!596507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349660 () Bool)

(declare-fun Unit!44047 () Unit!44044)

(assert (=> b!1349660 (= e!767760 Unit!44047)))

(declare-fun b!1349661 () Bool)

(declare-fun lt!596497 () Unit!44044)

(assert (=> b!1349661 (= e!767760 lt!596497)))

(declare-fun lt!596490 () ListLongMap!22065)

(assert (=> b!1349661 (= lt!596490 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596498 () (_ BitVec 64))

(assert (=> b!1349661 (= lt!596498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596506 () (_ BitVec 64))

(assert (=> b!1349661 (= lt!596506 (select (arr!44434 _keys!1571) from!1960))))

(declare-fun lt!596496 () Unit!44044)

(declare-fun addStillContains!1211 (ListLongMap!22065 (_ BitVec 64) V!55225 (_ BitVec 64)) Unit!44044)

(assert (=> b!1349661 (= lt!596496 (addStillContains!1211 lt!596490 lt!596498 zeroValue!1245 lt!596506))))

(assert (=> b!1349661 (contains!9159 (+!4888 lt!596490 (tuple2!24409 lt!596498 zeroValue!1245)) lt!596506)))

(declare-fun lt!596493 () Unit!44044)

(assert (=> b!1349661 (= lt!596493 lt!596496)))

(declare-fun lt!596499 () ListLongMap!22065)

(assert (=> b!1349661 (= lt!596499 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596510 () (_ BitVec 64))

(assert (=> b!1349661 (= lt!596510 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596502 () (_ BitVec 64))

(assert (=> b!1349661 (= lt!596502 (select (arr!44434 _keys!1571) from!1960))))

(declare-fun lt!596500 () Unit!44044)

(declare-fun addApplyDifferent!572 (ListLongMap!22065 (_ BitVec 64) V!55225 (_ BitVec 64)) Unit!44044)

(assert (=> b!1349661 (= lt!596500 (addApplyDifferent!572 lt!596499 lt!596510 minValue!1245 lt!596502))))

(assert (=> b!1349661 (= (apply!1034 (+!4888 lt!596499 (tuple2!24409 lt!596510 minValue!1245)) lt!596502) (apply!1034 lt!596499 lt!596502))))

(declare-fun lt!596505 () Unit!44044)

(assert (=> b!1349661 (= lt!596505 lt!596500)))

(declare-fun lt!596495 () ListLongMap!22065)

(assert (=> b!1349661 (= lt!596495 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596504 () (_ BitVec 64))

(assert (=> b!1349661 (= lt!596504 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596489 () (_ BitVec 64))

(assert (=> b!1349661 (= lt!596489 (select (arr!44434 _keys!1571) from!1960))))

(declare-fun lt!596491 () Unit!44044)

(assert (=> b!1349661 (= lt!596491 (addApplyDifferent!572 lt!596495 lt!596504 zeroValue!1245 lt!596489))))

(assert (=> b!1349661 (= (apply!1034 (+!4888 lt!596495 (tuple2!24409 lt!596504 zeroValue!1245)) lt!596489) (apply!1034 lt!596495 lt!596489))))

(declare-fun lt!596494 () Unit!44044)

(assert (=> b!1349661 (= lt!596494 lt!596491)))

(declare-fun lt!596492 () ListLongMap!22065)

(assert (=> b!1349661 (= lt!596492 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596508 () (_ BitVec 64))

(assert (=> b!1349661 (= lt!596508 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596501 () (_ BitVec 64))

(assert (=> b!1349661 (= lt!596501 (select (arr!44434 _keys!1571) from!1960))))

(assert (=> b!1349661 (= lt!596497 (addApplyDifferent!572 lt!596492 lt!596508 minValue!1245 lt!596501))))

(assert (=> b!1349661 (= (apply!1034 (+!4888 lt!596492 (tuple2!24409 lt!596508 minValue!1245)) lt!596501) (apply!1034 lt!596492 lt!596501))))

(declare-fun b!1349662 () Bool)

(assert (=> b!1349662 (= e!767753 call!65203)))

(assert (= (and d!144581 c!126603) b!1349650))

(assert (= (and d!144581 (not c!126603)) b!1349652))

(assert (= (and b!1349652 c!126605) b!1349662))

(assert (= (and b!1349652 (not c!126605)) b!1349642))

(assert (= (and b!1349642 c!126604) b!1349654))

(assert (= (and b!1349642 (not c!126604)) b!1349647))

(assert (= (or b!1349654 b!1349647) bm!65201))

(assert (= (or b!1349662 bm!65201) bm!65196))

(assert (= (or b!1349662 b!1349654) bm!65197))

(assert (= (or b!1349650 bm!65196) bm!65199))

(assert (= (or b!1349650 bm!65197) bm!65198))

(assert (= (and d!144581 res!895379) b!1349659))

(assert (= (and d!144581 c!126607) b!1349661))

(assert (= (and d!144581 (not c!126607)) b!1349660))

(assert (= (and d!144581 res!895374) b!1349651))

(assert (= (and b!1349651 res!895376) b!1349657))

(assert (= (and b!1349651 (not res!895375)) b!1349644))

(assert (= (and b!1349644 res!895373) b!1349643))

(assert (= (and b!1349651 res!895377) b!1349646))

(assert (= (and b!1349646 c!126606) b!1349653))

(assert (= (and b!1349646 (not c!126606)) b!1349658))

(assert (= (and b!1349653 res!895378) b!1349655))

(assert (= (or b!1349653 b!1349658) bm!65202))

(assert (= (and b!1349646 res!895371) b!1349645))

(assert (= (and b!1349645 c!126608) b!1349656))

(assert (= (and b!1349645 (not c!126608)) b!1349648))

(assert (= (and b!1349656 res!895372) b!1349649))

(assert (= (or b!1349656 b!1349648) bm!65200))

(declare-fun b_lambda!24709 () Bool)

(assert (=> (not b_lambda!24709) (not b!1349643)))

(declare-fun t!46193 () Bool)

(declare-fun tb!12453 () Bool)

(assert (=> (and start!113706 (= defaultEntry!1306 defaultEntry!1306) t!46193) tb!12453))

(declare-fun result!26013 () Bool)

(assert (=> tb!12453 (= result!26013 tp_is_empty!37591)))

(assert (=> b!1349643 t!46193))

(declare-fun b_and!50977 () Bool)

(assert (= b_and!50971 (and (=> t!46193 result!26013) b_and!50977)))

(declare-fun m!1236247 () Bool)

(assert (=> b!1349643 m!1236247))

(declare-fun m!1236249 () Bool)

(assert (=> b!1349643 m!1236249))

(declare-fun m!1236251 () Bool)

(assert (=> b!1349643 m!1236251))

(assert (=> b!1349643 m!1236161))

(assert (=> b!1349643 m!1236249))

(assert (=> b!1349643 m!1236161))

(declare-fun m!1236253 () Bool)

(assert (=> b!1349643 m!1236253))

(assert (=> b!1349643 m!1236247))

(assert (=> b!1349659 m!1236161))

(assert (=> b!1349659 m!1236161))

(assert (=> b!1349659 m!1236163))

(assert (=> b!1349644 m!1236161))

(assert (=> b!1349644 m!1236161))

(declare-fun m!1236255 () Bool)

(assert (=> b!1349644 m!1236255))

(declare-fun m!1236257 () Bool)

(assert (=> b!1349655 m!1236257))

(declare-fun m!1236259 () Bool)

(assert (=> b!1349650 m!1236259))

(declare-fun m!1236261 () Bool)

(assert (=> bm!65198 m!1236261))

(assert (=> b!1349657 m!1236161))

(assert (=> b!1349657 m!1236161))

(assert (=> b!1349657 m!1236163))

(declare-fun m!1236263 () Bool)

(assert (=> bm!65202 m!1236263))

(declare-fun m!1236265 () Bool)

(assert (=> bm!65199 m!1236265))

(declare-fun m!1236267 () Bool)

(assert (=> bm!65200 m!1236267))

(declare-fun m!1236269 () Bool)

(assert (=> b!1349661 m!1236269))

(declare-fun m!1236271 () Bool)

(assert (=> b!1349661 m!1236271))

(assert (=> b!1349661 m!1236265))

(declare-fun m!1236273 () Bool)

(assert (=> b!1349661 m!1236273))

(declare-fun m!1236275 () Bool)

(assert (=> b!1349661 m!1236275))

(declare-fun m!1236277 () Bool)

(assert (=> b!1349661 m!1236277))

(declare-fun m!1236279 () Bool)

(assert (=> b!1349661 m!1236279))

(declare-fun m!1236281 () Bool)

(assert (=> b!1349661 m!1236281))

(assert (=> b!1349661 m!1236279))

(declare-fun m!1236283 () Bool)

(assert (=> b!1349661 m!1236283))

(declare-fun m!1236285 () Bool)

(assert (=> b!1349661 m!1236285))

(declare-fun m!1236287 () Bool)

(assert (=> b!1349661 m!1236287))

(assert (=> b!1349661 m!1236283))

(declare-fun m!1236289 () Bool)

(assert (=> b!1349661 m!1236289))

(assert (=> b!1349661 m!1236161))

(declare-fun m!1236291 () Bool)

(assert (=> b!1349661 m!1236291))

(declare-fun m!1236293 () Bool)

(assert (=> b!1349661 m!1236293))

(assert (=> b!1349661 m!1236273))

(declare-fun m!1236295 () Bool)

(assert (=> b!1349661 m!1236295))

(assert (=> b!1349661 m!1236287))

(declare-fun m!1236297 () Bool)

(assert (=> b!1349661 m!1236297))

(declare-fun m!1236299 () Bool)

(assert (=> b!1349649 m!1236299))

(assert (=> d!144581 m!1236155))

(assert (=> b!1349510 d!144581))

(declare-fun d!144583 () Bool)

(assert (=> d!144583 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113706 d!144583))

(declare-fun d!144585 () Bool)

(assert (=> d!144585 (= (array_inv!33669 _keys!1571) (bvsge (size!44986 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113706 d!144585))

(declare-fun d!144587 () Bool)

(assert (=> d!144587 (= (array_inv!33670 _values!1303) (bvsge (size!44987 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113706 d!144587))

(declare-fun d!144589 () Bool)

(declare-fun e!767766 () Bool)

(assert (=> d!144589 e!767766))

(declare-fun res!895380 () Bool)

(assert (=> d!144589 (=> res!895380 e!767766)))

(declare-fun lt!596512 () Bool)

(assert (=> d!144589 (= res!895380 (not lt!596512))))

(declare-fun lt!596514 () Bool)

(assert (=> d!144589 (= lt!596512 lt!596514)))

(declare-fun lt!596513 () Unit!44044)

(declare-fun e!767765 () Unit!44044)

(assert (=> d!144589 (= lt!596513 e!767765)))

(declare-fun c!126609 () Bool)

(assert (=> d!144589 (= c!126609 lt!596514)))

(assert (=> d!144589 (= lt!596514 (containsKey!744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> d!144589 (= (contains!9159 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142) lt!596512)))

(declare-fun b!1349665 () Bool)

(declare-fun lt!596511 () Unit!44044)

(assert (=> b!1349665 (= e!767765 lt!596511)))

(assert (=> b!1349665 (= lt!596511 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> b!1349665 (isDefined!534 (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun b!1349666 () Bool)

(declare-fun Unit!44048 () Unit!44044)

(assert (=> b!1349666 (= e!767765 Unit!44048)))

(declare-fun b!1349667 () Bool)

(assert (=> b!1349667 (= e!767766 (isDefined!534 (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144589 c!126609) b!1349665))

(assert (= (and d!144589 (not c!126609)) b!1349666))

(assert (= (and d!144589 (not res!895380)) b!1349667))

(declare-fun m!1236301 () Bool)

(assert (=> d!144589 m!1236301))

(declare-fun m!1236303 () Bool)

(assert (=> b!1349665 m!1236303))

(declare-fun m!1236305 () Bool)

(assert (=> b!1349665 m!1236305))

(assert (=> b!1349665 m!1236305))

(declare-fun m!1236307 () Bool)

(assert (=> b!1349665 m!1236307))

(assert (=> b!1349667 m!1236305))

(assert (=> b!1349667 m!1236305))

(assert (=> b!1349667 m!1236307))

(assert (=> b!1349505 d!144589))

(declare-fun bm!65203 () Bool)

(declare-fun call!65211 () ListLongMap!22065)

(declare-fun call!65206 () ListLongMap!22065)

(assert (=> bm!65203 (= call!65211 call!65206)))

(declare-fun b!1349668 () Bool)

(declare-fun c!126611 () Bool)

(assert (=> b!1349668 (= c!126611 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!767768 () ListLongMap!22065)

(declare-fun e!767769 () ListLongMap!22065)

(assert (=> b!1349668 (= e!767768 e!767769)))

(declare-fun e!767767 () Bool)

(declare-fun b!1349669 () Bool)

(declare-fun lt!596533 () ListLongMap!22065)

(assert (=> b!1349669 (= e!767767 (= (apply!1034 lt!596533 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22468 (select (arr!44435 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349669 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44987 _values!1303)))))

(assert (=> b!1349669 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(declare-fun b!1349671 () Bool)

(declare-fun e!767778 () Bool)

(declare-fun e!767770 () Bool)

(assert (=> b!1349671 (= e!767778 e!767770)))

(declare-fun c!126615 () Bool)

(assert (=> b!1349671 (= c!126615 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65204 () Bool)

(declare-fun call!65210 () ListLongMap!22065)

(declare-fun call!65207 () ListLongMap!22065)

(assert (=> bm!65204 (= call!65210 call!65207)))

(declare-fun b!1349672 () Bool)

(declare-fun res!895381 () Bool)

(assert (=> b!1349672 (=> (not res!895381) (not e!767778))))

(declare-fun e!767777 () Bool)

(assert (=> b!1349672 (= res!895381 e!767777)))

(declare-fun c!126613 () Bool)

(assert (=> b!1349672 (= c!126613 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1349673 () Bool)

(declare-fun call!65209 () ListLongMap!22065)

(assert (=> b!1349673 (= e!767769 call!65209)))

(declare-fun b!1349674 () Bool)

(declare-fun call!65212 () Bool)

(assert (=> b!1349674 (= e!767770 (not call!65212))))

(declare-fun b!1349675 () Bool)

(declare-fun e!767773 () Bool)

(assert (=> b!1349675 (= e!767773 (= (apply!1034 lt!596533 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1349676 () Bool)

(declare-fun e!767776 () ListLongMap!22065)

(assert (=> b!1349676 (= e!767776 (+!4888 call!65207 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun bm!65205 () Bool)

(declare-fun c!126610 () Bool)

(declare-fun c!126612 () Bool)

(assert (=> bm!65205 (= call!65207 (+!4888 (ite c!126610 call!65206 (ite c!126612 call!65211 call!65209)) (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun bm!65206 () Bool)

(assert (=> bm!65206 (= call!65206 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun bm!65207 () Bool)

(assert (=> bm!65207 (= call!65212 (contains!9159 lt!596533 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349677 () Bool)

(declare-fun res!895387 () Bool)

(assert (=> b!1349677 (=> (not res!895387) (not e!767778))))

(declare-fun e!767771 () Bool)

(assert (=> b!1349677 (= res!895387 e!767771)))

(declare-fun res!895385 () Bool)

(assert (=> b!1349677 (=> res!895385 e!767771)))

(declare-fun e!767772 () Bool)

(assert (=> b!1349677 (= res!895385 (not e!767772))))

(declare-fun res!895386 () Bool)

(assert (=> b!1349677 (=> (not res!895386) (not e!767772))))

(assert (=> b!1349677 (= res!895386 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(declare-fun bm!65208 () Bool)

(assert (=> bm!65208 (= call!65209 call!65211)))

(declare-fun b!1349678 () Bool)

(assert (=> b!1349678 (= e!767776 e!767768)))

(assert (=> b!1349678 (= c!126612 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349679 () Bool)

(declare-fun e!767779 () Bool)

(assert (=> b!1349679 (= e!767777 e!767779)))

(declare-fun res!895388 () Bool)

(declare-fun call!65208 () Bool)

(assert (=> b!1349679 (= res!895388 call!65208)))

(assert (=> b!1349679 (=> (not res!895388) (not e!767779))))

(declare-fun b!1349680 () Bool)

(assert (=> b!1349680 (= e!767769 call!65210)))

(declare-fun b!1349681 () Bool)

(assert (=> b!1349681 (= e!767779 (= (apply!1034 lt!596533 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1349670 () Bool)

(assert (=> b!1349670 (= e!767771 e!767767)))

(declare-fun res!895383 () Bool)

(assert (=> b!1349670 (=> (not res!895383) (not e!767767))))

(assert (=> b!1349670 (= res!895383 (contains!9159 lt!596533 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349670 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(declare-fun d!144591 () Bool)

(assert (=> d!144591 e!767778))

(declare-fun res!895384 () Bool)

(assert (=> d!144591 (=> (not res!895384) (not e!767778))))

(assert (=> d!144591 (= res!895384 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))))

(declare-fun lt!596535 () ListLongMap!22065)

(assert (=> d!144591 (= lt!596533 lt!596535)))

(declare-fun lt!596529 () Unit!44044)

(declare-fun e!767775 () Unit!44044)

(assert (=> d!144591 (= lt!596529 e!767775)))

(declare-fun c!126614 () Bool)

(declare-fun e!767774 () Bool)

(assert (=> d!144591 (= c!126614 e!767774)))

(declare-fun res!895389 () Bool)

(assert (=> d!144591 (=> (not res!895389) (not e!767774))))

(assert (=> d!144591 (= res!895389 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(assert (=> d!144591 (= lt!596535 e!767776)))

(assert (=> d!144591 (= c!126610 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144591 (validMask!0 mask!1977)))

(assert (=> d!144591 (= (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596533)))

(declare-fun b!1349682 () Bool)

(assert (=> b!1349682 (= e!767770 e!767773)))

(declare-fun res!895382 () Bool)

(assert (=> b!1349682 (= res!895382 call!65212)))

(assert (=> b!1349682 (=> (not res!895382) (not e!767773))))

(declare-fun b!1349683 () Bool)

(assert (=> b!1349683 (= e!767772 (validKeyInArray!0 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1349684 () Bool)

(assert (=> b!1349684 (= e!767777 (not call!65208))))

(declare-fun b!1349685 () Bool)

(assert (=> b!1349685 (= e!767774 (validKeyInArray!0 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun bm!65209 () Bool)

(assert (=> bm!65209 (= call!65208 (contains!9159 lt!596533 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349686 () Bool)

(declare-fun Unit!44049 () Unit!44044)

(assert (=> b!1349686 (= e!767775 Unit!44049)))

(declare-fun b!1349687 () Bool)

(declare-fun lt!596523 () Unit!44044)

(assert (=> b!1349687 (= e!767775 lt!596523)))

(declare-fun lt!596516 () ListLongMap!22065)

(assert (=> b!1349687 (= lt!596516 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596524 () (_ BitVec 64))

(assert (=> b!1349687 (= lt!596524 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596532 () (_ BitVec 64))

(assert (=> b!1349687 (= lt!596532 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596522 () Unit!44044)

(assert (=> b!1349687 (= lt!596522 (addStillContains!1211 lt!596516 lt!596524 zeroValue!1245 lt!596532))))

(assert (=> b!1349687 (contains!9159 (+!4888 lt!596516 (tuple2!24409 lt!596524 zeroValue!1245)) lt!596532)))

(declare-fun lt!596519 () Unit!44044)

(assert (=> b!1349687 (= lt!596519 lt!596522)))

(declare-fun lt!596525 () ListLongMap!22065)

(assert (=> b!1349687 (= lt!596525 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596536 () (_ BitVec 64))

(assert (=> b!1349687 (= lt!596536 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596528 () (_ BitVec 64))

(assert (=> b!1349687 (= lt!596528 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596526 () Unit!44044)

(assert (=> b!1349687 (= lt!596526 (addApplyDifferent!572 lt!596525 lt!596536 minValue!1245 lt!596528))))

(assert (=> b!1349687 (= (apply!1034 (+!4888 lt!596525 (tuple2!24409 lt!596536 minValue!1245)) lt!596528) (apply!1034 lt!596525 lt!596528))))

(declare-fun lt!596531 () Unit!44044)

(assert (=> b!1349687 (= lt!596531 lt!596526)))

(declare-fun lt!596521 () ListLongMap!22065)

(assert (=> b!1349687 (= lt!596521 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596530 () (_ BitVec 64))

(assert (=> b!1349687 (= lt!596530 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596515 () (_ BitVec 64))

(assert (=> b!1349687 (= lt!596515 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596517 () Unit!44044)

(assert (=> b!1349687 (= lt!596517 (addApplyDifferent!572 lt!596521 lt!596530 zeroValue!1245 lt!596515))))

(assert (=> b!1349687 (= (apply!1034 (+!4888 lt!596521 (tuple2!24409 lt!596530 zeroValue!1245)) lt!596515) (apply!1034 lt!596521 lt!596515))))

(declare-fun lt!596520 () Unit!44044)

(assert (=> b!1349687 (= lt!596520 lt!596517)))

(declare-fun lt!596518 () ListLongMap!22065)

(assert (=> b!1349687 (= lt!596518 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596534 () (_ BitVec 64))

(assert (=> b!1349687 (= lt!596534 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596527 () (_ BitVec 64))

(assert (=> b!1349687 (= lt!596527 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1349687 (= lt!596523 (addApplyDifferent!572 lt!596518 lt!596534 minValue!1245 lt!596527))))

(assert (=> b!1349687 (= (apply!1034 (+!4888 lt!596518 (tuple2!24409 lt!596534 minValue!1245)) lt!596527) (apply!1034 lt!596518 lt!596527))))

(declare-fun b!1349688 () Bool)

(assert (=> b!1349688 (= e!767768 call!65210)))

(assert (= (and d!144591 c!126610) b!1349676))

(assert (= (and d!144591 (not c!126610)) b!1349678))

(assert (= (and b!1349678 c!126612) b!1349688))

(assert (= (and b!1349678 (not c!126612)) b!1349668))

(assert (= (and b!1349668 c!126611) b!1349680))

(assert (= (and b!1349668 (not c!126611)) b!1349673))

(assert (= (or b!1349680 b!1349673) bm!65208))

(assert (= (or b!1349688 bm!65208) bm!65203))

(assert (= (or b!1349688 b!1349680) bm!65204))

(assert (= (or b!1349676 bm!65203) bm!65206))

(assert (= (or b!1349676 bm!65204) bm!65205))

(assert (= (and d!144591 res!895389) b!1349685))

(assert (= (and d!144591 c!126614) b!1349687))

(assert (= (and d!144591 (not c!126614)) b!1349686))

(assert (= (and d!144591 res!895384) b!1349677))

(assert (= (and b!1349677 res!895386) b!1349683))

(assert (= (and b!1349677 (not res!895385)) b!1349670))

(assert (= (and b!1349670 res!895383) b!1349669))

(assert (= (and b!1349677 res!895387) b!1349672))

(assert (= (and b!1349672 c!126613) b!1349679))

(assert (= (and b!1349672 (not c!126613)) b!1349684))

(assert (= (and b!1349679 res!895388) b!1349681))

(assert (= (or b!1349679 b!1349684) bm!65209))

(assert (= (and b!1349672 res!895381) b!1349671))

(assert (= (and b!1349671 c!126615) b!1349682))

(assert (= (and b!1349671 (not c!126615)) b!1349674))

(assert (= (and b!1349682 res!895382) b!1349675))

(assert (= (or b!1349682 b!1349674) bm!65207))

(declare-fun b_lambda!24711 () Bool)

(assert (=> (not b_lambda!24711) (not b!1349669)))

(assert (=> b!1349669 t!46193))

(declare-fun b_and!50979 () Bool)

(assert (= b_and!50977 (and (=> t!46193 result!26013) b_and!50979)))

(declare-fun m!1236309 () Bool)

(assert (=> b!1349669 m!1236309))

(assert (=> b!1349669 m!1236249))

(declare-fun m!1236311 () Bool)

(assert (=> b!1349669 m!1236311))

(declare-fun m!1236313 () Bool)

(assert (=> b!1349669 m!1236313))

(assert (=> b!1349669 m!1236249))

(assert (=> b!1349669 m!1236313))

(declare-fun m!1236315 () Bool)

(assert (=> b!1349669 m!1236315))

(assert (=> b!1349669 m!1236309))

(assert (=> b!1349685 m!1236313))

(assert (=> b!1349685 m!1236313))

(declare-fun m!1236317 () Bool)

(assert (=> b!1349685 m!1236317))

(assert (=> b!1349670 m!1236313))

(assert (=> b!1349670 m!1236313))

(declare-fun m!1236319 () Bool)

(assert (=> b!1349670 m!1236319))

(declare-fun m!1236321 () Bool)

(assert (=> b!1349681 m!1236321))

(declare-fun m!1236323 () Bool)

(assert (=> b!1349676 m!1236323))

(declare-fun m!1236325 () Bool)

(assert (=> bm!65205 m!1236325))

(assert (=> b!1349683 m!1236313))

(assert (=> b!1349683 m!1236313))

(assert (=> b!1349683 m!1236317))

(declare-fun m!1236327 () Bool)

(assert (=> bm!65209 m!1236327))

(declare-fun m!1236329 () Bool)

(assert (=> bm!65206 m!1236329))

(declare-fun m!1236331 () Bool)

(assert (=> bm!65207 m!1236331))

(declare-fun m!1236333 () Bool)

(assert (=> b!1349687 m!1236333))

(declare-fun m!1236335 () Bool)

(assert (=> b!1349687 m!1236335))

(assert (=> b!1349687 m!1236329))

(declare-fun m!1236337 () Bool)

(assert (=> b!1349687 m!1236337))

(declare-fun m!1236339 () Bool)

(assert (=> b!1349687 m!1236339))

(declare-fun m!1236341 () Bool)

(assert (=> b!1349687 m!1236341))

(declare-fun m!1236343 () Bool)

(assert (=> b!1349687 m!1236343))

(declare-fun m!1236345 () Bool)

(assert (=> b!1349687 m!1236345))

(assert (=> b!1349687 m!1236343))

(declare-fun m!1236347 () Bool)

(assert (=> b!1349687 m!1236347))

(declare-fun m!1236349 () Bool)

(assert (=> b!1349687 m!1236349))

(declare-fun m!1236351 () Bool)

(assert (=> b!1349687 m!1236351))

(assert (=> b!1349687 m!1236347))

(declare-fun m!1236353 () Bool)

(assert (=> b!1349687 m!1236353))

(assert (=> b!1349687 m!1236313))

(declare-fun m!1236355 () Bool)

(assert (=> b!1349687 m!1236355))

(declare-fun m!1236357 () Bool)

(assert (=> b!1349687 m!1236357))

(assert (=> b!1349687 m!1236337))

(declare-fun m!1236359 () Bool)

(assert (=> b!1349687 m!1236359))

(assert (=> b!1349687 m!1236351))

(declare-fun m!1236361 () Bool)

(assert (=> b!1349687 m!1236361))

(declare-fun m!1236363 () Bool)

(assert (=> b!1349675 m!1236363))

(assert (=> d!144591 m!1236155))

(assert (=> b!1349505 d!144591))

(declare-fun b!1349699 () Bool)

(declare-fun e!767790 () Bool)

(declare-fun e!767788 () Bool)

(assert (=> b!1349699 (= e!767790 e!767788)))

(declare-fun res!895397 () Bool)

(assert (=> b!1349699 (=> (not res!895397) (not e!767788))))

(declare-fun e!767789 () Bool)

(assert (=> b!1349699 (= res!895397 (not e!767789))))

(declare-fun res!895398 () Bool)

(assert (=> b!1349699 (=> (not res!895398) (not e!767789))))

(assert (=> b!1349699 (= res!895398 (validKeyInArray!0 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun bm!65212 () Bool)

(declare-fun call!65215 () Bool)

(declare-fun c!126618 () Bool)

(assert (=> bm!65212 (= call!65215 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126618 (Cons!31536 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) Nil!31537) Nil!31537)))))

(declare-fun b!1349700 () Bool)

(declare-fun e!767791 () Bool)

(assert (=> b!1349700 (= e!767791 call!65215)))

(declare-fun b!1349701 () Bool)

(assert (=> b!1349701 (= e!767788 e!767791)))

(assert (=> b!1349701 (= c!126618 (validKeyInArray!0 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun d!144593 () Bool)

(declare-fun res!895396 () Bool)

(assert (=> d!144593 (=> res!895396 e!767790)))

(assert (=> d!144593 (= res!895396 (bvsge #b00000000000000000000000000000000 (size!44986 _keys!1571)))))

(assert (=> d!144593 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31537) e!767790)))

(declare-fun b!1349702 () Bool)

(assert (=> b!1349702 (= e!767791 call!65215)))

(declare-fun b!1349703 () Bool)

(declare-fun contains!9162 (List!31540 (_ BitVec 64)) Bool)

(assert (=> b!1349703 (= e!767789 (contains!9162 Nil!31537 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144593 (not res!895396)) b!1349699))

(assert (= (and b!1349699 res!895398) b!1349703))

(assert (= (and b!1349699 res!895397) b!1349701))

(assert (= (and b!1349701 c!126618) b!1349702))

(assert (= (and b!1349701 (not c!126618)) b!1349700))

(assert (= (or b!1349702 b!1349700) bm!65212))

(assert (=> b!1349699 m!1236227))

(assert (=> b!1349699 m!1236227))

(assert (=> b!1349699 m!1236237))

(assert (=> bm!65212 m!1236227))

(declare-fun m!1236365 () Bool)

(assert (=> bm!65212 m!1236365))

(assert (=> b!1349701 m!1236227))

(assert (=> b!1349701 m!1236227))

(assert (=> b!1349701 m!1236237))

(assert (=> b!1349703 m!1236227))

(assert (=> b!1349703 m!1236227))

(declare-fun m!1236367 () Bool)

(assert (=> b!1349703 m!1236367))

(assert (=> b!1349504 d!144593))

(declare-fun b!1349710 () Bool)

(declare-fun e!767797 () Bool)

(assert (=> b!1349710 (= e!767797 tp_is_empty!37591)))

(declare-fun mapNonEmpty!58116 () Bool)

(declare-fun mapRes!58116 () Bool)

(declare-fun tp!110608 () Bool)

(assert (=> mapNonEmpty!58116 (= mapRes!58116 (and tp!110608 e!767797))))

(declare-fun mapKey!58116 () (_ BitVec 32))

(declare-fun mapValue!58116 () ValueCell!17897)

(declare-fun mapRest!58116 () (Array (_ BitVec 32) ValueCell!17897))

(assert (=> mapNonEmpty!58116 (= mapRest!58107 (store mapRest!58116 mapKey!58116 mapValue!58116))))

(declare-fun condMapEmpty!58116 () Bool)

(declare-fun mapDefault!58116 () ValueCell!17897)

(assert (=> mapNonEmpty!58107 (= condMapEmpty!58116 (= mapRest!58107 ((as const (Array (_ BitVec 32) ValueCell!17897)) mapDefault!58116)))))

(declare-fun e!767796 () Bool)

(assert (=> mapNonEmpty!58107 (= tp!110592 (and e!767796 mapRes!58116))))

(declare-fun mapIsEmpty!58116 () Bool)

(assert (=> mapIsEmpty!58116 mapRes!58116))

(declare-fun b!1349711 () Bool)

(assert (=> b!1349711 (= e!767796 tp_is_empty!37591)))

(assert (= (and mapNonEmpty!58107 condMapEmpty!58116) mapIsEmpty!58116))

(assert (= (and mapNonEmpty!58107 (not condMapEmpty!58116)) mapNonEmpty!58116))

(assert (= (and mapNonEmpty!58116 ((_ is ValueCellFull!17897) mapValue!58116)) b!1349710))

(assert (= (and mapNonEmpty!58107 ((_ is ValueCellFull!17897) mapDefault!58116)) b!1349711))

(declare-fun m!1236369 () Bool)

(assert (=> mapNonEmpty!58116 m!1236369))

(declare-fun b_lambda!24713 () Bool)

(assert (= b_lambda!24709 (or (and start!113706 b_free!31591) b_lambda!24713)))

(declare-fun b_lambda!24715 () Bool)

(assert (= b_lambda!24711 (or (and start!113706 b_free!31591) b_lambda!24715)))

(check-sat (not b!1349681) (not b!1349590) (not b!1349597) (not b!1349703) (not d!144581) (not b!1349687) (not b!1349685) (not b!1349667) (not b!1349701) (not bm!65209) (not b_lambda!24715) (not b!1349650) (not d!144591) (not b!1349665) (not bm!65202) (not bm!65212) (not bm!65181) (not bm!65199) (not bm!65200) (not b!1349587) (not b!1349657) (not bm!65198) (not mapNonEmpty!58116) (not b!1349699) b_and!50979 (not bm!65205) (not b!1349669) (not b!1349655) (not b!1349599) (not b!1349659) (not b!1349649) (not b!1349670) (not b_next!31591) (not b!1349676) (not b!1349661) (not bm!65206) (not b!1349675) (not b!1349644) (not d!144589) (not bm!65207) (not b!1349683) (not b!1349643) tp_is_empty!37591 (not d!144579) (not b_lambda!24713))
(check-sat b_and!50979 (not b_next!31591))
(get-model)

(declare-fun d!144595 () Bool)

(assert (=> d!144595 (= (validKeyInArray!0 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (and (not (= (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349683 d!144595))

(declare-fun d!144597 () Bool)

(declare-fun get!22469 (Option!778) V!55225)

(assert (=> d!144597 (= (apply!1034 lt!596533 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22469 (getValueByKey!727 (toList!11048 lt!596533) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38659 () Bool)

(assert (= bs!38659 d!144597))

(declare-fun m!1236371 () Bool)

(assert (=> bs!38659 m!1236371))

(assert (=> bs!38659 m!1236371))

(declare-fun m!1236373 () Bool)

(assert (=> bs!38659 m!1236373))

(assert (=> b!1349681 d!144597))

(assert (=> b!1349657 d!144577))

(declare-fun d!144599 () Bool)

(assert (=> d!144599 (= (apply!1034 lt!596507 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22469 (getValueByKey!727 (toList!11048 lt!596507) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38660 () Bool)

(assert (= bs!38660 d!144599))

(declare-fun m!1236375 () Bool)

(assert (=> bs!38660 m!1236375))

(assert (=> bs!38660 m!1236375))

(declare-fun m!1236377 () Bool)

(assert (=> bs!38660 m!1236377))

(assert (=> b!1349655 d!144599))

(declare-fun d!144601 () Bool)

(declare-fun isEmpty!1105 (Option!778) Bool)

(assert (=> d!144601 (= (isDefined!534 (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)) (not (isEmpty!1105 (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38661 () Bool)

(assert (= bs!38661 d!144601))

(assert (=> bs!38661 m!1236305))

(declare-fun m!1236379 () Bool)

(assert (=> bs!38661 m!1236379))

(assert (=> b!1349667 d!144601))

(declare-fun d!144603 () Bool)

(declare-fun c!126623 () Bool)

(assert (=> d!144603 (= c!126623 (and ((_ is Cons!31535) (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)))))

(declare-fun e!767802 () Option!778)

(assert (=> d!144603 (= (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142) e!767802)))

(declare-fun b!1349722 () Bool)

(declare-fun e!767803 () Option!778)

(assert (=> b!1349722 (= e!767803 (getValueByKey!727 (t!46187 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) k0!1142))))

(declare-fun b!1349723 () Bool)

(assert (=> b!1349723 (= e!767803 None!776)))

(declare-fun b!1349721 () Bool)

(assert (=> b!1349721 (= e!767802 e!767803)))

(declare-fun c!126624 () Bool)

(assert (=> b!1349721 (= c!126624 (and ((_ is Cons!31535) (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (not (= (_1!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142))))))

(declare-fun b!1349720 () Bool)

(assert (=> b!1349720 (= e!767802 (Some!777 (_2!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))))))

(assert (= (and d!144603 c!126623) b!1349720))

(assert (= (and d!144603 (not c!126623)) b!1349721))

(assert (= (and b!1349721 c!126624) b!1349722))

(assert (= (and b!1349721 (not c!126624)) b!1349723))

(declare-fun m!1236381 () Bool)

(assert (=> b!1349722 m!1236381))

(assert (=> b!1349667 d!144603))

(assert (=> d!144581 d!144583))

(declare-fun d!144605 () Bool)

(assert (=> d!144605 (= (apply!1034 (+!4888 lt!596525 (tuple2!24409 lt!596536 minValue!1245)) lt!596528) (get!22469 (getValueByKey!727 (toList!11048 (+!4888 lt!596525 (tuple2!24409 lt!596536 minValue!1245))) lt!596528)))))

(declare-fun bs!38662 () Bool)

(assert (= bs!38662 d!144605))

(declare-fun m!1236383 () Bool)

(assert (=> bs!38662 m!1236383))

(assert (=> bs!38662 m!1236383))

(declare-fun m!1236385 () Bool)

(assert (=> bs!38662 m!1236385))

(assert (=> b!1349687 d!144605))

(declare-fun d!144607 () Bool)

(declare-fun e!767805 () Bool)

(assert (=> d!144607 e!767805))

(declare-fun res!895399 () Bool)

(assert (=> d!144607 (=> res!895399 e!767805)))

(declare-fun lt!596538 () Bool)

(assert (=> d!144607 (= res!895399 (not lt!596538))))

(declare-fun lt!596540 () Bool)

(assert (=> d!144607 (= lt!596538 lt!596540)))

(declare-fun lt!596539 () Unit!44044)

(declare-fun e!767804 () Unit!44044)

(assert (=> d!144607 (= lt!596539 e!767804)))

(declare-fun c!126625 () Bool)

(assert (=> d!144607 (= c!126625 lt!596540)))

(assert (=> d!144607 (= lt!596540 (containsKey!744 (toList!11048 (+!4888 lt!596516 (tuple2!24409 lt!596524 zeroValue!1245))) lt!596532))))

(assert (=> d!144607 (= (contains!9159 (+!4888 lt!596516 (tuple2!24409 lt!596524 zeroValue!1245)) lt!596532) lt!596538)))

(declare-fun b!1349724 () Bool)

(declare-fun lt!596537 () Unit!44044)

(assert (=> b!1349724 (= e!767804 lt!596537)))

(assert (=> b!1349724 (= lt!596537 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 (+!4888 lt!596516 (tuple2!24409 lt!596524 zeroValue!1245))) lt!596532))))

(assert (=> b!1349724 (isDefined!534 (getValueByKey!727 (toList!11048 (+!4888 lt!596516 (tuple2!24409 lt!596524 zeroValue!1245))) lt!596532))))

(declare-fun b!1349725 () Bool)

(declare-fun Unit!44050 () Unit!44044)

(assert (=> b!1349725 (= e!767804 Unit!44050)))

(declare-fun b!1349726 () Bool)

(assert (=> b!1349726 (= e!767805 (isDefined!534 (getValueByKey!727 (toList!11048 (+!4888 lt!596516 (tuple2!24409 lt!596524 zeroValue!1245))) lt!596532)))))

(assert (= (and d!144607 c!126625) b!1349724))

(assert (= (and d!144607 (not c!126625)) b!1349725))

(assert (= (and d!144607 (not res!895399)) b!1349726))

(declare-fun m!1236387 () Bool)

(assert (=> d!144607 m!1236387))

(declare-fun m!1236389 () Bool)

(assert (=> b!1349724 m!1236389))

(declare-fun m!1236391 () Bool)

(assert (=> b!1349724 m!1236391))

(assert (=> b!1349724 m!1236391))

(declare-fun m!1236393 () Bool)

(assert (=> b!1349724 m!1236393))

(assert (=> b!1349726 m!1236391))

(assert (=> b!1349726 m!1236391))

(assert (=> b!1349726 m!1236393))

(assert (=> b!1349687 d!144607))

(declare-fun d!144609 () Bool)

(assert (=> d!144609 (= (apply!1034 lt!596525 lt!596528) (get!22469 (getValueByKey!727 (toList!11048 lt!596525) lt!596528)))))

(declare-fun bs!38663 () Bool)

(assert (= bs!38663 d!144609))

(declare-fun m!1236395 () Bool)

(assert (=> bs!38663 m!1236395))

(assert (=> bs!38663 m!1236395))

(declare-fun m!1236397 () Bool)

(assert (=> bs!38663 m!1236397))

(assert (=> b!1349687 d!144609))

(declare-fun d!144611 () Bool)

(assert (=> d!144611 (contains!9159 (+!4888 lt!596516 (tuple2!24409 lt!596524 zeroValue!1245)) lt!596532)))

(declare-fun lt!596543 () Unit!44044)

(declare-fun choose!1993 (ListLongMap!22065 (_ BitVec 64) V!55225 (_ BitVec 64)) Unit!44044)

(assert (=> d!144611 (= lt!596543 (choose!1993 lt!596516 lt!596524 zeroValue!1245 lt!596532))))

(assert (=> d!144611 (contains!9159 lt!596516 lt!596532)))

(assert (=> d!144611 (= (addStillContains!1211 lt!596516 lt!596524 zeroValue!1245 lt!596532) lt!596543)))

(declare-fun bs!38664 () Bool)

(assert (= bs!38664 d!144611))

(assert (=> bs!38664 m!1236347))

(assert (=> bs!38664 m!1236347))

(assert (=> bs!38664 m!1236353))

(declare-fun m!1236399 () Bool)

(assert (=> bs!38664 m!1236399))

(declare-fun m!1236401 () Bool)

(assert (=> bs!38664 m!1236401))

(assert (=> b!1349687 d!144611))

(declare-fun d!144613 () Bool)

(assert (=> d!144613 (= (apply!1034 lt!596518 lt!596527) (get!22469 (getValueByKey!727 (toList!11048 lt!596518) lt!596527)))))

(declare-fun bs!38665 () Bool)

(assert (= bs!38665 d!144613))

(declare-fun m!1236403 () Bool)

(assert (=> bs!38665 m!1236403))

(assert (=> bs!38665 m!1236403))

(declare-fun m!1236405 () Bool)

(assert (=> bs!38665 m!1236405))

(assert (=> b!1349687 d!144613))

(declare-fun d!144615 () Bool)

(declare-fun e!767808 () Bool)

(assert (=> d!144615 e!767808))

(declare-fun res!895405 () Bool)

(assert (=> d!144615 (=> (not res!895405) (not e!767808))))

(declare-fun lt!596554 () ListLongMap!22065)

(assert (=> d!144615 (= res!895405 (contains!9159 lt!596554 (_1!12215 (tuple2!24409 lt!596536 minValue!1245))))))

(declare-fun lt!596552 () List!31539)

(assert (=> d!144615 (= lt!596554 (ListLongMap!22066 lt!596552))))

(declare-fun lt!596555 () Unit!44044)

(declare-fun lt!596553 () Unit!44044)

(assert (=> d!144615 (= lt!596555 lt!596553)))

(assert (=> d!144615 (= (getValueByKey!727 lt!596552 (_1!12215 (tuple2!24409 lt!596536 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596536 minValue!1245))))))

(declare-fun lemmaContainsTupThenGetReturnValue!370 (List!31539 (_ BitVec 64) V!55225) Unit!44044)

(assert (=> d!144615 (= lt!596553 (lemmaContainsTupThenGetReturnValue!370 lt!596552 (_1!12215 (tuple2!24409 lt!596536 minValue!1245)) (_2!12215 (tuple2!24409 lt!596536 minValue!1245))))))

(declare-fun insertStrictlySorted!499 (List!31539 (_ BitVec 64) V!55225) List!31539)

(assert (=> d!144615 (= lt!596552 (insertStrictlySorted!499 (toList!11048 lt!596525) (_1!12215 (tuple2!24409 lt!596536 minValue!1245)) (_2!12215 (tuple2!24409 lt!596536 minValue!1245))))))

(assert (=> d!144615 (= (+!4888 lt!596525 (tuple2!24409 lt!596536 minValue!1245)) lt!596554)))

(declare-fun b!1349732 () Bool)

(declare-fun res!895404 () Bool)

(assert (=> b!1349732 (=> (not res!895404) (not e!767808))))

(assert (=> b!1349732 (= res!895404 (= (getValueByKey!727 (toList!11048 lt!596554) (_1!12215 (tuple2!24409 lt!596536 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596536 minValue!1245)))))))

(declare-fun b!1349733 () Bool)

(declare-fun contains!9163 (List!31539 tuple2!24408) Bool)

(assert (=> b!1349733 (= e!767808 (contains!9163 (toList!11048 lt!596554) (tuple2!24409 lt!596536 minValue!1245)))))

(assert (= (and d!144615 res!895405) b!1349732))

(assert (= (and b!1349732 res!895404) b!1349733))

(declare-fun m!1236407 () Bool)

(assert (=> d!144615 m!1236407))

(declare-fun m!1236409 () Bool)

(assert (=> d!144615 m!1236409))

(declare-fun m!1236411 () Bool)

(assert (=> d!144615 m!1236411))

(declare-fun m!1236413 () Bool)

(assert (=> d!144615 m!1236413))

(declare-fun m!1236415 () Bool)

(assert (=> b!1349732 m!1236415))

(declare-fun m!1236417 () Bool)

(assert (=> b!1349733 m!1236417))

(assert (=> b!1349687 d!144615))

(declare-fun d!144617 () Bool)

(assert (=> d!144617 (= (apply!1034 (+!4888 lt!596518 (tuple2!24409 lt!596534 minValue!1245)) lt!596527) (get!22469 (getValueByKey!727 (toList!11048 (+!4888 lt!596518 (tuple2!24409 lt!596534 minValue!1245))) lt!596527)))))

(declare-fun bs!38666 () Bool)

(assert (= bs!38666 d!144617))

(declare-fun m!1236419 () Bool)

(assert (=> bs!38666 m!1236419))

(assert (=> bs!38666 m!1236419))

(declare-fun m!1236421 () Bool)

(assert (=> bs!38666 m!1236421))

(assert (=> b!1349687 d!144617))

(declare-fun d!144619 () Bool)

(declare-fun e!767809 () Bool)

(assert (=> d!144619 e!767809))

(declare-fun res!895407 () Bool)

(assert (=> d!144619 (=> (not res!895407) (not e!767809))))

(declare-fun lt!596558 () ListLongMap!22065)

(assert (=> d!144619 (= res!895407 (contains!9159 lt!596558 (_1!12215 (tuple2!24409 lt!596524 zeroValue!1245))))))

(declare-fun lt!596556 () List!31539)

(assert (=> d!144619 (= lt!596558 (ListLongMap!22066 lt!596556))))

(declare-fun lt!596559 () Unit!44044)

(declare-fun lt!596557 () Unit!44044)

(assert (=> d!144619 (= lt!596559 lt!596557)))

(assert (=> d!144619 (= (getValueByKey!727 lt!596556 (_1!12215 (tuple2!24409 lt!596524 zeroValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596524 zeroValue!1245))))))

(assert (=> d!144619 (= lt!596557 (lemmaContainsTupThenGetReturnValue!370 lt!596556 (_1!12215 (tuple2!24409 lt!596524 zeroValue!1245)) (_2!12215 (tuple2!24409 lt!596524 zeroValue!1245))))))

(assert (=> d!144619 (= lt!596556 (insertStrictlySorted!499 (toList!11048 lt!596516) (_1!12215 (tuple2!24409 lt!596524 zeroValue!1245)) (_2!12215 (tuple2!24409 lt!596524 zeroValue!1245))))))

(assert (=> d!144619 (= (+!4888 lt!596516 (tuple2!24409 lt!596524 zeroValue!1245)) lt!596558)))

(declare-fun b!1349734 () Bool)

(declare-fun res!895406 () Bool)

(assert (=> b!1349734 (=> (not res!895406) (not e!767809))))

(assert (=> b!1349734 (= res!895406 (= (getValueByKey!727 (toList!11048 lt!596558) (_1!12215 (tuple2!24409 lt!596524 zeroValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596524 zeroValue!1245)))))))

(declare-fun b!1349735 () Bool)

(assert (=> b!1349735 (= e!767809 (contains!9163 (toList!11048 lt!596558) (tuple2!24409 lt!596524 zeroValue!1245)))))

(assert (= (and d!144619 res!895407) b!1349734))

(assert (= (and b!1349734 res!895406) b!1349735))

(declare-fun m!1236423 () Bool)

(assert (=> d!144619 m!1236423))

(declare-fun m!1236425 () Bool)

(assert (=> d!144619 m!1236425))

(declare-fun m!1236427 () Bool)

(assert (=> d!144619 m!1236427))

(declare-fun m!1236429 () Bool)

(assert (=> d!144619 m!1236429))

(declare-fun m!1236431 () Bool)

(assert (=> b!1349734 m!1236431))

(declare-fun m!1236433 () Bool)

(assert (=> b!1349735 m!1236433))

(assert (=> b!1349687 d!144619))

(declare-fun d!144621 () Bool)

(assert (=> d!144621 (= (apply!1034 lt!596521 lt!596515) (get!22469 (getValueByKey!727 (toList!11048 lt!596521) lt!596515)))))

(declare-fun bs!38667 () Bool)

(assert (= bs!38667 d!144621))

(declare-fun m!1236435 () Bool)

(assert (=> bs!38667 m!1236435))

(assert (=> bs!38667 m!1236435))

(declare-fun m!1236437 () Bool)

(assert (=> bs!38667 m!1236437))

(assert (=> b!1349687 d!144621))

(declare-fun d!144623 () Bool)

(declare-fun e!767810 () Bool)

(assert (=> d!144623 e!767810))

(declare-fun res!895409 () Bool)

(assert (=> d!144623 (=> (not res!895409) (not e!767810))))

(declare-fun lt!596562 () ListLongMap!22065)

(assert (=> d!144623 (= res!895409 (contains!9159 lt!596562 (_1!12215 (tuple2!24409 lt!596530 zeroValue!1245))))))

(declare-fun lt!596560 () List!31539)

(assert (=> d!144623 (= lt!596562 (ListLongMap!22066 lt!596560))))

(declare-fun lt!596563 () Unit!44044)

(declare-fun lt!596561 () Unit!44044)

(assert (=> d!144623 (= lt!596563 lt!596561)))

(assert (=> d!144623 (= (getValueByKey!727 lt!596560 (_1!12215 (tuple2!24409 lt!596530 zeroValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596530 zeroValue!1245))))))

(assert (=> d!144623 (= lt!596561 (lemmaContainsTupThenGetReturnValue!370 lt!596560 (_1!12215 (tuple2!24409 lt!596530 zeroValue!1245)) (_2!12215 (tuple2!24409 lt!596530 zeroValue!1245))))))

(assert (=> d!144623 (= lt!596560 (insertStrictlySorted!499 (toList!11048 lt!596521) (_1!12215 (tuple2!24409 lt!596530 zeroValue!1245)) (_2!12215 (tuple2!24409 lt!596530 zeroValue!1245))))))

(assert (=> d!144623 (= (+!4888 lt!596521 (tuple2!24409 lt!596530 zeroValue!1245)) lt!596562)))

(declare-fun b!1349736 () Bool)

(declare-fun res!895408 () Bool)

(assert (=> b!1349736 (=> (not res!895408) (not e!767810))))

(assert (=> b!1349736 (= res!895408 (= (getValueByKey!727 (toList!11048 lt!596562) (_1!12215 (tuple2!24409 lt!596530 zeroValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596530 zeroValue!1245)))))))

(declare-fun b!1349737 () Bool)

(assert (=> b!1349737 (= e!767810 (contains!9163 (toList!11048 lt!596562) (tuple2!24409 lt!596530 zeroValue!1245)))))

(assert (= (and d!144623 res!895409) b!1349736))

(assert (= (and b!1349736 res!895408) b!1349737))

(declare-fun m!1236439 () Bool)

(assert (=> d!144623 m!1236439))

(declare-fun m!1236441 () Bool)

(assert (=> d!144623 m!1236441))

(declare-fun m!1236443 () Bool)

(assert (=> d!144623 m!1236443))

(declare-fun m!1236445 () Bool)

(assert (=> d!144623 m!1236445))

(declare-fun m!1236447 () Bool)

(assert (=> b!1349736 m!1236447))

(declare-fun m!1236449 () Bool)

(assert (=> b!1349737 m!1236449))

(assert (=> b!1349687 d!144623))

(declare-fun d!144625 () Bool)

(assert (=> d!144625 (= (apply!1034 (+!4888 lt!596521 (tuple2!24409 lt!596530 zeroValue!1245)) lt!596515) (apply!1034 lt!596521 lt!596515))))

(declare-fun lt!596566 () Unit!44044)

(declare-fun choose!1994 (ListLongMap!22065 (_ BitVec 64) V!55225 (_ BitVec 64)) Unit!44044)

(assert (=> d!144625 (= lt!596566 (choose!1994 lt!596521 lt!596530 zeroValue!1245 lt!596515))))

(declare-fun e!767813 () Bool)

(assert (=> d!144625 e!767813))

(declare-fun res!895412 () Bool)

(assert (=> d!144625 (=> (not res!895412) (not e!767813))))

(assert (=> d!144625 (= res!895412 (contains!9159 lt!596521 lt!596515))))

(assert (=> d!144625 (= (addApplyDifferent!572 lt!596521 lt!596530 zeroValue!1245 lt!596515) lt!596566)))

(declare-fun b!1349741 () Bool)

(assert (=> b!1349741 (= e!767813 (not (= lt!596515 lt!596530)))))

(assert (= (and d!144625 res!895412) b!1349741))

(assert (=> d!144625 m!1236351))

(assert (=> d!144625 m!1236361))

(assert (=> d!144625 m!1236351))

(declare-fun m!1236451 () Bool)

(assert (=> d!144625 m!1236451))

(assert (=> d!144625 m!1236349))

(declare-fun m!1236453 () Bool)

(assert (=> d!144625 m!1236453))

(assert (=> b!1349687 d!144625))

(declare-fun d!144627 () Bool)

(declare-fun e!767814 () Bool)

(assert (=> d!144627 e!767814))

(declare-fun res!895414 () Bool)

(assert (=> d!144627 (=> (not res!895414) (not e!767814))))

(declare-fun lt!596569 () ListLongMap!22065)

(assert (=> d!144627 (= res!895414 (contains!9159 lt!596569 (_1!12215 (tuple2!24409 lt!596534 minValue!1245))))))

(declare-fun lt!596567 () List!31539)

(assert (=> d!144627 (= lt!596569 (ListLongMap!22066 lt!596567))))

(declare-fun lt!596570 () Unit!44044)

(declare-fun lt!596568 () Unit!44044)

(assert (=> d!144627 (= lt!596570 lt!596568)))

(assert (=> d!144627 (= (getValueByKey!727 lt!596567 (_1!12215 (tuple2!24409 lt!596534 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596534 minValue!1245))))))

(assert (=> d!144627 (= lt!596568 (lemmaContainsTupThenGetReturnValue!370 lt!596567 (_1!12215 (tuple2!24409 lt!596534 minValue!1245)) (_2!12215 (tuple2!24409 lt!596534 minValue!1245))))))

(assert (=> d!144627 (= lt!596567 (insertStrictlySorted!499 (toList!11048 lt!596518) (_1!12215 (tuple2!24409 lt!596534 minValue!1245)) (_2!12215 (tuple2!24409 lt!596534 minValue!1245))))))

(assert (=> d!144627 (= (+!4888 lt!596518 (tuple2!24409 lt!596534 minValue!1245)) lt!596569)))

(declare-fun b!1349742 () Bool)

(declare-fun res!895413 () Bool)

(assert (=> b!1349742 (=> (not res!895413) (not e!767814))))

(assert (=> b!1349742 (= res!895413 (= (getValueByKey!727 (toList!11048 lt!596569) (_1!12215 (tuple2!24409 lt!596534 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596534 minValue!1245)))))))

(declare-fun b!1349743 () Bool)

(assert (=> b!1349743 (= e!767814 (contains!9163 (toList!11048 lt!596569) (tuple2!24409 lt!596534 minValue!1245)))))

(assert (= (and d!144627 res!895414) b!1349742))

(assert (= (and b!1349742 res!895413) b!1349743))

(declare-fun m!1236455 () Bool)

(assert (=> d!144627 m!1236455))

(declare-fun m!1236457 () Bool)

(assert (=> d!144627 m!1236457))

(declare-fun m!1236459 () Bool)

(assert (=> d!144627 m!1236459))

(declare-fun m!1236461 () Bool)

(assert (=> d!144627 m!1236461))

(declare-fun m!1236463 () Bool)

(assert (=> b!1349742 m!1236463))

(declare-fun m!1236465 () Bool)

(assert (=> b!1349743 m!1236465))

(assert (=> b!1349687 d!144627))

(declare-fun b!1349768 () Bool)

(declare-fun e!767834 () ListLongMap!22065)

(declare-fun call!65218 () ListLongMap!22065)

(assert (=> b!1349768 (= e!767834 call!65218)))

(declare-fun bm!65215 () Bool)

(assert (=> bm!65215 (= call!65218 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1349770 () Bool)

(declare-fun e!767829 () Bool)

(declare-fun e!767833 () Bool)

(assert (=> b!1349770 (= e!767829 e!767833)))

(assert (=> b!1349770 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(declare-fun res!895425 () Bool)

(declare-fun lt!596588 () ListLongMap!22065)

(assert (=> b!1349770 (= res!895425 (contains!9159 lt!596588 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349770 (=> (not res!895425) (not e!767833))))

(declare-fun b!1349771 () Bool)

(assert (=> b!1349771 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(assert (=> b!1349771 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44987 _values!1303)))))

(assert (=> b!1349771 (= e!767833 (= (apply!1034 lt!596588 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22468 (select (arr!44435 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349772 () Bool)

(declare-fun e!767830 () Bool)

(assert (=> b!1349772 (= e!767830 (validKeyInArray!0 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349772 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1349773 () Bool)

(declare-fun e!767831 () Bool)

(declare-fun isEmpty!1106 (ListLongMap!22065) Bool)

(assert (=> b!1349773 (= e!767831 (isEmpty!1106 lt!596588))))

(declare-fun b!1349774 () Bool)

(assert (=> b!1349774 (= e!767831 (= lt!596588 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1349775 () Bool)

(declare-fun e!767835 () Bool)

(assert (=> b!1349775 (= e!767835 e!767829)))

(declare-fun c!126634 () Bool)

(assert (=> b!1349775 (= c!126634 e!767830)))

(declare-fun res!895426 () Bool)

(assert (=> b!1349775 (=> (not res!895426) (not e!767830))))

(assert (=> b!1349775 (= res!895426 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(declare-fun b!1349776 () Bool)

(declare-fun e!767832 () ListLongMap!22065)

(assert (=> b!1349776 (= e!767832 (ListLongMap!22066 Nil!31536))))

(declare-fun b!1349777 () Bool)

(assert (=> b!1349777 (= e!767832 e!767834)))

(declare-fun c!126637 () Bool)

(assert (=> b!1349777 (= c!126637 (validKeyInArray!0 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1349778 () Bool)

(assert (=> b!1349778 (= e!767829 e!767831)))

(declare-fun c!126636 () Bool)

(assert (=> b!1349778 (= c!126636 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(declare-fun b!1349779 () Bool)

(declare-fun lt!596591 () Unit!44044)

(declare-fun lt!596589 () Unit!44044)

(assert (=> b!1349779 (= lt!596591 lt!596589)))

(declare-fun lt!596587 () ListLongMap!22065)

(declare-fun lt!596586 () V!55225)

(declare-fun lt!596590 () (_ BitVec 64))

(declare-fun lt!596585 () (_ BitVec 64))

(assert (=> b!1349779 (not (contains!9159 (+!4888 lt!596587 (tuple2!24409 lt!596590 lt!596586)) lt!596585))))

(declare-fun addStillNotContains!493 (ListLongMap!22065 (_ BitVec 64) V!55225 (_ BitVec 64)) Unit!44044)

(assert (=> b!1349779 (= lt!596589 (addStillNotContains!493 lt!596587 lt!596590 lt!596586 lt!596585))))

(assert (=> b!1349779 (= lt!596585 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1349779 (= lt!596586 (get!22468 (select (arr!44435 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1349779 (= lt!596590 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1349779 (= lt!596587 call!65218)))

(assert (=> b!1349779 (= e!767834 (+!4888 call!65218 (tuple2!24409 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22468 (select (arr!44435 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1349769 () Bool)

(declare-fun res!895423 () Bool)

(assert (=> b!1349769 (=> (not res!895423) (not e!767835))))

(assert (=> b!1349769 (= res!895423 (not (contains!9159 lt!596588 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!144629 () Bool)

(assert (=> d!144629 e!767835))

(declare-fun res!895424 () Bool)

(assert (=> d!144629 (=> (not res!895424) (not e!767835))))

(assert (=> d!144629 (= res!895424 (not (contains!9159 lt!596588 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144629 (= lt!596588 e!767832)))

(declare-fun c!126635 () Bool)

(assert (=> d!144629 (= c!126635 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44986 _keys!1571)))))

(assert (=> d!144629 (validMask!0 mask!1977)))

(assert (=> d!144629 (= (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596588)))

(assert (= (and d!144629 c!126635) b!1349776))

(assert (= (and d!144629 (not c!126635)) b!1349777))

(assert (= (and b!1349777 c!126637) b!1349779))

(assert (= (and b!1349777 (not c!126637)) b!1349768))

(assert (= (or b!1349779 b!1349768) bm!65215))

(assert (= (and d!144629 res!895424) b!1349769))

(assert (= (and b!1349769 res!895423) b!1349775))

(assert (= (and b!1349775 res!895426) b!1349772))

(assert (= (and b!1349775 c!126634) b!1349770))

(assert (= (and b!1349775 (not c!126634)) b!1349778))

(assert (= (and b!1349770 res!895425) b!1349771))

(assert (= (and b!1349778 c!126636) b!1349774))

(assert (= (and b!1349778 (not c!126636)) b!1349773))

(declare-fun b_lambda!24717 () Bool)

(assert (=> (not b_lambda!24717) (not b!1349771)))

(assert (=> b!1349771 t!46193))

(declare-fun b_and!50981 () Bool)

(assert (= b_and!50979 (and (=> t!46193 result!26013) b_and!50981)))

(declare-fun b_lambda!24719 () Bool)

(assert (=> (not b_lambda!24719) (not b!1349779)))

(assert (=> b!1349779 t!46193))

(declare-fun b_and!50983 () Bool)

(assert (= b_and!50981 (and (=> t!46193 result!26013) b_and!50983)))

(declare-fun m!1236467 () Bool)

(assert (=> b!1349769 m!1236467))

(assert (=> b!1349770 m!1236313))

(assert (=> b!1349770 m!1236313))

(declare-fun m!1236469 () Bool)

(assert (=> b!1349770 m!1236469))

(declare-fun m!1236471 () Bool)

(assert (=> bm!65215 m!1236471))

(assert (=> b!1349774 m!1236471))

(declare-fun m!1236473 () Bool)

(assert (=> d!144629 m!1236473))

(assert (=> d!144629 m!1236155))

(assert (=> b!1349777 m!1236313))

(assert (=> b!1349777 m!1236313))

(assert (=> b!1349777 m!1236317))

(declare-fun m!1236475 () Bool)

(assert (=> b!1349779 m!1236475))

(assert (=> b!1349779 m!1236249))

(assert (=> b!1349779 m!1236309))

(declare-fun m!1236477 () Bool)

(assert (=> b!1349779 m!1236477))

(declare-fun m!1236479 () Bool)

(assert (=> b!1349779 m!1236479))

(assert (=> b!1349779 m!1236477))

(assert (=> b!1349779 m!1236309))

(assert (=> b!1349779 m!1236249))

(assert (=> b!1349779 m!1236311))

(assert (=> b!1349779 m!1236313))

(declare-fun m!1236481 () Bool)

(assert (=> b!1349779 m!1236481))

(declare-fun m!1236483 () Bool)

(assert (=> b!1349773 m!1236483))

(assert (=> b!1349771 m!1236249))

(assert (=> b!1349771 m!1236309))

(assert (=> b!1349771 m!1236309))

(assert (=> b!1349771 m!1236249))

(assert (=> b!1349771 m!1236311))

(assert (=> b!1349771 m!1236313))

(declare-fun m!1236485 () Bool)

(assert (=> b!1349771 m!1236485))

(assert (=> b!1349771 m!1236313))

(assert (=> b!1349772 m!1236313))

(assert (=> b!1349772 m!1236313))

(assert (=> b!1349772 m!1236317))

(assert (=> b!1349687 d!144629))

(declare-fun d!144631 () Bool)

(assert (=> d!144631 (= (apply!1034 (+!4888 lt!596521 (tuple2!24409 lt!596530 zeroValue!1245)) lt!596515) (get!22469 (getValueByKey!727 (toList!11048 (+!4888 lt!596521 (tuple2!24409 lt!596530 zeroValue!1245))) lt!596515)))))

(declare-fun bs!38668 () Bool)

(assert (= bs!38668 d!144631))

(declare-fun m!1236487 () Bool)

(assert (=> bs!38668 m!1236487))

(assert (=> bs!38668 m!1236487))

(declare-fun m!1236489 () Bool)

(assert (=> bs!38668 m!1236489))

(assert (=> b!1349687 d!144631))

(declare-fun d!144633 () Bool)

(assert (=> d!144633 (= (apply!1034 (+!4888 lt!596518 (tuple2!24409 lt!596534 minValue!1245)) lt!596527) (apply!1034 lt!596518 lt!596527))))

(declare-fun lt!596592 () Unit!44044)

(assert (=> d!144633 (= lt!596592 (choose!1994 lt!596518 lt!596534 minValue!1245 lt!596527))))

(declare-fun e!767836 () Bool)

(assert (=> d!144633 e!767836))

(declare-fun res!895427 () Bool)

(assert (=> d!144633 (=> (not res!895427) (not e!767836))))

(assert (=> d!144633 (= res!895427 (contains!9159 lt!596518 lt!596527))))

(assert (=> d!144633 (= (addApplyDifferent!572 lt!596518 lt!596534 minValue!1245 lt!596527) lt!596592)))

(declare-fun b!1349780 () Bool)

(assert (=> b!1349780 (= e!767836 (not (= lt!596527 lt!596534)))))

(assert (= (and d!144633 res!895427) b!1349780))

(assert (=> d!144633 m!1236337))

(assert (=> d!144633 m!1236359))

(assert (=> d!144633 m!1236337))

(declare-fun m!1236491 () Bool)

(assert (=> d!144633 m!1236491))

(assert (=> d!144633 m!1236355))

(declare-fun m!1236493 () Bool)

(assert (=> d!144633 m!1236493))

(assert (=> b!1349687 d!144633))

(declare-fun d!144635 () Bool)

(assert (=> d!144635 (= (apply!1034 (+!4888 lt!596525 (tuple2!24409 lt!596536 minValue!1245)) lt!596528) (apply!1034 lt!596525 lt!596528))))

(declare-fun lt!596593 () Unit!44044)

(assert (=> d!144635 (= lt!596593 (choose!1994 lt!596525 lt!596536 minValue!1245 lt!596528))))

(declare-fun e!767837 () Bool)

(assert (=> d!144635 e!767837))

(declare-fun res!895428 () Bool)

(assert (=> d!144635 (=> (not res!895428) (not e!767837))))

(assert (=> d!144635 (= res!895428 (contains!9159 lt!596525 lt!596528))))

(assert (=> d!144635 (= (addApplyDifferent!572 lt!596525 lt!596536 minValue!1245 lt!596528) lt!596593)))

(declare-fun b!1349781 () Bool)

(assert (=> b!1349781 (= e!767837 (not (= lt!596528 lt!596536)))))

(assert (= (and d!144635 res!895428) b!1349781))

(assert (=> d!144635 m!1236343))

(assert (=> d!144635 m!1236345))

(assert (=> d!144635 m!1236343))

(declare-fun m!1236495 () Bool)

(assert (=> d!144635 m!1236495))

(assert (=> d!144635 m!1236339))

(declare-fun m!1236497 () Bool)

(assert (=> d!144635 m!1236497))

(assert (=> b!1349687 d!144635))

(declare-fun d!144637 () Bool)

(assert (=> d!144637 (isDefined!534 (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun lt!596596 () Unit!44044)

(declare-fun choose!1995 (List!31539 (_ BitVec 64)) Unit!44044)

(assert (=> d!144637 (= lt!596596 (choose!1995 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun e!767840 () Bool)

(assert (=> d!144637 e!767840))

(declare-fun res!895431 () Bool)

(assert (=> d!144637 (=> (not res!895431) (not e!767840))))

(declare-fun isStrictlySorted!880 (List!31539) Bool)

(assert (=> d!144637 (= res!895431 (isStrictlySorted!880 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))

(assert (=> d!144637 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) lt!596596)))

(declare-fun b!1349784 () Bool)

(assert (=> b!1349784 (= e!767840 (containsKey!744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (= (and d!144637 res!895431) b!1349784))

(assert (=> d!144637 m!1236243))

(assert (=> d!144637 m!1236243))

(assert (=> d!144637 m!1236245))

(declare-fun m!1236499 () Bool)

(assert (=> d!144637 m!1236499))

(declare-fun m!1236501 () Bool)

(assert (=> d!144637 m!1236501))

(assert (=> b!1349784 m!1236239))

(assert (=> b!1349597 d!144637))

(declare-fun d!144639 () Bool)

(assert (=> d!144639 (= (isDefined!534 (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)) (not (isEmpty!1105 (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38669 () Bool)

(assert (= bs!38669 d!144639))

(assert (=> bs!38669 m!1236243))

(declare-fun m!1236503 () Bool)

(assert (=> bs!38669 m!1236503))

(assert (=> b!1349597 d!144639))

(declare-fun d!144641 () Bool)

(declare-fun c!126638 () Bool)

(assert (=> d!144641 (= c!126638 (and ((_ is Cons!31535) (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun e!767841 () Option!778)

(assert (=> d!144641 (= (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!767841)))

(declare-fun b!1349787 () Bool)

(declare-fun e!767842 () Option!778)

(assert (=> b!1349787 (= e!767842 (getValueByKey!727 (t!46187 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(declare-fun b!1349788 () Bool)

(assert (=> b!1349788 (= e!767842 None!776)))

(declare-fun b!1349786 () Bool)

(assert (=> b!1349786 (= e!767841 e!767842)))

(declare-fun c!126639 () Bool)

(assert (=> b!1349786 (= c!126639 (and ((_ is Cons!31535) (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (not (= (_1!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142))))))

(declare-fun b!1349785 () Bool)

(assert (=> b!1349785 (= e!767841 (Some!777 (_2!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))))

(assert (= (and d!144641 c!126638) b!1349785))

(assert (= (and d!144641 (not c!126638)) b!1349786))

(assert (= (and b!1349786 c!126639) b!1349787))

(assert (= (and b!1349786 (not c!126639)) b!1349788))

(declare-fun m!1236505 () Bool)

(assert (=> b!1349787 m!1236505))

(assert (=> b!1349597 d!144641))

(declare-fun d!144643 () Bool)

(declare-fun e!767844 () Bool)

(assert (=> d!144643 e!767844))

(declare-fun res!895432 () Bool)

(assert (=> d!144643 (=> res!895432 e!767844)))

(declare-fun lt!596598 () Bool)

(assert (=> d!144643 (= res!895432 (not lt!596598))))

(declare-fun lt!596600 () Bool)

(assert (=> d!144643 (= lt!596598 lt!596600)))

(declare-fun lt!596599 () Unit!44044)

(declare-fun e!767843 () Unit!44044)

(assert (=> d!144643 (= lt!596599 e!767843)))

(declare-fun c!126640 () Bool)

(assert (=> d!144643 (= c!126640 lt!596600)))

(assert (=> d!144643 (= lt!596600 (containsKey!744 (toList!11048 lt!596533) (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> d!144643 (= (contains!9159 lt!596533 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) lt!596598)))

(declare-fun b!1349789 () Bool)

(declare-fun lt!596597 () Unit!44044)

(assert (=> b!1349789 (= e!767843 lt!596597)))

(assert (=> b!1349789 (= lt!596597 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 lt!596533) (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349789 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596533) (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1349790 () Bool)

(declare-fun Unit!44051 () Unit!44044)

(assert (=> b!1349790 (= e!767843 Unit!44051)))

(declare-fun b!1349791 () Bool)

(assert (=> b!1349791 (= e!767844 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596533) (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(assert (= (and d!144643 c!126640) b!1349789))

(assert (= (and d!144643 (not c!126640)) b!1349790))

(assert (= (and d!144643 (not res!895432)) b!1349791))

(assert (=> d!144643 m!1236313))

(declare-fun m!1236507 () Bool)

(assert (=> d!144643 m!1236507))

(assert (=> b!1349789 m!1236313))

(declare-fun m!1236509 () Bool)

(assert (=> b!1349789 m!1236509))

(assert (=> b!1349789 m!1236313))

(declare-fun m!1236511 () Bool)

(assert (=> b!1349789 m!1236511))

(assert (=> b!1349789 m!1236511))

(declare-fun m!1236513 () Bool)

(assert (=> b!1349789 m!1236513))

(assert (=> b!1349791 m!1236313))

(assert (=> b!1349791 m!1236511))

(assert (=> b!1349791 m!1236511))

(assert (=> b!1349791 m!1236513))

(assert (=> b!1349670 d!144643))

(declare-fun d!144645 () Bool)

(declare-fun e!767845 () Bool)

(assert (=> d!144645 e!767845))

(declare-fun res!895434 () Bool)

(assert (=> d!144645 (=> (not res!895434) (not e!767845))))

(declare-fun lt!596603 () ListLongMap!22065)

(assert (=> d!144645 (= res!895434 (contains!9159 lt!596603 (_1!12215 (tuple2!24409 lt!596510 minValue!1245))))))

(declare-fun lt!596601 () List!31539)

(assert (=> d!144645 (= lt!596603 (ListLongMap!22066 lt!596601))))

(declare-fun lt!596604 () Unit!44044)

(declare-fun lt!596602 () Unit!44044)

(assert (=> d!144645 (= lt!596604 lt!596602)))

(assert (=> d!144645 (= (getValueByKey!727 lt!596601 (_1!12215 (tuple2!24409 lt!596510 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596510 minValue!1245))))))

(assert (=> d!144645 (= lt!596602 (lemmaContainsTupThenGetReturnValue!370 lt!596601 (_1!12215 (tuple2!24409 lt!596510 minValue!1245)) (_2!12215 (tuple2!24409 lt!596510 minValue!1245))))))

(assert (=> d!144645 (= lt!596601 (insertStrictlySorted!499 (toList!11048 lt!596499) (_1!12215 (tuple2!24409 lt!596510 minValue!1245)) (_2!12215 (tuple2!24409 lt!596510 minValue!1245))))))

(assert (=> d!144645 (= (+!4888 lt!596499 (tuple2!24409 lt!596510 minValue!1245)) lt!596603)))

(declare-fun b!1349792 () Bool)

(declare-fun res!895433 () Bool)

(assert (=> b!1349792 (=> (not res!895433) (not e!767845))))

(assert (=> b!1349792 (= res!895433 (= (getValueByKey!727 (toList!11048 lt!596603) (_1!12215 (tuple2!24409 lt!596510 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596510 minValue!1245)))))))

(declare-fun b!1349793 () Bool)

(assert (=> b!1349793 (= e!767845 (contains!9163 (toList!11048 lt!596603) (tuple2!24409 lt!596510 minValue!1245)))))

(assert (= (and d!144645 res!895434) b!1349792))

(assert (= (and b!1349792 res!895433) b!1349793))

(declare-fun m!1236515 () Bool)

(assert (=> d!144645 m!1236515))

(declare-fun m!1236517 () Bool)

(assert (=> d!144645 m!1236517))

(declare-fun m!1236519 () Bool)

(assert (=> d!144645 m!1236519))

(declare-fun m!1236521 () Bool)

(assert (=> d!144645 m!1236521))

(declare-fun m!1236523 () Bool)

(assert (=> b!1349792 m!1236523))

(declare-fun m!1236525 () Bool)

(assert (=> b!1349793 m!1236525))

(assert (=> b!1349661 d!144645))

(declare-fun d!144647 () Bool)

(assert (=> d!144647 (= (apply!1034 (+!4888 lt!596495 (tuple2!24409 lt!596504 zeroValue!1245)) lt!596489) (get!22469 (getValueByKey!727 (toList!11048 (+!4888 lt!596495 (tuple2!24409 lt!596504 zeroValue!1245))) lt!596489)))))

(declare-fun bs!38670 () Bool)

(assert (= bs!38670 d!144647))

(declare-fun m!1236527 () Bool)

(assert (=> bs!38670 m!1236527))

(assert (=> bs!38670 m!1236527))

(declare-fun m!1236529 () Bool)

(assert (=> bs!38670 m!1236529))

(assert (=> b!1349661 d!144647))

(declare-fun d!144649 () Bool)

(assert (=> d!144649 (= (apply!1034 lt!596499 lt!596502) (get!22469 (getValueByKey!727 (toList!11048 lt!596499) lt!596502)))))

(declare-fun bs!38671 () Bool)

(assert (= bs!38671 d!144649))

(declare-fun m!1236531 () Bool)

(assert (=> bs!38671 m!1236531))

(assert (=> bs!38671 m!1236531))

(declare-fun m!1236533 () Bool)

(assert (=> bs!38671 m!1236533))

(assert (=> b!1349661 d!144649))

(declare-fun d!144651 () Bool)

(assert (=> d!144651 (= (apply!1034 (+!4888 lt!596495 (tuple2!24409 lt!596504 zeroValue!1245)) lt!596489) (apply!1034 lt!596495 lt!596489))))

(declare-fun lt!596605 () Unit!44044)

(assert (=> d!144651 (= lt!596605 (choose!1994 lt!596495 lt!596504 zeroValue!1245 lt!596489))))

(declare-fun e!767846 () Bool)

(assert (=> d!144651 e!767846))

(declare-fun res!895435 () Bool)

(assert (=> d!144651 (=> (not res!895435) (not e!767846))))

(assert (=> d!144651 (= res!895435 (contains!9159 lt!596495 lt!596489))))

(assert (=> d!144651 (= (addApplyDifferent!572 lt!596495 lt!596504 zeroValue!1245 lt!596489) lt!596605)))

(declare-fun b!1349794 () Bool)

(assert (=> b!1349794 (= e!767846 (not (= lt!596489 lt!596504)))))

(assert (= (and d!144651 res!895435) b!1349794))

(assert (=> d!144651 m!1236287))

(assert (=> d!144651 m!1236297))

(assert (=> d!144651 m!1236287))

(declare-fun m!1236535 () Bool)

(assert (=> d!144651 m!1236535))

(assert (=> d!144651 m!1236285))

(declare-fun m!1236537 () Bool)

(assert (=> d!144651 m!1236537))

(assert (=> b!1349661 d!144651))

(declare-fun b!1349795 () Bool)

(declare-fun e!767852 () ListLongMap!22065)

(declare-fun call!65219 () ListLongMap!22065)

(assert (=> b!1349795 (= e!767852 call!65219)))

(declare-fun bm!65216 () Bool)

(assert (=> bm!65216 (= call!65219 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1349797 () Bool)

(declare-fun e!767847 () Bool)

(declare-fun e!767851 () Bool)

(assert (=> b!1349797 (= e!767847 e!767851)))

(assert (=> b!1349797 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun lt!596609 () ListLongMap!22065)

(declare-fun res!895438 () Bool)

(assert (=> b!1349797 (= res!895438 (contains!9159 lt!596609 (select (arr!44434 _keys!1571) from!1960)))))

(assert (=> b!1349797 (=> (not res!895438) (not e!767851))))

(declare-fun b!1349798 () Bool)

(assert (=> b!1349798 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44986 _keys!1571)))))

(assert (=> b!1349798 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44987 _values!1303)))))

(assert (=> b!1349798 (= e!767851 (= (apply!1034 lt!596609 (select (arr!44434 _keys!1571) from!1960)) (get!22468 (select (arr!44435 _values!1303) from!1960) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349799 () Bool)

(declare-fun e!767848 () Bool)

(assert (=> b!1349799 (= e!767848 (validKeyInArray!0 (select (arr!44434 _keys!1571) from!1960)))))

(assert (=> b!1349799 (bvsge from!1960 #b00000000000000000000000000000000)))

(declare-fun b!1349800 () Bool)

(declare-fun e!767849 () Bool)

(assert (=> b!1349800 (= e!767849 (isEmpty!1106 lt!596609))))

(declare-fun b!1349801 () Bool)

(assert (=> b!1349801 (= e!767849 (= lt!596609 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1349802 () Bool)

(declare-fun e!767853 () Bool)

(assert (=> b!1349802 (= e!767853 e!767847)))

(declare-fun c!126641 () Bool)

(assert (=> b!1349802 (= c!126641 e!767848)))

(declare-fun res!895439 () Bool)

(assert (=> b!1349802 (=> (not res!895439) (not e!767848))))

(assert (=> b!1349802 (= res!895439 (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun b!1349803 () Bool)

(declare-fun e!767850 () ListLongMap!22065)

(assert (=> b!1349803 (= e!767850 (ListLongMap!22066 Nil!31536))))

(declare-fun b!1349804 () Bool)

(assert (=> b!1349804 (= e!767850 e!767852)))

(declare-fun c!126644 () Bool)

(assert (=> b!1349804 (= c!126644 (validKeyInArray!0 (select (arr!44434 _keys!1571) from!1960)))))

(declare-fun b!1349805 () Bool)

(assert (=> b!1349805 (= e!767847 e!767849)))

(declare-fun c!126643 () Bool)

(assert (=> b!1349805 (= c!126643 (bvslt from!1960 (size!44986 _keys!1571)))))

(declare-fun b!1349806 () Bool)

(declare-fun lt!596612 () Unit!44044)

(declare-fun lt!596610 () Unit!44044)

(assert (=> b!1349806 (= lt!596612 lt!596610)))

(declare-fun lt!596608 () ListLongMap!22065)

(declare-fun lt!596606 () (_ BitVec 64))

(declare-fun lt!596611 () (_ BitVec 64))

(declare-fun lt!596607 () V!55225)

(assert (=> b!1349806 (not (contains!9159 (+!4888 lt!596608 (tuple2!24409 lt!596611 lt!596607)) lt!596606))))

(assert (=> b!1349806 (= lt!596610 (addStillNotContains!493 lt!596608 lt!596611 lt!596607 lt!596606))))

(assert (=> b!1349806 (= lt!596606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1349806 (= lt!596607 (get!22468 (select (arr!44435 _values!1303) from!1960) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1349806 (= lt!596611 (select (arr!44434 _keys!1571) from!1960))))

(assert (=> b!1349806 (= lt!596608 call!65219)))

(assert (=> b!1349806 (= e!767852 (+!4888 call!65219 (tuple2!24409 (select (arr!44434 _keys!1571) from!1960) (get!22468 (select (arr!44435 _values!1303) from!1960) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1349796 () Bool)

(declare-fun res!895436 () Bool)

(assert (=> b!1349796 (=> (not res!895436) (not e!767853))))

(assert (=> b!1349796 (= res!895436 (not (contains!9159 lt!596609 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!144653 () Bool)

(assert (=> d!144653 e!767853))

(declare-fun res!895437 () Bool)

(assert (=> d!144653 (=> (not res!895437) (not e!767853))))

(assert (=> d!144653 (= res!895437 (not (contains!9159 lt!596609 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144653 (= lt!596609 e!767850)))

(declare-fun c!126642 () Bool)

(assert (=> d!144653 (= c!126642 (bvsge from!1960 (size!44986 _keys!1571)))))

(assert (=> d!144653 (validMask!0 mask!1977)))

(assert (=> d!144653 (= (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596609)))

(assert (= (and d!144653 c!126642) b!1349803))

(assert (= (and d!144653 (not c!126642)) b!1349804))

(assert (= (and b!1349804 c!126644) b!1349806))

(assert (= (and b!1349804 (not c!126644)) b!1349795))

(assert (= (or b!1349806 b!1349795) bm!65216))

(assert (= (and d!144653 res!895437) b!1349796))

(assert (= (and b!1349796 res!895436) b!1349802))

(assert (= (and b!1349802 res!895439) b!1349799))

(assert (= (and b!1349802 c!126641) b!1349797))

(assert (= (and b!1349802 (not c!126641)) b!1349805))

(assert (= (and b!1349797 res!895438) b!1349798))

(assert (= (and b!1349805 c!126643) b!1349801))

(assert (= (and b!1349805 (not c!126643)) b!1349800))

(declare-fun b_lambda!24721 () Bool)

(assert (=> (not b_lambda!24721) (not b!1349798)))

(assert (=> b!1349798 t!46193))

(declare-fun b_and!50985 () Bool)

(assert (= b_and!50983 (and (=> t!46193 result!26013) b_and!50985)))

(declare-fun b_lambda!24723 () Bool)

(assert (=> (not b_lambda!24723) (not b!1349806)))

(assert (=> b!1349806 t!46193))

(declare-fun b_and!50987 () Bool)

(assert (= b_and!50985 (and (=> t!46193 result!26013) b_and!50987)))

(declare-fun m!1236539 () Bool)

(assert (=> b!1349796 m!1236539))

(assert (=> b!1349797 m!1236161))

(assert (=> b!1349797 m!1236161))

(declare-fun m!1236541 () Bool)

(assert (=> b!1349797 m!1236541))

(declare-fun m!1236543 () Bool)

(assert (=> bm!65216 m!1236543))

(assert (=> b!1349801 m!1236543))

(declare-fun m!1236545 () Bool)

(assert (=> d!144653 m!1236545))

(assert (=> d!144653 m!1236155))

(assert (=> b!1349804 m!1236161))

(assert (=> b!1349804 m!1236161))

(assert (=> b!1349804 m!1236163))

(declare-fun m!1236547 () Bool)

(assert (=> b!1349806 m!1236547))

(assert (=> b!1349806 m!1236249))

(assert (=> b!1349806 m!1236247))

(declare-fun m!1236549 () Bool)

(assert (=> b!1349806 m!1236549))

(declare-fun m!1236551 () Bool)

(assert (=> b!1349806 m!1236551))

(assert (=> b!1349806 m!1236549))

(assert (=> b!1349806 m!1236247))

(assert (=> b!1349806 m!1236249))

(assert (=> b!1349806 m!1236251))

(assert (=> b!1349806 m!1236161))

(declare-fun m!1236553 () Bool)

(assert (=> b!1349806 m!1236553))

(declare-fun m!1236555 () Bool)

(assert (=> b!1349800 m!1236555))

(assert (=> b!1349798 m!1236249))

(assert (=> b!1349798 m!1236247))

(assert (=> b!1349798 m!1236247))

(assert (=> b!1349798 m!1236249))

(assert (=> b!1349798 m!1236251))

(assert (=> b!1349798 m!1236161))

(declare-fun m!1236557 () Bool)

(assert (=> b!1349798 m!1236557))

(assert (=> b!1349798 m!1236161))

(assert (=> b!1349799 m!1236161))

(assert (=> b!1349799 m!1236161))

(assert (=> b!1349799 m!1236163))

(assert (=> b!1349661 d!144653))

(declare-fun d!144655 () Bool)

(declare-fun e!767855 () Bool)

(assert (=> d!144655 e!767855))

(declare-fun res!895440 () Bool)

(assert (=> d!144655 (=> res!895440 e!767855)))

(declare-fun lt!596614 () Bool)

(assert (=> d!144655 (= res!895440 (not lt!596614))))

(declare-fun lt!596616 () Bool)

(assert (=> d!144655 (= lt!596614 lt!596616)))

(declare-fun lt!596615 () Unit!44044)

(declare-fun e!767854 () Unit!44044)

(assert (=> d!144655 (= lt!596615 e!767854)))

(declare-fun c!126645 () Bool)

(assert (=> d!144655 (= c!126645 lt!596616)))

(assert (=> d!144655 (= lt!596616 (containsKey!744 (toList!11048 (+!4888 lt!596490 (tuple2!24409 lt!596498 zeroValue!1245))) lt!596506))))

(assert (=> d!144655 (= (contains!9159 (+!4888 lt!596490 (tuple2!24409 lt!596498 zeroValue!1245)) lt!596506) lt!596614)))

(declare-fun b!1349807 () Bool)

(declare-fun lt!596613 () Unit!44044)

(assert (=> b!1349807 (= e!767854 lt!596613)))

(assert (=> b!1349807 (= lt!596613 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 (+!4888 lt!596490 (tuple2!24409 lt!596498 zeroValue!1245))) lt!596506))))

(assert (=> b!1349807 (isDefined!534 (getValueByKey!727 (toList!11048 (+!4888 lt!596490 (tuple2!24409 lt!596498 zeroValue!1245))) lt!596506))))

(declare-fun b!1349808 () Bool)

(declare-fun Unit!44052 () Unit!44044)

(assert (=> b!1349808 (= e!767854 Unit!44052)))

(declare-fun b!1349809 () Bool)

(assert (=> b!1349809 (= e!767855 (isDefined!534 (getValueByKey!727 (toList!11048 (+!4888 lt!596490 (tuple2!24409 lt!596498 zeroValue!1245))) lt!596506)))))

(assert (= (and d!144655 c!126645) b!1349807))

(assert (= (and d!144655 (not c!126645)) b!1349808))

(assert (= (and d!144655 (not res!895440)) b!1349809))

(declare-fun m!1236559 () Bool)

(assert (=> d!144655 m!1236559))

(declare-fun m!1236561 () Bool)

(assert (=> b!1349807 m!1236561))

(declare-fun m!1236563 () Bool)

(assert (=> b!1349807 m!1236563))

(assert (=> b!1349807 m!1236563))

(declare-fun m!1236565 () Bool)

(assert (=> b!1349807 m!1236565))

(assert (=> b!1349809 m!1236563))

(assert (=> b!1349809 m!1236563))

(assert (=> b!1349809 m!1236565))

(assert (=> b!1349661 d!144655))

(declare-fun d!144657 () Bool)

(assert (=> d!144657 (= (apply!1034 (+!4888 lt!596492 (tuple2!24409 lt!596508 minValue!1245)) lt!596501) (get!22469 (getValueByKey!727 (toList!11048 (+!4888 lt!596492 (tuple2!24409 lt!596508 minValue!1245))) lt!596501)))))

(declare-fun bs!38672 () Bool)

(assert (= bs!38672 d!144657))

(declare-fun m!1236567 () Bool)

(assert (=> bs!38672 m!1236567))

(assert (=> bs!38672 m!1236567))

(declare-fun m!1236569 () Bool)

(assert (=> bs!38672 m!1236569))

(assert (=> b!1349661 d!144657))

(declare-fun d!144659 () Bool)

(assert (=> d!144659 (contains!9159 (+!4888 lt!596490 (tuple2!24409 lt!596498 zeroValue!1245)) lt!596506)))

(declare-fun lt!596617 () Unit!44044)

(assert (=> d!144659 (= lt!596617 (choose!1993 lt!596490 lt!596498 zeroValue!1245 lt!596506))))

(assert (=> d!144659 (contains!9159 lt!596490 lt!596506)))

(assert (=> d!144659 (= (addStillContains!1211 lt!596490 lt!596498 zeroValue!1245 lt!596506) lt!596617)))

(declare-fun bs!38673 () Bool)

(assert (= bs!38673 d!144659))

(assert (=> bs!38673 m!1236283))

(assert (=> bs!38673 m!1236283))

(assert (=> bs!38673 m!1236289))

(declare-fun m!1236571 () Bool)

(assert (=> bs!38673 m!1236571))

(declare-fun m!1236573 () Bool)

(assert (=> bs!38673 m!1236573))

(assert (=> b!1349661 d!144659))

(declare-fun d!144661 () Bool)

(declare-fun e!767856 () Bool)

(assert (=> d!144661 e!767856))

(declare-fun res!895442 () Bool)

(assert (=> d!144661 (=> (not res!895442) (not e!767856))))

(declare-fun lt!596620 () ListLongMap!22065)

(assert (=> d!144661 (= res!895442 (contains!9159 lt!596620 (_1!12215 (tuple2!24409 lt!596498 zeroValue!1245))))))

(declare-fun lt!596618 () List!31539)

(assert (=> d!144661 (= lt!596620 (ListLongMap!22066 lt!596618))))

(declare-fun lt!596621 () Unit!44044)

(declare-fun lt!596619 () Unit!44044)

(assert (=> d!144661 (= lt!596621 lt!596619)))

(assert (=> d!144661 (= (getValueByKey!727 lt!596618 (_1!12215 (tuple2!24409 lt!596498 zeroValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596498 zeroValue!1245))))))

(assert (=> d!144661 (= lt!596619 (lemmaContainsTupThenGetReturnValue!370 lt!596618 (_1!12215 (tuple2!24409 lt!596498 zeroValue!1245)) (_2!12215 (tuple2!24409 lt!596498 zeroValue!1245))))))

(assert (=> d!144661 (= lt!596618 (insertStrictlySorted!499 (toList!11048 lt!596490) (_1!12215 (tuple2!24409 lt!596498 zeroValue!1245)) (_2!12215 (tuple2!24409 lt!596498 zeroValue!1245))))))

(assert (=> d!144661 (= (+!4888 lt!596490 (tuple2!24409 lt!596498 zeroValue!1245)) lt!596620)))

(declare-fun b!1349810 () Bool)

(declare-fun res!895441 () Bool)

(assert (=> b!1349810 (=> (not res!895441) (not e!767856))))

(assert (=> b!1349810 (= res!895441 (= (getValueByKey!727 (toList!11048 lt!596620) (_1!12215 (tuple2!24409 lt!596498 zeroValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596498 zeroValue!1245)))))))

(declare-fun b!1349811 () Bool)

(assert (=> b!1349811 (= e!767856 (contains!9163 (toList!11048 lt!596620) (tuple2!24409 lt!596498 zeroValue!1245)))))

(assert (= (and d!144661 res!895442) b!1349810))

(assert (= (and b!1349810 res!895441) b!1349811))

(declare-fun m!1236575 () Bool)

(assert (=> d!144661 m!1236575))

(declare-fun m!1236577 () Bool)

(assert (=> d!144661 m!1236577))

(declare-fun m!1236579 () Bool)

(assert (=> d!144661 m!1236579))

(declare-fun m!1236581 () Bool)

(assert (=> d!144661 m!1236581))

(declare-fun m!1236583 () Bool)

(assert (=> b!1349810 m!1236583))

(declare-fun m!1236585 () Bool)

(assert (=> b!1349811 m!1236585))

(assert (=> b!1349661 d!144661))

(declare-fun d!144663 () Bool)

(assert (=> d!144663 (= (apply!1034 (+!4888 lt!596499 (tuple2!24409 lt!596510 minValue!1245)) lt!596502) (get!22469 (getValueByKey!727 (toList!11048 (+!4888 lt!596499 (tuple2!24409 lt!596510 minValue!1245))) lt!596502)))))

(declare-fun bs!38674 () Bool)

(assert (= bs!38674 d!144663))

(declare-fun m!1236587 () Bool)

(assert (=> bs!38674 m!1236587))

(assert (=> bs!38674 m!1236587))

(declare-fun m!1236589 () Bool)

(assert (=> bs!38674 m!1236589))

(assert (=> b!1349661 d!144663))

(declare-fun d!144665 () Bool)

(declare-fun e!767857 () Bool)

(assert (=> d!144665 e!767857))

(declare-fun res!895444 () Bool)

(assert (=> d!144665 (=> (not res!895444) (not e!767857))))

(declare-fun lt!596624 () ListLongMap!22065)

(assert (=> d!144665 (= res!895444 (contains!9159 lt!596624 (_1!12215 (tuple2!24409 lt!596504 zeroValue!1245))))))

(declare-fun lt!596622 () List!31539)

(assert (=> d!144665 (= lt!596624 (ListLongMap!22066 lt!596622))))

(declare-fun lt!596625 () Unit!44044)

(declare-fun lt!596623 () Unit!44044)

(assert (=> d!144665 (= lt!596625 lt!596623)))

(assert (=> d!144665 (= (getValueByKey!727 lt!596622 (_1!12215 (tuple2!24409 lt!596504 zeroValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596504 zeroValue!1245))))))

(assert (=> d!144665 (= lt!596623 (lemmaContainsTupThenGetReturnValue!370 lt!596622 (_1!12215 (tuple2!24409 lt!596504 zeroValue!1245)) (_2!12215 (tuple2!24409 lt!596504 zeroValue!1245))))))

(assert (=> d!144665 (= lt!596622 (insertStrictlySorted!499 (toList!11048 lt!596495) (_1!12215 (tuple2!24409 lt!596504 zeroValue!1245)) (_2!12215 (tuple2!24409 lt!596504 zeroValue!1245))))))

(assert (=> d!144665 (= (+!4888 lt!596495 (tuple2!24409 lt!596504 zeroValue!1245)) lt!596624)))

(declare-fun b!1349812 () Bool)

(declare-fun res!895443 () Bool)

(assert (=> b!1349812 (=> (not res!895443) (not e!767857))))

(assert (=> b!1349812 (= res!895443 (= (getValueByKey!727 (toList!11048 lt!596624) (_1!12215 (tuple2!24409 lt!596504 zeroValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596504 zeroValue!1245)))))))

(declare-fun b!1349813 () Bool)

(assert (=> b!1349813 (= e!767857 (contains!9163 (toList!11048 lt!596624) (tuple2!24409 lt!596504 zeroValue!1245)))))

(assert (= (and d!144665 res!895444) b!1349812))

(assert (= (and b!1349812 res!895443) b!1349813))

(declare-fun m!1236591 () Bool)

(assert (=> d!144665 m!1236591))

(declare-fun m!1236593 () Bool)

(assert (=> d!144665 m!1236593))

(declare-fun m!1236595 () Bool)

(assert (=> d!144665 m!1236595))

(declare-fun m!1236597 () Bool)

(assert (=> d!144665 m!1236597))

(declare-fun m!1236599 () Bool)

(assert (=> b!1349812 m!1236599))

(declare-fun m!1236601 () Bool)

(assert (=> b!1349813 m!1236601))

(assert (=> b!1349661 d!144665))

(declare-fun d!144667 () Bool)

(assert (=> d!144667 (= (apply!1034 (+!4888 lt!596492 (tuple2!24409 lt!596508 minValue!1245)) lt!596501) (apply!1034 lt!596492 lt!596501))))

(declare-fun lt!596626 () Unit!44044)

(assert (=> d!144667 (= lt!596626 (choose!1994 lt!596492 lt!596508 minValue!1245 lt!596501))))

(declare-fun e!767858 () Bool)

(assert (=> d!144667 e!767858))

(declare-fun res!895445 () Bool)

(assert (=> d!144667 (=> (not res!895445) (not e!767858))))

(assert (=> d!144667 (= res!895445 (contains!9159 lt!596492 lt!596501))))

(assert (=> d!144667 (= (addApplyDifferent!572 lt!596492 lt!596508 minValue!1245 lt!596501) lt!596626)))

(declare-fun b!1349814 () Bool)

(assert (=> b!1349814 (= e!767858 (not (= lt!596501 lt!596508)))))

(assert (= (and d!144667 res!895445) b!1349814))

(assert (=> d!144667 m!1236273))

(assert (=> d!144667 m!1236295))

(assert (=> d!144667 m!1236273))

(declare-fun m!1236603 () Bool)

(assert (=> d!144667 m!1236603))

(assert (=> d!144667 m!1236291))

(declare-fun m!1236605 () Bool)

(assert (=> d!144667 m!1236605))

(assert (=> b!1349661 d!144667))

(declare-fun d!144669 () Bool)

(assert (=> d!144669 (= (apply!1034 (+!4888 lt!596499 (tuple2!24409 lt!596510 minValue!1245)) lt!596502) (apply!1034 lt!596499 lt!596502))))

(declare-fun lt!596627 () Unit!44044)

(assert (=> d!144669 (= lt!596627 (choose!1994 lt!596499 lt!596510 minValue!1245 lt!596502))))

(declare-fun e!767859 () Bool)

(assert (=> d!144669 e!767859))

(declare-fun res!895446 () Bool)

(assert (=> d!144669 (=> (not res!895446) (not e!767859))))

(assert (=> d!144669 (= res!895446 (contains!9159 lt!596499 lt!596502))))

(assert (=> d!144669 (= (addApplyDifferent!572 lt!596499 lt!596510 minValue!1245 lt!596502) lt!596627)))

(declare-fun b!1349815 () Bool)

(assert (=> b!1349815 (= e!767859 (not (= lt!596502 lt!596510)))))

(assert (= (and d!144669 res!895446) b!1349815))

(assert (=> d!144669 m!1236279))

(assert (=> d!144669 m!1236281))

(assert (=> d!144669 m!1236279))

(declare-fun m!1236607 () Bool)

(assert (=> d!144669 m!1236607))

(assert (=> d!144669 m!1236275))

(declare-fun m!1236609 () Bool)

(assert (=> d!144669 m!1236609))

(assert (=> b!1349661 d!144669))

(declare-fun d!144671 () Bool)

(assert (=> d!144671 (= (apply!1034 lt!596495 lt!596489) (get!22469 (getValueByKey!727 (toList!11048 lt!596495) lt!596489)))))

(declare-fun bs!38675 () Bool)

(assert (= bs!38675 d!144671))

(declare-fun m!1236611 () Bool)

(assert (=> bs!38675 m!1236611))

(assert (=> bs!38675 m!1236611))

(declare-fun m!1236613 () Bool)

(assert (=> bs!38675 m!1236613))

(assert (=> b!1349661 d!144671))

(declare-fun d!144673 () Bool)

(declare-fun e!767860 () Bool)

(assert (=> d!144673 e!767860))

(declare-fun res!895448 () Bool)

(assert (=> d!144673 (=> (not res!895448) (not e!767860))))

(declare-fun lt!596630 () ListLongMap!22065)

(assert (=> d!144673 (= res!895448 (contains!9159 lt!596630 (_1!12215 (tuple2!24409 lt!596508 minValue!1245))))))

(declare-fun lt!596628 () List!31539)

(assert (=> d!144673 (= lt!596630 (ListLongMap!22066 lt!596628))))

(declare-fun lt!596631 () Unit!44044)

(declare-fun lt!596629 () Unit!44044)

(assert (=> d!144673 (= lt!596631 lt!596629)))

(assert (=> d!144673 (= (getValueByKey!727 lt!596628 (_1!12215 (tuple2!24409 lt!596508 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596508 minValue!1245))))))

(assert (=> d!144673 (= lt!596629 (lemmaContainsTupThenGetReturnValue!370 lt!596628 (_1!12215 (tuple2!24409 lt!596508 minValue!1245)) (_2!12215 (tuple2!24409 lt!596508 minValue!1245))))))

(assert (=> d!144673 (= lt!596628 (insertStrictlySorted!499 (toList!11048 lt!596492) (_1!12215 (tuple2!24409 lt!596508 minValue!1245)) (_2!12215 (tuple2!24409 lt!596508 minValue!1245))))))

(assert (=> d!144673 (= (+!4888 lt!596492 (tuple2!24409 lt!596508 minValue!1245)) lt!596630)))

(declare-fun b!1349816 () Bool)

(declare-fun res!895447 () Bool)

(assert (=> b!1349816 (=> (not res!895447) (not e!767860))))

(assert (=> b!1349816 (= res!895447 (= (getValueByKey!727 (toList!11048 lt!596630) (_1!12215 (tuple2!24409 lt!596508 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 lt!596508 minValue!1245)))))))

(declare-fun b!1349817 () Bool)

(assert (=> b!1349817 (= e!767860 (contains!9163 (toList!11048 lt!596630) (tuple2!24409 lt!596508 minValue!1245)))))

(assert (= (and d!144673 res!895448) b!1349816))

(assert (= (and b!1349816 res!895447) b!1349817))

(declare-fun m!1236615 () Bool)

(assert (=> d!144673 m!1236615))

(declare-fun m!1236617 () Bool)

(assert (=> d!144673 m!1236617))

(declare-fun m!1236619 () Bool)

(assert (=> d!144673 m!1236619))

(declare-fun m!1236621 () Bool)

(assert (=> d!144673 m!1236621))

(declare-fun m!1236623 () Bool)

(assert (=> b!1349816 m!1236623))

(declare-fun m!1236625 () Bool)

(assert (=> b!1349817 m!1236625))

(assert (=> b!1349661 d!144673))

(declare-fun d!144675 () Bool)

(assert (=> d!144675 (= (apply!1034 lt!596492 lt!596501) (get!22469 (getValueByKey!727 (toList!11048 lt!596492) lt!596501)))))

(declare-fun bs!38676 () Bool)

(assert (= bs!38676 d!144675))

(declare-fun m!1236627 () Bool)

(assert (=> bs!38676 m!1236627))

(assert (=> bs!38676 m!1236627))

(declare-fun m!1236629 () Bool)

(assert (=> bs!38676 m!1236629))

(assert (=> b!1349661 d!144675))

(declare-fun d!144677 () Bool)

(declare-fun e!767862 () Bool)

(assert (=> d!144677 e!767862))

(declare-fun res!895449 () Bool)

(assert (=> d!144677 (=> res!895449 e!767862)))

(declare-fun lt!596633 () Bool)

(assert (=> d!144677 (= res!895449 (not lt!596633))))

(declare-fun lt!596635 () Bool)

(assert (=> d!144677 (= lt!596633 lt!596635)))

(declare-fun lt!596634 () Unit!44044)

(declare-fun e!767861 () Unit!44044)

(assert (=> d!144677 (= lt!596634 e!767861)))

(declare-fun c!126646 () Bool)

(assert (=> d!144677 (= c!126646 lt!596635)))

(assert (=> d!144677 (= lt!596635 (containsKey!744 (toList!11048 lt!596507) (select (arr!44434 _keys!1571) from!1960)))))

(assert (=> d!144677 (= (contains!9159 lt!596507 (select (arr!44434 _keys!1571) from!1960)) lt!596633)))

(declare-fun b!1349818 () Bool)

(declare-fun lt!596632 () Unit!44044)

(assert (=> b!1349818 (= e!767861 lt!596632)))

(assert (=> b!1349818 (= lt!596632 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 lt!596507) (select (arr!44434 _keys!1571) from!1960)))))

(assert (=> b!1349818 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596507) (select (arr!44434 _keys!1571) from!1960)))))

(declare-fun b!1349819 () Bool)

(declare-fun Unit!44053 () Unit!44044)

(assert (=> b!1349819 (= e!767861 Unit!44053)))

(declare-fun b!1349820 () Bool)

(assert (=> b!1349820 (= e!767862 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596507) (select (arr!44434 _keys!1571) from!1960))))))

(assert (= (and d!144677 c!126646) b!1349818))

(assert (= (and d!144677 (not c!126646)) b!1349819))

(assert (= (and d!144677 (not res!895449)) b!1349820))

(assert (=> d!144677 m!1236161))

(declare-fun m!1236631 () Bool)

(assert (=> d!144677 m!1236631))

(assert (=> b!1349818 m!1236161))

(declare-fun m!1236633 () Bool)

(assert (=> b!1349818 m!1236633))

(assert (=> b!1349818 m!1236161))

(declare-fun m!1236635 () Bool)

(assert (=> b!1349818 m!1236635))

(assert (=> b!1349818 m!1236635))

(declare-fun m!1236637 () Bool)

(assert (=> b!1349818 m!1236637))

(assert (=> b!1349820 m!1236161))

(assert (=> b!1349820 m!1236635))

(assert (=> b!1349820 m!1236635))

(assert (=> b!1349820 m!1236637))

(assert (=> b!1349644 d!144677))

(declare-fun d!144679 () Bool)

(assert (=> d!144679 (= (apply!1034 lt!596533 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22469 (getValueByKey!727 (toList!11048 lt!596533) (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(declare-fun bs!38677 () Bool)

(assert (= bs!38677 d!144679))

(assert (=> bs!38677 m!1236313))

(assert (=> bs!38677 m!1236511))

(assert (=> bs!38677 m!1236511))

(declare-fun m!1236639 () Bool)

(assert (=> bs!38677 m!1236639))

(assert (=> b!1349669 d!144679))

(declare-fun d!144681 () Bool)

(declare-fun c!126649 () Bool)

(assert (=> d!144681 (= c!126649 ((_ is ValueCellFull!17897) (select (arr!44435 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun e!767865 () V!55225)

(assert (=> d!144681 (= (get!22468 (select (arr!44435 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767865)))

(declare-fun b!1349825 () Bool)

(declare-fun get!22470 (ValueCell!17897 V!55225) V!55225)

(assert (=> b!1349825 (= e!767865 (get!22470 (select (arr!44435 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349826 () Bool)

(declare-fun get!22471 (ValueCell!17897 V!55225) V!55225)

(assert (=> b!1349826 (= e!767865 (get!22471 (select (arr!44435 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144681 c!126649) b!1349825))

(assert (= (and d!144681 (not c!126649)) b!1349826))

(assert (=> b!1349825 m!1236309))

(assert (=> b!1349825 m!1236249))

(declare-fun m!1236641 () Bool)

(assert (=> b!1349825 m!1236641))

(assert (=> b!1349826 m!1236309))

(assert (=> b!1349826 m!1236249))

(declare-fun m!1236643 () Bool)

(assert (=> b!1349826 m!1236643))

(assert (=> b!1349669 d!144681))

(declare-fun d!144683 () Bool)

(declare-fun e!767867 () Bool)

(assert (=> d!144683 e!767867))

(declare-fun res!895450 () Bool)

(assert (=> d!144683 (=> res!895450 e!767867)))

(declare-fun lt!596637 () Bool)

(assert (=> d!144683 (= res!895450 (not lt!596637))))

(declare-fun lt!596639 () Bool)

(assert (=> d!144683 (= lt!596637 lt!596639)))

(declare-fun lt!596638 () Unit!44044)

(declare-fun e!767866 () Unit!44044)

(assert (=> d!144683 (= lt!596638 e!767866)))

(declare-fun c!126650 () Bool)

(assert (=> d!144683 (= c!126650 lt!596639)))

(assert (=> d!144683 (= lt!596639 (containsKey!744 (toList!11048 lt!596507) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144683 (= (contains!9159 lt!596507 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596637)))

(declare-fun b!1349827 () Bool)

(declare-fun lt!596636 () Unit!44044)

(assert (=> b!1349827 (= e!767866 lt!596636)))

(assert (=> b!1349827 (= lt!596636 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 lt!596507) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349827 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596507) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349828 () Bool)

(declare-fun Unit!44054 () Unit!44044)

(assert (=> b!1349828 (= e!767866 Unit!44054)))

(declare-fun b!1349829 () Bool)

(assert (=> b!1349829 (= e!767867 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596507) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144683 c!126650) b!1349827))

(assert (= (and d!144683 (not c!126650)) b!1349828))

(assert (= (and d!144683 (not res!895450)) b!1349829))

(declare-fun m!1236645 () Bool)

(assert (=> d!144683 m!1236645))

(declare-fun m!1236647 () Bool)

(assert (=> b!1349827 m!1236647))

(assert (=> b!1349827 m!1236375))

(assert (=> b!1349827 m!1236375))

(declare-fun m!1236649 () Bool)

(assert (=> b!1349827 m!1236649))

(assert (=> b!1349829 m!1236375))

(assert (=> b!1349829 m!1236375))

(assert (=> b!1349829 m!1236649))

(assert (=> bm!65202 d!144683))

(assert (=> b!1349685 d!144595))

(declare-fun d!144685 () Bool)

(declare-fun e!767869 () Bool)

(assert (=> d!144685 e!767869))

(declare-fun res!895451 () Bool)

(assert (=> d!144685 (=> res!895451 e!767869)))

(declare-fun lt!596641 () Bool)

(assert (=> d!144685 (= res!895451 (not lt!596641))))

(declare-fun lt!596643 () Bool)

(assert (=> d!144685 (= lt!596641 lt!596643)))

(declare-fun lt!596642 () Unit!44044)

(declare-fun e!767868 () Unit!44044)

(assert (=> d!144685 (= lt!596642 e!767868)))

(declare-fun c!126651 () Bool)

(assert (=> d!144685 (= c!126651 lt!596643)))

(assert (=> d!144685 (= lt!596643 (containsKey!744 (toList!11048 lt!596533) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144685 (= (contains!9159 lt!596533 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596641)))

(declare-fun b!1349830 () Bool)

(declare-fun lt!596640 () Unit!44044)

(assert (=> b!1349830 (= e!767868 lt!596640)))

(assert (=> b!1349830 (= lt!596640 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 lt!596533) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349830 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596533) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349831 () Bool)

(declare-fun Unit!44055 () Unit!44044)

(assert (=> b!1349831 (= e!767868 Unit!44055)))

(declare-fun b!1349832 () Bool)

(assert (=> b!1349832 (= e!767869 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596533) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144685 c!126651) b!1349830))

(assert (= (and d!144685 (not c!126651)) b!1349831))

(assert (= (and d!144685 (not res!895451)) b!1349832))

(declare-fun m!1236651 () Bool)

(assert (=> d!144685 m!1236651))

(declare-fun m!1236653 () Bool)

(assert (=> b!1349830 m!1236653))

(assert (=> b!1349830 m!1236371))

(assert (=> b!1349830 m!1236371))

(declare-fun m!1236655 () Bool)

(assert (=> b!1349830 m!1236655))

(assert (=> b!1349832 m!1236371))

(assert (=> b!1349832 m!1236371))

(assert (=> b!1349832 m!1236655))

(assert (=> bm!65209 d!144685))

(assert (=> b!1349659 d!144577))

(declare-fun d!144687 () Bool)

(assert (=> d!144687 (= (apply!1034 lt!596507 (select (arr!44434 _keys!1571) from!1960)) (get!22469 (getValueByKey!727 (toList!11048 lt!596507) (select (arr!44434 _keys!1571) from!1960))))))

(declare-fun bs!38678 () Bool)

(assert (= bs!38678 d!144687))

(assert (=> bs!38678 m!1236161))

(assert (=> bs!38678 m!1236635))

(assert (=> bs!38678 m!1236635))

(declare-fun m!1236657 () Bool)

(assert (=> bs!38678 m!1236657))

(assert (=> b!1349643 d!144687))

(declare-fun d!144689 () Bool)

(declare-fun c!126652 () Bool)

(assert (=> d!144689 (= c!126652 ((_ is ValueCellFull!17897) (select (arr!44435 _values!1303) from!1960)))))

(declare-fun e!767870 () V!55225)

(assert (=> d!144689 (= (get!22468 (select (arr!44435 _values!1303) from!1960) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767870)))

(declare-fun b!1349833 () Bool)

(assert (=> b!1349833 (= e!767870 (get!22470 (select (arr!44435 _values!1303) from!1960) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349834 () Bool)

(assert (=> b!1349834 (= e!767870 (get!22471 (select (arr!44435 _values!1303) from!1960) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144689 c!126652) b!1349833))

(assert (= (and d!144689 (not c!126652)) b!1349834))

(assert (=> b!1349833 m!1236247))

(assert (=> b!1349833 m!1236249))

(declare-fun m!1236659 () Bool)

(assert (=> b!1349833 m!1236659))

(assert (=> b!1349834 m!1236247))

(assert (=> b!1349834 m!1236249))

(declare-fun m!1236661 () Bool)

(assert (=> b!1349834 m!1236661))

(assert (=> b!1349643 d!144689))

(declare-fun d!144691 () Bool)

(declare-fun e!767871 () Bool)

(assert (=> d!144691 e!767871))

(declare-fun res!895453 () Bool)

(assert (=> d!144691 (=> (not res!895453) (not e!767871))))

(declare-fun lt!596646 () ListLongMap!22065)

(assert (=> d!144691 (= res!895453 (contains!9159 lt!596646 (_1!12215 (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!596644 () List!31539)

(assert (=> d!144691 (= lt!596646 (ListLongMap!22066 lt!596644))))

(declare-fun lt!596647 () Unit!44044)

(declare-fun lt!596645 () Unit!44044)

(assert (=> d!144691 (= lt!596647 lt!596645)))

(assert (=> d!144691 (= (getValueByKey!727 lt!596644 (_1!12215 (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!777 (_2!12215 (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144691 (= lt!596645 (lemmaContainsTupThenGetReturnValue!370 lt!596644 (_1!12215 (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12215 (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144691 (= lt!596644 (insertStrictlySorted!499 (toList!11048 (ite c!126603 call!65199 (ite c!126605 call!65204 call!65202))) (_1!12215 (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12215 (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144691 (= (+!4888 (ite c!126603 call!65199 (ite c!126605 call!65204 call!65202)) (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!596646)))

(declare-fun b!1349835 () Bool)

(declare-fun res!895452 () Bool)

(assert (=> b!1349835 (=> (not res!895452) (not e!767871))))

(assert (=> b!1349835 (= res!895452 (= (getValueByKey!727 (toList!11048 lt!596646) (_1!12215 (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!777 (_2!12215 (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1349836 () Bool)

(assert (=> b!1349836 (= e!767871 (contains!9163 (toList!11048 lt!596646) (ite (or c!126603 c!126605) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!144691 res!895453) b!1349835))

(assert (= (and b!1349835 res!895452) b!1349836))

(declare-fun m!1236663 () Bool)

(assert (=> d!144691 m!1236663))

(declare-fun m!1236665 () Bool)

(assert (=> d!144691 m!1236665))

(declare-fun m!1236667 () Bool)

(assert (=> d!144691 m!1236667))

(declare-fun m!1236669 () Bool)

(assert (=> d!144691 m!1236669))

(declare-fun m!1236671 () Bool)

(assert (=> b!1349835 m!1236671))

(declare-fun m!1236673 () Bool)

(assert (=> b!1349836 m!1236673))

(assert (=> bm!65198 d!144691))

(declare-fun d!144693 () Bool)

(declare-fun e!767872 () Bool)

(assert (=> d!144693 e!767872))

(declare-fun res!895455 () Bool)

(assert (=> d!144693 (=> (not res!895455) (not e!767872))))

(declare-fun lt!596650 () ListLongMap!22065)

(assert (=> d!144693 (= res!895455 (contains!9159 lt!596650 (_1!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!596648 () List!31539)

(assert (=> d!144693 (= lt!596650 (ListLongMap!22066 lt!596648))))

(declare-fun lt!596651 () Unit!44044)

(declare-fun lt!596649 () Unit!44044)

(assert (=> d!144693 (= lt!596651 lt!596649)))

(assert (=> d!144693 (= (getValueByKey!727 lt!596648 (_1!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144693 (= lt!596649 (lemmaContainsTupThenGetReturnValue!370 lt!596648 (_1!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144693 (= lt!596648 (insertStrictlySorted!499 (toList!11048 call!65207) (_1!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144693 (= (+!4888 call!65207 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!596650)))

(declare-fun b!1349837 () Bool)

(declare-fun res!895454 () Bool)

(assert (=> b!1349837 (=> (not res!895454) (not e!767872))))

(assert (=> b!1349837 (= res!895454 (= (getValueByKey!727 (toList!11048 lt!596650) (_1!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1349838 () Bool)

(assert (=> b!1349838 (= e!767872 (contains!9163 (toList!11048 lt!596650) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!144693 res!895455) b!1349837))

(assert (= (and b!1349837 res!895454) b!1349838))

(declare-fun m!1236675 () Bool)

(assert (=> d!144693 m!1236675))

(declare-fun m!1236677 () Bool)

(assert (=> d!144693 m!1236677))

(declare-fun m!1236679 () Bool)

(assert (=> d!144693 m!1236679))

(declare-fun m!1236681 () Bool)

(assert (=> d!144693 m!1236681))

(declare-fun m!1236683 () Bool)

(assert (=> b!1349837 m!1236683))

(declare-fun m!1236685 () Bool)

(assert (=> b!1349838 m!1236685))

(assert (=> b!1349676 d!144693))

(declare-fun d!144695 () Bool)

(declare-fun e!767873 () Bool)

(assert (=> d!144695 e!767873))

(declare-fun res!895457 () Bool)

(assert (=> d!144695 (=> (not res!895457) (not e!767873))))

(declare-fun lt!596654 () ListLongMap!22065)

(assert (=> d!144695 (= res!895457 (contains!9159 lt!596654 (_1!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!596652 () List!31539)

(assert (=> d!144695 (= lt!596654 (ListLongMap!22066 lt!596652))))

(declare-fun lt!596655 () Unit!44044)

(declare-fun lt!596653 () Unit!44044)

(assert (=> d!144695 (= lt!596655 lt!596653)))

(assert (=> d!144695 (= (getValueByKey!727 lt!596652 (_1!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144695 (= lt!596653 (lemmaContainsTupThenGetReturnValue!370 lt!596652 (_1!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144695 (= lt!596652 (insertStrictlySorted!499 (toList!11048 call!65200) (_1!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144695 (= (+!4888 call!65200 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!596654)))

(declare-fun b!1349839 () Bool)

(declare-fun res!895456 () Bool)

(assert (=> b!1349839 (=> (not res!895456) (not e!767873))))

(assert (=> b!1349839 (= res!895456 (= (getValueByKey!727 (toList!11048 lt!596654) (_1!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!777 (_2!12215 (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1349840 () Bool)

(assert (=> b!1349840 (= e!767873 (contains!9163 (toList!11048 lt!596654) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!144695 res!895457) b!1349839))

(assert (= (and b!1349839 res!895456) b!1349840))

(declare-fun m!1236687 () Bool)

(assert (=> d!144695 m!1236687))

(declare-fun m!1236689 () Bool)

(assert (=> d!144695 m!1236689))

(declare-fun m!1236691 () Bool)

(assert (=> d!144695 m!1236691))

(declare-fun m!1236693 () Bool)

(assert (=> d!144695 m!1236693))

(declare-fun m!1236695 () Bool)

(assert (=> b!1349839 m!1236695))

(declare-fun m!1236697 () Bool)

(assert (=> b!1349840 m!1236697))

(assert (=> b!1349650 d!144695))

(declare-fun d!144697 () Bool)

(assert (=> d!144697 (= (apply!1034 lt!596533 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22469 (getValueByKey!727 (toList!11048 lt!596533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38679 () Bool)

(assert (= bs!38679 d!144697))

(declare-fun m!1236699 () Bool)

(assert (=> bs!38679 m!1236699))

(assert (=> bs!38679 m!1236699))

(declare-fun m!1236701 () Bool)

(assert (=> bs!38679 m!1236701))

(assert (=> b!1349675 d!144697))

(declare-fun d!144699 () Bool)

(assert (=> d!144699 (= (validKeyInArray!0 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000)) (and (not (= (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349701 d!144699))

(assert (=> b!1349599 d!144639))

(assert (=> b!1349599 d!144641))

(declare-fun b!1349841 () Bool)

(declare-fun e!767876 () Bool)

(declare-fun e!767874 () Bool)

(assert (=> b!1349841 (= e!767876 e!767874)))

(declare-fun res!895459 () Bool)

(assert (=> b!1349841 (=> (not res!895459) (not e!767874))))

(declare-fun e!767875 () Bool)

(assert (=> b!1349841 (= res!895459 (not e!767875))))

(declare-fun res!895460 () Bool)

(assert (=> b!1349841 (=> (not res!895460) (not e!767875))))

(assert (=> b!1349841 (= res!895460 (validKeyInArray!0 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!126653 () Bool)

(declare-fun bm!65217 () Bool)

(declare-fun call!65220 () Bool)

(assert (=> bm!65217 (= call!65220 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126653 (Cons!31536 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126618 (Cons!31536 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) Nil!31537) Nil!31537)) (ite c!126618 (Cons!31536 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) Nil!31537) Nil!31537))))))

(declare-fun b!1349842 () Bool)

(declare-fun e!767877 () Bool)

(assert (=> b!1349842 (= e!767877 call!65220)))

(declare-fun b!1349843 () Bool)

(assert (=> b!1349843 (= e!767874 e!767877)))

(assert (=> b!1349843 (= c!126653 (validKeyInArray!0 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!144701 () Bool)

(declare-fun res!895458 () Bool)

(assert (=> d!144701 (=> res!895458 e!767876)))

(assert (=> d!144701 (= res!895458 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44986 _keys!1571)))))

(assert (=> d!144701 (= (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126618 (Cons!31536 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) Nil!31537) Nil!31537)) e!767876)))

(declare-fun b!1349844 () Bool)

(assert (=> b!1349844 (= e!767877 call!65220)))

(declare-fun b!1349845 () Bool)

(assert (=> b!1349845 (= e!767875 (contains!9162 (ite c!126618 (Cons!31536 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) Nil!31537) Nil!31537) (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!144701 (not res!895458)) b!1349841))

(assert (= (and b!1349841 res!895460) b!1349845))

(assert (= (and b!1349841 res!895459) b!1349843))

(assert (= (and b!1349843 c!126653) b!1349844))

(assert (= (and b!1349843 (not c!126653)) b!1349842))

(assert (= (or b!1349844 b!1349842) bm!65217))

(declare-fun m!1236703 () Bool)

(assert (=> b!1349841 m!1236703))

(assert (=> b!1349841 m!1236703))

(declare-fun m!1236705 () Bool)

(assert (=> b!1349841 m!1236705))

(assert (=> bm!65217 m!1236703))

(declare-fun m!1236707 () Bool)

(assert (=> bm!65217 m!1236707))

(assert (=> b!1349843 m!1236703))

(assert (=> b!1349843 m!1236703))

(assert (=> b!1349843 m!1236705))

(assert (=> b!1349845 m!1236703))

(assert (=> b!1349845 m!1236703))

(declare-fun m!1236709 () Bool)

(assert (=> b!1349845 m!1236709))

(assert (=> bm!65212 d!144701))

(declare-fun d!144703 () Bool)

(assert (=> d!144703 (= (apply!1034 lt!596507 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22469 (getValueByKey!727 (toList!11048 lt!596507) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38680 () Bool)

(assert (= bs!38680 d!144703))

(declare-fun m!1236711 () Bool)

(assert (=> bs!38680 m!1236711))

(assert (=> bs!38680 m!1236711))

(declare-fun m!1236713 () Bool)

(assert (=> bs!38680 m!1236713))

(assert (=> b!1349649 d!144703))

(assert (=> d!144591 d!144583))

(assert (=> b!1349699 d!144699))

(declare-fun d!144705 () Bool)

(declare-fun res!895465 () Bool)

(declare-fun e!767882 () Bool)

(assert (=> d!144705 (=> res!895465 e!767882)))

(assert (=> d!144705 (= res!895465 (and ((_ is Cons!31535) (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144705 (= (containsKey!744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142) e!767882)))

(declare-fun b!1349850 () Bool)

(declare-fun e!767883 () Bool)

(assert (=> b!1349850 (= e!767882 e!767883)))

(declare-fun res!895466 () Bool)

(assert (=> b!1349850 (=> (not res!895466) (not e!767883))))

(assert (=> b!1349850 (= res!895466 (and (or (not ((_ is Cons!31535) (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (bvsle (_1!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)) ((_ is Cons!31535) (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvslt (_1!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1349851 () Bool)

(assert (=> b!1349851 (= e!767883 (containsKey!744 (t!46187 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) k0!1142))))

(assert (= (and d!144705 (not res!895465)) b!1349850))

(assert (= (and b!1349850 res!895466) b!1349851))

(declare-fun m!1236715 () Bool)

(assert (=> b!1349851 m!1236715))

(assert (=> d!144589 d!144705))

(declare-fun d!144707 () Bool)

(assert (=> d!144707 (isDefined!534 (getValueByKey!727 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun lt!596656 () Unit!44044)

(assert (=> d!144707 (= lt!596656 (choose!1995 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun e!767884 () Bool)

(assert (=> d!144707 e!767884))

(declare-fun res!895467 () Bool)

(assert (=> d!144707 (=> (not res!895467) (not e!767884))))

(assert (=> d!144707 (= res!895467 (isStrictlySorted!880 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))))

(assert (=> d!144707 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142) lt!596656)))

(declare-fun b!1349852 () Bool)

(assert (=> b!1349852 (= e!767884 (containsKey!744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (= (and d!144707 res!895467) b!1349852))

(assert (=> d!144707 m!1236305))

(assert (=> d!144707 m!1236305))

(assert (=> d!144707 m!1236307))

(declare-fun m!1236717 () Bool)

(assert (=> d!144707 m!1236717))

(declare-fun m!1236719 () Bool)

(assert (=> d!144707 m!1236719))

(assert (=> b!1349852 m!1236301))

(assert (=> b!1349665 d!144707))

(assert (=> b!1349665 d!144601))

(assert (=> b!1349665 d!144603))

(assert (=> b!1349590 d!144699))

(declare-fun d!144709 () Bool)

(declare-fun res!895468 () Bool)

(declare-fun e!767885 () Bool)

(assert (=> d!144709 (=> res!895468 e!767885)))

(assert (=> d!144709 (= res!895468 (and ((_ is Cons!31535) (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144709 (= (containsKey!744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!767885)))

(declare-fun b!1349853 () Bool)

(declare-fun e!767886 () Bool)

(assert (=> b!1349853 (= e!767885 e!767886)))

(declare-fun res!895469 () Bool)

(assert (=> b!1349853 (=> (not res!895469) (not e!767886))))

(assert (=> b!1349853 (= res!895469 (and (or (not ((_ is Cons!31535) (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) (bvsle (_1!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)) ((_ is Cons!31535) (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (bvslt (_1!12215 (h!32744 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1349854 () Bool)

(assert (=> b!1349854 (= e!767886 (containsKey!744 (t!46187 (toList!11048 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!144709 (not res!895468)) b!1349853))

(assert (= (and b!1349853 res!895469) b!1349854))

(declare-fun m!1236721 () Bool)

(assert (=> b!1349854 m!1236721))

(assert (=> d!144579 d!144709))

(declare-fun b!1349855 () Bool)

(declare-fun e!767887 () Bool)

(declare-fun e!767889 () Bool)

(assert (=> b!1349855 (= e!767887 e!767889)))

(declare-fun lt!596657 () (_ BitVec 64))

(assert (=> b!1349855 (= lt!596657 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!596659 () Unit!44044)

(assert (=> b!1349855 (= lt!596659 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596657 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1349855 (arrayContainsKey!0 _keys!1571 lt!596657 #b00000000000000000000000000000000)))

(declare-fun lt!596658 () Unit!44044)

(assert (=> b!1349855 (= lt!596658 lt!596659)))

(declare-fun res!895471 () Bool)

(assert (=> b!1349855 (= res!895471 (= (seekEntryOrOpen!0 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1571 mask!1977) (Found!10059 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1349855 (=> (not res!895471) (not e!767889))))

(declare-fun d!144711 () Bool)

(declare-fun res!895470 () Bool)

(declare-fun e!767888 () Bool)

(assert (=> d!144711 (=> res!895470 e!767888)))

(assert (=> d!144711 (= res!895470 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44986 _keys!1571)))))

(assert (=> d!144711 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977) e!767888)))

(declare-fun b!1349856 () Bool)

(declare-fun call!65221 () Bool)

(assert (=> b!1349856 (= e!767889 call!65221)))

(declare-fun bm!65218 () Bool)

(assert (=> bm!65218 (= call!65221 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1349857 () Bool)

(assert (=> b!1349857 (= e!767887 call!65221)))

(declare-fun b!1349858 () Bool)

(assert (=> b!1349858 (= e!767888 e!767887)))

(declare-fun c!126654 () Bool)

(assert (=> b!1349858 (= c!126654 (validKeyInArray!0 (select (arr!44434 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!144711 (not res!895470)) b!1349858))

(assert (= (and b!1349858 c!126654) b!1349855))

(assert (= (and b!1349858 (not c!126654)) b!1349857))

(assert (= (and b!1349855 res!895471) b!1349856))

(assert (= (or b!1349856 b!1349857) bm!65218))

(assert (=> b!1349855 m!1236703))

(declare-fun m!1236723 () Bool)

(assert (=> b!1349855 m!1236723))

(declare-fun m!1236725 () Bool)

(assert (=> b!1349855 m!1236725))

(assert (=> b!1349855 m!1236703))

(declare-fun m!1236727 () Bool)

(assert (=> b!1349855 m!1236727))

(declare-fun m!1236729 () Bool)

(assert (=> bm!65218 m!1236729))

(assert (=> b!1349858 m!1236703))

(assert (=> b!1349858 m!1236703))

(assert (=> b!1349858 m!1236705))

(assert (=> bm!65181 d!144711))

(declare-fun d!144713 () Bool)

(declare-fun e!767891 () Bool)

(assert (=> d!144713 e!767891))

(declare-fun res!895472 () Bool)

(assert (=> d!144713 (=> res!895472 e!767891)))

(declare-fun lt!596661 () Bool)

(assert (=> d!144713 (= res!895472 (not lt!596661))))

(declare-fun lt!596663 () Bool)

(assert (=> d!144713 (= lt!596661 lt!596663)))

(declare-fun lt!596662 () Unit!44044)

(declare-fun e!767890 () Unit!44044)

(assert (=> d!144713 (= lt!596662 e!767890)))

(declare-fun c!126655 () Bool)

(assert (=> d!144713 (= c!126655 lt!596663)))

(assert (=> d!144713 (= lt!596663 (containsKey!744 (toList!11048 lt!596533) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144713 (= (contains!9159 lt!596533 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596661)))

(declare-fun b!1349859 () Bool)

(declare-fun lt!596660 () Unit!44044)

(assert (=> b!1349859 (= e!767890 lt!596660)))

(assert (=> b!1349859 (= lt!596660 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 lt!596533) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349859 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596533) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349860 () Bool)

(declare-fun Unit!44056 () Unit!44044)

(assert (=> b!1349860 (= e!767890 Unit!44056)))

(declare-fun b!1349861 () Bool)

(assert (=> b!1349861 (= e!767891 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144713 c!126655) b!1349859))

(assert (= (and d!144713 (not c!126655)) b!1349860))

(assert (= (and d!144713 (not res!895472)) b!1349861))

(declare-fun m!1236731 () Bool)

(assert (=> d!144713 m!1236731))

(declare-fun m!1236733 () Bool)

(assert (=> b!1349859 m!1236733))

(assert (=> b!1349859 m!1236699))

(assert (=> b!1349859 m!1236699))

(declare-fun m!1236735 () Bool)

(assert (=> b!1349859 m!1236735))

(assert (=> b!1349861 m!1236699))

(assert (=> b!1349861 m!1236699))

(assert (=> b!1349861 m!1236735))

(assert (=> bm!65207 d!144713))

(declare-fun d!144715 () Bool)

(assert (=> d!144715 (arrayContainsKey!0 _keys!1571 lt!596430 #b00000000000000000000000000000000)))

(declare-fun lt!596666 () Unit!44044)

(declare-fun choose!13 (array!91963 (_ BitVec 64) (_ BitVec 32)) Unit!44044)

(assert (=> d!144715 (= lt!596666 (choose!13 _keys!1571 lt!596430 #b00000000000000000000000000000000))))

(assert (=> d!144715 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!144715 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596430 #b00000000000000000000000000000000) lt!596666)))

(declare-fun bs!38681 () Bool)

(assert (= bs!38681 d!144715))

(assert (=> bs!38681 m!1236231))

(declare-fun m!1236737 () Bool)

(assert (=> bs!38681 m!1236737))

(assert (=> b!1349587 d!144715))

(declare-fun d!144717 () Bool)

(declare-fun res!895477 () Bool)

(declare-fun e!767896 () Bool)

(assert (=> d!144717 (=> res!895477 e!767896)))

(assert (=> d!144717 (= res!895477 (= (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) lt!596430))))

(assert (=> d!144717 (= (arrayContainsKey!0 _keys!1571 lt!596430 #b00000000000000000000000000000000) e!767896)))

(declare-fun b!1349866 () Bool)

(declare-fun e!767897 () Bool)

(assert (=> b!1349866 (= e!767896 e!767897)))

(declare-fun res!895478 () Bool)

(assert (=> b!1349866 (=> (not res!895478) (not e!767897))))

(assert (=> b!1349866 (= res!895478 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44986 _keys!1571)))))

(declare-fun b!1349867 () Bool)

(assert (=> b!1349867 (= e!767897 (arrayContainsKey!0 _keys!1571 lt!596430 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!144717 (not res!895477)) b!1349866))

(assert (= (and b!1349866 res!895478) b!1349867))

(assert (=> d!144717 m!1236227))

(declare-fun m!1236739 () Bool)

(assert (=> b!1349867 m!1236739))

(assert (=> b!1349587 d!144717))

(declare-fun b!1349880 () Bool)

(declare-fun e!767906 () SeekEntryResult!10059)

(declare-fun lt!596675 () SeekEntryResult!10059)

(assert (=> b!1349880 (= e!767906 (Found!10059 (index!42609 lt!596675)))))

(declare-fun b!1349881 () Bool)

(declare-fun e!767904 () SeekEntryResult!10059)

(assert (=> b!1349881 (= e!767904 e!767906)))

(declare-fun lt!596674 () (_ BitVec 64))

(assert (=> b!1349881 (= lt!596674 (select (arr!44434 _keys!1571) (index!42609 lt!596675)))))

(declare-fun c!126664 () Bool)

(assert (=> b!1349881 (= c!126664 (= lt!596674 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349882 () Bool)

(declare-fun c!126662 () Bool)

(assert (=> b!1349882 (= c!126662 (= lt!596674 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!767905 () SeekEntryResult!10059)

(assert (=> b!1349882 (= e!767906 e!767905)))

(declare-fun b!1349883 () Bool)

(assert (=> b!1349883 (= e!767905 (MissingZero!10059 (index!42609 lt!596675)))))

(declare-fun b!1349884 () Bool)

(assert (=> b!1349884 (= e!767904 Undefined!10059)))

(declare-fun d!144719 () Bool)

(declare-fun lt!596673 () SeekEntryResult!10059)

(assert (=> d!144719 (and (or ((_ is Undefined!10059) lt!596673) (not ((_ is Found!10059) lt!596673)) (and (bvsge (index!42608 lt!596673) #b00000000000000000000000000000000) (bvslt (index!42608 lt!596673) (size!44986 _keys!1571)))) (or ((_ is Undefined!10059) lt!596673) ((_ is Found!10059) lt!596673) (not ((_ is MissingZero!10059) lt!596673)) (and (bvsge (index!42607 lt!596673) #b00000000000000000000000000000000) (bvslt (index!42607 lt!596673) (size!44986 _keys!1571)))) (or ((_ is Undefined!10059) lt!596673) ((_ is Found!10059) lt!596673) ((_ is MissingZero!10059) lt!596673) (not ((_ is MissingVacant!10059) lt!596673)) (and (bvsge (index!42610 lt!596673) #b00000000000000000000000000000000) (bvslt (index!42610 lt!596673) (size!44986 _keys!1571)))) (or ((_ is Undefined!10059) lt!596673) (ite ((_ is Found!10059) lt!596673) (= (select (arr!44434 _keys!1571) (index!42608 lt!596673)) (select (arr!44434 _keys!1571) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10059) lt!596673) (= (select (arr!44434 _keys!1571) (index!42607 lt!596673)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10059) lt!596673) (= (select (arr!44434 _keys!1571) (index!42610 lt!596673)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144719 (= lt!596673 e!767904)))

(declare-fun c!126663 () Bool)

(assert (=> d!144719 (= c!126663 (and ((_ is Intermediate!10059) lt!596675) (undefined!10871 lt!596675)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91963 (_ BitVec 32)) SeekEntryResult!10059)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!144719 (= lt!596675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) mask!1977) (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(assert (=> d!144719 (validMask!0 mask!1977)))

(assert (=> d!144719 (= (seekEntryOrOpen!0 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) lt!596673)))

(declare-fun b!1349885 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91963 (_ BitVec 32)) SeekEntryResult!10059)

(assert (=> b!1349885 (= e!767905 (seekKeyOrZeroReturnVacant!0 (x!120775 lt!596675) (index!42609 lt!596675) (index!42609 lt!596675) (select (arr!44434 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(assert (= (and d!144719 c!126663) b!1349884))

(assert (= (and d!144719 (not c!126663)) b!1349881))

(assert (= (and b!1349881 c!126664) b!1349880))

(assert (= (and b!1349881 (not c!126664)) b!1349882))

(assert (= (and b!1349882 c!126662) b!1349883))

(assert (= (and b!1349882 (not c!126662)) b!1349885))

(declare-fun m!1236741 () Bool)

(assert (=> b!1349881 m!1236741))

(declare-fun m!1236743 () Bool)

(assert (=> d!144719 m!1236743))

(declare-fun m!1236745 () Bool)

(assert (=> d!144719 m!1236745))

(assert (=> d!144719 m!1236155))

(assert (=> d!144719 m!1236227))

(declare-fun m!1236747 () Bool)

(assert (=> d!144719 m!1236747))

(assert (=> d!144719 m!1236747))

(assert (=> d!144719 m!1236227))

(declare-fun m!1236749 () Bool)

(assert (=> d!144719 m!1236749))

(declare-fun m!1236751 () Bool)

(assert (=> d!144719 m!1236751))

(assert (=> b!1349885 m!1236227))

(declare-fun m!1236753 () Bool)

(assert (=> b!1349885 m!1236753))

(assert (=> b!1349587 d!144719))

(assert (=> bm!65199 d!144653))

(declare-fun d!144721 () Bool)

(declare-fun e!767907 () Bool)

(assert (=> d!144721 e!767907))

(declare-fun res!895480 () Bool)

(assert (=> d!144721 (=> (not res!895480) (not e!767907))))

(declare-fun lt!596678 () ListLongMap!22065)

(assert (=> d!144721 (= res!895480 (contains!9159 lt!596678 (_1!12215 (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!596676 () List!31539)

(assert (=> d!144721 (= lt!596678 (ListLongMap!22066 lt!596676))))

(declare-fun lt!596679 () Unit!44044)

(declare-fun lt!596677 () Unit!44044)

(assert (=> d!144721 (= lt!596679 lt!596677)))

(assert (=> d!144721 (= (getValueByKey!727 lt!596676 (_1!12215 (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!777 (_2!12215 (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144721 (= lt!596677 (lemmaContainsTupThenGetReturnValue!370 lt!596676 (_1!12215 (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12215 (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144721 (= lt!596676 (insertStrictlySorted!499 (toList!11048 (ite c!126610 call!65206 (ite c!126612 call!65211 call!65209))) (_1!12215 (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12215 (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144721 (= (+!4888 (ite c!126610 call!65206 (ite c!126612 call!65211 call!65209)) (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!596678)))

(declare-fun b!1349886 () Bool)

(declare-fun res!895479 () Bool)

(assert (=> b!1349886 (=> (not res!895479) (not e!767907))))

(assert (=> b!1349886 (= res!895479 (= (getValueByKey!727 (toList!11048 lt!596678) (_1!12215 (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!777 (_2!12215 (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1349887 () Bool)

(assert (=> b!1349887 (= e!767907 (contains!9163 (toList!11048 lt!596678) (ite (or c!126610 c!126612) (tuple2!24409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!144721 res!895480) b!1349886))

(assert (= (and b!1349886 res!895479) b!1349887))

(declare-fun m!1236755 () Bool)

(assert (=> d!144721 m!1236755))

(declare-fun m!1236757 () Bool)

(assert (=> d!144721 m!1236757))

(declare-fun m!1236759 () Bool)

(assert (=> d!144721 m!1236759))

(declare-fun m!1236761 () Bool)

(assert (=> d!144721 m!1236761))

(declare-fun m!1236763 () Bool)

(assert (=> b!1349886 m!1236763))

(declare-fun m!1236765 () Bool)

(assert (=> b!1349887 m!1236765))

(assert (=> bm!65205 d!144721))

(declare-fun d!144723 () Bool)

(declare-fun lt!596682 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!665 (List!31540) (InoxSet (_ BitVec 64)))

(assert (=> d!144723 (= lt!596682 (select (content!665 Nil!31537) (select (arr!44434 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun e!767912 () Bool)

(assert (=> d!144723 (= lt!596682 e!767912)))

(declare-fun res!895486 () Bool)

(assert (=> d!144723 (=> (not res!895486) (not e!767912))))

(assert (=> d!144723 (= res!895486 ((_ is Cons!31536) Nil!31537))))

(assert (=> d!144723 (= (contains!9162 Nil!31537 (select (arr!44434 _keys!1571) #b00000000000000000000000000000000)) lt!596682)))

(declare-fun b!1349892 () Bool)

(declare-fun e!767913 () Bool)

(assert (=> b!1349892 (= e!767912 e!767913)))

(declare-fun res!895485 () Bool)

(assert (=> b!1349892 (=> res!895485 e!767913)))

(assert (=> b!1349892 (= res!895485 (= (h!32745 Nil!31537) (select (arr!44434 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349893 () Bool)

(assert (=> b!1349893 (= e!767913 (contains!9162 (t!46188 Nil!31537) (select (arr!44434 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144723 res!895486) b!1349892))

(assert (= (and b!1349892 (not res!895485)) b!1349893))

(declare-fun m!1236767 () Bool)

(assert (=> d!144723 m!1236767))

(assert (=> d!144723 m!1236227))

(declare-fun m!1236769 () Bool)

(assert (=> d!144723 m!1236769))

(assert (=> b!1349893 m!1236227))

(declare-fun m!1236771 () Bool)

(assert (=> b!1349893 m!1236771))

(assert (=> b!1349703 d!144723))

(declare-fun d!144725 () Bool)

(declare-fun e!767915 () Bool)

(assert (=> d!144725 e!767915))

(declare-fun res!895487 () Bool)

(assert (=> d!144725 (=> res!895487 e!767915)))

(declare-fun lt!596684 () Bool)

(assert (=> d!144725 (= res!895487 (not lt!596684))))

(declare-fun lt!596686 () Bool)

(assert (=> d!144725 (= lt!596684 lt!596686)))

(declare-fun lt!596685 () Unit!44044)

(declare-fun e!767914 () Unit!44044)

(assert (=> d!144725 (= lt!596685 e!767914)))

(declare-fun c!126665 () Bool)

(assert (=> d!144725 (= c!126665 lt!596686)))

(assert (=> d!144725 (= lt!596686 (containsKey!744 (toList!11048 lt!596507) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144725 (= (contains!9159 lt!596507 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596684)))

(declare-fun b!1349894 () Bool)

(declare-fun lt!596683 () Unit!44044)

(assert (=> b!1349894 (= e!767914 lt!596683)))

(assert (=> b!1349894 (= lt!596683 (lemmaContainsKeyImpliesGetValueByKeyDefined!491 (toList!11048 lt!596507) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349894 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596507) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349895 () Bool)

(declare-fun Unit!44057 () Unit!44044)

(assert (=> b!1349895 (= e!767914 Unit!44057)))

(declare-fun b!1349896 () Bool)

(assert (=> b!1349896 (= e!767915 (isDefined!534 (getValueByKey!727 (toList!11048 lt!596507) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144725 c!126665) b!1349894))

(assert (= (and d!144725 (not c!126665)) b!1349895))

(assert (= (and d!144725 (not res!895487)) b!1349896))

(declare-fun m!1236773 () Bool)

(assert (=> d!144725 m!1236773))

(declare-fun m!1236775 () Bool)

(assert (=> b!1349894 m!1236775))

(assert (=> b!1349894 m!1236711))

(assert (=> b!1349894 m!1236711))

(declare-fun m!1236777 () Bool)

(assert (=> b!1349894 m!1236777))

(assert (=> b!1349896 m!1236711))

(assert (=> b!1349896 m!1236711))

(assert (=> b!1349896 m!1236777))

(assert (=> bm!65200 d!144725))

(assert (=> bm!65206 d!144629))

(declare-fun b!1349897 () Bool)

(declare-fun e!767917 () Bool)

(assert (=> b!1349897 (= e!767917 tp_is_empty!37591)))

(declare-fun mapNonEmpty!58117 () Bool)

(declare-fun mapRes!58117 () Bool)

(declare-fun tp!110609 () Bool)

(assert (=> mapNonEmpty!58117 (= mapRes!58117 (and tp!110609 e!767917))))

(declare-fun mapKey!58117 () (_ BitVec 32))

(declare-fun mapRest!58117 () (Array (_ BitVec 32) ValueCell!17897))

(declare-fun mapValue!58117 () ValueCell!17897)

(assert (=> mapNonEmpty!58117 (= mapRest!58116 (store mapRest!58117 mapKey!58117 mapValue!58117))))

(declare-fun condMapEmpty!58117 () Bool)

(declare-fun mapDefault!58117 () ValueCell!17897)

(assert (=> mapNonEmpty!58116 (= condMapEmpty!58117 (= mapRest!58116 ((as const (Array (_ BitVec 32) ValueCell!17897)) mapDefault!58117)))))

(declare-fun e!767916 () Bool)

(assert (=> mapNonEmpty!58116 (= tp!110608 (and e!767916 mapRes!58117))))

(declare-fun mapIsEmpty!58117 () Bool)

(assert (=> mapIsEmpty!58117 mapRes!58117))

(declare-fun b!1349898 () Bool)

(assert (=> b!1349898 (= e!767916 tp_is_empty!37591)))

(assert (= (and mapNonEmpty!58116 condMapEmpty!58117) mapIsEmpty!58117))

(assert (= (and mapNonEmpty!58116 (not condMapEmpty!58117)) mapNonEmpty!58117))

(assert (= (and mapNonEmpty!58117 ((_ is ValueCellFull!17897) mapValue!58117)) b!1349897))

(assert (= (and mapNonEmpty!58116 ((_ is ValueCellFull!17897) mapDefault!58117)) b!1349898))

(declare-fun m!1236779 () Bool)

(assert (=> mapNonEmpty!58117 m!1236779))

(declare-fun b_lambda!24725 () Bool)

(assert (= b_lambda!24721 (or (and start!113706 b_free!31591) b_lambda!24725)))

(declare-fun b_lambda!24727 () Bool)

(assert (= b_lambda!24723 (or (and start!113706 b_free!31591) b_lambda!24727)))

(declare-fun b_lambda!24729 () Bool)

(assert (= b_lambda!24717 (or (and start!113706 b_free!31591) b_lambda!24729)))

(declare-fun b_lambda!24731 () Bool)

(assert (= b_lambda!24719 (or (and start!113706 b_free!31591) b_lambda!24731)))

(check-sat (not b!1349799) (not d!144609) (not d!144663) (not b!1349825) (not b_lambda!24715) (not d!144637) (not b!1349726) (not d!144687) (not d!144691) (not d!144623) (not b!1349817) (not d!144693) (not b!1349893) (not b!1349861) (not d!144651) (not b_lambda!24727) (not b!1349801) (not b!1349818) (not d!144599) (not b!1349774) (not d!144601) (not d!144617) (not b!1349787) (not d!144633) (not d!144679) (not b!1349811) (not d!144619) (not b!1349772) (not b!1349807) (not d!144629) (not b!1349732) (not b!1349885) (not d!144673) (not b!1349816) (not bm!65216) (not b!1349789) (not b!1349736) (not b!1349836) (not b!1349845) (not b!1349833) (not b!1349806) (not d!144657) (not b!1349742) (not d!144659) (not d!144723) (not b!1349827) b_and!50987 (not b!1349854) (not d!144725) (not b_lambda!24729) (not b!1349724) (not d!144621) (not d!144639) (not d!144685) (not d!144707) (not b!1349832) (not b!1349812) (not b!1349737) (not b!1349887) (not d!144649) (not b!1349852) (not b!1349770) (not b!1349894) (not d!144635) (not b!1349792) (not d!144655) (not b!1349804) (not b!1349722) (not b!1349837) (not d!144677) (not b!1349777) (not b!1349797) (not b!1349859) (not b!1349843) (not d!144653) (not b!1349743) (not d!144703) (not d!144625) (not d!144611) (not b!1349820) (not b!1349855) (not b!1349734) (not b!1349830) (not b!1349769) (not b!1349791) (not b!1349834) (not b!1349829) (not b_lambda!24725) (not b!1349858) (not b!1349733) (not b!1349779) (not b_next!31591) (not bm!65215) (not b!1349813) (not d!144613) (not bm!65217) (not d!144683) (not d!144645) (not b!1349773) (not d!144719) (not b!1349838) (not b!1349886) (not b!1349800) (not d!144597) (not b!1349835) (not d!144631) (not bm!65218) (not b!1349896) (not b!1349841) (not b!1349809) (not mapNonEmpty!58117) (not b!1349798) (not b_lambda!24731) (not d!144695) (not b!1349867) (not d!144661) (not b!1349793) (not b!1349851) (not b!1349839) (not d!144665) (not b!1349735) (not b!1349840) (not b!1349826) (not d!144605) (not d!144667) (not b!1349771) (not d!144615) (not d!144643) tp_is_empty!37591 (not b_lambda!24713) (not d!144713) (not d!144647) (not b!1349784) (not d!144669) (not d!144607) (not d!144721) (not d!144697) (not d!144671) (not d!144715) (not d!144627) (not b!1349810) (not b!1349796) (not d!144675))
(check-sat b_and!50987 (not b_next!31591))
