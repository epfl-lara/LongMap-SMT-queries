; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79080 () Bool)

(assert start!79080)

(declare-fun b_free!17311 () Bool)

(declare-fun b_next!17311 () Bool)

(assert (=> start!79080 (= b_free!17311 (not b_next!17311))))

(declare-fun tp!60374 () Bool)

(declare-fun b_and!28333 () Bool)

(assert (=> start!79080 (= tp!60374 b_and!28333)))

(declare-fun b!927818 () Bool)

(declare-fun e!520901 () Bool)

(declare-fun e!520911 () Bool)

(assert (=> b!927818 (= e!520901 e!520911)))

(declare-fun res!624916 () Bool)

(assert (=> b!927818 (=> (not res!624916) (not e!520911))))

(declare-datatypes ((V!31391 0))(
  ( (V!31392 (val!9960 Int)) )
))
(declare-datatypes ((tuple2!13064 0))(
  ( (tuple2!13065 (_1!6543 (_ BitVec 64)) (_2!6543 V!31391)) )
))
(declare-datatypes ((List!18833 0))(
  ( (Nil!18830) (Cons!18829 (h!19975 tuple2!13064) (t!26865 List!18833)) )
))
(declare-datatypes ((ListLongMap!11751 0))(
  ( (ListLongMap!11752 (toList!5891 List!18833)) )
))
(declare-fun lt!418259 () ListLongMap!11751)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4902 (ListLongMap!11751 (_ BitVec 64)) Bool)

(assert (=> b!927818 (= res!624916 (contains!4902 lt!418259 k0!1099))))

