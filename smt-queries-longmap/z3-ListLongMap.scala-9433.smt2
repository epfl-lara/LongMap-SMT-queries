; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112208 () Bool)

(assert start!112208)

(declare-fun b_free!30603 () Bool)

(declare-fun b_next!30603 () Bool)

(assert (=> start!112208 (= b_free!30603 (not b_next!30603))))

(declare-fun tp!107445 () Bool)

(declare-fun b_and!49261 () Bool)

(assert (=> start!112208 (= tp!107445 b_and!49261)))

(declare-fun b!1329020 () Bool)

(declare-fun e!757724 () Bool)

(declare-fun tp_is_empty!36513 () Bool)

(assert (=> b!1329020 (= e!757724 tp_is_empty!36513)))

(declare-fun b!1329021 () Bool)

(declare-fun res!881800 () Bool)

(declare-fun e!757725 () Bool)

(assert (=> b!1329021 (=> (not res!881800) (not e!757725))))

(declare-datatypes ((V!53787 0))(
  ( (V!53788 (val!18331 Int)) )
))
(declare-datatypes ((ValueCell!17358 0))(
  ( (ValueCellFull!17358 (v!20968 V!53787)) (EmptyCell!17358) )
))
(declare-datatypes ((array!89918 0))(
  ( (array!89919 (arr!43425 (Array (_ BitVec 32) ValueCell!17358)) (size!43975 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89918)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89920 0))(
  ( (array!89921 (arr!43426 (Array (_ BitVec 32) (_ BitVec 64))) (size!43976 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89920)

(assert (=> b!1329021 (= res!881800 (and (= (size!43975 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43976 _keys!1590) (size!43975 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329022 () Bool)

(declare-fun res!881805 () Bool)

(assert (=> b!1329022 (=> (not res!881805) (not e!757725))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329022 (= res!881805 (validKeyInArray!0 (select (arr!43426 _keys!1590) from!1980)))))

(declare-fun mapIsEmpty!56443 () Bool)

(declare-fun mapRes!56443 () Bool)

(assert (=> mapIsEmpty!56443 mapRes!56443))

(declare-fun b!1329023 () Bool)

(declare-fun res!881797 () Bool)

(assert (=> b!1329023 (=> (not res!881797) (not e!757725))))

(declare-datatypes ((List!30751 0))(
  ( (Nil!30748) (Cons!30747 (h!31956 (_ BitVec 64)) (t!44767 List!30751)) )
))
(declare-fun arrayNoDuplicates!0 (array!89920 (_ BitVec 32) List!30751) Bool)

(assert (=> b!1329023 (= res!881797 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30748))))

(declare-fun b!1329019 () Bool)

(declare-fun res!881799 () Bool)

(assert (=> b!1329019 (=> (not res!881799) (not e!757725))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1329019 (= res!881799 (not (= (select (arr!43426 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!881801 () Bool)

(assert (=> start!112208 (=> (not res!881801) (not e!757725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112208 (= res!881801 (validMask!0 mask!1998))))

(assert (=> start!112208 e!757725))

(declare-fun e!757722 () Bool)

(declare-fun array_inv!32765 (array!89918) Bool)

(assert (=> start!112208 (and (array_inv!32765 _values!1320) e!757722)))

(assert (=> start!112208 true))

(declare-fun array_inv!32766 (array!89920) Bool)

(assert (=> start!112208 (array_inv!32766 _keys!1590)))

(assert (=> start!112208 tp!107445))

(assert (=> start!112208 tp_is_empty!36513))

(declare-fun b!1329024 () Bool)

(declare-fun res!881798 () Bool)

(assert (=> b!1329024 (=> (not res!881798) (not e!757725))))

(assert (=> b!1329024 (= res!881798 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43976 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329025 () Bool)

(declare-fun res!881802 () Bool)

(assert (=> b!1329025 (=> (not res!881802) (not e!757725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89920 (_ BitVec 32)) Bool)

(assert (=> b!1329025 (= res!881802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329026 () Bool)

(declare-fun e!757726 () Bool)

(assert (=> b!1329026 (= e!757722 (and e!757726 mapRes!56443))))

(declare-fun condMapEmpty!56443 () Bool)

(declare-fun mapDefault!56443 () ValueCell!17358)

(assert (=> b!1329026 (= condMapEmpty!56443 (= (arr!43425 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17358)) mapDefault!56443)))))

(declare-fun b!1329027 () Bool)

(assert (=> b!1329027 (= e!757726 tp_is_empty!36513)))

(declare-fun b!1329028 () Bool)

(declare-fun res!881804 () Bool)

(assert (=> b!1329028 (=> (not res!881804) (not e!757725))))

(assert (=> b!1329028 (= res!881804 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329029 () Bool)

(assert (=> b!1329029 (= e!757725 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53787)

(declare-fun zeroValue!1262 () V!53787)

(declare-fun lt!590893 () Bool)

(declare-datatypes ((tuple2!23596 0))(
  ( (tuple2!23597 (_1!11809 (_ BitVec 64)) (_2!11809 V!53787)) )
))
(declare-datatypes ((List!30752 0))(
  ( (Nil!30749) (Cons!30748 (h!31957 tuple2!23596) (t!44768 List!30752)) )
))
(declare-datatypes ((ListLongMap!21253 0))(
  ( (ListLongMap!21254 (toList!10642 List!30752)) )
))
(declare-fun contains!8806 (ListLongMap!21253 (_ BitVec 64)) Bool)

(declare-fun +!4644 (ListLongMap!21253 tuple2!23596) ListLongMap!21253)

(declare-fun getCurrentListMapNoExtraKeys!6282 (array!89920 array!89918 (_ BitVec 32) (_ BitVec 32) V!53787 V!53787 (_ BitVec 32) Int) ListLongMap!21253)

(declare-fun get!21874 (ValueCell!17358 V!53787) V!53787)

(declare-fun dynLambda!3583 (Int (_ BitVec 64)) V!53787)

(assert (=> b!1329029 (= lt!590893 (contains!8806 (+!4644 (+!4644 (getCurrentListMapNoExtraKeys!6282 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23597 (select (arr!43426 _keys!1590) from!1980) (get!21874 (select (arr!43425 _values!1320) from!1980) (dynLambda!3583 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153))))

(declare-fun mapNonEmpty!56443 () Bool)

(declare-fun tp!107446 () Bool)

(assert (=> mapNonEmpty!56443 (= mapRes!56443 (and tp!107446 e!757724))))

(declare-fun mapValue!56443 () ValueCell!17358)

(declare-fun mapRest!56443 () (Array (_ BitVec 32) ValueCell!17358))

(declare-fun mapKey!56443 () (_ BitVec 32))

(assert (=> mapNonEmpty!56443 (= (arr!43425 _values!1320) (store mapRest!56443 mapKey!56443 mapValue!56443))))

(declare-fun b!1329030 () Bool)

(declare-fun res!881803 () Bool)

(assert (=> b!1329030 (=> (not res!881803) (not e!757725))))

(declare-fun getCurrentListMap!5632 (array!89920 array!89918 (_ BitVec 32) (_ BitVec 32) V!53787 V!53787 (_ BitVec 32) Int) ListLongMap!21253)

(assert (=> b!1329030 (= res!881803 (contains!8806 (getCurrentListMap!5632 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112208 res!881801) b!1329021))

(assert (= (and b!1329021 res!881800) b!1329025))

(assert (= (and b!1329025 res!881802) b!1329023))

(assert (= (and b!1329023 res!881797) b!1329024))

(assert (= (and b!1329024 res!881798) b!1329030))

(assert (= (and b!1329030 res!881803) b!1329019))

(assert (= (and b!1329019 res!881799) b!1329022))

(assert (= (and b!1329022 res!881805) b!1329028))

(assert (= (and b!1329028 res!881804) b!1329029))

(assert (= (and b!1329026 condMapEmpty!56443) mapIsEmpty!56443))

(assert (= (and b!1329026 (not condMapEmpty!56443)) mapNonEmpty!56443))

(get-info :version)

(assert (= (and mapNonEmpty!56443 ((_ is ValueCellFull!17358) mapValue!56443)) b!1329020))

(assert (= (and b!1329026 ((_ is ValueCellFull!17358) mapDefault!56443)) b!1329027))

(assert (= start!112208 b!1329026))

(declare-fun b_lambda!23863 () Bool)

(assert (=> (not b_lambda!23863) (not b!1329029)))

(declare-fun t!44766 () Bool)

(declare-fun tb!11819 () Bool)

(assert (=> (and start!112208 (= defaultEntry!1323 defaultEntry!1323) t!44766) tb!11819))

(declare-fun result!24709 () Bool)

(assert (=> tb!11819 (= result!24709 tp_is_empty!36513)))

(assert (=> b!1329029 t!44766))

(declare-fun b_and!49263 () Bool)

(assert (= b_and!49261 (and (=> t!44766 result!24709) b_and!49263)))

(declare-fun m!1217821 () Bool)

(assert (=> mapNonEmpty!56443 m!1217821))

(declare-fun m!1217823 () Bool)

(assert (=> b!1329019 m!1217823))

(declare-fun m!1217825 () Bool)

(assert (=> b!1329025 m!1217825))

(declare-fun m!1217827 () Bool)

(assert (=> b!1329029 m!1217827))

(declare-fun m!1217829 () Bool)

(assert (=> b!1329029 m!1217829))

(declare-fun m!1217831 () Bool)

(assert (=> b!1329029 m!1217831))

(declare-fun m!1217833 () Bool)

(assert (=> b!1329029 m!1217833))

(declare-fun m!1217835 () Bool)

(assert (=> b!1329029 m!1217835))

(assert (=> b!1329029 m!1217829))

(declare-fun m!1217837 () Bool)

(assert (=> b!1329029 m!1217837))

(assert (=> b!1329029 m!1217827))

(assert (=> b!1329029 m!1217831))

(assert (=> b!1329029 m!1217823))

(assert (=> b!1329029 m!1217833))

(assert (=> b!1329029 m!1217837))

(declare-fun m!1217839 () Bool)

(assert (=> b!1329029 m!1217839))

(assert (=> b!1329022 m!1217823))

(assert (=> b!1329022 m!1217823))

(declare-fun m!1217841 () Bool)

(assert (=> b!1329022 m!1217841))

(declare-fun m!1217843 () Bool)

(assert (=> start!112208 m!1217843))

(declare-fun m!1217845 () Bool)

(assert (=> start!112208 m!1217845))

(declare-fun m!1217847 () Bool)

(assert (=> start!112208 m!1217847))

(declare-fun m!1217849 () Bool)

(assert (=> b!1329023 m!1217849))

(declare-fun m!1217851 () Bool)

(assert (=> b!1329030 m!1217851))

(assert (=> b!1329030 m!1217851))

(declare-fun m!1217853 () Bool)

(assert (=> b!1329030 m!1217853))

(check-sat tp_is_empty!36513 (not b!1329030) (not mapNonEmpty!56443) (not start!112208) (not b!1329025) (not b!1329029) (not b_next!30603) (not b_lambda!23863) b_and!49263 (not b!1329023) (not b!1329022))
(check-sat b_and!49263 (not b_next!30603))
