; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78876 () Bool)

(assert start!78876)

(declare-fun b_free!17107 () Bool)

(declare-fun b_next!17107 () Bool)

(assert (=> start!78876 (= b_free!17107 (not b_next!17107))))

(declare-fun tp!59763 () Bool)

(declare-fun b_and!27925 () Bool)

(assert (=> start!78876 (= tp!59763 b_and!27925)))

(declare-fun res!621805 () Bool)

(declare-fun e!517331 () Bool)

(assert (=> start!78876 (=> (not res!621805) (not e!517331))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78876 (= res!621805 (validMask!0 mask!1881))))

(assert (=> start!78876 e!517331))

(assert (=> start!78876 true))

(declare-fun tp_is_empty!19615 () Bool)

(assert (=> start!78876 tp_is_empty!19615))

(declare-datatypes ((V!31119 0))(
  ( (V!31120 (val!9858 Int)) )
))
(declare-datatypes ((ValueCell!9326 0))(
  ( (ValueCellFull!9326 (v!12375 V!31119)) (EmptyCell!9326) )
))
(declare-datatypes ((array!55181 0))(
  ( (array!55182 (arr!26536 (Array (_ BitVec 32) ValueCell!9326)) (size!26997 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55181)

(declare-fun e!517327 () Bool)

(declare-fun array_inv!20756 (array!55181) Bool)

(assert (=> start!78876 (and (array_inv!20756 _values!1231) e!517327)))

(assert (=> start!78876 tp!59763))

(declare-datatypes ((array!55183 0))(
  ( (array!55184 (arr!26537 (Array (_ BitVec 32) (_ BitVec 64))) (size!26998 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55183)

(declare-fun array_inv!20757 (array!55183) Bool)

(assert (=> start!78876 (array_inv!20757 _keys!1487)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!517326 () Bool)

(declare-fun b!921997 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!55183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921997 (= e!517326 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921998 () Bool)

(declare-fun e!517329 () Bool)

(assert (=> b!921998 (= e!517329 tp_is_empty!19615)))

(declare-fun b!921999 () Bool)

(declare-fun e!517330 () Bool)

(declare-fun mapRes!31179 () Bool)

(assert (=> b!921999 (= e!517327 (and e!517330 mapRes!31179))))

(declare-fun condMapEmpty!31179 () Bool)

(declare-fun mapDefault!31179 () ValueCell!9326)

(assert (=> b!921999 (= condMapEmpty!31179 (= (arr!26536 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9326)) mapDefault!31179)))))

(declare-fun b!922000 () Bool)

(declare-fun res!621803 () Bool)

(declare-fun e!517325 () Bool)

(assert (=> b!922000 (=> (not res!621803) (not e!517325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922000 (= res!621803 (validKeyInArray!0 k0!1099))))

(declare-fun b!922001 () Bool)

(declare-fun res!621807 () Bool)

(assert (=> b!922001 (=> (not res!621807) (not e!517331))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!922001 (= res!621807 (and (= (size!26997 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26998 _keys!1487) (size!26997 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922002 () Bool)

(declare-fun res!621811 () Bool)

(assert (=> b!922002 (=> (not res!621811) (not e!517325))))

(assert (=> b!922002 (= res!621811 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922003 () Bool)

(declare-fun e!517332 () Bool)

(assert (=> b!922003 (= e!517332 (not true))))

(declare-fun lt!413891 () (_ BitVec 64))

(assert (=> b!922003 (not (= lt!413891 k0!1099))))

(declare-datatypes ((Unit!31034 0))(
  ( (Unit!31035) )
))
(declare-fun lt!413887 () Unit!31034)

(declare-datatypes ((List!18671 0))(
  ( (Nil!18668) (Cons!18667 (h!19813 (_ BitVec 64)) (t!26499 List!18671)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55183 (_ BitVec 64) (_ BitVec 32) List!18671) Unit!31034)

(assert (=> b!922003 (= lt!413887 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18668))))

(assert (=> b!922003 e!517326))

(declare-fun c!96097 () Bool)

(assert (=> b!922003 (= c!96097 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!413883 () Unit!31034)

(declare-fun zeroValue!1173 () V!31119)

(declare-fun minValue!1173 () V!31119)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!199 (array!55183 array!55181 (_ BitVec 32) (_ BitVec 32) V!31119 V!31119 (_ BitVec 64) (_ BitVec 32) Int) Unit!31034)

(assert (=> b!922003 (= lt!413883 (lemmaListMapContainsThenArrayContainsFrom!199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55183 (_ BitVec 32) List!18671) Bool)

(assert (=> b!922003 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18668)))

(declare-fun lt!413890 () Unit!31034)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55183 (_ BitVec 32) (_ BitVec 32)) Unit!31034)

(assert (=> b!922003 (= lt!413890 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12888 0))(
  ( (tuple2!12889 (_1!6455 (_ BitVec 64)) (_2!6455 V!31119)) )
))
(declare-datatypes ((List!18672 0))(
  ( (Nil!18669) (Cons!18668 (h!19814 tuple2!12888) (t!26500 List!18672)) )
))
(declare-datatypes ((ListLongMap!11575 0))(
  ( (ListLongMap!11576 (toList!5803 List!18672)) )
))
(declare-fun lt!413886 () ListLongMap!11575)

(declare-fun lt!413889 () tuple2!12888)

(declare-fun contains!4819 (ListLongMap!11575 (_ BitVec 64)) Bool)

(declare-fun +!2711 (ListLongMap!11575 tuple2!12888) ListLongMap!11575)

(assert (=> b!922003 (contains!4819 (+!2711 lt!413886 lt!413889) k0!1099)))

(declare-fun lt!413885 () Unit!31034)

(declare-fun lt!413888 () V!31119)

(declare-fun addStillContains!408 (ListLongMap!11575 (_ BitVec 64) V!31119 (_ BitVec 64)) Unit!31034)

(assert (=> b!922003 (= lt!413885 (addStillContains!408 lt!413886 lt!413891 lt!413888 k0!1099))))

(declare-fun getCurrentListMap!2993 (array!55183 array!55181 (_ BitVec 32) (_ BitVec 32) V!31119 V!31119 (_ BitVec 32) Int) ListLongMap!11575)

(assert (=> b!922003 (= (getCurrentListMap!2993 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2711 (getCurrentListMap!2993 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413889))))

(assert (=> b!922003 (= lt!413889 (tuple2!12889 lt!413891 lt!413888))))

(declare-fun get!13942 (ValueCell!9326 V!31119) V!31119)

(declare-fun dynLambda!1467 (Int (_ BitVec 64)) V!31119)

(assert (=> b!922003 (= lt!413888 (get!13942 (select (arr!26536 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1467 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413884 () Unit!31034)

(declare-fun lemmaListMapRecursiveValidKeyArray!75 (array!55183 array!55181 (_ BitVec 32) (_ BitVec 32) V!31119 V!31119 (_ BitVec 32) Int) Unit!31034)

(assert (=> b!922003 (= lt!413884 (lemmaListMapRecursiveValidKeyArray!75 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922004 () Bool)

(assert (=> b!922004 (= e!517331 e!517325)))

(declare-fun res!621808 () Bool)

(assert (=> b!922004 (=> (not res!621808) (not e!517325))))

(assert (=> b!922004 (= res!621808 (contains!4819 lt!413886 k0!1099))))

(assert (=> b!922004 (= lt!413886 (getCurrentListMap!2993 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922005 () Bool)

(assert (=> b!922005 (= e!517325 e!517332)))

(declare-fun res!621812 () Bool)

(assert (=> b!922005 (=> (not res!621812) (not e!517332))))

(assert (=> b!922005 (= res!621812 (validKeyInArray!0 lt!413891))))

(assert (=> b!922005 (= lt!413891 (select (arr!26537 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31179 () Bool)

(assert (=> mapIsEmpty!31179 mapRes!31179))

(declare-fun b!922006 () Bool)

(assert (=> b!922006 (= e!517326 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!31179 () Bool)

(declare-fun tp!59762 () Bool)

(assert (=> mapNonEmpty!31179 (= mapRes!31179 (and tp!59762 e!517329))))

(declare-fun mapValue!31179 () ValueCell!9326)

(declare-fun mapKey!31179 () (_ BitVec 32))

(declare-fun mapRest!31179 () (Array (_ BitVec 32) ValueCell!9326))

(assert (=> mapNonEmpty!31179 (= (arr!26536 _values!1231) (store mapRest!31179 mapKey!31179 mapValue!31179))))

(declare-fun b!922007 () Bool)

(assert (=> b!922007 (= e!517330 tp_is_empty!19615)))

(declare-fun b!922008 () Bool)

(declare-fun res!621809 () Bool)

(assert (=> b!922008 (=> (not res!621809) (not e!517325))))

(declare-fun v!791 () V!31119)

(declare-fun apply!619 (ListLongMap!11575 (_ BitVec 64)) V!31119)

(assert (=> b!922008 (= res!621809 (= (apply!619 lt!413886 k0!1099) v!791))))

(declare-fun b!922009 () Bool)

(declare-fun res!621810 () Bool)

(assert (=> b!922009 (=> (not res!621810) (not e!517331))))

(assert (=> b!922009 (= res!621810 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26998 _keys!1487))))))

(declare-fun b!922010 () Bool)

(declare-fun res!621804 () Bool)

(assert (=> b!922010 (=> (not res!621804) (not e!517331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55183 (_ BitVec 32)) Bool)

(assert (=> b!922010 (= res!621804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922011 () Bool)

(declare-fun res!621806 () Bool)

(assert (=> b!922011 (=> (not res!621806) (not e!517331))))

(assert (=> b!922011 (= res!621806 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18668))))

(assert (= (and start!78876 res!621805) b!922001))

(assert (= (and b!922001 res!621807) b!922010))

(assert (= (and b!922010 res!621804) b!922011))

(assert (= (and b!922011 res!621806) b!922009))

(assert (= (and b!922009 res!621810) b!922004))

(assert (= (and b!922004 res!621808) b!922008))

(assert (= (and b!922008 res!621809) b!922002))

(assert (= (and b!922002 res!621811) b!922000))

(assert (= (and b!922000 res!621803) b!922005))

(assert (= (and b!922005 res!621812) b!922003))

(assert (= (and b!922003 c!96097) b!921997))

(assert (= (and b!922003 (not c!96097)) b!922006))

(assert (= (and b!921999 condMapEmpty!31179) mapIsEmpty!31179))

(assert (= (and b!921999 (not condMapEmpty!31179)) mapNonEmpty!31179))

(get-info :version)

(assert (= (and mapNonEmpty!31179 ((_ is ValueCellFull!9326) mapValue!31179)) b!921998))

(assert (= (and b!921999 ((_ is ValueCellFull!9326) mapDefault!31179)) b!922007))

(assert (= start!78876 b!921999))

(declare-fun b_lambda!13591 () Bool)

(assert (=> (not b_lambda!13591) (not b!922003)))

(declare-fun t!26498 () Bool)

(declare-fun tb!5679 () Bool)

(assert (=> (and start!78876 (= defaultEntry!1235 defaultEntry!1235) t!26498) tb!5679))

(declare-fun result!11189 () Bool)

(assert (=> tb!5679 (= result!11189 tp_is_empty!19615)))

(assert (=> b!922003 t!26498))

(declare-fun b_and!27927 () Bool)

(assert (= b_and!27925 (and (=> t!26498 result!11189) b_and!27927)))

(declare-fun m!855517 () Bool)

(assert (=> b!922004 m!855517))

(declare-fun m!855519 () Bool)

(assert (=> b!922004 m!855519))

(declare-fun m!855521 () Bool)

(assert (=> b!922000 m!855521))

(declare-fun m!855523 () Bool)

(assert (=> b!922011 m!855523))

(declare-fun m!855525 () Bool)

(assert (=> b!922003 m!855525))

(declare-fun m!855527 () Bool)

(assert (=> b!922003 m!855527))

(declare-fun m!855529 () Bool)

(assert (=> b!922003 m!855529))

(declare-fun m!855531 () Bool)

(assert (=> b!922003 m!855531))

(declare-fun m!855533 () Bool)

(assert (=> b!922003 m!855533))

(declare-fun m!855535 () Bool)

(assert (=> b!922003 m!855535))

(declare-fun m!855537 () Bool)

(assert (=> b!922003 m!855537))

(declare-fun m!855539 () Bool)

(assert (=> b!922003 m!855539))

(assert (=> b!922003 m!855527))

(assert (=> b!922003 m!855533))

(declare-fun m!855541 () Bool)

(assert (=> b!922003 m!855541))

(declare-fun m!855543 () Bool)

(assert (=> b!922003 m!855543))

(declare-fun m!855545 () Bool)

(assert (=> b!922003 m!855545))

(declare-fun m!855547 () Bool)

(assert (=> b!922003 m!855547))

(assert (=> b!922003 m!855535))

(declare-fun m!855549 () Bool)

(assert (=> b!922003 m!855549))

(assert (=> b!922003 m!855529))

(declare-fun m!855551 () Bool)

(assert (=> b!922003 m!855551))

(declare-fun m!855553 () Bool)

(assert (=> mapNonEmpty!31179 m!855553))

(declare-fun m!855555 () Bool)

(assert (=> b!922005 m!855555))

(declare-fun m!855557 () Bool)

(assert (=> b!922005 m!855557))

(declare-fun m!855559 () Bool)

(assert (=> b!922010 m!855559))

(declare-fun m!855561 () Bool)

(assert (=> b!922008 m!855561))

(declare-fun m!855563 () Bool)

(assert (=> start!78876 m!855563))

(declare-fun m!855565 () Bool)

(assert (=> start!78876 m!855565))

(declare-fun m!855567 () Bool)

(assert (=> start!78876 m!855567))

(declare-fun m!855569 () Bool)

(assert (=> b!921997 m!855569))

(check-sat (not b_lambda!13591) tp_is_empty!19615 (not b!922004) (not b!921997) (not mapNonEmpty!31179) (not b!922010) b_and!27927 (not b!922005) (not b!922011) (not b!922000) (not b_next!17107) (not b!922008) (not b!922003) (not start!78876))
(check-sat b_and!27927 (not b_next!17107))
