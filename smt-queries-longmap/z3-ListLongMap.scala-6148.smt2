; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78998 () Bool)

(assert start!78998)

(declare-fun b_free!17211 () Bool)

(declare-fun b_next!17211 () Bool)

(assert (=> start!78998 (= b_free!17211 (not b_next!17211))))

(declare-fun tp!60074 () Bool)

(declare-fun b_and!28159 () Bool)

(assert (=> start!78998 (= tp!60074 b_and!28159)))

(declare-fun mapNonEmpty!31335 () Bool)

(declare-fun mapRes!31335 () Bool)

(declare-fun tp!60073 () Bool)

(declare-fun e!519103 () Bool)

(assert (=> mapNonEmpty!31335 (= mapRes!31335 (and tp!60073 e!519103))))

(declare-fun mapKey!31335 () (_ BitVec 32))

(declare-datatypes ((V!31257 0))(
  ( (V!31258 (val!9910 Int)) )
))
(declare-datatypes ((ValueCell!9378 0))(
  ( (ValueCellFull!9378 (v!12428 V!31257)) (EmptyCell!9378) )
))
(declare-fun mapRest!31335 () (Array (_ BitVec 32) ValueCell!9378))

(declare-datatypes ((array!55406 0))(
  ( (array!55407 (arr!26648 (Array (_ BitVec 32) ValueCell!9378)) (size!27107 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55406)

(declare-fun mapValue!31335 () ValueCell!9378)

(assert (=> mapNonEmpty!31335 (= (arr!26648 _values!1231) (store mapRest!31335 mapKey!31335 mapValue!31335))))

(declare-fun b!924965 () Bool)

(declare-fun e!519112 () Bool)

(declare-fun e!519110 () Bool)

(assert (=> b!924965 (= e!519112 e!519110)))

(declare-fun res!623385 () Bool)

(assert (=> b!924965 (=> (not res!623385) (not e!519110))))

(declare-datatypes ((tuple2!12916 0))(
  ( (tuple2!12917 (_1!6469 (_ BitVec 64)) (_2!6469 V!31257)) )
))
(declare-datatypes ((List!18718 0))(
  ( (Nil!18715) (Cons!18714 (h!19860 tuple2!12916) (t!26659 List!18718)) )
))
(declare-datatypes ((ListLongMap!11613 0))(
  ( (ListLongMap!11614 (toList!5822 List!18718)) )
))
(declare-fun lt!416096 () ListLongMap!11613)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4882 (ListLongMap!11613 (_ BitVec 64)) Bool)

(assert (=> b!924965 (= res!623385 (contains!4882 lt!416096 k0!1099))))

(declare-datatypes ((array!55408 0))(
  ( (array!55409 (arr!26649 (Array (_ BitVec 32) (_ BitVec 64))) (size!27108 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55408)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31257)

(declare-fun minValue!1173 () V!31257)

(declare-fun getCurrentListMap!3073 (array!55408 array!55406 (_ BitVec 32) (_ BitVec 32) V!31257 V!31257 (_ BitVec 32) Int) ListLongMap!11613)

(assert (=> b!924965 (= lt!416096 (getCurrentListMap!3073 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924966 () Bool)

(declare-fun lt!416107 () ListLongMap!11613)

(declare-fun lt!416099 () V!31257)

(declare-fun apply!652 (ListLongMap!11613 (_ BitVec 64)) V!31257)

(assert (=> b!924966 (= (apply!652 lt!416107 k0!1099) lt!416099)))

(declare-datatypes ((Unit!31239 0))(
  ( (Unit!31240) )
))
(declare-fun lt!416103 () Unit!31239)

(declare-fun lt!416098 () (_ BitVec 64))

(declare-fun lt!416094 () V!31257)

(declare-fun addApplyDifferent!374 (ListLongMap!11613 (_ BitVec 64) V!31257 (_ BitVec 64)) Unit!31239)

(assert (=> b!924966 (= lt!416103 (addApplyDifferent!374 lt!416096 lt!416098 lt!416094 k0!1099))))

(assert (=> b!924966 (not (= lt!416098 k0!1099))))

(declare-fun lt!416106 () Unit!31239)

(declare-datatypes ((List!18719 0))(
  ( (Nil!18716) (Cons!18715 (h!19861 (_ BitVec 64)) (t!26660 List!18719)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55408 (_ BitVec 64) (_ BitVec 32) List!18719) Unit!31239)

(assert (=> b!924966 (= lt!416106 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18716))))

(declare-fun e!519107 () Bool)

(assert (=> b!924966 e!519107))

(declare-fun c!96509 () Bool)

(assert (=> b!924966 (= c!96509 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416104 () Unit!31239)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!225 (array!55408 array!55406 (_ BitVec 32) (_ BitVec 32) V!31257 V!31257 (_ BitVec 64) (_ BitVec 32) Int) Unit!31239)

(assert (=> b!924966 (= lt!416104 (lemmaListMapContainsThenArrayContainsFrom!225 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55408 (_ BitVec 32) List!18719) Bool)

(assert (=> b!924966 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18716)))

(declare-fun lt!416100 () Unit!31239)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55408 (_ BitVec 32) (_ BitVec 32)) Unit!31239)

(assert (=> b!924966 (= lt!416100 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924966 (contains!4882 lt!416107 k0!1099)))

(declare-fun lt!416097 () tuple2!12916)

(declare-fun +!2718 (ListLongMap!11613 tuple2!12916) ListLongMap!11613)

(assert (=> b!924966 (= lt!416107 (+!2718 lt!416096 lt!416097))))

(declare-fun lt!416093 () Unit!31239)

(declare-fun addStillContains!442 (ListLongMap!11613 (_ BitVec 64) V!31257 (_ BitVec 64)) Unit!31239)

(assert (=> b!924966 (= lt!416093 (addStillContains!442 lt!416096 lt!416098 lt!416094 k0!1099))))

(assert (=> b!924966 (= (getCurrentListMap!3073 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2718 (getCurrentListMap!3073 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416097))))

(assert (=> b!924966 (= lt!416097 (tuple2!12917 lt!416098 lt!416094))))

(declare-fun get!14011 (ValueCell!9378 V!31257) V!31257)

(declare-fun dynLambda!1507 (Int (_ BitVec 64)) V!31257)

(assert (=> b!924966 (= lt!416094 (get!14011 (select (arr!26648 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1507 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416102 () Unit!31239)

(declare-fun lemmaListMapRecursiveValidKeyArray!108 (array!55408 array!55406 (_ BitVec 32) (_ BitVec 32) V!31257 V!31257 (_ BitVec 32) Int) Unit!31239)

(assert (=> b!924966 (= lt!416102 (lemmaListMapRecursiveValidKeyArray!108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519102 () Unit!31239)

(assert (=> b!924966 (= e!519102 lt!416103)))

(declare-fun b!924967 () Bool)

(declare-fun res!623378 () Bool)

(assert (=> b!924967 (=> (not res!623378) (not e!519112))))

(assert (=> b!924967 (= res!623378 (and (= (size!27107 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27108 _keys!1487) (size!27107 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924968 () Bool)

(declare-fun Unit!31241 () Unit!31239)

(assert (=> b!924968 (= e!519102 Unit!31241)))

(declare-fun b!924969 () Bool)

(declare-fun tp_is_empty!19719 () Bool)

(assert (=> b!924969 (= e!519103 tp_is_empty!19719)))

(declare-fun b!924970 () Bool)

(declare-fun e!519104 () Unit!31239)

(declare-fun Unit!31242 () Unit!31239)

(assert (=> b!924970 (= e!519104 Unit!31242)))

(declare-fun b!924971 () Bool)

(assert (=> b!924971 (= e!519104 e!519102)))

(assert (=> b!924971 (= lt!416098 (select (arr!26649 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96508 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924971 (= c!96508 (validKeyInArray!0 lt!416098))))

(declare-fun b!924972 () Bool)

(declare-fun e!519101 () Bool)

(declare-fun e!519109 () Bool)

(assert (=> b!924972 (= e!519101 e!519109)))

(declare-fun res!623379 () Bool)

(assert (=> b!924972 (=> (not res!623379) (not e!519109))))

(declare-fun lt!416105 () ListLongMap!11613)

(assert (=> b!924972 (= res!623379 (contains!4882 lt!416105 k0!1099))))

(assert (=> b!924972 (= lt!416105 (getCurrentListMap!3073 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924973 () Bool)

(declare-fun res!623383 () Bool)

(assert (=> b!924973 (=> (not res!623383) (not e!519112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55408 (_ BitVec 32)) Bool)

(assert (=> b!924973 (= res!623383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!623381 () Bool)

(assert (=> start!78998 (=> (not res!623381) (not e!519112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78998 (= res!623381 (validMask!0 mask!1881))))

(assert (=> start!78998 e!519112))

(assert (=> start!78998 true))

(assert (=> start!78998 tp_is_empty!19719))

(declare-fun e!519105 () Bool)

(declare-fun array_inv!20754 (array!55406) Bool)

(assert (=> start!78998 (and (array_inv!20754 _values!1231) e!519105)))

(assert (=> start!78998 tp!60074))

(declare-fun array_inv!20755 (array!55408) Bool)

(assert (=> start!78998 (array_inv!20755 _keys!1487)))

(declare-fun b!924974 () Bool)

(declare-fun e!519108 () Bool)

(assert (=> b!924974 (= e!519108 e!519101)))

(declare-fun res!623384 () Bool)

(assert (=> b!924974 (=> (not res!623384) (not e!519101))))

(assert (=> b!924974 (= res!623384 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27108 _keys!1487)))))

(declare-fun lt!416095 () Unit!31239)

(assert (=> b!924974 (= lt!416095 e!519104)))

(declare-fun c!96510 () Bool)

(assert (=> b!924974 (= c!96510 (validKeyInArray!0 k0!1099))))

(declare-fun b!924975 () Bool)

(assert (=> b!924975 (= e!519110 e!519108)))

(declare-fun res!623386 () Bool)

(assert (=> b!924975 (=> (not res!623386) (not e!519108))))

(declare-fun v!791 () V!31257)

(assert (=> b!924975 (= res!623386 (and (= lt!416099 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924975 (= lt!416099 (apply!652 lt!416096 k0!1099))))

(declare-fun b!924976 () Bool)

(declare-fun e!519106 () Bool)

(assert (=> b!924976 (= e!519105 (and e!519106 mapRes!31335))))

(declare-fun condMapEmpty!31335 () Bool)

(declare-fun mapDefault!31335 () ValueCell!9378)

(assert (=> b!924976 (= condMapEmpty!31335 (= (arr!26648 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9378)) mapDefault!31335)))))

(declare-fun b!924977 () Bool)

(assert (=> b!924977 (= e!519106 tp_is_empty!19719)))

(declare-fun b!924978 () Bool)

(declare-fun res!623380 () Bool)

(assert (=> b!924978 (=> (not res!623380) (not e!519112))))

(assert (=> b!924978 (= res!623380 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18716))))

(declare-fun b!924979 () Bool)

(declare-fun res!623382 () Bool)

(assert (=> b!924979 (=> (not res!623382) (not e!519112))))

(assert (=> b!924979 (= res!623382 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27108 _keys!1487))))))

(declare-fun b!924980 () Bool)

(assert (=> b!924980 (= e!519107 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924981 () Bool)

(assert (=> b!924981 (= e!519109 false)))

(declare-fun lt!416101 () V!31257)

(assert (=> b!924981 (= lt!416101 (apply!652 lt!416105 k0!1099))))

(declare-fun mapIsEmpty!31335 () Bool)

(assert (=> mapIsEmpty!31335 mapRes!31335))

(declare-fun b!924982 () Bool)

(declare-fun arrayContainsKey!0 (array!55408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924982 (= e!519107 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!78998 res!623381) b!924967))

(assert (= (and b!924967 res!623378) b!924973))

(assert (= (and b!924973 res!623383) b!924978))

(assert (= (and b!924978 res!623380) b!924979))

(assert (= (and b!924979 res!623382) b!924965))

(assert (= (and b!924965 res!623385) b!924975))

(assert (= (and b!924975 res!623386) b!924974))

(assert (= (and b!924974 c!96510) b!924971))

(assert (= (and b!924974 (not c!96510)) b!924970))

(assert (= (and b!924971 c!96508) b!924966))

(assert (= (and b!924971 (not c!96508)) b!924968))

(assert (= (and b!924966 c!96509) b!924982))

(assert (= (and b!924966 (not c!96509)) b!924980))

(assert (= (and b!924974 res!623384) b!924972))

(assert (= (and b!924972 res!623379) b!924981))

(assert (= (and b!924976 condMapEmpty!31335) mapIsEmpty!31335))

(assert (= (and b!924976 (not condMapEmpty!31335)) mapNonEmpty!31335))

(get-info :version)

(assert (= (and mapNonEmpty!31335 ((_ is ValueCellFull!9378) mapValue!31335)) b!924969))

(assert (= (and b!924976 ((_ is ValueCellFull!9378) mapDefault!31335)) b!924977))

(assert (= start!78998 b!924976))

(declare-fun b_lambda!13713 () Bool)

(assert (=> (not b_lambda!13713) (not b!924966)))

(declare-fun t!26658 () Bool)

(declare-fun tb!5791 () Bool)

(assert (=> (and start!78998 (= defaultEntry!1235 defaultEntry!1235) t!26658) tb!5791))

(declare-fun result!11405 () Bool)

(assert (=> tb!5791 (= result!11405 tp_is_empty!19719)))

(assert (=> b!924966 t!26658))

(declare-fun b_and!28161 () Bool)

(assert (= b_and!28159 (and (=> t!26658 result!11405) b_and!28161)))

(declare-fun m!859331 () Bool)

(assert (=> b!924982 m!859331))

(declare-fun m!859333 () Bool)

(assert (=> b!924981 m!859333))

(declare-fun m!859335 () Bool)

(assert (=> b!924965 m!859335))

(declare-fun m!859337 () Bool)

(assert (=> b!924965 m!859337))

(declare-fun m!859339 () Bool)

(assert (=> b!924975 m!859339))

(declare-fun m!859341 () Bool)

(assert (=> b!924971 m!859341))

(declare-fun m!859343 () Bool)

(assert (=> b!924971 m!859343))

(declare-fun m!859345 () Bool)

(assert (=> b!924966 m!859345))

(declare-fun m!859347 () Bool)

(assert (=> b!924966 m!859347))

(declare-fun m!859349 () Bool)

(assert (=> b!924966 m!859349))

(declare-fun m!859351 () Bool)

(assert (=> b!924966 m!859351))

(declare-fun m!859353 () Bool)

(assert (=> b!924966 m!859353))

(declare-fun m!859355 () Bool)

(assert (=> b!924966 m!859355))

(assert (=> b!924966 m!859353))

(assert (=> b!924966 m!859355))

(declare-fun m!859357 () Bool)

(assert (=> b!924966 m!859357))

(declare-fun m!859359 () Bool)

(assert (=> b!924966 m!859359))

(declare-fun m!859361 () Bool)

(assert (=> b!924966 m!859361))

(declare-fun m!859363 () Bool)

(assert (=> b!924966 m!859363))

(declare-fun m!859365 () Bool)

(assert (=> b!924966 m!859365))

(declare-fun m!859367 () Bool)

(assert (=> b!924966 m!859367))

(declare-fun m!859369 () Bool)

(assert (=> b!924966 m!859369))

(declare-fun m!859371 () Bool)

(assert (=> b!924966 m!859371))

(declare-fun m!859373 () Bool)

(assert (=> b!924966 m!859373))

(assert (=> b!924966 m!859369))

(declare-fun m!859375 () Bool)

(assert (=> b!924966 m!859375))

(declare-fun m!859377 () Bool)

(assert (=> mapNonEmpty!31335 m!859377))

(declare-fun m!859379 () Bool)

(assert (=> b!924978 m!859379))

(declare-fun m!859381 () Bool)

(assert (=> start!78998 m!859381))

(declare-fun m!859383 () Bool)

(assert (=> start!78998 m!859383))

(declare-fun m!859385 () Bool)

(assert (=> start!78998 m!859385))

(declare-fun m!859387 () Bool)

(assert (=> b!924972 m!859387))

(assert (=> b!924972 m!859359))

(declare-fun m!859389 () Bool)

(assert (=> b!924973 m!859389))

(declare-fun m!859391 () Bool)

(assert (=> b!924974 m!859391))

(check-sat (not b_lambda!13713) (not b!924978) b_and!28161 (not mapNonEmpty!31335) tp_is_empty!19719 (not start!78998) (not b!924966) (not b!924973) (not b_next!17211) (not b!924972) (not b!924981) (not b!924975) (not b!924982) (not b!924971) (not b!924974) (not b!924965))
(check-sat b_and!28161 (not b_next!17211))
