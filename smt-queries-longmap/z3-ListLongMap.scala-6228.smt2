; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79642 () Bool)

(assert start!79642)

(declare-fun b_free!17691 () Bool)

(declare-fun b_next!17691 () Bool)

(assert (=> start!79642 (= b_free!17691 (not b_next!17691))))

(declare-fun tp!61528 () Bool)

(declare-fun b_and!28973 () Bool)

(assert (=> start!79642 (= tp!61528 b_and!28973)))

(declare-fun b!936242 () Bool)

(declare-fun res!630436 () Bool)

(declare-fun e!525695 () Bool)

(assert (=> b!936242 (=> (not res!630436) (not e!525695))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936242 (= res!630436 (validKeyInArray!0 k0!1099))))

(declare-fun b!936243 () Bool)

(declare-fun res!630444 () Bool)

(assert (=> b!936243 (=> (not res!630444) (not e!525695))))

(declare-datatypes ((V!31897 0))(
  ( (V!31898 (val!10150 Int)) )
))
(declare-fun v!791 () V!31897)

(declare-datatypes ((tuple2!13328 0))(
  ( (tuple2!13329 (_1!6675 (_ BitVec 64)) (_2!6675 V!31897)) )
))
(declare-datatypes ((List!19108 0))(
  ( (Nil!19105) (Cons!19104 (h!20250 tuple2!13328) (t!27343 List!19108)) )
))
(declare-datatypes ((ListLongMap!12025 0))(
  ( (ListLongMap!12026 (toList!6028 List!19108)) )
))
(declare-fun lt!422088 () ListLongMap!12025)

(declare-fun apply!830 (ListLongMap!12025 (_ BitVec 64)) V!31897)

(assert (=> b!936243 (= res!630444 (= (apply!830 lt!422088 k0!1099) v!791))))

(declare-fun b!936244 () Bool)

(declare-fun e!525697 () Bool)

(declare-fun lt!422084 () (_ BitVec 64))

(assert (=> b!936244 (= e!525697 (not (not (= k0!1099 lt!422084))))))

