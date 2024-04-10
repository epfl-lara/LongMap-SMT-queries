; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78818 () Bool)

(assert start!78818)

(declare-fun b_free!17031 () Bool)

(declare-fun b_next!17031 () Bool)

(assert (=> start!78818 (= b_free!17031 (not b_next!17031))))

(declare-fun tp!59533 () Bool)

(declare-fun b_and!27799 () Bool)

(assert (=> start!78818 (= tp!59533 b_and!27799)))

(declare-fun b!920215 () Bool)

(declare-fun e!516490 () Bool)

(declare-fun tp_is_empty!19539 () Bool)

(assert (=> b!920215 (= e!516490 tp_is_empty!19539)))

(declare-fun b!920216 () Bool)

(declare-fun e!516489 () Bool)

(assert (=> b!920216 (= e!516489 (not true))))

(declare-datatypes ((array!55058 0))(
  ( (array!55059 (arr!26474 (Array (_ BitVec 32) (_ BitVec 64))) (size!26933 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55058)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!18567 0))(
  ( (Nil!18564) (Cons!18563 (h!19709 (_ BitVec 64)) (t!26328 List!18567)) )
))
(declare-fun arrayNoDuplicates!0 (array!55058 (_ BitVec 32) List!18567) Bool)

(assert (=> b!920216 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18564)))

(declare-datatypes ((Unit!31056 0))(
  ( (Unit!31057) )
))
(declare-fun lt!413102 () Unit!31056)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55058 (_ BitVec 32) (_ BitVec 32)) Unit!31056)

(assert (=> b!920216 (= lt!413102 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31017 0))(
  ( (V!31018 (val!9820 Int)) )
))
(declare-datatypes ((tuple2!12764 0))(
  ( (tuple2!12765 (_1!6393 (_ BitVec 64)) (_2!6393 V!31017)) )
))
(declare-datatypes ((List!18568 0))(
  ( (Nil!18565) (Cons!18564 (h!19710 tuple2!12764) (t!26329 List!18568)) )
))
(declare-datatypes ((ListLongMap!11461 0))(
  ( (ListLongMap!11462 (toList!5746 List!18568)) )
))
(declare-fun lt!413105 () ListLongMap!11461)

(declare-fun lt!413106 () tuple2!12764)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4791 (ListLongMap!11461 (_ BitVec 64)) Bool)

(declare-fun +!2654 (ListLongMap!11461 tuple2!12764) ListLongMap!11461)

(assert (=> b!920216 (contains!4791 (+!2654 lt!413105 lt!413106) k0!1099)))

(declare-fun lt!413103 () (_ BitVec 64))

(declare-fun lt!413101 () Unit!31056)

(declare-fun lt!413104 () V!31017)

(declare-fun addStillContains!378 (ListLongMap!11461 (_ BitVec 64) V!31017 (_ BitVec 64)) Unit!31056)

