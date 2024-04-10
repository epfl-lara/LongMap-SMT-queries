; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78992 () Bool)

(assert start!78992)

(declare-fun b_free!17205 () Bool)

(declare-fun b_next!17205 () Bool)

(assert (=> start!78992 (= b_free!17205 (not b_next!17205))))

(declare-fun tp!60056 () Bool)

(declare-fun b_and!28147 () Bool)

(assert (=> start!78992 (= tp!60056 b_and!28147)))

(declare-fun b!924797 () Bool)

(declare-fun e!518996 () Bool)

(declare-fun e!518995 () Bool)

(assert (=> b!924797 (= e!518996 e!518995)))

(declare-fun res!623297 () Bool)

(assert (=> b!924797 (=> (not res!623297) (not e!518995))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55394 0))(
  ( (array!55395 (arr!26642 (Array (_ BitVec 32) (_ BitVec 64))) (size!27101 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55394)

(assert (=> b!924797 (= res!623297 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27101 _keys!1487)))))

(declare-datatypes ((Unit!31227 0))(
  ( (Unit!31228) )
))
(declare-fun lt!415962 () Unit!31227)

(declare-fun e!518993 () Unit!31227)

(assert (=> b!924797 (= lt!415962 e!518993)))

(declare-fun c!96482 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924797 (= c!96482 (validKeyInArray!0 k0!1099))))

(declare-fun b!924798 () Bool)

(declare-fun res!623303 () Bool)

(declare-fun e!518999 () Bool)

(assert (=> b!924798 (=> (not res!623303) (not e!518999))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55394 (_ BitVec 32)) Bool)

