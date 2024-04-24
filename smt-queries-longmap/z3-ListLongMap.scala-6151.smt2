; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79182 () Bool)

(assert start!79182)

(declare-fun b_free!17227 () Bool)

(declare-fun b_next!17227 () Bool)

(assert (=> start!79182 (= b_free!17227 (not b_next!17227))))

(declare-fun tp!60122 () Bool)

(declare-fun b_and!28201 () Bool)

(assert (=> start!79182 (= tp!60122 b_and!28201)))

(declare-fun b!926356 () Bool)

(declare-fun e!519991 () Bool)

(declare-fun e!519997 () Bool)

(assert (=> b!926356 (= e!519991 e!519997)))

(declare-fun res!623988 () Bool)

(assert (=> b!926356 (=> (not res!623988) (not e!519997))))

(declare-datatypes ((V!31279 0))(
  ( (V!31280 (val!9918 Int)) )
))
(declare-datatypes ((tuple2!12918 0))(
  ( (tuple2!12919 (_1!6470 (_ BitVec 64)) (_2!6470 V!31279)) )
))
(declare-datatypes ((List!18729 0))(
  ( (Nil!18726) (Cons!18725 (h!19877 tuple2!12918) (t!26678 List!18729)) )
))
(declare-datatypes ((ListLongMap!11617 0))(
  ( (ListLongMap!11618 (toList!5824 List!18729)) )
))
(declare-fun lt!416842 () ListLongMap!11617)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4896 (ListLongMap!11617 (_ BitVec 64)) Bool)

(assert (=> b!926356 (= res!623988 (contains!4896 lt!416842 k0!1099))))

