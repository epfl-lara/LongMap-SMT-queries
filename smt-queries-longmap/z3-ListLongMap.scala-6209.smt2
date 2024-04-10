; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79390 () Bool)

(assert start!79390)

(declare-fun b_free!17577 () Bool)

(declare-fun b_next!17577 () Bool)

(assert (=> start!79390 (= b_free!17577 (not b_next!17577))))

(declare-fun tp!61174 () Bool)

(declare-fun b_and!28713 () Bool)

(assert (=> start!79390 (= tp!61174 b_and!28713)))

(declare-fun b!932814 () Bool)

(declare-fun res!628261 () Bool)

(declare-fun e!523826 () Bool)

(assert (=> b!932814 (=> (not res!628261) (not e!523826))))

(declare-datatypes ((array!56106 0))(
  ( (array!56107 (arr!26997 (Array (_ BitVec 32) (_ BitVec 64))) (size!27456 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56106)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31745 0))(
  ( (V!31746 (val!10093 Int)) )
))
(declare-datatypes ((ValueCell!9561 0))(
  ( (ValueCellFull!9561 (v!12612 V!31745)) (EmptyCell!9561) )
))
(declare-datatypes ((array!56108 0))(
  ( (array!56109 (arr!26998 (Array (_ BitVec 32) ValueCell!9561)) (size!27457 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56108)

(assert (=> b!932814 (= res!628261 (and (= (size!27457 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27456 _keys!1487) (size!27457 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932815 () Bool)

(declare-fun e!523823 () Bool)

(declare-fun tp_is_empty!20085 () Bool)

(assert (=> b!932815 (= e!523823 tp_is_empty!20085)))

(declare-fun b!932816 () Bool)

(declare-fun e!523821 () Bool)

(declare-fun e!523824 () Bool)

(assert (=> b!932816 (= e!523821 e!523824)))

(declare-fun res!628259 () Bool)

(assert (=> b!932816 (=> (not res!628259) (not e!523824))))

(declare-fun lt!420083 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932816 (= res!628259 (validKeyInArray!0 lt!420083))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932816 (= lt!420083 (select (arr!26997 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932817 () Bool)

(assert (=> b!932817 (= e!523824 (not true))))

(declare-datatypes ((List!19008 0))(
  ( (Nil!19005) (Cons!19004 (h!20150 (_ BitVec 64)) (t!27129 List!19008)) )
))
(declare-fun arrayNoDuplicates!0 (array!56106 (_ BitVec 32) List!19008) Bool)

(assert (=> b!932817 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19005)))

(declare-datatypes ((Unit!31477 0))(
  ( (Unit!31478) )
))
(declare-fun lt!420084 () Unit!31477)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56106 (_ BitVec 32) (_ BitVec 32)) Unit!31477)

(assert (=> b!932817 (= lt!420084 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13226 0))(
  ( (tuple2!13227 (_1!6624 (_ BitVec 64)) (_2!6624 V!31745)) )
))
(declare-datatypes ((List!19009 0))(
  ( (Nil!19006) (Cons!19005 (h!20151 tuple2!13226) (t!27130 List!19009)) )
))
(declare-datatypes ((ListLongMap!11923 0))(
  ( (ListLongMap!11924 (toList!5977 List!19009)) )
))
(declare-fun lt!420080 () ListLongMap!11923)

(declare-fun lt!420086 () tuple2!13226)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5026 (ListLongMap!11923 (_ BitVec 64)) Bool)

(declare-fun +!2781 (ListLongMap!11923 tuple2!13226) ListLongMap!11923)

(assert (=> b!932817 (contains!5026 (+!2781 lt!420080 lt!420086) k0!1099)))

(declare-fun lt!420082 () V!31745)

(declare-fun lt!420081 () Unit!31477)

(declare-fun addStillContains!500 (ListLongMap!11923 (_ BitVec 64) V!31745 (_ BitVec 64)) Unit!31477)

(assert (=> b!932817 (= lt!420081 (addStillContains!500 lt!420080 lt!420083 lt!420082 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31745)

(declare-fun minValue!1173 () V!31745)

(declare-fun getCurrentListMap!3215 (array!56106 array!56108 (_ BitVec 32) (_ BitVec 32) V!31745 V!31745 (_ BitVec 32) Int) ListLongMap!11923)

(assert (=> b!932817 (= (getCurrentListMap!3215 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2781 (getCurrentListMap!3215 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420086))))

(assert (=> b!932817 (= lt!420086 (tuple2!13227 lt!420083 lt!420082))))

(declare-fun get!14199 (ValueCell!9561 V!31745) V!31745)

(declare-fun dynLambda!1570 (Int (_ BitVec 64)) V!31745)

(assert (=> b!932817 (= lt!420082 (get!14199 (select (arr!26998 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1570 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420085 () Unit!31477)

(declare-fun lemmaListMapRecursiveValidKeyArray!171 (array!56106 array!56108 (_ BitVec 32) (_ BitVec 32) V!31745 V!31745 (_ BitVec 32) Int) Unit!31477)

(assert (=> b!932817 (= lt!420085 (lemmaListMapRecursiveValidKeyArray!171 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932818 () Bool)

(declare-fun res!628255 () Bool)

(assert (=> b!932818 (=> (not res!628255) (not e!523821))))

(declare-fun v!791 () V!31745)

(declare-fun apply!790 (ListLongMap!11923 (_ BitVec 64)) V!31745)

(assert (=> b!932818 (= res!628255 (= (apply!790 lt!420080 k0!1099) v!791))))

(declare-fun mapIsEmpty!31887 () Bool)

(declare-fun mapRes!31887 () Bool)

(assert (=> mapIsEmpty!31887 mapRes!31887))

(declare-fun res!628257 () Bool)

(assert (=> start!79390 (=> (not res!628257) (not e!523826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79390 (= res!628257 (validMask!0 mask!1881))))

(assert (=> start!79390 e!523826))

(assert (=> start!79390 true))

(assert (=> start!79390 tp_is_empty!20085))

(declare-fun e!523825 () Bool)

(declare-fun array_inv!21012 (array!56108) Bool)

(assert (=> start!79390 (and (array_inv!21012 _values!1231) e!523825)))

(assert (=> start!79390 tp!61174))

(declare-fun array_inv!21013 (array!56106) Bool)

(assert (=> start!79390 (array_inv!21013 _keys!1487)))

(declare-fun b!932819 () Bool)

(declare-fun res!628262 () Bool)

(assert (=> b!932819 (=> (not res!628262) (not e!523821))))

(assert (=> b!932819 (= res!628262 (validKeyInArray!0 k0!1099))))

(declare-fun b!932820 () Bool)

(declare-fun res!628263 () Bool)

(assert (=> b!932820 (=> (not res!628263) (not e!523821))))

(assert (=> b!932820 (= res!628263 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932821 () Bool)

(declare-fun res!628256 () Bool)

(assert (=> b!932821 (=> (not res!628256) (not e!523826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56106 (_ BitVec 32)) Bool)

(assert (=> b!932821 (= res!628256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932822 () Bool)

(declare-fun e!523827 () Bool)

(assert (=> b!932822 (= e!523827 tp_is_empty!20085)))

(declare-fun mapNonEmpty!31887 () Bool)

(declare-fun tp!61175 () Bool)

(assert (=> mapNonEmpty!31887 (= mapRes!31887 (and tp!61175 e!523827))))

(declare-fun mapKey!31887 () (_ BitVec 32))

(declare-fun mapRest!31887 () (Array (_ BitVec 32) ValueCell!9561))

(declare-fun mapValue!31887 () ValueCell!9561)

(assert (=> mapNonEmpty!31887 (= (arr!26998 _values!1231) (store mapRest!31887 mapKey!31887 mapValue!31887))))

(declare-fun b!932823 () Bool)

(declare-fun res!628264 () Bool)

(assert (=> b!932823 (=> (not res!628264) (not e!523826))))

(assert (=> b!932823 (= res!628264 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19005))))

(declare-fun b!932824 () Bool)

(assert (=> b!932824 (= e!523826 e!523821)))

(declare-fun res!628260 () Bool)

(assert (=> b!932824 (=> (not res!628260) (not e!523821))))

(assert (=> b!932824 (= res!628260 (contains!5026 lt!420080 k0!1099))))

(assert (=> b!932824 (= lt!420080 (getCurrentListMap!3215 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932825 () Bool)

(assert (=> b!932825 (= e!523825 (and e!523823 mapRes!31887))))

(declare-fun condMapEmpty!31887 () Bool)

(declare-fun mapDefault!31887 () ValueCell!9561)

(assert (=> b!932825 (= condMapEmpty!31887 (= (arr!26998 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9561)) mapDefault!31887)))))

(declare-fun b!932826 () Bool)

(declare-fun res!628258 () Bool)

(assert (=> b!932826 (=> (not res!628258) (not e!523826))))

(assert (=> b!932826 (= res!628258 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27456 _keys!1487))))))

(assert (= (and start!79390 res!628257) b!932814))

(assert (= (and b!932814 res!628261) b!932821))

(assert (= (and b!932821 res!628256) b!932823))

(assert (= (and b!932823 res!628264) b!932826))

(assert (= (and b!932826 res!628258) b!932824))

(assert (= (and b!932824 res!628260) b!932818))

(assert (= (and b!932818 res!628255) b!932820))

(assert (= (and b!932820 res!628263) b!932819))

(assert (= (and b!932819 res!628262) b!932816))

(assert (= (and b!932816 res!628259) b!932817))

(assert (= (and b!932825 condMapEmpty!31887) mapIsEmpty!31887))

(assert (= (and b!932825 (not condMapEmpty!31887)) mapNonEmpty!31887))

(get-info :version)

(assert (= (and mapNonEmpty!31887 ((_ is ValueCellFull!9561) mapValue!31887)) b!932822))

(assert (= (and b!932825 ((_ is ValueCellFull!9561) mapDefault!31887)) b!932815))

(assert (= start!79390 b!932825))

(declare-fun b_lambda!13911 () Bool)

(assert (=> (not b_lambda!13911) (not b!932817)))

(declare-fun t!27128 () Bool)

(declare-fun tb!5971 () Bool)

(assert (=> (and start!79390 (= defaultEntry!1235 defaultEntry!1235) t!27128) tb!5971))

(declare-fun result!11767 () Bool)

(assert (=> tb!5971 (= result!11767 tp_is_empty!20085)))

(assert (=> b!932817 t!27128))

(declare-fun b_and!28715 () Bool)

(assert (= b_and!28713 (and (=> t!27128 result!11767) b_and!28715)))

(declare-fun m!866839 () Bool)

(assert (=> b!932818 m!866839))

(declare-fun m!866841 () Bool)

(assert (=> start!79390 m!866841))

(declare-fun m!866843 () Bool)

(assert (=> start!79390 m!866843))

(declare-fun m!866845 () Bool)

(assert (=> start!79390 m!866845))

(declare-fun m!866847 () Bool)

(assert (=> b!932824 m!866847))

(declare-fun m!866849 () Bool)

(assert (=> b!932824 m!866849))

(declare-fun m!866851 () Bool)

(assert (=> b!932821 m!866851))

(declare-fun m!866853 () Bool)

(assert (=> b!932816 m!866853))

(declare-fun m!866855 () Bool)

(assert (=> b!932816 m!866855))

(declare-fun m!866857 () Bool)

(assert (=> b!932819 m!866857))

(declare-fun m!866859 () Bool)

(assert (=> mapNonEmpty!31887 m!866859))

(declare-fun m!866861 () Bool)

(assert (=> b!932817 m!866861))

(declare-fun m!866863 () Bool)

(assert (=> b!932817 m!866863))

(declare-fun m!866865 () Bool)

(assert (=> b!932817 m!866865))

(declare-fun m!866867 () Bool)

(assert (=> b!932817 m!866867))

(declare-fun m!866869 () Bool)

(assert (=> b!932817 m!866869))

(declare-fun m!866871 () Bool)

(assert (=> b!932817 m!866871))

(declare-fun m!866873 () Bool)

(assert (=> b!932817 m!866873))

(assert (=> b!932817 m!866861))

(assert (=> b!932817 m!866869))

(assert (=> b!932817 m!866873))

(declare-fun m!866875 () Bool)

(assert (=> b!932817 m!866875))

(declare-fun m!866877 () Bool)

(assert (=> b!932817 m!866877))

(declare-fun m!866879 () Bool)

(assert (=> b!932817 m!866879))

(declare-fun m!866881 () Bool)

(assert (=> b!932817 m!866881))

(assert (=> b!932817 m!866865))

(declare-fun m!866883 () Bool)

(assert (=> b!932817 m!866883))

(declare-fun m!866885 () Bool)

(assert (=> b!932823 m!866885))

(check-sat (not b!932819) (not b_lambda!13911) (not b!932816) (not start!79390) b_and!28715 (not b!932823) (not mapNonEmpty!31887) (not b!932824) (not b!932821) (not b!932818) (not b!932817) tp_is_empty!20085 (not b_next!17577))
(check-sat b_and!28715 (not b_next!17577))
