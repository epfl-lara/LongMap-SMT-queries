; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78884 () Bool)

(assert start!78884)

(declare-fun b_free!17097 () Bool)

(declare-fun b_next!17097 () Bool)

(assert (=> start!78884 (= b_free!17097 (not b_next!17097))))

(declare-fun tp!59732 () Bool)

(declare-fun b_and!27931 () Bool)

(assert (=> start!78884 (= tp!59732 b_and!27931)))

(declare-fun b!922001 () Bool)

(declare-fun e!517353 () Bool)

(declare-fun e!517358 () Bool)

(declare-fun mapRes!31164 () Bool)

(assert (=> b!922001 (= e!517353 (and e!517358 mapRes!31164))))

(declare-fun condMapEmpty!31164 () Bool)

(declare-datatypes ((V!31105 0))(
  ( (V!31106 (val!9853 Int)) )
))
(declare-datatypes ((ValueCell!9321 0))(
  ( (ValueCellFull!9321 (v!12371 V!31105)) (EmptyCell!9321) )
))
(declare-datatypes ((array!55188 0))(
  ( (array!55189 (arr!26539 (Array (_ BitVec 32) ValueCell!9321)) (size!26998 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55188)

(declare-fun mapDefault!31164 () ValueCell!9321)

(assert (=> b!922001 (= condMapEmpty!31164 (= (arr!26539 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9321)) mapDefault!31164)))))

(declare-fun b!922002 () Bool)

(declare-fun res!621766 () Bool)

(declare-fun e!517359 () Bool)

(assert (=> b!922002 (=> (not res!621766) (not e!517359))))

(declare-datatypes ((array!55190 0))(
  ( (array!55191 (arr!26540 (Array (_ BitVec 32) (_ BitVec 64))) (size!26999 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55190)

(declare-datatypes ((List!18621 0))(
  ( (Nil!18618) (Cons!18617 (h!19763 (_ BitVec 64)) (t!26448 List!18621)) )
))
(declare-fun arrayNoDuplicates!0 (array!55190 (_ BitVec 32) List!18621) Bool)

(assert (=> b!922002 (= res!621766 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18618))))

(declare-fun b!922003 () Bool)

(declare-fun e!517354 () Bool)

(declare-fun e!517357 () Bool)

(assert (=> b!922003 (= e!517354 e!517357)))

(declare-fun res!621769 () Bool)

(assert (=> b!922003 (=> (not res!621769) (not e!517357))))

(declare-fun lt!413989 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922003 (= res!621769 (validKeyInArray!0 lt!413989))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922003 (= lt!413989 (select (arr!26540 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31164 () Bool)

(assert (=> mapIsEmpty!31164 mapRes!31164))

(declare-fun b!922004 () Bool)

(declare-fun res!621765 () Bool)

(assert (=> b!922004 (=> (not res!621765) (not e!517354))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31105)

(declare-datatypes ((tuple2!12816 0))(
  ( (tuple2!12817 (_1!6419 (_ BitVec 64)) (_2!6419 V!31105)) )
))
(declare-datatypes ((List!18622 0))(
  ( (Nil!18619) (Cons!18618 (h!19764 tuple2!12816) (t!26449 List!18622)) )
))
(declare-datatypes ((ListLongMap!11513 0))(
  ( (ListLongMap!11514 (toList!5772 List!18622)) )
))
(declare-fun lt!413984 () ListLongMap!11513)

(declare-fun apply!610 (ListLongMap!11513 (_ BitVec 64)) V!31105)

(assert (=> b!922004 (= res!621765 (= (apply!610 lt!413984 k0!1099) v!791))))

(declare-fun b!922005 () Bool)

(declare-fun e!517355 () Bool)

(declare-fun arrayContainsKey!0 (array!55190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922005 (= e!517355 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922006 () Bool)

(assert (=> b!922006 (= e!517359 e!517354)))

(declare-fun res!621772 () Bool)

(assert (=> b!922006 (=> (not res!621772) (not e!517354))))

(declare-fun contains!4835 (ListLongMap!11513 (_ BitVec 64)) Bool)

(assert (=> b!922006 (= res!621772 (contains!4835 lt!413984 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31105)

(declare-fun minValue!1173 () V!31105)

(declare-fun getCurrentListMap!3026 (array!55190 array!55188 (_ BitVec 32) (_ BitVec 32) V!31105 V!31105 (_ BitVec 32) Int) ListLongMap!11513)

(assert (=> b!922006 (= lt!413984 (getCurrentListMap!3026 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922007 () Bool)

(declare-fun res!621764 () Bool)

(assert (=> b!922007 (=> (not res!621764) (not e!517359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55190 (_ BitVec 32)) Bool)

(assert (=> b!922007 (= res!621764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922008 () Bool)

(declare-fun res!621768 () Bool)

(assert (=> b!922008 (=> (not res!621768) (not e!517354))))

(assert (=> b!922008 (= res!621768 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922009 () Bool)

(assert (=> b!922009 (= e!517357 (not true))))

(assert (=> b!922009 (not (= lt!413989 k0!1099))))

(declare-datatypes ((Unit!31106 0))(
  ( (Unit!31107) )
))
(declare-fun lt!413987 () Unit!31106)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55190 (_ BitVec 64) (_ BitVec 32) List!18621) Unit!31106)

(assert (=> b!922009 (= lt!413987 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18618))))

(assert (=> b!922009 e!517355))

(declare-fun c!96147 () Bool)

(assert (=> b!922009 (= c!96147 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!413990 () Unit!31106)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!186 (array!55190 array!55188 (_ BitVec 32) (_ BitVec 32) V!31105 V!31105 (_ BitVec 64) (_ BitVec 32) Int) Unit!31106)

(assert (=> b!922009 (= lt!413990 (lemmaListMapContainsThenArrayContainsFrom!186 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922009 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18618)))

(declare-fun lt!413992 () Unit!31106)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55190 (_ BitVec 32) (_ BitVec 32)) Unit!31106)

(assert (=> b!922009 (= lt!413992 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413985 () tuple2!12816)

(declare-fun +!2679 (ListLongMap!11513 tuple2!12816) ListLongMap!11513)

(assert (=> b!922009 (contains!4835 (+!2679 lt!413984 lt!413985) k0!1099)))

(declare-fun lt!413988 () Unit!31106)

(declare-fun lt!413991 () V!31105)

(declare-fun addStillContains!403 (ListLongMap!11513 (_ BitVec 64) V!31105 (_ BitVec 64)) Unit!31106)

(assert (=> b!922009 (= lt!413988 (addStillContains!403 lt!413984 lt!413989 lt!413991 k0!1099))))

(assert (=> b!922009 (= (getCurrentListMap!3026 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2679 (getCurrentListMap!3026 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413985))))

(assert (=> b!922009 (= lt!413985 (tuple2!12817 lt!413989 lt!413991))))

(declare-fun get!13934 (ValueCell!9321 V!31105) V!31105)

(declare-fun dynLambda!1468 (Int (_ BitVec 64)) V!31105)

(assert (=> b!922009 (= lt!413991 (get!13934 (select (arr!26539 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1468 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413986 () Unit!31106)

(declare-fun lemmaListMapRecursiveValidKeyArray!69 (array!55190 array!55188 (_ BitVec 32) (_ BitVec 32) V!31105 V!31105 (_ BitVec 32) Int) Unit!31106)

(assert (=> b!922009 (= lt!413986 (lemmaListMapRecursiveValidKeyArray!69 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922010 () Bool)

(declare-fun e!517360 () Bool)

(declare-fun tp_is_empty!19605 () Bool)

(assert (=> b!922010 (= e!517360 tp_is_empty!19605)))

(declare-fun b!922011 () Bool)

(declare-fun res!621767 () Bool)

(assert (=> b!922011 (=> (not res!621767) (not e!517354))))

(assert (=> b!922011 (= res!621767 (validKeyInArray!0 k0!1099))))

(declare-fun b!922012 () Bool)

(declare-fun res!621763 () Bool)

(assert (=> b!922012 (=> (not res!621763) (not e!517359))))

(assert (=> b!922012 (= res!621763 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26999 _keys!1487))))))

(declare-fun mapNonEmpty!31164 () Bool)

(declare-fun tp!59731 () Bool)

(assert (=> mapNonEmpty!31164 (= mapRes!31164 (and tp!59731 e!517360))))

(declare-fun mapValue!31164 () ValueCell!9321)

(declare-fun mapRest!31164 () (Array (_ BitVec 32) ValueCell!9321))

(declare-fun mapKey!31164 () (_ BitVec 32))

(assert (=> mapNonEmpty!31164 (= (arr!26539 _values!1231) (store mapRest!31164 mapKey!31164 mapValue!31164))))

(declare-fun b!922013 () Bool)

(declare-fun res!621771 () Bool)

(assert (=> b!922013 (=> (not res!621771) (not e!517359))))

(assert (=> b!922013 (= res!621771 (and (= (size!26998 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26999 _keys!1487) (size!26998 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922014 () Bool)

(assert (=> b!922014 (= e!517358 tp_is_empty!19605)))

(declare-fun b!922015 () Bool)

(assert (=> b!922015 (= e!517355 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!621770 () Bool)

(assert (=> start!78884 (=> (not res!621770) (not e!517359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78884 (= res!621770 (validMask!0 mask!1881))))

(assert (=> start!78884 e!517359))

(assert (=> start!78884 true))

(assert (=> start!78884 tp_is_empty!19605))

(declare-fun array_inv!20672 (array!55188) Bool)

(assert (=> start!78884 (and (array_inv!20672 _values!1231) e!517353)))

(assert (=> start!78884 tp!59732))

(declare-fun array_inv!20673 (array!55190) Bool)

(assert (=> start!78884 (array_inv!20673 _keys!1487)))

(assert (= (and start!78884 res!621770) b!922013))

(assert (= (and b!922013 res!621771) b!922007))

(assert (= (and b!922007 res!621764) b!922002))

(assert (= (and b!922002 res!621766) b!922012))

(assert (= (and b!922012 res!621763) b!922006))

(assert (= (and b!922006 res!621772) b!922004))

(assert (= (and b!922004 res!621765) b!922008))

(assert (= (and b!922008 res!621768) b!922011))

(assert (= (and b!922011 res!621767) b!922003))

(assert (= (and b!922003 res!621769) b!922009))

(assert (= (and b!922009 c!96147) b!922005))

(assert (= (and b!922009 (not c!96147)) b!922015))

(assert (= (and b!922001 condMapEmpty!31164) mapIsEmpty!31164))

(assert (= (and b!922001 (not condMapEmpty!31164)) mapNonEmpty!31164))

(get-info :version)

(assert (= (and mapNonEmpty!31164 ((_ is ValueCellFull!9321) mapValue!31164)) b!922010))

(assert (= (and b!922001 ((_ is ValueCellFull!9321) mapDefault!31164)) b!922014))

(assert (= start!78884 b!922001))

(declare-fun b_lambda!13599 () Bool)

(assert (=> (not b_lambda!13599) (not b!922009)))

(declare-fun t!26447 () Bool)

(declare-fun tb!5677 () Bool)

(assert (=> (and start!78884 (= defaultEntry!1235 defaultEntry!1235) t!26447) tb!5677))

(declare-fun result!11177 () Bool)

(assert (=> tb!5677 (= result!11177 tp_is_empty!19605)))

(assert (=> b!922009 t!26447))

(declare-fun b_and!27933 () Bool)

(assert (= b_and!27931 (and (=> t!26447 result!11177) b_and!27933)))

(declare-fun m!856005 () Bool)

(assert (=> b!922005 m!856005))

(declare-fun m!856007 () Bool)

(assert (=> b!922003 m!856007))

(declare-fun m!856009 () Bool)

(assert (=> b!922003 m!856009))

(declare-fun m!856011 () Bool)

(assert (=> b!922004 m!856011))

(declare-fun m!856013 () Bool)

(assert (=> start!78884 m!856013))

(declare-fun m!856015 () Bool)

(assert (=> start!78884 m!856015))

(declare-fun m!856017 () Bool)

(assert (=> start!78884 m!856017))

(declare-fun m!856019 () Bool)

(assert (=> b!922006 m!856019))

(declare-fun m!856021 () Bool)

(assert (=> b!922006 m!856021))

(declare-fun m!856023 () Bool)

(assert (=> b!922011 m!856023))

(declare-fun m!856025 () Bool)

(assert (=> b!922009 m!856025))

(declare-fun m!856027 () Bool)

(assert (=> b!922009 m!856027))

(declare-fun m!856029 () Bool)

(assert (=> b!922009 m!856029))

(declare-fun m!856031 () Bool)

(assert (=> b!922009 m!856031))

(declare-fun m!856033 () Bool)

(assert (=> b!922009 m!856033))

(declare-fun m!856035 () Bool)

(assert (=> b!922009 m!856035))

(declare-fun m!856037 () Bool)

(assert (=> b!922009 m!856037))

(assert (=> b!922009 m!856037))

(declare-fun m!856039 () Bool)

(assert (=> b!922009 m!856039))

(assert (=> b!922009 m!856027))

(assert (=> b!922009 m!856029))

(declare-fun m!856041 () Bool)

(assert (=> b!922009 m!856041))

(declare-fun m!856043 () Bool)

(assert (=> b!922009 m!856043))

(declare-fun m!856045 () Bool)

(assert (=> b!922009 m!856045))

(declare-fun m!856047 () Bool)

(assert (=> b!922009 m!856047))

(declare-fun m!856049 () Bool)

(assert (=> b!922009 m!856049))

(assert (=> b!922009 m!856043))

(declare-fun m!856051 () Bool)

(assert (=> b!922009 m!856051))

(declare-fun m!856053 () Bool)

(assert (=> b!922002 m!856053))

(declare-fun m!856055 () Bool)

(assert (=> b!922007 m!856055))

(declare-fun m!856057 () Bool)

(assert (=> mapNonEmpty!31164 m!856057))

(check-sat (not b_next!17097) (not start!78884) (not b!922009) (not b_lambda!13599) (not b!922002) (not b!922005) tp_is_empty!19605 (not b!922006) (not mapNonEmpty!31164) (not b!922011) b_and!27933 (not b!922007) (not b!922004) (not b!922003))
(check-sat b_and!27933 (not b_next!17097))
