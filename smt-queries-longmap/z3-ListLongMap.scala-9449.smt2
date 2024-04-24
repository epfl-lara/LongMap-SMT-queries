; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112526 () Bool)

(assert start!112526)

(declare-fun b_free!30697 () Bool)

(declare-fun b_next!30697 () Bool)

(assert (=> start!112526 (= b_free!30697 (not b_next!30697))))

(declare-fun tp!107728 () Bool)

(declare-fun b_and!49451 () Bool)

(assert (=> start!112526 (= tp!107728 b_and!49451)))

(declare-fun b!1332104 () Bool)

(declare-fun e!759270 () Bool)

(declare-fun e!759274 () Bool)

(declare-fun mapRes!56584 () Bool)

(assert (=> b!1332104 (= e!759270 (and e!759274 mapRes!56584))))

(declare-fun condMapEmpty!56584 () Bool)

(declare-datatypes ((V!53913 0))(
  ( (V!53914 (val!18378 Int)) )
))
(declare-datatypes ((ValueCell!17405 0))(
  ( (ValueCellFull!17405 (v!21010 V!53913)) (EmptyCell!17405) )
))
(declare-datatypes ((array!90207 0))(
  ( (array!90208 (arr!43565 (Array (_ BitVec 32) ValueCell!17405)) (size!44116 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90207)

(declare-fun mapDefault!56584 () ValueCell!17405)

(assert (=> b!1332104 (= condMapEmpty!56584 (= (arr!43565 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17405)) mapDefault!56584)))))

(declare-fun b!1332105 () Bool)

(declare-fun res!883589 () Bool)

(declare-fun e!759273 () Bool)

(assert (=> b!1332105 (=> (not res!883589) (not e!759273))))

(declare-datatypes ((array!90209 0))(
  ( (array!90210 (arr!43566 (Array (_ BitVec 32) (_ BitVec 64))) (size!44117 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90209)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332105 (= res!883589 (validKeyInArray!0 (select (arr!43566 _keys!1590) from!1980)))))

(declare-fun b!1332106 () Bool)

(declare-fun res!883591 () Bool)

(assert (=> b!1332106 (=> (not res!883591) (not e!759273))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90209 (_ BitVec 32)) Bool)

(assert (=> b!1332106 (= res!883591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332107 () Bool)

(declare-fun res!883590 () Bool)

(assert (=> b!1332107 (=> (not res!883590) (not e!759273))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332107 (= res!883590 (and (= (size!44116 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44117 _keys!1590) (size!44116 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56584 () Bool)

(declare-fun tp!107727 () Bool)

(declare-fun e!759271 () Bool)

(assert (=> mapNonEmpty!56584 (= mapRes!56584 (and tp!107727 e!759271))))

(declare-fun mapValue!56584 () ValueCell!17405)

(declare-fun mapRest!56584 () (Array (_ BitVec 32) ValueCell!17405))

(declare-fun mapKey!56584 () (_ BitVec 32))

(assert (=> mapNonEmpty!56584 (= (arr!43565 _values!1320) (store mapRest!56584 mapKey!56584 mapValue!56584))))

(declare-fun res!883592 () Bool)

(assert (=> start!112526 (=> (not res!883592) (not e!759273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112526 (= res!883592 (validMask!0 mask!1998))))

(assert (=> start!112526 e!759273))

(declare-fun array_inv!33145 (array!90207) Bool)

(assert (=> start!112526 (and (array_inv!33145 _values!1320) e!759270)))

(assert (=> start!112526 true))

(declare-fun array_inv!33146 (array!90209) Bool)

(assert (=> start!112526 (array_inv!33146 _keys!1590)))

(assert (=> start!112526 tp!107728))

(declare-fun tp_is_empty!36607 () Bool)

(assert (=> start!112526 tp_is_empty!36607))

(declare-fun b!1332108 () Bool)

(declare-fun res!883585 () Bool)

(assert (=> b!1332108 (=> (not res!883585) (not e!759273))))

(declare-datatypes ((List!30871 0))(
  ( (Nil!30868) (Cons!30867 (h!32085 (_ BitVec 64)) (t!44973 List!30871)) )
))
(declare-fun arrayNoDuplicates!0 (array!90209 (_ BitVec 32) List!30871) Bool)

(assert (=> b!1332108 (= res!883585 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30868))))

(declare-fun b!1332109 () Bool)

(declare-fun res!883588 () Bool)

(assert (=> b!1332109 (=> (not res!883588) (not e!759273))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332109 (= res!883588 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44117 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332110 () Bool)

(assert (=> b!1332110 (= e!759274 tp_is_empty!36607)))

(declare-fun mapIsEmpty!56584 () Bool)

(assert (=> mapIsEmpty!56584 mapRes!56584))

(declare-fun b!1332111 () Bool)

(declare-fun res!883587 () Bool)

(assert (=> b!1332111 (=> (not res!883587) (not e!759273))))

(assert (=> b!1332111 (= res!883587 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332112 () Bool)

(declare-fun res!883586 () Bool)

(assert (=> b!1332112 (=> (not res!883586) (not e!759273))))

(declare-fun minValue!1262 () V!53913)

(declare-fun zeroValue!1262 () V!53913)

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23704 0))(
  ( (tuple2!23705 (_1!11863 (_ BitVec 64)) (_2!11863 V!53913)) )
))
(declare-datatypes ((List!30872 0))(
  ( (Nil!30869) (Cons!30868 (h!32086 tuple2!23704) (t!44974 List!30872)) )
))
(declare-datatypes ((ListLongMap!21369 0))(
  ( (ListLongMap!21370 (toList!10700 List!30872)) )
))
(declare-fun contains!8876 (ListLongMap!21369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5671 (array!90209 array!90207 (_ BitVec 32) (_ BitVec 32) V!53913 V!53913 (_ BitVec 32) Int) ListLongMap!21369)

(assert (=> b!1332112 (= res!883586 (contains!8876 (getCurrentListMap!5671 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332113 () Bool)

(assert (=> b!1332113 (= e!759271 tp_is_empty!36607)))

(declare-fun b!1332114 () Bool)

(assert (=> b!1332114 (= e!759273 (not true))))

(declare-fun lt!591765 () ListLongMap!21369)

(assert (=> b!1332114 (contains!8876 lt!591765 k0!1153)))

(declare-datatypes ((Unit!43738 0))(
  ( (Unit!43739) )
))
(declare-fun lt!591763 () Unit!43738)

(declare-fun lt!591764 () V!53913)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!257 ((_ BitVec 64) (_ BitVec 64) V!53913 ListLongMap!21369) Unit!43738)

(assert (=> b!1332114 (= lt!591763 (lemmaInListMapAfterAddingDiffThenInBefore!257 k0!1153 (select (arr!43566 _keys!1590) from!1980) lt!591764 lt!591765))))

(declare-fun lt!591762 () ListLongMap!21369)

(assert (=> b!1332114 (contains!8876 lt!591762 k0!1153)))

(declare-fun lt!591761 () Unit!43738)

(assert (=> b!1332114 (= lt!591761 (lemmaInListMapAfterAddingDiffThenInBefore!257 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591762))))

(declare-fun +!4714 (ListLongMap!21369 tuple2!23704) ListLongMap!21369)

(assert (=> b!1332114 (= lt!591762 (+!4714 lt!591765 (tuple2!23705 (select (arr!43566 _keys!1590) from!1980) lt!591764)))))

(declare-fun get!21979 (ValueCell!17405 V!53913) V!53913)

(declare-fun dynLambda!3668 (Int (_ BitVec 64)) V!53913)

(assert (=> b!1332114 (= lt!591764 (get!21979 (select (arr!43565 _values!1320) from!1980) (dynLambda!3668 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6358 (array!90209 array!90207 (_ BitVec 32) (_ BitVec 32) V!53913 V!53913 (_ BitVec 32) Int) ListLongMap!21369)

(assert (=> b!1332114 (= lt!591765 (getCurrentListMapNoExtraKeys!6358 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332115 () Bool)

(declare-fun res!883584 () Bool)

(assert (=> b!1332115 (=> (not res!883584) (not e!759273))))

(assert (=> b!1332115 (= res!883584 (not (= (select (arr!43566 _keys!1590) from!1980) k0!1153)))))

(assert (= (and start!112526 res!883592) b!1332107))

(assert (= (and b!1332107 res!883590) b!1332106))

(assert (= (and b!1332106 res!883591) b!1332108))

(assert (= (and b!1332108 res!883585) b!1332109))

(assert (= (and b!1332109 res!883588) b!1332112))

(assert (= (and b!1332112 res!883586) b!1332115))

(assert (= (and b!1332115 res!883584) b!1332105))

(assert (= (and b!1332105 res!883589) b!1332111))

(assert (= (and b!1332111 res!883587) b!1332114))

(assert (= (and b!1332104 condMapEmpty!56584) mapIsEmpty!56584))

(assert (= (and b!1332104 (not condMapEmpty!56584)) mapNonEmpty!56584))

(get-info :version)

(assert (= (and mapNonEmpty!56584 ((_ is ValueCellFull!17405) mapValue!56584)) b!1332113))

(assert (= (and b!1332104 ((_ is ValueCellFull!17405) mapDefault!56584)) b!1332110))

(assert (= start!112526 b!1332104))

(declare-fun b_lambda!23951 () Bool)

(assert (=> (not b_lambda!23951) (not b!1332114)))

(declare-fun t!44972 () Bool)

(declare-fun tb!11905 () Bool)

(assert (=> (and start!112526 (= defaultEntry!1323 defaultEntry!1323) t!44972) tb!11905))

(declare-fun result!24889 () Bool)

(assert (=> tb!11905 (= result!24889 tp_is_empty!36607)))

(assert (=> b!1332114 t!44972))

(declare-fun b_and!49453 () Bool)

(assert (= b_and!49451 (and (=> t!44972 result!24889) b_and!49453)))

(declare-fun m!1221065 () Bool)

(assert (=> b!1332106 m!1221065))

(declare-fun m!1221067 () Bool)

(assert (=> mapNonEmpty!56584 m!1221067))

(declare-fun m!1221069 () Bool)

(assert (=> b!1332108 m!1221069))

(declare-fun m!1221071 () Bool)

(assert (=> b!1332112 m!1221071))

(assert (=> b!1332112 m!1221071))

(declare-fun m!1221073 () Bool)

(assert (=> b!1332112 m!1221073))

(declare-fun m!1221075 () Bool)

(assert (=> b!1332105 m!1221075))

(assert (=> b!1332105 m!1221075))

(declare-fun m!1221077 () Bool)

(assert (=> b!1332105 m!1221077))

(declare-fun m!1221079 () Bool)

(assert (=> b!1332114 m!1221079))

(declare-fun m!1221081 () Bool)

(assert (=> b!1332114 m!1221081))

(declare-fun m!1221083 () Bool)

(assert (=> b!1332114 m!1221083))

(assert (=> b!1332114 m!1221081))

(declare-fun m!1221085 () Bool)

(assert (=> b!1332114 m!1221085))

(declare-fun m!1221087 () Bool)

(assert (=> b!1332114 m!1221087))

(assert (=> b!1332114 m!1221075))

(declare-fun m!1221089 () Bool)

(assert (=> b!1332114 m!1221089))

(declare-fun m!1221091 () Bool)

(assert (=> b!1332114 m!1221091))

(declare-fun m!1221093 () Bool)

(assert (=> b!1332114 m!1221093))

(assert (=> b!1332114 m!1221083))

(declare-fun m!1221095 () Bool)

(assert (=> b!1332114 m!1221095))

(assert (=> b!1332114 m!1221075))

(assert (=> b!1332115 m!1221075))

(declare-fun m!1221097 () Bool)

(assert (=> start!112526 m!1221097))

(declare-fun m!1221099 () Bool)

(assert (=> start!112526 m!1221099))

(declare-fun m!1221101 () Bool)

(assert (=> start!112526 m!1221101))

(check-sat (not start!112526) (not mapNonEmpty!56584) (not b_next!30697) (not b!1332106) (not b!1332105) (not b!1332112) (not b_lambda!23951) b_and!49453 (not b!1332108) (not b!1332114) tp_is_empty!36607)
(check-sat b_and!49453 (not b_next!30697))
