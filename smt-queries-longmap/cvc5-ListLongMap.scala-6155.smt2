; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79038 () Bool)

(assert start!79038)

(declare-fun b_free!17251 () Bool)

(declare-fun b_next!17251 () Bool)

(assert (=> start!79038 (= b_free!17251 (not b_next!17251))))

(declare-fun tp!60193 () Bool)

(declare-fun b_and!28239 () Bool)

(assert (=> start!79038 (= tp!60193 b_and!28239)))

(declare-fun b!926197 () Bool)

(declare-fun e!519882 () Bool)

(declare-fun e!519878 () Bool)

(assert (=> b!926197 (= e!519882 e!519878)))

(declare-fun res!624040 () Bool)

(assert (=> b!926197 (=> (not res!624040) (not e!519878))))

(declare-datatypes ((V!31311 0))(
  ( (V!31312 (val!9930 Int)) )
))
(declare-datatypes ((tuple2!12954 0))(
  ( (tuple2!12955 (_1!6488 (_ BitVec 64)) (_2!6488 V!31311)) )
))
(declare-datatypes ((List!18756 0))(
  ( (Nil!18753) (Cons!18752 (h!19898 tuple2!12954) (t!26737 List!18756)) )
))
(declare-datatypes ((ListLongMap!11651 0))(
  ( (ListLongMap!11652 (toList!5841 List!18756)) )
))
(declare-fun lt!417062 () ListLongMap!11651)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4900 (ListLongMap!11651 (_ BitVec 64)) Bool)

(assert (=> b!926197 (= res!624040 (contains!4900 lt!417062 k!1099))))