(assert (=> b!936244 (not (= lt!422084 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((Unit!31577 0))(
  ( (Unit!31578) )
))
(declare-fun lt!422085 () Unit!31577)

(declare-datatypes ((array!56340 0))(
  ( (array!56341 (arr!27110 (Array (_ BitVec 32) (_ BitVec 64))) (size!27569 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56340)

(declare-datatypes ((List!19109 0))(
  ( (Nil!19106) (Cons!19105 (h!20251 (_ BitVec 64)) (t!27344 List!19109)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56340 (_ BitVec 64) (_ BitVec 32) List!19109) Unit!31577)

(assert (=> b!936244 (= lt!422085 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19106))))

(declare-fun e!525702 () Bool)

(assert (=> b!936244 e!525702))

(declare-fun c!97368 () Bool)

(assert (=> b!936244 (= c!97368 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!422086 () Unit!31577)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9618 0))(
  ( (ValueCellFull!9618 (v!12675 V!31897)) (EmptyCell!9618) )
))
(declare-datatypes ((array!56342 0))(
  ( (array!56343 (arr!27111 (Array (_ BitVec 32) ValueCell!9618)) (size!27570 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56342)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31897)

(declare-fun minValue!1173 () V!31897)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!293 (array!56340 array!56342 (_ BitVec 32) (_ BitVec 32) V!31897 V!31897 (_ BitVec 64) (_ BitVec 32) Int) Unit!31577)

(assert (=> b!936244 (= lt!422086 (lemmaListMapContainsThenArrayContainsFrom!293 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56340 (_ BitVec 32) List!19109) Bool)

(assert (=> b!936244 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19106)))

(declare-fun lt!422083 () Unit!31577)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56340 (_ BitVec 32) (_ BitVec 32)) Unit!31577)

(assert (=> b!936244 (= lt!422083 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!422090 () tuple2!13328)

(declare-fun contains!5088 (ListLongMap!12025 (_ BitVec 64)) Bool)

(declare-fun +!2821 (ListLongMap!12025 tuple2!13328) ListLongMap!12025)

(assert (=> b!936244 (contains!5088 (+!2821 lt!422088 lt!422090) k0!1099)))

(declare-fun lt!422087 () V!31897)

(declare-fun lt!422089 () Unit!31577)

(declare-fun addStillContains!540 (ListLongMap!12025 (_ BitVec 64) V!31897 (_ BitVec 64)) Unit!31577)

(assert (=> b!936244 (= lt!422089 (addStillContains!540 lt!422088 lt!422084 lt!422087 k0!1099))))

(declare-fun getCurrentListMap!3264 (array!56340 array!56342 (_ BitVec 32) (_ BitVec 32) V!31897 V!31897 (_ BitVec 32) Int) ListLongMap!12025)

(assert (=> b!936244 (= (getCurrentListMap!3264 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2821 (getCurrentListMap!3264 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422090))))

(assert (=> b!936244 (= lt!422090 (tuple2!13329 lt!422084 lt!422087))))

(declare-fun get!14289 (ValueCell!9618 V!31897) V!31897)

(declare-fun dynLambda!1610 (Int (_ BitVec 64)) V!31897)

(assert (=> b!936244 (= lt!422087 (get!14289 (select (arr!27111 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1610 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422082 () Unit!31577)

(declare-fun lemmaListMapRecursiveValidKeyArray!211 (array!56340 array!56342 (_ BitVec 32) (_ BitVec 32) V!31897 V!31897 (_ BitVec 32) Int) Unit!31577)

(assert (=> b!936244 (= lt!422082 (lemmaListMapRecursiveValidKeyArray!211 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!32070 () Bool)

(declare-fun mapRes!32070 () Bool)

(declare-fun tp!61529 () Bool)

(declare-fun e!525699 () Bool)

(assert (=> mapNonEmpty!32070 (= mapRes!32070 (and tp!61529 e!525699))))

(declare-fun mapValue!32070 () ValueCell!9618)

(declare-fun mapRest!32070 () (Array (_ BitVec 32) ValueCell!9618))

(declare-fun mapKey!32070 () (_ BitVec 32))

(assert (=> mapNonEmpty!32070 (= (arr!27111 _values!1231) (store mapRest!32070 mapKey!32070 mapValue!32070))))

(declare-fun b!936245 () Bool)

(declare-fun res!630437 () Bool)

(declare-fun e!525700 () Bool)

(assert (=> b!936245 (=> (not res!630437) (not e!525700))))

(assert (=> b!936245 (= res!630437 (and (= (size!27570 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27569 _keys!1487) (size!27570 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936246 () Bool)

(declare-fun res!630442 () Bool)

(assert (=> b!936246 (=> (not res!630442) (not e!525700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56340 (_ BitVec 32)) Bool)

(assert (=> b!936246 (= res!630442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!630441 () Bool)

(assert (=> start!79642 (=> (not res!630441) (not e!525700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79642 (= res!630441 (validMask!0 mask!1881))))

(assert (=> start!79642 e!525700))

(assert (=> start!79642 true))

(declare-fun tp_is_empty!20199 () Bool)

(assert (=> start!79642 tp_is_empty!20199))

(declare-fun e!525698 () Bool)

(declare-fun array_inv!21094 (array!56342) Bool)

(assert (=> start!79642 (and (array_inv!21094 _values!1231) e!525698)))

(assert (=> start!79642 tp!61528))

(declare-fun array_inv!21095 (array!56340) Bool)

(assert (=> start!79642 (array_inv!21095 _keys!1487)))

(declare-fun b!936247 () Bool)

(declare-fun e!525696 () Bool)

(assert (=> b!936247 (= e!525696 tp_is_empty!20199)))

(declare-fun mapIsEmpty!32070 () Bool)

(assert (=> mapIsEmpty!32070 mapRes!32070))

(declare-fun b!936248 () Bool)

(assert (=> b!936248 (= e!525695 e!525697)))

(declare-fun res!630439 () Bool)

(assert (=> b!936248 (=> (not res!630439) (not e!525697))))

(assert (=> b!936248 (= res!630439 (validKeyInArray!0 lt!422084))))

(assert (=> b!936248 (= lt!422084 (select (arr!27110 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!936249 () Bool)

(declare-fun arrayContainsKey!0 (array!56340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936249 (= e!525702 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936250 () Bool)

(assert (=> b!936250 (= e!525700 e!525695)))

(declare-fun res!630443 () Bool)

(assert (=> b!936250 (=> (not res!630443) (not e!525695))))

(assert (=> b!936250 (= res!630443 (contains!5088 lt!422088 k0!1099))))

(assert (=> b!936250 (= lt!422088 (getCurrentListMap!3264 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936251 () Bool)

(declare-fun res!630445 () Bool)

(assert (=> b!936251 (=> (not res!630445) (not e!525700))))

(assert (=> b!936251 (= res!630445 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27569 _keys!1487))))))

(declare-fun b!936252 () Bool)

(assert (=> b!936252 (= e!525698 (and e!525696 mapRes!32070))))

(declare-fun condMapEmpty!32070 () Bool)

(declare-fun mapDefault!32070 () ValueCell!9618)

(assert (=> b!936252 (= condMapEmpty!32070 (= (arr!27111 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9618)) mapDefault!32070)))))

(declare-fun b!936253 () Bool)

(assert (=> b!936253 (= e!525702 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936254 () Bool)

(assert (=> b!936254 (= e!525699 tp_is_empty!20199)))

(declare-fun b!936255 () Bool)

(declare-fun res!630440 () Bool)

(assert (=> b!936255 (=> (not res!630440) (not e!525695))))

(assert (=> b!936255 (= res!630440 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!936256 () Bool)

(declare-fun res!630438 () Bool)

(assert (=> b!936256 (=> (not res!630438) (not e!525700))))

(assert (=> b!936256 (= res!630438 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19106))))

(assert (= (and start!79642 res!630441) b!936245))

(assert (= (and b!936245 res!630437) b!936246))

(assert (= (and b!936246 res!630442) b!936256))

(assert (= (and b!936256 res!630438) b!936251))

(assert (= (and b!936251 res!630445) b!936250))

(assert (= (and b!936250 res!630443) b!936243))

(assert (= (and b!936243 res!630444) b!936255))

(assert (= (and b!936255 res!630440) b!936242))

(assert (= (and b!936242 res!630436) b!936248))

(assert (= (and b!936248 res!630439) b!936244))

(assert (= (and b!936244 c!97368) b!936249))

(assert (= (and b!936244 (not c!97368)) b!936253))

(assert (= (and b!936252 condMapEmpty!32070) mapIsEmpty!32070))

(assert (= (and b!936252 (not condMapEmpty!32070)) mapNonEmpty!32070))

(get-info :version)

(assert (= (and mapNonEmpty!32070 ((_ is ValueCellFull!9618) mapValue!32070)) b!936254))

(assert (= (and b!936252 ((_ is ValueCellFull!9618) mapDefault!32070)) b!936247))

(assert (= start!79642 b!936252))

(declare-fun b_lambda!14097 () Bool)

(assert (=> (not b_lambda!14097) (not b!936244)))

(declare-fun t!27342 () Bool)

(declare-fun tb!6085 () Bool)

(assert (=> (and start!79642 (= defaultEntry!1235 defaultEntry!1235) t!27342) tb!6085))

(declare-fun result!12003 () Bool)

(assert (=> tb!6085 (= result!12003 tp_is_empty!20199)))

(assert (=> b!936244 t!27342))

(declare-fun b_and!28975 () Bool)

(assert (= b_and!28973 (and (=> t!27342 result!12003) b_and!28975)))

(declare-fun m!870817 () Bool)

(assert (=> b!936246 m!870817))

(declare-fun m!870819 () Bool)

(assert (=> b!936248 m!870819))

(declare-fun m!870821 () Bool)

(assert (=> b!936248 m!870821))

(declare-fun m!870823 () Bool)

(assert (=> start!79642 m!870823))

(declare-fun m!870825 () Bool)

(assert (=> start!79642 m!870825))

(declare-fun m!870827 () Bool)

(assert (=> start!79642 m!870827))

(declare-fun m!870829 () Bool)

(assert (=> mapNonEmpty!32070 m!870829))

(declare-fun m!870831 () Bool)

(assert (=> b!936256 m!870831))

(declare-fun m!870833 () Bool)

(assert (=> b!936243 m!870833))

(declare-fun m!870835 () Bool)

(assert (=> b!936244 m!870835))

(declare-fun m!870837 () Bool)

(assert (=> b!936244 m!870837))

(declare-fun m!870839 () Bool)

(assert (=> b!936244 m!870839))

(declare-fun m!870841 () Bool)

(assert (=> b!936244 m!870841))

(declare-fun m!870843 () Bool)

(assert (=> b!936244 m!870843))

(declare-fun m!870845 () Bool)

(assert (=> b!936244 m!870845))

(assert (=> b!936244 m!870835))

(assert (=> b!936244 m!870843))

(assert (=> b!936244 m!870845))

(declare-fun m!870847 () Bool)

(assert (=> b!936244 m!870847))

(declare-fun m!870849 () Bool)

(assert (=> b!936244 m!870849))

(declare-fun m!870851 () Bool)

(assert (=> b!936244 m!870851))

(declare-fun m!870853 () Bool)

(assert (=> b!936244 m!870853))

(declare-fun m!870855 () Bool)

(assert (=> b!936244 m!870855))

(declare-fun m!870857 () Bool)

(assert (=> b!936244 m!870857))

(declare-fun m!870859 () Bool)

(assert (=> b!936244 m!870859))

(assert (=> b!936244 m!870851))

(declare-fun m!870861 () Bool)

(assert (=> b!936244 m!870861))

(declare-fun m!870863 () Bool)

(assert (=> b!936250 m!870863))

(declare-fun m!870865 () Bool)

(assert (=> b!936250 m!870865))

(declare-fun m!870867 () Bool)

(assert (=> b!936249 m!870867))

(declare-fun m!870869 () Bool)

(assert (=> b!936242 m!870869))

(check-sat b_and!28975 (not start!79642) (not b!936248) (not b!936242) (not b!936256) (not b_next!17691) (not b!936249) (not b_lambda!14097) tp_is_empty!20199 (not b!936244) (not b!936246) (not mapNonEmpty!32070) (not b!936250) (not b!936243))
(check-sat b_and!28975 (not b_next!17691))