(assert (=> b!920216 (= lt!413101 (addStillContains!378 lt!413105 lt!413103 lt!413104 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9288 0))(
  ( (ValueCellFull!9288 (v!12338 V!31017)) (EmptyCell!9288) )
))
(declare-datatypes ((array!55060 0))(
  ( (array!55061 (arr!26475 (Array (_ BitVec 32) ValueCell!9288)) (size!26934 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55060)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31017)

(declare-fun minValue!1173 () V!31017)

(declare-fun getCurrentListMap!3001 (array!55058 array!55060 (_ BitVec 32) (_ BitVec 32) V!31017 V!31017 (_ BitVec 32) Int) ListLongMap!11461)

(assert (=> b!920216 (= (getCurrentListMap!3001 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2654 (getCurrentListMap!3001 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413106))))

(assert (=> b!920216 (= lt!413106 (tuple2!12765 lt!413103 lt!413104))))

(declare-fun get!13887 (ValueCell!9288 V!31017) V!31017)

(declare-fun dynLambda!1443 (Int (_ BitVec 64)) V!31017)

(assert (=> b!920216 (= lt!413104 (get!13887 (select (arr!26475 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1443 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413107 () Unit!31056)

(declare-fun lemmaListMapRecursiveValidKeyArray!44 (array!55058 array!55060 (_ BitVec 32) (_ BitVec 32) V!31017 V!31017 (_ BitVec 32) Int) Unit!31056)

(assert (=> b!920216 (= lt!413107 (lemmaListMapRecursiveValidKeyArray!44 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920217 () Bool)

(declare-fun res!620538 () Bool)

(declare-fun e!516486 () Bool)

(assert (=> b!920217 (=> (not res!620538) (not e!516486))))

(declare-fun v!791 () V!31017)

(declare-fun apply!588 (ListLongMap!11461 (_ BitVec 64)) V!31017)

(assert (=> b!920217 (= res!620538 (= (apply!588 lt!413105 k0!1099) v!791))))

(declare-fun b!920218 () Bool)

(declare-fun res!620536 () Bool)

(assert (=> b!920218 (=> (not res!620536) (not e!516486))))

(assert (=> b!920218 (= res!620536 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920219 () Bool)

(declare-fun res!620532 () Bool)

(declare-fun e!516488 () Bool)

(assert (=> b!920219 (=> (not res!620532) (not e!516488))))

(assert (=> b!920219 (= res!620532 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26933 _keys!1487))))))

(declare-fun res!620530 () Bool)

(assert (=> start!78818 (=> (not res!620530) (not e!516488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78818 (= res!620530 (validMask!0 mask!1881))))

(assert (=> start!78818 e!516488))

(assert (=> start!78818 true))

(assert (=> start!78818 tp_is_empty!19539))

(declare-fun e!516485 () Bool)

(declare-fun array_inv!20632 (array!55060) Bool)

(assert (=> start!78818 (and (array_inv!20632 _values!1231) e!516485)))

(assert (=> start!78818 tp!59533))

(declare-fun array_inv!20633 (array!55058) Bool)

(assert (=> start!78818 (array_inv!20633 _keys!1487)))

(declare-fun b!920220 () Bool)

(declare-fun res!620539 () Bool)

(assert (=> b!920220 (=> (not res!620539) (not e!516488))))

(assert (=> b!920220 (= res!620539 (and (= (size!26934 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26933 _keys!1487) (size!26934 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31065 () Bool)

(declare-fun mapRes!31065 () Bool)

(assert (=> mapIsEmpty!31065 mapRes!31065))

(declare-fun mapNonEmpty!31065 () Bool)

(declare-fun tp!59534 () Bool)

(assert (=> mapNonEmpty!31065 (= mapRes!31065 (and tp!59534 e!516490))))

(declare-fun mapValue!31065 () ValueCell!9288)

(declare-fun mapRest!31065 () (Array (_ BitVec 32) ValueCell!9288))

(declare-fun mapKey!31065 () (_ BitVec 32))

(assert (=> mapNonEmpty!31065 (= (arr!26475 _values!1231) (store mapRest!31065 mapKey!31065 mapValue!31065))))

(declare-fun b!920221 () Bool)

(declare-fun res!620531 () Bool)

(assert (=> b!920221 (=> (not res!620531) (not e!516488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55058 (_ BitVec 32)) Bool)

(assert (=> b!920221 (= res!620531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920222 () Bool)

(declare-fun res!620534 () Bool)

(assert (=> b!920222 (=> (not res!620534) (not e!516488))))

(assert (=> b!920222 (= res!620534 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18564))))

(declare-fun b!920223 () Bool)

(declare-fun e!516484 () Bool)

(assert (=> b!920223 (= e!516484 tp_is_empty!19539)))

(declare-fun b!920224 () Bool)

(declare-fun res!620533 () Bool)

(assert (=> b!920224 (=> (not res!620533) (not e!516486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920224 (= res!620533 (validKeyInArray!0 k0!1099))))

(declare-fun b!920225 () Bool)

(assert (=> b!920225 (= e!516486 e!516489)))

(declare-fun res!620535 () Bool)

(assert (=> b!920225 (=> (not res!620535) (not e!516489))))

(assert (=> b!920225 (= res!620535 (validKeyInArray!0 lt!413103))))

(assert (=> b!920225 (= lt!413103 (select (arr!26474 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920226 () Bool)

(assert (=> b!920226 (= e!516485 (and e!516484 mapRes!31065))))

(declare-fun condMapEmpty!31065 () Bool)

(declare-fun mapDefault!31065 () ValueCell!9288)

(assert (=> b!920226 (= condMapEmpty!31065 (= (arr!26475 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9288)) mapDefault!31065)))))

(declare-fun b!920227 () Bool)

(assert (=> b!920227 (= e!516488 e!516486)))

(declare-fun res!620537 () Bool)

(assert (=> b!920227 (=> (not res!620537) (not e!516486))))

(assert (=> b!920227 (= res!620537 (contains!4791 lt!413105 k0!1099))))

(assert (=> b!920227 (= lt!413105 (getCurrentListMap!3001 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78818 res!620530) b!920220))

(assert (= (and b!920220 res!620539) b!920221))

(assert (= (and b!920221 res!620531) b!920222))

(assert (= (and b!920222 res!620534) b!920219))

(assert (= (and b!920219 res!620532) b!920227))

(assert (= (and b!920227 res!620537) b!920217))

(assert (= (and b!920217 res!620538) b!920218))

(assert (= (and b!920218 res!620536) b!920224))

(assert (= (and b!920224 res!620533) b!920225))

(assert (= (and b!920225 res!620535) b!920216))

(assert (= (and b!920226 condMapEmpty!31065) mapIsEmpty!31065))

(assert (= (and b!920226 (not condMapEmpty!31065)) mapNonEmpty!31065))

(get-info :version)

(assert (= (and mapNonEmpty!31065 ((_ is ValueCellFull!9288) mapValue!31065)) b!920215))

(assert (= (and b!920226 ((_ is ValueCellFull!9288) mapDefault!31065)) b!920223))

(assert (= start!78818 b!920226))

(declare-fun b_lambda!13533 () Bool)

(assert (=> (not b_lambda!13533) (not b!920216)))

(declare-fun t!26327 () Bool)

(declare-fun tb!5611 () Bool)

(assert (=> (and start!78818 (= defaultEntry!1235 defaultEntry!1235) t!26327) tb!5611))

(declare-fun result!11045 () Bool)

(assert (=> tb!5611 (= result!11045 tp_is_empty!19539)))

(assert (=> b!920216 t!26327))

(declare-fun b_and!27801 () Bool)

(assert (= b_and!27799 (and (=> t!26327 result!11045) b_and!27801)))

(declare-fun m!854127 () Bool)

(assert (=> b!920221 m!854127))

(declare-fun m!854129 () Bool)

(assert (=> b!920222 m!854129))

(declare-fun m!854131 () Bool)

(assert (=> start!78818 m!854131))

(declare-fun m!854133 () Bool)

(assert (=> start!78818 m!854133))

(declare-fun m!854135 () Bool)

(assert (=> start!78818 m!854135))

(declare-fun m!854137 () Bool)

(assert (=> mapNonEmpty!31065 m!854137))

(declare-fun m!854139 () Bool)

(assert (=> b!920224 m!854139))

(declare-fun m!854141 () Bool)

(assert (=> b!920217 m!854141))

(declare-fun m!854143 () Bool)

(assert (=> b!920216 m!854143))

(declare-fun m!854145 () Bool)

(assert (=> b!920216 m!854145))

(declare-fun m!854147 () Bool)

(assert (=> b!920216 m!854147))

(declare-fun m!854149 () Bool)

(assert (=> b!920216 m!854149))

(assert (=> b!920216 m!854147))

(declare-fun m!854151 () Bool)

(assert (=> b!920216 m!854151))

(declare-fun m!854153 () Bool)

(assert (=> b!920216 m!854153))

(declare-fun m!854155 () Bool)

(assert (=> b!920216 m!854155))

(declare-fun m!854157 () Bool)

(assert (=> b!920216 m!854157))

(assert (=> b!920216 m!854151))

(declare-fun m!854159 () Bool)

(assert (=> b!920216 m!854159))

(assert (=> b!920216 m!854159))

(declare-fun m!854161 () Bool)

(assert (=> b!920216 m!854161))

(declare-fun m!854163 () Bool)

(assert (=> b!920216 m!854163))

(assert (=> b!920216 m!854143))

(declare-fun m!854165 () Bool)

(assert (=> b!920216 m!854165))

(declare-fun m!854167 () Bool)

(assert (=> b!920227 m!854167))

(declare-fun m!854169 () Bool)

(assert (=> b!920227 m!854169))

(declare-fun m!854171 () Bool)

(assert (=> b!920225 m!854171))

(declare-fun m!854173 () Bool)

(assert (=> b!920225 m!854173))

(check-sat (not b!920224) (not b!920216) (not b_lambda!13533) (not mapNonEmpty!31065) tp_is_empty!19539 (not b!920227) (not b!920225) (not start!78818) (not b!920222) (not b_next!17031) (not b!920217) b_and!27801 (not b!920221))
(check-sat b_and!27801 (not b_next!17031))
