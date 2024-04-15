; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111506 () Bool)

(assert start!111506)

(declare-fun b_free!30163 () Bool)

(declare-fun b_next!30163 () Bool)

(assert (=> start!111506 (= b_free!30163 (not b_next!30163))))

(declare-fun tp!105965 () Bool)

(declare-fun b_and!48467 () Bool)

(assert (=> start!111506 (= tp!105965 b_and!48467)))

(declare-fun b!1320000 () Bool)

(declare-fun res!876109 () Bool)

(declare-fun e!753030 () Bool)

(assert (=> b!1320000 (=> (not res!876109) (not e!753030))))

(declare-datatypes ((array!88827 0))(
  ( (array!88828 (arr!42888 (Array (_ BitVec 32) (_ BitVec 64))) (size!43440 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88827)

(declare-datatypes ((List!30478 0))(
  ( (Nil!30475) (Cons!30474 (h!31683 (_ BitVec 64)) (t!44182 List!30478)) )
))
(declare-fun arrayNoDuplicates!0 (array!88827 (_ BitVec 32) List!30478) Bool)

(assert (=> b!1320000 (= res!876109 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30475))))

(declare-fun b!1320001 () Bool)

(declare-fun res!876105 () Bool)

(assert (=> b!1320001 (=> (not res!876105) (not e!753030))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320001 (= res!876105 (validKeyInArray!0 (select (arr!42888 _keys!1609) from!2000)))))

(declare-fun b!1320002 () Bool)

(declare-fun e!753031 () Bool)

(declare-fun tp_is_empty!35983 () Bool)

(assert (=> b!1320002 (= e!753031 tp_is_empty!35983)))

(declare-fun b!1320003 () Bool)

(declare-fun res!876110 () Bool)

(assert (=> b!1320003 (=> (not res!876110) (not e!753030))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1320003 (= res!876110 (not (= (select (arr!42888 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320004 () Bool)

(declare-fun res!876111 () Bool)

(assert (=> b!1320004 (=> (not res!876111) (not e!753030))))

(declare-datatypes ((V!53081 0))(
  ( (V!53082 (val!18066 Int)) )
))
(declare-fun zeroValue!1279 () V!53081)

(declare-datatypes ((ValueCell!17093 0))(
  ( (ValueCellFull!17093 (v!20695 V!53081)) (EmptyCell!17093) )
))
(declare-datatypes ((array!88829 0))(
  ( (array!88830 (arr!42889 (Array (_ BitVec 32) ValueCell!17093)) (size!43441 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88829)

(declare-fun minValue!1279 () V!53081)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((tuple2!23342 0))(
  ( (tuple2!23343 (_1!11682 (_ BitVec 64)) (_2!11682 V!53081)) )
))
(declare-datatypes ((List!30479 0))(
  ( (Nil!30476) (Cons!30475 (h!31684 tuple2!23342) (t!44183 List!30479)) )
))
(declare-datatypes ((ListLongMap!20999 0))(
  ( (ListLongMap!21000 (toList!10515 List!30479)) )
))
(declare-fun contains!8598 (ListLongMap!20999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5405 (array!88827 array!88829 (_ BitVec 32) (_ BitVec 32) V!53081 V!53081 (_ BitVec 32) Int) ListLongMap!20999)

(assert (=> b!1320004 (= res!876111 (contains!8598 (getCurrentListMap!5405 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320005 () Bool)

(declare-fun res!876106 () Bool)

(assert (=> b!1320005 (=> (not res!876106) (not e!753030))))

(assert (=> b!1320005 (= res!876106 (and (= (size!43441 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43440 _keys!1609) (size!43441 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320006 () Bool)

(declare-fun res!876108 () Bool)

(assert (=> b!1320006 (=> (not res!876108) (not e!753030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88827 (_ BitVec 32)) Bool)

(assert (=> b!1320006 (= res!876108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!876104 () Bool)

(assert (=> start!111506 (=> (not res!876104) (not e!753030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111506 (= res!876104 (validMask!0 mask!2019))))

(assert (=> start!111506 e!753030))

(declare-fun array_inv!32567 (array!88827) Bool)

(assert (=> start!111506 (array_inv!32567 _keys!1609)))

(assert (=> start!111506 true))

(assert (=> start!111506 tp_is_empty!35983))

(declare-fun e!753029 () Bool)

(declare-fun array_inv!32568 (array!88829) Bool)

(assert (=> start!111506 (and (array_inv!32568 _values!1337) e!753029)))

(assert (=> start!111506 tp!105965))

(declare-fun b!1320007 () Bool)

(declare-fun res!876107 () Bool)

(assert (=> b!1320007 (=> (not res!876107) (not e!753030))))

(assert (=> b!1320007 (= res!876107 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43440 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55622 () Bool)

(declare-fun mapRes!55622 () Bool)

(declare-fun tp!105966 () Bool)

(declare-fun e!753027 () Bool)

(assert (=> mapNonEmpty!55622 (= mapRes!55622 (and tp!105966 e!753027))))

(declare-fun mapRest!55622 () (Array (_ BitVec 32) ValueCell!17093))

(declare-fun mapValue!55622 () ValueCell!17093)

(declare-fun mapKey!55622 () (_ BitVec 32))

(assert (=> mapNonEmpty!55622 (= (arr!42889 _values!1337) (store mapRest!55622 mapKey!55622 mapValue!55622))))

(declare-fun b!1320008 () Bool)

(assert (=> b!1320008 (= e!753030 (not true))))

(declare-fun lt!586640 () ListLongMap!20999)

(assert (=> b!1320008 (contains!8598 lt!586640 k0!1164)))

(declare-datatypes ((Unit!43305 0))(
  ( (Unit!43306) )
))
(declare-fun lt!586638 () Unit!43305)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!126 ((_ BitVec 64) (_ BitVec 64) V!53081 ListLongMap!20999) Unit!43305)

(assert (=> b!1320008 (= lt!586638 (lemmaInListMapAfterAddingDiffThenInBefore!126 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586640))))

(declare-fun lt!586641 () ListLongMap!20999)

(assert (=> b!1320008 (contains!8598 lt!586641 k0!1164)))

(declare-fun lt!586639 () Unit!43305)

(assert (=> b!1320008 (= lt!586639 (lemmaInListMapAfterAddingDiffThenInBefore!126 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586641))))

(declare-fun +!4561 (ListLongMap!20999 tuple2!23342) ListLongMap!20999)

(assert (=> b!1320008 (= lt!586641 (+!4561 lt!586640 (tuple2!23343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6194 (array!88827 array!88829 (_ BitVec 32) (_ BitVec 32) V!53081 V!53081 (_ BitVec 32) Int) ListLongMap!20999)

(declare-fun get!21574 (ValueCell!17093 V!53081) V!53081)

(declare-fun dynLambda!3491 (Int (_ BitVec 64)) V!53081)

(assert (=> b!1320008 (= lt!586640 (+!4561 (getCurrentListMapNoExtraKeys!6194 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23343 (select (arr!42888 _keys!1609) from!2000) (get!21574 (select (arr!42889 _values!1337) from!2000) (dynLambda!3491 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320009 () Bool)

(assert (=> b!1320009 (= e!753027 tp_is_empty!35983)))

(declare-fun mapIsEmpty!55622 () Bool)

(assert (=> mapIsEmpty!55622 mapRes!55622))

(declare-fun b!1320010 () Bool)

(assert (=> b!1320010 (= e!753029 (and e!753031 mapRes!55622))))

(declare-fun condMapEmpty!55622 () Bool)

(declare-fun mapDefault!55622 () ValueCell!17093)

(assert (=> b!1320010 (= condMapEmpty!55622 (= (arr!42889 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17093)) mapDefault!55622)))))

(assert (= (and start!111506 res!876104) b!1320005))

(assert (= (and b!1320005 res!876106) b!1320006))

(assert (= (and b!1320006 res!876108) b!1320000))

(assert (= (and b!1320000 res!876109) b!1320007))

(assert (= (and b!1320007 res!876107) b!1320004))

(assert (= (and b!1320004 res!876111) b!1320003))

(assert (= (and b!1320003 res!876110) b!1320001))

(assert (= (and b!1320001 res!876105) b!1320008))

(assert (= (and b!1320010 condMapEmpty!55622) mapIsEmpty!55622))

(assert (= (and b!1320010 (not condMapEmpty!55622)) mapNonEmpty!55622))

(get-info :version)

(assert (= (and mapNonEmpty!55622 ((_ is ValueCellFull!17093) mapValue!55622)) b!1320009))

(assert (= (and b!1320010 ((_ is ValueCellFull!17093) mapDefault!55622)) b!1320002))

(assert (= start!111506 b!1320010))

(declare-fun b_lambda!23479 () Bool)

(assert (=> (not b_lambda!23479) (not b!1320008)))

(declare-fun t!44181 () Bool)

(declare-fun tb!11507 () Bool)

(assert (=> (and start!111506 (= defaultEntry!1340 defaultEntry!1340) t!44181) tb!11507))

(declare-fun result!24077 () Bool)

(assert (=> tb!11507 (= result!24077 tp_is_empty!35983)))

(assert (=> b!1320008 t!44181))

(declare-fun b_and!48469 () Bool)

(assert (= b_and!48467 (and (=> t!44181 result!24077) b_and!48469)))

(declare-fun m!1207215 () Bool)

(assert (=> b!1320004 m!1207215))

(assert (=> b!1320004 m!1207215))

(declare-fun m!1207217 () Bool)

(assert (=> b!1320004 m!1207217))

(declare-fun m!1207219 () Bool)

(assert (=> b!1320008 m!1207219))

(declare-fun m!1207221 () Bool)

(assert (=> b!1320008 m!1207221))

(declare-fun m!1207223 () Bool)

(assert (=> b!1320008 m!1207223))

(declare-fun m!1207225 () Bool)

(assert (=> b!1320008 m!1207225))

(declare-fun m!1207227 () Bool)

(assert (=> b!1320008 m!1207227))

(declare-fun m!1207229 () Bool)

(assert (=> b!1320008 m!1207229))

(assert (=> b!1320008 m!1207227))

(assert (=> b!1320008 m!1207219))

(declare-fun m!1207231 () Bool)

(assert (=> b!1320008 m!1207231))

(declare-fun m!1207233 () Bool)

(assert (=> b!1320008 m!1207233))

(declare-fun m!1207235 () Bool)

(assert (=> b!1320008 m!1207235))

(declare-fun m!1207237 () Bool)

(assert (=> b!1320008 m!1207237))

(assert (=> b!1320008 m!1207221))

(declare-fun m!1207239 () Bool)

(assert (=> b!1320008 m!1207239))

(declare-fun m!1207241 () Bool)

(assert (=> start!111506 m!1207241))

(declare-fun m!1207243 () Bool)

(assert (=> start!111506 m!1207243))

(declare-fun m!1207245 () Bool)

(assert (=> start!111506 m!1207245))

(declare-fun m!1207247 () Bool)

(assert (=> b!1320006 m!1207247))

(declare-fun m!1207249 () Bool)

(assert (=> mapNonEmpty!55622 m!1207249))

(assert (=> b!1320003 m!1207237))

(assert (=> b!1320001 m!1207237))

(assert (=> b!1320001 m!1207237))

(declare-fun m!1207251 () Bool)

(assert (=> b!1320001 m!1207251))

(declare-fun m!1207253 () Bool)

(assert (=> b!1320000 m!1207253))

(check-sat (not b!1320004) (not b!1320001) (not b_next!30163) (not b!1320006) (not mapNonEmpty!55622) (not start!111506) tp_is_empty!35983 (not b!1320008) (not b!1320000) (not b_lambda!23479) b_and!48469)
(check-sat b_and!48469 (not b_next!30163))
