; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79040 () Bool)

(assert start!79040)

(declare-fun b_free!17253 () Bool)

(declare-fun b_next!17253 () Bool)

(assert (=> start!79040 (= b_free!17253 (not b_next!17253))))

(declare-fun tp!60199 () Bool)

(declare-fun b_and!28243 () Bool)

(assert (=> start!79040 (= tp!60199 b_and!28243)))

(declare-fun b!926259 () Bool)

(declare-fun res!624063 () Bool)

(declare-fun e!519923 () Bool)

(assert (=> b!926259 (=> (not res!624063) (not e!519923))))

(declare-datatypes ((array!55488 0))(
  ( (array!55489 (arr!26689 (Array (_ BitVec 32) (_ BitVec 64))) (size!27148 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55488)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55488 (_ BitVec 32)) Bool)

(assert (=> b!926259 (= res!624063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926260 () Bool)

(declare-datatypes ((V!31313 0))(
  ( (V!31314 (val!9931 Int)) )
))
(declare-datatypes ((tuple2!12956 0))(
  ( (tuple2!12957 (_1!6489 (_ BitVec 64)) (_2!6489 V!31313)) )
))
(declare-datatypes ((List!18758 0))(
  ( (Nil!18755) (Cons!18754 (h!19900 tuple2!12956) (t!26741 List!18758)) )
))
(declare-datatypes ((ListLongMap!11653 0))(
  ( (ListLongMap!11654 (toList!5842 List!18758)) )
))
(declare-fun lt!417109 () ListLongMap!11653)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!417107 () V!31313)

(declare-fun apply!672 (ListLongMap!11653 (_ BitVec 64)) V!31313)

(assert (=> b!926260 (= (apply!672 lt!417109 k0!1099) lt!417107)))

(declare-datatypes ((Unit!31312 0))(
  ( (Unit!31313) )
))
(declare-fun lt!417105 () Unit!31312)

(declare-fun lt!417098 () ListLongMap!11653)

(declare-fun lt!417103 () (_ BitVec 64))

(declare-fun lt!417111 () V!31313)

(declare-fun addApplyDifferent!392 (ListLongMap!11653 (_ BitVec 64) V!31313 (_ BitVec 64)) Unit!31312)

(assert (=> b!926260 (= lt!417105 (addApplyDifferent!392 lt!417098 lt!417103 lt!417111 k0!1099))))

(assert (=> b!926260 (not (= lt!417103 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417102 () Unit!31312)

(declare-datatypes ((List!18759 0))(
  ( (Nil!18756) (Cons!18755 (h!19901 (_ BitVec 64)) (t!26742 List!18759)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55488 (_ BitVec 64) (_ BitVec 32) List!18759) Unit!31312)

(assert (=> b!926260 (= lt!417102 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18756))))

(declare-fun e!519926 () Bool)

(assert (=> b!926260 e!519926))

(declare-fun c!96698 () Bool)

(assert (=> b!926260 (= c!96698 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9399 0))(
  ( (ValueCellFull!9399 (v!12449 V!31313)) (EmptyCell!9399) )
))
(declare-datatypes ((array!55490 0))(
  ( (array!55491 (arr!26690 (Array (_ BitVec 32) ValueCell!9399)) (size!27149 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55490)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!417104 () Unit!31312)

(declare-fun zeroValue!1173 () V!31313)

(declare-fun minValue!1173 () V!31313)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!243 (array!55488 array!55490 (_ BitVec 32) (_ BitVec 32) V!31313 V!31313 (_ BitVec 64) (_ BitVec 32) Int) Unit!31312)

(assert (=> b!926260 (= lt!417104 (lemmaListMapContainsThenArrayContainsFrom!243 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55488 (_ BitVec 32) List!18759) Bool)

(assert (=> b!926260 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18756)))

(declare-fun lt!417112 () Unit!31312)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55488 (_ BitVec 32) (_ BitVec 32)) Unit!31312)

(assert (=> b!926260 (= lt!417112 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4901 (ListLongMap!11653 (_ BitVec 64)) Bool)

(assert (=> b!926260 (contains!4901 lt!417109 k0!1099)))

(declare-fun lt!417097 () tuple2!12956)

(declare-fun +!2736 (ListLongMap!11653 tuple2!12956) ListLongMap!11653)

(assert (=> b!926260 (= lt!417109 (+!2736 lt!417098 lt!417097))))

(declare-fun lt!417100 () Unit!31312)

(declare-fun addStillContains!460 (ListLongMap!11653 (_ BitVec 64) V!31313 (_ BitVec 64)) Unit!31312)

(assert (=> b!926260 (= lt!417100 (addStillContains!460 lt!417098 lt!417103 lt!417111 k0!1099))))

(declare-fun getCurrentListMap!3092 (array!55488 array!55490 (_ BitVec 32) (_ BitVec 32) V!31313 V!31313 (_ BitVec 32) Int) ListLongMap!11653)

(assert (=> b!926260 (= (getCurrentListMap!3092 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2736 (getCurrentListMap!3092 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417097))))

(assert (=> b!926260 (= lt!417097 (tuple2!12957 lt!417103 lt!417111))))

(declare-fun get!14043 (ValueCell!9399 V!31313) V!31313)

(declare-fun dynLambda!1525 (Int (_ BitVec 64)) V!31313)

(assert (=> b!926260 (= lt!417111 (get!14043 (select (arr!26690 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1525 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417099 () Unit!31312)

(declare-fun lemmaListMapRecursiveValidKeyArray!126 (array!55488 array!55490 (_ BitVec 32) (_ BitVec 32) V!31313 V!31313 (_ BitVec 32) Int) Unit!31312)

(assert (=> b!926260 (= lt!417099 (lemmaListMapRecursiveValidKeyArray!126 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519922 () Unit!31312)

(assert (=> b!926260 (= e!519922 lt!417105)))

(declare-fun b!926261 () Bool)

(declare-fun res!624069 () Bool)

(declare-fun e!519918 () Bool)

(assert (=> b!926261 (=> (not res!624069) (not e!519918))))

(declare-fun v!791 () V!31313)

(declare-fun lt!417110 () ListLongMap!11653)

(assert (=> b!926261 (= res!624069 (= (apply!672 lt!417110 k0!1099) v!791))))

(declare-fun mapNonEmpty!31398 () Bool)

(declare-fun mapRes!31398 () Bool)

(declare-fun tp!60200 () Bool)

(declare-fun e!519921 () Bool)

(assert (=> mapNonEmpty!31398 (= mapRes!31398 (and tp!60200 e!519921))))

(declare-fun mapKey!31398 () (_ BitVec 32))

(declare-fun mapValue!31398 () ValueCell!9399)

(declare-fun mapRest!31398 () (Array (_ BitVec 32) ValueCell!9399))

(assert (=> mapNonEmpty!31398 (= (arr!26690 _values!1231) (store mapRest!31398 mapKey!31398 mapValue!31398))))

(declare-fun lt!417101 () ListLongMap!11653)

(declare-fun b!926262 () Bool)

(declare-fun e!519919 () Bool)

(assert (=> b!926262 (= e!519919 (= (apply!672 lt!417101 k0!1099) v!791))))

(declare-fun b!926263 () Bool)

(assert (=> b!926263 (= e!519926 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926264 () Bool)

(declare-fun e!519924 () Unit!31312)

(assert (=> b!926264 (= e!519924 e!519922)))

(assert (=> b!926264 (= lt!417103 (select (arr!26689 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96699 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926264 (= c!96699 (validKeyInArray!0 lt!417103))))

(declare-fun b!926265 () Bool)

(declare-fun e!519917 () Bool)

(declare-fun e!519916 () Bool)

(assert (=> b!926265 (= e!519917 e!519916)))

(declare-fun res!624064 () Bool)

(assert (=> b!926265 (=> (not res!624064) (not e!519916))))

(assert (=> b!926265 (= res!624064 (and (= lt!417107 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926265 (= lt!417107 (apply!672 lt!417098 k0!1099))))

(declare-fun b!926266 () Bool)

(declare-fun res!624073 () Bool)

(assert (=> b!926266 (=> (not res!624073) (not e!519923))))

(assert (=> b!926266 (= res!624073 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18756))))

(declare-fun b!926267 () Bool)

(declare-fun e!519920 () Bool)

(assert (=> b!926267 (= e!519916 e!519920)))

(declare-fun res!624065 () Bool)

(assert (=> b!926267 (=> (not res!624065) (not e!519920))))

(assert (=> b!926267 (= res!624065 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27148 _keys!1487)))))

(declare-fun lt!417108 () Unit!31312)

(assert (=> b!926267 (= lt!417108 e!519924)))

(declare-fun c!96697 () Bool)

(assert (=> b!926267 (= c!96697 (validKeyInArray!0 k0!1099))))

(declare-fun b!926268 () Bool)

(declare-fun res!624068 () Bool)

(assert (=> b!926268 (=> (not res!624068) (not e!519923))))

(assert (=> b!926268 (= res!624068 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27148 _keys!1487))))))

(declare-fun mapIsEmpty!31398 () Bool)

(assert (=> mapIsEmpty!31398 mapRes!31398))

(declare-fun b!926270 () Bool)

(declare-fun tp_is_empty!19761 () Bool)

(assert (=> b!926270 (= e!519921 tp_is_empty!19761)))

(declare-fun b!926271 () Bool)

(declare-fun Unit!31314 () Unit!31312)

(assert (=> b!926271 (= e!519922 Unit!31314)))

(declare-fun b!926272 () Bool)

(declare-fun arrayContainsKey!0 (array!55488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926272 (= e!519926 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!926273 () Bool)

(assert (=> b!926273 (= e!519918 (not true))))

(assert (=> b!926273 e!519919))

(declare-fun res!624066 () Bool)

(assert (=> b!926273 (=> (not res!624066) (not e!519919))))

(assert (=> b!926273 (= res!624066 (contains!4901 lt!417101 k0!1099))))

(assert (=> b!926273 (= lt!417101 (getCurrentListMap!3092 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417106 () Unit!31312)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!79 (array!55488 array!55490 (_ BitVec 32) (_ BitVec 32) V!31313 V!31313 (_ BitVec 64) V!31313 (_ BitVec 32) Int) Unit!31312)

(assert (=> b!926273 (= lt!417106 (lemmaListMapApplyFromThenApplyFromZero!79 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926274 () Bool)

(assert (=> b!926274 (= e!519920 e!519918)))

(declare-fun res!624071 () Bool)

(assert (=> b!926274 (=> (not res!624071) (not e!519918))))

(assert (=> b!926274 (= res!624071 (contains!4901 lt!417110 k0!1099))))

(assert (=> b!926274 (= lt!417110 (getCurrentListMap!3092 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926275 () Bool)

(declare-fun e!519925 () Bool)

(assert (=> b!926275 (= e!519925 tp_is_empty!19761)))

(declare-fun b!926276 () Bool)

(declare-fun Unit!31315 () Unit!31312)

(assert (=> b!926276 (= e!519924 Unit!31315)))

(declare-fun b!926277 () Bool)

(declare-fun e!519928 () Bool)

(assert (=> b!926277 (= e!519928 (and e!519925 mapRes!31398))))

(declare-fun condMapEmpty!31398 () Bool)

(declare-fun mapDefault!31398 () ValueCell!9399)

(assert (=> b!926277 (= condMapEmpty!31398 (= (arr!26690 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9399)) mapDefault!31398)))))

(declare-fun b!926278 () Bool)

(declare-fun res!624067 () Bool)

(assert (=> b!926278 (=> (not res!624067) (not e!519923))))

(assert (=> b!926278 (= res!624067 (and (= (size!27149 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27148 _keys!1487) (size!27149 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926269 () Bool)

(assert (=> b!926269 (= e!519923 e!519917)))

(declare-fun res!624072 () Bool)

(assert (=> b!926269 (=> (not res!624072) (not e!519917))))

(assert (=> b!926269 (= res!624072 (contains!4901 lt!417098 k0!1099))))

(assert (=> b!926269 (= lt!417098 (getCurrentListMap!3092 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!624070 () Bool)

(assert (=> start!79040 (=> (not res!624070) (not e!519923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79040 (= res!624070 (validMask!0 mask!1881))))

(assert (=> start!79040 e!519923))

(assert (=> start!79040 true))

(assert (=> start!79040 tp_is_empty!19761))

(declare-fun array_inv!20788 (array!55490) Bool)

(assert (=> start!79040 (and (array_inv!20788 _values!1231) e!519928)))

(assert (=> start!79040 tp!60199))

(declare-fun array_inv!20789 (array!55488) Bool)

(assert (=> start!79040 (array_inv!20789 _keys!1487)))

(assert (= (and start!79040 res!624070) b!926278))

(assert (= (and b!926278 res!624067) b!926259))

(assert (= (and b!926259 res!624063) b!926266))

(assert (= (and b!926266 res!624073) b!926268))

(assert (= (and b!926268 res!624068) b!926269))

(assert (= (and b!926269 res!624072) b!926265))

(assert (= (and b!926265 res!624064) b!926267))

(assert (= (and b!926267 c!96697) b!926264))

(assert (= (and b!926267 (not c!96697)) b!926276))

(assert (= (and b!926264 c!96699) b!926260))

(assert (= (and b!926264 (not c!96699)) b!926271))

(assert (= (and b!926260 c!96698) b!926272))

(assert (= (and b!926260 (not c!96698)) b!926263))

(assert (= (and b!926267 res!624065) b!926274))

(assert (= (and b!926274 res!624071) b!926261))

(assert (= (and b!926261 res!624069) b!926273))

(assert (= (and b!926273 res!624066) b!926262))

(assert (= (and b!926277 condMapEmpty!31398) mapIsEmpty!31398))

(assert (= (and b!926277 (not condMapEmpty!31398)) mapNonEmpty!31398))

(get-info :version)

(assert (= (and mapNonEmpty!31398 ((_ is ValueCellFull!9399) mapValue!31398)) b!926270))

(assert (= (and b!926277 ((_ is ValueCellFull!9399) mapDefault!31398)) b!926275))

(assert (= start!79040 b!926277))

(declare-fun b_lambda!13755 () Bool)

(assert (=> (not b_lambda!13755) (not b!926260)))

(declare-fun t!26740 () Bool)

(declare-fun tb!5833 () Bool)

(assert (=> (and start!79040 (= defaultEntry!1235 defaultEntry!1235) t!26740) tb!5833))

(declare-fun result!11489 () Bool)

(assert (=> tb!5833 (= result!11489 tp_is_empty!19761)))

(assert (=> b!926260 t!26740))

(declare-fun b_and!28245 () Bool)

(assert (= b_and!28243 (and (=> t!26740 result!11489) b_and!28245)))

(declare-fun m!860785 () Bool)

(assert (=> b!926264 m!860785))

(declare-fun m!860787 () Bool)

(assert (=> b!926264 m!860787))

(declare-fun m!860789 () Bool)

(assert (=> b!926269 m!860789))

(declare-fun m!860791 () Bool)

(assert (=> b!926269 m!860791))

(declare-fun m!860793 () Bool)

(assert (=> start!79040 m!860793))

(declare-fun m!860795 () Bool)

(assert (=> start!79040 m!860795))

(declare-fun m!860797 () Bool)

(assert (=> start!79040 m!860797))

(declare-fun m!860799 () Bool)

(assert (=> b!926266 m!860799))

(declare-fun m!860801 () Bool)

(assert (=> b!926267 m!860801))

(declare-fun m!860803 () Bool)

(assert (=> b!926260 m!860803))

(declare-fun m!860805 () Bool)

(assert (=> b!926260 m!860805))

(declare-fun m!860807 () Bool)

(assert (=> b!926260 m!860807))

(declare-fun m!860809 () Bool)

(assert (=> b!926260 m!860809))

(declare-fun m!860811 () Bool)

(assert (=> b!926260 m!860811))

(declare-fun m!860813 () Bool)

(assert (=> b!926260 m!860813))

(declare-fun m!860815 () Bool)

(assert (=> b!926260 m!860815))

(assert (=> b!926260 m!860809))

(assert (=> b!926260 m!860813))

(declare-fun m!860817 () Bool)

(assert (=> b!926260 m!860817))

(declare-fun m!860819 () Bool)

(assert (=> b!926260 m!860819))

(declare-fun m!860821 () Bool)

(assert (=> b!926260 m!860821))

(declare-fun m!860823 () Bool)

(assert (=> b!926260 m!860823))

(declare-fun m!860825 () Bool)

(assert (=> b!926260 m!860825))

(declare-fun m!860827 () Bool)

(assert (=> b!926260 m!860827))

(declare-fun m!860829 () Bool)

(assert (=> b!926260 m!860829))

(declare-fun m!860831 () Bool)

(assert (=> b!926260 m!860831))

(assert (=> b!926260 m!860803))

(declare-fun m!860833 () Bool)

(assert (=> b!926260 m!860833))

(declare-fun m!860835 () Bool)

(assert (=> mapNonEmpty!31398 m!860835))

(declare-fun m!860837 () Bool)

(assert (=> b!926259 m!860837))

(declare-fun m!860839 () Bool)

(assert (=> b!926273 m!860839))

(declare-fun m!860841 () Bool)

(assert (=> b!926273 m!860841))

(declare-fun m!860843 () Bool)

(assert (=> b!926273 m!860843))

(declare-fun m!860845 () Bool)

(assert (=> b!926261 m!860845))

(declare-fun m!860847 () Bool)

(assert (=> b!926274 m!860847))

(assert (=> b!926274 m!860819))

(declare-fun m!860849 () Bool)

(assert (=> b!926262 m!860849))

(declare-fun m!860851 () Bool)

(assert (=> b!926272 m!860851))

(declare-fun m!860853 () Bool)

(assert (=> b!926265 m!860853))

(check-sat (not b!926265) (not b!926261) (not start!79040) (not b_lambda!13755) (not b!926269) (not b!926267) b_and!28245 tp_is_empty!19761 (not b!926274) (not b!926273) (not b!926259) (not b_next!17253) (not b!926266) (not b!926260) (not b!926262) (not mapNonEmpty!31398) (not b!926272) (not b!926264))
(check-sat b_and!28245 (not b_next!17253))
