; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112280 () Bool)

(assert start!112280)

(declare-fun b_free!30675 () Bool)

(declare-fun b_next!30675 () Bool)

(assert (=> start!112280 (= b_free!30675 (not b_next!30675))))

(declare-fun tp!107661 () Bool)

(declare-fun b_and!49405 () Bool)

(assert (=> start!112280 (= tp!107661 b_and!49405)))

(declare-fun b!1330387 () Bool)

(declare-fun res!882776 () Bool)

(declare-fun e!758266 () Bool)

(assert (=> b!1330387 (=> (not res!882776) (not e!758266))))

(declare-datatypes ((array!90058 0))(
  ( (array!90059 (arr!43495 (Array (_ BitVec 32) (_ BitVec 64))) (size!44045 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90058)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330387 (= res!882776 (validKeyInArray!0 (select (arr!43495 _keys!1590) from!1980)))))

(declare-fun b!1330388 () Bool)

(assert (=> b!1330388 (= e!758266 (not true))))

(declare-datatypes ((V!53883 0))(
  ( (V!53884 (val!18367 Int)) )
))
(declare-datatypes ((tuple2!23654 0))(
  ( (tuple2!23655 (_1!11838 (_ BitVec 64)) (_2!11838 V!53883)) )
))
(declare-datatypes ((List!30804 0))(
  ( (Nil!30801) (Cons!30800 (h!32009 tuple2!23654) (t!44892 List!30804)) )
))
(declare-datatypes ((ListLongMap!21311 0))(
  ( (ListLongMap!21312 (toList!10671 List!30804)) )
))
(declare-fun lt!591124 () ListLongMap!21311)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8835 (ListLongMap!21311 (_ BitVec 64)) Bool)

(assert (=> b!1330388 (contains!8835 lt!591124 k0!1153)))

(declare-datatypes ((Unit!43787 0))(
  ( (Unit!43788) )
))
(declare-fun lt!591122 () Unit!43787)

(declare-fun lt!591121 () V!53883)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!256 ((_ BitVec 64) (_ BitVec 64) V!53883 ListLongMap!21311) Unit!43787)

(assert (=> b!1330388 (= lt!591122 (lemmaInListMapAfterAddingDiffThenInBefore!256 k0!1153 (select (arr!43495 _keys!1590) from!1980) lt!591121 lt!591124))))

(declare-fun lt!591123 () ListLongMap!21311)

(assert (=> b!1330388 (contains!8835 lt!591123 k0!1153)))

(declare-fun minValue!1262 () V!53883)

(declare-fun lt!591120 () Unit!43787)

(assert (=> b!1330388 (= lt!591120 (lemmaInListMapAfterAddingDiffThenInBefore!256 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591123))))

(declare-fun +!4669 (ListLongMap!21311 tuple2!23654) ListLongMap!21311)

(assert (=> b!1330388 (= lt!591123 (+!4669 lt!591124 (tuple2!23655 (select (arr!43495 _keys!1590) from!1980) lt!591121)))))

