; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78806 () Bool)

(assert start!78806)

(declare-fun b_free!17019 () Bool)

(declare-fun b_next!17019 () Bool)

(assert (=> start!78806 (= b_free!17019 (not b_next!17019))))

(declare-fun tp!59498 () Bool)

(declare-fun b_and!27775 () Bool)

(assert (=> start!78806 (= tp!59498 b_and!27775)))

(declare-fun res!620350 () Bool)

(declare-fun e!516363 () Bool)

(assert (=> start!78806 (=> (not res!620350) (not e!516363))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78806 (= res!620350 (validMask!0 mask!1881))))

(assert (=> start!78806 e!516363))

(assert (=> start!78806 true))

(declare-fun tp_is_empty!19527 () Bool)

(assert (=> start!78806 tp_is_empty!19527))

(declare-datatypes ((V!31001 0))(
  ( (V!31002 (val!9814 Int)) )
))
(declare-datatypes ((ValueCell!9282 0))(
  ( (ValueCellFull!9282 (v!12332 V!31001)) (EmptyCell!9282) )
))
(declare-datatypes ((array!55036 0))(
  ( (array!55037 (arr!26463 (Array (_ BitVec 32) ValueCell!9282)) (size!26922 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55036)

(declare-fun e!516364 () Bool)

(declare-fun array_inv!20624 (array!55036) Bool)

(assert (=> start!78806 (and (array_inv!20624 _values!1231) e!516364)))

(assert (=> start!78806 tp!59498))

(declare-datatypes ((array!55038 0))(
  ( (array!55039 (arr!26464 (Array (_ BitVec 32) (_ BitVec 64))) (size!26923 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55038)

(declare-fun array_inv!20625 (array!55038) Bool)

(assert (=> start!78806 (array_inv!20625 _keys!1487)))

(declare-fun b!919969 () Bool)

(declare-fun e!516361 () Bool)

(declare-fun e!516359 () Bool)

(assert (=> b!919969 (= e!516361 e!516359)))

(declare-fun res!620358 () Bool)

(assert (=> b!919969 (=> (not res!620358) (not e!516359))))

(declare-fun lt!412979 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919969 (= res!620358 (validKeyInArray!0 lt!412979))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919969 (= lt!412979 (select (arr!26464 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31047 () Bool)

(declare-fun mapRes!31047 () Bool)

(declare-fun tp!59497 () Bool)

(declare-fun e!516362 () Bool)

(assert (=> mapNonEmpty!31047 (= mapRes!31047 (and tp!59497 e!516362))))

(declare-fun mapRest!31047 () (Array (_ BitVec 32) ValueCell!9282))

(declare-fun mapValue!31047 () ValueCell!9282)

(declare-fun mapKey!31047 () (_ BitVec 32))

(assert (=> mapNonEmpty!31047 (= (arr!26463 _values!1231) (store mapRest!31047 mapKey!31047 mapValue!31047))))

(declare-fun b!919970 () Bool)

(declare-fun res!620354 () Bool)

(assert (=> b!919970 (=> (not res!620354) (not e!516361))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31001)

(declare-datatypes ((tuple2!12756 0))(
  ( (tuple2!12757 (_1!6389 (_ BitVec 64)) (_2!6389 V!31001)) )
))
(declare-datatypes ((List!18559 0))(
  ( (Nil!18556) (Cons!18555 (h!19701 tuple2!12756) (t!26308 List!18559)) )
))
(declare-datatypes ((ListLongMap!11453 0))(
  ( (ListLongMap!11454 (toList!5742 List!18559)) )
))
(declare-fun lt!412977 () ListLongMap!11453)

(declare-fun apply!585 (ListLongMap!11453 (_ BitVec 64)) V!31001)

(assert (=> b!919970 (= res!620354 (= (apply!585 lt!412977 k0!1099) v!791))))

(declare-fun b!919971 () Bool)

(assert (=> b!919971 (= e!516359 (not true))))

(declare-datatypes ((List!18560 0))(
  ( (Nil!18557) (Cons!18556 (h!19702 (_ BitVec 64)) (t!26309 List!18560)) )
))
(declare-fun arrayNoDuplicates!0 (array!55038 (_ BitVec 32) List!18560) Bool)

(assert (=> b!919971 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18557)))

(declare-datatypes ((Unit!31050 0))(
  ( (Unit!31051) )
))
(declare-fun lt!412976 () Unit!31050)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55038 (_ BitVec 32) (_ BitVec 32)) Unit!31050)

(assert (=> b!919971 (= lt!412976 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412980 () tuple2!12756)

(declare-fun contains!4788 (ListLongMap!11453 (_ BitVec 64)) Bool)

(declare-fun +!2651 (ListLongMap!11453 tuple2!12756) ListLongMap!11453)

(assert (=> b!919971 (contains!4788 (+!2651 lt!412977 lt!412980) k0!1099)))

(declare-fun lt!412978 () Unit!31050)

(declare-fun lt!412975 () V!31001)

(declare-fun addStillContains!375 (ListLongMap!11453 (_ BitVec 64) V!31001 (_ BitVec 64)) Unit!31050)

(assert (=> b!919971 (= lt!412978 (addStillContains!375 lt!412977 lt!412979 lt!412975 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31001)

(declare-fun minValue!1173 () V!31001)

(declare-fun getCurrentListMap!2998 (array!55038 array!55036 (_ BitVec 32) (_ BitVec 32) V!31001 V!31001 (_ BitVec 32) Int) ListLongMap!11453)

(assert (=> b!919971 (= (getCurrentListMap!2998 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2651 (getCurrentListMap!2998 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412980))))

(assert (=> b!919971 (= lt!412980 (tuple2!12757 lt!412979 lt!412975))))

(declare-fun get!13880 (ValueCell!9282 V!31001) V!31001)

(declare-fun dynLambda!1440 (Int (_ BitVec 64)) V!31001)

(assert (=> b!919971 (= lt!412975 (get!13880 (select (arr!26463 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1440 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412981 () Unit!31050)

(declare-fun lemmaListMapRecursiveValidKeyArray!41 (array!55038 array!55036 (_ BitVec 32) (_ BitVec 32) V!31001 V!31001 (_ BitVec 32) Int) Unit!31050)

(assert (=> b!919971 (= lt!412981 (lemmaListMapRecursiveValidKeyArray!41 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919972 () Bool)

(assert (=> b!919972 (= e!516363 e!516361)))

(declare-fun res!620357 () Bool)

(assert (=> b!919972 (=> (not res!620357) (not e!516361))))

(assert (=> b!919972 (= res!620357 (contains!4788 lt!412977 k0!1099))))

(assert (=> b!919972 (= lt!412977 (getCurrentListMap!2998 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919973 () Bool)

(declare-fun res!620359 () Bool)

(assert (=> b!919973 (=> (not res!620359) (not e!516363))))

(assert (=> b!919973 (= res!620359 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18557))))

(declare-fun b!919974 () Bool)

(declare-fun res!620355 () Bool)

(assert (=> b!919974 (=> (not res!620355) (not e!516361))))

(assert (=> b!919974 (= res!620355 (validKeyInArray!0 k0!1099))))

(declare-fun b!919975 () Bool)

(declare-fun e!516360 () Bool)

(assert (=> b!919975 (= e!516364 (and e!516360 mapRes!31047))))

(declare-fun condMapEmpty!31047 () Bool)

(declare-fun mapDefault!31047 () ValueCell!9282)

(assert (=> b!919975 (= condMapEmpty!31047 (= (arr!26463 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9282)) mapDefault!31047)))))

(declare-fun b!919976 () Bool)

(assert (=> b!919976 (= e!516360 tp_is_empty!19527)))

(declare-fun b!919977 () Bool)

(declare-fun res!620352 () Bool)

(assert (=> b!919977 (=> (not res!620352) (not e!516361))))

(assert (=> b!919977 (= res!620352 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919978 () Bool)

(declare-fun res!620356 () Bool)

(assert (=> b!919978 (=> (not res!620356) (not e!516363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55038 (_ BitVec 32)) Bool)

(assert (=> b!919978 (= res!620356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31047 () Bool)

(assert (=> mapIsEmpty!31047 mapRes!31047))

(declare-fun b!919979 () Bool)

(declare-fun res!620351 () Bool)

(assert (=> b!919979 (=> (not res!620351) (not e!516363))))

(assert (=> b!919979 (= res!620351 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26923 _keys!1487))))))

(declare-fun b!919980 () Bool)

(assert (=> b!919980 (= e!516362 tp_is_empty!19527)))

(declare-fun b!919981 () Bool)

(declare-fun res!620353 () Bool)

(assert (=> b!919981 (=> (not res!620353) (not e!516363))))

(assert (=> b!919981 (= res!620353 (and (= (size!26922 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26923 _keys!1487) (size!26922 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78806 res!620350) b!919981))

(assert (= (and b!919981 res!620353) b!919978))

(assert (= (and b!919978 res!620356) b!919973))

(assert (= (and b!919973 res!620359) b!919979))

(assert (= (and b!919979 res!620351) b!919972))

(assert (= (and b!919972 res!620357) b!919970))

(assert (= (and b!919970 res!620354) b!919977))

(assert (= (and b!919977 res!620352) b!919974))

(assert (= (and b!919974 res!620355) b!919969))

(assert (= (and b!919969 res!620358) b!919971))

(assert (= (and b!919975 condMapEmpty!31047) mapIsEmpty!31047))

(assert (= (and b!919975 (not condMapEmpty!31047)) mapNonEmpty!31047))

(get-info :version)

(assert (= (and mapNonEmpty!31047 ((_ is ValueCellFull!9282) mapValue!31047)) b!919980))

(assert (= (and b!919975 ((_ is ValueCellFull!9282) mapDefault!31047)) b!919976))

(assert (= start!78806 b!919975))

(declare-fun b_lambda!13521 () Bool)

(assert (=> (not b_lambda!13521) (not b!919971)))

(declare-fun t!26307 () Bool)

(declare-fun tb!5599 () Bool)

(assert (=> (and start!78806 (= defaultEntry!1235 defaultEntry!1235) t!26307) tb!5599))

(declare-fun result!11021 () Bool)

(assert (=> tb!5599 (= result!11021 tp_is_empty!19527)))

(assert (=> b!919971 t!26307))

(declare-fun b_and!27777 () Bool)

(assert (= b_and!27775 (and (=> t!26307 result!11021) b_and!27777)))

(declare-fun m!853839 () Bool)

(assert (=> b!919971 m!853839))

(declare-fun m!853841 () Bool)

(assert (=> b!919971 m!853841))

(declare-fun m!853843 () Bool)

(assert (=> b!919971 m!853843))

(declare-fun m!853845 () Bool)

(assert (=> b!919971 m!853845))

(assert (=> b!919971 m!853843))

(assert (=> b!919971 m!853845))

(declare-fun m!853847 () Bool)

(assert (=> b!919971 m!853847))

(declare-fun m!853849 () Bool)

(assert (=> b!919971 m!853849))

(declare-fun m!853851 () Bool)

(assert (=> b!919971 m!853851))

(declare-fun m!853853 () Bool)

(assert (=> b!919971 m!853853))

(declare-fun m!853855 () Bool)

(assert (=> b!919971 m!853855))

(assert (=> b!919971 m!853839))

(declare-fun m!853857 () Bool)

(assert (=> b!919971 m!853857))

(declare-fun m!853859 () Bool)

(assert (=> b!919971 m!853859))

(assert (=> b!919971 m!853849))

(declare-fun m!853861 () Bool)

(assert (=> b!919971 m!853861))

(declare-fun m!853863 () Bool)

(assert (=> mapNonEmpty!31047 m!853863))

(declare-fun m!853865 () Bool)

(assert (=> b!919974 m!853865))

(declare-fun m!853867 () Bool)

(assert (=> b!919970 m!853867))

(declare-fun m!853869 () Bool)

(assert (=> b!919969 m!853869))

(declare-fun m!853871 () Bool)

(assert (=> b!919969 m!853871))

(declare-fun m!853873 () Bool)

(assert (=> b!919972 m!853873))

(declare-fun m!853875 () Bool)

(assert (=> b!919972 m!853875))

(declare-fun m!853877 () Bool)

(assert (=> start!78806 m!853877))

(declare-fun m!853879 () Bool)

(assert (=> start!78806 m!853879))

(declare-fun m!853881 () Bool)

(assert (=> start!78806 m!853881))

(declare-fun m!853883 () Bool)

(assert (=> b!919978 m!853883))

(declare-fun m!853885 () Bool)

(assert (=> b!919973 m!853885))

(check-sat (not start!78806) (not b!919970) (not b!919978) (not b!919972) tp_is_empty!19527 (not b_lambda!13521) (not b!919971) (not b!919969) (not b!919973) b_and!27777 (not mapNonEmpty!31047) (not b_next!17019) (not b!919974))
(check-sat b_and!27777 (not b_next!17019))
