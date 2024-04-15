; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79020 () Bool)

(assert start!79020)

(declare-fun b_free!17251 () Bool)

(declare-fun b_next!17251 () Bool)

(assert (=> start!79020 (= b_free!17251 (not b_next!17251))))

(declare-fun tp!60194 () Bool)

(declare-fun b_and!28213 () Bool)

(assert (=> start!79020 (= tp!60194 b_and!28213)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!519741 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55459 0))(
  ( (array!55460 (arr!26675 (Array (_ BitVec 32) (_ BitVec 64))) (size!27136 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55459)

(declare-fun b!925958 () Bool)

(declare-fun arrayContainsKey!0 (array!55459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925958 (= e!519741 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925959 () Bool)

(declare-datatypes ((Unit!31215 0))(
  ( (Unit!31216) )
))
(declare-fun e!519729 () Unit!31215)

(declare-fun e!519730 () Unit!31215)

(assert (=> b!925959 (= e!519729 e!519730)))

(declare-fun lt!416816 () (_ BitVec 64))

(assert (=> b!925959 (= lt!416816 (select (arr!26675 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96624 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925959 (= c!96624 (validKeyInArray!0 lt!416816))))

(declare-fun b!925960 () Bool)

(declare-fun res!623923 () Bool)

(declare-fun e!519739 () Bool)

(assert (=> b!925960 (=> (not res!623923) (not e!519739))))

(declare-datatypes ((V!31311 0))(
  ( (V!31312 (val!9930 Int)) )
))
(declare-fun v!791 () V!31311)

(declare-datatypes ((tuple2!13014 0))(
  ( (tuple2!13015 (_1!6518 (_ BitVec 64)) (_2!6518 V!31311)) )
))
(declare-datatypes ((List!18786 0))(
  ( (Nil!18783) (Cons!18782 (h!19928 tuple2!13014) (t!26758 List!18786)) )
))
(declare-datatypes ((ListLongMap!11701 0))(
  ( (ListLongMap!11702 (toList!5866 List!18786)) )
))
(declare-fun lt!416814 () ListLongMap!11701)

(declare-fun apply!677 (ListLongMap!11701 (_ BitVec 64)) V!31311)

(assert (=> b!925960 (= res!623923 (= (apply!677 lt!416814 k0!1099) v!791))))

(declare-fun res!623927 () Bool)

(declare-fun e!519735 () Bool)

(assert (=> start!79020 (=> (not res!623927) (not e!519735))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79020 (= res!623927 (validMask!0 mask!1881))))

(assert (=> start!79020 e!519735))

(assert (=> start!79020 true))

(declare-fun tp_is_empty!19759 () Bool)

(assert (=> start!79020 tp_is_empty!19759))

(declare-datatypes ((ValueCell!9398 0))(
  ( (ValueCellFull!9398 (v!12447 V!31311)) (EmptyCell!9398) )
))
(declare-datatypes ((array!55461 0))(
  ( (array!55462 (arr!26676 (Array (_ BitVec 32) ValueCell!9398)) (size!27137 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55461)

(declare-fun e!519732 () Bool)

(declare-fun array_inv!20858 (array!55461) Bool)

(assert (=> start!79020 (and (array_inv!20858 _values!1231) e!519732)))

(assert (=> start!79020 tp!60194))

(declare-fun array_inv!20859 (array!55459) Bool)

(assert (=> start!79020 (array_inv!20859 _keys!1487)))

(declare-fun b!925961 () Bool)

(declare-fun e!519738 () Bool)

(assert (=> b!925961 (= e!519735 e!519738)))

(declare-fun res!623920 () Bool)

(assert (=> b!925961 (=> (not res!623920) (not e!519738))))

(declare-fun lt!416815 () ListLongMap!11701)

(declare-fun contains!4878 (ListLongMap!11701 (_ BitVec 64)) Bool)

(assert (=> b!925961 (= res!623920 (contains!4878 lt!416815 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31311)

(declare-fun minValue!1173 () V!31311)

(declare-fun getCurrentListMap!3052 (array!55459 array!55461 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 32) Int) ListLongMap!11701)

(assert (=> b!925961 (= lt!416815 (getCurrentListMap!3052 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925962 () Bool)

(declare-fun Unit!31217 () Unit!31215)

(assert (=> b!925962 (= e!519729 Unit!31217)))

(declare-fun b!925963 () Bool)

(declare-fun Unit!31218 () Unit!31215)

(assert (=> b!925963 (= e!519730 Unit!31218)))

(declare-fun mapNonEmpty!31395 () Bool)

(declare-fun mapRes!31395 () Bool)

(declare-fun tp!60195 () Bool)

(declare-fun e!519740 () Bool)

(assert (=> mapNonEmpty!31395 (= mapRes!31395 (and tp!60195 e!519740))))

(declare-fun mapKey!31395 () (_ BitVec 32))

(declare-fun mapRest!31395 () (Array (_ BitVec 32) ValueCell!9398))

(declare-fun mapValue!31395 () ValueCell!9398)

(assert (=> mapNonEmpty!31395 (= (arr!26676 _values!1231) (store mapRest!31395 mapKey!31395 mapValue!31395))))

(declare-fun mapIsEmpty!31395 () Bool)

(assert (=> mapIsEmpty!31395 mapRes!31395))

(declare-fun b!925964 () Bool)

(declare-fun res!623921 () Bool)

(assert (=> b!925964 (=> (not res!623921) (not e!519735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55459 (_ BitVec 32)) Bool)

(assert (=> b!925964 (= res!623921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925965 () Bool)

(declare-fun e!519737 () Bool)

(assert (=> b!925965 (= e!519732 (and e!519737 mapRes!31395))))

(declare-fun condMapEmpty!31395 () Bool)

(declare-fun mapDefault!31395 () ValueCell!9398)

(assert (=> b!925965 (= condMapEmpty!31395 (= (arr!26676 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9398)) mapDefault!31395)))))

(declare-fun b!925966 () Bool)

(assert (=> b!925966 (= e!519737 tp_is_empty!19759)))

(declare-fun b!925967 () Bool)

(declare-fun lt!416819 () ListLongMap!11701)

(declare-fun lt!416820 () V!31311)

(assert (=> b!925967 (= (apply!677 lt!416819 k0!1099) lt!416820)))

(declare-fun lt!416823 () Unit!31215)

(declare-fun lt!416828 () V!31311)

(declare-fun addApplyDifferent!386 (ListLongMap!11701 (_ BitVec 64) V!31311 (_ BitVec 64)) Unit!31215)

(assert (=> b!925967 (= lt!416823 (addApplyDifferent!386 lt!416815 lt!416816 lt!416828 k0!1099))))

(assert (=> b!925967 (not (= lt!416816 k0!1099))))

(declare-fun lt!416825 () Unit!31215)

(declare-datatypes ((List!18787 0))(
  ( (Nil!18784) (Cons!18783 (h!19929 (_ BitVec 64)) (t!26759 List!18787)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55459 (_ BitVec 64) (_ BitVec 32) List!18787) Unit!31215)

(assert (=> b!925967 (= lt!416825 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18784))))

(assert (=> b!925967 e!519741))

(declare-fun c!96623 () Bool)

(assert (=> b!925967 (= c!96623 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416827 () Unit!31215)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!246 (array!55459 array!55461 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 64) (_ BitVec 32) Int) Unit!31215)

(assert (=> b!925967 (= lt!416827 (lemmaListMapContainsThenArrayContainsFrom!246 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55459 (_ BitVec 32) List!18787) Bool)

(assert (=> b!925967 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18784)))

(declare-fun lt!416817 () Unit!31215)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55459 (_ BitVec 32) (_ BitVec 32)) Unit!31215)

(assert (=> b!925967 (= lt!416817 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925967 (contains!4878 lt!416819 k0!1099)))

(declare-fun lt!416822 () tuple2!13014)

(declare-fun +!2758 (ListLongMap!11701 tuple2!13014) ListLongMap!11701)

(assert (=> b!925967 (= lt!416819 (+!2758 lt!416815 lt!416822))))

(declare-fun lt!416824 () Unit!31215)

(declare-fun addStillContains!455 (ListLongMap!11701 (_ BitVec 64) V!31311 (_ BitVec 64)) Unit!31215)

(assert (=> b!925967 (= lt!416824 (addStillContains!455 lt!416815 lt!416816 lt!416828 k0!1099))))

(assert (=> b!925967 (= (getCurrentListMap!3052 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2758 (getCurrentListMap!3052 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416822))))

(assert (=> b!925967 (= lt!416822 (tuple2!13015 lt!416816 lt!416828))))

(declare-fun get!14037 (ValueCell!9398 V!31311) V!31311)

(declare-fun dynLambda!1514 (Int (_ BitVec 64)) V!31311)

(assert (=> b!925967 (= lt!416828 (get!14037 (select (arr!26676 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1514 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416813 () Unit!31215)

(declare-fun lemmaListMapRecursiveValidKeyArray!122 (array!55459 array!55461 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 32) Int) Unit!31215)

(assert (=> b!925967 (= lt!416813 (lemmaListMapRecursiveValidKeyArray!122 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925967 (= e!519730 lt!416823)))

(declare-fun b!925968 () Bool)

(declare-fun res!623928 () Bool)

(assert (=> b!925968 (=> (not res!623928) (not e!519735))))

(assert (=> b!925968 (= res!623928 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27136 _keys!1487))))))

(declare-fun b!925969 () Bool)

(assert (=> b!925969 (= e!519740 tp_is_empty!19759)))

(declare-fun b!925970 () Bool)

(declare-fun res!623926 () Bool)

(assert (=> b!925970 (=> (not res!623926) (not e!519735))))

(assert (=> b!925970 (= res!623926 (and (= (size!27137 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27136 _keys!1487) (size!27137 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925971 () Bool)

(declare-fun res!623924 () Bool)

(assert (=> b!925971 (=> (not res!623924) (not e!519735))))

(assert (=> b!925971 (= res!623924 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18784))))

(declare-fun b!925972 () Bool)

(assert (=> b!925972 (= e!519741 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925973 () Bool)

(declare-fun e!519734 () Bool)

(declare-fun e!519733 () Bool)

(assert (=> b!925973 (= e!519734 e!519733)))

(declare-fun res!623925 () Bool)

(assert (=> b!925973 (=> (not res!623925) (not e!519733))))

(assert (=> b!925973 (= res!623925 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27136 _keys!1487)))))

(declare-fun lt!416818 () Unit!31215)

(assert (=> b!925973 (= lt!416818 e!519729)))

(declare-fun c!96625 () Bool)

(assert (=> b!925973 (= c!96625 (validKeyInArray!0 k0!1099))))

(declare-fun lt!416821 () ListLongMap!11701)

(declare-fun e!519731 () Bool)

(declare-fun b!925974 () Bool)

(assert (=> b!925974 (= e!519731 (= (apply!677 lt!416821 k0!1099) v!791))))

(declare-fun b!925975 () Bool)

(assert (=> b!925975 (= e!519733 e!519739)))

(declare-fun res!623929 () Bool)

(assert (=> b!925975 (=> (not res!623929) (not e!519739))))

(assert (=> b!925975 (= res!623929 (contains!4878 lt!416814 k0!1099))))

(assert (=> b!925975 (= lt!416814 (getCurrentListMap!3052 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925976 () Bool)

(assert (=> b!925976 (= e!519739 (not true))))

(assert (=> b!925976 e!519731))

(declare-fun res!623922 () Bool)

(assert (=> b!925976 (=> (not res!623922) (not e!519731))))

(assert (=> b!925976 (= res!623922 (contains!4878 lt!416821 k0!1099))))

(assert (=> b!925976 (= lt!416821 (getCurrentListMap!3052 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!416826 () Unit!31215)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!83 (array!55459 array!55461 (_ BitVec 32) (_ BitVec 32) V!31311 V!31311 (_ BitVec 64) V!31311 (_ BitVec 32) Int) Unit!31215)

(assert (=> b!925976 (= lt!416826 (lemmaListMapApplyFromThenApplyFromZero!83 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925977 () Bool)

(assert (=> b!925977 (= e!519738 e!519734)))

(declare-fun res!623930 () Bool)

(assert (=> b!925977 (=> (not res!623930) (not e!519734))))

(assert (=> b!925977 (= res!623930 (and (= lt!416820 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925977 (= lt!416820 (apply!677 lt!416815 k0!1099))))

(assert (= (and start!79020 res!623927) b!925970))

(assert (= (and b!925970 res!623926) b!925964))

(assert (= (and b!925964 res!623921) b!925971))

(assert (= (and b!925971 res!623924) b!925968))

(assert (= (and b!925968 res!623928) b!925961))

(assert (= (and b!925961 res!623920) b!925977))

(assert (= (and b!925977 res!623930) b!925973))

(assert (= (and b!925973 c!96625) b!925959))

(assert (= (and b!925973 (not c!96625)) b!925962))

(assert (= (and b!925959 c!96624) b!925967))

(assert (= (and b!925959 (not c!96624)) b!925963))

(assert (= (and b!925967 c!96623) b!925958))

(assert (= (and b!925967 (not c!96623)) b!925972))

(assert (= (and b!925973 res!623925) b!925975))

(assert (= (and b!925975 res!623929) b!925960))

(assert (= (and b!925960 res!623923) b!925976))

(assert (= (and b!925976 res!623922) b!925974))

(assert (= (and b!925965 condMapEmpty!31395) mapIsEmpty!31395))

(assert (= (and b!925965 (not condMapEmpty!31395)) mapNonEmpty!31395))

(get-info :version)

(assert (= (and mapNonEmpty!31395 ((_ is ValueCellFull!9398) mapValue!31395)) b!925969))

(assert (= (and b!925965 ((_ is ValueCellFull!9398) mapDefault!31395)) b!925966))

(assert (= start!79020 b!925965))

(declare-fun b_lambda!13735 () Bool)

(assert (=> (not b_lambda!13735) (not b!925967)))

(declare-fun t!26757 () Bool)

(declare-fun tb!5823 () Bool)

(assert (=> (and start!79020 (= defaultEntry!1235 defaultEntry!1235) t!26757) tb!5823))

(declare-fun result!11477 () Bool)

(assert (=> tb!5823 (= result!11477 tp_is_empty!19759)))

(assert (=> b!925967 t!26757))

(declare-fun b_and!28215 () Bool)

(assert (= b_and!28213 (and (=> t!26757 result!11477) b_and!28215)))

(declare-fun m!859957 () Bool)

(assert (=> mapNonEmpty!31395 m!859957))

(declare-fun m!859959 () Bool)

(assert (=> b!925959 m!859959))

(declare-fun m!859961 () Bool)

(assert (=> b!925959 m!859961))

(declare-fun m!859963 () Bool)

(assert (=> b!925958 m!859963))

(declare-fun m!859965 () Bool)

(assert (=> b!925964 m!859965))

(declare-fun m!859967 () Bool)

(assert (=> b!925974 m!859967))

(declare-fun m!859969 () Bool)

(assert (=> b!925976 m!859969))

(declare-fun m!859971 () Bool)

(assert (=> b!925976 m!859971))

(declare-fun m!859973 () Bool)

(assert (=> b!925976 m!859973))

(declare-fun m!859975 () Bool)

(assert (=> b!925975 m!859975))

(declare-fun m!859977 () Bool)

(assert (=> b!925975 m!859977))

(declare-fun m!859979 () Bool)

(assert (=> b!925961 m!859979))

(declare-fun m!859981 () Bool)

(assert (=> b!925961 m!859981))

(declare-fun m!859983 () Bool)

(assert (=> b!925973 m!859983))

(declare-fun m!859985 () Bool)

(assert (=> start!79020 m!859985))

(declare-fun m!859987 () Bool)

(assert (=> start!79020 m!859987))

(declare-fun m!859989 () Bool)

(assert (=> start!79020 m!859989))

(declare-fun m!859991 () Bool)

(assert (=> b!925971 m!859991))

(declare-fun m!859993 () Bool)

(assert (=> b!925967 m!859993))

(declare-fun m!859995 () Bool)

(assert (=> b!925967 m!859995))

(declare-fun m!859997 () Bool)

(assert (=> b!925967 m!859997))

(assert (=> b!925967 m!859995))

(assert (=> b!925967 m!859997))

(declare-fun m!859999 () Bool)

(assert (=> b!925967 m!859999))

(assert (=> b!925967 m!859977))

(declare-fun m!860001 () Bool)

(assert (=> b!925967 m!860001))

(declare-fun m!860003 () Bool)

(assert (=> b!925967 m!860003))

(declare-fun m!860005 () Bool)

(assert (=> b!925967 m!860005))

(declare-fun m!860007 () Bool)

(assert (=> b!925967 m!860007))

(declare-fun m!860009 () Bool)

(assert (=> b!925967 m!860009))

(declare-fun m!860011 () Bool)

(assert (=> b!925967 m!860011))

(assert (=> b!925967 m!860009))

(declare-fun m!860013 () Bool)

(assert (=> b!925967 m!860013))

(declare-fun m!860015 () Bool)

(assert (=> b!925967 m!860015))

(declare-fun m!860017 () Bool)

(assert (=> b!925967 m!860017))

(declare-fun m!860019 () Bool)

(assert (=> b!925967 m!860019))

(declare-fun m!860021 () Bool)

(assert (=> b!925967 m!860021))

(declare-fun m!860023 () Bool)

(assert (=> b!925977 m!860023))

(declare-fun m!860025 () Bool)

(assert (=> b!925960 m!860025))

(check-sat (not b!925961) (not b!925971) (not b!925977) (not b!925967) (not b!925974) (not b!925976) (not b!925973) (not mapNonEmpty!31395) b_and!28215 (not b!925975) (not b!925959) (not b!925964) (not b_lambda!13735) (not b!925960) (not b!925958) (not start!79020) tp_is_empty!19759 (not b_next!17251))
(check-sat b_and!28215 (not b_next!17251))
