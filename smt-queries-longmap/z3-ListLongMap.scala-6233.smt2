; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79838 () Bool)

(assert start!79838)

(declare-fun b_free!17719 () Bool)

(declare-fun b_next!17719 () Bool)

(assert (=> start!79838 (= b_free!17719 (not b_next!17719))))

(declare-fun tp!61614 () Bool)

(declare-fun b_and!29039 () Bool)

(assert (=> start!79838 (= tp!61614 b_and!29039)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!56447 0))(
  ( (array!56448 (arr!27159 (Array (_ BitVec 32) (_ BitVec 64))) (size!27619 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56447)

(declare-fun e!526689 () Bool)

(declare-fun b!937841 () Bool)

(declare-fun arrayContainsKey!0 (array!56447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937841 (= e!526689 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937842 () Bool)

(declare-fun e!526693 () Bool)

(assert (=> b!937842 (= e!526693 false)))

(declare-datatypes ((Unit!31602 0))(
  ( (Unit!31603) )
))
(declare-fun lt!422980 () Unit!31602)

(declare-fun e!526697 () Unit!31602)

(assert (=> b!937842 (= lt!422980 e!526697)))

(declare-fun c!97768 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937842 (= c!97768 (validKeyInArray!0 k0!1099))))

(declare-fun b!937843 () Bool)

(declare-fun res!631088 () Bool)

(declare-fun e!526696 () Bool)

(assert (=> b!937843 (=> (not res!631088) (not e!526696))))

(declare-datatypes ((List!19117 0))(
  ( (Nil!19114) (Cons!19113 (h!20265 (_ BitVec 64)) (t!27372 List!19117)) )
))
(declare-fun arrayNoDuplicates!0 (array!56447 (_ BitVec 32) List!19117) Bool)

(assert (=> b!937843 (= res!631088 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19114))))

(declare-fun b!937844 () Bool)

(declare-fun e!526690 () Bool)

(assert (=> b!937844 (= e!526696 e!526690)))

(declare-fun res!631089 () Bool)

(assert (=> b!937844 (=> (not res!631089) (not e!526690))))

(declare-datatypes ((V!31935 0))(
  ( (V!31936 (val!10164 Int)) )
))
(declare-datatypes ((tuple2!13336 0))(
  ( (tuple2!13337 (_1!6679 (_ BitVec 64)) (_2!6679 V!31935)) )
))
(declare-datatypes ((List!19118 0))(
  ( (Nil!19115) (Cons!19114 (h!20266 tuple2!13336) (t!27373 List!19118)) )
))
(declare-datatypes ((ListLongMap!12035 0))(
  ( (ListLongMap!12036 (toList!6033 List!19118)) )
))
(declare-fun lt!422977 () ListLongMap!12035)

(declare-fun contains!5104 (ListLongMap!12035 (_ BitVec 64)) Bool)

(assert (=> b!937844 (= res!631089 (contains!5104 lt!422977 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9632 0))(
  ( (ValueCellFull!9632 (v!12686 V!31935)) (EmptyCell!9632) )
))
(declare-datatypes ((array!56449 0))(
  ( (array!56450 (arr!27160 (Array (_ BitVec 32) ValueCell!9632)) (size!27620 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56449)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31935)

(declare-fun minValue!1173 () V!31935)

(declare-fun getCurrentListMap!3269 (array!56447 array!56449 (_ BitVec 32) (_ BitVec 32) V!31935 V!31935 (_ BitVec 32) Int) ListLongMap!12035)

(assert (=> b!937844 (= lt!422977 (getCurrentListMap!3269 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937845 () Bool)

(declare-fun Unit!31604 () Unit!31602)

(assert (=> b!937845 (= e!526697 Unit!31604)))

(declare-fun b!937846 () Bool)

(declare-fun res!631092 () Bool)

(assert (=> b!937846 (=> (not res!631092) (not e!526696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56447 (_ BitVec 32)) Bool)

(assert (=> b!937846 (= res!631092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937847 () Bool)

(declare-fun lt!422974 () ListLongMap!12035)

(declare-fun lt!422984 () V!31935)

(declare-fun apply!851 (ListLongMap!12035 (_ BitVec 64)) V!31935)

(assert (=> b!937847 (= (apply!851 lt!422974 k0!1099) lt!422984)))

(declare-fun lt!422979 () (_ BitVec 64))

(declare-fun lt!422976 () Unit!31602)

(declare-fun lt!422982 () V!31935)

(declare-fun addApplyDifferent!428 (ListLongMap!12035 (_ BitVec 64) V!31935 (_ BitVec 64)) Unit!31602)

(assert (=> b!937847 (= lt!422976 (addApplyDifferent!428 lt!422977 lt!422979 lt!422982 k0!1099))))

(assert (=> b!937847 (not (= lt!422979 k0!1099))))

(declare-fun lt!422981 () Unit!31602)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56447 (_ BitVec 64) (_ BitVec 32) List!19117) Unit!31602)

(assert (=> b!937847 (= lt!422981 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19114))))

(assert (=> b!937847 e!526689))

(declare-fun c!97769 () Bool)

(assert (=> b!937847 (= c!97769 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422975 () Unit!31602)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!298 (array!56447 array!56449 (_ BitVec 32) (_ BitVec 32) V!31935 V!31935 (_ BitVec 64) (_ BitVec 32) Int) Unit!31602)

(assert (=> b!937847 (= lt!422975 (lemmaListMapContainsThenArrayContainsFrom!298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!937847 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19114)))

(declare-fun lt!422973 () Unit!31602)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56447 (_ BitVec 32) (_ BitVec 32)) Unit!31602)

(assert (=> b!937847 (= lt!422973 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937847 (contains!5104 lt!422974 k0!1099)))

(declare-fun lt!422985 () tuple2!13336)

(declare-fun +!2844 (ListLongMap!12035 tuple2!13336) ListLongMap!12035)

(assert (=> b!937847 (= lt!422974 (+!2844 lt!422977 lt!422985))))

(declare-fun lt!422978 () Unit!31602)

(declare-fun addStillContains!547 (ListLongMap!12035 (_ BitVec 64) V!31935 (_ BitVec 64)) Unit!31602)

(assert (=> b!937847 (= lt!422978 (addStillContains!547 lt!422977 lt!422979 lt!422982 k0!1099))))

(assert (=> b!937847 (= (getCurrentListMap!3269 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2844 (getCurrentListMap!3269 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422985))))

(assert (=> b!937847 (= lt!422985 (tuple2!13337 lt!422979 lt!422982))))

(declare-fun get!14334 (ValueCell!9632 V!31935) V!31935)

(declare-fun dynLambda!1641 (Int (_ BitVec 64)) V!31935)

(assert (=> b!937847 (= lt!422982 (get!14334 (select (arr!27160 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1641 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422983 () Unit!31602)

(declare-fun lemmaListMapRecursiveValidKeyArray!224 (array!56447 array!56449 (_ BitVec 32) (_ BitVec 32) V!31935 V!31935 (_ BitVec 32) Int) Unit!31602)

(assert (=> b!937847 (= lt!422983 (lemmaListMapRecursiveValidKeyArray!224 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526694 () Unit!31602)

(assert (=> b!937847 (= e!526694 lt!422976)))

(declare-fun b!937848 () Bool)

(assert (=> b!937848 (= e!526690 e!526693)))

(declare-fun res!631090 () Bool)

(assert (=> b!937848 (=> (not res!631090) (not e!526693))))

(declare-fun v!791 () V!31935)

(assert (=> b!937848 (= res!631090 (and (= lt!422984 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937848 (= lt!422984 (apply!851 lt!422977 k0!1099))))

(declare-fun b!937849 () Bool)

(declare-fun res!631091 () Bool)

(assert (=> b!937849 (=> (not res!631091) (not e!526696))))

(assert (=> b!937849 (= res!631091 (and (= (size!27620 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27619 _keys!1487) (size!27620 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!631086 () Bool)

(assert (=> start!79838 (=> (not res!631086) (not e!526696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79838 (= res!631086 (validMask!0 mask!1881))))

(assert (=> start!79838 e!526696))

(assert (=> start!79838 true))

(declare-fun tp_is_empty!20227 () Bool)

(assert (=> start!79838 tp_is_empty!20227))

(declare-fun e!526698 () Bool)

(declare-fun array_inv!21210 (array!56449) Bool)

(assert (=> start!79838 (and (array_inv!21210 _values!1231) e!526698)))

(assert (=> start!79838 tp!61614))

(declare-fun array_inv!21211 (array!56447) Bool)

(assert (=> start!79838 (array_inv!21211 _keys!1487)))

(declare-fun b!937850 () Bool)

(declare-fun res!631087 () Bool)

(assert (=> b!937850 (=> (not res!631087) (not e!526696))))

(assert (=> b!937850 (= res!631087 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27619 _keys!1487))))))

(declare-fun b!937851 () Bool)

(assert (=> b!937851 (= e!526697 e!526694)))

(assert (=> b!937851 (= lt!422979 (select (arr!27159 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97770 () Bool)

(assert (=> b!937851 (= c!97770 (validKeyInArray!0 lt!422979))))

(declare-fun b!937852 () Bool)

(declare-fun e!526695 () Bool)

(assert (=> b!937852 (= e!526695 tp_is_empty!20227)))

(declare-fun b!937853 () Bool)

(declare-fun Unit!31605 () Unit!31602)

(assert (=> b!937853 (= e!526694 Unit!31605)))

(declare-fun b!937854 () Bool)

(assert (=> b!937854 (= e!526689 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32112 () Bool)

(declare-fun mapRes!32112 () Bool)

(assert (=> mapIsEmpty!32112 mapRes!32112))

(declare-fun mapNonEmpty!32112 () Bool)

(declare-fun tp!61613 () Bool)

(declare-fun e!526691 () Bool)

(assert (=> mapNonEmpty!32112 (= mapRes!32112 (and tp!61613 e!526691))))

(declare-fun mapValue!32112 () ValueCell!9632)

(declare-fun mapRest!32112 () (Array (_ BitVec 32) ValueCell!9632))

(declare-fun mapKey!32112 () (_ BitVec 32))

(assert (=> mapNonEmpty!32112 (= (arr!27160 _values!1231) (store mapRest!32112 mapKey!32112 mapValue!32112))))

(declare-fun b!937855 () Bool)

(assert (=> b!937855 (= e!526698 (and e!526695 mapRes!32112))))

(declare-fun condMapEmpty!32112 () Bool)

(declare-fun mapDefault!32112 () ValueCell!9632)

(assert (=> b!937855 (= condMapEmpty!32112 (= (arr!27160 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9632)) mapDefault!32112)))))

(declare-fun b!937856 () Bool)

(assert (=> b!937856 (= e!526691 tp_is_empty!20227)))

(assert (= (and start!79838 res!631086) b!937849))

(assert (= (and b!937849 res!631091) b!937846))

(assert (= (and b!937846 res!631092) b!937843))

(assert (= (and b!937843 res!631088) b!937850))

(assert (= (and b!937850 res!631087) b!937844))

(assert (= (and b!937844 res!631089) b!937848))

(assert (= (and b!937848 res!631090) b!937842))

(assert (= (and b!937842 c!97768) b!937851))

(assert (= (and b!937842 (not c!97768)) b!937845))

(assert (= (and b!937851 c!97770) b!937847))

(assert (= (and b!937851 (not c!97770)) b!937853))

(assert (= (and b!937847 c!97769) b!937841))

(assert (= (and b!937847 (not c!97769)) b!937854))

(assert (= (and b!937855 condMapEmpty!32112) mapIsEmpty!32112))

(assert (= (and b!937855 (not condMapEmpty!32112)) mapNonEmpty!32112))

(get-info :version)

(assert (= (and mapNonEmpty!32112 ((_ is ValueCellFull!9632) mapValue!32112)) b!937856))

(assert (= (and b!937855 ((_ is ValueCellFull!9632) mapDefault!32112)) b!937852))

(assert (= start!79838 b!937855))

(declare-fun b_lambda!14139 () Bool)

(assert (=> (not b_lambda!14139) (not b!937847)))

(declare-fun t!27371 () Bool)

(declare-fun tb!6105 () Bool)

(assert (=> (and start!79838 (= defaultEntry!1235 defaultEntry!1235) t!27371) tb!6105))

(declare-fun result!12051 () Bool)

(assert (=> tb!6105 (= result!12051 tp_is_empty!20227)))

(assert (=> b!937847 t!27371))

(declare-fun b_and!29041 () Bool)

(assert (= b_and!29039 (and (=> t!27371 result!12051) b_and!29041)))

(declare-fun m!872915 () Bool)

(assert (=> b!937848 m!872915))

(declare-fun m!872917 () Bool)

(assert (=> mapNonEmpty!32112 m!872917))

(declare-fun m!872919 () Bool)

(assert (=> b!937841 m!872919))

(declare-fun m!872921 () Bool)

(assert (=> b!937842 m!872921))

(declare-fun m!872923 () Bool)

(assert (=> b!937851 m!872923))

(declare-fun m!872925 () Bool)

(assert (=> b!937851 m!872925))

(declare-fun m!872927 () Bool)

(assert (=> b!937847 m!872927))

(declare-fun m!872929 () Bool)

(assert (=> b!937847 m!872929))

(declare-fun m!872931 () Bool)

(assert (=> b!937847 m!872931))

(declare-fun m!872933 () Bool)

(assert (=> b!937847 m!872933))

(declare-fun m!872935 () Bool)

(assert (=> b!937847 m!872935))

(declare-fun m!872937 () Bool)

(assert (=> b!937847 m!872937))

(declare-fun m!872939 () Bool)

(assert (=> b!937847 m!872939))

(assert (=> b!937847 m!872935))

(assert (=> b!937847 m!872937))

(declare-fun m!872941 () Bool)

(assert (=> b!937847 m!872941))

(declare-fun m!872943 () Bool)

(assert (=> b!937847 m!872943))

(declare-fun m!872945 () Bool)

(assert (=> b!937847 m!872945))

(assert (=> b!937847 m!872927))

(declare-fun m!872947 () Bool)

(assert (=> b!937847 m!872947))

(declare-fun m!872949 () Bool)

(assert (=> b!937847 m!872949))

(declare-fun m!872951 () Bool)

(assert (=> b!937847 m!872951))

(declare-fun m!872953 () Bool)

(assert (=> b!937847 m!872953))

(declare-fun m!872955 () Bool)

(assert (=> b!937847 m!872955))

(declare-fun m!872957 () Bool)

(assert (=> b!937847 m!872957))

(declare-fun m!872959 () Bool)

(assert (=> b!937843 m!872959))

(declare-fun m!872961 () Bool)

(assert (=> start!79838 m!872961))

(declare-fun m!872963 () Bool)

(assert (=> start!79838 m!872963))

(declare-fun m!872965 () Bool)

(assert (=> start!79838 m!872965))

(declare-fun m!872967 () Bool)

(assert (=> b!937844 m!872967))

(declare-fun m!872969 () Bool)

(assert (=> b!937844 m!872969))

(declare-fun m!872971 () Bool)

(assert (=> b!937846 m!872971))

(check-sat (not b!937841) (not b!937846) (not b!937848) (not b_next!17719) (not b!937851) (not b!937843) b_and!29041 (not b!937844) (not b!937847) (not mapNonEmpty!32112) (not b_lambda!14139) (not b!937842) (not start!79838) tp_is_empty!20227)
(check-sat b_and!29041 (not b_next!17719))