(declare-datatypes ((array!55484 0))(
  ( (array!55485 (arr!26687 (Array (_ BitVec 32) (_ BitVec 64))) (size!27146 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55484)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9398 0))(
  ( (ValueCellFull!9398 (v!12448 V!31311)) (EmptyCell!9398) )
))
(declare-datatypes ((array!55486 0))(
  ( (array!55487 (arr!26688 (Array (_ BitVec 32) ValueCell!9398)) (size!27147 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55486)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31311)

(declare-fun minValue!1173 () V!31311)

(declare-fun getCurrentListMap!3091 (array!55484 array!55486 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 32) Int) ListLongMap!11651)

(assert (=> b!926197 (= lt!417062 (getCurrentListMap!3091 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926198 () Bool)

(declare-datatypes ((Unit!31309 0))(
  ( (Unit!31310) )
))
(declare-fun e!519880 () Unit!31309)

(declare-fun e!519886 () Unit!31309)

(assert (=> b!926198 (= e!519880 e!519886)))

(declare-fun lt!417052 () (_ BitVec 64))

(assert (=> b!926198 (= lt!417052 (select (arr!26687 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96688 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926198 (= c!96688 (validKeyInArray!0 lt!417052))))

(declare-fun b!926199 () Bool)

(declare-fun res!624035 () Bool)

(declare-fun e!519889 () Bool)

(assert (=> b!926199 (=> (not res!624035) (not e!519889))))

(assert (=> b!926199 (= res!624035 (and (= (size!27147 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27146 _keys!1487) (size!27147 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926200 () Bool)

(declare-fun e!519884 () Bool)

(assert (=> b!926200 (= e!519884 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!624039 () Bool)

(assert (=> start!79038 (=> (not res!624039) (not e!519889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79038 (= res!624039 (validMask!0 mask!1881))))

(assert (=> start!79038 e!519889))

(assert (=> start!79038 true))

(declare-fun tp_is_empty!19759 () Bool)

(assert (=> start!79038 tp_is_empty!19759))

(declare-fun e!519877 () Bool)

(declare-fun array_inv!20786 (array!55486) Bool)

(assert (=> start!79038 (and (array_inv!20786 _values!1231) e!519877)))

(assert (=> start!79038 tp!60193))

(declare-fun array_inv!20787 (array!55484) Bool)

(assert (=> start!79038 (array_inv!20787 _keys!1487)))

(declare-fun b!926201 () Bool)

(declare-fun e!519885 () Bool)

(assert (=> b!926201 (= e!519885 tp_is_empty!19759)))

(declare-fun b!926202 () Bool)

(declare-fun e!519887 () Bool)

(assert (=> b!926202 (= e!519887 e!519882)))

(declare-fun res!624034 () Bool)

(assert (=> b!926202 (=> (not res!624034) (not e!519882))))

(assert (=> b!926202 (= res!624034 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27146 _keys!1487)))))

(declare-fun lt!417051 () Unit!31309)

(assert (=> b!926202 (= lt!417051 e!519880)))

(declare-fun c!96690 () Bool)

(assert (=> b!926202 (= c!96690 (validKeyInArray!0 k!1099))))

(declare-fun b!926203 () Bool)

(declare-fun res!624036 () Bool)

(assert (=> b!926203 (=> (not res!624036) (not e!519889))))

(assert (=> b!926203 (= res!624036 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27146 _keys!1487))))))

(declare-fun b!926204 () Bool)

(assert (=> b!926204 (= e!519878 (not true))))

(declare-fun e!519881 () Bool)

(assert (=> b!926204 e!519881))

(declare-fun res!624038 () Bool)

(assert (=> b!926204 (=> (not res!624038) (not e!519881))))

(declare-fun lt!417064 () ListLongMap!11651)

(assert (=> b!926204 (= res!624038 (contains!4900 lt!417064 k!1099))))

(assert (=> b!926204 (= lt!417064 (getCurrentListMap!3091 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31311)

(declare-fun lt!417053 () Unit!31309)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!78 (array!55484 array!55486 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 64) V!31311 (_ BitVec 32) Int) Unit!31309)

(assert (=> b!926204 (= lt!417053 (lemmaListMapApplyFromThenApplyFromZero!78 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926205 () Bool)

(declare-fun Unit!31311 () Unit!31309)

(assert (=> b!926205 (= e!519886 Unit!31311)))

(declare-fun b!926206 () Bool)

(declare-fun lt!417061 () ListLongMap!11651)

(declare-fun lt!417063 () V!31311)

(declare-fun apply!671 (ListLongMap!11651 (_ BitVec 64)) V!31311)

(assert (=> b!926206 (= (apply!671 lt!417061 k!1099) lt!417063)))

(declare-fun lt!417057 () V!31311)

(declare-fun lt!417058 () Unit!31309)

(declare-fun lt!417049 () ListLongMap!11651)

(declare-fun addApplyDifferent!391 (ListLongMap!11651 (_ BitVec 64) V!31311 (_ BitVec 64)) Unit!31309)

(assert (=> b!926206 (= lt!417058 (addApplyDifferent!391 lt!417049 lt!417052 lt!417057 k!1099))))

(assert (=> b!926206 (not (= lt!417052 k!1099))))

(declare-fun lt!417059 () Unit!31309)

(declare-datatypes ((List!18757 0))(
  ( (Nil!18754) (Cons!18753 (h!19899 (_ BitVec 64)) (t!26738 List!18757)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55484 (_ BitVec 64) (_ BitVec 32) List!18757) Unit!31309)

(assert (=> b!926206 (= lt!417059 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18754))))

(assert (=> b!926206 e!519884))

(declare-fun c!96689 () Bool)

(assert (=> b!926206 (= c!96689 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417060 () Unit!31309)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!242 (array!55484 array!55486 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 64) (_ BitVec 32) Int) Unit!31309)

(assert (=> b!926206 (= lt!417060 (lemmaListMapContainsThenArrayContainsFrom!242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55484 (_ BitVec 32) List!18757) Bool)

(assert (=> b!926206 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18754)))

(declare-fun lt!417055 () Unit!31309)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55484 (_ BitVec 32) (_ BitVec 32)) Unit!31309)

(assert (=> b!926206 (= lt!417055 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926206 (contains!4900 lt!417061 k!1099)))

(declare-fun lt!417050 () tuple2!12954)

(declare-fun +!2735 (ListLongMap!11651 tuple2!12954) ListLongMap!11651)

(assert (=> b!926206 (= lt!417061 (+!2735 lt!417049 lt!417050))))

(declare-fun lt!417056 () Unit!31309)

(declare-fun addStillContains!459 (ListLongMap!11651 (_ BitVec 64) V!31311 (_ BitVec 64)) Unit!31309)

(assert (=> b!926206 (= lt!417056 (addStillContains!459 lt!417049 lt!417052 lt!417057 k!1099))))

(assert (=> b!926206 (= (getCurrentListMap!3091 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2735 (getCurrentListMap!3091 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417050))))

(assert (=> b!926206 (= lt!417050 (tuple2!12955 lt!417052 lt!417057))))

(declare-fun get!14042 (ValueCell!9398 V!31311) V!31311)

(declare-fun dynLambda!1524 (Int (_ BitVec 64)) V!31311)

(assert (=> b!926206 (= lt!417057 (get!14042 (select (arr!26688 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1524 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417054 () Unit!31309)

(declare-fun lemmaListMapRecursiveValidKeyArray!125 (array!55484 array!55486 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 32) Int) Unit!31309)

(assert (=> b!926206 (= lt!417054 (lemmaListMapRecursiveValidKeyArray!125 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926206 (= e!519886 lt!417058)))

(declare-fun mapIsEmpty!31395 () Bool)

(declare-fun mapRes!31395 () Bool)

(assert (=> mapIsEmpty!31395 mapRes!31395))

(declare-fun b!926207 () Bool)

(declare-fun e!519888 () Bool)

(assert (=> b!926207 (= e!519888 tp_is_empty!19759)))

(declare-fun b!926208 () Bool)

(declare-fun res!624030 () Bool)

(assert (=> b!926208 (=> (not res!624030) (not e!519889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55484 (_ BitVec 32)) Bool)

(assert (=> b!926208 (= res!624030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926209 () Bool)

(declare-fun res!624037 () Bool)

(assert (=> b!926209 (=> (not res!624037) (not e!519889))))

(assert (=> b!926209 (= res!624037 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18754))))

(declare-fun b!926210 () Bool)

(declare-fun e!519879 () Bool)

(assert (=> b!926210 (= e!519879 e!519887)))

(declare-fun res!624032 () Bool)

(assert (=> b!926210 (=> (not res!624032) (not e!519887))))

(assert (=> b!926210 (= res!624032 (and (= lt!417063 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926210 (= lt!417063 (apply!671 lt!417049 k!1099))))

(declare-fun b!926211 () Bool)

(declare-fun arrayContainsKey!0 (array!55484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926211 (= e!519884 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!926212 () Bool)

(declare-fun res!624033 () Bool)

(assert (=> b!926212 (=> (not res!624033) (not e!519878))))

(assert (=> b!926212 (= res!624033 (= (apply!671 lt!417062 k!1099) v!791))))

(declare-fun b!926213 () Bool)

(assert (=> b!926213 (= e!519889 e!519879)))

(declare-fun res!624031 () Bool)

(assert (=> b!926213 (=> (not res!624031) (not e!519879))))

(assert (=> b!926213 (= res!624031 (contains!4900 lt!417049 k!1099))))

(assert (=> b!926213 (= lt!417049 (getCurrentListMap!3091 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926214 () Bool)

(assert (=> b!926214 (= e!519877 (and e!519885 mapRes!31395))))

(declare-fun condMapEmpty!31395 () Bool)

(declare-fun mapDefault!31395 () ValueCell!9398)

