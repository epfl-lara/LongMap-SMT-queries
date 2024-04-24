; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79092 () Bool)

(assert start!79092)

(declare-fun b_free!17137 () Bool)

(declare-fun b_next!17137 () Bool)

(assert (=> start!79092 (= b_free!17137 (not b_next!17137))))

(declare-fun tp!59853 () Bool)

(declare-fun b_and!28021 () Bool)

(assert (=> start!79092 (= tp!59853 b_and!28021)))

(declare-fun mapNonEmpty!31224 () Bool)

(declare-fun mapRes!31224 () Bool)

(declare-fun tp!59852 () Bool)

(declare-fun e!518417 () Bool)

(assert (=> mapNonEmpty!31224 (= mapRes!31224 (and tp!59852 e!518417))))

(declare-datatypes ((V!31159 0))(
  ( (V!31160 (val!9873 Int)) )
))
(declare-datatypes ((ValueCell!9341 0))(
  ( (ValueCellFull!9341 (v!12388 V!31159)) (EmptyCell!9341) )
))
(declare-datatypes ((array!55313 0))(
  ( (array!55314 (arr!26597 (Array (_ BitVec 32) ValueCell!9341)) (size!27057 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55313)

(declare-fun mapRest!31224 () (Array (_ BitVec 32) ValueCell!9341))

(declare-fun mapKey!31224 () (_ BitVec 32))

(declare-fun mapValue!31224 () ValueCell!9341)

(assert (=> mapNonEmpty!31224 (= (arr!26597 _values!1231) (store mapRest!31224 mapKey!31224 mapValue!31224))))

(declare-fun b!923844 () Bool)

(declare-fun res!622709 () Bool)

(declare-fun e!518415 () Bool)

(assert (=> b!923844 (=> (not res!622709) (not e!518415))))

(declare-datatypes ((array!55315 0))(
  ( (array!55316 (arr!26598 (Array (_ BitVec 32) (_ BitVec 64))) (size!27058 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55315)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55315 (_ BitVec 32)) Bool)

(assert (=> b!923844 (= res!622709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923845 () Bool)

(declare-fun res!622710 () Bool)

(assert (=> b!923845 (=> (not res!622710) (not e!518415))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923845 (= res!622710 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27058 _keys!1487))))))

(declare-fun b!923846 () Bool)

(declare-fun e!518420 () Bool)

(assert (=> b!923846 (= e!518420 (not (bvsle from!1844 (size!27058 _keys!1487))))))

(declare-fun lt!414888 () (_ BitVec 64))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!923846 (not (= lt!414888 k0!1099))))

(declare-datatypes ((Unit!31136 0))(
  ( (Unit!31137) )
))
(declare-fun lt!414885 () Unit!31136)

(declare-datatypes ((List!18658 0))(
  ( (Nil!18655) (Cons!18654 (h!19806 (_ BitVec 64)) (t!26517 List!18658)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55315 (_ BitVec 64) (_ BitVec 32) List!18658) Unit!31136)

(assert (=> b!923846 (= lt!414885 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18655))))

(declare-fun e!518416 () Bool)

(assert (=> b!923846 e!518416))

(declare-fun c!96489 () Bool)

(assert (=> b!923846 (= c!96489 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!414893 () Unit!31136)

(declare-fun zeroValue!1173 () V!31159)

(declare-fun minValue!1173 () V!31159)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!203 (array!55315 array!55313 (_ BitVec 32) (_ BitVec 32) V!31159 V!31159 (_ BitVec 64) (_ BitVec 32) Int) Unit!31136)

(assert (=> b!923846 (= lt!414893 (lemmaListMapContainsThenArrayContainsFrom!203 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55315 (_ BitVec 32) List!18658) Bool)

(assert (=> b!923846 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18655)))

(declare-fun lt!414891 () Unit!31136)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55315 (_ BitVec 32) (_ BitVec 32)) Unit!31136)

(assert (=> b!923846 (= lt!414891 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12842 0))(
  ( (tuple2!12843 (_1!6432 (_ BitVec 64)) (_2!6432 V!31159)) )
))
(declare-datatypes ((List!18659 0))(
  ( (Nil!18656) (Cons!18655 (h!19807 tuple2!12842) (t!26518 List!18659)) )
))
(declare-datatypes ((ListLongMap!11541 0))(
  ( (ListLongMap!11542 (toList!5786 List!18659)) )
))
(declare-fun lt!414889 () ListLongMap!11541)

(declare-fun lt!414890 () tuple2!12842)

(declare-fun contains!4859 (ListLongMap!11541 (_ BitVec 64)) Bool)

(declare-fun +!2712 (ListLongMap!11541 tuple2!12842) ListLongMap!11541)

(assert (=> b!923846 (contains!4859 (+!2712 lt!414889 lt!414890) k0!1099)))

(declare-fun lt!414892 () V!31159)

(declare-fun lt!414887 () Unit!31136)

(declare-fun addStillContains!421 (ListLongMap!11541 (_ BitVec 64) V!31159 (_ BitVec 64)) Unit!31136)

(assert (=> b!923846 (= lt!414887 (addStillContains!421 lt!414889 lt!414888 lt!414892 k0!1099))))

(declare-fun getCurrentListMap!3037 (array!55315 array!55313 (_ BitVec 32) (_ BitVec 32) V!31159 V!31159 (_ BitVec 32) Int) ListLongMap!11541)

(assert (=> b!923846 (= (getCurrentListMap!3037 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2712 (getCurrentListMap!3037 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414890))))

(assert (=> b!923846 (= lt!414890 (tuple2!12843 lt!414888 lt!414892))))

(declare-fun get!13993 (ValueCell!9341 V!31159) V!31159)

(declare-fun dynLambda!1509 (Int (_ BitVec 64)) V!31159)

(assert (=> b!923846 (= lt!414892 (get!13993 (select (arr!26597 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1509 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414886 () Unit!31136)

(declare-fun lemmaListMapRecursiveValidKeyArray!92 (array!55315 array!55313 (_ BitVec 32) (_ BitVec 32) V!31159 V!31159 (_ BitVec 32) Int) Unit!31136)

(assert (=> b!923846 (= lt!414886 (lemmaListMapRecursiveValidKeyArray!92 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923847 () Bool)

(assert (=> b!923847 (= e!518416 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923848 () Bool)

(declare-fun res!622712 () Bool)

(declare-fun e!518422 () Bool)

(assert (=> b!923848 (=> (not res!622712) (not e!518422))))

(assert (=> b!923848 (= res!622712 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!622714 () Bool)

(assert (=> start!79092 (=> (not res!622714) (not e!518415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79092 (= res!622714 (validMask!0 mask!1881))))

(assert (=> start!79092 e!518415))

(assert (=> start!79092 true))

(declare-fun tp_is_empty!19645 () Bool)

(assert (=> start!79092 tp_is_empty!19645))

(declare-fun e!518418 () Bool)

(declare-fun array_inv!20816 (array!55313) Bool)

(assert (=> start!79092 (and (array_inv!20816 _values!1231) e!518418)))

(assert (=> start!79092 tp!59853))

(declare-fun array_inv!20817 (array!55315) Bool)

(assert (=> start!79092 (array_inv!20817 _keys!1487)))

(declare-fun b!923849 () Bool)

(assert (=> b!923849 (= e!518417 tp_is_empty!19645)))

(declare-fun b!923850 () Bool)

(declare-fun arrayContainsKey!0 (array!55315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923850 (= e!518416 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923851 () Bool)

(assert (=> b!923851 (= e!518422 e!518420)))

(declare-fun res!622713 () Bool)

(assert (=> b!923851 (=> (not res!622713) (not e!518420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923851 (= res!622713 (validKeyInArray!0 lt!414888))))

(assert (=> b!923851 (= lt!414888 (select (arr!26598 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31224 () Bool)

(assert (=> mapIsEmpty!31224 mapRes!31224))

(declare-fun b!923852 () Bool)

(declare-fun res!622707 () Bool)

(assert (=> b!923852 (=> (not res!622707) (not e!518422))))

(declare-fun v!791 () V!31159)

(declare-fun apply!642 (ListLongMap!11541 (_ BitVec 64)) V!31159)

(assert (=> b!923852 (= res!622707 (= (apply!642 lt!414889 k0!1099) v!791))))

(declare-fun b!923853 () Bool)

(declare-fun res!622708 () Bool)

(assert (=> b!923853 (=> (not res!622708) (not e!518415))))

(assert (=> b!923853 (= res!622708 (and (= (size!27057 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27058 _keys!1487) (size!27057 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923854 () Bool)

(assert (=> b!923854 (= e!518415 e!518422)))

(declare-fun res!622716 () Bool)

(assert (=> b!923854 (=> (not res!622716) (not e!518422))))

(assert (=> b!923854 (= res!622716 (contains!4859 lt!414889 k0!1099))))

(assert (=> b!923854 (= lt!414889 (getCurrentListMap!3037 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923855 () Bool)

(declare-fun e!518419 () Bool)

(assert (=> b!923855 (= e!518418 (and e!518419 mapRes!31224))))

(declare-fun condMapEmpty!31224 () Bool)

(declare-fun mapDefault!31224 () ValueCell!9341)

(assert (=> b!923855 (= condMapEmpty!31224 (= (arr!26597 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9341)) mapDefault!31224)))))

(declare-fun b!923856 () Bool)

(declare-fun res!622711 () Bool)

(assert (=> b!923856 (=> (not res!622711) (not e!518415))))

(assert (=> b!923856 (= res!622711 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18655))))

(declare-fun b!923857 () Bool)

(declare-fun res!622715 () Bool)

(assert (=> b!923857 (=> (not res!622715) (not e!518422))))

(assert (=> b!923857 (= res!622715 (validKeyInArray!0 k0!1099))))

(declare-fun b!923858 () Bool)

(assert (=> b!923858 (= e!518419 tp_is_empty!19645)))

(assert (= (and start!79092 res!622714) b!923853))

(assert (= (and b!923853 res!622708) b!923844))

(assert (= (and b!923844 res!622709) b!923856))

(assert (= (and b!923856 res!622711) b!923845))

(assert (= (and b!923845 res!622710) b!923854))

(assert (= (and b!923854 res!622716) b!923852))

(assert (= (and b!923852 res!622707) b!923848))

(assert (= (and b!923848 res!622712) b!923857))

(assert (= (and b!923857 res!622715) b!923851))

(assert (= (and b!923851 res!622713) b!923846))

(assert (= (and b!923846 c!96489) b!923850))

(assert (= (and b!923846 (not c!96489)) b!923847))

(assert (= (and b!923855 condMapEmpty!31224) mapIsEmpty!31224))

(assert (= (and b!923855 (not condMapEmpty!31224)) mapNonEmpty!31224))

(get-info :version)

(assert (= (and mapNonEmpty!31224 ((_ is ValueCellFull!9341) mapValue!31224)) b!923849))

(assert (= (and b!923855 ((_ is ValueCellFull!9341) mapDefault!31224)) b!923858))

(assert (= start!79092 b!923855))

(declare-fun b_lambda!13653 () Bool)

(assert (=> (not b_lambda!13653) (not b!923846)))

(declare-fun t!26516 () Bool)

(declare-fun tb!5709 () Bool)

(assert (=> (and start!79092 (= defaultEntry!1235 defaultEntry!1235) t!26516) tb!5709))

(declare-fun result!11249 () Bool)

(assert (=> tb!5709 (= result!11249 tp_is_empty!19645)))

(assert (=> b!923846 t!26516))

(declare-fun b_and!28023 () Bool)

(assert (= b_and!28021 (and (=> t!26516 result!11249) b_and!28023)))

(declare-fun m!858379 () Bool)

(assert (=> b!923856 m!858379))

(declare-fun m!858381 () Bool)

(assert (=> b!923846 m!858381))

(declare-fun m!858383 () Bool)

(assert (=> b!923846 m!858383))

(declare-fun m!858385 () Bool)

(assert (=> b!923846 m!858385))

(declare-fun m!858387 () Bool)

(assert (=> b!923846 m!858387))

(declare-fun m!858389 () Bool)

(assert (=> b!923846 m!858389))

(declare-fun m!858391 () Bool)

(assert (=> b!923846 m!858391))

(declare-fun m!858393 () Bool)

(assert (=> b!923846 m!858393))

(declare-fun m!858395 () Bool)

(assert (=> b!923846 m!858395))

(assert (=> b!923846 m!858387))

(declare-fun m!858397 () Bool)

(assert (=> b!923846 m!858397))

(declare-fun m!858399 () Bool)

(assert (=> b!923846 m!858399))

(declare-fun m!858401 () Bool)

(assert (=> b!923846 m!858401))

(declare-fun m!858403 () Bool)

(assert (=> b!923846 m!858403))

(assert (=> b!923846 m!858399))

(assert (=> b!923846 m!858383))

(declare-fun m!858405 () Bool)

(assert (=> b!923846 m!858405))

(assert (=> b!923846 m!858401))

(declare-fun m!858407 () Bool)

(assert (=> b!923846 m!858407))

(declare-fun m!858409 () Bool)

(assert (=> start!79092 m!858409))

(declare-fun m!858411 () Bool)

(assert (=> start!79092 m!858411))

(declare-fun m!858413 () Bool)

(assert (=> start!79092 m!858413))

(declare-fun m!858415 () Bool)

(assert (=> b!923850 m!858415))

(declare-fun m!858417 () Bool)

(assert (=> mapNonEmpty!31224 m!858417))

(declare-fun m!858419 () Bool)

(assert (=> b!923844 m!858419))

(declare-fun m!858421 () Bool)

(assert (=> b!923857 m!858421))

(declare-fun m!858423 () Bool)

(assert (=> b!923854 m!858423))

(declare-fun m!858425 () Bool)

(assert (=> b!923854 m!858425))

(declare-fun m!858427 () Bool)

(assert (=> b!923852 m!858427))

(declare-fun m!858429 () Bool)

(assert (=> b!923851 m!858429))

(declare-fun m!858431 () Bool)

(assert (=> b!923851 m!858431))

(check-sat (not b!923844) (not b!923846) (not b!923857) (not b_next!17137) (not b!923852) b_and!28023 (not start!79092) (not mapNonEmpty!31224) (not b_lambda!13653) tp_is_empty!19645 (not b!923851) (not b!923854) (not b!923856) (not b!923850))
(check-sat b_and!28023 (not b_next!17137))
