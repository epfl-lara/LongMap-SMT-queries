; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111236 () Bool)

(assert start!111236)

(declare-fun b!1316771 () Bool)

(declare-fun e!751231 () Bool)

(declare-datatypes ((array!88460 0))(
  ( (array!88461 (arr!42708 (Array (_ BitVec 32) (_ BitVec 64))) (size!43258 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88460)

(assert (=> b!1316771 (= e!751231 (bvsgt #b00000000000000000000000000000000 (size!43258 _keys!1609)))))

(declare-fun b!1316772 () Bool)

(declare-fun res!874038 () Bool)

(assert (=> b!1316772 (=> (not res!874038) (not e!751231))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88460 (_ BitVec 32)) Bool)

(assert (=> b!1316772 (= res!874038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1316773 () Bool)

(declare-fun e!751233 () Bool)

(declare-fun e!751234 () Bool)

(declare-fun mapRes!55262 () Bool)

(assert (=> b!1316773 (= e!751233 (and e!751234 mapRes!55262))))

(declare-fun condMapEmpty!55262 () Bool)

(declare-datatypes ((V!52771 0))(
  ( (V!52772 (val!17950 Int)) )
))
(declare-datatypes ((ValueCell!16977 0))(
  ( (ValueCellFull!16977 (v!20579 V!52771)) (EmptyCell!16977) )
))
(declare-datatypes ((array!88462 0))(
  ( (array!88463 (arr!42709 (Array (_ BitVec 32) ValueCell!16977)) (size!43259 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88462)

(declare-fun mapDefault!55262 () ValueCell!16977)

(assert (=> b!1316773 (= condMapEmpty!55262 (= (arr!42709 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16977)) mapDefault!55262)))))

(declare-fun mapNonEmpty!55262 () Bool)

(declare-fun tp!105368 () Bool)

(declare-fun e!751232 () Bool)

(assert (=> mapNonEmpty!55262 (= mapRes!55262 (and tp!105368 e!751232))))

(declare-fun mapKey!55262 () (_ BitVec 32))

(declare-fun mapValue!55262 () ValueCell!16977)

(declare-fun mapRest!55262 () (Array (_ BitVec 32) ValueCell!16977))

(assert (=> mapNonEmpty!55262 (= (arr!42709 _values!1337) (store mapRest!55262 mapKey!55262 mapValue!55262))))

(declare-fun mapIsEmpty!55262 () Bool)

(assert (=> mapIsEmpty!55262 mapRes!55262))

(declare-fun b!1316774 () Bool)

(declare-fun res!874037 () Bool)

(assert (=> b!1316774 (=> (not res!874037) (not e!751231))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1316774 (= res!874037 (and (= (size!43259 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43258 _keys!1609) (size!43259 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!874036 () Bool)

(assert (=> start!111236 (=> (not res!874036) (not e!751231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111236 (= res!874036 (validMask!0 mask!2019))))

(assert (=> start!111236 e!751231))

(assert (=> start!111236 true))

(declare-fun array_inv!32257 (array!88462) Bool)

(assert (=> start!111236 (and (array_inv!32257 _values!1337) e!751233)))

(declare-fun array_inv!32258 (array!88460) Bool)

(assert (=> start!111236 (array_inv!32258 _keys!1609)))

(declare-fun b!1316775 () Bool)

(declare-fun tp_is_empty!35751 () Bool)

(assert (=> b!1316775 (= e!751234 tp_is_empty!35751)))

(declare-fun b!1316776 () Bool)

(assert (=> b!1316776 (= e!751232 tp_is_empty!35751)))

(assert (= (and start!111236 res!874036) b!1316774))

(assert (= (and b!1316774 res!874037) b!1316772))

(assert (= (and b!1316772 res!874038) b!1316771))

(assert (= (and b!1316773 condMapEmpty!55262) mapIsEmpty!55262))

(assert (= (and b!1316773 (not condMapEmpty!55262)) mapNonEmpty!55262))

(get-info :version)

(assert (= (and mapNonEmpty!55262 ((_ is ValueCellFull!16977) mapValue!55262)) b!1316776))

(assert (= (and b!1316773 ((_ is ValueCellFull!16977) mapDefault!55262)) b!1316775))

(assert (= start!111236 b!1316773))

(declare-fun m!1204871 () Bool)

(assert (=> b!1316772 m!1204871))

(declare-fun m!1204873 () Bool)

(assert (=> mapNonEmpty!55262 m!1204873))

(declare-fun m!1204875 () Bool)

(assert (=> start!111236 m!1204875))

(declare-fun m!1204877 () Bool)

(assert (=> start!111236 m!1204877))

(declare-fun m!1204879 () Bool)

(assert (=> start!111236 m!1204879))

(check-sat (not b!1316772) (not start!111236) (not mapNonEmpty!55262) tp_is_empty!35751)
(check-sat)
(get-model)

(declare-fun bm!64672 () Bool)

(declare-fun call!64675 () Bool)

(assert (=> bm!64672 (= call!64675 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun d!142679 () Bool)

(declare-fun res!874053 () Bool)

(declare-fun e!751259 () Bool)

(assert (=> d!142679 (=> res!874053 e!751259)))

(assert (=> d!142679 (= res!874053 (bvsge #b00000000000000000000000000000000 (size!43258 _keys!1609)))))

(assert (=> d!142679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!751259)))

(declare-fun b!1316803 () Bool)

(declare-fun e!751258 () Bool)

(assert (=> b!1316803 (= e!751258 call!64675)))

(declare-fun b!1316804 () Bool)

(assert (=> b!1316804 (= e!751259 e!751258)))

(declare-fun c!125631 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316804 (= c!125631 (validKeyInArray!0 (select (arr!42708 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1316805 () Bool)

(declare-fun e!751257 () Bool)

(assert (=> b!1316805 (= e!751258 e!751257)))

(declare-fun lt!586280 () (_ BitVec 64))

(assert (=> b!1316805 (= lt!586280 (select (arr!42708 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43414 0))(
  ( (Unit!43415) )
))
(declare-fun lt!586279 () Unit!43414)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88460 (_ BitVec 64) (_ BitVec 32)) Unit!43414)

(assert (=> b!1316805 (= lt!586279 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586280 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1316805 (arrayContainsKey!0 _keys!1609 lt!586280 #b00000000000000000000000000000000)))

(declare-fun lt!586278 () Unit!43414)

(assert (=> b!1316805 (= lt!586278 lt!586279)))

(declare-fun res!874052 () Bool)

(declare-datatypes ((SeekEntryResult!10036 0))(
  ( (MissingZero!10036 (index!42515 (_ BitVec 32))) (Found!10036 (index!42516 (_ BitVec 32))) (Intermediate!10036 (undefined!10848 Bool) (index!42517 (_ BitVec 32)) (x!117059 (_ BitVec 32))) (Undefined!10036) (MissingVacant!10036 (index!42518 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88460 (_ BitVec 32)) SeekEntryResult!10036)

(assert (=> b!1316805 (= res!874052 (= (seekEntryOrOpen!0 (select (arr!42708 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10036 #b00000000000000000000000000000000)))))

(assert (=> b!1316805 (=> (not res!874052) (not e!751257))))

(declare-fun b!1316806 () Bool)

(assert (=> b!1316806 (= e!751257 call!64675)))

(assert (= (and d!142679 (not res!874053)) b!1316804))

(assert (= (and b!1316804 c!125631) b!1316805))

(assert (= (and b!1316804 (not c!125631)) b!1316803))

(assert (= (and b!1316805 res!874052) b!1316806))

(assert (= (or b!1316806 b!1316803) bm!64672))

(declare-fun m!1204891 () Bool)

(assert (=> bm!64672 m!1204891))

(declare-fun m!1204893 () Bool)

(assert (=> b!1316804 m!1204893))

(assert (=> b!1316804 m!1204893))

(declare-fun m!1204895 () Bool)

(assert (=> b!1316804 m!1204895))

(assert (=> b!1316805 m!1204893))

(declare-fun m!1204897 () Bool)

(assert (=> b!1316805 m!1204897))

(declare-fun m!1204899 () Bool)

(assert (=> b!1316805 m!1204899))

(assert (=> b!1316805 m!1204893))

(declare-fun m!1204901 () Bool)

(assert (=> b!1316805 m!1204901))

(assert (=> b!1316772 d!142679))

(declare-fun d!142681 () Bool)

(assert (=> d!142681 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111236 d!142681))

(declare-fun d!142683 () Bool)

(assert (=> d!142683 (= (array_inv!32257 _values!1337) (bvsge (size!43259 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111236 d!142683))

(declare-fun d!142685 () Bool)

(assert (=> d!142685 (= (array_inv!32258 _keys!1609) (bvsge (size!43258 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111236 d!142685))

(declare-fun mapIsEmpty!55268 () Bool)

(declare-fun mapRes!55268 () Bool)

(assert (=> mapIsEmpty!55268 mapRes!55268))

(declare-fun b!1316813 () Bool)

(declare-fun e!751265 () Bool)

(assert (=> b!1316813 (= e!751265 tp_is_empty!35751)))

(declare-fun condMapEmpty!55268 () Bool)

(declare-fun mapDefault!55268 () ValueCell!16977)

(assert (=> mapNonEmpty!55262 (= condMapEmpty!55268 (= mapRest!55262 ((as const (Array (_ BitVec 32) ValueCell!16977)) mapDefault!55268)))))

(declare-fun e!751264 () Bool)

(assert (=> mapNonEmpty!55262 (= tp!105368 (and e!751264 mapRes!55268))))

(declare-fun b!1316814 () Bool)

(assert (=> b!1316814 (= e!751264 tp_is_empty!35751)))

(declare-fun mapNonEmpty!55268 () Bool)

(declare-fun tp!105374 () Bool)

(assert (=> mapNonEmpty!55268 (= mapRes!55268 (and tp!105374 e!751265))))

(declare-fun mapRest!55268 () (Array (_ BitVec 32) ValueCell!16977))

(declare-fun mapValue!55268 () ValueCell!16977)

(declare-fun mapKey!55268 () (_ BitVec 32))

(assert (=> mapNonEmpty!55268 (= mapRest!55262 (store mapRest!55268 mapKey!55268 mapValue!55268))))

(assert (= (and mapNonEmpty!55262 condMapEmpty!55268) mapIsEmpty!55268))

(assert (= (and mapNonEmpty!55262 (not condMapEmpty!55268)) mapNonEmpty!55268))

(assert (= (and mapNonEmpty!55268 ((_ is ValueCellFull!16977) mapValue!55268)) b!1316813))

(assert (= (and mapNonEmpty!55262 ((_ is ValueCellFull!16977) mapDefault!55268)) b!1316814))

(declare-fun m!1204903 () Bool)

(assert (=> mapNonEmpty!55268 m!1204903))

(check-sat (not bm!64672) (not mapNonEmpty!55268) tp_is_empty!35751 (not b!1316805) (not b!1316804))
(check-sat)
