; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79026 () Bool)

(assert start!79026)

(declare-fun b_free!17257 () Bool)

(declare-fun b_next!17257 () Bool)

(assert (=> start!79026 (= b_free!17257 (not b_next!17257))))

(declare-fun tp!60213 () Bool)

(declare-fun b_and!28225 () Bool)

(assert (=> start!79026 (= tp!60213 b_and!28225)))

(declare-fun b!926144 () Bool)

(declare-fun e!519847 () Bool)

(declare-fun tp_is_empty!19765 () Bool)

(assert (=> b!926144 (= e!519847 tp_is_empty!19765)))

(declare-fun b!926145 () Bool)

(declare-fun e!519853 () Bool)

(declare-fun e!519851 () Bool)

(assert (=> b!926145 (= e!519853 e!519851)))

(declare-fun res!624019 () Bool)

(assert (=> b!926145 (=> (not res!624019) (not e!519851))))

(declare-datatypes ((V!31319 0))(
  ( (V!31320 (val!9933 Int)) )
))
(declare-fun lt!416960 () V!31319)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31319)

(assert (=> b!926145 (= res!624019 (and (= lt!416960 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13018 0))(
  ( (tuple2!13019 (_1!6520 (_ BitVec 64)) (_2!6520 V!31319)) )
))
(declare-datatypes ((List!18790 0))(
  ( (Nil!18787) (Cons!18786 (h!19932 tuple2!13018) (t!26768 List!18790)) )
))
(declare-datatypes ((ListLongMap!11705 0))(
  ( (ListLongMap!11706 (toList!5868 List!18790)) )
))
(declare-fun lt!416966 () ListLongMap!11705)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!679 (ListLongMap!11705 (_ BitVec 64)) V!31319)

(assert (=> b!926145 (= lt!416960 (apply!679 lt!416966 k0!1099))))

(declare-fun b!926146 () Bool)

(declare-fun res!624024 () Bool)

(declare-fun e!519857 () Bool)

(assert (=> b!926146 (=> (not res!624024) (not e!519857))))

(declare-datatypes ((array!55469 0))(
  ( (array!55470 (arr!26680 (Array (_ BitVec 32) (_ BitVec 64))) (size!27141 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55469)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9401 0))(
  ( (ValueCellFull!9401 (v!12450 V!31319)) (EmptyCell!9401) )
))
(declare-datatypes ((array!55471 0))(
  ( (array!55472 (arr!26681 (Array (_ BitVec 32) ValueCell!9401)) (size!27142 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55471)

(assert (=> b!926146 (= res!624024 (and (= (size!27142 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27141 _keys!1487) (size!27142 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926147 () Bool)

(declare-fun e!519848 () Bool)

(declare-fun e!519854 () Bool)

(assert (=> b!926147 (= e!519848 e!519854)))

(declare-fun res!624027 () Bool)

(assert (=> b!926147 (=> (not res!624027) (not e!519854))))

(declare-fun lt!416972 () ListLongMap!11705)

(declare-fun contains!4880 (ListLongMap!11705 (_ BitVec 64)) Bool)

(assert (=> b!926147 (= res!624027 (contains!4880 lt!416972 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31319)

(declare-fun minValue!1173 () V!31319)

(declare-fun getCurrentListMap!3054 (array!55469 array!55471 (_ BitVec 32) (_ BitVec 32) V!31319 V!31319 (_ BitVec 32) Int) ListLongMap!11705)

(assert (=> b!926147 (= lt!416972 (getCurrentListMap!3054 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926148 () Bool)

(declare-fun res!624023 () Bool)

(assert (=> b!926148 (=> (not res!624023) (not e!519857))))

(assert (=> b!926148 (= res!624023 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27141 _keys!1487))))))

(declare-fun b!926149 () Bool)

(declare-datatypes ((Unit!31221 0))(
  ( (Unit!31222) )
))
(declare-fun e!519855 () Unit!31221)

(declare-fun e!519846 () Unit!31221)

(assert (=> b!926149 (= e!519855 e!519846)))

(declare-fun lt!416962 () (_ BitVec 64))

(assert (=> b!926149 (= lt!416962 (select (arr!26680 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96650 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926149 (= c!96650 (validKeyInArray!0 lt!416962))))

(declare-fun b!926150 () Bool)

(assert (=> b!926150 (= e!519851 e!519848)))

(declare-fun res!624028 () Bool)

(assert (=> b!926150 (=> (not res!624028) (not e!519848))))

(assert (=> b!926150 (= res!624028 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27141 _keys!1487)))))

(declare-fun lt!416957 () Unit!31221)

(assert (=> b!926150 (= lt!416957 e!519855)))

(declare-fun c!96652 () Bool)

(assert (=> b!926150 (= c!96652 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31404 () Bool)

(declare-fun mapRes!31404 () Bool)

(declare-fun tp!60212 () Bool)

(assert (=> mapNonEmpty!31404 (= mapRes!31404 (and tp!60212 e!519847))))

(declare-fun mapKey!31404 () (_ BitVec 32))

(declare-fun mapValue!31404 () ValueCell!9401)

(declare-fun mapRest!31404 () (Array (_ BitVec 32) ValueCell!9401))

(assert (=> mapNonEmpty!31404 (= (arr!26681 _values!1231) (store mapRest!31404 mapKey!31404 mapValue!31404))))

(declare-fun b!926151 () Bool)

(declare-fun lt!416967 () ListLongMap!11705)

(declare-fun e!519850 () Bool)

(assert (=> b!926151 (= e!519850 (= (apply!679 lt!416967 k0!1099) v!791))))

(declare-fun b!926152 () Bool)

(declare-fun e!519852 () Bool)

(assert (=> b!926152 (= e!519852 tp_is_empty!19765)))

(declare-fun res!624029 () Bool)

(assert (=> start!79026 (=> (not res!624029) (not e!519857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79026 (= res!624029 (validMask!0 mask!1881))))

(assert (=> start!79026 e!519857))

(assert (=> start!79026 true))

(assert (=> start!79026 tp_is_empty!19765))

(declare-fun e!519856 () Bool)

(declare-fun array_inv!20860 (array!55471) Bool)

(assert (=> start!79026 (and (array_inv!20860 _values!1231) e!519856)))

(assert (=> start!79026 tp!60213))

(declare-fun array_inv!20861 (array!55469) Bool)

(assert (=> start!79026 (array_inv!20861 _keys!1487)))

(declare-fun b!926153 () Bool)

(declare-fun e!519858 () Bool)

(declare-fun arrayContainsKey!0 (array!55469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926153 (= e!519858 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!926154 () Bool)

(declare-fun Unit!31223 () Unit!31221)

(assert (=> b!926154 (= e!519846 Unit!31223)))

(declare-fun b!926155 () Bool)

(declare-fun res!624021 () Bool)

(assert (=> b!926155 (=> (not res!624021) (not e!519857))))

(declare-datatypes ((List!18791 0))(
  ( (Nil!18788) (Cons!18787 (h!19933 (_ BitVec 64)) (t!26769 List!18791)) )
))
(declare-fun arrayNoDuplicates!0 (array!55469 (_ BitVec 32) List!18791) Bool)

(assert (=> b!926155 (= res!624021 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18788))))

(declare-fun b!926156 () Bool)

(declare-fun lt!416964 () ListLongMap!11705)

(assert (=> b!926156 (= (apply!679 lt!416964 k0!1099) lt!416960)))

(declare-fun lt!416959 () V!31319)

(declare-fun lt!416970 () Unit!31221)

(declare-fun addApplyDifferent!388 (ListLongMap!11705 (_ BitVec 64) V!31319 (_ BitVec 64)) Unit!31221)

(assert (=> b!926156 (= lt!416970 (addApplyDifferent!388 lt!416966 lt!416962 lt!416959 k0!1099))))

(assert (=> b!926156 (not (= lt!416962 k0!1099))))

(declare-fun lt!416958 () Unit!31221)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55469 (_ BitVec 64) (_ BitVec 32) List!18791) Unit!31221)

(assert (=> b!926156 (= lt!416958 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18788))))

(assert (=> b!926156 e!519858))

(declare-fun c!96651 () Bool)

(assert (=> b!926156 (= c!96651 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416961 () Unit!31221)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!248 (array!55469 array!55471 (_ BitVec 32) (_ BitVec 32) V!31319 V!31319 (_ BitVec 64) (_ BitVec 32) Int) Unit!31221)

(assert (=> b!926156 (= lt!416961 (lemmaListMapContainsThenArrayContainsFrom!248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!926156 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18788)))

(declare-fun lt!416968 () Unit!31221)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55469 (_ BitVec 32) (_ BitVec 32)) Unit!31221)

(assert (=> b!926156 (= lt!416968 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926156 (contains!4880 lt!416964 k0!1099)))

(declare-fun lt!416963 () tuple2!13018)

(declare-fun +!2760 (ListLongMap!11705 tuple2!13018) ListLongMap!11705)

(assert (=> b!926156 (= lt!416964 (+!2760 lt!416966 lt!416963))))

(declare-fun lt!416965 () Unit!31221)

(declare-fun addStillContains!457 (ListLongMap!11705 (_ BitVec 64) V!31319 (_ BitVec 64)) Unit!31221)

(assert (=> b!926156 (= lt!416965 (addStillContains!457 lt!416966 lt!416962 lt!416959 k0!1099))))

(assert (=> b!926156 (= (getCurrentListMap!3054 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2760 (getCurrentListMap!3054 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416963))))

(assert (=> b!926156 (= lt!416963 (tuple2!13019 lt!416962 lt!416959))))

(declare-fun get!14041 (ValueCell!9401 V!31319) V!31319)

(declare-fun dynLambda!1516 (Int (_ BitVec 64)) V!31319)

(assert (=> b!926156 (= lt!416959 (get!14041 (select (arr!26681 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1516 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416969 () Unit!31221)

(declare-fun lemmaListMapRecursiveValidKeyArray!124 (array!55469 array!55471 (_ BitVec 32) (_ BitVec 32) V!31319 V!31319 (_ BitVec 32) Int) Unit!31221)

(assert (=> b!926156 (= lt!416969 (lemmaListMapRecursiveValidKeyArray!124 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926156 (= e!519846 lt!416970)))

(declare-fun b!926157 () Bool)

(declare-fun Unit!31224 () Unit!31221)

(assert (=> b!926157 (= e!519855 Unit!31224)))

(declare-fun b!926158 () Bool)

(assert (=> b!926158 (= e!519857 e!519853)))

(declare-fun res!624022 () Bool)

(assert (=> b!926158 (=> (not res!624022) (not e!519853))))

(assert (=> b!926158 (= res!624022 (contains!4880 lt!416966 k0!1099))))

(assert (=> b!926158 (= lt!416966 (getCurrentListMap!3054 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926159 () Bool)

(assert (=> b!926159 (= e!519856 (and e!519852 mapRes!31404))))

(declare-fun condMapEmpty!31404 () Bool)

(declare-fun mapDefault!31404 () ValueCell!9401)

(assert (=> b!926159 (= condMapEmpty!31404 (= (arr!26681 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9401)) mapDefault!31404)))))

(declare-fun b!926160 () Bool)

(assert (=> b!926160 (= e!519858 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926161 () Bool)

(assert (=> b!926161 (= e!519854 (not true))))

(assert (=> b!926161 e!519850))

(declare-fun res!624025 () Bool)

(assert (=> b!926161 (=> (not res!624025) (not e!519850))))

(assert (=> b!926161 (= res!624025 (contains!4880 lt!416967 k0!1099))))

(assert (=> b!926161 (= lt!416967 (getCurrentListMap!3054 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!416971 () Unit!31221)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!84 (array!55469 array!55471 (_ BitVec 32) (_ BitVec 32) V!31319 V!31319 (_ BitVec 64) V!31319 (_ BitVec 32) Int) Unit!31221)

(assert (=> b!926161 (= lt!416971 (lemmaListMapApplyFromThenApplyFromZero!84 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926162 () Bool)

(declare-fun res!624020 () Bool)

(assert (=> b!926162 (=> (not res!624020) (not e!519854))))

(assert (=> b!926162 (= res!624020 (= (apply!679 lt!416972 k0!1099) v!791))))

(declare-fun mapIsEmpty!31404 () Bool)

(assert (=> mapIsEmpty!31404 mapRes!31404))

(declare-fun b!926163 () Bool)

(declare-fun res!624026 () Bool)

(assert (=> b!926163 (=> (not res!624026) (not e!519857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55469 (_ BitVec 32)) Bool)

(assert (=> b!926163 (= res!624026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79026 res!624029) b!926146))

(assert (= (and b!926146 res!624024) b!926163))

(assert (= (and b!926163 res!624026) b!926155))

(assert (= (and b!926155 res!624021) b!926148))

(assert (= (and b!926148 res!624023) b!926158))

(assert (= (and b!926158 res!624022) b!926145))

(assert (= (and b!926145 res!624019) b!926150))

(assert (= (and b!926150 c!96652) b!926149))

(assert (= (and b!926150 (not c!96652)) b!926157))

(assert (= (and b!926149 c!96650) b!926156))

(assert (= (and b!926149 (not c!96650)) b!926154))

(assert (= (and b!926156 c!96651) b!926153))

(assert (= (and b!926156 (not c!96651)) b!926160))

(assert (= (and b!926150 res!624028) b!926147))

(assert (= (and b!926147 res!624027) b!926162))

(assert (= (and b!926162 res!624020) b!926161))

(assert (= (and b!926161 res!624025) b!926151))

(assert (= (and b!926159 condMapEmpty!31404) mapIsEmpty!31404))

(assert (= (and b!926159 (not condMapEmpty!31404)) mapNonEmpty!31404))

(get-info :version)

(assert (= (and mapNonEmpty!31404 ((_ is ValueCellFull!9401) mapValue!31404)) b!926144))

(assert (= (and b!926159 ((_ is ValueCellFull!9401) mapDefault!31404)) b!926152))

(assert (= start!79026 b!926159))

(declare-fun b_lambda!13741 () Bool)

(assert (=> (not b_lambda!13741) (not b!926156)))

(declare-fun t!26767 () Bool)

(declare-fun tb!5829 () Bool)

(assert (=> (and start!79026 (= defaultEntry!1235 defaultEntry!1235) t!26767) tb!5829))

(declare-fun result!11489 () Bool)

(assert (=> tb!5829 (= result!11489 tp_is_empty!19765)))

(assert (=> b!926156 t!26767))

(declare-fun b_and!28227 () Bool)

(assert (= b_and!28225 (and (=> t!26767 result!11489) b_and!28227)))

(declare-fun m!860167 () Bool)

(assert (=> b!926153 m!860167))

(declare-fun m!860169 () Bool)

(assert (=> b!926155 m!860169))

(declare-fun m!860171 () Bool)

(assert (=> b!926161 m!860171))

(declare-fun m!860173 () Bool)

(assert (=> b!926161 m!860173))

(declare-fun m!860175 () Bool)

(assert (=> b!926161 m!860175))

(declare-fun m!860177 () Bool)

(assert (=> b!926156 m!860177))

(declare-fun m!860179 () Bool)

(assert (=> b!926156 m!860179))

(declare-fun m!860181 () Bool)

(assert (=> b!926156 m!860181))

(declare-fun m!860183 () Bool)

(assert (=> b!926156 m!860183))

(declare-fun m!860185 () Bool)

(assert (=> b!926156 m!860185))

(assert (=> b!926156 m!860183))

(assert (=> b!926156 m!860185))

(declare-fun m!860187 () Bool)

(assert (=> b!926156 m!860187))

(declare-fun m!860189 () Bool)

(assert (=> b!926156 m!860189))

(declare-fun m!860191 () Bool)

(assert (=> b!926156 m!860191))

(declare-fun m!860193 () Bool)

(assert (=> b!926156 m!860193))

(declare-fun m!860195 () Bool)

(assert (=> b!926156 m!860195))

(declare-fun m!860197 () Bool)

(assert (=> b!926156 m!860197))

(declare-fun m!860199 () Bool)

(assert (=> b!926156 m!860199))

(declare-fun m!860201 () Bool)

(assert (=> b!926156 m!860201))

(declare-fun m!860203 () Bool)

(assert (=> b!926156 m!860203))

(declare-fun m!860205 () Bool)

(assert (=> b!926156 m!860205))

(assert (=> b!926156 m!860177))

(declare-fun m!860207 () Bool)

(assert (=> b!926156 m!860207))

(declare-fun m!860209 () Bool)

(assert (=> b!926149 m!860209))

(declare-fun m!860211 () Bool)

(assert (=> b!926149 m!860211))

(declare-fun m!860213 () Bool)

(assert (=> b!926162 m!860213))

(declare-fun m!860215 () Bool)

(assert (=> b!926158 m!860215))

(declare-fun m!860217 () Bool)

(assert (=> b!926158 m!860217))

(declare-fun m!860219 () Bool)

(assert (=> start!79026 m!860219))

(declare-fun m!860221 () Bool)

(assert (=> start!79026 m!860221))

(declare-fun m!860223 () Bool)

(assert (=> start!79026 m!860223))

(declare-fun m!860225 () Bool)

(assert (=> b!926151 m!860225))

(declare-fun m!860227 () Bool)

(assert (=> b!926145 m!860227))

(declare-fun m!860229 () Bool)

(assert (=> mapNonEmpty!31404 m!860229))

(declare-fun m!860231 () Bool)

(assert (=> b!926163 m!860231))

(declare-fun m!860233 () Bool)

(assert (=> b!926150 m!860233))

(declare-fun m!860235 () Bool)

(assert (=> b!926147 m!860235))

(assert (=> b!926147 m!860189))

(check-sat (not b!926163) (not b!926153) (not b!926150) b_and!28227 (not b!926158) (not b!926151) (not b!926162) (not mapNonEmpty!31404) (not b!926161) (not b!926145) (not b!926147) (not b!926149) (not b!926155) (not b_next!17257) (not start!79026) (not b!926156) tp_is_empty!19765 (not b_lambda!13741))
(check-sat b_and!28227 (not b_next!17257))