(declare-datatypes ((array!55487 0))(
  ( (array!55488 (arr!26684 (Array (_ BitVec 32) (_ BitVec 64))) (size!27144 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55487)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9386 0))(
  ( (ValueCellFull!9386 (v!12433 V!31279)) (EmptyCell!9386) )
))
(declare-datatypes ((array!55489 0))(
  ( (array!55490 (arr!26685 (Array (_ BitVec 32) ValueCell!9386)) (size!27145 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55489)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31279)

(declare-fun minValue!1173 () V!31279)

(declare-fun getCurrentListMap!3074 (array!55487 array!55489 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 32) Int) ListLongMap!11617)

(assert (=> b!926356 (= lt!416842 (getCurrentListMap!3074 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926357 () Bool)

(assert (=> b!926357 (= e!519997 (not true))))

(declare-fun e!519994 () Bool)

(assert (=> b!926357 e!519994))

(declare-fun res!623984 () Bool)

(assert (=> b!926357 (=> (not res!623984) (not e!519994))))

(declare-fun lt!416845 () ListLongMap!11617)

(assert (=> b!926357 (= res!623984 (contains!4896 lt!416845 k0!1099))))

(assert (=> b!926357 (= lt!416845 (getCurrentListMap!3074 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-datatypes ((Unit!31262 0))(
  ( (Unit!31263) )
))
(declare-fun lt!416847 () Unit!31262)

(declare-fun v!791 () V!31279)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!71 (array!55487 array!55489 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 64) V!31279 (_ BitVec 32) Int) Unit!31262)

(assert (=> b!926357 (= lt!416847 (lemmaListMapApplyFromThenApplyFromZero!71 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926358 () Bool)

(declare-fun res!623987 () Bool)

(declare-fun e!520002 () Bool)

(assert (=> b!926358 (=> (not res!623987) (not e!520002))))

(assert (=> b!926358 (= res!623987 (and (= (size!27145 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27144 _keys!1487) (size!27145 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926359 () Bool)

(declare-fun e!520003 () Bool)

(assert (=> b!926359 (= e!520003 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926360 () Bool)

(declare-fun res!623985 () Bool)

(assert (=> b!926360 (=> (not res!623985) (not e!520002))))

(declare-datatypes ((List!18730 0))(
  ( (Nil!18727) (Cons!18726 (h!19878 (_ BitVec 64)) (t!26679 List!18730)) )
))
(declare-fun arrayNoDuplicates!0 (array!55487 (_ BitVec 32) List!18730) Bool)

(assert (=> b!926360 (= res!623985 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18727))))

(declare-fun b!926361 () Bool)

(declare-fun e!519999 () Unit!31262)

(declare-fun Unit!31264 () Unit!31262)

(assert (=> b!926361 (= e!519999 Unit!31264)))

(declare-fun b!926362 () Bool)

(declare-fun res!623980 () Bool)

(assert (=> b!926362 (=> (not res!623980) (not e!519997))))

(declare-fun apply!675 (ListLongMap!11617 (_ BitVec 64)) V!31279)

(assert (=> b!926362 (= res!623980 (= (apply!675 lt!416842 k0!1099) v!791))))

(declare-fun b!926363 () Bool)

(declare-fun e!520000 () Unit!31262)

(assert (=> b!926363 (= e!520000 e!519999)))

(declare-fun lt!416840 () (_ BitVec 64))

(assert (=> b!926363 (= lt!416840 (select (arr!26684 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96862 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926363 (= c!96862 (validKeyInArray!0 lt!416840))))

(declare-fun b!926364 () Bool)

(declare-fun res!623986 () Bool)

(assert (=> b!926364 (=> (not res!623986) (not e!520002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55487 (_ BitVec 32)) Bool)

(assert (=> b!926364 (= res!623986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926365 () Bool)

(assert (=> b!926365 (= e!519994 (= (apply!675 lt!416845 k0!1099) v!791))))

(declare-fun b!926366 () Bool)

(declare-fun lt!416836 () ListLongMap!11617)

(declare-fun lt!416838 () V!31279)

(assert (=> b!926366 (= (apply!675 lt!416836 k0!1099) lt!416838)))

(declare-fun lt!416848 () Unit!31262)

(declare-fun lt!416844 () ListLongMap!11617)

(declare-fun lt!416834 () V!31279)

(declare-fun addApplyDifferent!376 (ListLongMap!11617 (_ BitVec 64) V!31279 (_ BitVec 64)) Unit!31262)

(assert (=> b!926366 (= lt!416848 (addApplyDifferent!376 lt!416844 lt!416840 lt!416834 k0!1099))))

(assert (=> b!926366 (not (= lt!416840 k0!1099))))

(declare-fun lt!416841 () Unit!31262)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55487 (_ BitVec 64) (_ BitVec 32) List!18730) Unit!31262)

(assert (=> b!926366 (= lt!416841 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18727))))

(assert (=> b!926366 e!520003))

(declare-fun c!96864 () Bool)

(assert (=> b!926366 (= c!96864 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416835 () Unit!31262)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!231 (array!55487 array!55489 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 64) (_ BitVec 32) Int) Unit!31262)

(assert (=> b!926366 (= lt!416835 (lemmaListMapContainsThenArrayContainsFrom!231 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!926366 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18727)))

(declare-fun lt!416846 () Unit!31262)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55487 (_ BitVec 32) (_ BitVec 32)) Unit!31262)

(assert (=> b!926366 (= lt!416846 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926366 (contains!4896 lt!416836 k0!1099)))

(declare-fun lt!416839 () tuple2!12918)

(declare-fun +!2740 (ListLongMap!11617 tuple2!12918) ListLongMap!11617)

(assert (=> b!926366 (= lt!416836 (+!2740 lt!416844 lt!416839))))

(declare-fun lt!416843 () Unit!31262)

(declare-fun addStillContains!449 (ListLongMap!11617 (_ BitVec 64) V!31279 (_ BitVec 64)) Unit!31262)

(assert (=> b!926366 (= lt!416843 (addStillContains!449 lt!416844 lt!416840 lt!416834 k0!1099))))

(assert (=> b!926366 (= (getCurrentListMap!3074 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2740 (getCurrentListMap!3074 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416839))))

(assert (=> b!926366 (= lt!416839 (tuple2!12919 lt!416840 lt!416834))))

(declare-fun get!14051 (ValueCell!9386 V!31279) V!31279)

(declare-fun dynLambda!1537 (Int (_ BitVec 64)) V!31279)

(assert (=> b!926366 (= lt!416834 (get!14051 (select (arr!26685 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1537 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416837 () Unit!31262)

(declare-fun lemmaListMapRecursiveValidKeyArray!120 (array!55487 array!55489 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 32) Int) Unit!31262)

(assert (=> b!926366 (= lt!416837 (lemmaListMapRecursiveValidKeyArray!120 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926366 (= e!519999 lt!416848)))

(declare-fun res!623982 () Bool)

(assert (=> start!79182 (=> (not res!623982) (not e!520002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79182 (= res!623982 (validMask!0 mask!1881))))

(assert (=> start!79182 e!520002))

(assert (=> start!79182 true))

(declare-fun tp_is_empty!19735 () Bool)

(assert (=> start!79182 tp_is_empty!19735))

(declare-fun e!519995 () Bool)

(declare-fun array_inv!20880 (array!55489) Bool)

(assert (=> start!79182 (and (array_inv!20880 _values!1231) e!519995)))

(assert (=> start!79182 tp!60122))

(declare-fun array_inv!20881 (array!55487) Bool)

(assert (=> start!79182 (array_inv!20881 _keys!1487)))

(declare-fun b!926367 () Bool)

(declare-fun e!519992 () Bool)

(assert (=> b!926367 (= e!519992 e!519991)))

(declare-fun res!623979 () Bool)

(assert (=> b!926367 (=> (not res!623979) (not e!519991))))

(assert (=> b!926367 (= res!623979 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27144 _keys!1487)))))

(declare-fun lt!416849 () Unit!31262)

(assert (=> b!926367 (= lt!416849 e!520000)))

(declare-fun c!96863 () Bool)

(assert (=> b!926367 (= c!96863 (validKeyInArray!0 k0!1099))))

(declare-fun b!926368 () Bool)

(declare-fun res!623983 () Bool)

(assert (=> b!926368 (=> (not res!623983) (not e!520002))))

(assert (=> b!926368 (= res!623983 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27144 _keys!1487))))))

(declare-fun b!926369 () Bool)

(declare-fun Unit!31265 () Unit!31262)

(assert (=> b!926369 (= e!520000 Unit!31265)))

(declare-fun b!926370 () Bool)

(declare-fun e!519993 () Bool)

(assert (=> b!926370 (= e!519993 tp_is_empty!19735)))

(declare-fun mapNonEmpty!31359 () Bool)

(declare-fun mapRes!31359 () Bool)

(declare-fun tp!60123 () Bool)

(declare-fun e!520001 () Bool)

(assert (=> mapNonEmpty!31359 (= mapRes!31359 (and tp!60123 e!520001))))

(declare-fun mapRest!31359 () (Array (_ BitVec 32) ValueCell!9386))

(declare-fun mapKey!31359 () (_ BitVec 32))

(declare-fun mapValue!31359 () ValueCell!9386)

(assert (=> mapNonEmpty!31359 (= (arr!26685 _values!1231) (store mapRest!31359 mapKey!31359 mapValue!31359))))

(declare-fun b!926371 () Bool)

(declare-fun e!519996 () Bool)

(assert (=> b!926371 (= e!520002 e!519996)))

(declare-fun res!623978 () Bool)

(assert (=> b!926371 (=> (not res!623978) (not e!519996))))

(assert (=> b!926371 (= res!623978 (contains!4896 lt!416844 k0!1099))))

(assert (=> b!926371 (= lt!416844 (getCurrentListMap!3074 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926372 () Bool)

(assert (=> b!926372 (= e!519995 (and e!519993 mapRes!31359))))

(declare-fun condMapEmpty!31359 () Bool)

(declare-fun mapDefault!31359 () ValueCell!9386)

(assert (=> b!926372 (= condMapEmpty!31359 (= (arr!26685 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9386)) mapDefault!31359)))))

(declare-fun b!926373 () Bool)

(declare-fun arrayContainsKey!0 (array!55487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926373 (= e!520003 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!926374 () Bool)

(assert (=> b!926374 (= e!519996 e!519992)))

(declare-fun res!623981 () Bool)

(assert (=> b!926374 (=> (not res!623981) (not e!519992))))

(assert (=> b!926374 (= res!623981 (and (= lt!416838 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926374 (= lt!416838 (apply!675 lt!416844 k0!1099))))

(declare-fun mapIsEmpty!31359 () Bool)

(assert (=> mapIsEmpty!31359 mapRes!31359))

(declare-fun b!926375 () Bool)

(assert (=> b!926375 (= e!520001 tp_is_empty!19735)))

(assert (= (and start!79182 res!623982) b!926358))

(assert (= (and b!926358 res!623987) b!926364))

(assert (= (and b!926364 res!623986) b!926360))

(assert (= (and b!926360 res!623985) b!926368))

(assert (= (and b!926368 res!623983) b!926371))

(assert (= (and b!926371 res!623978) b!926374))

(assert (= (and b!926374 res!623981) b!926367))

(assert (= (and b!926367 c!96863) b!926363))

(assert (= (and b!926367 (not c!96863)) b!926369))

(assert (= (and b!926363 c!96862) b!926366))

(assert (= (and b!926363 (not c!96862)) b!926361))

(assert (= (and b!926366 c!96864) b!926373))

(assert (= (and b!926366 (not c!96864)) b!926359))

(assert (= (and b!926367 res!623979) b!926356))

(assert (= (and b!926356 res!623988) b!926362))

(assert (= (and b!926362 res!623980) b!926357))

(assert (= (and b!926357 res!623984) b!926365))

(assert (= (and b!926372 condMapEmpty!31359) mapIsEmpty!31359))

(assert (= (and b!926372 (not condMapEmpty!31359)) mapNonEmpty!31359))

(get-info :version)

(assert (= (and mapNonEmpty!31359 ((_ is ValueCellFull!9386) mapValue!31359)) b!926375))

(assert (= (and b!926372 ((_ is ValueCellFull!9386) mapDefault!31359)) b!926370))

(assert (= start!79182 b!926372))

(declare-fun b_lambda!13743 () Bool)

(assert (=> (not b_lambda!13743) (not b!926366)))

(declare-fun t!26677 () Bool)

(declare-fun tb!5799 () Bool)

(assert (=> (and start!79182 (= defaultEntry!1235 defaultEntry!1235) t!26677) tb!5799))

(declare-fun result!11429 () Bool)

(assert (=> tb!5799 (= result!11429 tp_is_empty!19735)))

(assert (=> b!926366 t!26677))

(declare-fun b_and!28203 () Bool)

(assert (= b_and!28201 (and (=> t!26677 result!11429) b_and!28203)))

(declare-fun m!861169 () Bool)

(assert (=> b!926363 m!861169))

(declare-fun m!861171 () Bool)

(assert (=> b!926363 m!861171))

(declare-fun m!861173 () Bool)

(assert (=> b!926360 m!861173))

(declare-fun m!861175 () Bool)

(assert (=> mapNonEmpty!31359 m!861175))

(declare-fun m!861177 () Bool)

(assert (=> b!926356 m!861177))

(declare-fun m!861179 () Bool)

(assert (=> b!926356 m!861179))

(declare-fun m!861181 () Bool)

(assert (=> b!926365 m!861181))

(declare-fun m!861183 () Bool)

(assert (=> b!926366 m!861183))

(declare-fun m!861185 () Bool)

(assert (=> b!926366 m!861185))

(declare-fun m!861187 () Bool)

(assert (=> b!926366 m!861187))

(declare-fun m!861189 () Bool)

(assert (=> b!926366 m!861189))

(assert (=> b!926366 m!861185))

(assert (=> b!926366 m!861187))

(declare-fun m!861191 () Bool)

(assert (=> b!926366 m!861191))

(assert (=> b!926366 m!861179))

(declare-fun m!861193 () Bool)

(assert (=> b!926366 m!861193))

(declare-fun m!861195 () Bool)

(assert (=> b!926366 m!861195))

(declare-fun m!861197 () Bool)

(assert (=> b!926366 m!861197))

(declare-fun m!861199 () Bool)

(assert (=> b!926366 m!861199))

(declare-fun m!861201 () Bool)

(assert (=> b!926366 m!861201))

(declare-fun m!861203 () Bool)

(assert (=> b!926366 m!861203))

(declare-fun m!861205 () Bool)

(assert (=> b!926366 m!861205))

(declare-fun m!861207 () Bool)

(assert (=> b!926366 m!861207))

(assert (=> b!926366 m!861203))

(declare-fun m!861209 () Bool)

(assert (=> b!926366 m!861209))

(declare-fun m!861211 () Bool)

(assert (=> b!926366 m!861211))

(declare-fun m!861213 () Bool)

(assert (=> b!926371 m!861213))

(declare-fun m!861215 () Bool)

(assert (=> b!926371 m!861215))

(declare-fun m!861217 () Bool)

(assert (=> b!926362 m!861217))

(declare-fun m!861219 () Bool)

(assert (=> b!926357 m!861219))

(declare-fun m!861221 () Bool)

(assert (=> b!926357 m!861221))

(declare-fun m!861223 () Bool)

(assert (=> b!926357 m!861223))

(declare-fun m!861225 () Bool)

(assert (=> b!926364 m!861225))

(declare-fun m!861227 () Bool)

(assert (=> b!926373 m!861227))

(declare-fun m!861229 () Bool)

(assert (=> start!79182 m!861229))

(declare-fun m!861231 () Bool)

(assert (=> start!79182 m!861231))

(declare-fun m!861233 () Bool)

(assert (=> start!79182 m!861233))

(declare-fun m!861235 () Bool)

(assert (=> b!926374 m!861235))

(declare-fun m!861237 () Bool)

(assert (=> b!926367 m!861237))

(check-sat (not b!926371) tp_is_empty!19735 (not b!926363) (not b_next!17227) (not b!926364) (not b!926367) (not b!926374) (not b!926356) (not b_lambda!13743) (not b!926357) (not start!79182) (not b!926360) (not b!926362) (not b!926373) (not b!926365) b_and!28203 (not mapNonEmpty!31359) (not b!926366))
(check-sat b_and!28203 (not b_next!17227))
