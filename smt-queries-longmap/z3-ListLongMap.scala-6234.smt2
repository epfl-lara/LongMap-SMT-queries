; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79844 () Bool)

(assert start!79844)

(declare-fun b_free!17725 () Bool)

(declare-fun b_next!17725 () Bool)

(assert (=> start!79844 (= b_free!17725 (not b_next!17725))))

(declare-fun tp!61632 () Bool)

(declare-fun b_and!29051 () Bool)

(assert (=> start!79844 (= tp!61632 b_and!29051)))

(declare-fun b!937991 () Bool)

(declare-fun res!631152 () Bool)

(declare-fun e!526782 () Bool)

(assert (=> b!937991 (=> (not res!631152) (not e!526782))))

(declare-datatypes ((array!56457 0))(
  ( (array!56458 (arr!27164 (Array (_ BitVec 32) (_ BitVec 64))) (size!27624 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56457)

(declare-datatypes ((List!19120 0))(
  ( (Nil!19117) (Cons!19116 (h!20268 (_ BitVec 64)) (t!27381 List!19120)) )
))
(declare-fun arrayNoDuplicates!0 (array!56457 (_ BitVec 32) List!19120) Bool)

(assert (=> b!937991 (= res!631152 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19117))))

(declare-fun b!937992 () Bool)

(declare-datatypes ((Unit!31610 0))(
  ( (Unit!31611) )
))
(declare-fun e!526786 () Unit!31610)

(declare-fun Unit!31612 () Unit!31610)

(assert (=> b!937992 (= e!526786 Unit!31612)))

(declare-fun b!937993 () Bool)

(declare-fun e!526784 () Unit!31610)

(declare-fun Unit!31613 () Unit!31610)

(assert (=> b!937993 (= e!526784 Unit!31613)))

(declare-fun mapIsEmpty!32121 () Bool)

(declare-fun mapRes!32121 () Bool)

(assert (=> mapIsEmpty!32121 mapRes!32121))

(declare-fun b!937994 () Bool)

(declare-fun res!631151 () Bool)

(assert (=> b!937994 (=> (not res!631151) (not e!526782))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31943 0))(
  ( (V!31944 (val!10167 Int)) )
))
(declare-datatypes ((ValueCell!9635 0))(
  ( (ValueCellFull!9635 (v!12689 V!31943)) (EmptyCell!9635) )
))
(declare-datatypes ((array!56459 0))(
  ( (array!56460 (arr!27165 (Array (_ BitVec 32) ValueCell!9635)) (size!27625 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56459)

(assert (=> b!937994 (= res!631151 (and (= (size!27625 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27624 _keys!1487) (size!27625 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937995 () Bool)

(declare-datatypes ((tuple2!13340 0))(
  ( (tuple2!13341 (_1!6681 (_ BitVec 64)) (_2!6681 V!31943)) )
))
(declare-datatypes ((List!19121 0))(
  ( (Nil!19118) (Cons!19117 (h!20269 tuple2!13340) (t!27382 List!19121)) )
))
(declare-datatypes ((ListLongMap!12039 0))(
  ( (ListLongMap!12040 (toList!6035 List!19121)) )
))
(declare-fun lt!423091 () ListLongMap!12039)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!423099 () V!31943)

(declare-fun apply!853 (ListLongMap!12039 (_ BitVec 64)) V!31943)

(assert (=> b!937995 (= (apply!853 lt!423091 k0!1099) lt!423099)))

(declare-fun lt!423101 () V!31943)

(declare-fun lt!423092 () Unit!31610)

(declare-fun lt!423102 () ListLongMap!12039)

(declare-fun lt!423098 () (_ BitVec 64))

(declare-fun addApplyDifferent!429 (ListLongMap!12039 (_ BitVec 64) V!31943 (_ BitVec 64)) Unit!31610)

(assert (=> b!937995 (= lt!423092 (addApplyDifferent!429 lt!423102 lt!423098 lt!423101 k0!1099))))

(assert (=> b!937995 (not (= lt!423098 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!423094 () Unit!31610)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56457 (_ BitVec 64) (_ BitVec 32) List!19120) Unit!31610)

(assert (=> b!937995 (= lt!423094 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19117))))

(declare-fun e!526781 () Bool)

(assert (=> b!937995 e!526781))

(declare-fun c!97797 () Bool)

(assert (=> b!937995 (= c!97797 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423095 () Unit!31610)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31943)

(declare-fun minValue!1173 () V!31943)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!299 (array!56457 array!56459 (_ BitVec 32) (_ BitVec 32) V!31943 V!31943 (_ BitVec 64) (_ BitVec 32) Int) Unit!31610)

(assert (=> b!937995 (= lt!423095 (lemmaListMapContainsThenArrayContainsFrom!299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!937995 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19117)))

(declare-fun lt!423097 () Unit!31610)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56457 (_ BitVec 32) (_ BitVec 32)) Unit!31610)

(assert (=> b!937995 (= lt!423097 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5106 (ListLongMap!12039 (_ BitVec 64)) Bool)

(assert (=> b!937995 (contains!5106 lt!423091 k0!1099)))

(declare-fun lt!423100 () tuple2!13340)

(declare-fun +!2845 (ListLongMap!12039 tuple2!13340) ListLongMap!12039)

(assert (=> b!937995 (= lt!423091 (+!2845 lt!423102 lt!423100))))

(declare-fun lt!423090 () Unit!31610)

(declare-fun addStillContains!548 (ListLongMap!12039 (_ BitVec 64) V!31943 (_ BitVec 64)) Unit!31610)

(assert (=> b!937995 (= lt!423090 (addStillContains!548 lt!423102 lt!423098 lt!423101 k0!1099))))

(declare-fun getCurrentListMap!3271 (array!56457 array!56459 (_ BitVec 32) (_ BitVec 32) V!31943 V!31943 (_ BitVec 32) Int) ListLongMap!12039)

(assert (=> b!937995 (= (getCurrentListMap!3271 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2845 (getCurrentListMap!3271 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423100))))

(assert (=> b!937995 (= lt!423100 (tuple2!13341 lt!423098 lt!423101))))

(declare-fun get!14337 (ValueCell!9635 V!31943) V!31943)

(declare-fun dynLambda!1642 (Int (_ BitVec 64)) V!31943)

(assert (=> b!937995 (= lt!423101 (get!14337 (select (arr!27165 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1642 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423093 () Unit!31610)

(declare-fun lemmaListMapRecursiveValidKeyArray!225 (array!56457 array!56459 (_ BitVec 32) (_ BitVec 32) V!31943 V!31943 (_ BitVec 32) Int) Unit!31610)

(assert (=> b!937995 (= lt!423093 (lemmaListMapRecursiveValidKeyArray!225 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937995 (= e!526784 lt!423092)))

(declare-fun b!937996 () Bool)

(declare-fun e!526780 () Bool)

(declare-fun e!526788 () Bool)

(assert (=> b!937996 (= e!526780 e!526788)))

(declare-fun res!631154 () Bool)

(assert (=> b!937996 (=> (not res!631154) (not e!526788))))

(declare-fun v!791 () V!31943)

(assert (=> b!937996 (= res!631154 (and (= lt!423099 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937996 (= lt!423099 (apply!853 lt!423102 k0!1099))))

(declare-fun b!937997 () Bool)

(declare-fun e!526785 () Bool)

(declare-fun tp_is_empty!20233 () Bool)

(assert (=> b!937997 (= e!526785 tp_is_empty!20233)))

(declare-fun b!937998 () Bool)

(declare-fun e!526783 () Bool)

(assert (=> b!937998 (= e!526783 tp_is_empty!20233)))

(declare-fun b!937999 () Bool)

(assert (=> b!937999 (= e!526786 e!526784)))

(assert (=> b!937999 (= lt!423098 (select (arr!27164 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97795 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937999 (= c!97795 (validKeyInArray!0 lt!423098))))

(declare-fun b!938000 () Bool)

(declare-fun res!631149 () Bool)

(assert (=> b!938000 (=> (not res!631149) (not e!526782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56457 (_ BitVec 32)) Bool)

(assert (=> b!938000 (= res!631149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!938002 () Bool)

(assert (=> b!938002 (= e!526782 e!526780)))

(declare-fun res!631153 () Bool)

(assert (=> b!938002 (=> (not res!631153) (not e!526780))))

(assert (=> b!938002 (= res!631153 (contains!5106 lt!423102 k0!1099))))

(assert (=> b!938002 (= lt!423102 (getCurrentListMap!3271 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!32121 () Bool)

(declare-fun tp!61631 () Bool)

(assert (=> mapNonEmpty!32121 (= mapRes!32121 (and tp!61631 e!526785))))

(declare-fun mapValue!32121 () ValueCell!9635)

(declare-fun mapKey!32121 () (_ BitVec 32))

(declare-fun mapRest!32121 () (Array (_ BitVec 32) ValueCell!9635))

(assert (=> mapNonEmpty!32121 (= (arr!27165 _values!1231) (store mapRest!32121 mapKey!32121 mapValue!32121))))

(declare-fun b!938003 () Bool)

(declare-fun arrayContainsKey!0 (array!56457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!938003 (= e!526781 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938004 () Bool)

(assert (=> b!938004 (= e!526788 false)))

(declare-fun lt!423096 () Unit!31610)

(assert (=> b!938004 (= lt!423096 e!526786)))

(declare-fun c!97796 () Bool)

(assert (=> b!938004 (= c!97796 (validKeyInArray!0 k0!1099))))

(declare-fun b!938005 () Bool)

(assert (=> b!938005 (= e!526781 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!938006 () Bool)

(declare-fun res!631155 () Bool)

(assert (=> b!938006 (=> (not res!631155) (not e!526782))))

(assert (=> b!938006 (= res!631155 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27624 _keys!1487))))))

(declare-fun b!938001 () Bool)

(declare-fun e!526779 () Bool)

(assert (=> b!938001 (= e!526779 (and e!526783 mapRes!32121))))

(declare-fun condMapEmpty!32121 () Bool)

(declare-fun mapDefault!32121 () ValueCell!9635)

(assert (=> b!938001 (= condMapEmpty!32121 (= (arr!27165 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9635)) mapDefault!32121)))))

(declare-fun res!631150 () Bool)

(assert (=> start!79844 (=> (not res!631150) (not e!526782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79844 (= res!631150 (validMask!0 mask!1881))))

(assert (=> start!79844 e!526782))

(assert (=> start!79844 true))

(assert (=> start!79844 tp_is_empty!20233))

(declare-fun array_inv!21212 (array!56459) Bool)

(assert (=> start!79844 (and (array_inv!21212 _values!1231) e!526779)))

(assert (=> start!79844 tp!61632))

(declare-fun array_inv!21213 (array!56457) Bool)

(assert (=> start!79844 (array_inv!21213 _keys!1487)))

(assert (= (and start!79844 res!631150) b!937994))

(assert (= (and b!937994 res!631151) b!938000))

(assert (= (and b!938000 res!631149) b!937991))

(assert (= (and b!937991 res!631152) b!938006))

(assert (= (and b!938006 res!631155) b!938002))

(assert (= (and b!938002 res!631153) b!937996))

(assert (= (and b!937996 res!631154) b!938004))

(assert (= (and b!938004 c!97796) b!937999))

(assert (= (and b!938004 (not c!97796)) b!937992))

(assert (= (and b!937999 c!97795) b!937995))

(assert (= (and b!937999 (not c!97795)) b!937993))

(assert (= (and b!937995 c!97797) b!938003))

(assert (= (and b!937995 (not c!97797)) b!938005))

(assert (= (and b!938001 condMapEmpty!32121) mapIsEmpty!32121))

(assert (= (and b!938001 (not condMapEmpty!32121)) mapNonEmpty!32121))

(get-info :version)

(assert (= (and mapNonEmpty!32121 ((_ is ValueCellFull!9635) mapValue!32121)) b!937997))

(assert (= (and b!938001 ((_ is ValueCellFull!9635) mapDefault!32121)) b!937998))

(assert (= start!79844 b!938001))

(declare-fun b_lambda!14145 () Bool)

(assert (=> (not b_lambda!14145) (not b!937995)))

(declare-fun t!27380 () Bool)

(declare-fun tb!6111 () Bool)

(assert (=> (and start!79844 (= defaultEntry!1235 defaultEntry!1235) t!27380) tb!6111))

(declare-fun result!12063 () Bool)

(assert (=> tb!6111 (= result!12063 tp_is_empty!20233)))

(assert (=> b!937995 t!27380))

(declare-fun b_and!29053 () Bool)

(assert (= b_and!29051 (and (=> t!27380 result!12063) b_and!29053)))

(declare-fun m!873089 () Bool)

(assert (=> b!937996 m!873089))

(declare-fun m!873091 () Bool)

(assert (=> mapNonEmpty!32121 m!873091))

(declare-fun m!873093 () Bool)

(assert (=> b!937991 m!873093))

(declare-fun m!873095 () Bool)

(assert (=> b!937995 m!873095))

(declare-fun m!873097 () Bool)

(assert (=> b!937995 m!873097))

(declare-fun m!873099 () Bool)

(assert (=> b!937995 m!873099))

(declare-fun m!873101 () Bool)

(assert (=> b!937995 m!873101))

(declare-fun m!873103 () Bool)

(assert (=> b!937995 m!873103))

(declare-fun m!873105 () Bool)

(assert (=> b!937995 m!873105))

(declare-fun m!873107 () Bool)

(assert (=> b!937995 m!873107))

(declare-fun m!873109 () Bool)

(assert (=> b!937995 m!873109))

(declare-fun m!873111 () Bool)

(assert (=> b!937995 m!873111))

(declare-fun m!873113 () Bool)

(assert (=> b!937995 m!873113))

(declare-fun m!873115 () Bool)

(assert (=> b!937995 m!873115))

(declare-fun m!873117 () Bool)

(assert (=> b!937995 m!873117))

(declare-fun m!873119 () Bool)

(assert (=> b!937995 m!873119))

(declare-fun m!873121 () Bool)

(assert (=> b!937995 m!873121))

(assert (=> b!937995 m!873103))

(assert (=> b!937995 m!873105))

(declare-fun m!873123 () Bool)

(assert (=> b!937995 m!873123))

(assert (=> b!937995 m!873111))

(declare-fun m!873125 () Bool)

(assert (=> b!937995 m!873125))

(declare-fun m!873127 () Bool)

(assert (=> b!937999 m!873127))

(declare-fun m!873129 () Bool)

(assert (=> b!937999 m!873129))

(declare-fun m!873131 () Bool)

(assert (=> b!938004 m!873131))

(declare-fun m!873133 () Bool)

(assert (=> b!938003 m!873133))

(declare-fun m!873135 () Bool)

(assert (=> b!938002 m!873135))

(declare-fun m!873137 () Bool)

(assert (=> b!938002 m!873137))

(declare-fun m!873139 () Bool)

(assert (=> b!938000 m!873139))

(declare-fun m!873141 () Bool)

(assert (=> start!79844 m!873141))

(declare-fun m!873143 () Bool)

(assert (=> start!79844 m!873143))

(declare-fun m!873145 () Bool)

(assert (=> start!79844 m!873145))

(check-sat (not b!938004) (not b!937995) tp_is_empty!20233 (not b!938000) (not b!938002) (not mapNonEmpty!32121) (not b_lambda!14145) (not b!937996) (not b!937999) b_and!29053 (not b!938003) (not start!79844) (not b!937991) (not b_next!17725))
(check-sat b_and!29053 (not b_next!17725))
