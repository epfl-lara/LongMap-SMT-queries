; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112266 () Bool)

(assert start!112266)

(declare-fun b_free!30661 () Bool)

(declare-fun b_next!30661 () Bool)

(assert (=> start!112266 (= b_free!30661 (not b_next!30661))))

(declare-fun tp!107620 () Bool)

(declare-fun b_and!49359 () Bool)

(assert (=> start!112266 (= tp!107620 b_and!49359)))

(declare-fun b!1330051 () Bool)

(declare-fun res!882558 () Bool)

(declare-fun e!758126 () Bool)

(assert (=> b!1330051 (=> (not res!882558) (not e!758126))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330051 (= res!882558 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!882551 () Bool)

(assert (=> start!112266 (=> (not res!882551) (not e!758126))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112266 (= res!882551 (validMask!0 mask!1998))))

(assert (=> start!112266 e!758126))

(declare-datatypes ((V!53865 0))(
  ( (V!53866 (val!18360 Int)) )
))
(declare-datatypes ((ValueCell!17387 0))(
  ( (ValueCellFull!17387 (v!20996 V!53865)) (EmptyCell!17387) )
))
(declare-datatypes ((array!89965 0))(
  ( (array!89966 (arr!43449 (Array (_ BitVec 32) ValueCell!17387)) (size!44001 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89965)

(declare-fun e!758125 () Bool)

(declare-fun array_inv!32953 (array!89965) Bool)

(assert (=> start!112266 (and (array_inv!32953 _values!1320) e!758125)))

(assert (=> start!112266 true))

(declare-datatypes ((array!89967 0))(
  ( (array!89968 (arr!43450 (Array (_ BitVec 32) (_ BitVec 64))) (size!44002 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89967)

(declare-fun array_inv!32954 (array!89967) Bool)

(assert (=> start!112266 (array_inv!32954 _keys!1590)))

(assert (=> start!112266 tp!107620))

(declare-fun tp_is_empty!36571 () Bool)

(assert (=> start!112266 tp_is_empty!36571))

(declare-fun b!1330052 () Bool)

(declare-fun res!882557 () Bool)

(assert (=> b!1330052 (=> (not res!882557) (not e!758126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89967 (_ BitVec 32)) Bool)

(assert (=> b!1330052 (= res!882557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330053 () Bool)

(declare-fun res!882555 () Bool)

(assert (=> b!1330053 (=> (not res!882555) (not e!758126))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1330053 (= res!882555 (not (= (select (arr!43450 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330054 () Bool)

(declare-fun res!882553 () Bool)

(assert (=> b!1330054 (=> (not res!882553) (not e!758126))))

(assert (=> b!1330054 (= res!882553 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44002 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330055 () Bool)

(declare-fun e!758127 () Bool)

(assert (=> b!1330055 (= e!758127 tp_is_empty!36571)))

(declare-fun b!1330056 () Bool)

(declare-fun res!882559 () Bool)

(assert (=> b!1330056 (=> (not res!882559) (not e!758126))))

(assert (=> b!1330056 (= res!882559 (and (= (size!44001 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44002 _keys!1590) (size!44001 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330057 () Bool)

(declare-fun e!758128 () Bool)

(declare-fun mapRes!56530 () Bool)

(assert (=> b!1330057 (= e!758125 (and e!758128 mapRes!56530))))

(declare-fun condMapEmpty!56530 () Bool)

(declare-fun mapDefault!56530 () ValueCell!17387)

(assert (=> b!1330057 (= condMapEmpty!56530 (= (arr!43449 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17387)) mapDefault!56530)))))

(declare-fun b!1330058 () Bool)

(assert (=> b!1330058 (= e!758126 (not true))))

(declare-datatypes ((tuple2!23704 0))(
  ( (tuple2!23705 (_1!11863 (_ BitVec 64)) (_2!11863 V!53865)) )
))
(declare-datatypes ((List!30850 0))(
  ( (Nil!30847) (Cons!30846 (h!32055 tuple2!23704) (t!44916 List!30850)) )
))
(declare-datatypes ((ListLongMap!21361 0))(
  ( (ListLongMap!21362 (toList!10696 List!30850)) )
))
(declare-fun lt!590877 () ListLongMap!21361)

(declare-fun contains!8788 (ListLongMap!21361 (_ BitVec 64)) Bool)

(assert (=> b!1330058 (contains!8788 lt!590877 k0!1153)))

(declare-datatypes ((Unit!43574 0))(
  ( (Unit!43575) )
))
(declare-fun lt!590878 () Unit!43574)

(declare-fun minValue!1262 () V!53865)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!237 ((_ BitVec 64) (_ BitVec 64) V!53865 ListLongMap!21361) Unit!43574)

(assert (=> b!1330058 (= lt!590878 (lemmaInListMapAfterAddingDiffThenInBefore!237 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590877))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53865)

(declare-fun +!4681 (ListLongMap!21361 tuple2!23704) ListLongMap!21361)

(declare-fun getCurrentListMapNoExtraKeys!6319 (array!89967 array!89965 (_ BitVec 32) (_ BitVec 32) V!53865 V!53865 (_ BitVec 32) Int) ListLongMap!21361)

(declare-fun get!21898 (ValueCell!17387 V!53865) V!53865)

(declare-fun dynLambda!3611 (Int (_ BitVec 64)) V!53865)

(assert (=> b!1330058 (= lt!590877 (+!4681 (getCurrentListMapNoExtraKeys!6319 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23705 (select (arr!43450 _keys!1590) from!1980) (get!21898 (select (arr!43449 _values!1320) from!1980) (dynLambda!3611 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1330059 () Bool)

(declare-fun res!882552 () Bool)

(assert (=> b!1330059 (=> (not res!882552) (not e!758126))))

(declare-datatypes ((List!30851 0))(
  ( (Nil!30848) (Cons!30847 (h!32056 (_ BitVec 64)) (t!44917 List!30851)) )
))
(declare-fun arrayNoDuplicates!0 (array!89967 (_ BitVec 32) List!30851) Bool)

(assert (=> b!1330059 (= res!882552 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30848))))

(declare-fun b!1330060 () Bool)

(assert (=> b!1330060 (= e!758128 tp_is_empty!36571)))

(declare-fun mapNonEmpty!56530 () Bool)

(declare-fun tp!107621 () Bool)

(assert (=> mapNonEmpty!56530 (= mapRes!56530 (and tp!107621 e!758127))))

(declare-fun mapValue!56530 () ValueCell!17387)

(declare-fun mapKey!56530 () (_ BitVec 32))

(declare-fun mapRest!56530 () (Array (_ BitVec 32) ValueCell!17387))

(assert (=> mapNonEmpty!56530 (= (arr!43449 _values!1320) (store mapRest!56530 mapKey!56530 mapValue!56530))))

(declare-fun b!1330061 () Bool)

(declare-fun res!882556 () Bool)

(assert (=> b!1330061 (=> (not res!882556) (not e!758126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330061 (= res!882556 (validKeyInArray!0 (select (arr!43450 _keys!1590) from!1980)))))

(declare-fun b!1330062 () Bool)

(declare-fun res!882554 () Bool)

(assert (=> b!1330062 (=> (not res!882554) (not e!758126))))

(declare-fun getCurrentListMap!5561 (array!89967 array!89965 (_ BitVec 32) (_ BitVec 32) V!53865 V!53865 (_ BitVec 32) Int) ListLongMap!21361)

(assert (=> b!1330062 (= res!882554 (contains!8788 (getCurrentListMap!5561 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56530 () Bool)

(assert (=> mapIsEmpty!56530 mapRes!56530))

(assert (= (and start!112266 res!882551) b!1330056))

(assert (= (and b!1330056 res!882559) b!1330052))

(assert (= (and b!1330052 res!882557) b!1330059))

(assert (= (and b!1330059 res!882552) b!1330054))

(assert (= (and b!1330054 res!882553) b!1330062))

(assert (= (and b!1330062 res!882554) b!1330053))

(assert (= (and b!1330053 res!882555) b!1330061))

(assert (= (and b!1330061 res!882556) b!1330051))

(assert (= (and b!1330051 res!882558) b!1330058))

(assert (= (and b!1330057 condMapEmpty!56530) mapIsEmpty!56530))

(assert (= (and b!1330057 (not condMapEmpty!56530)) mapNonEmpty!56530))

(get-info :version)

(assert (= (and mapNonEmpty!56530 ((_ is ValueCellFull!17387) mapValue!56530)) b!1330055))

(assert (= (and b!1330057 ((_ is ValueCellFull!17387) mapDefault!56530)) b!1330060))

(assert (= start!112266 b!1330057))

(declare-fun b_lambda!23911 () Bool)

(assert (=> (not b_lambda!23911) (not b!1330058)))

(declare-fun t!44915 () Bool)

(declare-fun tb!11869 () Bool)

(assert (=> (and start!112266 (= defaultEntry!1323 defaultEntry!1323) t!44915) tb!11869))

(declare-fun result!24817 () Bool)

(assert (=> tb!11869 (= result!24817 tp_is_empty!36571)))

(assert (=> b!1330058 t!44915))

(declare-fun b_and!49361 () Bool)

(assert (= b_and!49359 (and (=> t!44915 result!24817) b_and!49361)))

(declare-fun m!1218291 () Bool)

(assert (=> b!1330058 m!1218291))

(declare-fun m!1218293 () Bool)

(assert (=> b!1330058 m!1218293))

(declare-fun m!1218295 () Bool)

(assert (=> b!1330058 m!1218295))

(declare-fun m!1218297 () Bool)

(assert (=> b!1330058 m!1218297))

(assert (=> b!1330058 m!1218291))

(declare-fun m!1218299 () Bool)

(assert (=> b!1330058 m!1218299))

(declare-fun m!1218301 () Bool)

(assert (=> b!1330058 m!1218301))

(assert (=> b!1330058 m!1218293))

(assert (=> b!1330058 m!1218297))

(declare-fun m!1218303 () Bool)

(assert (=> b!1330058 m!1218303))

(declare-fun m!1218305 () Bool)

(assert (=> b!1330058 m!1218305))

(declare-fun m!1218307 () Bool)

(assert (=> b!1330052 m!1218307))

(declare-fun m!1218309 () Bool)

(assert (=> b!1330062 m!1218309))

(assert (=> b!1330062 m!1218309))

(declare-fun m!1218311 () Bool)

(assert (=> b!1330062 m!1218311))

(assert (=> b!1330053 m!1218305))

(declare-fun m!1218313 () Bool)

(assert (=> b!1330059 m!1218313))

(declare-fun m!1218315 () Bool)

(assert (=> start!112266 m!1218315))

(declare-fun m!1218317 () Bool)

(assert (=> start!112266 m!1218317))

(declare-fun m!1218319 () Bool)

(assert (=> start!112266 m!1218319))

(assert (=> b!1330061 m!1218305))

(assert (=> b!1330061 m!1218305))

(declare-fun m!1218321 () Bool)

(assert (=> b!1330061 m!1218321))

(declare-fun m!1218323 () Bool)

(assert (=> mapNonEmpty!56530 m!1218323))

(check-sat (not b_lambda!23911) (not mapNonEmpty!56530) (not b!1330058) tp_is_empty!36571 (not b!1330059) b_and!49361 (not b!1330061) (not b!1330052) (not b_next!30661) (not b!1330062) (not start!112266))
(check-sat b_and!49361 (not b_next!30661))