(declare-datatypes ((array!55571 0))(
  ( (array!55572 (arr!26731 (Array (_ BitVec 32) (_ BitVec 64))) (size!27192 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55571)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9428 0))(
  ( (ValueCellFull!9428 (v!12477 V!31391)) (EmptyCell!9428) )
))
(declare-datatypes ((array!55573 0))(
  ( (array!55574 (arr!26732 (Array (_ BitVec 32) ValueCell!9428)) (size!27193 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55573)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31391)

(declare-fun minValue!1173 () V!31391)

(declare-fun getCurrentListMap!3076 (array!55571 array!55573 (_ BitVec 32) (_ BitVec 32) V!31391 V!31391 (_ BitVec 32) Int) ListLongMap!11751)

(assert (=> b!927818 (= lt!418259 (getCurrentListMap!3076 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927820 () Bool)

(declare-fun e!520903 () Bool)

(declare-fun e!520899 () Bool)

(assert (=> b!927820 (= e!520903 e!520899)))

(declare-fun res!624919 () Bool)

(assert (=> b!927820 (=> (not res!624919) (not e!520899))))

(assert (=> b!927820 (= res!624919 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27192 _keys!1487)))))

(declare-datatypes ((Unit!31308 0))(
  ( (Unit!31309) )
))
(declare-fun lt!418263 () Unit!31308)

(declare-fun e!520907 () Unit!31308)

(assert (=> b!927820 (= lt!418263 e!520907)))

(declare-fun c!96895 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927820 (= c!96895 (validKeyInArray!0 k0!1099))))

(declare-fun b!927821 () Bool)

(declare-fun res!624914 () Bool)

(assert (=> b!927821 (=> (not res!624914) (not e!520901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55571 (_ BitVec 32)) Bool)

(assert (=> b!927821 (= res!624914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927822 () Bool)

(declare-fun Unit!31310 () Unit!31308)

(assert (=> b!927822 (= e!520907 Unit!31310)))

(declare-fun b!927823 () Bool)

(assert (=> b!927823 (= e!520911 e!520903)))

(declare-fun res!624918 () Bool)

(assert (=> b!927823 (=> (not res!624918) (not e!520903))))

(declare-fun v!791 () V!31391)

(declare-fun lt!418255 () V!31391)

(assert (=> b!927823 (= res!624918 (and (= lt!418255 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!701 (ListLongMap!11751 (_ BitVec 64)) V!31391)

(assert (=> b!927823 (= lt!418255 (apply!701 lt!418259 k0!1099))))

(declare-fun b!927824 () Bool)

(declare-fun res!624910 () Bool)

(declare-fun e!520904 () Bool)

(assert (=> b!927824 (=> (not res!624910) (not e!520904))))

(declare-fun lt!418265 () ListLongMap!11751)

(assert (=> b!927824 (= res!624910 (= (apply!701 lt!418265 k0!1099) v!791))))

(declare-fun b!927825 () Bool)

(declare-fun e!520902 () Unit!31308)

(assert (=> b!927825 (= e!520907 e!520902)))

(declare-fun lt!418258 () (_ BitVec 64))

(assert (=> b!927825 (= lt!418258 (select (arr!26731 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96893 () Bool)

(assert (=> b!927825 (= c!96893 (validKeyInArray!0 lt!418258))))

(declare-fun b!927826 () Bool)

(declare-fun res!624920 () Bool)

(assert (=> b!927826 (=> (not res!624920) (not e!520901))))

(assert (=> b!927826 (= res!624920 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27192 _keys!1487))))))

(declare-fun b!927827 () Bool)

(declare-fun e!520900 () Bool)

(declare-fun tp_is_empty!19819 () Bool)

(assert (=> b!927827 (= e!520900 tp_is_empty!19819)))

(declare-fun b!927828 () Bool)

(declare-fun res!624917 () Bool)

(assert (=> b!927828 (=> (not res!624917) (not e!520901))))

(assert (=> b!927828 (= res!624917 (and (= (size!27193 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27192 _keys!1487) (size!27193 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31485 () Bool)

(declare-fun mapRes!31485 () Bool)

(assert (=> mapIsEmpty!31485 mapRes!31485))

(declare-fun b!927829 () Bool)

(assert (=> b!927829 (= e!520904 (not true))))

(declare-fun e!520909 () Bool)

(assert (=> b!927829 e!520909))

(declare-fun res!624913 () Bool)

(assert (=> b!927829 (=> (not res!624913) (not e!520909))))

(declare-fun lt!418266 () ListLongMap!11751)

(assert (=> b!927829 (= res!624913 (contains!4902 lt!418266 k0!1099))))

(assert (=> b!927829 (= lt!418266 (getCurrentListMap!3076 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418254 () Unit!31308)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!103 (array!55571 array!55573 (_ BitVec 32) (_ BitVec 32) V!31391 V!31391 (_ BitVec 64) V!31391 (_ BitVec 32) Int) Unit!31308)

(assert (=> b!927829 (= lt!418254 (lemmaListMapApplyFromThenApplyFromZero!103 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927830 () Bool)

(assert (=> b!927830 (= e!520909 (= (apply!701 lt!418266 k0!1099) v!791))))

(declare-fun mapNonEmpty!31485 () Bool)

(declare-fun tp!60375 () Bool)

(declare-fun e!520906 () Bool)

(assert (=> mapNonEmpty!31485 (= mapRes!31485 (and tp!60375 e!520906))))

(declare-fun mapValue!31485 () ValueCell!9428)

(declare-fun mapKey!31485 () (_ BitVec 32))

(declare-fun mapRest!31485 () (Array (_ BitVec 32) ValueCell!9428))

(assert (=> mapNonEmpty!31485 (= (arr!26732 _values!1231) (store mapRest!31485 mapKey!31485 mapValue!31485))))

(declare-fun b!927831 () Bool)

(declare-fun e!520910 () Bool)

(assert (=> b!927831 (= e!520910 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!624912 () Bool)

(assert (=> start!79080 (=> (not res!624912) (not e!520901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79080 (= res!624912 (validMask!0 mask!1881))))

(assert (=> start!79080 e!520901))

(assert (=> start!79080 true))

(assert (=> start!79080 tp_is_empty!19819))

(declare-fun e!520905 () Bool)

(declare-fun array_inv!20902 (array!55573) Bool)

(assert (=> start!79080 (and (array_inv!20902 _values!1231) e!520905)))

(assert (=> start!79080 tp!60374))

(declare-fun array_inv!20903 (array!55571) Bool)

(assert (=> start!79080 (array_inv!20903 _keys!1487)))

(declare-fun b!927819 () Bool)

(assert (=> b!927819 (= e!520899 e!520904)))

(declare-fun res!624915 () Bool)

(assert (=> b!927819 (=> (not res!624915) (not e!520904))))

(assert (=> b!927819 (= res!624915 (contains!4902 lt!418265 k0!1099))))

(assert (=> b!927819 (= lt!418265 (getCurrentListMap!3076 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927832 () Bool)

(assert (=> b!927832 (= e!520906 tp_is_empty!19819)))

(declare-fun b!927833 () Bool)

(declare-fun lt!418261 () ListLongMap!11751)

(assert (=> b!927833 (= (apply!701 lt!418261 k0!1099) lt!418255)))

(declare-fun lt!418257 () Unit!31308)

(declare-fun lt!418256 () V!31391)

(declare-fun addApplyDifferent!406 (ListLongMap!11751 (_ BitVec 64) V!31391 (_ BitVec 64)) Unit!31308)

(assert (=> b!927833 (= lt!418257 (addApplyDifferent!406 lt!418259 lt!418258 lt!418256 k0!1099))))

(assert (=> b!927833 (not (= lt!418258 k0!1099))))

(declare-fun lt!418260 () Unit!31308)

(declare-datatypes ((List!18834 0))(
  ( (Nil!18831) (Cons!18830 (h!19976 (_ BitVec 64)) (t!26866 List!18834)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55571 (_ BitVec 64) (_ BitVec 32) List!18834) Unit!31308)

(assert (=> b!927833 (= lt!418260 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18831))))

(assert (=> b!927833 e!520910))

(declare-fun c!96894 () Bool)

(assert (=> b!927833 (= c!96894 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418253 () Unit!31308)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!266 (array!55571 array!55573 (_ BitVec 32) (_ BitVec 32) V!31391 V!31391 (_ BitVec 64) (_ BitVec 32) Int) Unit!31308)

(assert (=> b!927833 (= lt!418253 (lemmaListMapContainsThenArrayContainsFrom!266 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55571 (_ BitVec 32) List!18834) Bool)

(assert (=> b!927833 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18831)))

(declare-fun lt!418267 () Unit!31308)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55571 (_ BitVec 32) (_ BitVec 32)) Unit!31308)

(assert (=> b!927833 (= lt!418267 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927833 (contains!4902 lt!418261 k0!1099)))

(declare-fun lt!418262 () tuple2!13064)

(declare-fun +!2778 (ListLongMap!11751 tuple2!13064) ListLongMap!11751)

(assert (=> b!927833 (= lt!418261 (+!2778 lt!418259 lt!418262))))

(declare-fun lt!418268 () Unit!31308)

(declare-fun addStillContains!475 (ListLongMap!11751 (_ BitVec 64) V!31391 (_ BitVec 64)) Unit!31308)

(assert (=> b!927833 (= lt!418268 (addStillContains!475 lt!418259 lt!418258 lt!418256 k0!1099))))

(assert (=> b!927833 (= (getCurrentListMap!3076 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2778 (getCurrentListMap!3076 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418262))))

(assert (=> b!927833 (= lt!418262 (tuple2!13065 lt!418258 lt!418256))))

(declare-fun get!14077 (ValueCell!9428 V!31391) V!31391)

(declare-fun dynLambda!1534 (Int (_ BitVec 64)) V!31391)

(assert (=> b!927833 (= lt!418256 (get!14077 (select (arr!26732 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1534 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418264 () Unit!31308)

(declare-fun lemmaListMapRecursiveValidKeyArray!142 (array!55571 array!55573 (_ BitVec 32) (_ BitVec 32) V!31391 V!31391 (_ BitVec 32) Int) Unit!31308)

(assert (=> b!927833 (= lt!418264 (lemmaListMapRecursiveValidKeyArray!142 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927833 (= e!520902 lt!418257)))

(declare-fun b!927834 () Bool)

(assert (=> b!927834 (= e!520905 (and e!520900 mapRes!31485))))

(declare-fun condMapEmpty!31485 () Bool)

(declare-fun mapDefault!31485 () ValueCell!9428)

(assert (=> b!927834 (= condMapEmpty!31485 (= (arr!26732 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9428)) mapDefault!31485)))))

(declare-fun b!927835 () Bool)

(declare-fun Unit!31311 () Unit!31308)

(assert (=> b!927835 (= e!520902 Unit!31311)))

(declare-fun b!927836 () Bool)

(declare-fun arrayContainsKey!0 (array!55571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927836 (= e!520910 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927837 () Bool)

(declare-fun res!624911 () Bool)

(assert (=> b!927837 (=> (not res!624911) (not e!520901))))

(assert (=> b!927837 (= res!624911 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18831))))

(assert (= (and start!79080 res!624912) b!927828))

(assert (= (and b!927828 res!624917) b!927821))

(assert (= (and b!927821 res!624914) b!927837))

(assert (= (and b!927837 res!624911) b!927826))

(assert (= (and b!927826 res!624920) b!927818))

(assert (= (and b!927818 res!624916) b!927823))

(assert (= (and b!927823 res!624918) b!927820))

(assert (= (and b!927820 c!96895) b!927825))

(assert (= (and b!927820 (not c!96895)) b!927822))

(assert (= (and b!927825 c!96893) b!927833))

(assert (= (and b!927825 (not c!96893)) b!927835))

(assert (= (and b!927833 c!96894) b!927836))

(assert (= (and b!927833 (not c!96894)) b!927831))

(assert (= (and b!927820 res!624919) b!927819))

(assert (= (and b!927819 res!624915) b!927824))

(assert (= (and b!927824 res!624910) b!927829))

(assert (= (and b!927829 res!624913) b!927830))

(assert (= (and b!927834 condMapEmpty!31485) mapIsEmpty!31485))

(assert (= (and b!927834 (not condMapEmpty!31485)) mapNonEmpty!31485))

(get-info :version)

(assert (= (and mapNonEmpty!31485 ((_ is ValueCellFull!9428) mapValue!31485)) b!927832))

(assert (= (and b!927834 ((_ is ValueCellFull!9428) mapDefault!31485)) b!927827))

(assert (= start!79080 b!927834))

(declare-fun b_lambda!13795 () Bool)

(assert (=> (not b_lambda!13795) (not b!927833)))

(declare-fun t!26864 () Bool)

(declare-fun tb!5883 () Bool)

(assert (=> (and start!79080 (= defaultEntry!1235 defaultEntry!1235) t!26864) tb!5883))

(declare-fun result!11597 () Bool)

(assert (=> tb!5883 (= result!11597 tp_is_empty!19819)))

(assert (=> b!927833 t!26864))

(declare-fun b_and!28335 () Bool)

(assert (= b_and!28333 (and (=> t!26864 result!11597) b_and!28335)))

(declare-fun m!862057 () Bool)

(assert (=> b!927836 m!862057))

(declare-fun m!862059 () Bool)

(assert (=> b!927830 m!862059))

(declare-fun m!862061 () Bool)

(assert (=> b!927824 m!862061))

(declare-fun m!862063 () Bool)

(assert (=> mapNonEmpty!31485 m!862063))

(declare-fun m!862065 () Bool)

(assert (=> b!927829 m!862065))

(declare-fun m!862067 () Bool)

(assert (=> b!927829 m!862067))

(declare-fun m!862069 () Bool)

(assert (=> b!927829 m!862069))

(declare-fun m!862071 () Bool)

(assert (=> b!927837 m!862071))

(declare-fun m!862073 () Bool)

(assert (=> b!927823 m!862073))

(declare-fun m!862075 () Bool)

(assert (=> b!927818 m!862075))

(declare-fun m!862077 () Bool)

(assert (=> b!927818 m!862077))

(declare-fun m!862079 () Bool)

(assert (=> b!927825 m!862079))

(declare-fun m!862081 () Bool)

(assert (=> b!927825 m!862081))

(declare-fun m!862083 () Bool)

(assert (=> start!79080 m!862083))

(declare-fun m!862085 () Bool)

(assert (=> start!79080 m!862085))

(declare-fun m!862087 () Bool)

(assert (=> start!79080 m!862087))

(declare-fun m!862089 () Bool)

(assert (=> b!927820 m!862089))

(declare-fun m!862091 () Bool)

(assert (=> b!927821 m!862091))

(declare-fun m!862093 () Bool)

(assert (=> b!927833 m!862093))

(declare-fun m!862095 () Bool)

(assert (=> b!927833 m!862095))

(declare-fun m!862097 () Bool)

(assert (=> b!927833 m!862097))

(declare-fun m!862099 () Bool)

(assert (=> b!927833 m!862099))

(declare-fun m!862101 () Bool)

(assert (=> b!927833 m!862101))

(declare-fun m!862103 () Bool)

(assert (=> b!927833 m!862103))

(declare-fun m!862105 () Bool)

(assert (=> b!927833 m!862105))

(assert (=> b!927833 m!862099))

(assert (=> b!927833 m!862103))

(declare-fun m!862107 () Bool)

(assert (=> b!927833 m!862107))

(declare-fun m!862109 () Bool)

(assert (=> b!927833 m!862109))

(declare-fun m!862111 () Bool)

(assert (=> b!927833 m!862111))

(declare-fun m!862113 () Bool)

(assert (=> b!927833 m!862113))

(declare-fun m!862115 () Bool)

(assert (=> b!927833 m!862115))

(declare-fun m!862117 () Bool)

(assert (=> b!927833 m!862117))

(declare-fun m!862119 () Bool)

(assert (=> b!927833 m!862119))

(declare-fun m!862121 () Bool)

(assert (=> b!927833 m!862121))

(assert (=> b!927833 m!862109))

(declare-fun m!862123 () Bool)

(assert (=> b!927833 m!862123))

(declare-fun m!862125 () Bool)

(assert (=> b!927819 m!862125))

(assert (=> b!927819 m!862121))

(check-sat (not b!927818) (not b!927823) (not b!927824) (not b!927833) (not b!927836) (not mapNonEmpty!31485) (not b_next!17311) (not b!927821) b_and!28335 tp_is_empty!19819 (not b!927830) (not start!79080) (not b!927837) (not b!927819) (not b_lambda!13795) (not b!927825) (not b!927820) (not b!927829))
(check-sat b_and!28335 (not b_next!17311))