(assert (=> b!924798 (= res!623303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31326 () Bool)

(declare-fun mapRes!31326 () Bool)

(declare-fun tp!60055 () Bool)

(declare-fun e!518997 () Bool)

(assert (=> mapNonEmpty!31326 (= mapRes!31326 (and tp!60055 e!518997))))

(declare-fun mapKey!31326 () (_ BitVec 32))

(declare-datatypes ((V!31249 0))(
  ( (V!31250 (val!9907 Int)) )
))
(declare-datatypes ((ValueCell!9375 0))(
  ( (ValueCellFull!9375 (v!12425 V!31249)) (EmptyCell!9375) )
))
(declare-datatypes ((array!55396 0))(
  ( (array!55397 (arr!26643 (Array (_ BitVec 32) ValueCell!9375)) (size!27102 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55396)

(declare-fun mapValue!31326 () ValueCell!9375)

(declare-fun mapRest!31326 () (Array (_ BitVec 32) ValueCell!9375))

(assert (=> mapNonEmpty!31326 (= (arr!26643 _values!1231) (store mapRest!31326 mapKey!31326 mapValue!31326))))

(declare-fun b!924799 () Bool)

(declare-fun e!518994 () Bool)

(declare-fun tp_is_empty!19713 () Bool)

(assert (=> b!924799 (= e!518994 tp_is_empty!19713)))

(declare-fun e!519004 () Bool)

(declare-fun b!924800 () Bool)

(declare-fun arrayContainsKey!0 (array!55394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924800 (= e!519004 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924801 () Bool)

(declare-fun e!519003 () Bool)

(assert (=> b!924801 (= e!518995 e!519003)))

(declare-fun res!623302 () Bool)

(assert (=> b!924801 (=> (not res!623302) (not e!519003))))

(declare-datatypes ((tuple2!12910 0))(
  ( (tuple2!12911 (_1!6466 (_ BitVec 64)) (_2!6466 V!31249)) )
))
(declare-datatypes ((List!18712 0))(
  ( (Nil!18709) (Cons!18708 (h!19854 tuple2!12910) (t!26647 List!18712)) )
))
(declare-datatypes ((ListLongMap!11607 0))(
  ( (ListLongMap!11608 (toList!5819 List!18712)) )
))
(declare-fun lt!415969 () ListLongMap!11607)

(declare-fun contains!4879 (ListLongMap!11607 (_ BitVec 64)) Bool)

(assert (=> b!924801 (= res!623302 (contains!4879 lt!415969 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31249)

(declare-fun minValue!1173 () V!31249)

(declare-fun getCurrentListMap!3070 (array!55394 array!55396 (_ BitVec 32) (_ BitVec 32) V!31249 V!31249 (_ BitVec 32) Int) ListLongMap!11607)

(assert (=> b!924801 (= lt!415969 (getCurrentListMap!3070 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924802 () Bool)

(assert (=> b!924802 (= e!519003 false)))

(declare-fun lt!415971 () V!31249)

(declare-fun apply!649 (ListLongMap!11607 (_ BitVec 64)) V!31249)

(assert (=> b!924802 (= lt!415971 (apply!649 lt!415969 k0!1099))))

(declare-fun b!924803 () Bool)

(declare-fun res!623299 () Bool)

(assert (=> b!924803 (=> (not res!623299) (not e!518999))))

(assert (=> b!924803 (= res!623299 (and (= (size!27102 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27101 _keys!1487) (size!27102 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924804 () Bool)

(declare-fun e!519002 () Unit!31227)

(assert (=> b!924804 (= e!518993 e!519002)))

(declare-fun lt!415972 () (_ BitVec 64))

(assert (=> b!924804 (= lt!415972 (select (arr!26642 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96481 () Bool)

(assert (=> b!924804 (= c!96481 (validKeyInArray!0 lt!415972))))

(declare-fun b!924805 () Bool)

(declare-fun lt!415963 () ListLongMap!11607)

(declare-fun lt!415967 () V!31249)

(assert (=> b!924805 (= (apply!649 lt!415963 k0!1099) lt!415967)))

(declare-fun lt!415961 () Unit!31227)

(declare-fun lt!415958 () V!31249)

(declare-fun lt!415959 () ListLongMap!11607)

(declare-fun addApplyDifferent!371 (ListLongMap!11607 (_ BitVec 64) V!31249 (_ BitVec 64)) Unit!31227)

(assert (=> b!924805 (= lt!415961 (addApplyDifferent!371 lt!415959 lt!415972 lt!415958 k0!1099))))

(assert (=> b!924805 (not (= lt!415972 k0!1099))))

(declare-fun lt!415970 () Unit!31227)

(declare-datatypes ((List!18713 0))(
  ( (Nil!18710) (Cons!18709 (h!19855 (_ BitVec 64)) (t!26648 List!18713)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55394 (_ BitVec 64) (_ BitVec 32) List!18713) Unit!31227)

(assert (=> b!924805 (= lt!415970 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18710))))

(assert (=> b!924805 e!519004))

(declare-fun c!96483 () Bool)

(assert (=> b!924805 (= c!96483 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415964 () Unit!31227)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!222 (array!55394 array!55396 (_ BitVec 32) (_ BitVec 32) V!31249 V!31249 (_ BitVec 64) (_ BitVec 32) Int) Unit!31227)

(assert (=> b!924805 (= lt!415964 (lemmaListMapContainsThenArrayContainsFrom!222 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55394 (_ BitVec 32) List!18713) Bool)

(assert (=> b!924805 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18710)))

(declare-fun lt!415960 () Unit!31227)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55394 (_ BitVec 32) (_ BitVec 32)) Unit!31227)

(assert (=> b!924805 (= lt!415960 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924805 (contains!4879 lt!415963 k0!1099)))

(declare-fun lt!415968 () tuple2!12910)

(declare-fun +!2715 (ListLongMap!11607 tuple2!12910) ListLongMap!11607)

(assert (=> b!924805 (= lt!415963 (+!2715 lt!415959 lt!415968))))

(declare-fun lt!415965 () Unit!31227)

(declare-fun addStillContains!439 (ListLongMap!11607 (_ BitVec 64) V!31249 (_ BitVec 64)) Unit!31227)

(assert (=> b!924805 (= lt!415965 (addStillContains!439 lt!415959 lt!415972 lt!415958 k0!1099))))

(assert (=> b!924805 (= (getCurrentListMap!3070 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2715 (getCurrentListMap!3070 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415968))))

(assert (=> b!924805 (= lt!415968 (tuple2!12911 lt!415972 lt!415958))))

(declare-fun get!14006 (ValueCell!9375 V!31249) V!31249)

(declare-fun dynLambda!1504 (Int (_ BitVec 64)) V!31249)

(assert (=> b!924805 (= lt!415958 (get!14006 (select (arr!26643 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1504 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415966 () Unit!31227)

(declare-fun lemmaListMapRecursiveValidKeyArray!105 (array!55394 array!55396 (_ BitVec 32) (_ BitVec 32) V!31249 V!31249 (_ BitVec 32) Int) Unit!31227)

(assert (=> b!924805 (= lt!415966 (lemmaListMapRecursiveValidKeyArray!105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924805 (= e!519002 lt!415961)))

(declare-fun b!924806 () Bool)

(declare-fun Unit!31229 () Unit!31227)

(assert (=> b!924806 (= e!519002 Unit!31229)))

(declare-fun mapIsEmpty!31326 () Bool)

(assert (=> mapIsEmpty!31326 mapRes!31326))

(declare-fun b!924808 () Bool)

(declare-fun res!623298 () Bool)

(assert (=> b!924808 (=> (not res!623298) (not e!518999))))

(assert (=> b!924808 (= res!623298 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18710))))

(declare-fun b!924809 () Bool)

(declare-fun e!519000 () Bool)

(assert (=> b!924809 (= e!519000 (and e!518994 mapRes!31326))))

(declare-fun condMapEmpty!31326 () Bool)

(declare-fun mapDefault!31326 () ValueCell!9375)

(assert (=> b!924809 (= condMapEmpty!31326 (= (arr!26643 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9375)) mapDefault!31326)))))

(declare-fun b!924810 () Bool)

(declare-fun e!519001 () Bool)

(assert (=> b!924810 (= e!519001 e!518996)))

(declare-fun res!623304 () Bool)

(assert (=> b!924810 (=> (not res!623304) (not e!518996))))

(declare-fun v!791 () V!31249)

(assert (=> b!924810 (= res!623304 (and (= lt!415967 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924810 (= lt!415967 (apply!649 lt!415959 k0!1099))))

(declare-fun b!924811 () Bool)

(declare-fun res!623300 () Bool)

(assert (=> b!924811 (=> (not res!623300) (not e!518999))))

(assert (=> b!924811 (= res!623300 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27101 _keys!1487))))))

(declare-fun b!924812 () Bool)

(assert (=> b!924812 (= e!518997 tp_is_empty!19713)))

(declare-fun b!924813 () Bool)

(assert (=> b!924813 (= e!519004 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924814 () Bool)

(declare-fun Unit!31230 () Unit!31227)

(assert (=> b!924814 (= e!518993 Unit!31230)))

(declare-fun b!924807 () Bool)

(assert (=> b!924807 (= e!518999 e!519001)))

(declare-fun res!623301 () Bool)

(assert (=> b!924807 (=> (not res!623301) (not e!519001))))

(assert (=> b!924807 (= res!623301 (contains!4879 lt!415959 k0!1099))))

(assert (=> b!924807 (= lt!415959 (getCurrentListMap!3070 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!623305 () Bool)

(assert (=> start!78992 (=> (not res!623305) (not e!518999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78992 (= res!623305 (validMask!0 mask!1881))))

(assert (=> start!78992 e!518999))

(assert (=> start!78992 true))

(assert (=> start!78992 tp_is_empty!19713))

(declare-fun array_inv!20748 (array!55396) Bool)

(assert (=> start!78992 (and (array_inv!20748 _values!1231) e!519000)))

(assert (=> start!78992 tp!60056))

(declare-fun array_inv!20749 (array!55394) Bool)

(assert (=> start!78992 (array_inv!20749 _keys!1487)))

(assert (= (and start!78992 res!623305) b!924803))

(assert (= (and b!924803 res!623299) b!924798))

(assert (= (and b!924798 res!623303) b!924808))

(assert (= (and b!924808 res!623298) b!924811))

(assert (= (and b!924811 res!623300) b!924807))

(assert (= (and b!924807 res!623301) b!924810))

(assert (= (and b!924810 res!623304) b!924797))

(assert (= (and b!924797 c!96482) b!924804))

(assert (= (and b!924797 (not c!96482)) b!924814))

(assert (= (and b!924804 c!96481) b!924805))

(assert (= (and b!924804 (not c!96481)) b!924806))

(assert (= (and b!924805 c!96483) b!924800))

(assert (= (and b!924805 (not c!96483)) b!924813))

(assert (= (and b!924797 res!623297) b!924801))

(assert (= (and b!924801 res!623302) b!924802))

(assert (= (and b!924809 condMapEmpty!31326) mapIsEmpty!31326))

(assert (= (and b!924809 (not condMapEmpty!31326)) mapNonEmpty!31326))

(get-info :version)

(assert (= (and mapNonEmpty!31326 ((_ is ValueCellFull!9375) mapValue!31326)) b!924812))

(assert (= (and b!924809 ((_ is ValueCellFull!9375) mapDefault!31326)) b!924799))

(assert (= start!78992 b!924809))

(declare-fun b_lambda!13707 () Bool)

(assert (=> (not b_lambda!13707) (not b!924805)))

(declare-fun t!26646 () Bool)

(declare-fun tb!5785 () Bool)

(assert (=> (and start!78992 (= defaultEntry!1235 defaultEntry!1235) t!26646) tb!5785))

(declare-fun result!11393 () Bool)

(assert (=> tb!5785 (= result!11393 tp_is_empty!19713)))

(assert (=> b!924805 t!26646))

(declare-fun b_and!28149 () Bool)

(assert (= b_and!28147 (and (=> t!26646 result!11393) b_and!28149)))

(declare-fun m!859145 () Bool)

(assert (=> b!924802 m!859145))

(declare-fun m!859147 () Bool)

(assert (=> b!924797 m!859147))

(declare-fun m!859149 () Bool)

(assert (=> start!78992 m!859149))

(declare-fun m!859151 () Bool)

(assert (=> start!78992 m!859151))

(declare-fun m!859153 () Bool)

(assert (=> start!78992 m!859153))

(declare-fun m!859155 () Bool)

(assert (=> b!924804 m!859155))

(declare-fun m!859157 () Bool)

(assert (=> b!924804 m!859157))

(declare-fun m!859159 () Bool)

(assert (=> b!924808 m!859159))

(declare-fun m!859161 () Bool)

(assert (=> b!924805 m!859161))

(declare-fun m!859163 () Bool)

(assert (=> b!924805 m!859163))

(declare-fun m!859165 () Bool)

(assert (=> b!924805 m!859165))

(declare-fun m!859167 () Bool)

(assert (=> b!924805 m!859167))

(assert (=> b!924805 m!859163))

(assert (=> b!924805 m!859165))

(declare-fun m!859169 () Bool)

(assert (=> b!924805 m!859169))

(declare-fun m!859171 () Bool)

(assert (=> b!924805 m!859171))

(declare-fun m!859173 () Bool)

(assert (=> b!924805 m!859173))

(declare-fun m!859175 () Bool)

(assert (=> b!924805 m!859175))

(declare-fun m!859177 () Bool)

(assert (=> b!924805 m!859177))

(declare-fun m!859179 () Bool)

(assert (=> b!924805 m!859179))

(declare-fun m!859181 () Bool)

(assert (=> b!924805 m!859181))

(declare-fun m!859183 () Bool)

(assert (=> b!924805 m!859183))

(declare-fun m!859185 () Bool)

(assert (=> b!924805 m!859185))

(declare-fun m!859187 () Bool)

(assert (=> b!924805 m!859187))

(declare-fun m!859189 () Bool)

(assert (=> b!924805 m!859189))

(assert (=> b!924805 m!859183))

(declare-fun m!859191 () Bool)

(assert (=> b!924805 m!859191))

(declare-fun m!859193 () Bool)

(assert (=> b!924807 m!859193))

(declare-fun m!859195 () Bool)

(assert (=> b!924807 m!859195))

(declare-fun m!859197 () Bool)

(assert (=> b!924810 m!859197))

(declare-fun m!859199 () Bool)

(assert (=> b!924801 m!859199))

(assert (=> b!924801 m!859171))

(declare-fun m!859201 () Bool)

(assert (=> b!924798 m!859201))

(declare-fun m!859203 () Bool)

(assert (=> mapNonEmpty!31326 m!859203))

(declare-fun m!859205 () Bool)

(assert (=> b!924800 m!859205))

(check-sat (not b!924808) (not b_next!17205) (not start!78992) (not b!924798) (not b!924802) (not b!924805) (not b!924804) (not b!924810) (not mapNonEmpty!31326) (not b_lambda!13707) tp_is_empty!19713 (not b!924797) (not b!924800) (not b!924807) b_and!28149 (not b!924801))
(check-sat b_and!28149 (not b_next!17205))
