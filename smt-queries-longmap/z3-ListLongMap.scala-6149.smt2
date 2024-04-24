; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79170 () Bool)

(assert start!79170)

(declare-fun b_free!17215 () Bool)

(declare-fun b_next!17215 () Bool)

(assert (=> start!79170 (= b_free!17215 (not b_next!17215))))

(declare-fun tp!60087 () Bool)

(declare-fun b_and!28177 () Bool)

(assert (=> start!79170 (= tp!60087 b_and!28177)))

(declare-fun b!925984 () Bool)

(declare-fun e!519758 () Bool)

(declare-fun e!519762 () Bool)

(assert (=> b!925984 (= e!519758 e!519762)))

(declare-fun res!623782 () Bool)

(assert (=> b!925984 (=> (not res!623782) (not e!519762))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!31263 0))(
  ( (V!31264 (val!9912 Int)) )
))
(declare-fun v!791 () V!31263)

(declare-fun lt!416546 () V!31263)

(assert (=> b!925984 (= res!623782 (and (= lt!416546 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12908 0))(
  ( (tuple2!12909 (_1!6465 (_ BitVec 64)) (_2!6465 V!31263)) )
))
(declare-datatypes ((List!18719 0))(
  ( (Nil!18716) (Cons!18715 (h!19867 tuple2!12908) (t!26656 List!18719)) )
))
(declare-datatypes ((ListLongMap!11607 0))(
  ( (ListLongMap!11608 (toList!5819 List!18719)) )
))
(declare-fun lt!416550 () ListLongMap!11607)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!670 (ListLongMap!11607 (_ BitVec 64)) V!31263)

(assert (=> b!925984 (= lt!416546 (apply!670 lt!416550 k0!1099))))

(declare-fun lt!416551 () ListLongMap!11607)

(declare-fun e!519767 () Bool)

(declare-fun b!925985 () Bool)

(assert (=> b!925985 (= e!519767 (= (apply!670 lt!416551 k0!1099) v!791))))

(declare-fun b!925986 () Bool)

(declare-fun e!519763 () Bool)

(assert (=> b!925986 (= e!519763 e!519758)))

(declare-fun res!623786 () Bool)

(assert (=> b!925986 (=> (not res!623786) (not e!519758))))

(declare-fun contains!4891 (ListLongMap!11607 (_ BitVec 64)) Bool)

(assert (=> b!925986 (= res!623786 (contains!4891 lt!416550 k0!1099))))

(declare-datatypes ((array!55465 0))(
  ( (array!55466 (arr!26673 (Array (_ BitVec 32) (_ BitVec 64))) (size!27133 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55465)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9380 0))(
  ( (ValueCellFull!9380 (v!12427 V!31263)) (EmptyCell!9380) )
))
(declare-datatypes ((array!55467 0))(
  ( (array!55468 (arr!26674 (Array (_ BitVec 32) ValueCell!9380)) (size!27134 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55467)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31263)

(declare-fun minValue!1173 () V!31263)

(declare-fun getCurrentListMap!3069 (array!55465 array!55467 (_ BitVec 32) (_ BitVec 32) V!31263 V!31263 (_ BitVec 32) Int) ListLongMap!11607)

(assert (=> b!925986 (= lt!416550 (getCurrentListMap!3069 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925987 () Bool)

(declare-fun res!623790 () Bool)

(assert (=> b!925987 (=> (not res!623790) (not e!519763))))

(declare-datatypes ((List!18720 0))(
  ( (Nil!18717) (Cons!18716 (h!19868 (_ BitVec 64)) (t!26657 List!18720)) )
))
(declare-fun arrayNoDuplicates!0 (array!55465 (_ BitVec 32) List!18720) Bool)

(assert (=> b!925987 (= res!623790 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18717))))

(declare-fun b!925988 () Bool)

(declare-datatypes ((Unit!31243 0))(
  ( (Unit!31244) )
))
(declare-fun e!519768 () Unit!31243)

(declare-fun Unit!31245 () Unit!31243)

(assert (=> b!925988 (= e!519768 Unit!31245)))

(declare-fun mapIsEmpty!31341 () Bool)

(declare-fun mapRes!31341 () Bool)

(assert (=> mapIsEmpty!31341 mapRes!31341))

(declare-fun res!623783 () Bool)

(assert (=> start!79170 (=> (not res!623783) (not e!519763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79170 (= res!623783 (validMask!0 mask!1881))))

(assert (=> start!79170 e!519763))

(assert (=> start!79170 true))

(declare-fun tp_is_empty!19723 () Bool)

(assert (=> start!79170 tp_is_empty!19723))

(declare-fun e!519760 () Bool)

(declare-fun array_inv!20870 (array!55467) Bool)

(assert (=> start!79170 (and (array_inv!20870 _values!1231) e!519760)))

(assert (=> start!79170 tp!60087))

(declare-fun array_inv!20871 (array!55465) Bool)

(assert (=> start!79170 (array_inv!20871 _keys!1487)))

(declare-fun mapNonEmpty!31341 () Bool)

(declare-fun tp!60086 () Bool)

(declare-fun e!519769 () Bool)

(assert (=> mapNonEmpty!31341 (= mapRes!31341 (and tp!60086 e!519769))))

(declare-fun mapRest!31341 () (Array (_ BitVec 32) ValueCell!9380))

(declare-fun mapValue!31341 () ValueCell!9380)

(declare-fun mapKey!31341 () (_ BitVec 32))

(assert (=> mapNonEmpty!31341 (= (arr!26674 _values!1231) (store mapRest!31341 mapKey!31341 mapValue!31341))))

(declare-fun b!925989 () Bool)

(declare-fun e!519757 () Bool)

(assert (=> b!925989 (= e!519757 tp_is_empty!19723)))

(declare-fun b!925990 () Bool)

(declare-fun lt!416553 () ListLongMap!11607)

(assert (=> b!925990 (= (apply!670 lt!416553 k0!1099) lt!416546)))

(declare-fun lt!416560 () (_ BitVec 64))

(declare-fun lt!416552 () V!31263)

(declare-fun lt!416548 () Unit!31243)

(declare-fun addApplyDifferent!371 (ListLongMap!11607 (_ BitVec 64) V!31263 (_ BitVec 64)) Unit!31243)

(assert (=> b!925990 (= lt!416548 (addApplyDifferent!371 lt!416550 lt!416560 lt!416552 k0!1099))))

(assert (=> b!925990 (not (= lt!416560 k0!1099))))

(declare-fun lt!416547 () Unit!31243)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55465 (_ BitVec 64) (_ BitVec 32) List!18720) Unit!31243)

(assert (=> b!925990 (= lt!416547 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18717))))

(declare-fun e!519766 () Bool)

(assert (=> b!925990 e!519766))

(declare-fun c!96808 () Bool)

(assert (=> b!925990 (= c!96808 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416559 () Unit!31243)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!226 (array!55465 array!55467 (_ BitVec 32) (_ BitVec 32) V!31263 V!31263 (_ BitVec 64) (_ BitVec 32) Int) Unit!31243)

(assert (=> b!925990 (= lt!416559 (lemmaListMapContainsThenArrayContainsFrom!226 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925990 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18717)))

(declare-fun lt!416555 () Unit!31243)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55465 (_ BitVec 32) (_ BitVec 32)) Unit!31243)

(assert (=> b!925990 (= lt!416555 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925990 (contains!4891 lt!416553 k0!1099)))

(declare-fun lt!416554 () tuple2!12908)

(declare-fun +!2735 (ListLongMap!11607 tuple2!12908) ListLongMap!11607)

(assert (=> b!925990 (= lt!416553 (+!2735 lt!416550 lt!416554))))

(declare-fun lt!416561 () Unit!31243)

(declare-fun addStillContains!444 (ListLongMap!11607 (_ BitVec 64) V!31263 (_ BitVec 64)) Unit!31243)

(assert (=> b!925990 (= lt!416561 (addStillContains!444 lt!416550 lt!416560 lt!416552 k0!1099))))

(assert (=> b!925990 (= (getCurrentListMap!3069 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2735 (getCurrentListMap!3069 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416554))))

(assert (=> b!925990 (= lt!416554 (tuple2!12909 lt!416560 lt!416552))))

(declare-fun get!14042 (ValueCell!9380 V!31263) V!31263)

(declare-fun dynLambda!1532 (Int (_ BitVec 64)) V!31263)

(assert (=> b!925990 (= lt!416552 (get!14042 (select (arr!26674 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1532 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416556 () Unit!31243)

(declare-fun lemmaListMapRecursiveValidKeyArray!115 (array!55465 array!55467 (_ BitVec 32) (_ BitVec 32) V!31263 V!31263 (_ BitVec 32) Int) Unit!31243)

(assert (=> b!925990 (= lt!416556 (lemmaListMapRecursiveValidKeyArray!115 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925990 (= e!519768 lt!416548)))

(declare-fun b!925991 () Bool)

(assert (=> b!925991 (= e!519760 (and e!519757 mapRes!31341))))

(declare-fun condMapEmpty!31341 () Bool)

(declare-fun mapDefault!31341 () ValueCell!9380)

(assert (=> b!925991 (= condMapEmpty!31341 (= (arr!26674 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9380)) mapDefault!31341)))))

(declare-fun b!925992 () Bool)

(declare-fun res!623789 () Bool)

(assert (=> b!925992 (=> (not res!623789) (not e!519763))))

(assert (=> b!925992 (= res!623789 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27133 _keys!1487))))))

(declare-fun b!925993 () Bool)

(declare-fun res!623785 () Bool)

(assert (=> b!925993 (=> (not res!623785) (not e!519763))))

(assert (=> b!925993 (= res!623785 (and (= (size!27134 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27133 _keys!1487) (size!27134 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925994 () Bool)

(declare-fun e!519761 () Unit!31243)

(assert (=> b!925994 (= e!519761 e!519768)))

(assert (=> b!925994 (= lt!416560 (select (arr!26673 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96810 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925994 (= c!96810 (validKeyInArray!0 lt!416560))))

(declare-fun b!925995 () Bool)

(declare-fun arrayContainsKey!0 (array!55465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925995 (= e!519766 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925996 () Bool)

(assert (=> b!925996 (= e!519769 tp_is_empty!19723)))

(declare-fun b!925997 () Bool)

(assert (=> b!925997 (= e!519766 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925998 () Bool)

(declare-fun e!519765 () Bool)

(assert (=> b!925998 (= e!519762 e!519765)))

(declare-fun res!623787 () Bool)

(assert (=> b!925998 (=> (not res!623787) (not e!519765))))

(assert (=> b!925998 (= res!623787 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27133 _keys!1487)))))

(declare-fun lt!416558 () Unit!31243)

(assert (=> b!925998 (= lt!416558 e!519761)))

(declare-fun c!96809 () Bool)

(assert (=> b!925998 (= c!96809 (validKeyInArray!0 k0!1099))))

(declare-fun b!925999 () Bool)

(declare-fun Unit!31246 () Unit!31243)

(assert (=> b!925999 (= e!519761 Unit!31246)))

(declare-fun b!926000 () Bool)

(declare-fun e!519759 () Bool)

(assert (=> b!926000 (= e!519765 e!519759)))

(declare-fun res!623781 () Bool)

(assert (=> b!926000 (=> (not res!623781) (not e!519759))))

(declare-fun lt!416549 () ListLongMap!11607)

(assert (=> b!926000 (= res!623781 (contains!4891 lt!416549 k0!1099))))

(assert (=> b!926000 (= lt!416549 (getCurrentListMap!3069 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926001 () Bool)

(declare-fun res!623784 () Bool)

(assert (=> b!926001 (=> (not res!623784) (not e!519759))))

(assert (=> b!926001 (= res!623784 (= (apply!670 lt!416549 k0!1099) v!791))))

(declare-fun b!926002 () Bool)

(assert (=> b!926002 (= e!519759 (not true))))

(assert (=> b!926002 e!519767))

(declare-fun res!623780 () Bool)

(assert (=> b!926002 (=> (not res!623780) (not e!519767))))

(assert (=> b!926002 (= res!623780 (contains!4891 lt!416551 k0!1099))))

(assert (=> b!926002 (= lt!416551 (getCurrentListMap!3069 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!416557 () Unit!31243)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!67 (array!55465 array!55467 (_ BitVec 32) (_ BitVec 32) V!31263 V!31263 (_ BitVec 64) V!31263 (_ BitVec 32) Int) Unit!31243)

(assert (=> b!926002 (= lt!416557 (lemmaListMapApplyFromThenApplyFromZero!67 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926003 () Bool)

(declare-fun res!623788 () Bool)

(assert (=> b!926003 (=> (not res!623788) (not e!519763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55465 (_ BitVec 32)) Bool)

(assert (=> b!926003 (= res!623788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79170 res!623783) b!925993))

(assert (= (and b!925993 res!623785) b!926003))

(assert (= (and b!926003 res!623788) b!925987))

(assert (= (and b!925987 res!623790) b!925992))

(assert (= (and b!925992 res!623789) b!925986))

(assert (= (and b!925986 res!623786) b!925984))

(assert (= (and b!925984 res!623782) b!925998))

(assert (= (and b!925998 c!96809) b!925994))

(assert (= (and b!925998 (not c!96809)) b!925999))

(assert (= (and b!925994 c!96810) b!925990))

(assert (= (and b!925994 (not c!96810)) b!925988))

(assert (= (and b!925990 c!96808) b!925995))

(assert (= (and b!925990 (not c!96808)) b!925997))

(assert (= (and b!925998 res!623787) b!926000))

(assert (= (and b!926000 res!623781) b!926001))

(assert (= (and b!926001 res!623784) b!926002))

(assert (= (and b!926002 res!623780) b!925985))

(assert (= (and b!925991 condMapEmpty!31341) mapIsEmpty!31341))

(assert (= (and b!925991 (not condMapEmpty!31341)) mapNonEmpty!31341))

(get-info :version)

(assert (= (and mapNonEmpty!31341 ((_ is ValueCellFull!9380) mapValue!31341)) b!925996))

(assert (= (and b!925991 ((_ is ValueCellFull!9380) mapDefault!31341)) b!925989))

(assert (= start!79170 b!925991))

(declare-fun b_lambda!13731 () Bool)

(assert (=> (not b_lambda!13731) (not b!925990)))

(declare-fun t!26655 () Bool)

(declare-fun tb!5787 () Bool)

(assert (=> (and start!79170 (= defaultEntry!1235 defaultEntry!1235) t!26655) tb!5787))

(declare-fun result!11405 () Bool)

(assert (=> tb!5787 (= result!11405 tp_is_empty!19723)))

(assert (=> b!925990 t!26655))

(declare-fun b_and!28179 () Bool)

(assert (= b_and!28177 (and (=> t!26655 result!11405) b_and!28179)))

(declare-fun m!860749 () Bool)

(assert (=> start!79170 m!860749))

(declare-fun m!860751 () Bool)

(assert (=> start!79170 m!860751))

(declare-fun m!860753 () Bool)

(assert (=> start!79170 m!860753))

(declare-fun m!860755 () Bool)

(assert (=> b!926003 m!860755))

(declare-fun m!860757 () Bool)

(assert (=> b!925987 m!860757))

(declare-fun m!860759 () Bool)

(assert (=> b!925984 m!860759))

(declare-fun m!860761 () Bool)

(assert (=> b!925998 m!860761))

(declare-fun m!860763 () Bool)

(assert (=> b!925986 m!860763))

(declare-fun m!860765 () Bool)

(assert (=> b!925986 m!860765))

(declare-fun m!860767 () Bool)

(assert (=> b!925985 m!860767))

(declare-fun m!860769 () Bool)

(assert (=> mapNonEmpty!31341 m!860769))

(declare-fun m!860771 () Bool)

(assert (=> b!925994 m!860771))

(declare-fun m!860773 () Bool)

(assert (=> b!925994 m!860773))

(declare-fun m!860775 () Bool)

(assert (=> b!926002 m!860775))

(declare-fun m!860777 () Bool)

(assert (=> b!926002 m!860777))

(declare-fun m!860779 () Bool)

(assert (=> b!926002 m!860779))

(declare-fun m!860781 () Bool)

(assert (=> b!926001 m!860781))

(declare-fun m!860783 () Bool)

(assert (=> b!926000 m!860783))

(declare-fun m!860785 () Bool)

(assert (=> b!926000 m!860785))

(declare-fun m!860787 () Bool)

(assert (=> b!925990 m!860787))

(declare-fun m!860789 () Bool)

(assert (=> b!925990 m!860789))

(declare-fun m!860791 () Bool)

(assert (=> b!925990 m!860791))

(declare-fun m!860793 () Bool)

(assert (=> b!925990 m!860793))

(declare-fun m!860795 () Bool)

(assert (=> b!925990 m!860795))

(declare-fun m!860797 () Bool)

(assert (=> b!925990 m!860797))

(declare-fun m!860799 () Bool)

(assert (=> b!925990 m!860799))

(assert (=> b!925990 m!860785))

(declare-fun m!860801 () Bool)

(assert (=> b!925990 m!860801))

(declare-fun m!860803 () Bool)

(assert (=> b!925990 m!860803))

(declare-fun m!860805 () Bool)

(assert (=> b!925990 m!860805))

(assert (=> b!925990 m!860793))

(assert (=> b!925990 m!860795))

(declare-fun m!860807 () Bool)

(assert (=> b!925990 m!860807))

(declare-fun m!860809 () Bool)

(assert (=> b!925990 m!860809))

(assert (=> b!925990 m!860797))

(declare-fun m!860811 () Bool)

(assert (=> b!925990 m!860811))

(declare-fun m!860813 () Bool)

(assert (=> b!925990 m!860813))

(declare-fun m!860815 () Bool)

(assert (=> b!925990 m!860815))

(declare-fun m!860817 () Bool)

(assert (=> b!925995 m!860817))

(check-sat (not b!925994) tp_is_empty!19723 (not b!926001) (not b!925985) (not mapNonEmpty!31341) (not b!926002) (not b!925995) b_and!28179 (not b!926000) (not b!925998) (not b!925984) (not b!925990) (not b_next!17215) (not start!79170) (not b!925986) (not b_lambda!13731) (not b!926003) (not b!925987))
(check-sat b_and!28179 (not b_next!17215))
