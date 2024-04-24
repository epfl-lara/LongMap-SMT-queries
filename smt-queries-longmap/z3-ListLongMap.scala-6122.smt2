; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79008 () Bool)

(assert start!79008)

(declare-fun b_free!17053 () Bool)

(declare-fun b_next!17053 () Bool)

(assert (=> start!79008 (= b_free!17053 (not b_next!17053))))

(declare-fun tp!59600 () Bool)

(declare-fun b_and!27853 () Bool)

(assert (=> start!79008 (= tp!59600 b_and!27853)))

(declare-fun b!921715 () Bool)

(declare-fun e!517358 () Bool)

(declare-fun tp_is_empty!19561 () Bool)

(assert (=> b!921715 (= e!517358 tp_is_empty!19561)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!517356 () Bool)

(declare-fun b!921716 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55147 0))(
  ( (array!55148 (arr!26514 (Array (_ BitVec 32) (_ BitVec 64))) (size!26974 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55147)

(declare-fun arrayContainsKey!0 (array!55147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921716 (= e!517356 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921717 () Bool)

(declare-fun e!517360 () Bool)

(declare-fun e!517357 () Bool)

(assert (=> b!921717 (= e!517360 (not e!517357))))

(declare-fun res!621296 () Bool)

(assert (=> b!921717 (=> res!621296 e!517357)))

(assert (=> b!921717 (= res!621296 (or (bvsge (size!26974 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26974 _keys!1487))))))

(assert (=> b!921717 e!517356))

(declare-fun c!96363 () Bool)

(assert (=> b!921717 (= c!96363 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!31047 0))(
  ( (V!31048 (val!9831 Int)) )
))
(declare-datatypes ((ValueCell!9299 0))(
  ( (ValueCellFull!9299 (v!12346 V!31047)) (EmptyCell!9299) )
))
(declare-datatypes ((array!55149 0))(
  ( (array!55150 (arr!26515 (Array (_ BitVec 32) ValueCell!9299)) (size!26975 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55149)

(declare-datatypes ((Unit!31074 0))(
  ( (Unit!31075) )
))
(declare-fun lt!413753 () Unit!31074)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31047)

(declare-fun minValue!1173 () V!31047)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!172 (array!55147 array!55149 (_ BitVec 32) (_ BitVec 32) V!31047 V!31047 (_ BitVec 64) (_ BitVec 32) Int) Unit!31074)

(assert (=> b!921717 (= lt!413753 (lemmaListMapContainsThenArrayContainsFrom!172 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!18582 0))(
  ( (Nil!18579) (Cons!18578 (h!19730 (_ BitVec 64)) (t!26357 List!18582)) )
))
(declare-fun arrayNoDuplicates!0 (array!55147 (_ BitVec 32) List!18582) Bool)

(assert (=> b!921717 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18579)))

(declare-fun lt!413757 () Unit!31074)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55147 (_ BitVec 32) (_ BitVec 32)) Unit!31074)

(assert (=> b!921717 (= lt!413757 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12768 0))(
  ( (tuple2!12769 (_1!6395 (_ BitVec 64)) (_2!6395 V!31047)) )
))
(declare-datatypes ((List!18583 0))(
  ( (Nil!18580) (Cons!18579 (h!19731 tuple2!12768) (t!26358 List!18583)) )
))
(declare-datatypes ((ListLongMap!11467 0))(
  ( (ListLongMap!11468 (toList!5749 List!18583)) )
))
(declare-fun lt!413758 () ListLongMap!11467)

(declare-fun lt!413759 () tuple2!12768)

(declare-fun contains!4810 (ListLongMap!11467 (_ BitVec 64)) Bool)

(declare-fun +!2681 (ListLongMap!11467 tuple2!12768) ListLongMap!11467)

(assert (=> b!921717 (contains!4810 (+!2681 lt!413758 lt!413759) k0!1099)))

(declare-fun lt!413756 () Unit!31074)

(declare-fun lt!413751 () (_ BitVec 64))

(declare-fun lt!413752 () V!31047)

(declare-fun addStillContains!390 (ListLongMap!11467 (_ BitVec 64) V!31047 (_ BitVec 64)) Unit!31074)

(assert (=> b!921717 (= lt!413756 (addStillContains!390 lt!413758 lt!413751 lt!413752 k0!1099))))

(declare-fun getCurrentListMap!3002 (array!55147 array!55149 (_ BitVec 32) (_ BitVec 32) V!31047 V!31047 (_ BitVec 32) Int) ListLongMap!11467)

(assert (=> b!921717 (= (getCurrentListMap!3002 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2681 (getCurrentListMap!3002 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413759))))

(assert (=> b!921717 (= lt!413759 (tuple2!12769 lt!413751 lt!413752))))

(declare-fun get!13934 (ValueCell!9299 V!31047) V!31047)

(declare-fun dynLambda!1478 (Int (_ BitVec 64)) V!31047)

(assert (=> b!921717 (= lt!413752 (get!13934 (select (arr!26515 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1478 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413755 () Unit!31074)

(declare-fun lemmaListMapRecursiveValidKeyArray!61 (array!55147 array!55149 (_ BitVec 32) (_ BitVec 32) V!31047 V!31047 (_ BitVec 32) Int) Unit!31074)

(assert (=> b!921717 (= lt!413755 (lemmaListMapRecursiveValidKeyArray!61 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921718 () Bool)

(declare-fun res!621291 () Bool)

(declare-fun e!517362 () Bool)

(assert (=> b!921718 (=> (not res!621291) (not e!517362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921718 (= res!621291 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31098 () Bool)

(declare-fun mapRes!31098 () Bool)

(declare-fun tp!59601 () Bool)

(declare-fun e!517359 () Bool)

(assert (=> mapNonEmpty!31098 (= mapRes!31098 (and tp!59601 e!517359))))

(declare-fun mapKey!31098 () (_ BitVec 32))

(declare-fun mapValue!31098 () ValueCell!9299)

(declare-fun mapRest!31098 () (Array (_ BitVec 32) ValueCell!9299))

(assert (=> mapNonEmpty!31098 (= (arr!26515 _values!1231) (store mapRest!31098 mapKey!31098 mapValue!31098))))

(declare-fun b!921719 () Bool)

(declare-fun res!621299 () Bool)

(assert (=> b!921719 (=> res!621299 e!517357)))

(declare-fun noDuplicate!1345 (List!18582) Bool)

(assert (=> b!921719 (= res!621299 (not (noDuplicate!1345 Nil!18579)))))

(declare-fun b!921720 () Bool)

(declare-fun res!621294 () Bool)

(declare-fun e!517363 () Bool)

(assert (=> b!921720 (=> (not res!621294) (not e!517363))))

(assert (=> b!921720 (= res!621294 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26974 _keys!1487))))))

(declare-fun b!921721 () Bool)

(assert (=> b!921721 (= e!517363 e!517362)))

(declare-fun res!621303 () Bool)

(assert (=> b!921721 (=> (not res!621303) (not e!517362))))

(assert (=> b!921721 (= res!621303 (contains!4810 lt!413758 k0!1099))))

(assert (=> b!921721 (= lt!413758 (getCurrentListMap!3002 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921722 () Bool)

(declare-fun e!517361 () Bool)

(assert (=> b!921722 (= e!517361 (and e!517358 mapRes!31098))))

(declare-fun condMapEmpty!31098 () Bool)

(declare-fun mapDefault!31098 () ValueCell!9299)

(assert (=> b!921722 (= condMapEmpty!31098 (= (arr!26515 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9299)) mapDefault!31098)))))

(declare-fun b!921723 () Bool)

(assert (=> b!921723 (= e!517356 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921724 () Bool)

(assert (=> b!921724 (= e!517357 true)))

(declare-fun lt!413754 () Bool)

(declare-fun contains!4811 (List!18582 (_ BitVec 64)) Bool)

(assert (=> b!921724 (= lt!413754 (contains!4811 Nil!18579 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!621301 () Bool)

(assert (=> start!79008 (=> (not res!621301) (not e!517363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79008 (= res!621301 (validMask!0 mask!1881))))

(assert (=> start!79008 e!517363))

(assert (=> start!79008 true))

(assert (=> start!79008 tp_is_empty!19561))

(declare-fun array_inv!20758 (array!55149) Bool)

(assert (=> start!79008 (and (array_inv!20758 _values!1231) e!517361)))

(assert (=> start!79008 tp!59600))

(declare-fun array_inv!20759 (array!55147) Bool)

(assert (=> start!79008 (array_inv!20759 _keys!1487)))

(declare-fun b!921714 () Bool)

(declare-fun res!621297 () Bool)

(assert (=> b!921714 (=> (not res!621297) (not e!517363))))

(assert (=> b!921714 (= res!621297 (and (= (size!26975 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26974 _keys!1487) (size!26975 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921725 () Bool)

(declare-fun res!621300 () Bool)

(assert (=> b!921725 (=> (not res!621300) (not e!517362))))

(declare-fun v!791 () V!31047)

(declare-fun apply!613 (ListLongMap!11467 (_ BitVec 64)) V!31047)

(assert (=> b!921725 (= res!621300 (= (apply!613 lt!413758 k0!1099) v!791))))

(declare-fun mapIsEmpty!31098 () Bool)

(assert (=> mapIsEmpty!31098 mapRes!31098))

(declare-fun b!921726 () Bool)

(assert (=> b!921726 (= e!517362 e!517360)))

(declare-fun res!621302 () Bool)

(assert (=> b!921726 (=> (not res!621302) (not e!517360))))

(assert (=> b!921726 (= res!621302 (validKeyInArray!0 lt!413751))))

(assert (=> b!921726 (= lt!413751 (select (arr!26514 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921727 () Bool)

(declare-fun res!621295 () Bool)

(assert (=> b!921727 (=> (not res!621295) (not e!517363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55147 (_ BitVec 32)) Bool)

(assert (=> b!921727 (= res!621295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921728 () Bool)

(assert (=> b!921728 (= e!517359 tp_is_empty!19561)))

(declare-fun b!921729 () Bool)

(declare-fun res!621298 () Bool)

(assert (=> b!921729 (=> (not res!621298) (not e!517363))))

(assert (=> b!921729 (= res!621298 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18579))))

(declare-fun b!921730 () Bool)

(declare-fun res!621293 () Bool)

(assert (=> b!921730 (=> (not res!621293) (not e!517362))))

(assert (=> b!921730 (= res!621293 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921731 () Bool)

(declare-fun res!621292 () Bool)

(assert (=> b!921731 (=> res!621292 e!517357)))

(assert (=> b!921731 (= res!621292 (contains!4811 Nil!18579 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!79008 res!621301) b!921714))

(assert (= (and b!921714 res!621297) b!921727))

(assert (= (and b!921727 res!621295) b!921729))

(assert (= (and b!921729 res!621298) b!921720))

(assert (= (and b!921720 res!621294) b!921721))

(assert (= (and b!921721 res!621303) b!921725))

(assert (= (and b!921725 res!621300) b!921730))

(assert (= (and b!921730 res!621293) b!921718))

(assert (= (and b!921718 res!621291) b!921726))

(assert (= (and b!921726 res!621302) b!921717))

(assert (= (and b!921717 c!96363) b!921716))

(assert (= (and b!921717 (not c!96363)) b!921723))

(assert (= (and b!921717 (not res!621296)) b!921719))

(assert (= (and b!921719 (not res!621299)) b!921731))

(assert (= (and b!921731 (not res!621292)) b!921724))

(assert (= (and b!921722 condMapEmpty!31098) mapIsEmpty!31098))

(assert (= (and b!921722 (not condMapEmpty!31098)) mapNonEmpty!31098))

(get-info :version)

(assert (= (and mapNonEmpty!31098 ((_ is ValueCellFull!9299) mapValue!31098)) b!921728))

(assert (= (and b!921722 ((_ is ValueCellFull!9299) mapDefault!31098)) b!921715))

(assert (= start!79008 b!921722))

(declare-fun b_lambda!13569 () Bool)

(assert (=> (not b_lambda!13569) (not b!921717)))

(declare-fun t!26356 () Bool)

(declare-fun tb!5625 () Bool)

(assert (=> (and start!79008 (= defaultEntry!1235 defaultEntry!1235) t!26356) tb!5625))

(declare-fun result!11081 () Bool)

(assert (=> tb!5625 (= result!11081 tp_is_empty!19561)))

(assert (=> b!921717 t!26356))

(declare-fun b_and!27855 () Bool)

(assert (= b_and!27853 (and (=> t!26356 result!11081) b_and!27855)))

(declare-fun m!856039 () Bool)

(assert (=> b!921724 m!856039))

(declare-fun m!856041 () Bool)

(assert (=> b!921716 m!856041))

(declare-fun m!856043 () Bool)

(assert (=> b!921731 m!856043))

(declare-fun m!856045 () Bool)

(assert (=> b!921719 m!856045))

(declare-fun m!856047 () Bool)

(assert (=> b!921727 m!856047))

(declare-fun m!856049 () Bool)

(assert (=> b!921725 m!856049))

(declare-fun m!856051 () Bool)

(assert (=> b!921726 m!856051))

(declare-fun m!856053 () Bool)

(assert (=> b!921726 m!856053))

(declare-fun m!856055 () Bool)

(assert (=> b!921729 m!856055))

(declare-fun m!856057 () Bool)

(assert (=> start!79008 m!856057))

(declare-fun m!856059 () Bool)

(assert (=> start!79008 m!856059))

(declare-fun m!856061 () Bool)

(assert (=> start!79008 m!856061))

(declare-fun m!856063 () Bool)

(assert (=> mapNonEmpty!31098 m!856063))

(declare-fun m!856065 () Bool)

(assert (=> b!921718 m!856065))

(declare-fun m!856067 () Bool)

(assert (=> b!921721 m!856067))

(declare-fun m!856069 () Bool)

(assert (=> b!921721 m!856069))

(declare-fun m!856071 () Bool)

(assert (=> b!921717 m!856071))

(declare-fun m!856073 () Bool)

(assert (=> b!921717 m!856073))

(declare-fun m!856075 () Bool)

(assert (=> b!921717 m!856075))

(declare-fun m!856077 () Bool)

(assert (=> b!921717 m!856077))

(declare-fun m!856079 () Bool)

(assert (=> b!921717 m!856079))

(declare-fun m!856081 () Bool)

(assert (=> b!921717 m!856081))

(assert (=> b!921717 m!856075))

(assert (=> b!921717 m!856081))

(declare-fun m!856083 () Bool)

(assert (=> b!921717 m!856083))

(declare-fun m!856085 () Bool)

(assert (=> b!921717 m!856085))

(declare-fun m!856087 () Bool)

(assert (=> b!921717 m!856087))

(declare-fun m!856089 () Bool)

(assert (=> b!921717 m!856089))

(declare-fun m!856091 () Bool)

(assert (=> b!921717 m!856091))

(declare-fun m!856093 () Bool)

(assert (=> b!921717 m!856093))

(assert (=> b!921717 m!856089))

(declare-fun m!856095 () Bool)

(assert (=> b!921717 m!856095))

(assert (=> b!921717 m!856077))

(check-sat b_and!27855 (not b!921716) (not b!921729) (not b!921721) (not b!921725) (not b_next!17053) (not b_lambda!13569) (not b!921726) (not b!921717) (not b!921718) (not b!921724) (not mapNonEmpty!31098) (not b!921719) tp_is_empty!19561 (not start!79008) (not b!921731) (not b!921727))
(check-sat b_and!27855 (not b_next!17053))