(declare-datatypes ((ValueCell!17394 0))(
  ( (ValueCellFull!17394 (v!21004 V!53883)) (EmptyCell!17394) )
))
(declare-datatypes ((array!90060 0))(
  ( (array!90061 (arr!43496 (Array (_ BitVec 32) ValueCell!17394)) (size!44046 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90060)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21923 (ValueCell!17394 V!53883) V!53883)

(declare-fun dynLambda!3608 (Int (_ BitVec 64)) V!53883)

(assert (=> b!1330388 (= lt!591121 (get!21923 (select (arr!43496 _values!1320) from!1980) (dynLambda!3608 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53883)

(declare-fun getCurrentListMapNoExtraKeys!6307 (array!90058 array!90060 (_ BitVec 32) (_ BitVec 32) V!53883 V!53883 (_ BitVec 32) Int) ListLongMap!21311)

(assert (=> b!1330388 (= lt!591124 (getCurrentListMapNoExtraKeys!6307 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330389 () Bool)

(declare-fun res!882775 () Bool)

(assert (=> b!1330389 (=> (not res!882775) (not e!758266))))

(assert (=> b!1330389 (= res!882775 (not (= (select (arr!43495 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330391 () Bool)

(declare-fun e!758262 () Bool)

(declare-fun tp_is_empty!36585 () Bool)

(assert (=> b!1330391 (= e!758262 tp_is_empty!36585)))

(declare-fun b!1330392 () Bool)

(declare-fun res!882773 () Bool)

(assert (=> b!1330392 (=> (not res!882773) (not e!758266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90058 (_ BitVec 32)) Bool)

(assert (=> b!1330392 (= res!882773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330393 () Bool)

(declare-fun res!882771 () Bool)

(assert (=> b!1330393 (=> (not res!882771) (not e!758266))))

(assert (=> b!1330393 (= res!882771 (and (= (size!44046 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44045 _keys!1590) (size!44046 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330394 () Bool)

(declare-fun res!882777 () Bool)

(assert (=> b!1330394 (=> (not res!882777) (not e!758266))))

(assert (=> b!1330394 (= res!882777 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44045 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330390 () Bool)

(declare-fun e!758264 () Bool)

(assert (=> b!1330390 (= e!758264 tp_is_empty!36585)))

(declare-fun res!882769 () Bool)

(assert (=> start!112280 (=> (not res!882769) (not e!758266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112280 (= res!882769 (validMask!0 mask!1998))))

(assert (=> start!112280 e!758266))

(declare-fun e!758263 () Bool)

(declare-fun array_inv!32813 (array!90060) Bool)

(assert (=> start!112280 (and (array_inv!32813 _values!1320) e!758263)))

(assert (=> start!112280 true))

(declare-fun array_inv!32814 (array!90058) Bool)

(assert (=> start!112280 (array_inv!32814 _keys!1590)))

(assert (=> start!112280 tp!107661))

(assert (=> start!112280 tp_is_empty!36585))

(declare-fun mapNonEmpty!56551 () Bool)

(declare-fun mapRes!56551 () Bool)

(declare-fun tp!107662 () Bool)

(assert (=> mapNonEmpty!56551 (= mapRes!56551 (and tp!107662 e!758262))))

(declare-fun mapValue!56551 () ValueCell!17394)

(declare-fun mapRest!56551 () (Array (_ BitVec 32) ValueCell!17394))

(declare-fun mapKey!56551 () (_ BitVec 32))

(assert (=> mapNonEmpty!56551 (= (arr!43496 _values!1320) (store mapRest!56551 mapKey!56551 mapValue!56551))))

(declare-fun b!1330395 () Bool)

(declare-fun res!882774 () Bool)

(assert (=> b!1330395 (=> (not res!882774) (not e!758266))))

(declare-datatypes ((List!30805 0))(
  ( (Nil!30802) (Cons!30801 (h!32010 (_ BitVec 64)) (t!44893 List!30805)) )
))
(declare-fun arrayNoDuplicates!0 (array!90058 (_ BitVec 32) List!30805) Bool)

(assert (=> b!1330395 (= res!882774 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30802))))

(declare-fun b!1330396 () Bool)

(declare-fun res!882772 () Bool)

(assert (=> b!1330396 (=> (not res!882772) (not e!758266))))

(assert (=> b!1330396 (= res!882772 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330397 () Bool)

(declare-fun res!882770 () Bool)

(assert (=> b!1330397 (=> (not res!882770) (not e!758266))))

(declare-fun getCurrentListMap!5658 (array!90058 array!90060 (_ BitVec 32) (_ BitVec 32) V!53883 V!53883 (_ BitVec 32) Int) ListLongMap!21311)

(assert (=> b!1330397 (= res!882770 (contains!8835 (getCurrentListMap!5658 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330398 () Bool)

(assert (=> b!1330398 (= e!758263 (and e!758264 mapRes!56551))))

(declare-fun condMapEmpty!56551 () Bool)

(declare-fun mapDefault!56551 () ValueCell!17394)

(assert (=> b!1330398 (= condMapEmpty!56551 (= (arr!43496 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17394)) mapDefault!56551)))))

(declare-fun mapIsEmpty!56551 () Bool)

(assert (=> mapIsEmpty!56551 mapRes!56551))

(assert (= (and start!112280 res!882769) b!1330393))

(assert (= (and b!1330393 res!882771) b!1330392))

(assert (= (and b!1330392 res!882773) b!1330395))

(assert (= (and b!1330395 res!882774) b!1330394))

(assert (= (and b!1330394 res!882777) b!1330397))

(assert (= (and b!1330397 res!882770) b!1330389))

(assert (= (and b!1330389 res!882775) b!1330387))

(assert (= (and b!1330387 res!882776) b!1330396))

(assert (= (and b!1330396 res!882772) b!1330388))

(assert (= (and b!1330398 condMapEmpty!56551) mapIsEmpty!56551))

(assert (= (and b!1330398 (not condMapEmpty!56551)) mapNonEmpty!56551))

(get-info :version)

(assert (= (and mapNonEmpty!56551 ((_ is ValueCellFull!17394) mapValue!56551)) b!1330391))

(assert (= (and b!1330398 ((_ is ValueCellFull!17394) mapDefault!56551)) b!1330390))

(assert (= start!112280 b!1330398))

(declare-fun b_lambda!23935 () Bool)

(assert (=> (not b_lambda!23935) (not b!1330388)))

(declare-fun t!44891 () Bool)

(declare-fun tb!11891 () Bool)

(assert (=> (and start!112280 (= defaultEntry!1323 defaultEntry!1323) t!44891) tb!11891))

(declare-fun result!24853 () Bool)

(assert (=> tb!11891 (= result!24853 tp_is_empty!36585)))

(assert (=> b!1330388 t!44891))

(declare-fun b_and!49407 () Bool)

(assert (= b_and!49405 (and (=> t!44891 result!24853) b_and!49407)))

(declare-fun m!1219049 () Bool)

(assert (=> b!1330395 m!1219049))

(declare-fun m!1219051 () Bool)

(assert (=> b!1330388 m!1219051))

(declare-fun m!1219053 () Bool)

(assert (=> b!1330388 m!1219053))

(declare-fun m!1219055 () Bool)

(assert (=> b!1330388 m!1219055))

(assert (=> b!1330388 m!1219051))

(declare-fun m!1219057 () Bool)

(assert (=> b!1330388 m!1219057))

(declare-fun m!1219059 () Bool)

(assert (=> b!1330388 m!1219059))

(declare-fun m!1219061 () Bool)

(assert (=> b!1330388 m!1219061))

(declare-fun m!1219063 () Bool)

(assert (=> b!1330388 m!1219063))

(declare-fun m!1219065 () Bool)

(assert (=> b!1330388 m!1219065))

(declare-fun m!1219067 () Bool)

(assert (=> b!1330388 m!1219067))

(assert (=> b!1330388 m!1219055))

(declare-fun m!1219069 () Bool)

(assert (=> b!1330388 m!1219069))

(assert (=> b!1330388 m!1219061))

(assert (=> b!1330389 m!1219061))

(declare-fun m!1219071 () Bool)

(assert (=> b!1330392 m!1219071))

(assert (=> b!1330387 m!1219061))

(assert (=> b!1330387 m!1219061))

(declare-fun m!1219073 () Bool)

(assert (=> b!1330387 m!1219073))

(declare-fun m!1219075 () Bool)

(assert (=> start!112280 m!1219075))

(declare-fun m!1219077 () Bool)

(assert (=> start!112280 m!1219077))

(declare-fun m!1219079 () Bool)

(assert (=> start!112280 m!1219079))

(declare-fun m!1219081 () Bool)

(assert (=> b!1330397 m!1219081))

(assert (=> b!1330397 m!1219081))

(declare-fun m!1219083 () Bool)

(assert (=> b!1330397 m!1219083))

(declare-fun m!1219085 () Bool)

(assert (=> mapNonEmpty!56551 m!1219085))

(check-sat b_and!49407 (not b_lambda!23935) (not b!1330397) (not b!1330392) (not b!1330395) tp_is_empty!36585 (not mapNonEmpty!56551) (not b!1330388) (not b_next!30675) (not b!1330387) (not start!112280))
(check-sat b_and!49407 (not b_next!30675))
