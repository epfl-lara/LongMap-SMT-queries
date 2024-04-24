; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79950 () Bool)

(assert start!79950)

(declare-fun b_free!17755 () Bool)

(declare-fun b_next!17755 () Bool)

(assert (=> start!79950 (= b_free!17755 (not b_next!17755))))

(declare-fun tp!61726 () Bool)

(declare-fun b_and!29135 () Bool)

(assert (=> start!79950 (= tp!61726 b_and!29135)))

(declare-fun b!939288 () Bool)

(declare-fun res!631723 () Bool)

(declare-fun e!527586 () Bool)

(assert (=> b!939288 (=> (not res!631723) (not e!527586))))

(declare-datatypes ((array!56517 0))(
  ( (array!56518 (arr!27193 (Array (_ BitVec 32) (_ BitVec 64))) (size!27653 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56517)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31983 0))(
  ( (V!31984 (val!10182 Int)) )
))
(declare-datatypes ((ValueCell!9650 0))(
  ( (ValueCellFull!9650 (v!12707 V!31983)) (EmptyCell!9650) )
))
(declare-datatypes ((array!56519 0))(
  ( (array!56520 (arr!27194 (Array (_ BitVec 32) ValueCell!9650)) (size!27654 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56519)

(assert (=> b!939288 (= res!631723 (and (= (size!27654 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27653 _keys!1487) (size!27654 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!939290 () Bool)

(declare-fun e!527587 () Bool)

(declare-fun e!527588 () Bool)

(assert (=> b!939290 (= e!527587 e!527588)))

(declare-fun res!631721 () Bool)

(assert (=> b!939290 (=> (not res!631721) (not e!527588))))

(declare-datatypes ((tuple2!13366 0))(
  ( (tuple2!13367 (_1!6694 (_ BitVec 64)) (_2!6694 V!31983)) )
))
(declare-datatypes ((List!19146 0))(
  ( (Nil!19143) (Cons!19142 (h!20294 tuple2!13366) (t!27437 List!19146)) )
))
(declare-datatypes ((ListLongMap!12065 0))(
  ( (ListLongMap!12066 (toList!6048 List!19146)) )
))
(declare-fun lt!424102 () ListLongMap!12065)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5120 (ListLongMap!12065 (_ BitVec 64)) Bool)

(assert (=> b!939290 (= res!631721 (contains!5120 lt!424102 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31983)

(declare-fun minValue!1173 () V!31983)

(declare-fun getCurrentListMap!3283 (array!56517 array!56519 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 32) Int) ListLongMap!12065)

(assert (=> b!939290 (= lt!424102 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939291 () Bool)

(declare-fun lt!424097 () ListLongMap!12065)

(declare-fun lt!424096 () V!31983)

(declare-fun apply!865 (ListLongMap!12065 (_ BitVec 64)) V!31983)

(assert (=> b!939291 (= (apply!865 lt!424097 k0!1099) lt!424096)))

(declare-fun lt!424101 () (_ BitVec 64))

(declare-fun lt!424105 () V!31983)

(declare-fun lt!424107 () ListLongMap!12065)

(declare-datatypes ((Unit!31682 0))(
  ( (Unit!31683) )
))
(declare-fun lt!424099 () Unit!31682)

(declare-fun addApplyDifferent!440 (ListLongMap!12065 (_ BitVec 64) V!31983 (_ BitVec 64)) Unit!31682)

(assert (=> b!939291 (= lt!424099 (addApplyDifferent!440 lt!424107 lt!424101 lt!424105 k0!1099))))

(assert (=> b!939291 (not (= lt!424101 k0!1099))))

(declare-fun lt!424108 () Unit!31682)

(declare-datatypes ((List!19147 0))(
  ( (Nil!19144) (Cons!19143 (h!20295 (_ BitVec 64)) (t!27438 List!19147)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56517 (_ BitVec 64) (_ BitVec 32) List!19147) Unit!31682)

(assert (=> b!939291 (= lt!424108 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19144))))

(declare-fun e!527589 () Bool)

(assert (=> b!939291 e!527589))

(declare-fun c!98072 () Bool)

(assert (=> b!939291 (= c!98072 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!424103 () Unit!31682)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!310 (array!56517 array!56519 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 64) (_ BitVec 32) Int) Unit!31682)

(assert (=> b!939291 (= lt!424103 (lemmaListMapContainsThenArrayContainsFrom!310 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56517 (_ BitVec 32) List!19147) Bool)

(assert (=> b!939291 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19144)))

(declare-fun lt!424106 () Unit!31682)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56517 (_ BitVec 32) (_ BitVec 32)) Unit!31682)

(assert (=> b!939291 (= lt!424106 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!939291 (contains!5120 lt!424097 k0!1099)))

(declare-fun lt!424100 () tuple2!13366)

(declare-fun +!2856 (ListLongMap!12065 tuple2!13366) ListLongMap!12065)

(assert (=> b!939291 (= lt!424097 (+!2856 lt!424107 lt!424100))))

(declare-fun lt!424095 () Unit!31682)

(declare-fun addStillContains!559 (ListLongMap!12065 (_ BitVec 64) V!31983 (_ BitVec 64)) Unit!31682)

(assert (=> b!939291 (= lt!424095 (addStillContains!559 lt!424107 lt!424101 lt!424105 k0!1099))))

(assert (=> b!939291 (= (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2856 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424100))))

(assert (=> b!939291 (= lt!424100 (tuple2!13367 lt!424101 lt!424105))))

(declare-fun get!14361 (ValueCell!9650 V!31983) V!31983)

(declare-fun dynLambda!1653 (Int (_ BitVec 64)) V!31983)

(assert (=> b!939291 (= lt!424105 (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424098 () Unit!31682)

(declare-fun lemmaListMapRecursiveValidKeyArray!236 (array!56517 array!56519 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 32) Int) Unit!31682)

(assert (=> b!939291 (= lt!424098 (lemmaListMapRecursiveValidKeyArray!236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!527590 () Unit!31682)

(assert (=> b!939291 (= e!527590 lt!424099)))

(declare-fun b!939292 () Bool)

(declare-fun e!527584 () Bool)

(declare-fun e!527583 () Bool)

(assert (=> b!939292 (= e!527584 e!527583)))

(declare-fun res!631724 () Bool)

(assert (=> b!939292 (=> (not res!631724) (not e!527583))))

(declare-fun v!791 () V!31983)

(assert (=> b!939292 (= res!631724 (and (= lt!424096 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!939292 (= lt!424096 (apply!865 lt!424107 k0!1099))))

(declare-fun b!939293 () Bool)

(assert (=> b!939293 (= e!527589 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!939294 () Bool)

(declare-fun res!631720 () Bool)

(assert (=> b!939294 (=> (not res!631720) (not e!527586))))

(assert (=> b!939294 (= res!631720 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27653 _keys!1487))))))

(declare-fun b!939295 () Bool)

(declare-fun arrayContainsKey!0 (array!56517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939295 (= e!527589 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!939296 () Bool)

(assert (=> b!939296 (= e!527588 (not (= (apply!865 lt!424102 k0!1099) v!791)))))

(declare-fun b!939297 () Bool)

(declare-fun res!631725 () Bool)

(assert (=> b!939297 (=> (not res!631725) (not e!527586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56517 (_ BitVec 32)) Bool)

(assert (=> b!939297 (= res!631725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!939298 () Bool)

(declare-fun e!527585 () Unit!31682)

(assert (=> b!939298 (= e!527585 e!527590)))

(assert (=> b!939298 (= lt!424101 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!98070 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939298 (= c!98070 (validKeyInArray!0 lt!424101))))

(declare-fun b!939299 () Bool)

(declare-fun e!527581 () Bool)

(declare-fun e!527591 () Bool)

(declare-fun mapRes!32170 () Bool)

(assert (=> b!939299 (= e!527581 (and e!527591 mapRes!32170))))

(declare-fun condMapEmpty!32170 () Bool)

(declare-fun mapDefault!32170 () ValueCell!9650)

(assert (=> b!939299 (= condMapEmpty!32170 (= (arr!27194 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9650)) mapDefault!32170)))))

(declare-fun b!939289 () Bool)

(assert (=> b!939289 (= e!527586 e!527584)))

(declare-fun res!631719 () Bool)

(assert (=> b!939289 (=> (not res!631719) (not e!527584))))

(assert (=> b!939289 (= res!631719 (contains!5120 lt!424107 k0!1099))))

(assert (=> b!939289 (= lt!424107 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!631722 () Bool)

(assert (=> start!79950 (=> (not res!631722) (not e!527586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79950 (= res!631722 (validMask!0 mask!1881))))

(assert (=> start!79950 e!527586))

(assert (=> start!79950 true))

(declare-fun tp_is_empty!20263 () Bool)

(assert (=> start!79950 tp_is_empty!20263))

(declare-fun array_inv!21236 (array!56519) Bool)

(assert (=> start!79950 (and (array_inv!21236 _values!1231) e!527581)))

(assert (=> start!79950 tp!61726))

(declare-fun array_inv!21237 (array!56517) Bool)

(assert (=> start!79950 (array_inv!21237 _keys!1487)))

(declare-fun mapNonEmpty!32170 () Bool)

(declare-fun tp!61725 () Bool)

(declare-fun e!527592 () Bool)

(assert (=> mapNonEmpty!32170 (= mapRes!32170 (and tp!61725 e!527592))))

(declare-fun mapKey!32170 () (_ BitVec 32))

(declare-fun mapRest!32170 () (Array (_ BitVec 32) ValueCell!9650))

(declare-fun mapValue!32170 () ValueCell!9650)

(assert (=> mapNonEmpty!32170 (= (arr!27194 _values!1231) (store mapRest!32170 mapKey!32170 mapValue!32170))))

(declare-fun b!939300 () Bool)

(assert (=> b!939300 (= e!527591 tp_is_empty!20263)))

(declare-fun b!939301 () Bool)

(declare-fun Unit!31684 () Unit!31682)

(assert (=> b!939301 (= e!527585 Unit!31684)))

(declare-fun b!939302 () Bool)

(declare-fun Unit!31685 () Unit!31682)

(assert (=> b!939302 (= e!527590 Unit!31685)))

(declare-fun b!939303 () Bool)

(declare-fun res!631718 () Bool)

(assert (=> b!939303 (=> (not res!631718) (not e!527586))))

(assert (=> b!939303 (= res!631718 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19144))))

(declare-fun mapIsEmpty!32170 () Bool)

(assert (=> mapIsEmpty!32170 mapRes!32170))

(declare-fun b!939304 () Bool)

(assert (=> b!939304 (= e!527583 e!527587)))

(declare-fun res!631717 () Bool)

(assert (=> b!939304 (=> (not res!631717) (not e!527587))))

(assert (=> b!939304 (= res!631717 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun lt!424104 () Unit!31682)

(assert (=> b!939304 (= lt!424104 e!527585)))

(declare-fun c!98071 () Bool)

(assert (=> b!939304 (= c!98071 (validKeyInArray!0 k0!1099))))

(declare-fun b!939305 () Bool)

(assert (=> b!939305 (= e!527592 tp_is_empty!20263)))

(assert (= (and start!79950 res!631722) b!939288))

(assert (= (and b!939288 res!631723) b!939297))

(assert (= (and b!939297 res!631725) b!939303))

(assert (= (and b!939303 res!631718) b!939294))

(assert (= (and b!939294 res!631720) b!939289))

(assert (= (and b!939289 res!631719) b!939292))

(assert (= (and b!939292 res!631724) b!939304))

(assert (= (and b!939304 c!98071) b!939298))

(assert (= (and b!939304 (not c!98071)) b!939301))

(assert (= (and b!939298 c!98070) b!939291))

(assert (= (and b!939298 (not c!98070)) b!939302))

(assert (= (and b!939291 c!98072) b!939295))

(assert (= (and b!939291 (not c!98072)) b!939293))

(assert (= (and b!939304 res!631717) b!939290))

(assert (= (and b!939290 res!631721) b!939296))

(assert (= (and b!939299 condMapEmpty!32170) mapIsEmpty!32170))

(assert (= (and b!939299 (not condMapEmpty!32170)) mapNonEmpty!32170))

(get-info :version)

(assert (= (and mapNonEmpty!32170 ((_ is ValueCellFull!9650) mapValue!32170)) b!939305))

(assert (= (and b!939299 ((_ is ValueCellFull!9650) mapDefault!32170)) b!939300))

(assert (= start!79950 b!939299))

(declare-fun b_lambda!14225 () Bool)

(assert (=> (not b_lambda!14225) (not b!939291)))

(declare-fun t!27436 () Bool)

(declare-fun tb!6141 () Bool)

(assert (=> (and start!79950 (= defaultEntry!1235 defaultEntry!1235) t!27436) tb!6141))

(declare-fun result!12125 () Bool)

(assert (=> tb!6141 (= result!12125 tp_is_empty!20263)))

(assert (=> b!939291 t!27436))

(declare-fun b_and!29137 () Bool)

(assert (= b_and!29135 (and (=> t!27436 result!12125) b_and!29137)))

(declare-fun m!874989 () Bool)

(assert (=> mapNonEmpty!32170 m!874989))

(declare-fun m!874991 () Bool)

(assert (=> b!939290 m!874991))

(declare-fun m!874993 () Bool)

(assert (=> b!939290 m!874993))

(declare-fun m!874995 () Bool)

(assert (=> b!939304 m!874995))

(declare-fun m!874997 () Bool)

(assert (=> b!939291 m!874997))

(declare-fun m!874999 () Bool)

(assert (=> b!939291 m!874999))

(declare-fun m!875001 () Bool)

(assert (=> b!939291 m!875001))

(declare-fun m!875003 () Bool)

(assert (=> b!939291 m!875003))

(declare-fun m!875005 () Bool)

(assert (=> b!939291 m!875005))

(declare-fun m!875007 () Bool)

(assert (=> b!939291 m!875007))

(assert (=> b!939291 m!874993))

(declare-fun m!875009 () Bool)

(assert (=> b!939291 m!875009))

(declare-fun m!875011 () Bool)

(assert (=> b!939291 m!875011))

(declare-fun m!875013 () Bool)

(assert (=> b!939291 m!875013))

(declare-fun m!875015 () Bool)

(assert (=> b!939291 m!875015))

(declare-fun m!875017 () Bool)

(assert (=> b!939291 m!875017))

(declare-fun m!875019 () Bool)

(assert (=> b!939291 m!875019))

(declare-fun m!875021 () Bool)

(assert (=> b!939291 m!875021))

(assert (=> b!939291 m!875003))

(assert (=> b!939291 m!875007))

(declare-fun m!875023 () Bool)

(assert (=> b!939291 m!875023))

(assert (=> b!939291 m!875015))

(declare-fun m!875025 () Bool)

(assert (=> b!939291 m!875025))

(declare-fun m!875027 () Bool)

(assert (=> b!939297 m!875027))

(declare-fun m!875029 () Bool)

(assert (=> b!939295 m!875029))

(declare-fun m!875031 () Bool)

(assert (=> b!939298 m!875031))

(declare-fun m!875033 () Bool)

(assert (=> b!939298 m!875033))

(declare-fun m!875035 () Bool)

(assert (=> b!939296 m!875035))

(declare-fun m!875037 () Bool)

(assert (=> b!939303 m!875037))

(declare-fun m!875039 () Bool)

(assert (=> b!939292 m!875039))

(declare-fun m!875041 () Bool)

(assert (=> b!939289 m!875041))

(declare-fun m!875043 () Bool)

(assert (=> b!939289 m!875043))

(declare-fun m!875045 () Bool)

(assert (=> start!79950 m!875045))

(declare-fun m!875047 () Bool)

(assert (=> start!79950 m!875047))

(declare-fun m!875049 () Bool)

(assert (=> start!79950 m!875049))

(check-sat (not start!79950) (not b!939290) (not b!939304) (not b!939303) (not b!939292) (not mapNonEmpty!32170) tp_is_empty!20263 b_and!29137 (not b!939296) (not b!939298) (not b!939291) (not b!939297) (not b!939289) (not b!939295) (not b_lambda!14225) (not b_next!17755))
(check-sat b_and!29137 (not b_next!17755))
(get-model)

(declare-fun b_lambda!14231 () Bool)

(assert (= b_lambda!14225 (or (and start!79950 b_free!17755) b_lambda!14231)))

(check-sat (not start!79950) (not b!939290) (not b!939304) (not b!939303) (not b!939292) (not mapNonEmpty!32170) tp_is_empty!20263 b_and!29137 (not b_lambda!14231) (not b_next!17755) (not b!939296) (not b!939298) (not b!939291) (not b!939297) (not b!939289) (not b!939295))
(check-sat b_and!29137 (not b_next!17755))
(get-model)

(declare-fun d!113955 () Bool)

(declare-fun e!527670 () Bool)

(assert (=> d!113955 e!527670))

(declare-fun res!631782 () Bool)

(assert (=> d!113955 (=> res!631782 e!527670)))

(declare-fun lt!424202 () Bool)

(assert (=> d!113955 (= res!631782 (not lt!424202))))

(declare-fun lt!424203 () Bool)

(assert (=> d!113955 (= lt!424202 lt!424203)))

(declare-fun lt!424201 () Unit!31682)

(declare-fun e!527669 () Unit!31682)

(assert (=> d!113955 (= lt!424201 e!527669)))

(declare-fun c!98093 () Bool)

(assert (=> d!113955 (= c!98093 lt!424203)))

(declare-fun containsKey!453 (List!19146 (_ BitVec 64)) Bool)

(assert (=> d!113955 (= lt!424203 (containsKey!453 (toList!6048 lt!424107) k0!1099))))

(assert (=> d!113955 (= (contains!5120 lt!424107 k0!1099) lt!424202)))

(declare-fun b!939426 () Bool)

(declare-fun lt!424204 () Unit!31682)

(assert (=> b!939426 (= e!527669 lt!424204)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!347 (List!19146 (_ BitVec 64)) Unit!31682)

(assert (=> b!939426 (= lt!424204 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424107) k0!1099))))

(declare-datatypes ((Option!488 0))(
  ( (Some!487 (v!12710 V!31983)) (None!486) )
))
(declare-fun isDefined!355 (Option!488) Bool)

(declare-fun getValueByKey!482 (List!19146 (_ BitVec 64)) Option!488)

(assert (=> b!939426 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424107) k0!1099))))

(declare-fun b!939427 () Bool)

(declare-fun Unit!31691 () Unit!31682)

(assert (=> b!939427 (= e!527669 Unit!31691)))

(declare-fun b!939428 () Bool)

(assert (=> b!939428 (= e!527670 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424107) k0!1099)))))

(assert (= (and d!113955 c!98093) b!939426))

(assert (= (and d!113955 (not c!98093)) b!939427))

(assert (= (and d!113955 (not res!631782)) b!939428))

(declare-fun m!875175 () Bool)

(assert (=> d!113955 m!875175))

(declare-fun m!875177 () Bool)

(assert (=> b!939426 m!875177))

(declare-fun m!875179 () Bool)

(assert (=> b!939426 m!875179))

(assert (=> b!939426 m!875179))

(declare-fun m!875181 () Bool)

(assert (=> b!939426 m!875181))

(assert (=> b!939428 m!875179))

(assert (=> b!939428 m!875179))

(assert (=> b!939428 m!875181))

(assert (=> b!939289 d!113955))

(declare-fun bm!40884 () Bool)

(declare-fun call!40893 () Bool)

(declare-fun lt!424259 () ListLongMap!12065)

(assert (=> bm!40884 (= call!40893 (contains!5120 lt!424259 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939471 () Bool)

(declare-fun e!527697 () Bool)

(assert (=> b!939471 (= e!527697 (validKeyInArray!0 (select (arr!27193 _keys!1487) from!1844)))))

(declare-fun b!939472 () Bool)

(declare-fun e!527701 () Bool)

(declare-fun e!527703 () Bool)

(assert (=> b!939472 (= e!527701 e!527703)))

(declare-fun c!98110 () Bool)

(assert (=> b!939472 (= c!98110 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!939473 () Bool)

(declare-fun e!527709 () Bool)

(assert (=> b!939473 (= e!527709 (not call!40893))))

(declare-fun bm!40886 () Bool)

(declare-fun call!40889 () ListLongMap!12065)

(declare-fun call!40892 () ListLongMap!12065)

(assert (=> bm!40886 (= call!40889 call!40892)))

(declare-fun b!939474 () Bool)

(declare-fun e!527698 () Bool)

(assert (=> b!939474 (= e!527698 (validKeyInArray!0 (select (arr!27193 _keys!1487) from!1844)))))

(declare-fun c!98109 () Bool)

(declare-fun c!98111 () Bool)

(declare-fun bm!40887 () Bool)

(declare-fun call!40887 () ListLongMap!12065)

(declare-fun call!40890 () ListLongMap!12065)

(declare-fun call!40891 () ListLongMap!12065)

(assert (=> bm!40887 (= call!40892 (+!2856 (ite c!98111 call!40887 (ite c!98109 call!40891 call!40890)) (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!939475 () Bool)

(declare-fun call!40888 () Bool)

(assert (=> b!939475 (= e!527703 (not call!40888))))

(declare-fun b!939476 () Bool)

(declare-fun e!527700 () Bool)

(assert (=> b!939476 (= e!527703 e!527700)))

(declare-fun res!631809 () Bool)

(assert (=> b!939476 (= res!631809 call!40888)))

(assert (=> b!939476 (=> (not res!631809) (not e!527700))))

(declare-fun b!939477 () Bool)

(declare-fun e!527704 () Bool)

(declare-fun e!527705 () Bool)

(assert (=> b!939477 (= e!527704 e!527705)))

(declare-fun res!631804 () Bool)

(assert (=> b!939477 (=> (not res!631804) (not e!527705))))

(assert (=> b!939477 (= res!631804 (contains!5120 lt!424259 (select (arr!27193 _keys!1487) from!1844)))))

(assert (=> b!939477 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27653 _keys!1487)))))

(declare-fun b!939478 () Bool)

(declare-fun e!527702 () ListLongMap!12065)

(assert (=> b!939478 (= e!527702 call!40889)))

(declare-fun b!939479 () Bool)

(declare-fun e!527707 () Bool)

(assert (=> b!939479 (= e!527709 e!527707)))

(declare-fun res!631802 () Bool)

(assert (=> b!939479 (= res!631802 call!40893)))

(assert (=> b!939479 (=> (not res!631802) (not e!527707))))

(declare-fun b!939480 () Bool)

(assert (=> b!939480 (= e!527700 (= (apply!865 lt!424259 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40888 () Bool)

(assert (=> bm!40888 (= call!40891 call!40887)))

(declare-fun d!113957 () Bool)

(assert (=> d!113957 e!527701))

(declare-fun res!631803 () Bool)

(assert (=> d!113957 (=> (not res!631803) (not e!527701))))

(assert (=> d!113957 (= res!631803 (or (bvsge from!1844 (size!27653 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27653 _keys!1487)))))))

(declare-fun lt!424263 () ListLongMap!12065)

(assert (=> d!113957 (= lt!424259 lt!424263)))

(declare-fun lt!424262 () Unit!31682)

(declare-fun e!527708 () Unit!31682)

(assert (=> d!113957 (= lt!424262 e!527708)))

(declare-fun c!98108 () Bool)

(assert (=> d!113957 (= c!98108 e!527697)))

(declare-fun res!631805 () Bool)

(assert (=> d!113957 (=> (not res!631805) (not e!527697))))

(assert (=> d!113957 (= res!631805 (bvslt from!1844 (size!27653 _keys!1487)))))

(declare-fun e!527706 () ListLongMap!12065)

(assert (=> d!113957 (= lt!424263 e!527706)))

(assert (=> d!113957 (= c!98111 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113957 (validMask!0 mask!1881)))

(assert (=> d!113957 (= (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!424259)))

(declare-fun bm!40885 () Bool)

(assert (=> bm!40885 (= call!40888 (contains!5120 lt!424259 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939481 () Bool)

(assert (=> b!939481 (= e!527705 (= (apply!865 lt!424259 (select (arr!27193 _keys!1487) from!1844)) (get!14361 (select (arr!27194 _values!1231) from!1844) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939481 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27654 _values!1231)))))

(assert (=> b!939481 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27653 _keys!1487)))))

(declare-fun b!939482 () Bool)

(assert (=> b!939482 (= e!527702 call!40890)))

(declare-fun b!939483 () Bool)

(declare-fun c!98107 () Bool)

(assert (=> b!939483 (= c!98107 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!527699 () ListLongMap!12065)

(assert (=> b!939483 (= e!527699 e!527702)))

(declare-fun b!939484 () Bool)

(assert (=> b!939484 (= e!527707 (= (apply!865 lt!424259 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40889 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3348 (array!56517 array!56519 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 32) Int) ListLongMap!12065)

(assert (=> bm!40889 (= call!40887 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!939485 () Bool)

(assert (=> b!939485 (= e!527699 call!40889)))

(declare-fun b!939486 () Bool)

(assert (=> b!939486 (= e!527706 (+!2856 call!40892 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!939487 () Bool)

(declare-fun lt!424268 () Unit!31682)

(assert (=> b!939487 (= e!527708 lt!424268)))

(declare-fun lt!424258 () ListLongMap!12065)

(assert (=> b!939487 (= lt!424258 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!424269 () (_ BitVec 64))

(assert (=> b!939487 (= lt!424269 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424253 () (_ BitVec 64))

(assert (=> b!939487 (= lt!424253 (select (arr!27193 _keys!1487) from!1844))))

(declare-fun lt!424266 () Unit!31682)

(assert (=> b!939487 (= lt!424266 (addStillContains!559 lt!424258 lt!424269 zeroValue!1173 lt!424253))))

(assert (=> b!939487 (contains!5120 (+!2856 lt!424258 (tuple2!13367 lt!424269 zeroValue!1173)) lt!424253)))

(declare-fun lt!424254 () Unit!31682)

(assert (=> b!939487 (= lt!424254 lt!424266)))

(declare-fun lt!424270 () ListLongMap!12065)

(assert (=> b!939487 (= lt!424270 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!424260 () (_ BitVec 64))

(assert (=> b!939487 (= lt!424260 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424249 () (_ BitVec 64))

(assert (=> b!939487 (= lt!424249 (select (arr!27193 _keys!1487) from!1844))))

(declare-fun lt!424255 () Unit!31682)

(assert (=> b!939487 (= lt!424255 (addApplyDifferent!440 lt!424270 lt!424260 minValue!1173 lt!424249))))

(assert (=> b!939487 (= (apply!865 (+!2856 lt!424270 (tuple2!13367 lt!424260 minValue!1173)) lt!424249) (apply!865 lt!424270 lt!424249))))

(declare-fun lt!424257 () Unit!31682)

(assert (=> b!939487 (= lt!424257 lt!424255)))

(declare-fun lt!424261 () ListLongMap!12065)

(assert (=> b!939487 (= lt!424261 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!424265 () (_ BitVec 64))

(assert (=> b!939487 (= lt!424265 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424251 () (_ BitVec 64))

(assert (=> b!939487 (= lt!424251 (select (arr!27193 _keys!1487) from!1844))))

(declare-fun lt!424267 () Unit!31682)

(assert (=> b!939487 (= lt!424267 (addApplyDifferent!440 lt!424261 lt!424265 zeroValue!1173 lt!424251))))

(assert (=> b!939487 (= (apply!865 (+!2856 lt!424261 (tuple2!13367 lt!424265 zeroValue!1173)) lt!424251) (apply!865 lt!424261 lt!424251))))

(declare-fun lt!424252 () Unit!31682)

(assert (=> b!939487 (= lt!424252 lt!424267)))

(declare-fun lt!424264 () ListLongMap!12065)

(assert (=> b!939487 (= lt!424264 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!424250 () (_ BitVec 64))

(assert (=> b!939487 (= lt!424250 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424256 () (_ BitVec 64))

(assert (=> b!939487 (= lt!424256 (select (arr!27193 _keys!1487) from!1844))))

(assert (=> b!939487 (= lt!424268 (addApplyDifferent!440 lt!424264 lt!424250 minValue!1173 lt!424256))))

(assert (=> b!939487 (= (apply!865 (+!2856 lt!424264 (tuple2!13367 lt!424250 minValue!1173)) lt!424256) (apply!865 lt!424264 lt!424256))))

(declare-fun b!939488 () Bool)

(declare-fun res!631801 () Bool)

(assert (=> b!939488 (=> (not res!631801) (not e!527701))))

(assert (=> b!939488 (= res!631801 e!527709)))

(declare-fun c!98106 () Bool)

(assert (=> b!939488 (= c!98106 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40890 () Bool)

(assert (=> bm!40890 (= call!40890 call!40891)))

(declare-fun b!939489 () Bool)

(declare-fun Unit!31692 () Unit!31682)

(assert (=> b!939489 (= e!527708 Unit!31692)))

(declare-fun b!939490 () Bool)

(assert (=> b!939490 (= e!527706 e!527699)))

(assert (=> b!939490 (= c!98109 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!939491 () Bool)

(declare-fun res!631808 () Bool)

(assert (=> b!939491 (=> (not res!631808) (not e!527701))))

(assert (=> b!939491 (= res!631808 e!527704)))

(declare-fun res!631806 () Bool)

(assert (=> b!939491 (=> res!631806 e!527704)))

(assert (=> b!939491 (= res!631806 (not e!527698))))

(declare-fun res!631807 () Bool)

(assert (=> b!939491 (=> (not res!631807) (not e!527698))))

(assert (=> b!939491 (= res!631807 (bvslt from!1844 (size!27653 _keys!1487)))))

(assert (= (and d!113957 c!98111) b!939486))

(assert (= (and d!113957 (not c!98111)) b!939490))

(assert (= (and b!939490 c!98109) b!939485))

(assert (= (and b!939490 (not c!98109)) b!939483))

(assert (= (and b!939483 c!98107) b!939478))

(assert (= (and b!939483 (not c!98107)) b!939482))

(assert (= (or b!939478 b!939482) bm!40890))

(assert (= (or b!939485 bm!40890) bm!40888))

(assert (= (or b!939485 b!939478) bm!40886))

(assert (= (or b!939486 bm!40888) bm!40889))

(assert (= (or b!939486 bm!40886) bm!40887))

(assert (= (and d!113957 res!631805) b!939471))

(assert (= (and d!113957 c!98108) b!939487))

(assert (= (and d!113957 (not c!98108)) b!939489))

(assert (= (and d!113957 res!631803) b!939491))

(assert (= (and b!939491 res!631807) b!939474))

(assert (= (and b!939491 (not res!631806)) b!939477))

(assert (= (and b!939477 res!631804) b!939481))

(assert (= (and b!939491 res!631808) b!939488))

(assert (= (and b!939488 c!98106) b!939479))

(assert (= (and b!939488 (not c!98106)) b!939473))

(assert (= (and b!939479 res!631802) b!939484))

(assert (= (or b!939479 b!939473) bm!40884))

(assert (= (and b!939488 res!631801) b!939472))

(assert (= (and b!939472 c!98110) b!939476))

(assert (= (and b!939472 (not c!98110)) b!939475))

(assert (= (and b!939476 res!631809) b!939480))

(assert (= (or b!939476 b!939475) bm!40885))

(declare-fun b_lambda!14233 () Bool)

(assert (=> (not b_lambda!14233) (not b!939481)))

(assert (=> b!939481 t!27436))

(declare-fun b_and!29147 () Bool)

(assert (= b_and!29137 (and (=> t!27436 result!12125) b_and!29147)))

(declare-fun m!875183 () Bool)

(assert (=> bm!40887 m!875183))

(declare-fun m!875185 () Bool)

(assert (=> b!939486 m!875185))

(declare-fun m!875187 () Bool)

(assert (=> b!939481 m!875187))

(declare-fun m!875189 () Bool)

(assert (=> b!939481 m!875189))

(declare-fun m!875191 () Bool)

(assert (=> b!939481 m!875191))

(assert (=> b!939481 m!875189))

(assert (=> b!939481 m!875187))

(assert (=> b!939481 m!875007))

(declare-fun m!875193 () Bool)

(assert (=> b!939481 m!875193))

(assert (=> b!939481 m!875007))

(declare-fun m!875195 () Bool)

(assert (=> bm!40885 m!875195))

(assert (=> d!113957 m!875045))

(declare-fun m!875197 () Bool)

(assert (=> b!939487 m!875197))

(declare-fun m!875199 () Bool)

(assert (=> b!939487 m!875199))

(declare-fun m!875201 () Bool)

(assert (=> b!939487 m!875201))

(declare-fun m!875203 () Bool)

(assert (=> b!939487 m!875203))

(declare-fun m!875205 () Bool)

(assert (=> b!939487 m!875205))

(declare-fun m!875207 () Bool)

(assert (=> b!939487 m!875207))

(declare-fun m!875209 () Bool)

(assert (=> b!939487 m!875209))

(declare-fun m!875211 () Bool)

(assert (=> b!939487 m!875211))

(assert (=> b!939487 m!875203))

(assert (=> b!939487 m!875189))

(declare-fun m!875213 () Bool)

(assert (=> b!939487 m!875213))

(declare-fun m!875215 () Bool)

(assert (=> b!939487 m!875215))

(declare-fun m!875217 () Bool)

(assert (=> b!939487 m!875217))

(declare-fun m!875219 () Bool)

(assert (=> b!939487 m!875219))

(assert (=> b!939487 m!875215))

(declare-fun m!875221 () Bool)

(assert (=> b!939487 m!875221))

(declare-fun m!875223 () Bool)

(assert (=> b!939487 m!875223))

(declare-fun m!875225 () Bool)

(assert (=> b!939487 m!875225))

(assert (=> b!939487 m!875217))

(declare-fun m!875227 () Bool)

(assert (=> b!939487 m!875227))

(assert (=> b!939487 m!875199))

(assert (=> bm!40889 m!875197))

(assert (=> b!939471 m!875189))

(assert (=> b!939471 m!875189))

(declare-fun m!875229 () Bool)

(assert (=> b!939471 m!875229))

(assert (=> b!939474 m!875189))

(assert (=> b!939474 m!875189))

(assert (=> b!939474 m!875229))

(declare-fun m!875231 () Bool)

(assert (=> b!939480 m!875231))

(declare-fun m!875233 () Bool)

(assert (=> bm!40884 m!875233))

(declare-fun m!875235 () Bool)

(assert (=> b!939484 m!875235))

(assert (=> b!939477 m!875189))

(assert (=> b!939477 m!875189))

(declare-fun m!875237 () Bool)

(assert (=> b!939477 m!875237))

(assert (=> b!939289 d!113957))

(declare-fun d!113959 () Bool)

(assert (=> d!113959 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939304 d!113959))

(declare-fun d!113961 () Bool)

(declare-fun e!527711 () Bool)

(assert (=> d!113961 e!527711))

(declare-fun res!631810 () Bool)

(assert (=> d!113961 (=> res!631810 e!527711)))

(declare-fun lt!424272 () Bool)

(assert (=> d!113961 (= res!631810 (not lt!424272))))

(declare-fun lt!424273 () Bool)

(assert (=> d!113961 (= lt!424272 lt!424273)))

(declare-fun lt!424271 () Unit!31682)

(declare-fun e!527710 () Unit!31682)

(assert (=> d!113961 (= lt!424271 e!527710)))

(declare-fun c!98112 () Bool)

(assert (=> d!113961 (= c!98112 lt!424273)))

(assert (=> d!113961 (= lt!424273 (containsKey!453 (toList!6048 lt!424102) k0!1099))))

(assert (=> d!113961 (= (contains!5120 lt!424102 k0!1099) lt!424272)))

(declare-fun b!939492 () Bool)

(declare-fun lt!424274 () Unit!31682)

(assert (=> b!939492 (= e!527710 lt!424274)))

(assert (=> b!939492 (= lt!424274 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424102) k0!1099))))

(assert (=> b!939492 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424102) k0!1099))))

(declare-fun b!939493 () Bool)

(declare-fun Unit!31693 () Unit!31682)

(assert (=> b!939493 (= e!527710 Unit!31693)))

(declare-fun b!939494 () Bool)

(assert (=> b!939494 (= e!527711 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424102) k0!1099)))))

(assert (= (and d!113961 c!98112) b!939492))

(assert (= (and d!113961 (not c!98112)) b!939493))

(assert (= (and d!113961 (not res!631810)) b!939494))

(declare-fun m!875239 () Bool)

(assert (=> d!113961 m!875239))

(declare-fun m!875241 () Bool)

(assert (=> b!939492 m!875241))

(declare-fun m!875243 () Bool)

(assert (=> b!939492 m!875243))

(assert (=> b!939492 m!875243))

(declare-fun m!875245 () Bool)

(assert (=> b!939492 m!875245))

(assert (=> b!939494 m!875243))

(assert (=> b!939494 m!875243))

(assert (=> b!939494 m!875245))

(assert (=> b!939290 d!113961))

(declare-fun bm!40891 () Bool)

(declare-fun call!40900 () Bool)

(declare-fun lt!424285 () ListLongMap!12065)

(assert (=> bm!40891 (= call!40900 (contains!5120 lt!424285 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939495 () Bool)

(declare-fun e!527712 () Bool)

(assert (=> b!939495 (= e!527712 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!939496 () Bool)

(declare-fun e!527716 () Bool)

(declare-fun e!527718 () Bool)

(assert (=> b!939496 (= e!527716 e!527718)))

(declare-fun c!98117 () Bool)

(assert (=> b!939496 (= c!98117 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!939497 () Bool)

(declare-fun e!527724 () Bool)

(assert (=> b!939497 (= e!527724 (not call!40900))))

(declare-fun bm!40893 () Bool)

(declare-fun call!40896 () ListLongMap!12065)

(declare-fun call!40899 () ListLongMap!12065)

(assert (=> bm!40893 (= call!40896 call!40899)))

(declare-fun b!939498 () Bool)

(declare-fun e!527713 () Bool)

(assert (=> b!939498 (= e!527713 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun call!40894 () ListLongMap!12065)

(declare-fun call!40898 () ListLongMap!12065)

(declare-fun c!98116 () Bool)

(declare-fun bm!40894 () Bool)

(declare-fun c!98118 () Bool)

(declare-fun call!40897 () ListLongMap!12065)

(assert (=> bm!40894 (= call!40899 (+!2856 (ite c!98118 call!40894 (ite c!98116 call!40898 call!40897)) (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!939499 () Bool)

(declare-fun call!40895 () Bool)

(assert (=> b!939499 (= e!527718 (not call!40895))))

(declare-fun b!939500 () Bool)

(declare-fun e!527715 () Bool)

(assert (=> b!939500 (= e!527718 e!527715)))

(declare-fun res!631819 () Bool)

(assert (=> b!939500 (= res!631819 call!40895)))

(assert (=> b!939500 (=> (not res!631819) (not e!527715))))

(declare-fun b!939501 () Bool)

(declare-fun e!527719 () Bool)

(declare-fun e!527720 () Bool)

(assert (=> b!939501 (= e!527719 e!527720)))

(declare-fun res!631814 () Bool)

(assert (=> b!939501 (=> (not res!631814) (not e!527720))))

(assert (=> b!939501 (= res!631814 (contains!5120 lt!424285 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!939501 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun b!939502 () Bool)

(declare-fun e!527717 () ListLongMap!12065)

(assert (=> b!939502 (= e!527717 call!40896)))

(declare-fun b!939503 () Bool)

(declare-fun e!527722 () Bool)

(assert (=> b!939503 (= e!527724 e!527722)))

(declare-fun res!631812 () Bool)

(assert (=> b!939503 (= res!631812 call!40900)))

(assert (=> b!939503 (=> (not res!631812) (not e!527722))))

(declare-fun b!939504 () Bool)

(assert (=> b!939504 (= e!527715 (= (apply!865 lt!424285 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40895 () Bool)

(assert (=> bm!40895 (= call!40898 call!40894)))

(declare-fun d!113963 () Bool)

(assert (=> d!113963 e!527716))

(declare-fun res!631813 () Bool)

(assert (=> d!113963 (=> (not res!631813) (not e!527716))))

(assert (=> d!113963 (= res!631813 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))))

(declare-fun lt!424289 () ListLongMap!12065)

(assert (=> d!113963 (= lt!424285 lt!424289)))

(declare-fun lt!424288 () Unit!31682)

(declare-fun e!527723 () Unit!31682)

(assert (=> d!113963 (= lt!424288 e!527723)))

(declare-fun c!98115 () Bool)

(assert (=> d!113963 (= c!98115 e!527712)))

(declare-fun res!631815 () Bool)

(assert (=> d!113963 (=> (not res!631815) (not e!527712))))

(assert (=> d!113963 (= res!631815 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun e!527721 () ListLongMap!12065)

(assert (=> d!113963 (= lt!424289 e!527721)))

(assert (=> d!113963 (= c!98118 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113963 (validMask!0 mask!1881)))

(assert (=> d!113963 (= (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!424285)))

(declare-fun bm!40892 () Bool)

(assert (=> bm!40892 (= call!40895 (contains!5120 lt!424285 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939505 () Bool)

(assert (=> b!939505 (= e!527720 (= (apply!865 lt!424285 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939505 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27654 _values!1231)))))

(assert (=> b!939505 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun b!939506 () Bool)

(assert (=> b!939506 (= e!527717 call!40897)))

(declare-fun b!939507 () Bool)

(declare-fun c!98114 () Bool)

(assert (=> b!939507 (= c!98114 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!527714 () ListLongMap!12065)

(assert (=> b!939507 (= e!527714 e!527717)))

(declare-fun b!939508 () Bool)

(assert (=> b!939508 (= e!527722 (= (apply!865 lt!424285 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40896 () Bool)

(assert (=> bm!40896 (= call!40894 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939509 () Bool)

(assert (=> b!939509 (= e!527714 call!40896)))

(declare-fun b!939510 () Bool)

(assert (=> b!939510 (= e!527721 (+!2856 call!40899 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!939511 () Bool)

(declare-fun lt!424294 () Unit!31682)

(assert (=> b!939511 (= e!527723 lt!424294)))

(declare-fun lt!424284 () ListLongMap!12065)

(assert (=> b!939511 (= lt!424284 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424295 () (_ BitVec 64))

(assert (=> b!939511 (= lt!424295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424279 () (_ BitVec 64))

(assert (=> b!939511 (= lt!424279 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!424292 () Unit!31682)

(assert (=> b!939511 (= lt!424292 (addStillContains!559 lt!424284 lt!424295 zeroValue!1173 lt!424279))))

(assert (=> b!939511 (contains!5120 (+!2856 lt!424284 (tuple2!13367 lt!424295 zeroValue!1173)) lt!424279)))

(declare-fun lt!424280 () Unit!31682)

(assert (=> b!939511 (= lt!424280 lt!424292)))

(declare-fun lt!424296 () ListLongMap!12065)

(assert (=> b!939511 (= lt!424296 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424286 () (_ BitVec 64))

(assert (=> b!939511 (= lt!424286 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424275 () (_ BitVec 64))

(assert (=> b!939511 (= lt!424275 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!424281 () Unit!31682)

(assert (=> b!939511 (= lt!424281 (addApplyDifferent!440 lt!424296 lt!424286 minValue!1173 lt!424275))))

(assert (=> b!939511 (= (apply!865 (+!2856 lt!424296 (tuple2!13367 lt!424286 minValue!1173)) lt!424275) (apply!865 lt!424296 lt!424275))))

(declare-fun lt!424283 () Unit!31682)

(assert (=> b!939511 (= lt!424283 lt!424281)))

(declare-fun lt!424287 () ListLongMap!12065)

(assert (=> b!939511 (= lt!424287 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424291 () (_ BitVec 64))

(assert (=> b!939511 (= lt!424291 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424277 () (_ BitVec 64))

(assert (=> b!939511 (= lt!424277 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!424293 () Unit!31682)

(assert (=> b!939511 (= lt!424293 (addApplyDifferent!440 lt!424287 lt!424291 zeroValue!1173 lt!424277))))

(assert (=> b!939511 (= (apply!865 (+!2856 lt!424287 (tuple2!13367 lt!424291 zeroValue!1173)) lt!424277) (apply!865 lt!424287 lt!424277))))

(declare-fun lt!424278 () Unit!31682)

(assert (=> b!939511 (= lt!424278 lt!424293)))

(declare-fun lt!424290 () ListLongMap!12065)

(assert (=> b!939511 (= lt!424290 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424276 () (_ BitVec 64))

(assert (=> b!939511 (= lt!424276 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424282 () (_ BitVec 64))

(assert (=> b!939511 (= lt!424282 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!939511 (= lt!424294 (addApplyDifferent!440 lt!424290 lt!424276 minValue!1173 lt!424282))))

(assert (=> b!939511 (= (apply!865 (+!2856 lt!424290 (tuple2!13367 lt!424276 minValue!1173)) lt!424282) (apply!865 lt!424290 lt!424282))))

(declare-fun b!939512 () Bool)

(declare-fun res!631811 () Bool)

(assert (=> b!939512 (=> (not res!631811) (not e!527716))))

(assert (=> b!939512 (= res!631811 e!527724)))

(declare-fun c!98113 () Bool)

(assert (=> b!939512 (= c!98113 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40897 () Bool)

(assert (=> bm!40897 (= call!40897 call!40898)))

(declare-fun b!939513 () Bool)

(declare-fun Unit!31694 () Unit!31682)

(assert (=> b!939513 (= e!527723 Unit!31694)))

(declare-fun b!939514 () Bool)

(assert (=> b!939514 (= e!527721 e!527714)))

(assert (=> b!939514 (= c!98116 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!939515 () Bool)

(declare-fun res!631818 () Bool)

(assert (=> b!939515 (=> (not res!631818) (not e!527716))))

(assert (=> b!939515 (= res!631818 e!527719)))

(declare-fun res!631816 () Bool)

(assert (=> b!939515 (=> res!631816 e!527719)))

(assert (=> b!939515 (= res!631816 (not e!527713))))

(declare-fun res!631817 () Bool)

(assert (=> b!939515 (=> (not res!631817) (not e!527713))))

(assert (=> b!939515 (= res!631817 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(assert (= (and d!113963 c!98118) b!939510))

(assert (= (and d!113963 (not c!98118)) b!939514))

(assert (= (and b!939514 c!98116) b!939509))

(assert (= (and b!939514 (not c!98116)) b!939507))

(assert (= (and b!939507 c!98114) b!939502))

(assert (= (and b!939507 (not c!98114)) b!939506))

(assert (= (or b!939502 b!939506) bm!40897))

(assert (= (or b!939509 bm!40897) bm!40895))

(assert (= (or b!939509 b!939502) bm!40893))

(assert (= (or b!939510 bm!40895) bm!40896))

(assert (= (or b!939510 bm!40893) bm!40894))

(assert (= (and d!113963 res!631815) b!939495))

(assert (= (and d!113963 c!98115) b!939511))

(assert (= (and d!113963 (not c!98115)) b!939513))

(assert (= (and d!113963 res!631813) b!939515))

(assert (= (and b!939515 res!631817) b!939498))

(assert (= (and b!939515 (not res!631816)) b!939501))

(assert (= (and b!939501 res!631814) b!939505))

(assert (= (and b!939515 res!631818) b!939512))

(assert (= (and b!939512 c!98113) b!939503))

(assert (= (and b!939512 (not c!98113)) b!939497))

(assert (= (and b!939503 res!631812) b!939508))

(assert (= (or b!939503 b!939497) bm!40891))

(assert (= (and b!939512 res!631811) b!939496))

(assert (= (and b!939496 c!98117) b!939500))

(assert (= (and b!939496 (not c!98117)) b!939499))

(assert (= (and b!939500 res!631819) b!939504))

(assert (= (or b!939500 b!939499) bm!40892))

(declare-fun b_lambda!14235 () Bool)

(assert (=> (not b_lambda!14235) (not b!939505)))

(assert (=> b!939505 t!27436))

(declare-fun b_and!29149 () Bool)

(assert (= b_and!29147 (and (=> t!27436 result!12125) b_and!29149)))

(declare-fun m!875247 () Bool)

(assert (=> bm!40894 m!875247))

(declare-fun m!875249 () Bool)

(assert (=> b!939510 m!875249))

(assert (=> b!939505 m!875003))

(assert (=> b!939505 m!875031))

(declare-fun m!875251 () Bool)

(assert (=> b!939505 m!875251))

(assert (=> b!939505 m!875031))

(assert (=> b!939505 m!875003))

(assert (=> b!939505 m!875007))

(assert (=> b!939505 m!875023))

(assert (=> b!939505 m!875007))

(declare-fun m!875253 () Bool)

(assert (=> bm!40892 m!875253))

(assert (=> d!113963 m!875045))

(declare-fun m!875255 () Bool)

(assert (=> b!939511 m!875255))

(declare-fun m!875257 () Bool)

(assert (=> b!939511 m!875257))

(declare-fun m!875259 () Bool)

(assert (=> b!939511 m!875259))

(declare-fun m!875261 () Bool)

(assert (=> b!939511 m!875261))

(declare-fun m!875263 () Bool)

(assert (=> b!939511 m!875263))

(declare-fun m!875265 () Bool)

(assert (=> b!939511 m!875265))

(declare-fun m!875267 () Bool)

(assert (=> b!939511 m!875267))

(declare-fun m!875269 () Bool)

(assert (=> b!939511 m!875269))

(assert (=> b!939511 m!875261))

(assert (=> b!939511 m!875031))

(declare-fun m!875271 () Bool)

(assert (=> b!939511 m!875271))

(declare-fun m!875273 () Bool)

(assert (=> b!939511 m!875273))

(declare-fun m!875275 () Bool)

(assert (=> b!939511 m!875275))

(declare-fun m!875277 () Bool)

(assert (=> b!939511 m!875277))

(assert (=> b!939511 m!875273))

(declare-fun m!875279 () Bool)

(assert (=> b!939511 m!875279))

(declare-fun m!875281 () Bool)

(assert (=> b!939511 m!875281))

(declare-fun m!875283 () Bool)

(assert (=> b!939511 m!875283))

(assert (=> b!939511 m!875275))

(declare-fun m!875285 () Bool)

(assert (=> b!939511 m!875285))

(assert (=> b!939511 m!875257))

(assert (=> bm!40896 m!875255))

(assert (=> b!939495 m!875031))

(assert (=> b!939495 m!875031))

(declare-fun m!875287 () Bool)

(assert (=> b!939495 m!875287))

(assert (=> b!939498 m!875031))

(assert (=> b!939498 m!875031))

(assert (=> b!939498 m!875287))

(declare-fun m!875289 () Bool)

(assert (=> b!939504 m!875289))

(declare-fun m!875291 () Bool)

(assert (=> bm!40891 m!875291))

(declare-fun m!875293 () Bool)

(assert (=> b!939508 m!875293))

(assert (=> b!939501 m!875031))

(assert (=> b!939501 m!875031))

(declare-fun m!875295 () Bool)

(assert (=> b!939501 m!875295))

(assert (=> b!939290 d!113963))

(declare-fun d!113965 () Bool)

(declare-fun res!631824 () Bool)

(declare-fun e!527729 () Bool)

(assert (=> d!113965 (=> res!631824 e!527729)))

(assert (=> d!113965 (= res!631824 (= (select (arr!27193 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113965 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!527729)))

(declare-fun b!939520 () Bool)

(declare-fun e!527730 () Bool)

(assert (=> b!939520 (= e!527729 e!527730)))

(declare-fun res!631825 () Bool)

(assert (=> b!939520 (=> (not res!631825) (not e!527730))))

(assert (=> b!939520 (= res!631825 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun b!939521 () Bool)

(assert (=> b!939521 (= e!527730 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113965 (not res!631824)) b!939520))

(assert (= (and b!939520 res!631825) b!939521))

(assert (=> d!113965 m!875189))

(declare-fun m!875297 () Bool)

(assert (=> b!939521 m!875297))

(assert (=> b!939295 d!113965))

(declare-fun d!113967 () Bool)

(declare-fun get!14362 (Option!488) V!31983)

(assert (=> d!113967 (= (apply!865 lt!424102 k0!1099) (get!14362 (getValueByKey!482 (toList!6048 lt!424102) k0!1099)))))

(declare-fun bs!26362 () Bool)

(assert (= bs!26362 d!113967))

(assert (=> bs!26362 m!875243))

(assert (=> bs!26362 m!875243))

(declare-fun m!875299 () Bool)

(assert (=> bs!26362 m!875299))

(assert (=> b!939296 d!113967))

(assert (=> b!939291 d!113963))

(declare-fun d!113969 () Bool)

(declare-fun e!527733 () Bool)

(assert (=> d!113969 e!527733))

(declare-fun res!631828 () Bool)

(assert (=> d!113969 (=> (not res!631828) (not e!527733))))

(assert (=> d!113969 (= res!631828 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27654 _values!1231))))))

(declare-fun lt!424299 () Unit!31682)

(declare-fun choose!1565 (array!56517 array!56519 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 32) Int) Unit!31682)

(assert (=> d!113969 (= lt!424299 (choose!1565 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113969 (validMask!0 mask!1881)))

(assert (=> d!113969 (= (lemmaListMapRecursiveValidKeyArray!236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!424299)))

(declare-fun b!939524 () Bool)

(assert (=> b!939524 (= e!527733 (= (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2856 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113969 res!631828) b!939524))

(declare-fun b_lambda!14237 () Bool)

(assert (=> (not b_lambda!14237) (not b!939524)))

(assert (=> b!939524 t!27436))

(declare-fun b_and!29151 () Bool)

(assert (= b_and!29149 (and (=> t!27436 result!12125) b_and!29151)))

(declare-fun m!875301 () Bool)

(assert (=> d!113969 m!875301))

(assert (=> d!113969 m!875045))

(assert (=> b!939524 m!875031))

(assert (=> b!939524 m!875003))

(assert (=> b!939524 m!875007))

(assert (=> b!939524 m!875023))

(assert (=> b!939524 m!875003))

(assert (=> b!939524 m!875007))

(assert (=> b!939524 m!874993))

(declare-fun m!875303 () Bool)

(assert (=> b!939524 m!875303))

(declare-fun m!875305 () Bool)

(assert (=> b!939524 m!875305))

(assert (=> b!939524 m!875303))

(assert (=> b!939291 d!113969))

(declare-fun d!113971 () Bool)

(assert (=> d!113971 (= (apply!865 (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105)) k0!1099) (apply!865 lt!424107 k0!1099))))

(declare-fun lt!424302 () Unit!31682)

(declare-fun choose!1566 (ListLongMap!12065 (_ BitVec 64) V!31983 (_ BitVec 64)) Unit!31682)

(assert (=> d!113971 (= lt!424302 (choose!1566 lt!424107 lt!424101 lt!424105 k0!1099))))

(declare-fun e!527736 () Bool)

(assert (=> d!113971 e!527736))

(declare-fun res!631831 () Bool)

(assert (=> d!113971 (=> (not res!631831) (not e!527736))))

(assert (=> d!113971 (= res!631831 (contains!5120 lt!424107 k0!1099))))

(assert (=> d!113971 (= (addApplyDifferent!440 lt!424107 lt!424101 lt!424105 k0!1099) lt!424302)))

(declare-fun b!939528 () Bool)

(assert (=> b!939528 (= e!527736 (not (= k0!1099 lt!424101)))))

(assert (= (and d!113971 res!631831) b!939528))

(assert (=> d!113971 m!875039))

(declare-fun m!875307 () Bool)

(assert (=> d!113971 m!875307))

(assert (=> d!113971 m!875041))

(assert (=> d!113971 m!875307))

(declare-fun m!875309 () Bool)

(assert (=> d!113971 m!875309))

(declare-fun m!875311 () Bool)

(assert (=> d!113971 m!875311))

(assert (=> b!939291 d!113971))

(declare-fun b!939539 () Bool)

(declare-fun e!527746 () Bool)

(declare-fun e!527748 () Bool)

(assert (=> b!939539 (= e!527746 e!527748)))

(declare-fun res!631838 () Bool)

(assert (=> b!939539 (=> (not res!631838) (not e!527748))))

(declare-fun e!527747 () Bool)

(assert (=> b!939539 (= res!631838 (not e!527747))))

(declare-fun res!631840 () Bool)

(assert (=> b!939539 (=> (not res!631840) (not e!527747))))

(assert (=> b!939539 (= res!631840 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!939540 () Bool)

(declare-fun e!527745 () Bool)

(declare-fun call!40903 () Bool)

(assert (=> b!939540 (= e!527745 call!40903)))

(declare-fun d!113973 () Bool)

(declare-fun res!631839 () Bool)

(assert (=> d!113973 (=> res!631839 e!527746)))

(assert (=> d!113973 (= res!631839 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(assert (=> d!113973 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19144) e!527746)))

(declare-fun b!939541 () Bool)

(assert (=> b!939541 (= e!527745 call!40903)))

(declare-fun b!939542 () Bool)

(assert (=> b!939542 (= e!527748 e!527745)))

(declare-fun c!98121 () Bool)

(assert (=> b!939542 (= c!98121 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!939543 () Bool)

(declare-fun contains!5123 (List!19147 (_ BitVec 64)) Bool)

(assert (=> b!939543 (= e!527747 (contains!5123 Nil!19144 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40900 () Bool)

(assert (=> bm!40900 (= call!40903 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!98121 (Cons!19143 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19144) Nil!19144)))))

(assert (= (and d!113973 (not res!631839)) b!939539))

(assert (= (and b!939539 res!631840) b!939543))

(assert (= (and b!939539 res!631838) b!939542))

(assert (= (and b!939542 c!98121) b!939540))

(assert (= (and b!939542 (not c!98121)) b!939541))

(assert (= (or b!939540 b!939541) bm!40900))

(assert (=> b!939539 m!875031))

(assert (=> b!939539 m!875031))

(assert (=> b!939539 m!875287))

(assert (=> b!939542 m!875031))

(assert (=> b!939542 m!875031))

(assert (=> b!939542 m!875287))

(assert (=> b!939543 m!875031))

(assert (=> b!939543 m!875031))

(declare-fun m!875313 () Bool)

(assert (=> b!939543 m!875313))

(assert (=> bm!40900 m!875031))

(declare-fun m!875315 () Bool)

(assert (=> bm!40900 m!875315))

(assert (=> b!939291 d!113973))

(declare-fun d!113975 () Bool)

(assert (=> d!113975 (contains!5120 (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105)) k0!1099)))

(declare-fun lt!424305 () Unit!31682)

(declare-fun choose!1567 (ListLongMap!12065 (_ BitVec 64) V!31983 (_ BitVec 64)) Unit!31682)

(assert (=> d!113975 (= lt!424305 (choose!1567 lt!424107 lt!424101 lt!424105 k0!1099))))

(assert (=> d!113975 (contains!5120 lt!424107 k0!1099)))

(assert (=> d!113975 (= (addStillContains!559 lt!424107 lt!424101 lt!424105 k0!1099) lt!424305)))

(declare-fun bs!26363 () Bool)

(assert (= bs!26363 d!113975))

(assert (=> bs!26363 m!875307))

(assert (=> bs!26363 m!875307))

(declare-fun m!875317 () Bool)

(assert (=> bs!26363 m!875317))

(declare-fun m!875319 () Bool)

(assert (=> bs!26363 m!875319))

(assert (=> bs!26363 m!875041))

(assert (=> b!939291 d!113975))

(declare-fun d!113977 () Bool)

(declare-fun e!527751 () Bool)

(assert (=> d!113977 e!527751))

(declare-fun res!631846 () Bool)

(assert (=> d!113977 (=> (not res!631846) (not e!527751))))

(declare-fun lt!424316 () ListLongMap!12065)

(assert (=> d!113977 (= res!631846 (contains!5120 lt!424316 (_1!6694 lt!424100)))))

(declare-fun lt!424314 () List!19146)

(assert (=> d!113977 (= lt!424316 (ListLongMap!12066 lt!424314))))

(declare-fun lt!424317 () Unit!31682)

(declare-fun lt!424315 () Unit!31682)

(assert (=> d!113977 (= lt!424317 lt!424315)))

(assert (=> d!113977 (= (getValueByKey!482 lt!424314 (_1!6694 lt!424100)) (Some!487 (_2!6694 lt!424100)))))

(declare-fun lemmaContainsTupThenGetReturnValue!261 (List!19146 (_ BitVec 64) V!31983) Unit!31682)

(assert (=> d!113977 (= lt!424315 (lemmaContainsTupThenGetReturnValue!261 lt!424314 (_1!6694 lt!424100) (_2!6694 lt!424100)))))

(declare-fun insertStrictlySorted!318 (List!19146 (_ BitVec 64) V!31983) List!19146)

(assert (=> d!113977 (= lt!424314 (insertStrictlySorted!318 (toList!6048 lt!424107) (_1!6694 lt!424100) (_2!6694 lt!424100)))))

(assert (=> d!113977 (= (+!2856 lt!424107 lt!424100) lt!424316)))

(declare-fun b!939549 () Bool)

(declare-fun res!631845 () Bool)

(assert (=> b!939549 (=> (not res!631845) (not e!527751))))

(assert (=> b!939549 (= res!631845 (= (getValueByKey!482 (toList!6048 lt!424316) (_1!6694 lt!424100)) (Some!487 (_2!6694 lt!424100))))))

(declare-fun b!939550 () Bool)

(declare-fun contains!5124 (List!19146 tuple2!13366) Bool)

(assert (=> b!939550 (= e!527751 (contains!5124 (toList!6048 lt!424316) lt!424100))))

(assert (= (and d!113977 res!631846) b!939549))

(assert (= (and b!939549 res!631845) b!939550))

(declare-fun m!875321 () Bool)

(assert (=> d!113977 m!875321))

(declare-fun m!875323 () Bool)

(assert (=> d!113977 m!875323))

(declare-fun m!875325 () Bool)

(assert (=> d!113977 m!875325))

(declare-fun m!875327 () Bool)

(assert (=> d!113977 m!875327))

(declare-fun m!875329 () Bool)

(assert (=> b!939549 m!875329))

(declare-fun m!875331 () Bool)

(assert (=> b!939550 m!875331))

(assert (=> b!939291 d!113977))

(declare-fun d!113979 () Bool)

(declare-fun e!527754 () Bool)

(assert (=> d!113979 e!527754))

(declare-fun c!98124 () Bool)

(assert (=> d!113979 (= c!98124 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!424320 () Unit!31682)

(declare-fun choose!1568 (array!56517 array!56519 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 64) (_ BitVec 32) Int) Unit!31682)

(assert (=> d!113979 (= lt!424320 (choose!1568 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113979 (validMask!0 mask!1881)))

(assert (=> d!113979 (= (lemmaListMapContainsThenArrayContainsFrom!310 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!424320)))

(declare-fun b!939555 () Bool)

(assert (=> b!939555 (= e!527754 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!939556 () Bool)

(assert (=> b!939556 (= e!527754 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113979 c!98124) b!939555))

(assert (= (and d!113979 (not c!98124)) b!939556))

(declare-fun m!875333 () Bool)

(assert (=> d!113979 m!875333))

(assert (=> d!113979 m!875045))

(assert (=> b!939555 m!875029))

(assert (=> b!939291 d!113979))

(declare-fun d!113981 () Bool)

(assert (=> d!113981 (= (apply!865 lt!424097 k0!1099) (get!14362 (getValueByKey!482 (toList!6048 lt!424097) k0!1099)))))

(declare-fun bs!26364 () Bool)

(assert (= bs!26364 d!113981))

(declare-fun m!875335 () Bool)

(assert (=> bs!26364 m!875335))

(assert (=> bs!26364 m!875335))

(declare-fun m!875337 () Bool)

(assert (=> bs!26364 m!875337))

(assert (=> b!939291 d!113981))

(declare-fun bm!40901 () Bool)

(declare-fun call!40910 () Bool)

(declare-fun lt!424331 () ListLongMap!12065)

(assert (=> bm!40901 (= call!40910 (contains!5120 lt!424331 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939557 () Bool)

(declare-fun e!527755 () Bool)

(assert (=> b!939557 (= e!527755 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!939558 () Bool)

(declare-fun e!527759 () Bool)

(declare-fun e!527761 () Bool)

(assert (=> b!939558 (= e!527759 e!527761)))

(declare-fun c!98129 () Bool)

(assert (=> b!939558 (= c!98129 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!939559 () Bool)

(declare-fun e!527767 () Bool)

(assert (=> b!939559 (= e!527767 (not call!40910))))

(declare-fun bm!40903 () Bool)

(declare-fun call!40906 () ListLongMap!12065)

(declare-fun call!40909 () ListLongMap!12065)

(assert (=> bm!40903 (= call!40906 call!40909)))

(declare-fun b!939560 () Bool)

(declare-fun e!527756 () Bool)

(assert (=> b!939560 (= e!527756 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun c!98128 () Bool)

(declare-fun c!98130 () Bool)

(declare-fun call!40904 () ListLongMap!12065)

(declare-fun call!40908 () ListLongMap!12065)

(declare-fun bm!40904 () Bool)

(declare-fun call!40907 () ListLongMap!12065)

(assert (=> bm!40904 (= call!40909 (+!2856 (ite c!98130 call!40904 (ite c!98128 call!40908 call!40907)) (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!939561 () Bool)

(declare-fun call!40905 () Bool)

(assert (=> b!939561 (= e!527761 (not call!40905))))

(declare-fun b!939562 () Bool)

(declare-fun e!527758 () Bool)

(assert (=> b!939562 (= e!527761 e!527758)))

(declare-fun res!631855 () Bool)

(assert (=> b!939562 (= res!631855 call!40905)))

(assert (=> b!939562 (=> (not res!631855) (not e!527758))))

(declare-fun b!939563 () Bool)

(declare-fun e!527762 () Bool)

(declare-fun e!527763 () Bool)

(assert (=> b!939563 (= e!527762 e!527763)))

(declare-fun res!631850 () Bool)

(assert (=> b!939563 (=> (not res!631850) (not e!527763))))

(assert (=> b!939563 (= res!631850 (contains!5120 lt!424331 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!939563 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27653 _keys!1487)))))

(declare-fun b!939564 () Bool)

(declare-fun e!527760 () ListLongMap!12065)

(assert (=> b!939564 (= e!527760 call!40906)))

(declare-fun b!939565 () Bool)

(declare-fun e!527765 () Bool)

(assert (=> b!939565 (= e!527767 e!527765)))

(declare-fun res!631848 () Bool)

(assert (=> b!939565 (= res!631848 call!40910)))

(assert (=> b!939565 (=> (not res!631848) (not e!527765))))

(declare-fun b!939566 () Bool)

(assert (=> b!939566 (= e!527758 (= (apply!865 lt!424331 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40905 () Bool)

(assert (=> bm!40905 (= call!40908 call!40904)))

(declare-fun d!113983 () Bool)

(assert (=> d!113983 e!527759))

(declare-fun res!631849 () Bool)

(assert (=> d!113983 (=> (not res!631849) (not e!527759))))

(assert (=> d!113983 (= res!631849 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27653 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27653 _keys!1487)))))))

(declare-fun lt!424335 () ListLongMap!12065)

(assert (=> d!113983 (= lt!424331 lt!424335)))

(declare-fun lt!424334 () Unit!31682)

(declare-fun e!527766 () Unit!31682)

(assert (=> d!113983 (= lt!424334 e!527766)))

(declare-fun c!98127 () Bool)

(assert (=> d!113983 (= c!98127 e!527755)))

(declare-fun res!631851 () Bool)

(assert (=> d!113983 (=> (not res!631851) (not e!527755))))

(assert (=> d!113983 (= res!631851 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27653 _keys!1487)))))

(declare-fun e!527764 () ListLongMap!12065)

(assert (=> d!113983 (= lt!424335 e!527764)))

(assert (=> d!113983 (= c!98130 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113983 (validMask!0 mask!1881)))

(assert (=> d!113983 (= (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424331)))

(declare-fun bm!40902 () Bool)

(assert (=> bm!40902 (= call!40905 (contains!5120 lt!424331 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939567 () Bool)

(assert (=> b!939567 (= e!527763 (= (apply!865 lt!424331 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14361 (select (arr!27194 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939567 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27654 _values!1231)))))

(assert (=> b!939567 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27653 _keys!1487)))))

(declare-fun b!939568 () Bool)

(assert (=> b!939568 (= e!527760 call!40907)))

(declare-fun b!939569 () Bool)

(declare-fun c!98126 () Bool)

(assert (=> b!939569 (= c!98126 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!527757 () ListLongMap!12065)

(assert (=> b!939569 (= e!527757 e!527760)))

(declare-fun b!939570 () Bool)

(assert (=> b!939570 (= e!527765 (= (apply!865 lt!424331 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40906 () Bool)

(assert (=> bm!40906 (= call!40904 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!939571 () Bool)

(assert (=> b!939571 (= e!527757 call!40906)))

(declare-fun b!939572 () Bool)

(assert (=> b!939572 (= e!527764 (+!2856 call!40909 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!939573 () Bool)

(declare-fun lt!424340 () Unit!31682)

(assert (=> b!939573 (= e!527766 lt!424340)))

(declare-fun lt!424330 () ListLongMap!12065)

(assert (=> b!939573 (= lt!424330 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!424341 () (_ BitVec 64))

(assert (=> b!939573 (= lt!424341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424325 () (_ BitVec 64))

(assert (=> b!939573 (= lt!424325 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!424338 () Unit!31682)

(assert (=> b!939573 (= lt!424338 (addStillContains!559 lt!424330 lt!424341 zeroValue!1173 lt!424325))))

(assert (=> b!939573 (contains!5120 (+!2856 lt!424330 (tuple2!13367 lt!424341 zeroValue!1173)) lt!424325)))

(declare-fun lt!424326 () Unit!31682)

(assert (=> b!939573 (= lt!424326 lt!424338)))

(declare-fun lt!424342 () ListLongMap!12065)

(assert (=> b!939573 (= lt!424342 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!424332 () (_ BitVec 64))

(assert (=> b!939573 (= lt!424332 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424321 () (_ BitVec 64))

(assert (=> b!939573 (= lt!424321 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!424327 () Unit!31682)

(assert (=> b!939573 (= lt!424327 (addApplyDifferent!440 lt!424342 lt!424332 minValue!1173 lt!424321))))

(assert (=> b!939573 (= (apply!865 (+!2856 lt!424342 (tuple2!13367 lt!424332 minValue!1173)) lt!424321) (apply!865 lt!424342 lt!424321))))

(declare-fun lt!424329 () Unit!31682)

(assert (=> b!939573 (= lt!424329 lt!424327)))

(declare-fun lt!424333 () ListLongMap!12065)

(assert (=> b!939573 (= lt!424333 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!424337 () (_ BitVec 64))

(assert (=> b!939573 (= lt!424337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424323 () (_ BitVec 64))

(assert (=> b!939573 (= lt!424323 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!424339 () Unit!31682)

(assert (=> b!939573 (= lt!424339 (addApplyDifferent!440 lt!424333 lt!424337 zeroValue!1173 lt!424323))))

(assert (=> b!939573 (= (apply!865 (+!2856 lt!424333 (tuple2!13367 lt!424337 zeroValue!1173)) lt!424323) (apply!865 lt!424333 lt!424323))))

(declare-fun lt!424324 () Unit!31682)

(assert (=> b!939573 (= lt!424324 lt!424339)))

(declare-fun lt!424336 () ListLongMap!12065)

(assert (=> b!939573 (= lt!424336 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!424322 () (_ BitVec 64))

(assert (=> b!939573 (= lt!424322 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424328 () (_ BitVec 64))

(assert (=> b!939573 (= lt!424328 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!939573 (= lt!424340 (addApplyDifferent!440 lt!424336 lt!424322 minValue!1173 lt!424328))))

(assert (=> b!939573 (= (apply!865 (+!2856 lt!424336 (tuple2!13367 lt!424322 minValue!1173)) lt!424328) (apply!865 lt!424336 lt!424328))))

(declare-fun b!939574 () Bool)

(declare-fun res!631847 () Bool)

(assert (=> b!939574 (=> (not res!631847) (not e!527759))))

(assert (=> b!939574 (= res!631847 e!527767)))

(declare-fun c!98125 () Bool)

(assert (=> b!939574 (= c!98125 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40907 () Bool)

(assert (=> bm!40907 (= call!40907 call!40908)))

(declare-fun b!939575 () Bool)

(declare-fun Unit!31695 () Unit!31682)

(assert (=> b!939575 (= e!527766 Unit!31695)))

(declare-fun b!939576 () Bool)

(assert (=> b!939576 (= e!527764 e!527757)))

(assert (=> b!939576 (= c!98128 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!939577 () Bool)

(declare-fun res!631854 () Bool)

(assert (=> b!939577 (=> (not res!631854) (not e!527759))))

(assert (=> b!939577 (= res!631854 e!527762)))

(declare-fun res!631852 () Bool)

(assert (=> b!939577 (=> res!631852 e!527762)))

(assert (=> b!939577 (= res!631852 (not e!527756))))

(declare-fun res!631853 () Bool)

(assert (=> b!939577 (=> (not res!631853) (not e!527756))))

(assert (=> b!939577 (= res!631853 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27653 _keys!1487)))))

(assert (= (and d!113983 c!98130) b!939572))

(assert (= (and d!113983 (not c!98130)) b!939576))

(assert (= (and b!939576 c!98128) b!939571))

(assert (= (and b!939576 (not c!98128)) b!939569))

(assert (= (and b!939569 c!98126) b!939564))

(assert (= (and b!939569 (not c!98126)) b!939568))

(assert (= (or b!939564 b!939568) bm!40907))

(assert (= (or b!939571 bm!40907) bm!40905))

(assert (= (or b!939571 b!939564) bm!40903))

(assert (= (or b!939572 bm!40905) bm!40906))

(assert (= (or b!939572 bm!40903) bm!40904))

(assert (= (and d!113983 res!631851) b!939557))

(assert (= (and d!113983 c!98127) b!939573))

(assert (= (and d!113983 (not c!98127)) b!939575))

(assert (= (and d!113983 res!631849) b!939577))

(assert (= (and b!939577 res!631853) b!939560))

(assert (= (and b!939577 (not res!631852)) b!939563))

(assert (= (and b!939563 res!631850) b!939567))

(assert (= (and b!939577 res!631854) b!939574))

(assert (= (and b!939574 c!98125) b!939565))

(assert (= (and b!939574 (not c!98125)) b!939559))

(assert (= (and b!939565 res!631848) b!939570))

(assert (= (or b!939565 b!939559) bm!40901))

(assert (= (and b!939574 res!631847) b!939558))

(assert (= (and b!939558 c!98129) b!939562))

(assert (= (and b!939558 (not c!98129)) b!939561))

(assert (= (and b!939562 res!631855) b!939566))

(assert (= (or b!939562 b!939561) bm!40902))

(declare-fun b_lambda!14239 () Bool)

(assert (=> (not b_lambda!14239) (not b!939567)))

(assert (=> b!939567 t!27436))

(declare-fun b_and!29153 () Bool)

(assert (= b_and!29151 (and (=> t!27436 result!12125) b_and!29153)))

(declare-fun m!875339 () Bool)

(assert (=> bm!40904 m!875339))

(declare-fun m!875341 () Bool)

(assert (=> b!939572 m!875341))

(declare-fun m!875343 () Bool)

(assert (=> b!939567 m!875343))

(declare-fun m!875345 () Bool)

(assert (=> b!939567 m!875345))

(declare-fun m!875347 () Bool)

(assert (=> b!939567 m!875347))

(assert (=> b!939567 m!875345))

(assert (=> b!939567 m!875343))

(assert (=> b!939567 m!875007))

(declare-fun m!875349 () Bool)

(assert (=> b!939567 m!875349))

(assert (=> b!939567 m!875007))

(declare-fun m!875351 () Bool)

(assert (=> bm!40902 m!875351))

(assert (=> d!113983 m!875045))

(declare-fun m!875353 () Bool)

(assert (=> b!939573 m!875353))

(declare-fun m!875355 () Bool)

(assert (=> b!939573 m!875355))

(declare-fun m!875357 () Bool)

(assert (=> b!939573 m!875357))

(declare-fun m!875359 () Bool)

(assert (=> b!939573 m!875359))

(declare-fun m!875361 () Bool)

(assert (=> b!939573 m!875361))

(declare-fun m!875363 () Bool)

(assert (=> b!939573 m!875363))

(declare-fun m!875365 () Bool)

(assert (=> b!939573 m!875365))

(declare-fun m!875367 () Bool)

(assert (=> b!939573 m!875367))

(assert (=> b!939573 m!875359))

(assert (=> b!939573 m!875345))

(declare-fun m!875369 () Bool)

(assert (=> b!939573 m!875369))

(declare-fun m!875371 () Bool)

(assert (=> b!939573 m!875371))

(declare-fun m!875373 () Bool)

(assert (=> b!939573 m!875373))

(declare-fun m!875375 () Bool)

(assert (=> b!939573 m!875375))

(assert (=> b!939573 m!875371))

(declare-fun m!875377 () Bool)

(assert (=> b!939573 m!875377))

(declare-fun m!875379 () Bool)

(assert (=> b!939573 m!875379))

(declare-fun m!875381 () Bool)

(assert (=> b!939573 m!875381))

(assert (=> b!939573 m!875373))

(declare-fun m!875383 () Bool)

(assert (=> b!939573 m!875383))

(assert (=> b!939573 m!875355))

(assert (=> bm!40906 m!875353))

(assert (=> b!939557 m!875345))

(assert (=> b!939557 m!875345))

(declare-fun m!875385 () Bool)

(assert (=> b!939557 m!875385))

(assert (=> b!939560 m!875345))

(assert (=> b!939560 m!875345))

(assert (=> b!939560 m!875385))

(declare-fun m!875387 () Bool)

(assert (=> b!939566 m!875387))

(declare-fun m!875389 () Bool)

(assert (=> bm!40901 m!875389))

(declare-fun m!875391 () Bool)

(assert (=> b!939570 m!875391))

(assert (=> b!939563 m!875345))

(assert (=> b!939563 m!875345))

(declare-fun m!875393 () Bool)

(assert (=> b!939563 m!875393))

(assert (=> b!939291 d!113983))

(declare-fun d!113985 () Bool)

(declare-fun e!527768 () Bool)

(assert (=> d!113985 e!527768))

(declare-fun res!631857 () Bool)

(assert (=> d!113985 (=> (not res!631857) (not e!527768))))

(declare-fun lt!424345 () ListLongMap!12065)

(assert (=> d!113985 (= res!631857 (contains!5120 lt!424345 (_1!6694 lt!424100)))))

(declare-fun lt!424343 () List!19146)

(assert (=> d!113985 (= lt!424345 (ListLongMap!12066 lt!424343))))

(declare-fun lt!424346 () Unit!31682)

(declare-fun lt!424344 () Unit!31682)

(assert (=> d!113985 (= lt!424346 lt!424344)))

(assert (=> d!113985 (= (getValueByKey!482 lt!424343 (_1!6694 lt!424100)) (Some!487 (_2!6694 lt!424100)))))

(assert (=> d!113985 (= lt!424344 (lemmaContainsTupThenGetReturnValue!261 lt!424343 (_1!6694 lt!424100) (_2!6694 lt!424100)))))

(assert (=> d!113985 (= lt!424343 (insertStrictlySorted!318 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6694 lt!424100) (_2!6694 lt!424100)))))

(assert (=> d!113985 (= (+!2856 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424100) lt!424345)))

(declare-fun b!939578 () Bool)

(declare-fun res!631856 () Bool)

(assert (=> b!939578 (=> (not res!631856) (not e!527768))))

(assert (=> b!939578 (= res!631856 (= (getValueByKey!482 (toList!6048 lt!424345) (_1!6694 lt!424100)) (Some!487 (_2!6694 lt!424100))))))

(declare-fun b!939579 () Bool)

(assert (=> b!939579 (= e!527768 (contains!5124 (toList!6048 lt!424345) lt!424100))))

(assert (= (and d!113985 res!631857) b!939578))

(assert (= (and b!939578 res!631856) b!939579))

(declare-fun m!875395 () Bool)

(assert (=> d!113985 m!875395))

(declare-fun m!875397 () Bool)

(assert (=> d!113985 m!875397))

(declare-fun m!875399 () Bool)

(assert (=> d!113985 m!875399))

(declare-fun m!875401 () Bool)

(assert (=> d!113985 m!875401))

(declare-fun m!875403 () Bool)

(assert (=> b!939578 m!875403))

(declare-fun m!875405 () Bool)

(assert (=> b!939579 m!875405))

(assert (=> b!939291 d!113985))

(declare-fun d!113987 () Bool)

(declare-fun e!527770 () Bool)

(assert (=> d!113987 e!527770))

(declare-fun res!631858 () Bool)

(assert (=> d!113987 (=> res!631858 e!527770)))

(declare-fun lt!424348 () Bool)

(assert (=> d!113987 (= res!631858 (not lt!424348))))

(declare-fun lt!424349 () Bool)

(assert (=> d!113987 (= lt!424348 lt!424349)))

(declare-fun lt!424347 () Unit!31682)

(declare-fun e!527769 () Unit!31682)

(assert (=> d!113987 (= lt!424347 e!527769)))

(declare-fun c!98131 () Bool)

(assert (=> d!113987 (= c!98131 lt!424349)))

(assert (=> d!113987 (= lt!424349 (containsKey!453 (toList!6048 lt!424097) k0!1099))))

(assert (=> d!113987 (= (contains!5120 lt!424097 k0!1099) lt!424348)))

(declare-fun b!939580 () Bool)

(declare-fun lt!424350 () Unit!31682)

(assert (=> b!939580 (= e!527769 lt!424350)))

(assert (=> b!939580 (= lt!424350 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424097) k0!1099))))

(assert (=> b!939580 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424097) k0!1099))))

(declare-fun b!939581 () Bool)

(declare-fun Unit!31696 () Unit!31682)

(assert (=> b!939581 (= e!527769 Unit!31696)))

(declare-fun b!939582 () Bool)

(assert (=> b!939582 (= e!527770 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424097) k0!1099)))))

(assert (= (and d!113987 c!98131) b!939580))

(assert (= (and d!113987 (not c!98131)) b!939581))

(assert (= (and d!113987 (not res!631858)) b!939582))

(declare-fun m!875407 () Bool)

(assert (=> d!113987 m!875407))

(declare-fun m!875409 () Bool)

(assert (=> b!939580 m!875409))

(assert (=> b!939580 m!875335))

(assert (=> b!939580 m!875335))

(declare-fun m!875411 () Bool)

(assert (=> b!939580 m!875411))

(assert (=> b!939582 m!875335))

(assert (=> b!939582 m!875335))

(assert (=> b!939582 m!875411))

(assert (=> b!939291 d!113987))

(declare-fun d!113989 () Bool)

(assert (=> d!113989 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)) (not (= (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099)))))

(declare-fun lt!424353 () Unit!31682)

(declare-fun choose!21 (array!56517 (_ BitVec 64) (_ BitVec 32) List!19147) Unit!31682)

(assert (=> d!113989 (= lt!424353 (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19144))))

(assert (=> d!113989 (bvslt (size!27653 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113989 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19144) lt!424353)))

(declare-fun bs!26365 () Bool)

(assert (= bs!26365 d!113989))

(assert (=> bs!26365 m!875031))

(declare-fun m!875413 () Bool)

(assert (=> bs!26365 m!875413))

(assert (=> b!939291 d!113989))

(declare-fun d!113991 () Bool)

(declare-fun c!98134 () Bool)

(assert (=> d!113991 (= c!98134 ((_ is ValueCellFull!9650) (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!527773 () V!31983)

(assert (=> d!113991 (= (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527773)))

(declare-fun b!939587 () Bool)

(declare-fun get!14363 (ValueCell!9650 V!31983) V!31983)

(assert (=> b!939587 (= e!527773 (get!14363 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!939588 () Bool)

(declare-fun get!14364 (ValueCell!9650 V!31983) V!31983)

(assert (=> b!939588 (= e!527773 (get!14364 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113991 c!98134) b!939587))

(assert (= (and d!113991 (not c!98134)) b!939588))

(assert (=> b!939587 m!875003))

(assert (=> b!939587 m!875007))

(declare-fun m!875415 () Bool)

(assert (=> b!939587 m!875415))

(assert (=> b!939588 m!875003))

(assert (=> b!939588 m!875007))

(declare-fun m!875417 () Bool)

(assert (=> b!939588 m!875417))

(assert (=> b!939291 d!113991))

(declare-fun d!113993 () Bool)

(assert (=> d!113993 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19144)))

(declare-fun lt!424356 () Unit!31682)

(declare-fun choose!39 (array!56517 (_ BitVec 32) (_ BitVec 32)) Unit!31682)

(assert (=> d!113993 (= lt!424356 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113993 (bvslt (size!27653 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113993 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!424356)))

(declare-fun bs!26366 () Bool)

(assert (= bs!26366 d!113993))

(assert (=> bs!26366 m!875011))

(declare-fun m!875419 () Bool)

(assert (=> bs!26366 m!875419))

(assert (=> b!939291 d!113993))

(declare-fun d!113995 () Bool)

(assert (=> d!113995 (= (apply!865 lt!424107 k0!1099) (get!14362 (getValueByKey!482 (toList!6048 lt!424107) k0!1099)))))

(declare-fun bs!26367 () Bool)

(assert (= bs!26367 d!113995))

(assert (=> bs!26367 m!875179))

(assert (=> bs!26367 m!875179))

(declare-fun m!875421 () Bool)

(assert (=> bs!26367 m!875421))

(assert (=> b!939292 d!113995))

(declare-fun b!939597 () Bool)

(declare-fun e!527782 () Bool)

(declare-fun e!527780 () Bool)

(assert (=> b!939597 (= e!527782 e!527780)))

(declare-fun c!98137 () Bool)

(assert (=> b!939597 (= c!98137 (validKeyInArray!0 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!113997 () Bool)

(declare-fun res!631863 () Bool)

(assert (=> d!113997 (=> res!631863 e!527782)))

(assert (=> d!113997 (= res!631863 (bvsge #b00000000000000000000000000000000 (size!27653 _keys!1487)))))

(assert (=> d!113997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!527782)))

(declare-fun b!939598 () Bool)

(declare-fun e!527781 () Bool)

(declare-fun call!40913 () Bool)

(assert (=> b!939598 (= e!527781 call!40913)))

(declare-fun b!939599 () Bool)

(assert (=> b!939599 (= e!527780 call!40913)))

(declare-fun b!939600 () Bool)

(assert (=> b!939600 (= e!527780 e!527781)))

(declare-fun lt!424365 () (_ BitVec 64))

(assert (=> b!939600 (= lt!424365 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!424363 () Unit!31682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56517 (_ BitVec 64) (_ BitVec 32)) Unit!31682)

(assert (=> b!939600 (= lt!424363 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!424365 #b00000000000000000000000000000000))))

(assert (=> b!939600 (arrayContainsKey!0 _keys!1487 lt!424365 #b00000000000000000000000000000000)))

(declare-fun lt!424364 () Unit!31682)

(assert (=> b!939600 (= lt!424364 lt!424363)))

(declare-fun res!631864 () Bool)

(declare-datatypes ((SeekEntryResult!8936 0))(
  ( (MissingZero!8936 (index!38115 (_ BitVec 32))) (Found!8936 (index!38116 (_ BitVec 32))) (Intermediate!8936 (undefined!9748 Bool) (index!38117 (_ BitVec 32)) (x!80430 (_ BitVec 32))) (Undefined!8936) (MissingVacant!8936 (index!38118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56517 (_ BitVec 32)) SeekEntryResult!8936)

(assert (=> b!939600 (= res!631864 (= (seekEntryOrOpen!0 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8936 #b00000000000000000000000000000000)))))

(assert (=> b!939600 (=> (not res!631864) (not e!527781))))

(declare-fun bm!40910 () Bool)

(assert (=> bm!40910 (= call!40913 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!113997 (not res!631863)) b!939597))

(assert (= (and b!939597 c!98137) b!939600))

(assert (= (and b!939597 (not c!98137)) b!939599))

(assert (= (and b!939600 res!631864) b!939598))

(assert (= (or b!939598 b!939599) bm!40910))

(declare-fun m!875423 () Bool)

(assert (=> b!939597 m!875423))

(assert (=> b!939597 m!875423))

(declare-fun m!875425 () Bool)

(assert (=> b!939597 m!875425))

(assert (=> b!939600 m!875423))

(declare-fun m!875427 () Bool)

(assert (=> b!939600 m!875427))

(declare-fun m!875429 () Bool)

(assert (=> b!939600 m!875429))

(assert (=> b!939600 m!875423))

(declare-fun m!875431 () Bool)

(assert (=> b!939600 m!875431))

(declare-fun m!875433 () Bool)

(assert (=> bm!40910 m!875433))

(assert (=> b!939297 d!113997))

(declare-fun d!113999 () Bool)

(assert (=> d!113999 (= (validKeyInArray!0 lt!424101) (and (not (= lt!424101 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!424101 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939298 d!113999))

(declare-fun b!939601 () Bool)

(declare-fun e!527784 () Bool)

(declare-fun e!527786 () Bool)

(assert (=> b!939601 (= e!527784 e!527786)))

(declare-fun res!631865 () Bool)

(assert (=> b!939601 (=> (not res!631865) (not e!527786))))

(declare-fun e!527785 () Bool)

(assert (=> b!939601 (= res!631865 (not e!527785))))

(declare-fun res!631867 () Bool)

(assert (=> b!939601 (=> (not res!631867) (not e!527785))))

(assert (=> b!939601 (= res!631867 (validKeyInArray!0 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!939602 () Bool)

(declare-fun e!527783 () Bool)

(declare-fun call!40914 () Bool)

(assert (=> b!939602 (= e!527783 call!40914)))

(declare-fun d!114001 () Bool)

(declare-fun res!631866 () Bool)

(assert (=> d!114001 (=> res!631866 e!527784)))

(assert (=> d!114001 (= res!631866 (bvsge #b00000000000000000000000000000000 (size!27653 _keys!1487)))))

(assert (=> d!114001 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19144) e!527784)))

(declare-fun b!939603 () Bool)

(assert (=> b!939603 (= e!527783 call!40914)))

(declare-fun b!939604 () Bool)

(assert (=> b!939604 (= e!527786 e!527783)))

(declare-fun c!98138 () Bool)

(assert (=> b!939604 (= c!98138 (validKeyInArray!0 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!939605 () Bool)

(assert (=> b!939605 (= e!527785 (contains!5123 Nil!19144 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40911 () Bool)

(assert (=> bm!40911 (= call!40914 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98138 (Cons!19143 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) Nil!19144) Nil!19144)))))

(assert (= (and d!114001 (not res!631866)) b!939601))

(assert (= (and b!939601 res!631867) b!939605))

(assert (= (and b!939601 res!631865) b!939604))

(assert (= (and b!939604 c!98138) b!939602))

(assert (= (and b!939604 (not c!98138)) b!939603))

(assert (= (or b!939602 b!939603) bm!40911))

(assert (=> b!939601 m!875423))

(assert (=> b!939601 m!875423))

(assert (=> b!939601 m!875425))

(assert (=> b!939604 m!875423))

(assert (=> b!939604 m!875423))

(assert (=> b!939604 m!875425))

(assert (=> b!939605 m!875423))

(assert (=> b!939605 m!875423))

(declare-fun m!875435 () Bool)

(assert (=> b!939605 m!875435))

(assert (=> bm!40911 m!875423))

(declare-fun m!875437 () Bool)

(assert (=> bm!40911 m!875437))

(assert (=> b!939303 d!114001))

(declare-fun d!114003 () Bool)

(assert (=> d!114003 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79950 d!114003))

(declare-fun d!114005 () Bool)

(assert (=> d!114005 (= (array_inv!21236 _values!1231) (bvsge (size!27654 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79950 d!114005))

(declare-fun d!114007 () Bool)

(assert (=> d!114007 (= (array_inv!21237 _keys!1487) (bvsge (size!27653 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79950 d!114007))

(declare-fun mapNonEmpty!32179 () Bool)

(declare-fun mapRes!32179 () Bool)

(declare-fun tp!61741 () Bool)

(declare-fun e!527791 () Bool)

(assert (=> mapNonEmpty!32179 (= mapRes!32179 (and tp!61741 e!527791))))

(declare-fun mapValue!32179 () ValueCell!9650)

(declare-fun mapRest!32179 () (Array (_ BitVec 32) ValueCell!9650))

(declare-fun mapKey!32179 () (_ BitVec 32))

(assert (=> mapNonEmpty!32179 (= mapRest!32170 (store mapRest!32179 mapKey!32179 mapValue!32179))))

(declare-fun b!939613 () Bool)

(declare-fun e!527792 () Bool)

(assert (=> b!939613 (= e!527792 tp_is_empty!20263)))

(declare-fun condMapEmpty!32179 () Bool)

(declare-fun mapDefault!32179 () ValueCell!9650)

(assert (=> mapNonEmpty!32170 (= condMapEmpty!32179 (= mapRest!32170 ((as const (Array (_ BitVec 32) ValueCell!9650)) mapDefault!32179)))))

(assert (=> mapNonEmpty!32170 (= tp!61725 (and e!527792 mapRes!32179))))

(declare-fun b!939612 () Bool)

(assert (=> b!939612 (= e!527791 tp_is_empty!20263)))

(declare-fun mapIsEmpty!32179 () Bool)

(assert (=> mapIsEmpty!32179 mapRes!32179))

(assert (= (and mapNonEmpty!32170 condMapEmpty!32179) mapIsEmpty!32179))

(assert (= (and mapNonEmpty!32170 (not condMapEmpty!32179)) mapNonEmpty!32179))

(assert (= (and mapNonEmpty!32179 ((_ is ValueCellFull!9650) mapValue!32179)) b!939612))

(assert (= (and mapNonEmpty!32170 ((_ is ValueCellFull!9650) mapDefault!32179)) b!939613))

(declare-fun m!875439 () Bool)

(assert (=> mapNonEmpty!32179 m!875439))

(declare-fun b_lambda!14241 () Bool)

(assert (= b_lambda!14239 (or (and start!79950 b_free!17755) b_lambda!14241)))

(declare-fun b_lambda!14243 () Bool)

(assert (= b_lambda!14235 (or (and start!79950 b_free!17755) b_lambda!14243)))

(declare-fun b_lambda!14245 () Bool)

(assert (= b_lambda!14237 (or (and start!79950 b_free!17755) b_lambda!14245)))

(declare-fun b_lambda!14247 () Bool)

(assert (= b_lambda!14233 (or (and start!79950 b_free!17755) b_lambda!14247)))

(check-sat (not b!939481) (not d!113963) (not b!939510) (not b!939578) (not bm!40911) (not d!113987) (not b!939524) (not b!939487) (not d!113977) (not b!939557) (not b!939582) (not d!113967) (not b_lambda!14245) (not b!939573) (not bm!40892) (not d!113979) (not b!939567) (not b!939543) (not b!939566) (not d!113993) (not bm!40896) (not b!939471) (not d!113983) (not b!939480) (not b!939605) (not b!939508) (not b!939505) (not b!939560) (not d!113969) (not b!939570) (not b!939587) (not b!939504) (not b!939555) (not b!939579) (not b!939588) (not bm!40891) (not b!939550) b_and!29153 (not b!939494) (not b!939580) (not b!939597) (not b!939521) (not b!939549) (not b!939492) (not b_lambda!14241) (not b!939486) (not b!939511) (not d!113957) (not d!113989) tp_is_empty!20263 (not b!939542) (not bm!40904) (not b!939426) (not d!113955) (not b!939600) (not b!939501) (not b!939601) (not bm!40910) (not b!939498) (not bm!40884) (not bm!40887) (not bm!40889) (not b!939428) (not b!939563) (not d!113985) (not b!939495) (not b!939539) (not bm!40885) (not bm!40901) (not b_lambda!14247) (not mapNonEmpty!32179) (not b_lambda!14231) (not b!939474) (not d!113971) (not d!113975) (not bm!40900) (not b_next!17755) (not bm!40906) (not b!939477) (not b!939604) (not d!113995) (not b_lambda!14243) (not d!113981) (not b!939572) (not bm!40902) (not d!113961) (not bm!40894) (not b!939484))
(check-sat b_and!29153 (not b_next!17755))
(get-model)

(declare-fun b!939625 () Bool)

(declare-fun e!527798 () Option!488)

(assert (=> b!939625 (= e!527798 None!486)))

(declare-fun b!939624 () Bool)

(assert (=> b!939624 (= e!527798 (getValueByKey!482 (t!27437 (toList!6048 lt!424345)) (_1!6694 lt!424100)))))

(declare-fun d!114009 () Bool)

(declare-fun c!98143 () Bool)

(assert (=> d!114009 (= c!98143 (and ((_ is Cons!19142) (toList!6048 lt!424345)) (= (_1!6694 (h!20294 (toList!6048 lt!424345))) (_1!6694 lt!424100))))))

(declare-fun e!527797 () Option!488)

(assert (=> d!114009 (= (getValueByKey!482 (toList!6048 lt!424345) (_1!6694 lt!424100)) e!527797)))

(declare-fun b!939623 () Bool)

(assert (=> b!939623 (= e!527797 e!527798)))

(declare-fun c!98144 () Bool)

(assert (=> b!939623 (= c!98144 (and ((_ is Cons!19142) (toList!6048 lt!424345)) (not (= (_1!6694 (h!20294 (toList!6048 lt!424345))) (_1!6694 lt!424100)))))))

(declare-fun b!939622 () Bool)

(assert (=> b!939622 (= e!527797 (Some!487 (_2!6694 (h!20294 (toList!6048 lt!424345)))))))

(assert (= (and d!114009 c!98143) b!939622))

(assert (= (and d!114009 (not c!98143)) b!939623))

(assert (= (and b!939623 c!98144) b!939624))

(assert (= (and b!939623 (not c!98144)) b!939625))

(declare-fun m!875441 () Bool)

(assert (=> b!939624 m!875441))

(assert (=> b!939578 d!114009))

(declare-fun d!114011 () Bool)

(declare-fun res!631868 () Bool)

(declare-fun e!527799 () Bool)

(assert (=> d!114011 (=> res!631868 e!527799)))

(assert (=> d!114011 (= res!631868 (= (select (arr!27193 _keys!1487) (bvadd from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!114011 (= (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)) e!527799)))

(declare-fun b!939626 () Bool)

(declare-fun e!527800 () Bool)

(assert (=> b!939626 (= e!527799 e!527800)))

(declare-fun res!631869 () Bool)

(assert (=> b!939626 (=> (not res!631869) (not e!527800))))

(assert (=> b!939626 (= res!631869 (bvslt (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun b!939627 () Bool)

(assert (=> b!939627 (= e!527800 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114011 (not res!631868)) b!939626))

(assert (= (and b!939626 res!631869) b!939627))

(declare-fun m!875443 () Bool)

(assert (=> d!114011 m!875443))

(declare-fun m!875445 () Bool)

(assert (=> b!939627 m!875445))

(assert (=> b!939521 d!114011))

(declare-fun d!114013 () Bool)

(declare-fun e!527802 () Bool)

(assert (=> d!114013 e!527802))

(declare-fun res!631870 () Bool)

(assert (=> d!114013 (=> res!631870 e!527802)))

(declare-fun lt!424367 () Bool)

(assert (=> d!114013 (= res!631870 (not lt!424367))))

(declare-fun lt!424368 () Bool)

(assert (=> d!114013 (= lt!424367 lt!424368)))

(declare-fun lt!424366 () Unit!31682)

(declare-fun e!527801 () Unit!31682)

(assert (=> d!114013 (= lt!424366 e!527801)))

(declare-fun c!98145 () Bool)

(assert (=> d!114013 (= c!98145 lt!424368)))

(assert (=> d!114013 (= lt!424368 (containsKey!453 (toList!6048 lt!424259) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114013 (= (contains!5120 lt!424259 #b1000000000000000000000000000000000000000000000000000000000000000) lt!424367)))

(declare-fun b!939628 () Bool)

(declare-fun lt!424369 () Unit!31682)

(assert (=> b!939628 (= e!527801 lt!424369)))

(assert (=> b!939628 (= lt!424369 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424259) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939628 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424259) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939629 () Bool)

(declare-fun Unit!31697 () Unit!31682)

(assert (=> b!939629 (= e!527801 Unit!31697)))

(declare-fun b!939630 () Bool)

(assert (=> b!939630 (= e!527802 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114013 c!98145) b!939628))

(assert (= (and d!114013 (not c!98145)) b!939629))

(assert (= (and d!114013 (not res!631870)) b!939630))

(declare-fun m!875447 () Bool)

(assert (=> d!114013 m!875447))

(declare-fun m!875449 () Bool)

(assert (=> b!939628 m!875449))

(declare-fun m!875451 () Bool)

(assert (=> b!939628 m!875451))

(assert (=> b!939628 m!875451))

(declare-fun m!875453 () Bool)

(assert (=> b!939628 m!875453))

(assert (=> b!939630 m!875451))

(assert (=> b!939630 m!875451))

(assert (=> b!939630 m!875453))

(assert (=> bm!40885 d!114013))

(declare-fun d!114015 () Bool)

(assert (=> d!114015 (= (get!14363 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!12707 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!939587 d!114015))

(declare-fun lt!424388 () ListLongMap!12065)

(declare-fun e!527818 () Bool)

(declare-fun b!939655 () Bool)

(assert (=> b!939655 (= e!527818 (= lt!424388 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!939656 () Bool)

(declare-fun lt!424384 () Unit!31682)

(declare-fun lt!424386 () Unit!31682)

(assert (=> b!939656 (= lt!424384 lt!424386)))

(declare-fun lt!424385 () ListLongMap!12065)

(declare-fun lt!424389 () (_ BitVec 64))

(declare-fun lt!424387 () V!31983)

(declare-fun lt!424390 () (_ BitVec 64))

(assert (=> b!939656 (not (contains!5120 (+!2856 lt!424385 (tuple2!13367 lt!424389 lt!424387)) lt!424390))))

(declare-fun addStillNotContains!223 (ListLongMap!12065 (_ BitVec 64) V!31983 (_ BitVec 64)) Unit!31682)

(assert (=> b!939656 (= lt!424386 (addStillNotContains!223 lt!424385 lt!424389 lt!424387 lt!424390))))

(assert (=> b!939656 (= lt!424390 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!939656 (= lt!424387 (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!939656 (= lt!424389 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun call!40917 () ListLongMap!12065)

(assert (=> b!939656 (= lt!424385 call!40917)))

(declare-fun e!527821 () ListLongMap!12065)

(assert (=> b!939656 (= e!527821 (+!2856 call!40917 (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!939657 () Bool)

(declare-fun e!527823 () Bool)

(declare-fun e!527817 () Bool)

(assert (=> b!939657 (= e!527823 e!527817)))

(declare-fun c!98154 () Bool)

(declare-fun e!527819 () Bool)

(assert (=> b!939657 (= c!98154 e!527819)))

(declare-fun res!631879 () Bool)

(assert (=> b!939657 (=> (not res!631879) (not e!527819))))

(assert (=> b!939657 (= res!631879 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun b!939658 () Bool)

(declare-fun res!631881 () Bool)

(assert (=> b!939658 (=> (not res!631881) (not e!527823))))

(assert (=> b!939658 (= res!631881 (not (contains!5120 lt!424388 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!939659 () Bool)

(declare-fun e!527820 () ListLongMap!12065)

(assert (=> b!939659 (= e!527820 e!527821)))

(declare-fun c!98156 () Bool)

(assert (=> b!939659 (= c!98156 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!939660 () Bool)

(declare-fun isEmpty!704 (ListLongMap!12065) Bool)

(assert (=> b!939660 (= e!527818 (isEmpty!704 lt!424388))))

(declare-fun d!114017 () Bool)

(assert (=> d!114017 e!527823))

(declare-fun res!631880 () Bool)

(assert (=> d!114017 (=> (not res!631880) (not e!527823))))

(assert (=> d!114017 (= res!631880 (not (contains!5120 lt!424388 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!114017 (= lt!424388 e!527820)))

(declare-fun c!98155 () Bool)

(assert (=> d!114017 (= c!98155 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(assert (=> d!114017 (validMask!0 mask!1881)))

(assert (=> d!114017 (= (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!424388)))

(declare-fun b!939661 () Bool)

(assert (=> b!939661 (= e!527819 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!939661 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!939662 () Bool)

(declare-fun e!527822 () Bool)

(assert (=> b!939662 (= e!527817 e!527822)))

(assert (=> b!939662 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun res!631882 () Bool)

(assert (=> b!939662 (= res!631882 (contains!5120 lt!424388 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!939662 (=> (not res!631882) (not e!527822))))

(declare-fun b!939663 () Bool)

(assert (=> b!939663 (= e!527820 (ListLongMap!12066 Nil!19143))))

(declare-fun b!939664 () Bool)

(assert (=> b!939664 (= e!527817 e!527818)))

(declare-fun c!98157 () Bool)

(assert (=> b!939664 (= c!98157 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun bm!40914 () Bool)

(assert (=> bm!40914 (= call!40917 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939665 () Bool)

(assert (=> b!939665 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(assert (=> b!939665 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27654 _values!1231)))))

(assert (=> b!939665 (= e!527822 (= (apply!865 lt!424388 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939666 () Bool)

(assert (=> b!939666 (= e!527821 call!40917)))

(assert (= (and d!114017 c!98155) b!939663))

(assert (= (and d!114017 (not c!98155)) b!939659))

(assert (= (and b!939659 c!98156) b!939656))

(assert (= (and b!939659 (not c!98156)) b!939666))

(assert (= (or b!939656 b!939666) bm!40914))

(assert (= (and d!114017 res!631880) b!939658))

(assert (= (and b!939658 res!631881) b!939657))

(assert (= (and b!939657 res!631879) b!939661))

(assert (= (and b!939657 c!98154) b!939662))

(assert (= (and b!939657 (not c!98154)) b!939664))

(assert (= (and b!939662 res!631882) b!939665))

(assert (= (and b!939664 c!98157) b!939655))

(assert (= (and b!939664 (not c!98157)) b!939660))

(declare-fun b_lambda!14249 () Bool)

(assert (=> (not b_lambda!14249) (not b!939656)))

(assert (=> b!939656 t!27436))

(declare-fun b_and!29155 () Bool)

(assert (= b_and!29153 (and (=> t!27436 result!12125) b_and!29155)))

(declare-fun b_lambda!14251 () Bool)

(assert (=> (not b_lambda!14251) (not b!939665)))

(assert (=> b!939665 t!27436))

(declare-fun b_and!29157 () Bool)

(assert (= b_and!29155 (and (=> t!27436 result!12125) b_and!29157)))

(assert (=> b!939661 m!875031))

(assert (=> b!939661 m!875031))

(assert (=> b!939661 m!875287))

(declare-fun m!875455 () Bool)

(assert (=> b!939656 m!875455))

(assert (=> b!939656 m!875031))

(assert (=> b!939656 m!875455))

(declare-fun m!875457 () Bool)

(assert (=> b!939656 m!875457))

(declare-fun m!875459 () Bool)

(assert (=> b!939656 m!875459))

(assert (=> b!939656 m!875003))

(assert (=> b!939656 m!875003))

(assert (=> b!939656 m!875007))

(assert (=> b!939656 m!875023))

(declare-fun m!875461 () Bool)

(assert (=> b!939656 m!875461))

(assert (=> b!939656 m!875007))

(declare-fun m!875463 () Bool)

(assert (=> b!939655 m!875463))

(declare-fun m!875465 () Bool)

(assert (=> b!939660 m!875465))

(assert (=> b!939662 m!875031))

(assert (=> b!939662 m!875031))

(declare-fun m!875467 () Bool)

(assert (=> b!939662 m!875467))

(assert (=> b!939659 m!875031))

(assert (=> b!939659 m!875031))

(assert (=> b!939659 m!875287))

(declare-fun m!875469 () Bool)

(assert (=> d!114017 m!875469))

(assert (=> d!114017 m!875045))

(declare-fun m!875471 () Bool)

(assert (=> b!939658 m!875471))

(assert (=> b!939665 m!875031))

(assert (=> b!939665 m!875007))

(assert (=> b!939665 m!875003))

(assert (=> b!939665 m!875031))

(declare-fun m!875473 () Bool)

(assert (=> b!939665 m!875473))

(assert (=> b!939665 m!875003))

(assert (=> b!939665 m!875007))

(assert (=> b!939665 m!875023))

(assert (=> bm!40914 m!875463))

(assert (=> b!939511 d!114017))

(declare-fun d!114019 () Bool)

(declare-fun e!527824 () Bool)

(assert (=> d!114019 e!527824))

(declare-fun res!631884 () Bool)

(assert (=> d!114019 (=> (not res!631884) (not e!527824))))

(declare-fun lt!424393 () ListLongMap!12065)

(assert (=> d!114019 (= res!631884 (contains!5120 lt!424393 (_1!6694 (tuple2!13367 lt!424276 minValue!1173))))))

(declare-fun lt!424391 () List!19146)

(assert (=> d!114019 (= lt!424393 (ListLongMap!12066 lt!424391))))

(declare-fun lt!424394 () Unit!31682)

(declare-fun lt!424392 () Unit!31682)

(assert (=> d!114019 (= lt!424394 lt!424392)))

(assert (=> d!114019 (= (getValueByKey!482 lt!424391 (_1!6694 (tuple2!13367 lt!424276 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424276 minValue!1173))))))

(assert (=> d!114019 (= lt!424392 (lemmaContainsTupThenGetReturnValue!261 lt!424391 (_1!6694 (tuple2!13367 lt!424276 minValue!1173)) (_2!6694 (tuple2!13367 lt!424276 minValue!1173))))))

(assert (=> d!114019 (= lt!424391 (insertStrictlySorted!318 (toList!6048 lt!424290) (_1!6694 (tuple2!13367 lt!424276 minValue!1173)) (_2!6694 (tuple2!13367 lt!424276 minValue!1173))))))

(assert (=> d!114019 (= (+!2856 lt!424290 (tuple2!13367 lt!424276 minValue!1173)) lt!424393)))

(declare-fun b!939667 () Bool)

(declare-fun res!631883 () Bool)

(assert (=> b!939667 (=> (not res!631883) (not e!527824))))

(assert (=> b!939667 (= res!631883 (= (getValueByKey!482 (toList!6048 lt!424393) (_1!6694 (tuple2!13367 lt!424276 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424276 minValue!1173)))))))

(declare-fun b!939668 () Bool)

(assert (=> b!939668 (= e!527824 (contains!5124 (toList!6048 lt!424393) (tuple2!13367 lt!424276 minValue!1173)))))

(assert (= (and d!114019 res!631884) b!939667))

(assert (= (and b!939667 res!631883) b!939668))

(declare-fun m!875475 () Bool)

(assert (=> d!114019 m!875475))

(declare-fun m!875477 () Bool)

(assert (=> d!114019 m!875477))

(declare-fun m!875479 () Bool)

(assert (=> d!114019 m!875479))

(declare-fun m!875481 () Bool)

(assert (=> d!114019 m!875481))

(declare-fun m!875483 () Bool)

(assert (=> b!939667 m!875483))

(declare-fun m!875485 () Bool)

(assert (=> b!939668 m!875485))

(assert (=> b!939511 d!114019))

(declare-fun d!114021 () Bool)

(assert (=> d!114021 (= (apply!865 (+!2856 lt!424287 (tuple2!13367 lt!424291 zeroValue!1173)) lt!424277) (get!14362 (getValueByKey!482 (toList!6048 (+!2856 lt!424287 (tuple2!13367 lt!424291 zeroValue!1173))) lt!424277)))))

(declare-fun bs!26368 () Bool)

(assert (= bs!26368 d!114021))

(declare-fun m!875487 () Bool)

(assert (=> bs!26368 m!875487))

(assert (=> bs!26368 m!875487))

(declare-fun m!875489 () Bool)

(assert (=> bs!26368 m!875489))

(assert (=> b!939511 d!114021))

(declare-fun d!114023 () Bool)

(assert (=> d!114023 (= (apply!865 lt!424296 lt!424275) (get!14362 (getValueByKey!482 (toList!6048 lt!424296) lt!424275)))))

(declare-fun bs!26369 () Bool)

(assert (= bs!26369 d!114023))

(declare-fun m!875491 () Bool)

(assert (=> bs!26369 m!875491))

(assert (=> bs!26369 m!875491))

(declare-fun m!875493 () Bool)

(assert (=> bs!26369 m!875493))

(assert (=> b!939511 d!114023))

(declare-fun d!114025 () Bool)

(declare-fun e!527825 () Bool)

(assert (=> d!114025 e!527825))

(declare-fun res!631886 () Bool)

(assert (=> d!114025 (=> (not res!631886) (not e!527825))))

(declare-fun lt!424397 () ListLongMap!12065)

(assert (=> d!114025 (= res!631886 (contains!5120 lt!424397 (_1!6694 (tuple2!13367 lt!424295 zeroValue!1173))))))

(declare-fun lt!424395 () List!19146)

(assert (=> d!114025 (= lt!424397 (ListLongMap!12066 lt!424395))))

(declare-fun lt!424398 () Unit!31682)

(declare-fun lt!424396 () Unit!31682)

(assert (=> d!114025 (= lt!424398 lt!424396)))

(assert (=> d!114025 (= (getValueByKey!482 lt!424395 (_1!6694 (tuple2!13367 lt!424295 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424295 zeroValue!1173))))))

(assert (=> d!114025 (= lt!424396 (lemmaContainsTupThenGetReturnValue!261 lt!424395 (_1!6694 (tuple2!13367 lt!424295 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424295 zeroValue!1173))))))

(assert (=> d!114025 (= lt!424395 (insertStrictlySorted!318 (toList!6048 lt!424284) (_1!6694 (tuple2!13367 lt!424295 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424295 zeroValue!1173))))))

(assert (=> d!114025 (= (+!2856 lt!424284 (tuple2!13367 lt!424295 zeroValue!1173)) lt!424397)))

(declare-fun b!939669 () Bool)

(declare-fun res!631885 () Bool)

(assert (=> b!939669 (=> (not res!631885) (not e!527825))))

(assert (=> b!939669 (= res!631885 (= (getValueByKey!482 (toList!6048 lt!424397) (_1!6694 (tuple2!13367 lt!424295 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424295 zeroValue!1173)))))))

(declare-fun b!939670 () Bool)

(assert (=> b!939670 (= e!527825 (contains!5124 (toList!6048 lt!424397) (tuple2!13367 lt!424295 zeroValue!1173)))))

(assert (= (and d!114025 res!631886) b!939669))

(assert (= (and b!939669 res!631885) b!939670))

(declare-fun m!875495 () Bool)

(assert (=> d!114025 m!875495))

(declare-fun m!875497 () Bool)

(assert (=> d!114025 m!875497))

(declare-fun m!875499 () Bool)

(assert (=> d!114025 m!875499))

(declare-fun m!875501 () Bool)

(assert (=> d!114025 m!875501))

(declare-fun m!875503 () Bool)

(assert (=> b!939669 m!875503))

(declare-fun m!875505 () Bool)

(assert (=> b!939670 m!875505))

(assert (=> b!939511 d!114025))

(declare-fun d!114027 () Bool)

(assert (=> d!114027 (= (apply!865 (+!2856 lt!424290 (tuple2!13367 lt!424276 minValue!1173)) lt!424282) (apply!865 lt!424290 lt!424282))))

(declare-fun lt!424399 () Unit!31682)

(assert (=> d!114027 (= lt!424399 (choose!1566 lt!424290 lt!424276 minValue!1173 lt!424282))))

(declare-fun e!527826 () Bool)

(assert (=> d!114027 e!527826))

(declare-fun res!631887 () Bool)

(assert (=> d!114027 (=> (not res!631887) (not e!527826))))

(assert (=> d!114027 (= res!631887 (contains!5120 lt!424290 lt!424282))))

(assert (=> d!114027 (= (addApplyDifferent!440 lt!424290 lt!424276 minValue!1173 lt!424282) lt!424399)))

(declare-fun b!939671 () Bool)

(assert (=> b!939671 (= e!527826 (not (= lt!424282 lt!424276)))))

(assert (= (and d!114027 res!631887) b!939671))

(assert (=> d!114027 m!875265))

(assert (=> d!114027 m!875261))

(declare-fun m!875507 () Bool)

(assert (=> d!114027 m!875507))

(assert (=> d!114027 m!875261))

(assert (=> d!114027 m!875263))

(declare-fun m!875509 () Bool)

(assert (=> d!114027 m!875509))

(assert (=> b!939511 d!114027))

(declare-fun d!114029 () Bool)

(declare-fun e!527828 () Bool)

(assert (=> d!114029 e!527828))

(declare-fun res!631888 () Bool)

(assert (=> d!114029 (=> res!631888 e!527828)))

(declare-fun lt!424401 () Bool)

(assert (=> d!114029 (= res!631888 (not lt!424401))))

(declare-fun lt!424402 () Bool)

(assert (=> d!114029 (= lt!424401 lt!424402)))

(declare-fun lt!424400 () Unit!31682)

(declare-fun e!527827 () Unit!31682)

(assert (=> d!114029 (= lt!424400 e!527827)))

(declare-fun c!98158 () Bool)

(assert (=> d!114029 (= c!98158 lt!424402)))

(assert (=> d!114029 (= lt!424402 (containsKey!453 (toList!6048 (+!2856 lt!424284 (tuple2!13367 lt!424295 zeroValue!1173))) lt!424279))))

(assert (=> d!114029 (= (contains!5120 (+!2856 lt!424284 (tuple2!13367 lt!424295 zeroValue!1173)) lt!424279) lt!424401)))

(declare-fun b!939672 () Bool)

(declare-fun lt!424403 () Unit!31682)

(assert (=> b!939672 (= e!527827 lt!424403)))

(assert (=> b!939672 (= lt!424403 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 (+!2856 lt!424284 (tuple2!13367 lt!424295 zeroValue!1173))) lt!424279))))

(assert (=> b!939672 (isDefined!355 (getValueByKey!482 (toList!6048 (+!2856 lt!424284 (tuple2!13367 lt!424295 zeroValue!1173))) lt!424279))))

(declare-fun b!939673 () Bool)

(declare-fun Unit!31698 () Unit!31682)

(assert (=> b!939673 (= e!527827 Unit!31698)))

(declare-fun b!939674 () Bool)

(assert (=> b!939674 (= e!527828 (isDefined!355 (getValueByKey!482 (toList!6048 (+!2856 lt!424284 (tuple2!13367 lt!424295 zeroValue!1173))) lt!424279)))))

(assert (= (and d!114029 c!98158) b!939672))

(assert (= (and d!114029 (not c!98158)) b!939673))

(assert (= (and d!114029 (not res!631888)) b!939674))

(declare-fun m!875511 () Bool)

(assert (=> d!114029 m!875511))

(declare-fun m!875513 () Bool)

(assert (=> b!939672 m!875513))

(declare-fun m!875515 () Bool)

(assert (=> b!939672 m!875515))

(assert (=> b!939672 m!875515))

(declare-fun m!875517 () Bool)

(assert (=> b!939672 m!875517))

(assert (=> b!939674 m!875515))

(assert (=> b!939674 m!875515))

(assert (=> b!939674 m!875517))

(assert (=> b!939511 d!114029))

(declare-fun d!114031 () Bool)

(assert (=> d!114031 (= (apply!865 (+!2856 lt!424290 (tuple2!13367 lt!424276 minValue!1173)) lt!424282) (get!14362 (getValueByKey!482 (toList!6048 (+!2856 lt!424290 (tuple2!13367 lt!424276 minValue!1173))) lt!424282)))))

(declare-fun bs!26370 () Bool)

(assert (= bs!26370 d!114031))

(declare-fun m!875519 () Bool)

(assert (=> bs!26370 m!875519))

(assert (=> bs!26370 m!875519))

(declare-fun m!875521 () Bool)

(assert (=> bs!26370 m!875521))

(assert (=> b!939511 d!114031))

(declare-fun d!114033 () Bool)

(declare-fun e!527829 () Bool)

(assert (=> d!114033 e!527829))

(declare-fun res!631890 () Bool)

(assert (=> d!114033 (=> (not res!631890) (not e!527829))))

(declare-fun lt!424406 () ListLongMap!12065)

(assert (=> d!114033 (= res!631890 (contains!5120 lt!424406 (_1!6694 (tuple2!13367 lt!424286 minValue!1173))))))

(declare-fun lt!424404 () List!19146)

(assert (=> d!114033 (= lt!424406 (ListLongMap!12066 lt!424404))))

(declare-fun lt!424407 () Unit!31682)

(declare-fun lt!424405 () Unit!31682)

(assert (=> d!114033 (= lt!424407 lt!424405)))

(assert (=> d!114033 (= (getValueByKey!482 lt!424404 (_1!6694 (tuple2!13367 lt!424286 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424286 minValue!1173))))))

(assert (=> d!114033 (= lt!424405 (lemmaContainsTupThenGetReturnValue!261 lt!424404 (_1!6694 (tuple2!13367 lt!424286 minValue!1173)) (_2!6694 (tuple2!13367 lt!424286 minValue!1173))))))

(assert (=> d!114033 (= lt!424404 (insertStrictlySorted!318 (toList!6048 lt!424296) (_1!6694 (tuple2!13367 lt!424286 minValue!1173)) (_2!6694 (tuple2!13367 lt!424286 minValue!1173))))))

(assert (=> d!114033 (= (+!2856 lt!424296 (tuple2!13367 lt!424286 minValue!1173)) lt!424406)))

(declare-fun b!939675 () Bool)

(declare-fun res!631889 () Bool)

(assert (=> b!939675 (=> (not res!631889) (not e!527829))))

(assert (=> b!939675 (= res!631889 (= (getValueByKey!482 (toList!6048 lt!424406) (_1!6694 (tuple2!13367 lt!424286 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424286 minValue!1173)))))))

(declare-fun b!939676 () Bool)

(assert (=> b!939676 (= e!527829 (contains!5124 (toList!6048 lt!424406) (tuple2!13367 lt!424286 minValue!1173)))))

(assert (= (and d!114033 res!631890) b!939675))

(assert (= (and b!939675 res!631889) b!939676))

(declare-fun m!875523 () Bool)

(assert (=> d!114033 m!875523))

(declare-fun m!875525 () Bool)

(assert (=> d!114033 m!875525))

(declare-fun m!875527 () Bool)

(assert (=> d!114033 m!875527))

(declare-fun m!875529 () Bool)

(assert (=> d!114033 m!875529))

(declare-fun m!875531 () Bool)

(assert (=> b!939675 m!875531))

(declare-fun m!875533 () Bool)

(assert (=> b!939676 m!875533))

(assert (=> b!939511 d!114033))

(declare-fun d!114035 () Bool)

(assert (=> d!114035 (= (apply!865 lt!424290 lt!424282) (get!14362 (getValueByKey!482 (toList!6048 lt!424290) lt!424282)))))

(declare-fun bs!26371 () Bool)

(assert (= bs!26371 d!114035))

(declare-fun m!875535 () Bool)

(assert (=> bs!26371 m!875535))

(assert (=> bs!26371 m!875535))

(declare-fun m!875537 () Bool)

(assert (=> bs!26371 m!875537))

(assert (=> b!939511 d!114035))

(declare-fun d!114037 () Bool)

(declare-fun e!527830 () Bool)

(assert (=> d!114037 e!527830))

(declare-fun res!631892 () Bool)

(assert (=> d!114037 (=> (not res!631892) (not e!527830))))

(declare-fun lt!424410 () ListLongMap!12065)

(assert (=> d!114037 (= res!631892 (contains!5120 lt!424410 (_1!6694 (tuple2!13367 lt!424291 zeroValue!1173))))))

(declare-fun lt!424408 () List!19146)

(assert (=> d!114037 (= lt!424410 (ListLongMap!12066 lt!424408))))

(declare-fun lt!424411 () Unit!31682)

(declare-fun lt!424409 () Unit!31682)

(assert (=> d!114037 (= lt!424411 lt!424409)))

(assert (=> d!114037 (= (getValueByKey!482 lt!424408 (_1!6694 (tuple2!13367 lt!424291 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424291 zeroValue!1173))))))

(assert (=> d!114037 (= lt!424409 (lemmaContainsTupThenGetReturnValue!261 lt!424408 (_1!6694 (tuple2!13367 lt!424291 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424291 zeroValue!1173))))))

(assert (=> d!114037 (= lt!424408 (insertStrictlySorted!318 (toList!6048 lt!424287) (_1!6694 (tuple2!13367 lt!424291 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424291 zeroValue!1173))))))

(assert (=> d!114037 (= (+!2856 lt!424287 (tuple2!13367 lt!424291 zeroValue!1173)) lt!424410)))

(declare-fun b!939677 () Bool)

(declare-fun res!631891 () Bool)

(assert (=> b!939677 (=> (not res!631891) (not e!527830))))

(assert (=> b!939677 (= res!631891 (= (getValueByKey!482 (toList!6048 lt!424410) (_1!6694 (tuple2!13367 lt!424291 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424291 zeroValue!1173)))))))

(declare-fun b!939678 () Bool)

(assert (=> b!939678 (= e!527830 (contains!5124 (toList!6048 lt!424410) (tuple2!13367 lt!424291 zeroValue!1173)))))

(assert (= (and d!114037 res!631892) b!939677))

(assert (= (and b!939677 res!631891) b!939678))

(declare-fun m!875539 () Bool)

(assert (=> d!114037 m!875539))

(declare-fun m!875541 () Bool)

(assert (=> d!114037 m!875541))

(declare-fun m!875543 () Bool)

(assert (=> d!114037 m!875543))

(declare-fun m!875545 () Bool)

(assert (=> d!114037 m!875545))

(declare-fun m!875547 () Bool)

(assert (=> b!939677 m!875547))

(declare-fun m!875549 () Bool)

(assert (=> b!939678 m!875549))

(assert (=> b!939511 d!114037))

(declare-fun d!114039 () Bool)

(assert (=> d!114039 (= (apply!865 (+!2856 lt!424296 (tuple2!13367 lt!424286 minValue!1173)) lt!424275) (get!14362 (getValueByKey!482 (toList!6048 (+!2856 lt!424296 (tuple2!13367 lt!424286 minValue!1173))) lt!424275)))))

(declare-fun bs!26372 () Bool)

(assert (= bs!26372 d!114039))

(declare-fun m!875551 () Bool)

(assert (=> bs!26372 m!875551))

(assert (=> bs!26372 m!875551))

(declare-fun m!875553 () Bool)

(assert (=> bs!26372 m!875553))

(assert (=> b!939511 d!114039))

(declare-fun d!114041 () Bool)

(assert (=> d!114041 (= (apply!865 (+!2856 lt!424296 (tuple2!13367 lt!424286 minValue!1173)) lt!424275) (apply!865 lt!424296 lt!424275))))

(declare-fun lt!424412 () Unit!31682)

(assert (=> d!114041 (= lt!424412 (choose!1566 lt!424296 lt!424286 minValue!1173 lt!424275))))

(declare-fun e!527831 () Bool)

(assert (=> d!114041 e!527831))

(declare-fun res!631893 () Bool)

(assert (=> d!114041 (=> (not res!631893) (not e!527831))))

(assert (=> d!114041 (= res!631893 (contains!5120 lt!424296 lt!424275))))

(assert (=> d!114041 (= (addApplyDifferent!440 lt!424296 lt!424286 minValue!1173 lt!424275) lt!424412)))

(declare-fun b!939679 () Bool)

(assert (=> b!939679 (= e!527831 (not (= lt!424275 lt!424286)))))

(assert (= (and d!114041 res!631893) b!939679))

(assert (=> d!114041 m!875271))

(assert (=> d!114041 m!875257))

(declare-fun m!875555 () Bool)

(assert (=> d!114041 m!875555))

(assert (=> d!114041 m!875257))

(assert (=> d!114041 m!875259))

(declare-fun m!875557 () Bool)

(assert (=> d!114041 m!875557))

(assert (=> b!939511 d!114041))

(declare-fun d!114043 () Bool)

(assert (=> d!114043 (= (apply!865 (+!2856 lt!424287 (tuple2!13367 lt!424291 zeroValue!1173)) lt!424277) (apply!865 lt!424287 lt!424277))))

(declare-fun lt!424413 () Unit!31682)

(assert (=> d!114043 (= lt!424413 (choose!1566 lt!424287 lt!424291 zeroValue!1173 lt!424277))))

(declare-fun e!527832 () Bool)

(assert (=> d!114043 e!527832))

(declare-fun res!631894 () Bool)

(assert (=> d!114043 (=> (not res!631894) (not e!527832))))

(assert (=> d!114043 (= res!631894 (contains!5120 lt!424287 lt!424277))))

(assert (=> d!114043 (= (addApplyDifferent!440 lt!424287 lt!424291 zeroValue!1173 lt!424277) lt!424413)))

(declare-fun b!939680 () Bool)

(assert (=> b!939680 (= e!527832 (not (= lt!424277 lt!424291)))))

(assert (= (and d!114043 res!631894) b!939680))

(assert (=> d!114043 m!875267))

(assert (=> d!114043 m!875273))

(declare-fun m!875559 () Bool)

(assert (=> d!114043 m!875559))

(assert (=> d!114043 m!875273))

(assert (=> d!114043 m!875279))

(declare-fun m!875561 () Bool)

(assert (=> d!114043 m!875561))

(assert (=> b!939511 d!114043))

(declare-fun d!114045 () Bool)

(assert (=> d!114045 (= (apply!865 lt!424287 lt!424277) (get!14362 (getValueByKey!482 (toList!6048 lt!424287) lt!424277)))))

(declare-fun bs!26373 () Bool)

(assert (= bs!26373 d!114045))

(declare-fun m!875563 () Bool)

(assert (=> bs!26373 m!875563))

(assert (=> bs!26373 m!875563))

(declare-fun m!875565 () Bool)

(assert (=> bs!26373 m!875565))

(assert (=> b!939511 d!114045))

(declare-fun d!114047 () Bool)

(assert (=> d!114047 (contains!5120 (+!2856 lt!424284 (tuple2!13367 lt!424295 zeroValue!1173)) lt!424279)))

(declare-fun lt!424414 () Unit!31682)

(assert (=> d!114047 (= lt!424414 (choose!1567 lt!424284 lt!424295 zeroValue!1173 lt!424279))))

(assert (=> d!114047 (contains!5120 lt!424284 lt!424279)))

(assert (=> d!114047 (= (addStillContains!559 lt!424284 lt!424295 zeroValue!1173 lt!424279) lt!424414)))

(declare-fun bs!26374 () Bool)

(assert (= bs!26374 d!114047))

(assert (=> bs!26374 m!875275))

(assert (=> bs!26374 m!875275))

(assert (=> bs!26374 m!875285))

(declare-fun m!875567 () Bool)

(assert (=> bs!26374 m!875567))

(declare-fun m!875569 () Bool)

(assert (=> bs!26374 m!875569))

(assert (=> b!939511 d!114047))

(declare-fun d!114049 () Bool)

(assert (=> d!114049 (= (apply!865 lt!424331 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14362 (getValueByKey!482 (toList!6048 lt!424331) (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(declare-fun bs!26375 () Bool)

(assert (= bs!26375 d!114049))

(assert (=> bs!26375 m!875345))

(declare-fun m!875571 () Bool)

(assert (=> bs!26375 m!875571))

(assert (=> bs!26375 m!875571))

(declare-fun m!875573 () Bool)

(assert (=> bs!26375 m!875573))

(assert (=> b!939567 d!114049))

(declare-fun d!114051 () Bool)

(declare-fun c!98159 () Bool)

(assert (=> d!114051 (= c!98159 ((_ is ValueCellFull!9650) (select (arr!27194 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun e!527833 () V!31983)

(assert (=> d!114051 (= (get!14361 (select (arr!27194 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527833)))

(declare-fun b!939681 () Bool)

(assert (=> b!939681 (= e!527833 (get!14363 (select (arr!27194 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!939682 () Bool)

(assert (=> b!939682 (= e!527833 (get!14364 (select (arr!27194 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114051 c!98159) b!939681))

(assert (= (and d!114051 (not c!98159)) b!939682))

(assert (=> b!939681 m!875343))

(assert (=> b!939681 m!875007))

(declare-fun m!875575 () Bool)

(assert (=> b!939681 m!875575))

(assert (=> b!939682 m!875343))

(assert (=> b!939682 m!875007))

(declare-fun m!875577 () Bool)

(assert (=> b!939682 m!875577))

(assert (=> b!939567 d!114051))

(declare-fun d!114053 () Bool)

(declare-fun isEmpty!705 (Option!488) Bool)

(assert (=> d!114053 (= (isDefined!355 (getValueByKey!482 (toList!6048 lt!424102) k0!1099)) (not (isEmpty!705 (getValueByKey!482 (toList!6048 lt!424102) k0!1099))))))

(declare-fun bs!26376 () Bool)

(assert (= bs!26376 d!114053))

(assert (=> bs!26376 m!875243))

(declare-fun m!875579 () Bool)

(assert (=> bs!26376 m!875579))

(assert (=> b!939494 d!114053))

(declare-fun b!939686 () Bool)

(declare-fun e!527835 () Option!488)

(assert (=> b!939686 (= e!527835 None!486)))

(declare-fun b!939685 () Bool)

(assert (=> b!939685 (= e!527835 (getValueByKey!482 (t!27437 (toList!6048 lt!424102)) k0!1099))))

(declare-fun d!114055 () Bool)

(declare-fun c!98160 () Bool)

(assert (=> d!114055 (= c!98160 (and ((_ is Cons!19142) (toList!6048 lt!424102)) (= (_1!6694 (h!20294 (toList!6048 lt!424102))) k0!1099)))))

(declare-fun e!527834 () Option!488)

(assert (=> d!114055 (= (getValueByKey!482 (toList!6048 lt!424102) k0!1099) e!527834)))

(declare-fun b!939684 () Bool)

(assert (=> b!939684 (= e!527834 e!527835)))

(declare-fun c!98161 () Bool)

(assert (=> b!939684 (= c!98161 (and ((_ is Cons!19142) (toList!6048 lt!424102)) (not (= (_1!6694 (h!20294 (toList!6048 lt!424102))) k0!1099))))))

(declare-fun b!939683 () Bool)

(assert (=> b!939683 (= e!527834 (Some!487 (_2!6694 (h!20294 (toList!6048 lt!424102)))))))

(assert (= (and d!114055 c!98160) b!939683))

(assert (= (and d!114055 (not c!98160)) b!939684))

(assert (= (and b!939684 c!98161) b!939685))

(assert (= (and b!939684 (not c!98161)) b!939686))

(declare-fun m!875581 () Bool)

(assert (=> b!939685 m!875581))

(assert (=> b!939494 d!114055))

(declare-fun d!114057 () Bool)

(assert (=> d!114057 (= (apply!865 lt!424285 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14362 (getValueByKey!482 (toList!6048 lt!424285) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26377 () Bool)

(assert (= bs!26377 d!114057))

(declare-fun m!875583 () Bool)

(assert (=> bs!26377 m!875583))

(assert (=> bs!26377 m!875583))

(declare-fun m!875585 () Bool)

(assert (=> bs!26377 m!875585))

(assert (=> b!939508 d!114057))

(declare-fun d!114059 () Bool)

(declare-fun e!527836 () Bool)

(assert (=> d!114059 e!527836))

(declare-fun res!631896 () Bool)

(assert (=> d!114059 (=> (not res!631896) (not e!527836))))

(declare-fun lt!424417 () ListLongMap!12065)

(assert (=> d!114059 (= res!631896 (contains!5120 lt!424417 (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!424415 () List!19146)

(assert (=> d!114059 (= lt!424417 (ListLongMap!12066 lt!424415))))

(declare-fun lt!424418 () Unit!31682)

(declare-fun lt!424416 () Unit!31682)

(assert (=> d!114059 (= lt!424418 lt!424416)))

(assert (=> d!114059 (= (getValueByKey!482 lt!424415 (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!114059 (= lt!424416 (lemmaContainsTupThenGetReturnValue!261 lt!424415 (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!114059 (= lt!424415 (insertStrictlySorted!318 (toList!6048 call!40892) (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!114059 (= (+!2856 call!40892 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!424417)))

(declare-fun b!939687 () Bool)

(declare-fun res!631895 () Bool)

(assert (=> b!939687 (=> (not res!631895) (not e!527836))))

(assert (=> b!939687 (= res!631895 (= (getValueByKey!482 (toList!6048 lt!424417) (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!939688 () Bool)

(assert (=> b!939688 (= e!527836 (contains!5124 (toList!6048 lt!424417) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!114059 res!631896) b!939687))

(assert (= (and b!939687 res!631895) b!939688))

(declare-fun m!875587 () Bool)

(assert (=> d!114059 m!875587))

(declare-fun m!875589 () Bool)

(assert (=> d!114059 m!875589))

(declare-fun m!875591 () Bool)

(assert (=> d!114059 m!875591))

(declare-fun m!875593 () Bool)

(assert (=> d!114059 m!875593))

(declare-fun m!875595 () Bool)

(assert (=> b!939687 m!875595))

(declare-fun m!875597 () Bool)

(assert (=> b!939688 m!875597))

(assert (=> b!939486 d!114059))

(declare-fun d!114061 () Bool)

(declare-fun e!527838 () Bool)

(assert (=> d!114061 e!527838))

(declare-fun res!631897 () Bool)

(assert (=> d!114061 (=> res!631897 e!527838)))

(declare-fun lt!424420 () Bool)

(assert (=> d!114061 (= res!631897 (not lt!424420))))

(declare-fun lt!424421 () Bool)

(assert (=> d!114061 (= lt!424420 lt!424421)))

(declare-fun lt!424419 () Unit!31682)

(declare-fun e!527837 () Unit!31682)

(assert (=> d!114061 (= lt!424419 e!527837)))

(declare-fun c!98162 () Bool)

(assert (=> d!114061 (= c!98162 lt!424421)))

(assert (=> d!114061 (= lt!424421 (containsKey!453 (toList!6048 lt!424259) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114061 (= (contains!5120 lt!424259 #b0000000000000000000000000000000000000000000000000000000000000000) lt!424420)))

(declare-fun b!939689 () Bool)

(declare-fun lt!424422 () Unit!31682)

(assert (=> b!939689 (= e!527837 lt!424422)))

(assert (=> b!939689 (= lt!424422 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424259) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939689 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424259) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939690 () Bool)

(declare-fun Unit!31699 () Unit!31682)

(assert (=> b!939690 (= e!527837 Unit!31699)))

(declare-fun b!939691 () Bool)

(assert (=> b!939691 (= e!527838 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424259) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114061 c!98162) b!939689))

(assert (= (and d!114061 (not c!98162)) b!939690))

(assert (= (and d!114061 (not res!631897)) b!939691))

(declare-fun m!875599 () Bool)

(assert (=> d!114061 m!875599))

(declare-fun m!875601 () Bool)

(assert (=> b!939689 m!875601))

(declare-fun m!875603 () Bool)

(assert (=> b!939689 m!875603))

(assert (=> b!939689 m!875603))

(declare-fun m!875605 () Bool)

(assert (=> b!939689 m!875605))

(assert (=> b!939691 m!875603))

(assert (=> b!939691 m!875603))

(assert (=> b!939691 m!875605))

(assert (=> bm!40884 d!114061))

(declare-fun d!114063 () Bool)

(assert (=> d!114063 (= (apply!865 lt!424331 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14362 (getValueByKey!482 (toList!6048 lt!424331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26378 () Bool)

(assert (= bs!26378 d!114063))

(declare-fun m!875607 () Bool)

(assert (=> bs!26378 m!875607))

(assert (=> bs!26378 m!875607))

(declare-fun m!875609 () Bool)

(assert (=> bs!26378 m!875609))

(assert (=> b!939566 d!114063))

(declare-fun d!114065 () Bool)

(declare-fun e!527839 () Bool)

(assert (=> d!114065 e!527839))

(declare-fun res!631899 () Bool)

(assert (=> d!114065 (=> (not res!631899) (not e!527839))))

(declare-fun lt!424425 () ListLongMap!12065)

(assert (=> d!114065 (= res!631899 (contains!5120 lt!424425 (_1!6694 (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!424423 () List!19146)

(assert (=> d!114065 (= lt!424425 (ListLongMap!12066 lt!424423))))

(declare-fun lt!424426 () Unit!31682)

(declare-fun lt!424424 () Unit!31682)

(assert (=> d!114065 (= lt!424426 lt!424424)))

(assert (=> d!114065 (= (getValueByKey!482 lt!424423 (_1!6694 (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!487 (_2!6694 (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!114065 (= lt!424424 (lemmaContainsTupThenGetReturnValue!261 lt!424423 (_1!6694 (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6694 (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!114065 (= lt!424423 (insertStrictlySorted!318 (toList!6048 (ite c!98130 call!40904 (ite c!98128 call!40908 call!40907))) (_1!6694 (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6694 (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!114065 (= (+!2856 (ite c!98130 call!40904 (ite c!98128 call!40908 call!40907)) (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!424425)))

(declare-fun b!939692 () Bool)

(declare-fun res!631898 () Bool)

(assert (=> b!939692 (=> (not res!631898) (not e!527839))))

(assert (=> b!939692 (= res!631898 (= (getValueByKey!482 (toList!6048 lt!424425) (_1!6694 (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!487 (_2!6694 (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!939693 () Bool)

(assert (=> b!939693 (= e!527839 (contains!5124 (toList!6048 lt!424425) (ite (or c!98130 c!98128) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!114065 res!631899) b!939692))

(assert (= (and b!939692 res!631898) b!939693))

(declare-fun m!875611 () Bool)

(assert (=> d!114065 m!875611))

(declare-fun m!875613 () Bool)

(assert (=> d!114065 m!875613))

(declare-fun m!875615 () Bool)

(assert (=> d!114065 m!875615))

(declare-fun m!875617 () Bool)

(assert (=> d!114065 m!875617))

(declare-fun m!875619 () Bool)

(assert (=> b!939692 m!875619))

(declare-fun m!875621 () Bool)

(assert (=> b!939693 m!875621))

(assert (=> bm!40904 d!114065))

(declare-fun d!114067 () Bool)

(declare-fun lt!424429 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!410 (List!19147) (InoxSet (_ BitVec 64)))

(assert (=> d!114067 (= lt!424429 (select (content!410 Nil!19144) (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!527845 () Bool)

(assert (=> d!114067 (= lt!424429 e!527845)))

(declare-fun res!631905 () Bool)

(assert (=> d!114067 (=> (not res!631905) (not e!527845))))

(assert (=> d!114067 (= res!631905 ((_ is Cons!19143) Nil!19144))))

(assert (=> d!114067 (= (contains!5123 Nil!19144 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!424429)))

(declare-fun b!939698 () Bool)

(declare-fun e!527844 () Bool)

(assert (=> b!939698 (= e!527845 e!527844)))

(declare-fun res!631904 () Bool)

(assert (=> b!939698 (=> res!631904 e!527844)))

(assert (=> b!939698 (= res!631904 (= (h!20295 Nil!19144) (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!939699 () Bool)

(assert (=> b!939699 (= e!527844 (contains!5123 (t!27438 Nil!19144) (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!114067 res!631905) b!939698))

(assert (= (and b!939698 (not res!631904)) b!939699))

(declare-fun m!875623 () Bool)

(assert (=> d!114067 m!875623))

(assert (=> d!114067 m!875031))

(declare-fun m!875625 () Bool)

(assert (=> d!114067 m!875625))

(assert (=> b!939699 m!875031))

(declare-fun m!875627 () Bool)

(assert (=> b!939699 m!875627))

(assert (=> b!939543 d!114067))

(declare-fun d!114069 () Bool)

(assert (=> d!114069 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424102) k0!1099))))

(declare-fun lt!424432 () Unit!31682)

(declare-fun choose!1569 (List!19146 (_ BitVec 64)) Unit!31682)

(assert (=> d!114069 (= lt!424432 (choose!1569 (toList!6048 lt!424102) k0!1099))))

(declare-fun e!527848 () Bool)

(assert (=> d!114069 e!527848))

(declare-fun res!631908 () Bool)

(assert (=> d!114069 (=> (not res!631908) (not e!527848))))

(declare-fun isStrictlySorted!492 (List!19146) Bool)

(assert (=> d!114069 (= res!631908 (isStrictlySorted!492 (toList!6048 lt!424102)))))

(assert (=> d!114069 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424102) k0!1099) lt!424432)))

(declare-fun b!939702 () Bool)

(assert (=> b!939702 (= e!527848 (containsKey!453 (toList!6048 lt!424102) k0!1099))))

(assert (= (and d!114069 res!631908) b!939702))

(assert (=> d!114069 m!875243))

(assert (=> d!114069 m!875243))

(assert (=> d!114069 m!875245))

(declare-fun m!875629 () Bool)

(assert (=> d!114069 m!875629))

(declare-fun m!875631 () Bool)

(assert (=> d!114069 m!875631))

(assert (=> b!939702 m!875239))

(assert (=> b!939492 d!114069))

(assert (=> b!939492 d!114053))

(assert (=> b!939492 d!114055))

(assert (=> d!113983 d!114003))

(declare-fun d!114071 () Bool)

(declare-fun res!631913 () Bool)

(declare-fun e!527853 () Bool)

(assert (=> d!114071 (=> res!631913 e!527853)))

(assert (=> d!114071 (= res!631913 (and ((_ is Cons!19142) (toList!6048 lt!424097)) (= (_1!6694 (h!20294 (toList!6048 lt!424097))) k0!1099)))))

(assert (=> d!114071 (= (containsKey!453 (toList!6048 lt!424097) k0!1099) e!527853)))

(declare-fun b!939707 () Bool)

(declare-fun e!527854 () Bool)

(assert (=> b!939707 (= e!527853 e!527854)))

(declare-fun res!631914 () Bool)

(assert (=> b!939707 (=> (not res!631914) (not e!527854))))

(assert (=> b!939707 (= res!631914 (and (or (not ((_ is Cons!19142) (toList!6048 lt!424097))) (bvsle (_1!6694 (h!20294 (toList!6048 lt!424097))) k0!1099)) ((_ is Cons!19142) (toList!6048 lt!424097)) (bvslt (_1!6694 (h!20294 (toList!6048 lt!424097))) k0!1099)))))

(declare-fun b!939708 () Bool)

(assert (=> b!939708 (= e!527854 (containsKey!453 (t!27437 (toList!6048 lt!424097)) k0!1099))))

(assert (= (and d!114071 (not res!631913)) b!939707))

(assert (= (and b!939707 res!631914) b!939708))

(declare-fun m!875633 () Bool)

(assert (=> b!939708 m!875633))

(assert (=> d!113987 d!114071))

(declare-fun d!114073 () Bool)

(assert (=> d!114073 (= (validKeyInArray!0 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000)) (and (not (= (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939601 d!114073))

(declare-fun lt!424437 () ListLongMap!12065)

(declare-fun b!939709 () Bool)

(declare-fun e!527856 () Bool)

(assert (=> b!939709 (= e!527856 (= lt!424437 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!939710 () Bool)

(declare-fun lt!424433 () Unit!31682)

(declare-fun lt!424435 () Unit!31682)

(assert (=> b!939710 (= lt!424433 lt!424435)))

(declare-fun lt!424439 () (_ BitVec 64))

(declare-fun lt!424438 () (_ BitVec 64))

(declare-fun lt!424436 () V!31983)

(declare-fun lt!424434 () ListLongMap!12065)

(assert (=> b!939710 (not (contains!5120 (+!2856 lt!424434 (tuple2!13367 lt!424438 lt!424436)) lt!424439))))

(assert (=> b!939710 (= lt!424435 (addStillNotContains!223 lt!424434 lt!424438 lt!424436 lt!424439))))

(assert (=> b!939710 (= lt!424439 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!939710 (= lt!424436 (get!14361 (select (arr!27194 _values!1231) from!1844) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!939710 (= lt!424438 (select (arr!27193 _keys!1487) from!1844))))

(declare-fun call!40918 () ListLongMap!12065)

(assert (=> b!939710 (= lt!424434 call!40918)))

(declare-fun e!527859 () ListLongMap!12065)

(assert (=> b!939710 (= e!527859 (+!2856 call!40918 (tuple2!13367 (select (arr!27193 _keys!1487) from!1844) (get!14361 (select (arr!27194 _values!1231) from!1844) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!939711 () Bool)

(declare-fun e!527861 () Bool)

(declare-fun e!527855 () Bool)

(assert (=> b!939711 (= e!527861 e!527855)))

(declare-fun c!98163 () Bool)

(declare-fun e!527857 () Bool)

(assert (=> b!939711 (= c!98163 e!527857)))

(declare-fun res!631915 () Bool)

(assert (=> b!939711 (=> (not res!631915) (not e!527857))))

(assert (=> b!939711 (= res!631915 (bvslt from!1844 (size!27653 _keys!1487)))))

(declare-fun b!939712 () Bool)

(declare-fun res!631917 () Bool)

(assert (=> b!939712 (=> (not res!631917) (not e!527861))))

(assert (=> b!939712 (= res!631917 (not (contains!5120 lt!424437 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!939713 () Bool)

(declare-fun e!527858 () ListLongMap!12065)

(assert (=> b!939713 (= e!527858 e!527859)))

(declare-fun c!98165 () Bool)

(assert (=> b!939713 (= c!98165 (validKeyInArray!0 (select (arr!27193 _keys!1487) from!1844)))))

(declare-fun b!939714 () Bool)

(assert (=> b!939714 (= e!527856 (isEmpty!704 lt!424437))))

(declare-fun d!114075 () Bool)

(assert (=> d!114075 e!527861))

(declare-fun res!631916 () Bool)

(assert (=> d!114075 (=> (not res!631916) (not e!527861))))

(assert (=> d!114075 (= res!631916 (not (contains!5120 lt!424437 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!114075 (= lt!424437 e!527858)))

(declare-fun c!98164 () Bool)

(assert (=> d!114075 (= c!98164 (bvsge from!1844 (size!27653 _keys!1487)))))

(assert (=> d!114075 (validMask!0 mask!1881)))

(assert (=> d!114075 (= (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!424437)))

(declare-fun b!939715 () Bool)

(assert (=> b!939715 (= e!527857 (validKeyInArray!0 (select (arr!27193 _keys!1487) from!1844)))))

(assert (=> b!939715 (bvsge from!1844 #b00000000000000000000000000000000)))

(declare-fun b!939716 () Bool)

(declare-fun e!527860 () Bool)

(assert (=> b!939716 (= e!527855 e!527860)))

(assert (=> b!939716 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27653 _keys!1487)))))

(declare-fun res!631918 () Bool)

(assert (=> b!939716 (= res!631918 (contains!5120 lt!424437 (select (arr!27193 _keys!1487) from!1844)))))

(assert (=> b!939716 (=> (not res!631918) (not e!527860))))

(declare-fun b!939717 () Bool)

(assert (=> b!939717 (= e!527858 (ListLongMap!12066 Nil!19143))))

(declare-fun b!939718 () Bool)

(assert (=> b!939718 (= e!527855 e!527856)))

(declare-fun c!98166 () Bool)

(assert (=> b!939718 (= c!98166 (bvslt from!1844 (size!27653 _keys!1487)))))

(declare-fun bm!40915 () Bool)

(assert (=> bm!40915 (= call!40918 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939719 () Bool)

(assert (=> b!939719 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27653 _keys!1487)))))

(assert (=> b!939719 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27654 _values!1231)))))

(assert (=> b!939719 (= e!527860 (= (apply!865 lt!424437 (select (arr!27193 _keys!1487) from!1844)) (get!14361 (select (arr!27194 _values!1231) from!1844) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939720 () Bool)

(assert (=> b!939720 (= e!527859 call!40918)))

(assert (= (and d!114075 c!98164) b!939717))

(assert (= (and d!114075 (not c!98164)) b!939713))

(assert (= (and b!939713 c!98165) b!939710))

(assert (= (and b!939713 (not c!98165)) b!939720))

(assert (= (or b!939710 b!939720) bm!40915))

(assert (= (and d!114075 res!631916) b!939712))

(assert (= (and b!939712 res!631917) b!939711))

(assert (= (and b!939711 res!631915) b!939715))

(assert (= (and b!939711 c!98163) b!939716))

(assert (= (and b!939711 (not c!98163)) b!939718))

(assert (= (and b!939716 res!631918) b!939719))

(assert (= (and b!939718 c!98166) b!939709))

(assert (= (and b!939718 (not c!98166)) b!939714))

(declare-fun b_lambda!14253 () Bool)

(assert (=> (not b_lambda!14253) (not b!939710)))

(assert (=> b!939710 t!27436))

(declare-fun b_and!29159 () Bool)

(assert (= b_and!29157 (and (=> t!27436 result!12125) b_and!29159)))

(declare-fun b_lambda!14255 () Bool)

(assert (=> (not b_lambda!14255) (not b!939719)))

(assert (=> b!939719 t!27436))

(declare-fun b_and!29161 () Bool)

(assert (= b_and!29159 (and (=> t!27436 result!12125) b_and!29161)))

(assert (=> b!939715 m!875189))

(assert (=> b!939715 m!875189))

(assert (=> b!939715 m!875229))

(declare-fun m!875635 () Bool)

(assert (=> b!939710 m!875635))

(assert (=> b!939710 m!875189))

(assert (=> b!939710 m!875635))

(declare-fun m!875637 () Bool)

(assert (=> b!939710 m!875637))

(declare-fun m!875639 () Bool)

(assert (=> b!939710 m!875639))

(assert (=> b!939710 m!875187))

(assert (=> b!939710 m!875187))

(assert (=> b!939710 m!875007))

(assert (=> b!939710 m!875193))

(declare-fun m!875641 () Bool)

(assert (=> b!939710 m!875641))

(assert (=> b!939710 m!875007))

(declare-fun m!875643 () Bool)

(assert (=> b!939709 m!875643))

(declare-fun m!875645 () Bool)

(assert (=> b!939714 m!875645))

(assert (=> b!939716 m!875189))

(assert (=> b!939716 m!875189))

(declare-fun m!875647 () Bool)

(assert (=> b!939716 m!875647))

(assert (=> b!939713 m!875189))

(assert (=> b!939713 m!875189))

(assert (=> b!939713 m!875229))

(declare-fun m!875649 () Bool)

(assert (=> d!114075 m!875649))

(assert (=> d!114075 m!875045))

(declare-fun m!875651 () Bool)

(assert (=> b!939712 m!875651))

(assert (=> b!939719 m!875189))

(assert (=> b!939719 m!875007))

(assert (=> b!939719 m!875187))

(assert (=> b!939719 m!875189))

(declare-fun m!875653 () Bool)

(assert (=> b!939719 m!875653))

(assert (=> b!939719 m!875187))

(assert (=> b!939719 m!875007))

(assert (=> b!939719 m!875193))

(assert (=> bm!40915 m!875643))

(assert (=> bm!40889 d!114075))

(declare-fun d!114077 () Bool)

(declare-fun e!527863 () Bool)

(assert (=> d!114077 e!527863))

(declare-fun res!631919 () Bool)

(assert (=> d!114077 (=> res!631919 e!527863)))

(declare-fun lt!424441 () Bool)

(assert (=> d!114077 (= res!631919 (not lt!424441))))

(declare-fun lt!424442 () Bool)

(assert (=> d!114077 (= lt!424441 lt!424442)))

(declare-fun lt!424440 () Unit!31682)

(declare-fun e!527862 () Unit!31682)

(assert (=> d!114077 (= lt!424440 e!527862)))

(declare-fun c!98167 () Bool)

(assert (=> d!114077 (= c!98167 lt!424442)))

(assert (=> d!114077 (= lt!424442 (containsKey!453 (toList!6048 lt!424316) (_1!6694 lt!424100)))))

(assert (=> d!114077 (= (contains!5120 lt!424316 (_1!6694 lt!424100)) lt!424441)))

(declare-fun b!939721 () Bool)

(declare-fun lt!424443 () Unit!31682)

(assert (=> b!939721 (= e!527862 lt!424443)))

(assert (=> b!939721 (= lt!424443 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424316) (_1!6694 lt!424100)))))

(assert (=> b!939721 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424316) (_1!6694 lt!424100)))))

(declare-fun b!939722 () Bool)

(declare-fun Unit!31700 () Unit!31682)

(assert (=> b!939722 (= e!527862 Unit!31700)))

(declare-fun b!939723 () Bool)

(assert (=> b!939723 (= e!527863 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424316) (_1!6694 lt!424100))))))

(assert (= (and d!114077 c!98167) b!939721))

(assert (= (and d!114077 (not c!98167)) b!939722))

(assert (= (and d!114077 (not res!631919)) b!939723))

(declare-fun m!875655 () Bool)

(assert (=> d!114077 m!875655))

(declare-fun m!875657 () Bool)

(assert (=> b!939721 m!875657))

(assert (=> b!939721 m!875329))

(assert (=> b!939721 m!875329))

(declare-fun m!875659 () Bool)

(assert (=> b!939721 m!875659))

(assert (=> b!939723 m!875329))

(assert (=> b!939723 m!875329))

(assert (=> b!939723 m!875659))

(assert (=> d!113977 d!114077))

(declare-fun b!939727 () Bool)

(declare-fun e!527865 () Option!488)

(assert (=> b!939727 (= e!527865 None!486)))

(declare-fun b!939726 () Bool)

(assert (=> b!939726 (= e!527865 (getValueByKey!482 (t!27437 lt!424314) (_1!6694 lt!424100)))))

(declare-fun d!114079 () Bool)

(declare-fun c!98168 () Bool)

(assert (=> d!114079 (= c!98168 (and ((_ is Cons!19142) lt!424314) (= (_1!6694 (h!20294 lt!424314)) (_1!6694 lt!424100))))))

(declare-fun e!527864 () Option!488)

(assert (=> d!114079 (= (getValueByKey!482 lt!424314 (_1!6694 lt!424100)) e!527864)))

(declare-fun b!939725 () Bool)

(assert (=> b!939725 (= e!527864 e!527865)))

(declare-fun c!98169 () Bool)

(assert (=> b!939725 (= c!98169 (and ((_ is Cons!19142) lt!424314) (not (= (_1!6694 (h!20294 lt!424314)) (_1!6694 lt!424100)))))))

(declare-fun b!939724 () Bool)

(assert (=> b!939724 (= e!527864 (Some!487 (_2!6694 (h!20294 lt!424314))))))

(assert (= (and d!114079 c!98168) b!939724))

(assert (= (and d!114079 (not c!98168)) b!939725))

(assert (= (and b!939725 c!98169) b!939726))

(assert (= (and b!939725 (not c!98169)) b!939727))

(declare-fun m!875661 () Bool)

(assert (=> b!939726 m!875661))

(assert (=> d!113977 d!114079))

(declare-fun d!114081 () Bool)

(assert (=> d!114081 (= (getValueByKey!482 lt!424314 (_1!6694 lt!424100)) (Some!487 (_2!6694 lt!424100)))))

(declare-fun lt!424446 () Unit!31682)

(declare-fun choose!1570 (List!19146 (_ BitVec 64) V!31983) Unit!31682)

(assert (=> d!114081 (= lt!424446 (choose!1570 lt!424314 (_1!6694 lt!424100) (_2!6694 lt!424100)))))

(declare-fun e!527868 () Bool)

(assert (=> d!114081 e!527868))

(declare-fun res!631924 () Bool)

(assert (=> d!114081 (=> (not res!631924) (not e!527868))))

(assert (=> d!114081 (= res!631924 (isStrictlySorted!492 lt!424314))))

(assert (=> d!114081 (= (lemmaContainsTupThenGetReturnValue!261 lt!424314 (_1!6694 lt!424100) (_2!6694 lt!424100)) lt!424446)))

(declare-fun b!939732 () Bool)

(declare-fun res!631925 () Bool)

(assert (=> b!939732 (=> (not res!631925) (not e!527868))))

(assert (=> b!939732 (= res!631925 (containsKey!453 lt!424314 (_1!6694 lt!424100)))))

(declare-fun b!939733 () Bool)

(assert (=> b!939733 (= e!527868 (contains!5124 lt!424314 (tuple2!13367 (_1!6694 lt!424100) (_2!6694 lt!424100))))))

(assert (= (and d!114081 res!631924) b!939732))

(assert (= (and b!939732 res!631925) b!939733))

(assert (=> d!114081 m!875323))

(declare-fun m!875663 () Bool)

(assert (=> d!114081 m!875663))

(declare-fun m!875665 () Bool)

(assert (=> d!114081 m!875665))

(declare-fun m!875667 () Bool)

(assert (=> b!939732 m!875667))

(declare-fun m!875669 () Bool)

(assert (=> b!939733 m!875669))

(assert (=> d!113977 d!114081))

(declare-fun bm!40922 () Bool)

(declare-fun call!40926 () List!19146)

(declare-fun call!40925 () List!19146)

(assert (=> bm!40922 (= call!40926 call!40925)))

(declare-fun b!939754 () Bool)

(declare-fun e!527880 () List!19146)

(declare-fun call!40927 () List!19146)

(assert (=> b!939754 (= e!527880 call!40927)))

(declare-fun b!939755 () Bool)

(declare-fun e!527879 () List!19146)

(assert (=> b!939755 (= e!527880 e!527879)))

(declare-fun c!98178 () Bool)

(assert (=> b!939755 (= c!98178 (and ((_ is Cons!19142) (toList!6048 lt!424107)) (= (_1!6694 (h!20294 (toList!6048 lt!424107))) (_1!6694 lt!424100))))))

(declare-fun b!939756 () Bool)

(declare-fun e!527882 () List!19146)

(assert (=> b!939756 (= e!527882 call!40926)))

(declare-fun b!939757 () Bool)

(assert (=> b!939757 (= e!527882 call!40926)))

(declare-fun bm!40924 () Bool)

(assert (=> bm!40924 (= call!40925 call!40927)))

(declare-fun b!939758 () Bool)

(declare-fun e!527881 () Bool)

(declare-fun lt!424449 () List!19146)

(assert (=> b!939758 (= e!527881 (contains!5124 lt!424449 (tuple2!13367 (_1!6694 lt!424100) (_2!6694 lt!424100))))))

(declare-fun b!939759 () Bool)

(declare-fun c!98179 () Bool)

(assert (=> b!939759 (= c!98179 (and ((_ is Cons!19142) (toList!6048 lt!424107)) (bvsgt (_1!6694 (h!20294 (toList!6048 lt!424107))) (_1!6694 lt!424100))))))

(assert (=> b!939759 (= e!527879 e!527882)))

(declare-fun b!939760 () Bool)

(declare-fun res!631931 () Bool)

(assert (=> b!939760 (=> (not res!631931) (not e!527881))))

(assert (=> b!939760 (= res!631931 (containsKey!453 lt!424449 (_1!6694 lt!424100)))))

(declare-fun b!939761 () Bool)

(assert (=> b!939761 (= e!527879 call!40925)))

(declare-fun b!939762 () Bool)

(declare-fun e!527883 () List!19146)

(assert (=> b!939762 (= e!527883 (insertStrictlySorted!318 (t!27437 (toList!6048 lt!424107)) (_1!6694 lt!424100) (_2!6694 lt!424100)))))

(declare-fun b!939763 () Bool)

(assert (=> b!939763 (= e!527883 (ite c!98178 (t!27437 (toList!6048 lt!424107)) (ite c!98179 (Cons!19142 (h!20294 (toList!6048 lt!424107)) (t!27437 (toList!6048 lt!424107))) Nil!19143)))))

(declare-fun c!98180 () Bool)

(declare-fun bm!40923 () Bool)

(declare-fun $colon$colon!552 (List!19146 tuple2!13366) List!19146)

(assert (=> bm!40923 (= call!40927 ($colon$colon!552 e!527883 (ite c!98180 (h!20294 (toList!6048 lt!424107)) (tuple2!13367 (_1!6694 lt!424100) (_2!6694 lt!424100)))))))

(declare-fun c!98181 () Bool)

(assert (=> bm!40923 (= c!98181 c!98180)))

(declare-fun d!114083 () Bool)

(assert (=> d!114083 e!527881))

(declare-fun res!631930 () Bool)

(assert (=> d!114083 (=> (not res!631930) (not e!527881))))

(assert (=> d!114083 (= res!631930 (isStrictlySorted!492 lt!424449))))

(assert (=> d!114083 (= lt!424449 e!527880)))

(assert (=> d!114083 (= c!98180 (and ((_ is Cons!19142) (toList!6048 lt!424107)) (bvslt (_1!6694 (h!20294 (toList!6048 lt!424107))) (_1!6694 lt!424100))))))

(assert (=> d!114083 (isStrictlySorted!492 (toList!6048 lt!424107))))

(assert (=> d!114083 (= (insertStrictlySorted!318 (toList!6048 lt!424107) (_1!6694 lt!424100) (_2!6694 lt!424100)) lt!424449)))

(assert (= (and d!114083 c!98180) b!939754))

(assert (= (and d!114083 (not c!98180)) b!939755))

(assert (= (and b!939755 c!98178) b!939761))

(assert (= (and b!939755 (not c!98178)) b!939759))

(assert (= (and b!939759 c!98179) b!939756))

(assert (= (and b!939759 (not c!98179)) b!939757))

(assert (= (or b!939756 b!939757) bm!40922))

(assert (= (or b!939761 bm!40922) bm!40924))

(assert (= (or b!939754 bm!40924) bm!40923))

(assert (= (and bm!40923 c!98181) b!939762))

(assert (= (and bm!40923 (not c!98181)) b!939763))

(assert (= (and d!114083 res!631930) b!939760))

(assert (= (and b!939760 res!631931) b!939758))

(declare-fun m!875671 () Bool)

(assert (=> bm!40923 m!875671))

(declare-fun m!875673 () Bool)

(assert (=> b!939760 m!875673))

(declare-fun m!875675 () Bool)

(assert (=> b!939762 m!875675))

(declare-fun m!875677 () Bool)

(assert (=> d!114083 m!875677))

(declare-fun m!875679 () Bool)

(assert (=> d!114083 m!875679))

(declare-fun m!875681 () Bool)

(assert (=> b!939758 m!875681))

(assert (=> d!113977 d!114083))

(declare-fun d!114085 () Bool)

(assert (=> d!114085 (= (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2856 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114085 true))

(declare-fun _$20!34 () Unit!31682)

(assert (=> d!114085 (= (choose!1565 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) _$20!34)))

(declare-fun b_lambda!14257 () Bool)

(assert (=> (not b_lambda!14257) (not d!114085)))

(assert (=> d!114085 t!27436))

(declare-fun b_and!29163 () Bool)

(assert (= b_and!29161 (and (=> t!27436 result!12125) b_and!29163)))

(assert (=> d!114085 m!875031))

(assert (=> d!114085 m!875007))

(assert (=> d!114085 m!875303))

(assert (=> d!114085 m!875303))

(assert (=> d!114085 m!875305))

(assert (=> d!114085 m!875003))

(assert (=> d!114085 m!874993))

(assert (=> d!114085 m!875003))

(assert (=> d!114085 m!875007))

(assert (=> d!114085 m!875023))

(assert (=> d!113969 d!114085))

(assert (=> d!113969 d!114003))

(declare-fun d!114087 () Bool)

(declare-fun lt!424450 () Bool)

(assert (=> d!114087 (= lt!424450 (select (content!410 Nil!19144) (select (arr!27193 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun e!527885 () Bool)

(assert (=> d!114087 (= lt!424450 e!527885)))

(declare-fun res!631933 () Bool)

(assert (=> d!114087 (=> (not res!631933) (not e!527885))))

(assert (=> d!114087 (= res!631933 ((_ is Cons!19143) Nil!19144))))

(assert (=> d!114087 (= (contains!5123 Nil!19144 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000)) lt!424450)))

(declare-fun b!939764 () Bool)

(declare-fun e!527884 () Bool)

(assert (=> b!939764 (= e!527885 e!527884)))

(declare-fun res!631932 () Bool)

(assert (=> b!939764 (=> res!631932 e!527884)))

(assert (=> b!939764 (= res!631932 (= (h!20295 Nil!19144) (select (arr!27193 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!939765 () Bool)

(assert (=> b!939765 (= e!527884 (contains!5123 (t!27438 Nil!19144) (select (arr!27193 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!114087 res!631933) b!939764))

(assert (= (and b!939764 (not res!631932)) b!939765))

(assert (=> d!114087 m!875623))

(assert (=> d!114087 m!875423))

(declare-fun m!875683 () Bool)

(assert (=> d!114087 m!875683))

(assert (=> b!939765 m!875423))

(declare-fun m!875685 () Bool)

(assert (=> b!939765 m!875685))

(assert (=> b!939605 d!114087))

(declare-fun d!114089 () Bool)

(assert (=> d!114089 (= (apply!865 lt!424259 (select (arr!27193 _keys!1487) from!1844)) (get!14362 (getValueByKey!482 (toList!6048 lt!424259) (select (arr!27193 _keys!1487) from!1844))))))

(declare-fun bs!26379 () Bool)

(assert (= bs!26379 d!114089))

(assert (=> bs!26379 m!875189))

(declare-fun m!875687 () Bool)

(assert (=> bs!26379 m!875687))

(assert (=> bs!26379 m!875687))

(declare-fun m!875689 () Bool)

(assert (=> bs!26379 m!875689))

(assert (=> b!939481 d!114089))

(declare-fun d!114091 () Bool)

(declare-fun c!98182 () Bool)

(assert (=> d!114091 (= c!98182 ((_ is ValueCellFull!9650) (select (arr!27194 _values!1231) from!1844)))))

(declare-fun e!527886 () V!31983)

(assert (=> d!114091 (= (get!14361 (select (arr!27194 _values!1231) from!1844) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527886)))

(declare-fun b!939766 () Bool)

(assert (=> b!939766 (= e!527886 (get!14363 (select (arr!27194 _values!1231) from!1844) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!939767 () Bool)

(assert (=> b!939767 (= e!527886 (get!14364 (select (arr!27194 _values!1231) from!1844) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114091 c!98182) b!939766))

(assert (= (and d!114091 (not c!98182)) b!939767))

(assert (=> b!939766 m!875187))

(assert (=> b!939766 m!875007))

(declare-fun m!875691 () Bool)

(assert (=> b!939766 m!875691))

(assert (=> b!939767 m!875187))

(assert (=> b!939767 m!875007))

(declare-fun m!875693 () Bool)

(assert (=> b!939767 m!875693))

(assert (=> b!939481 d!114091))

(declare-fun b!939768 () Bool)

(declare-fun e!527889 () Bool)

(declare-fun e!527887 () Bool)

(assert (=> b!939768 (= e!527889 e!527887)))

(declare-fun c!98183 () Bool)

(assert (=> b!939768 (= c!98183 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!114093 () Bool)

(declare-fun res!631934 () Bool)

(assert (=> d!114093 (=> res!631934 e!527889)))

(assert (=> d!114093 (= res!631934 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(assert (=> d!114093 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881) e!527889)))

(declare-fun b!939769 () Bool)

(declare-fun e!527888 () Bool)

(declare-fun call!40928 () Bool)

(assert (=> b!939769 (= e!527888 call!40928)))

(declare-fun b!939770 () Bool)

(assert (=> b!939770 (= e!527887 call!40928)))

(declare-fun b!939771 () Bool)

(assert (=> b!939771 (= e!527887 e!527888)))

(declare-fun lt!424453 () (_ BitVec 64))

(assert (=> b!939771 (= lt!424453 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!424451 () Unit!31682)

(assert (=> b!939771 (= lt!424451 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!424453 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!939771 (arrayContainsKey!0 _keys!1487 lt!424453 #b00000000000000000000000000000000)))

(declare-fun lt!424452 () Unit!31682)

(assert (=> b!939771 (= lt!424452 lt!424451)))

(declare-fun res!631935 () Bool)

(assert (=> b!939771 (= res!631935 (= (seekEntryOrOpen!0 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1487 mask!1881) (Found!8936 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!939771 (=> (not res!631935) (not e!527888))))

(declare-fun bm!40925 () Bool)

(assert (=> bm!40925 (= call!40928 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!114093 (not res!631934)) b!939768))

(assert (= (and b!939768 c!98183) b!939771))

(assert (= (and b!939768 (not c!98183)) b!939770))

(assert (= (and b!939771 res!631935) b!939769))

(assert (= (or b!939769 b!939770) bm!40925))

(declare-fun m!875695 () Bool)

(assert (=> b!939768 m!875695))

(assert (=> b!939768 m!875695))

(declare-fun m!875697 () Bool)

(assert (=> b!939768 m!875697))

(assert (=> b!939771 m!875695))

(declare-fun m!875699 () Bool)

(assert (=> b!939771 m!875699))

(declare-fun m!875701 () Bool)

(assert (=> b!939771 m!875701))

(assert (=> b!939771 m!875695))

(declare-fun m!875703 () Bool)

(assert (=> b!939771 m!875703))

(declare-fun m!875705 () Bool)

(assert (=> bm!40925 m!875705))

(assert (=> bm!40910 d!114093))

(declare-fun d!114095 () Bool)

(declare-fun e!527891 () Bool)

(assert (=> d!114095 e!527891))

(declare-fun res!631936 () Bool)

(assert (=> d!114095 (=> res!631936 e!527891)))

(declare-fun lt!424455 () Bool)

(assert (=> d!114095 (= res!631936 (not lt!424455))))

(declare-fun lt!424456 () Bool)

(assert (=> d!114095 (= lt!424455 lt!424456)))

(declare-fun lt!424454 () Unit!31682)

(declare-fun e!527890 () Unit!31682)

(assert (=> d!114095 (= lt!424454 e!527890)))

(declare-fun c!98184 () Bool)

(assert (=> d!114095 (= c!98184 lt!424456)))

(assert (=> d!114095 (= lt!424456 (containsKey!453 (toList!6048 lt!424331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114095 (= (contains!5120 lt!424331 #b0000000000000000000000000000000000000000000000000000000000000000) lt!424455)))

(declare-fun b!939772 () Bool)

(declare-fun lt!424457 () Unit!31682)

(assert (=> b!939772 (= e!527890 lt!424457)))

(assert (=> b!939772 (= lt!424457 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939772 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939773 () Bool)

(declare-fun Unit!31701 () Unit!31682)

(assert (=> b!939773 (= e!527890 Unit!31701)))

(declare-fun b!939774 () Bool)

(assert (=> b!939774 (= e!527891 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424331) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114095 c!98184) b!939772))

(assert (= (and d!114095 (not c!98184)) b!939773))

(assert (= (and d!114095 (not res!631936)) b!939774))

(declare-fun m!875707 () Bool)

(assert (=> d!114095 m!875707))

(declare-fun m!875709 () Bool)

(assert (=> b!939772 m!875709))

(declare-fun m!875711 () Bool)

(assert (=> b!939772 m!875711))

(assert (=> b!939772 m!875711))

(declare-fun m!875713 () Bool)

(assert (=> b!939772 m!875713))

(assert (=> b!939774 m!875711))

(assert (=> b!939774 m!875711))

(assert (=> b!939774 m!875713))

(assert (=> bm!40901 d!114095))

(declare-fun d!114097 () Bool)

(declare-fun e!527892 () Bool)

(assert (=> d!114097 e!527892))

(declare-fun res!631938 () Bool)

(assert (=> d!114097 (=> (not res!631938) (not e!527892))))

(declare-fun lt!424460 () ListLongMap!12065)

(assert (=> d!114097 (= res!631938 (contains!5120 lt!424460 (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!424458 () List!19146)

(assert (=> d!114097 (= lt!424460 (ListLongMap!12066 lt!424458))))

(declare-fun lt!424461 () Unit!31682)

(declare-fun lt!424459 () Unit!31682)

(assert (=> d!114097 (= lt!424461 lt!424459)))

(assert (=> d!114097 (= (getValueByKey!482 lt!424458 (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!114097 (= lt!424459 (lemmaContainsTupThenGetReturnValue!261 lt!424458 (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!114097 (= lt!424458 (insertStrictlySorted!318 (toList!6048 call!40909) (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!114097 (= (+!2856 call!40909 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!424460)))

(declare-fun b!939775 () Bool)

(declare-fun res!631937 () Bool)

(assert (=> b!939775 (=> (not res!631937) (not e!527892))))

(assert (=> b!939775 (= res!631937 (= (getValueByKey!482 (toList!6048 lt!424460) (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!939776 () Bool)

(assert (=> b!939776 (= e!527892 (contains!5124 (toList!6048 lt!424460) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!114097 res!631938) b!939775))

(assert (= (and b!939775 res!631937) b!939776))

(declare-fun m!875715 () Bool)

(assert (=> d!114097 m!875715))

(declare-fun m!875717 () Bool)

(assert (=> d!114097 m!875717))

(declare-fun m!875719 () Bool)

(assert (=> d!114097 m!875719))

(declare-fun m!875721 () Bool)

(assert (=> d!114097 m!875721))

(declare-fun m!875723 () Bool)

(assert (=> b!939775 m!875723))

(declare-fun m!875725 () Bool)

(assert (=> b!939776 m!875725))

(assert (=> b!939572 d!114097))

(declare-fun d!114099 () Bool)

(declare-fun res!631939 () Bool)

(declare-fun e!527893 () Bool)

(assert (=> d!114099 (=> res!631939 e!527893)))

(assert (=> d!114099 (= res!631939 (and ((_ is Cons!19142) (toList!6048 lt!424102)) (= (_1!6694 (h!20294 (toList!6048 lt!424102))) k0!1099)))))

(assert (=> d!114099 (= (containsKey!453 (toList!6048 lt!424102) k0!1099) e!527893)))

(declare-fun b!939777 () Bool)

(declare-fun e!527894 () Bool)

(assert (=> b!939777 (= e!527893 e!527894)))

(declare-fun res!631940 () Bool)

(assert (=> b!939777 (=> (not res!631940) (not e!527894))))

(assert (=> b!939777 (= res!631940 (and (or (not ((_ is Cons!19142) (toList!6048 lt!424102))) (bvsle (_1!6694 (h!20294 (toList!6048 lt!424102))) k0!1099)) ((_ is Cons!19142) (toList!6048 lt!424102)) (bvslt (_1!6694 (h!20294 (toList!6048 lt!424102))) k0!1099)))))

(declare-fun b!939778 () Bool)

(assert (=> b!939778 (= e!527894 (containsKey!453 (t!27437 (toList!6048 lt!424102)) k0!1099))))

(assert (= (and d!114099 (not res!631939)) b!939777))

(assert (= (and b!939777 res!631940) b!939778))

(declare-fun m!875727 () Bool)

(assert (=> b!939778 m!875727))

(assert (=> d!113961 d!114099))

(declare-fun d!114101 () Bool)

(declare-fun e!527895 () Bool)

(assert (=> d!114101 e!527895))

(declare-fun res!631942 () Bool)

(assert (=> d!114101 (=> (not res!631942) (not e!527895))))

(declare-fun lt!424464 () ListLongMap!12065)

(assert (=> d!114101 (= res!631942 (contains!5120 lt!424464 (_1!6694 (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!424462 () List!19146)

(assert (=> d!114101 (= lt!424464 (ListLongMap!12066 lt!424462))))

(declare-fun lt!424465 () Unit!31682)

(declare-fun lt!424463 () Unit!31682)

(assert (=> d!114101 (= lt!424465 lt!424463)))

(assert (=> d!114101 (= (getValueByKey!482 lt!424462 (_1!6694 (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!487 (_2!6694 (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!114101 (= lt!424463 (lemmaContainsTupThenGetReturnValue!261 lt!424462 (_1!6694 (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6694 (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!114101 (= lt!424462 (insertStrictlySorted!318 (toList!6048 (ite c!98118 call!40894 (ite c!98116 call!40898 call!40897))) (_1!6694 (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6694 (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!114101 (= (+!2856 (ite c!98118 call!40894 (ite c!98116 call!40898 call!40897)) (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!424464)))

(declare-fun b!939779 () Bool)

(declare-fun res!631941 () Bool)

(assert (=> b!939779 (=> (not res!631941) (not e!527895))))

(assert (=> b!939779 (= res!631941 (= (getValueByKey!482 (toList!6048 lt!424464) (_1!6694 (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!487 (_2!6694 (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!939780 () Bool)

(assert (=> b!939780 (= e!527895 (contains!5124 (toList!6048 lt!424464) (ite (or c!98118 c!98116) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!114101 res!631942) b!939779))

(assert (= (and b!939779 res!631941) b!939780))

(declare-fun m!875729 () Bool)

(assert (=> d!114101 m!875729))

(declare-fun m!875731 () Bool)

(assert (=> d!114101 m!875731))

(declare-fun m!875733 () Bool)

(assert (=> d!114101 m!875733))

(declare-fun m!875735 () Bool)

(assert (=> d!114101 m!875735))

(declare-fun m!875737 () Bool)

(assert (=> b!939779 m!875737))

(declare-fun m!875739 () Bool)

(assert (=> b!939780 m!875739))

(assert (=> bm!40894 d!114101))

(declare-fun d!114103 () Bool)

(declare-fun e!527897 () Bool)

(assert (=> d!114103 e!527897))

(declare-fun res!631943 () Bool)

(assert (=> d!114103 (=> res!631943 e!527897)))

(declare-fun lt!424467 () Bool)

(assert (=> d!114103 (= res!631943 (not lt!424467))))

(declare-fun lt!424468 () Bool)

(assert (=> d!114103 (= lt!424467 lt!424468)))

(declare-fun lt!424466 () Unit!31682)

(declare-fun e!527896 () Unit!31682)

(assert (=> d!114103 (= lt!424466 e!527896)))

(declare-fun c!98185 () Bool)

(assert (=> d!114103 (= c!98185 lt!424468)))

(assert (=> d!114103 (= lt!424468 (containsKey!453 (toList!6048 lt!424259) (select (arr!27193 _keys!1487) from!1844)))))

(assert (=> d!114103 (= (contains!5120 lt!424259 (select (arr!27193 _keys!1487) from!1844)) lt!424467)))

(declare-fun b!939781 () Bool)

(declare-fun lt!424469 () Unit!31682)

(assert (=> b!939781 (= e!527896 lt!424469)))

(assert (=> b!939781 (= lt!424469 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424259) (select (arr!27193 _keys!1487) from!1844)))))

(assert (=> b!939781 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424259) (select (arr!27193 _keys!1487) from!1844)))))

(declare-fun b!939782 () Bool)

(declare-fun Unit!31702 () Unit!31682)

(assert (=> b!939782 (= e!527896 Unit!31702)))

(declare-fun b!939783 () Bool)

(assert (=> b!939783 (= e!527897 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424259) (select (arr!27193 _keys!1487) from!1844))))))

(assert (= (and d!114103 c!98185) b!939781))

(assert (= (and d!114103 (not c!98185)) b!939782))

(assert (= (and d!114103 (not res!631943)) b!939783))

(assert (=> d!114103 m!875189))

(declare-fun m!875741 () Bool)

(assert (=> d!114103 m!875741))

(assert (=> b!939781 m!875189))

(declare-fun m!875743 () Bool)

(assert (=> b!939781 m!875743))

(assert (=> b!939781 m!875189))

(assert (=> b!939781 m!875687))

(assert (=> b!939781 m!875687))

(declare-fun m!875745 () Bool)

(assert (=> b!939781 m!875745))

(assert (=> b!939783 m!875189))

(assert (=> b!939783 m!875687))

(assert (=> b!939783 m!875687))

(assert (=> b!939783 m!875745))

(assert (=> b!939477 d!114103))

(declare-fun d!114105 () Bool)

(declare-fun e!527899 () Bool)

(assert (=> d!114105 e!527899))

(declare-fun res!631944 () Bool)

(assert (=> d!114105 (=> res!631944 e!527899)))

(declare-fun lt!424471 () Bool)

(assert (=> d!114105 (= res!631944 (not lt!424471))))

(declare-fun lt!424472 () Bool)

(assert (=> d!114105 (= lt!424471 lt!424472)))

(declare-fun lt!424470 () Unit!31682)

(declare-fun e!527898 () Unit!31682)

(assert (=> d!114105 (= lt!424470 e!527898)))

(declare-fun c!98186 () Bool)

(assert (=> d!114105 (= c!98186 lt!424472)))

(assert (=> d!114105 (= lt!424472 (containsKey!453 (toList!6048 lt!424331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114105 (= (contains!5120 lt!424331 #b1000000000000000000000000000000000000000000000000000000000000000) lt!424471)))

(declare-fun b!939784 () Bool)

(declare-fun lt!424473 () Unit!31682)

(assert (=> b!939784 (= e!527898 lt!424473)))

(assert (=> b!939784 (= lt!424473 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939784 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939785 () Bool)

(declare-fun Unit!31703 () Unit!31682)

(assert (=> b!939785 (= e!527898 Unit!31703)))

(declare-fun b!939786 () Bool)

(assert (=> b!939786 (= e!527899 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114105 c!98186) b!939784))

(assert (= (and d!114105 (not c!98186)) b!939785))

(assert (= (and d!114105 (not res!631944)) b!939786))

(declare-fun m!875747 () Bool)

(assert (=> d!114105 m!875747))

(declare-fun m!875749 () Bool)

(assert (=> b!939784 m!875749))

(assert (=> b!939784 m!875607))

(assert (=> b!939784 m!875607))

(declare-fun m!875751 () Bool)

(assert (=> b!939784 m!875751))

(assert (=> b!939786 m!875607))

(assert (=> b!939786 m!875607))

(assert (=> b!939786 m!875751))

(assert (=> bm!40902 d!114105))

(declare-fun d!114107 () Bool)

(assert (=> d!114107 (= (validKeyInArray!0 (select (arr!27193 _keys!1487) from!1844)) (and (not (= (select (arr!27193 _keys!1487) from!1844) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27193 _keys!1487) from!1844) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939474 d!114107))

(declare-fun d!114109 () Bool)

(assert (=> d!114109 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424107) k0!1099))))

(declare-fun lt!424474 () Unit!31682)

(assert (=> d!114109 (= lt!424474 (choose!1569 (toList!6048 lt!424107) k0!1099))))

(declare-fun e!527900 () Bool)

(assert (=> d!114109 e!527900))

(declare-fun res!631945 () Bool)

(assert (=> d!114109 (=> (not res!631945) (not e!527900))))

(assert (=> d!114109 (= res!631945 (isStrictlySorted!492 (toList!6048 lt!424107)))))

(assert (=> d!114109 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424107) k0!1099) lt!424474)))

(declare-fun b!939787 () Bool)

(assert (=> b!939787 (= e!527900 (containsKey!453 (toList!6048 lt!424107) k0!1099))))

(assert (= (and d!114109 res!631945) b!939787))

(assert (=> d!114109 m!875179))

(assert (=> d!114109 m!875179))

(assert (=> d!114109 m!875181))

(declare-fun m!875753 () Bool)

(assert (=> d!114109 m!875753))

(assert (=> d!114109 m!875679))

(assert (=> b!939787 m!875175))

(assert (=> b!939426 d!114109))

(declare-fun d!114111 () Bool)

(assert (=> d!114111 (= (isDefined!355 (getValueByKey!482 (toList!6048 lt!424107) k0!1099)) (not (isEmpty!705 (getValueByKey!482 (toList!6048 lt!424107) k0!1099))))))

(declare-fun bs!26380 () Bool)

(assert (= bs!26380 d!114111))

(assert (=> bs!26380 m!875179))

(declare-fun m!875755 () Bool)

(assert (=> bs!26380 m!875755))

(assert (=> b!939426 d!114111))

(declare-fun b!939791 () Bool)

(declare-fun e!527902 () Option!488)

(assert (=> b!939791 (= e!527902 None!486)))

(declare-fun b!939790 () Bool)

(assert (=> b!939790 (= e!527902 (getValueByKey!482 (t!27437 (toList!6048 lt!424107)) k0!1099))))

(declare-fun d!114113 () Bool)

(declare-fun c!98187 () Bool)

(assert (=> d!114113 (= c!98187 (and ((_ is Cons!19142) (toList!6048 lt!424107)) (= (_1!6694 (h!20294 (toList!6048 lt!424107))) k0!1099)))))

(declare-fun e!527901 () Option!488)

(assert (=> d!114113 (= (getValueByKey!482 (toList!6048 lt!424107) k0!1099) e!527901)))

(declare-fun b!939789 () Bool)

(assert (=> b!939789 (= e!527901 e!527902)))

(declare-fun c!98188 () Bool)

(assert (=> b!939789 (= c!98188 (and ((_ is Cons!19142) (toList!6048 lt!424107)) (not (= (_1!6694 (h!20294 (toList!6048 lt!424107))) k0!1099))))))

(declare-fun b!939788 () Bool)

(assert (=> b!939788 (= e!527901 (Some!487 (_2!6694 (h!20294 (toList!6048 lt!424107)))))))

(assert (= (and d!114113 c!98187) b!939788))

(assert (= (and d!114113 (not c!98187)) b!939789))

(assert (= (and b!939789 c!98188) b!939790))

(assert (= (and b!939789 (not c!98188)) b!939791))

(declare-fun m!875757 () Bool)

(assert (=> b!939790 m!875757))

(assert (=> b!939426 d!114113))

(assert (=> b!939597 d!114073))

(assert (=> b!939428 d!114111))

(assert (=> b!939428 d!114113))

(assert (=> d!113963 d!114003))

(declare-fun d!114115 () Bool)

(assert (=> d!114115 (= (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (and (not (= (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939495 d!114115))

(declare-fun d!114117 () Bool)

(assert (=> d!114117 (= (get!14362 (getValueByKey!482 (toList!6048 lt!424097) k0!1099)) (v!12710 (getValueByKey!482 (toList!6048 lt!424097) k0!1099)))))

(assert (=> d!113981 d!114117))

(declare-fun b!939795 () Bool)

(declare-fun e!527904 () Option!488)

(assert (=> b!939795 (= e!527904 None!486)))

(declare-fun b!939794 () Bool)

(assert (=> b!939794 (= e!527904 (getValueByKey!482 (t!27437 (toList!6048 lt!424097)) k0!1099))))

(declare-fun d!114119 () Bool)

(declare-fun c!98189 () Bool)

(assert (=> d!114119 (= c!98189 (and ((_ is Cons!19142) (toList!6048 lt!424097)) (= (_1!6694 (h!20294 (toList!6048 lt!424097))) k0!1099)))))

(declare-fun e!527903 () Option!488)

(assert (=> d!114119 (= (getValueByKey!482 (toList!6048 lt!424097) k0!1099) e!527903)))

(declare-fun b!939793 () Bool)

(assert (=> b!939793 (= e!527903 e!527904)))

(declare-fun c!98190 () Bool)

(assert (=> b!939793 (= c!98190 (and ((_ is Cons!19142) (toList!6048 lt!424097)) (not (= (_1!6694 (h!20294 (toList!6048 lt!424097))) k0!1099))))))

(declare-fun b!939792 () Bool)

(assert (=> b!939792 (= e!527903 (Some!487 (_2!6694 (h!20294 (toList!6048 lt!424097)))))))

(assert (= (and d!114119 c!98189) b!939792))

(assert (= (and d!114119 (not c!98189)) b!939793))

(assert (= (and b!939793 c!98190) b!939794))

(assert (= (and b!939793 (not c!98190)) b!939795))

(declare-fun m!875759 () Bool)

(assert (=> b!939794 m!875759))

(assert (=> d!113981 d!114119))

(declare-fun e!527906 () Bool)

(declare-fun b!939796 () Bool)

(declare-fun lt!424479 () ListLongMap!12065)

(assert (=> b!939796 (= e!527906 (= lt!424479 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!939797 () Bool)

(declare-fun lt!424475 () Unit!31682)

(declare-fun lt!424477 () Unit!31682)

(assert (=> b!939797 (= lt!424475 lt!424477)))

(declare-fun lt!424481 () (_ BitVec 64))

(declare-fun lt!424476 () ListLongMap!12065)

(declare-fun lt!424478 () V!31983)

(declare-fun lt!424480 () (_ BitVec 64))

(assert (=> b!939797 (not (contains!5120 (+!2856 lt!424476 (tuple2!13367 lt!424480 lt!424478)) lt!424481))))

(assert (=> b!939797 (= lt!424477 (addStillNotContains!223 lt!424476 lt!424480 lt!424478 lt!424481))))

(assert (=> b!939797 (= lt!424481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!939797 (= lt!424478 (get!14361 (select (arr!27194 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!939797 (= lt!424480 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun call!40929 () ListLongMap!12065)

(assert (=> b!939797 (= lt!424476 call!40929)))

(declare-fun e!527909 () ListLongMap!12065)

(assert (=> b!939797 (= e!527909 (+!2856 call!40929 (tuple2!13367 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (get!14361 (select (arr!27194 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!939798 () Bool)

(declare-fun e!527911 () Bool)

(declare-fun e!527905 () Bool)

(assert (=> b!939798 (= e!527911 e!527905)))

(declare-fun c!98191 () Bool)

(declare-fun e!527907 () Bool)

(assert (=> b!939798 (= c!98191 e!527907)))

(declare-fun res!631946 () Bool)

(assert (=> b!939798 (=> (not res!631946) (not e!527907))))

(assert (=> b!939798 (= res!631946 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27653 _keys!1487)))))

(declare-fun b!939799 () Bool)

(declare-fun res!631948 () Bool)

(assert (=> b!939799 (=> (not res!631948) (not e!527911))))

(assert (=> b!939799 (= res!631948 (not (contains!5120 lt!424479 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!939800 () Bool)

(declare-fun e!527908 () ListLongMap!12065)

(assert (=> b!939800 (= e!527908 e!527909)))

(declare-fun c!98193 () Bool)

(assert (=> b!939800 (= c!98193 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!939801 () Bool)

(assert (=> b!939801 (= e!527906 (isEmpty!704 lt!424479))))

(declare-fun d!114121 () Bool)

(assert (=> d!114121 e!527911))

(declare-fun res!631947 () Bool)

(assert (=> d!114121 (=> (not res!631947) (not e!527911))))

(assert (=> d!114121 (= res!631947 (not (contains!5120 lt!424479 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!114121 (= lt!424479 e!527908)))

(declare-fun c!98192 () Bool)

(assert (=> d!114121 (= c!98192 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27653 _keys!1487)))))

(assert (=> d!114121 (validMask!0 mask!1881)))

(assert (=> d!114121 (= (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424479)))

(declare-fun b!939802 () Bool)

(assert (=> b!939802 (= e!527907 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!939802 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(declare-fun b!939803 () Bool)

(declare-fun e!527910 () Bool)

(assert (=> b!939803 (= e!527905 e!527910)))

(assert (=> b!939803 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27653 _keys!1487)))))

(declare-fun res!631949 () Bool)

(assert (=> b!939803 (= res!631949 (contains!5120 lt!424479 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!939803 (=> (not res!631949) (not e!527910))))

(declare-fun b!939804 () Bool)

(assert (=> b!939804 (= e!527908 (ListLongMap!12066 Nil!19143))))

(declare-fun b!939805 () Bool)

(assert (=> b!939805 (= e!527905 e!527906)))

(declare-fun c!98194 () Bool)

(assert (=> b!939805 (= c!98194 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27653 _keys!1487)))))

(declare-fun bm!40926 () Bool)

(assert (=> bm!40926 (= call!40929 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939806 () Bool)

(assert (=> b!939806 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27653 _keys!1487)))))

(assert (=> b!939806 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27654 _values!1231)))))

(assert (=> b!939806 (= e!527910 (= (apply!865 lt!424479 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14361 (select (arr!27194 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939807 () Bool)

(assert (=> b!939807 (= e!527909 call!40929)))

(assert (= (and d!114121 c!98192) b!939804))

(assert (= (and d!114121 (not c!98192)) b!939800))

(assert (= (and b!939800 c!98193) b!939797))

(assert (= (and b!939800 (not c!98193)) b!939807))

(assert (= (or b!939797 b!939807) bm!40926))

(assert (= (and d!114121 res!631947) b!939799))

(assert (= (and b!939799 res!631948) b!939798))

(assert (= (and b!939798 res!631946) b!939802))

(assert (= (and b!939798 c!98191) b!939803))

(assert (= (and b!939798 (not c!98191)) b!939805))

(assert (= (and b!939803 res!631949) b!939806))

(assert (= (and b!939805 c!98194) b!939796))

(assert (= (and b!939805 (not c!98194)) b!939801))

(declare-fun b_lambda!14259 () Bool)

(assert (=> (not b_lambda!14259) (not b!939797)))

(assert (=> b!939797 t!27436))

(declare-fun b_and!29165 () Bool)

(assert (= b_and!29163 (and (=> t!27436 result!12125) b_and!29165)))

(declare-fun b_lambda!14261 () Bool)

(assert (=> (not b_lambda!14261) (not b!939806)))

(assert (=> b!939806 t!27436))

(declare-fun b_and!29167 () Bool)

(assert (= b_and!29165 (and (=> t!27436 result!12125) b_and!29167)))

(assert (=> b!939802 m!875345))

(assert (=> b!939802 m!875345))

(assert (=> b!939802 m!875385))

(declare-fun m!875761 () Bool)

(assert (=> b!939797 m!875761))

(assert (=> b!939797 m!875345))

(assert (=> b!939797 m!875761))

(declare-fun m!875763 () Bool)

(assert (=> b!939797 m!875763))

(declare-fun m!875765 () Bool)

(assert (=> b!939797 m!875765))

(assert (=> b!939797 m!875343))

(assert (=> b!939797 m!875343))

(assert (=> b!939797 m!875007))

(assert (=> b!939797 m!875349))

(declare-fun m!875767 () Bool)

(assert (=> b!939797 m!875767))

(assert (=> b!939797 m!875007))

(declare-fun m!875769 () Bool)

(assert (=> b!939796 m!875769))

(declare-fun m!875771 () Bool)

(assert (=> b!939801 m!875771))

(assert (=> b!939803 m!875345))

(assert (=> b!939803 m!875345))

(declare-fun m!875773 () Bool)

(assert (=> b!939803 m!875773))

(assert (=> b!939800 m!875345))

(assert (=> b!939800 m!875345))

(assert (=> b!939800 m!875385))

(declare-fun m!875775 () Bool)

(assert (=> d!114121 m!875775))

(assert (=> d!114121 m!875045))

(declare-fun m!875777 () Bool)

(assert (=> b!939799 m!875777))

(assert (=> b!939806 m!875345))

(assert (=> b!939806 m!875007))

(assert (=> b!939806 m!875343))

(assert (=> b!939806 m!875345))

(declare-fun m!875779 () Bool)

(assert (=> b!939806 m!875779))

(assert (=> b!939806 m!875343))

(assert (=> b!939806 m!875007))

(assert (=> b!939806 m!875349))

(assert (=> bm!40926 m!875769))

(assert (=> bm!40906 d!114121))

(declare-fun d!114123 () Bool)

(declare-fun lt!424484 () Bool)

(declare-fun content!411 (List!19146) (InoxSet tuple2!13366))

(assert (=> d!114123 (= lt!424484 (select (content!411 (toList!6048 lt!424316)) lt!424100))))

(declare-fun e!527916 () Bool)

(assert (=> d!114123 (= lt!424484 e!527916)))

(declare-fun res!631955 () Bool)

(assert (=> d!114123 (=> (not res!631955) (not e!527916))))

(assert (=> d!114123 (= res!631955 ((_ is Cons!19142) (toList!6048 lt!424316)))))

(assert (=> d!114123 (= (contains!5124 (toList!6048 lt!424316) lt!424100) lt!424484)))

(declare-fun b!939812 () Bool)

(declare-fun e!527917 () Bool)

(assert (=> b!939812 (= e!527916 e!527917)))

(declare-fun res!631954 () Bool)

(assert (=> b!939812 (=> res!631954 e!527917)))

(assert (=> b!939812 (= res!631954 (= (h!20294 (toList!6048 lt!424316)) lt!424100))))

(declare-fun b!939813 () Bool)

(assert (=> b!939813 (= e!527917 (contains!5124 (t!27437 (toList!6048 lt!424316)) lt!424100))))

(assert (= (and d!114123 res!631955) b!939812))

(assert (= (and b!939812 (not res!631954)) b!939813))

(declare-fun m!875781 () Bool)

(assert (=> d!114123 m!875781))

(declare-fun m!875783 () Bool)

(assert (=> d!114123 m!875783))

(declare-fun m!875785 () Bool)

(assert (=> b!939813 m!875785))

(assert (=> b!939550 d!114123))

(declare-fun d!114125 () Bool)

(assert (=> d!114125 (= (get!14362 (getValueByKey!482 (toList!6048 lt!424102) k0!1099)) (v!12710 (getValueByKey!482 (toList!6048 lt!424102) k0!1099)))))

(assert (=> d!113967 d!114125))

(assert (=> d!113967 d!114055))

(assert (=> b!939487 d!114075))

(declare-fun d!114127 () Bool)

(assert (=> d!114127 (= (apply!865 lt!424264 lt!424256) (get!14362 (getValueByKey!482 (toList!6048 lt!424264) lt!424256)))))

(declare-fun bs!26381 () Bool)

(assert (= bs!26381 d!114127))

(declare-fun m!875787 () Bool)

(assert (=> bs!26381 m!875787))

(assert (=> bs!26381 m!875787))

(declare-fun m!875789 () Bool)

(assert (=> bs!26381 m!875789))

(assert (=> b!939487 d!114127))

(declare-fun d!114129 () Bool)

(assert (=> d!114129 (= (apply!865 (+!2856 lt!424270 (tuple2!13367 lt!424260 minValue!1173)) lt!424249) (get!14362 (getValueByKey!482 (toList!6048 (+!2856 lt!424270 (tuple2!13367 lt!424260 minValue!1173))) lt!424249)))))

(declare-fun bs!26382 () Bool)

(assert (= bs!26382 d!114129))

(declare-fun m!875791 () Bool)

(assert (=> bs!26382 m!875791))

(assert (=> bs!26382 m!875791))

(declare-fun m!875793 () Bool)

(assert (=> bs!26382 m!875793))

(assert (=> b!939487 d!114129))

(declare-fun d!114131 () Bool)

(declare-fun e!527918 () Bool)

(assert (=> d!114131 e!527918))

(declare-fun res!631957 () Bool)

(assert (=> d!114131 (=> (not res!631957) (not e!527918))))

(declare-fun lt!424487 () ListLongMap!12065)

(assert (=> d!114131 (= res!631957 (contains!5120 lt!424487 (_1!6694 (tuple2!13367 lt!424265 zeroValue!1173))))))

(declare-fun lt!424485 () List!19146)

(assert (=> d!114131 (= lt!424487 (ListLongMap!12066 lt!424485))))

(declare-fun lt!424488 () Unit!31682)

(declare-fun lt!424486 () Unit!31682)

(assert (=> d!114131 (= lt!424488 lt!424486)))

(assert (=> d!114131 (= (getValueByKey!482 lt!424485 (_1!6694 (tuple2!13367 lt!424265 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424265 zeroValue!1173))))))

(assert (=> d!114131 (= lt!424486 (lemmaContainsTupThenGetReturnValue!261 lt!424485 (_1!6694 (tuple2!13367 lt!424265 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424265 zeroValue!1173))))))

(assert (=> d!114131 (= lt!424485 (insertStrictlySorted!318 (toList!6048 lt!424261) (_1!6694 (tuple2!13367 lt!424265 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424265 zeroValue!1173))))))

(assert (=> d!114131 (= (+!2856 lt!424261 (tuple2!13367 lt!424265 zeroValue!1173)) lt!424487)))

(declare-fun b!939814 () Bool)

(declare-fun res!631956 () Bool)

(assert (=> b!939814 (=> (not res!631956) (not e!527918))))

(assert (=> b!939814 (= res!631956 (= (getValueByKey!482 (toList!6048 lt!424487) (_1!6694 (tuple2!13367 lt!424265 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424265 zeroValue!1173)))))))

(declare-fun b!939815 () Bool)

(assert (=> b!939815 (= e!527918 (contains!5124 (toList!6048 lt!424487) (tuple2!13367 lt!424265 zeroValue!1173)))))

(assert (= (and d!114131 res!631957) b!939814))

(assert (= (and b!939814 res!631956) b!939815))

(declare-fun m!875795 () Bool)

(assert (=> d!114131 m!875795))

(declare-fun m!875797 () Bool)

(assert (=> d!114131 m!875797))

(declare-fun m!875799 () Bool)

(assert (=> d!114131 m!875799))

(declare-fun m!875801 () Bool)

(assert (=> d!114131 m!875801))

(declare-fun m!875803 () Bool)

(assert (=> b!939814 m!875803))

(declare-fun m!875805 () Bool)

(assert (=> b!939815 m!875805))

(assert (=> b!939487 d!114131))

(declare-fun d!114133 () Bool)

(assert (=> d!114133 (= (apply!865 (+!2856 lt!424270 (tuple2!13367 lt!424260 minValue!1173)) lt!424249) (apply!865 lt!424270 lt!424249))))

(declare-fun lt!424489 () Unit!31682)

(assert (=> d!114133 (= lt!424489 (choose!1566 lt!424270 lt!424260 minValue!1173 lt!424249))))

(declare-fun e!527919 () Bool)

(assert (=> d!114133 e!527919))

(declare-fun res!631958 () Bool)

(assert (=> d!114133 (=> (not res!631958) (not e!527919))))

(assert (=> d!114133 (= res!631958 (contains!5120 lt!424270 lt!424249))))

(assert (=> d!114133 (= (addApplyDifferent!440 lt!424270 lt!424260 minValue!1173 lt!424249) lt!424489)))

(declare-fun b!939816 () Bool)

(assert (=> b!939816 (= e!527919 (not (= lt!424249 lt!424260)))))

(assert (= (and d!114133 res!631958) b!939816))

(assert (=> d!114133 m!875213))

(assert (=> d!114133 m!875199))

(declare-fun m!875807 () Bool)

(assert (=> d!114133 m!875807))

(assert (=> d!114133 m!875199))

(assert (=> d!114133 m!875201))

(declare-fun m!875809 () Bool)

(assert (=> d!114133 m!875809))

(assert (=> b!939487 d!114133))

(declare-fun d!114135 () Bool)

(assert (=> d!114135 (contains!5120 (+!2856 lt!424258 (tuple2!13367 lt!424269 zeroValue!1173)) lt!424253)))

(declare-fun lt!424490 () Unit!31682)

(assert (=> d!114135 (= lt!424490 (choose!1567 lt!424258 lt!424269 zeroValue!1173 lt!424253))))

(assert (=> d!114135 (contains!5120 lt!424258 lt!424253)))

(assert (=> d!114135 (= (addStillContains!559 lt!424258 lt!424269 zeroValue!1173 lt!424253) lt!424490)))

(declare-fun bs!26383 () Bool)

(assert (= bs!26383 d!114135))

(assert (=> bs!26383 m!875217))

(assert (=> bs!26383 m!875217))

(assert (=> bs!26383 m!875227))

(declare-fun m!875811 () Bool)

(assert (=> bs!26383 m!875811))

(declare-fun m!875813 () Bool)

(assert (=> bs!26383 m!875813))

(assert (=> b!939487 d!114135))

(declare-fun d!114137 () Bool)

(declare-fun e!527920 () Bool)

(assert (=> d!114137 e!527920))

(declare-fun res!631960 () Bool)

(assert (=> d!114137 (=> (not res!631960) (not e!527920))))

(declare-fun lt!424493 () ListLongMap!12065)

(assert (=> d!114137 (= res!631960 (contains!5120 lt!424493 (_1!6694 (tuple2!13367 lt!424260 minValue!1173))))))

(declare-fun lt!424491 () List!19146)

(assert (=> d!114137 (= lt!424493 (ListLongMap!12066 lt!424491))))

(declare-fun lt!424494 () Unit!31682)

(declare-fun lt!424492 () Unit!31682)

(assert (=> d!114137 (= lt!424494 lt!424492)))

(assert (=> d!114137 (= (getValueByKey!482 lt!424491 (_1!6694 (tuple2!13367 lt!424260 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424260 minValue!1173))))))

(assert (=> d!114137 (= lt!424492 (lemmaContainsTupThenGetReturnValue!261 lt!424491 (_1!6694 (tuple2!13367 lt!424260 minValue!1173)) (_2!6694 (tuple2!13367 lt!424260 minValue!1173))))))

(assert (=> d!114137 (= lt!424491 (insertStrictlySorted!318 (toList!6048 lt!424270) (_1!6694 (tuple2!13367 lt!424260 minValue!1173)) (_2!6694 (tuple2!13367 lt!424260 minValue!1173))))))

(assert (=> d!114137 (= (+!2856 lt!424270 (tuple2!13367 lt!424260 minValue!1173)) lt!424493)))

(declare-fun b!939817 () Bool)

(declare-fun res!631959 () Bool)

(assert (=> b!939817 (=> (not res!631959) (not e!527920))))

(assert (=> b!939817 (= res!631959 (= (getValueByKey!482 (toList!6048 lt!424493) (_1!6694 (tuple2!13367 lt!424260 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424260 minValue!1173)))))))

(declare-fun b!939818 () Bool)

(assert (=> b!939818 (= e!527920 (contains!5124 (toList!6048 lt!424493) (tuple2!13367 lt!424260 minValue!1173)))))

(assert (= (and d!114137 res!631960) b!939817))

(assert (= (and b!939817 res!631959) b!939818))

(declare-fun m!875815 () Bool)

(assert (=> d!114137 m!875815))

(declare-fun m!875817 () Bool)

(assert (=> d!114137 m!875817))

(declare-fun m!875819 () Bool)

(assert (=> d!114137 m!875819))

(declare-fun m!875821 () Bool)

(assert (=> d!114137 m!875821))

(declare-fun m!875823 () Bool)

(assert (=> b!939817 m!875823))

(declare-fun m!875825 () Bool)

(assert (=> b!939818 m!875825))

(assert (=> b!939487 d!114137))

(declare-fun d!114139 () Bool)

(assert (=> d!114139 (= (apply!865 (+!2856 lt!424261 (tuple2!13367 lt!424265 zeroValue!1173)) lt!424251) (get!14362 (getValueByKey!482 (toList!6048 (+!2856 lt!424261 (tuple2!13367 lt!424265 zeroValue!1173))) lt!424251)))))

(declare-fun bs!26384 () Bool)

(assert (= bs!26384 d!114139))

(declare-fun m!875827 () Bool)

(assert (=> bs!26384 m!875827))

(assert (=> bs!26384 m!875827))

(declare-fun m!875829 () Bool)

(assert (=> bs!26384 m!875829))

(assert (=> b!939487 d!114139))

(declare-fun d!114141 () Bool)

(declare-fun e!527921 () Bool)

(assert (=> d!114141 e!527921))

(declare-fun res!631962 () Bool)

(assert (=> d!114141 (=> (not res!631962) (not e!527921))))

(declare-fun lt!424497 () ListLongMap!12065)

(assert (=> d!114141 (= res!631962 (contains!5120 lt!424497 (_1!6694 (tuple2!13367 lt!424269 zeroValue!1173))))))

(declare-fun lt!424495 () List!19146)

(assert (=> d!114141 (= lt!424497 (ListLongMap!12066 lt!424495))))

(declare-fun lt!424498 () Unit!31682)

(declare-fun lt!424496 () Unit!31682)

(assert (=> d!114141 (= lt!424498 lt!424496)))

(assert (=> d!114141 (= (getValueByKey!482 lt!424495 (_1!6694 (tuple2!13367 lt!424269 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424269 zeroValue!1173))))))

(assert (=> d!114141 (= lt!424496 (lemmaContainsTupThenGetReturnValue!261 lt!424495 (_1!6694 (tuple2!13367 lt!424269 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424269 zeroValue!1173))))))

(assert (=> d!114141 (= lt!424495 (insertStrictlySorted!318 (toList!6048 lt!424258) (_1!6694 (tuple2!13367 lt!424269 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424269 zeroValue!1173))))))

(assert (=> d!114141 (= (+!2856 lt!424258 (tuple2!13367 lt!424269 zeroValue!1173)) lt!424497)))

(declare-fun b!939819 () Bool)

(declare-fun res!631961 () Bool)

(assert (=> b!939819 (=> (not res!631961) (not e!527921))))

(assert (=> b!939819 (= res!631961 (= (getValueByKey!482 (toList!6048 lt!424497) (_1!6694 (tuple2!13367 lt!424269 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424269 zeroValue!1173)))))))

(declare-fun b!939820 () Bool)

(assert (=> b!939820 (= e!527921 (contains!5124 (toList!6048 lt!424497) (tuple2!13367 lt!424269 zeroValue!1173)))))

(assert (= (and d!114141 res!631962) b!939819))

(assert (= (and b!939819 res!631961) b!939820))

(declare-fun m!875831 () Bool)

(assert (=> d!114141 m!875831))

(declare-fun m!875833 () Bool)

(assert (=> d!114141 m!875833))

(declare-fun m!875835 () Bool)

(assert (=> d!114141 m!875835))

(declare-fun m!875837 () Bool)

(assert (=> d!114141 m!875837))

(declare-fun m!875839 () Bool)

(assert (=> b!939819 m!875839))

(declare-fun m!875841 () Bool)

(assert (=> b!939820 m!875841))

(assert (=> b!939487 d!114141))

(declare-fun d!114143 () Bool)

(declare-fun e!527923 () Bool)

(assert (=> d!114143 e!527923))

(declare-fun res!631963 () Bool)

(assert (=> d!114143 (=> res!631963 e!527923)))

(declare-fun lt!424500 () Bool)

(assert (=> d!114143 (= res!631963 (not lt!424500))))

(declare-fun lt!424501 () Bool)

(assert (=> d!114143 (= lt!424500 lt!424501)))

(declare-fun lt!424499 () Unit!31682)

(declare-fun e!527922 () Unit!31682)

(assert (=> d!114143 (= lt!424499 e!527922)))

(declare-fun c!98195 () Bool)

(assert (=> d!114143 (= c!98195 lt!424501)))

(assert (=> d!114143 (= lt!424501 (containsKey!453 (toList!6048 (+!2856 lt!424258 (tuple2!13367 lt!424269 zeroValue!1173))) lt!424253))))

(assert (=> d!114143 (= (contains!5120 (+!2856 lt!424258 (tuple2!13367 lt!424269 zeroValue!1173)) lt!424253) lt!424500)))

(declare-fun b!939821 () Bool)

(declare-fun lt!424502 () Unit!31682)

(assert (=> b!939821 (= e!527922 lt!424502)))

(assert (=> b!939821 (= lt!424502 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 (+!2856 lt!424258 (tuple2!13367 lt!424269 zeroValue!1173))) lt!424253))))

(assert (=> b!939821 (isDefined!355 (getValueByKey!482 (toList!6048 (+!2856 lt!424258 (tuple2!13367 lt!424269 zeroValue!1173))) lt!424253))))

(declare-fun b!939822 () Bool)

(declare-fun Unit!31704 () Unit!31682)

(assert (=> b!939822 (= e!527922 Unit!31704)))

(declare-fun b!939823 () Bool)

(assert (=> b!939823 (= e!527923 (isDefined!355 (getValueByKey!482 (toList!6048 (+!2856 lt!424258 (tuple2!13367 lt!424269 zeroValue!1173))) lt!424253)))))

(assert (= (and d!114143 c!98195) b!939821))

(assert (= (and d!114143 (not c!98195)) b!939822))

(assert (= (and d!114143 (not res!631963)) b!939823))

(declare-fun m!875843 () Bool)

(assert (=> d!114143 m!875843))

(declare-fun m!875845 () Bool)

(assert (=> b!939821 m!875845))

(declare-fun m!875847 () Bool)

(assert (=> b!939821 m!875847))

(assert (=> b!939821 m!875847))

(declare-fun m!875849 () Bool)

(assert (=> b!939821 m!875849))

(assert (=> b!939823 m!875847))

(assert (=> b!939823 m!875847))

(assert (=> b!939823 m!875849))

(assert (=> b!939487 d!114143))

(declare-fun d!114145 () Bool)

(assert (=> d!114145 (= (apply!865 (+!2856 lt!424261 (tuple2!13367 lt!424265 zeroValue!1173)) lt!424251) (apply!865 lt!424261 lt!424251))))

(declare-fun lt!424503 () Unit!31682)

(assert (=> d!114145 (= lt!424503 (choose!1566 lt!424261 lt!424265 zeroValue!1173 lt!424251))))

(declare-fun e!527924 () Bool)

(assert (=> d!114145 e!527924))

(declare-fun res!631964 () Bool)

(assert (=> d!114145 (=> (not res!631964) (not e!527924))))

(assert (=> d!114145 (= res!631964 (contains!5120 lt!424261 lt!424251))))

(assert (=> d!114145 (= (addApplyDifferent!440 lt!424261 lt!424265 zeroValue!1173 lt!424251) lt!424503)))

(declare-fun b!939824 () Bool)

(assert (=> b!939824 (= e!527924 (not (= lt!424251 lt!424265)))))

(assert (= (and d!114145 res!631964) b!939824))

(assert (=> d!114145 m!875209))

(assert (=> d!114145 m!875215))

(declare-fun m!875851 () Bool)

(assert (=> d!114145 m!875851))

(assert (=> d!114145 m!875215))

(assert (=> d!114145 m!875221))

(declare-fun m!875853 () Bool)

(assert (=> d!114145 m!875853))

(assert (=> b!939487 d!114145))

(declare-fun d!114147 () Bool)

(assert (=> d!114147 (= (apply!865 (+!2856 lt!424264 (tuple2!13367 lt!424250 minValue!1173)) lt!424256) (apply!865 lt!424264 lt!424256))))

(declare-fun lt!424504 () Unit!31682)

(assert (=> d!114147 (= lt!424504 (choose!1566 lt!424264 lt!424250 minValue!1173 lt!424256))))

(declare-fun e!527925 () Bool)

(assert (=> d!114147 e!527925))

(declare-fun res!631965 () Bool)

(assert (=> d!114147 (=> (not res!631965) (not e!527925))))

(assert (=> d!114147 (= res!631965 (contains!5120 lt!424264 lt!424256))))

(assert (=> d!114147 (= (addApplyDifferent!440 lt!424264 lt!424250 minValue!1173 lt!424256) lt!424504)))

(declare-fun b!939825 () Bool)

(assert (=> b!939825 (= e!527925 (not (= lt!424256 lt!424250)))))

(assert (= (and d!114147 res!631965) b!939825))

(assert (=> d!114147 m!875207))

(assert (=> d!114147 m!875203))

(declare-fun m!875855 () Bool)

(assert (=> d!114147 m!875855))

(assert (=> d!114147 m!875203))

(assert (=> d!114147 m!875205))

(declare-fun m!875857 () Bool)

(assert (=> d!114147 m!875857))

(assert (=> b!939487 d!114147))

(declare-fun d!114149 () Bool)

(declare-fun e!527926 () Bool)

(assert (=> d!114149 e!527926))

(declare-fun res!631967 () Bool)

(assert (=> d!114149 (=> (not res!631967) (not e!527926))))

(declare-fun lt!424507 () ListLongMap!12065)

(assert (=> d!114149 (= res!631967 (contains!5120 lt!424507 (_1!6694 (tuple2!13367 lt!424250 minValue!1173))))))

(declare-fun lt!424505 () List!19146)

(assert (=> d!114149 (= lt!424507 (ListLongMap!12066 lt!424505))))

(declare-fun lt!424508 () Unit!31682)

(declare-fun lt!424506 () Unit!31682)

(assert (=> d!114149 (= lt!424508 lt!424506)))

(assert (=> d!114149 (= (getValueByKey!482 lt!424505 (_1!6694 (tuple2!13367 lt!424250 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424250 minValue!1173))))))

(assert (=> d!114149 (= lt!424506 (lemmaContainsTupThenGetReturnValue!261 lt!424505 (_1!6694 (tuple2!13367 lt!424250 minValue!1173)) (_2!6694 (tuple2!13367 lt!424250 minValue!1173))))))

(assert (=> d!114149 (= lt!424505 (insertStrictlySorted!318 (toList!6048 lt!424264) (_1!6694 (tuple2!13367 lt!424250 minValue!1173)) (_2!6694 (tuple2!13367 lt!424250 minValue!1173))))))

(assert (=> d!114149 (= (+!2856 lt!424264 (tuple2!13367 lt!424250 minValue!1173)) lt!424507)))

(declare-fun b!939826 () Bool)

(declare-fun res!631966 () Bool)

(assert (=> b!939826 (=> (not res!631966) (not e!527926))))

(assert (=> b!939826 (= res!631966 (= (getValueByKey!482 (toList!6048 lt!424507) (_1!6694 (tuple2!13367 lt!424250 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424250 minValue!1173)))))))

(declare-fun b!939827 () Bool)

(assert (=> b!939827 (= e!527926 (contains!5124 (toList!6048 lt!424507) (tuple2!13367 lt!424250 minValue!1173)))))

(assert (= (and d!114149 res!631967) b!939826))

(assert (= (and b!939826 res!631966) b!939827))

(declare-fun m!875859 () Bool)

(assert (=> d!114149 m!875859))

(declare-fun m!875861 () Bool)

(assert (=> d!114149 m!875861))

(declare-fun m!875863 () Bool)

(assert (=> d!114149 m!875863))

(declare-fun m!875865 () Bool)

(assert (=> d!114149 m!875865))

(declare-fun m!875867 () Bool)

(assert (=> b!939826 m!875867))

(declare-fun m!875869 () Bool)

(assert (=> b!939827 m!875869))

(assert (=> b!939487 d!114149))

(declare-fun d!114151 () Bool)

(assert (=> d!114151 (= (apply!865 lt!424270 lt!424249) (get!14362 (getValueByKey!482 (toList!6048 lt!424270) lt!424249)))))

(declare-fun bs!26385 () Bool)

(assert (= bs!26385 d!114151))

(declare-fun m!875871 () Bool)

(assert (=> bs!26385 m!875871))

(assert (=> bs!26385 m!875871))

(declare-fun m!875873 () Bool)

(assert (=> bs!26385 m!875873))

(assert (=> b!939487 d!114151))

(declare-fun d!114153 () Bool)

(assert (=> d!114153 (= (apply!865 lt!424261 lt!424251) (get!14362 (getValueByKey!482 (toList!6048 lt!424261) lt!424251)))))

(declare-fun bs!26386 () Bool)

(assert (= bs!26386 d!114153))

(declare-fun m!875875 () Bool)

(assert (=> bs!26386 m!875875))

(assert (=> bs!26386 m!875875))

(declare-fun m!875877 () Bool)

(assert (=> bs!26386 m!875877))

(assert (=> b!939487 d!114153))

(declare-fun d!114155 () Bool)

(assert (=> d!114155 (= (apply!865 (+!2856 lt!424264 (tuple2!13367 lt!424250 minValue!1173)) lt!424256) (get!14362 (getValueByKey!482 (toList!6048 (+!2856 lt!424264 (tuple2!13367 lt!424250 minValue!1173))) lt!424256)))))

(declare-fun bs!26387 () Bool)

(assert (= bs!26387 d!114155))

(declare-fun m!875879 () Bool)

(assert (=> bs!26387 m!875879))

(assert (=> bs!26387 m!875879))

(declare-fun m!875881 () Bool)

(assert (=> bs!26387 m!875881))

(assert (=> b!939487 d!114155))

(assert (=> b!939471 d!114107))

(declare-fun d!114157 () Bool)

(assert (=> d!114157 (= (get!14364 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939588 d!114157))

(declare-fun d!114159 () Bool)

(declare-fun e!527929 () Bool)

(assert (=> d!114159 e!527929))

(declare-fun c!98198 () Bool)

(assert (=> d!114159 (= c!98198 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!114159 true))

(declare-fun _$29!183 () Unit!31682)

(assert (=> d!114159 (= (choose!1568 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) _$29!183)))

(declare-fun b!939832 () Bool)

(assert (=> b!939832 (= e!527929 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!939833 () Bool)

(assert (=> b!939833 (= e!527929 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!114159 c!98198) b!939832))

(assert (= (and d!114159 (not c!98198)) b!939833))

(assert (=> b!939832 m!875029))

(assert (=> d!113979 d!114159))

(assert (=> d!113979 d!114003))

(declare-fun d!114161 () Bool)

(declare-fun e!527930 () Bool)

(assert (=> d!114161 e!527930))

(declare-fun res!631969 () Bool)

(assert (=> d!114161 (=> (not res!631969) (not e!527930))))

(declare-fun lt!424511 () ListLongMap!12065)

(assert (=> d!114161 (= res!631969 (contains!5120 lt!424511 (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!424509 () List!19146)

(assert (=> d!114161 (= lt!424511 (ListLongMap!12066 lt!424509))))

(declare-fun lt!424512 () Unit!31682)

(declare-fun lt!424510 () Unit!31682)

(assert (=> d!114161 (= lt!424512 lt!424510)))

(assert (=> d!114161 (= (getValueByKey!482 lt!424509 (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!114161 (= lt!424510 (lemmaContainsTupThenGetReturnValue!261 lt!424509 (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!114161 (= lt!424509 (insertStrictlySorted!318 (toList!6048 call!40899) (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!114161 (= (+!2856 call!40899 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!424511)))

(declare-fun b!939834 () Bool)

(declare-fun res!631968 () Bool)

(assert (=> b!939834 (=> (not res!631968) (not e!527930))))

(assert (=> b!939834 (= res!631968 (= (getValueByKey!482 (toList!6048 lt!424511) (_1!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!939835 () Bool)

(assert (=> b!939835 (= e!527930 (contains!5124 (toList!6048 lt!424511) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!114161 res!631969) b!939834))

(assert (= (and b!939834 res!631968) b!939835))

(declare-fun m!875883 () Bool)

(assert (=> d!114161 m!875883))

(declare-fun m!875885 () Bool)

(assert (=> d!114161 m!875885))

(declare-fun m!875887 () Bool)

(assert (=> d!114161 m!875887))

(declare-fun m!875889 () Bool)

(assert (=> d!114161 m!875889))

(declare-fun m!875891 () Bool)

(assert (=> b!939834 m!875891))

(declare-fun m!875893 () Bool)

(assert (=> b!939835 m!875893))

(assert (=> b!939510 d!114161))

(declare-fun d!114163 () Bool)

(declare-fun e!527932 () Bool)

(assert (=> d!114163 e!527932))

(declare-fun res!631970 () Bool)

(assert (=> d!114163 (=> res!631970 e!527932)))

(declare-fun lt!424514 () Bool)

(assert (=> d!114163 (= res!631970 (not lt!424514))))

(declare-fun lt!424515 () Bool)

(assert (=> d!114163 (= lt!424514 lt!424515)))

(declare-fun lt!424513 () Unit!31682)

(declare-fun e!527931 () Unit!31682)

(assert (=> d!114163 (= lt!424513 e!527931)))

(declare-fun c!98199 () Bool)

(assert (=> d!114163 (= c!98199 lt!424515)))

(assert (=> d!114163 (= lt!424515 (containsKey!453 (toList!6048 lt!424285) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114163 (= (contains!5120 lt!424285 #b0000000000000000000000000000000000000000000000000000000000000000) lt!424514)))

(declare-fun b!939836 () Bool)

(declare-fun lt!424516 () Unit!31682)

(assert (=> b!939836 (= e!527931 lt!424516)))

(assert (=> b!939836 (= lt!424516 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424285) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939836 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424285) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939837 () Bool)

(declare-fun Unit!31705 () Unit!31682)

(assert (=> b!939837 (= e!527931 Unit!31705)))

(declare-fun b!939838 () Bool)

(assert (=> b!939838 (= e!527932 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424285) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114163 c!98199) b!939836))

(assert (= (and d!114163 (not c!98199)) b!939837))

(assert (= (and d!114163 (not res!631970)) b!939838))

(declare-fun m!875895 () Bool)

(assert (=> d!114163 m!875895))

(declare-fun m!875897 () Bool)

(assert (=> b!939836 m!875897))

(assert (=> b!939836 m!875583))

(assert (=> b!939836 m!875583))

(declare-fun m!875899 () Bool)

(assert (=> b!939836 m!875899))

(assert (=> b!939838 m!875583))

(assert (=> b!939838 m!875583))

(assert (=> b!939838 m!875899))

(assert (=> bm!40891 d!114163))

(declare-fun d!114165 () Bool)

(declare-fun e!527934 () Bool)

(assert (=> d!114165 e!527934))

(declare-fun res!631971 () Bool)

(assert (=> d!114165 (=> res!631971 e!527934)))

(declare-fun lt!424518 () Bool)

(assert (=> d!114165 (= res!631971 (not lt!424518))))

(declare-fun lt!424519 () Bool)

(assert (=> d!114165 (= lt!424518 lt!424519)))

(declare-fun lt!424517 () Unit!31682)

(declare-fun e!527933 () Unit!31682)

(assert (=> d!114165 (= lt!424517 e!527933)))

(declare-fun c!98200 () Bool)

(assert (=> d!114165 (= c!98200 lt!424519)))

(assert (=> d!114165 (= lt!424519 (containsKey!453 (toList!6048 (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105))) k0!1099))))

(assert (=> d!114165 (= (contains!5120 (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105)) k0!1099) lt!424518)))

(declare-fun b!939839 () Bool)

(declare-fun lt!424520 () Unit!31682)

(assert (=> b!939839 (= e!527933 lt!424520)))

(assert (=> b!939839 (= lt!424520 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105))) k0!1099))))

(assert (=> b!939839 (isDefined!355 (getValueByKey!482 (toList!6048 (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105))) k0!1099))))

(declare-fun b!939840 () Bool)

(declare-fun Unit!31706 () Unit!31682)

(assert (=> b!939840 (= e!527933 Unit!31706)))

(declare-fun b!939841 () Bool)

(assert (=> b!939841 (= e!527934 (isDefined!355 (getValueByKey!482 (toList!6048 (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105))) k0!1099)))))

(assert (= (and d!114165 c!98200) b!939839))

(assert (= (and d!114165 (not c!98200)) b!939840))

(assert (= (and d!114165 (not res!631971)) b!939841))

(declare-fun m!875901 () Bool)

(assert (=> d!114165 m!875901))

(declare-fun m!875903 () Bool)

(assert (=> b!939839 m!875903))

(declare-fun m!875905 () Bool)

(assert (=> b!939839 m!875905))

(assert (=> b!939839 m!875905))

(declare-fun m!875907 () Bool)

(assert (=> b!939839 m!875907))

(assert (=> b!939841 m!875905))

(assert (=> b!939841 m!875905))

(assert (=> b!939841 m!875907))

(assert (=> d!113975 d!114165))

(declare-fun d!114167 () Bool)

(declare-fun e!527935 () Bool)

(assert (=> d!114167 e!527935))

(declare-fun res!631973 () Bool)

(assert (=> d!114167 (=> (not res!631973) (not e!527935))))

(declare-fun lt!424523 () ListLongMap!12065)

(assert (=> d!114167 (= res!631973 (contains!5120 lt!424523 (_1!6694 (tuple2!13367 lt!424101 lt!424105))))))

(declare-fun lt!424521 () List!19146)

(assert (=> d!114167 (= lt!424523 (ListLongMap!12066 lt!424521))))

(declare-fun lt!424524 () Unit!31682)

(declare-fun lt!424522 () Unit!31682)

(assert (=> d!114167 (= lt!424524 lt!424522)))

(assert (=> d!114167 (= (getValueByKey!482 lt!424521 (_1!6694 (tuple2!13367 lt!424101 lt!424105))) (Some!487 (_2!6694 (tuple2!13367 lt!424101 lt!424105))))))

(assert (=> d!114167 (= lt!424522 (lemmaContainsTupThenGetReturnValue!261 lt!424521 (_1!6694 (tuple2!13367 lt!424101 lt!424105)) (_2!6694 (tuple2!13367 lt!424101 lt!424105))))))

(assert (=> d!114167 (= lt!424521 (insertStrictlySorted!318 (toList!6048 lt!424107) (_1!6694 (tuple2!13367 lt!424101 lt!424105)) (_2!6694 (tuple2!13367 lt!424101 lt!424105))))))

(assert (=> d!114167 (= (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105)) lt!424523)))

(declare-fun b!939842 () Bool)

(declare-fun res!631972 () Bool)

(assert (=> b!939842 (=> (not res!631972) (not e!527935))))

(assert (=> b!939842 (= res!631972 (= (getValueByKey!482 (toList!6048 lt!424523) (_1!6694 (tuple2!13367 lt!424101 lt!424105))) (Some!487 (_2!6694 (tuple2!13367 lt!424101 lt!424105)))))))

(declare-fun b!939843 () Bool)

(assert (=> b!939843 (= e!527935 (contains!5124 (toList!6048 lt!424523) (tuple2!13367 lt!424101 lt!424105)))))

(assert (= (and d!114167 res!631973) b!939842))

(assert (= (and b!939842 res!631972) b!939843))

(declare-fun m!875909 () Bool)

(assert (=> d!114167 m!875909))

(declare-fun m!875911 () Bool)

(assert (=> d!114167 m!875911))

(declare-fun m!875913 () Bool)

(assert (=> d!114167 m!875913))

(declare-fun m!875915 () Bool)

(assert (=> d!114167 m!875915))

(declare-fun m!875917 () Bool)

(assert (=> b!939842 m!875917))

(declare-fun m!875919 () Bool)

(assert (=> b!939843 m!875919))

(assert (=> d!113975 d!114167))

(declare-fun d!114169 () Bool)

(assert (=> d!114169 (contains!5120 (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105)) k0!1099)))

(assert (=> d!114169 true))

(declare-fun _$35!435 () Unit!31682)

(assert (=> d!114169 (= (choose!1567 lt!424107 lt!424101 lt!424105 k0!1099) _$35!435)))

(declare-fun bs!26388 () Bool)

(assert (= bs!26388 d!114169))

(assert (=> bs!26388 m!875307))

(assert (=> bs!26388 m!875307))

(assert (=> bs!26388 m!875317))

(assert (=> d!113975 d!114169))

(assert (=> d!113975 d!113955))

(declare-fun b!939845 () Bool)

(declare-fun e!527937 () Bool)

(declare-fun e!527939 () Bool)

(assert (=> b!939845 (= e!527937 e!527939)))

(declare-fun res!631974 () Bool)

(assert (=> b!939845 (=> (not res!631974) (not e!527939))))

(declare-fun e!527938 () Bool)

(assert (=> b!939845 (= res!631974 (not e!527938))))

(declare-fun res!631976 () Bool)

(assert (=> b!939845 (=> (not res!631976) (not e!527938))))

(assert (=> b!939845 (= res!631976 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!939846 () Bool)

(declare-fun e!527936 () Bool)

(declare-fun call!40930 () Bool)

(assert (=> b!939846 (= e!527936 call!40930)))

(declare-fun d!114171 () Bool)

(declare-fun res!631975 () Bool)

(assert (=> d!114171 (=> res!631975 e!527937)))

(assert (=> d!114171 (= res!631975 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(assert (=> d!114171 (= (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98138 (Cons!19143 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) Nil!19144) Nil!19144)) e!527937)))

(declare-fun b!939847 () Bool)

(assert (=> b!939847 (= e!527936 call!40930)))

(declare-fun b!939848 () Bool)

(assert (=> b!939848 (= e!527939 e!527936)))

(declare-fun c!98201 () Bool)

(assert (=> b!939848 (= c!98201 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!939849 () Bool)

(assert (=> b!939849 (= e!527938 (contains!5123 (ite c!98138 (Cons!19143 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) Nil!19144) Nil!19144) (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!40927 () Bool)

(assert (=> bm!40927 (= call!40930 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!98201 (Cons!19143 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!98138 (Cons!19143 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) Nil!19144) Nil!19144)) (ite c!98138 (Cons!19143 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) Nil!19144) Nil!19144))))))

(assert (= (and d!114171 (not res!631975)) b!939845))

(assert (= (and b!939845 res!631976) b!939849))

(assert (= (and b!939845 res!631974) b!939848))

(assert (= (and b!939848 c!98201) b!939846))

(assert (= (and b!939848 (not c!98201)) b!939847))

(assert (= (or b!939846 b!939847) bm!40927))

(assert (=> b!939845 m!875695))

(assert (=> b!939845 m!875695))

(assert (=> b!939845 m!875697))

(assert (=> b!939848 m!875695))

(assert (=> b!939848 m!875695))

(assert (=> b!939848 m!875697))

(assert (=> b!939849 m!875695))

(assert (=> b!939849 m!875695))

(declare-fun m!875921 () Bool)

(assert (=> b!939849 m!875921))

(assert (=> bm!40927 m!875695))

(declare-fun m!875923 () Bool)

(assert (=> bm!40927 m!875923))

(assert (=> bm!40911 d!114171))

(declare-fun d!114173 () Bool)

(declare-fun e!527941 () Bool)

(assert (=> d!114173 e!527941))

(declare-fun res!631977 () Bool)

(assert (=> d!114173 (=> res!631977 e!527941)))

(declare-fun lt!424526 () Bool)

(assert (=> d!114173 (= res!631977 (not lt!424526))))

(declare-fun lt!424527 () Bool)

(assert (=> d!114173 (= lt!424526 lt!424527)))

(declare-fun lt!424525 () Unit!31682)

(declare-fun e!527940 () Unit!31682)

(assert (=> d!114173 (= lt!424525 e!527940)))

(declare-fun c!98202 () Bool)

(assert (=> d!114173 (= c!98202 lt!424527)))

(assert (=> d!114173 (= lt!424527 (containsKey!453 (toList!6048 lt!424331) (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> d!114173 (= (contains!5120 lt!424331 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) lt!424526)))

(declare-fun b!939850 () Bool)

(declare-fun lt!424528 () Unit!31682)

(assert (=> b!939850 (= e!527940 lt!424528)))

(assert (=> b!939850 (= lt!424528 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424331) (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!939850 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424331) (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!939851 () Bool)

(declare-fun Unit!31707 () Unit!31682)

(assert (=> b!939851 (= e!527940 Unit!31707)))

(declare-fun b!939852 () Bool)

(assert (=> b!939852 (= e!527941 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424331) (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(assert (= (and d!114173 c!98202) b!939850))

(assert (= (and d!114173 (not c!98202)) b!939851))

(assert (= (and d!114173 (not res!631977)) b!939852))

(assert (=> d!114173 m!875345))

(declare-fun m!875925 () Bool)

(assert (=> d!114173 m!875925))

(assert (=> b!939850 m!875345))

(declare-fun m!875927 () Bool)

(assert (=> b!939850 m!875927))

(assert (=> b!939850 m!875345))

(assert (=> b!939850 m!875571))

(assert (=> b!939850 m!875571))

(declare-fun m!875929 () Bool)

(assert (=> b!939850 m!875929))

(assert (=> b!939852 m!875345))

(assert (=> b!939852 m!875571))

(assert (=> b!939852 m!875571))

(assert (=> b!939852 m!875929))

(assert (=> b!939563 d!114173))

(declare-fun d!114175 () Bool)

(assert (=> d!114175 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424097) k0!1099))))

(declare-fun lt!424529 () Unit!31682)

(assert (=> d!114175 (= lt!424529 (choose!1569 (toList!6048 lt!424097) k0!1099))))

(declare-fun e!527942 () Bool)

(assert (=> d!114175 e!527942))

(declare-fun res!631978 () Bool)

(assert (=> d!114175 (=> (not res!631978) (not e!527942))))

(assert (=> d!114175 (= res!631978 (isStrictlySorted!492 (toList!6048 lt!424097)))))

(assert (=> d!114175 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424097) k0!1099) lt!424529)))

(declare-fun b!939853 () Bool)

(assert (=> b!939853 (= e!527942 (containsKey!453 (toList!6048 lt!424097) k0!1099))))

(assert (= (and d!114175 res!631978) b!939853))

(assert (=> d!114175 m!875335))

(assert (=> d!114175 m!875335))

(assert (=> d!114175 m!875411))

(declare-fun m!875931 () Bool)

(assert (=> d!114175 m!875931))

(declare-fun m!875933 () Bool)

(assert (=> d!114175 m!875933))

(assert (=> b!939853 m!875407))

(assert (=> b!939580 d!114175))

(declare-fun d!114177 () Bool)

(assert (=> d!114177 (= (isDefined!355 (getValueByKey!482 (toList!6048 lt!424097) k0!1099)) (not (isEmpty!705 (getValueByKey!482 (toList!6048 lt!424097) k0!1099))))))

(declare-fun bs!26389 () Bool)

(assert (= bs!26389 d!114177))

(assert (=> bs!26389 m!875335))

(declare-fun m!875935 () Bool)

(assert (=> bs!26389 m!875935))

(assert (=> b!939580 d!114177))

(assert (=> b!939580 d!114119))

(assert (=> bm!40896 d!114017))

(declare-fun d!114179 () Bool)

(declare-fun lt!424530 () Bool)

(assert (=> d!114179 (= lt!424530 (select (content!411 (toList!6048 lt!424345)) lt!424100))))

(declare-fun e!527943 () Bool)

(assert (=> d!114179 (= lt!424530 e!527943)))

(declare-fun res!631980 () Bool)

(assert (=> d!114179 (=> (not res!631980) (not e!527943))))

(assert (=> d!114179 (= res!631980 ((_ is Cons!19142) (toList!6048 lt!424345)))))

(assert (=> d!114179 (= (contains!5124 (toList!6048 lt!424345) lt!424100) lt!424530)))

(declare-fun b!939854 () Bool)

(declare-fun e!527944 () Bool)

(assert (=> b!939854 (= e!527943 e!527944)))

(declare-fun res!631979 () Bool)

(assert (=> b!939854 (=> res!631979 e!527944)))

(assert (=> b!939854 (= res!631979 (= (h!20294 (toList!6048 lt!424345)) lt!424100))))

(declare-fun b!939855 () Bool)

(assert (=> b!939855 (= e!527944 (contains!5124 (t!27437 (toList!6048 lt!424345)) lt!424100))))

(assert (= (and d!114179 res!631980) b!939854))

(assert (= (and b!939854 (not res!631979)) b!939855))

(declare-fun m!875937 () Bool)

(assert (=> d!114179 m!875937))

(declare-fun m!875939 () Bool)

(assert (=> d!114179 m!875939))

(declare-fun m!875941 () Bool)

(assert (=> b!939855 m!875941))

(assert (=> b!939579 d!114179))

(declare-fun d!114181 () Bool)

(assert (=> d!114181 (= (apply!865 lt!424285 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14362 (getValueByKey!482 (toList!6048 lt!424285) (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bs!26390 () Bool)

(assert (= bs!26390 d!114181))

(assert (=> bs!26390 m!875031))

(declare-fun m!875943 () Bool)

(assert (=> bs!26390 m!875943))

(assert (=> bs!26390 m!875943))

(declare-fun m!875945 () Bool)

(assert (=> bs!26390 m!875945))

(assert (=> b!939505 d!114181))

(assert (=> b!939505 d!113991))

(declare-fun d!114183 () Bool)

(assert (=> d!114183 (= (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (and (not (= (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27193 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939560 d!114183))

(declare-fun b!939856 () Bool)

(declare-fun e!527946 () Bool)

(declare-fun e!527948 () Bool)

(assert (=> b!939856 (= e!527946 e!527948)))

(declare-fun res!631981 () Bool)

(assert (=> b!939856 (=> (not res!631981) (not e!527948))))

(declare-fun e!527947 () Bool)

(assert (=> b!939856 (= res!631981 (not e!527947))))

(declare-fun res!631983 () Bool)

(assert (=> b!939856 (=> (not res!631983) (not e!527947))))

(assert (=> b!939856 (= res!631983 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!939857 () Bool)

(declare-fun e!527945 () Bool)

(declare-fun call!40931 () Bool)

(assert (=> b!939857 (= e!527945 call!40931)))

(declare-fun d!114185 () Bool)

(declare-fun res!631982 () Bool)

(assert (=> d!114185 (=> res!631982 e!527946)))

(assert (=> d!114185 (= res!631982 (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(assert (=> d!114185 (= (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!98121 (Cons!19143 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19144) Nil!19144)) e!527946)))

(declare-fun b!939858 () Bool)

(assert (=> b!939858 (= e!527945 call!40931)))

(declare-fun b!939859 () Bool)

(assert (=> b!939859 (= e!527948 e!527945)))

(declare-fun c!98203 () Bool)

(assert (=> b!939859 (= c!98203 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!939860 () Bool)

(assert (=> b!939860 (= e!527947 (contains!5123 (ite c!98121 (Cons!19143 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19144) Nil!19144) (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun bm!40928 () Bool)

(assert (=> bm!40928 (= call!40931 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!98203 (Cons!19143 (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (ite c!98121 (Cons!19143 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19144) Nil!19144)) (ite c!98121 (Cons!19143 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19144) Nil!19144))))))

(assert (= (and d!114185 (not res!631982)) b!939856))

(assert (= (and b!939856 res!631983) b!939860))

(assert (= (and b!939856 res!631981) b!939859))

(assert (= (and b!939859 c!98203) b!939857))

(assert (= (and b!939859 (not c!98203)) b!939858))

(assert (= (or b!939857 b!939858) bm!40928))

(declare-fun m!875947 () Bool)

(assert (=> b!939856 m!875947))

(assert (=> b!939856 m!875947))

(declare-fun m!875949 () Bool)

(assert (=> b!939856 m!875949))

(assert (=> b!939859 m!875947))

(assert (=> b!939859 m!875947))

(assert (=> b!939859 m!875949))

(assert (=> b!939860 m!875947))

(assert (=> b!939860 m!875947))

(declare-fun m!875951 () Bool)

(assert (=> b!939860 m!875951))

(assert (=> bm!40928 m!875947))

(declare-fun m!875953 () Bool)

(assert (=> bm!40928 m!875953))

(assert (=> bm!40900 d!114185))

(declare-fun d!114187 () Bool)

(assert (=> d!114187 (= (apply!865 lt!424259 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14362 (getValueByKey!482 (toList!6048 lt!424259) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26391 () Bool)

(assert (= bs!26391 d!114187))

(assert (=> bs!26391 m!875603))

(assert (=> bs!26391 m!875603))

(declare-fun m!875955 () Bool)

(assert (=> bs!26391 m!875955))

(assert (=> b!939484 d!114187))

(assert (=> d!113957 d!114003))

(declare-fun d!114189 () Bool)

(assert (=> d!114189 (= (get!14362 (getValueByKey!482 (toList!6048 lt!424107) k0!1099)) (v!12710 (getValueByKey!482 (toList!6048 lt!424107) k0!1099)))))

(assert (=> d!113995 d!114189))

(assert (=> d!113995 d!114113))

(assert (=> b!939524 d!113963))

(declare-fun d!114191 () Bool)

(declare-fun e!527949 () Bool)

(assert (=> d!114191 e!527949))

(declare-fun res!631985 () Bool)

(assert (=> d!114191 (=> (not res!631985) (not e!527949))))

(declare-fun lt!424533 () ListLongMap!12065)

(assert (=> d!114191 (= res!631985 (contains!5120 lt!424533 (_1!6694 (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!424531 () List!19146)

(assert (=> d!114191 (= lt!424533 (ListLongMap!12066 lt!424531))))

(declare-fun lt!424534 () Unit!31682)

(declare-fun lt!424532 () Unit!31682)

(assert (=> d!114191 (= lt!424534 lt!424532)))

(assert (=> d!114191 (= (getValueByKey!482 lt!424531 (_1!6694 (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!487 (_2!6694 (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!114191 (= lt!424532 (lemmaContainsTupThenGetReturnValue!261 lt!424531 (_1!6694 (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6694 (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!114191 (= lt!424531 (insertStrictlySorted!318 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)) (_1!6694 (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6694 (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!114191 (= (+!2856 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!424533)))

(declare-fun b!939861 () Bool)

(declare-fun res!631984 () Bool)

(assert (=> b!939861 (=> (not res!631984) (not e!527949))))

(assert (=> b!939861 (= res!631984 (= (getValueByKey!482 (toList!6048 lt!424533) (_1!6694 (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!487 (_2!6694 (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!939862 () Bool)

(assert (=> b!939862 (= e!527949 (contains!5124 (toList!6048 lt!424533) (tuple2!13367 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14361 (select (arr!27194 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!114191 res!631985) b!939861))

(assert (= (and b!939861 res!631984) b!939862))

(declare-fun m!875957 () Bool)

(assert (=> d!114191 m!875957))

(declare-fun m!875959 () Bool)

(assert (=> d!114191 m!875959))

(declare-fun m!875961 () Bool)

(assert (=> d!114191 m!875961))

(declare-fun m!875963 () Bool)

(assert (=> d!114191 m!875963))

(declare-fun m!875965 () Bool)

(assert (=> b!939861 m!875965))

(declare-fun m!875967 () Bool)

(assert (=> b!939862 m!875967))

(assert (=> b!939524 d!114191))

(declare-fun bm!40929 () Bool)

(declare-fun call!40938 () Bool)

(declare-fun lt!424545 () ListLongMap!12065)

(assert (=> bm!40929 (= call!40938 (contains!5120 lt!424545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939863 () Bool)

(declare-fun e!527950 () Bool)

(assert (=> b!939863 (= e!527950 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!939864 () Bool)

(declare-fun e!527954 () Bool)

(declare-fun e!527956 () Bool)

(assert (=> b!939864 (= e!527954 e!527956)))

(declare-fun c!98208 () Bool)

(assert (=> b!939864 (= c!98208 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!939865 () Bool)

(declare-fun e!527962 () Bool)

(assert (=> b!939865 (= e!527962 (not call!40938))))

(declare-fun bm!40931 () Bool)

(declare-fun call!40934 () ListLongMap!12065)

(declare-fun call!40937 () ListLongMap!12065)

(assert (=> bm!40931 (= call!40934 call!40937)))

(declare-fun b!939866 () Bool)

(declare-fun e!527951 () Bool)

(assert (=> b!939866 (= e!527951 (validKeyInArray!0 (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun bm!40932 () Bool)

(declare-fun call!40932 () ListLongMap!12065)

(declare-fun call!40935 () ListLongMap!12065)

(declare-fun c!98209 () Bool)

(declare-fun c!98207 () Bool)

(declare-fun call!40936 () ListLongMap!12065)

(assert (=> bm!40932 (= call!40937 (+!2856 (ite c!98209 call!40932 (ite c!98207 call!40936 call!40935)) (ite (or c!98209 c!98207) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!939867 () Bool)

(declare-fun call!40933 () Bool)

(assert (=> b!939867 (= e!527956 (not call!40933))))

(declare-fun b!939868 () Bool)

(declare-fun e!527953 () Bool)

(assert (=> b!939868 (= e!527956 e!527953)))

(declare-fun res!631994 () Bool)

(assert (=> b!939868 (= res!631994 call!40933)))

(assert (=> b!939868 (=> (not res!631994) (not e!527953))))

(declare-fun b!939869 () Bool)

(declare-fun e!527957 () Bool)

(declare-fun e!527958 () Bool)

(assert (=> b!939869 (= e!527957 e!527958)))

(declare-fun res!631989 () Bool)

(assert (=> b!939869 (=> (not res!631989) (not e!527958))))

(assert (=> b!939869 (= res!631989 (contains!5120 lt!424545 (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(assert (=> b!939869 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun b!939870 () Bool)

(declare-fun e!527955 () ListLongMap!12065)

(assert (=> b!939870 (= e!527955 call!40934)))

(declare-fun b!939871 () Bool)

(declare-fun e!527960 () Bool)

(assert (=> b!939871 (= e!527962 e!527960)))

(declare-fun res!631987 () Bool)

(assert (=> b!939871 (= res!631987 call!40938)))

(assert (=> b!939871 (=> (not res!631987) (not e!527960))))

(declare-fun b!939872 () Bool)

(assert (=> b!939872 (= e!527953 (= (apply!865 lt!424545 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40933 () Bool)

(assert (=> bm!40933 (= call!40936 call!40932)))

(declare-fun d!114193 () Bool)

(assert (=> d!114193 e!527954))

(declare-fun res!631988 () Bool)

(assert (=> d!114193 (=> (not res!631988) (not e!527954))))

(assert (=> d!114193 (= res!631988 (or (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27653 _keys!1487)) (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27653 _keys!1487)))))))

(declare-fun lt!424549 () ListLongMap!12065)

(assert (=> d!114193 (= lt!424545 lt!424549)))

(declare-fun lt!424548 () Unit!31682)

(declare-fun e!527961 () Unit!31682)

(assert (=> d!114193 (= lt!424548 e!527961)))

(declare-fun c!98206 () Bool)

(assert (=> d!114193 (= c!98206 e!527950)))

(declare-fun res!631990 () Bool)

(assert (=> d!114193 (=> (not res!631990) (not e!527950))))

(assert (=> d!114193 (= res!631990 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun e!527959 () ListLongMap!12065)

(assert (=> d!114193 (= lt!424549 e!527959)))

(assert (=> d!114193 (= c!98209 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114193 (validMask!0 mask!1881)))

(assert (=> d!114193 (= (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) lt!424545)))

(declare-fun bm!40930 () Bool)

(assert (=> bm!40930 (= call!40933 (contains!5120 lt!424545 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939873 () Bool)

(assert (=> b!939873 (= e!527958 (= (apply!865 lt!424545 (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) (get!14361 (select (arr!27194 _values!1231) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (dynLambda!1653 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939873 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27654 _values!1231)))))

(assert (=> b!939873 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun b!939874 () Bool)

(assert (=> b!939874 (= e!527955 call!40935)))

(declare-fun b!939875 () Bool)

(declare-fun c!98205 () Bool)

(assert (=> b!939875 (= c!98205 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!527952 () ListLongMap!12065)

(assert (=> b!939875 (= e!527952 e!527955)))

(declare-fun b!939876 () Bool)

(assert (=> b!939876 (= e!527960 (= (apply!865 lt!424545 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40934 () Bool)

(assert (=> bm!40934 (= call!40932 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939877 () Bool)

(assert (=> b!939877 (= e!527952 call!40934)))

(declare-fun b!939878 () Bool)

(assert (=> b!939878 (= e!527959 (+!2856 call!40937 (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!939879 () Bool)

(declare-fun lt!424554 () Unit!31682)

(assert (=> b!939879 (= e!527961 lt!424554)))

(declare-fun lt!424544 () ListLongMap!12065)

(assert (=> b!939879 (= lt!424544 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424555 () (_ BitVec 64))

(assert (=> b!939879 (= lt!424555 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424539 () (_ BitVec 64))

(assert (=> b!939879 (= lt!424539 (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!424552 () Unit!31682)

(assert (=> b!939879 (= lt!424552 (addStillContains!559 lt!424544 lt!424555 zeroValue!1173 lt!424539))))

(assert (=> b!939879 (contains!5120 (+!2856 lt!424544 (tuple2!13367 lt!424555 zeroValue!1173)) lt!424539)))

(declare-fun lt!424540 () Unit!31682)

(assert (=> b!939879 (= lt!424540 lt!424552)))

(declare-fun lt!424556 () ListLongMap!12065)

(assert (=> b!939879 (= lt!424556 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424546 () (_ BitVec 64))

(assert (=> b!939879 (= lt!424546 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424535 () (_ BitVec 64))

(assert (=> b!939879 (= lt!424535 (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!424541 () Unit!31682)

(assert (=> b!939879 (= lt!424541 (addApplyDifferent!440 lt!424556 lt!424546 minValue!1173 lt!424535))))

(assert (=> b!939879 (= (apply!865 (+!2856 lt!424556 (tuple2!13367 lt!424546 minValue!1173)) lt!424535) (apply!865 lt!424556 lt!424535))))

(declare-fun lt!424543 () Unit!31682)

(assert (=> b!939879 (= lt!424543 lt!424541)))

(declare-fun lt!424547 () ListLongMap!12065)

(assert (=> b!939879 (= lt!424547 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424551 () (_ BitVec 64))

(assert (=> b!939879 (= lt!424551 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424537 () (_ BitVec 64))

(assert (=> b!939879 (= lt!424537 (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!424553 () Unit!31682)

(assert (=> b!939879 (= lt!424553 (addApplyDifferent!440 lt!424547 lt!424551 zeroValue!1173 lt!424537))))

(assert (=> b!939879 (= (apply!865 (+!2856 lt!424547 (tuple2!13367 lt!424551 zeroValue!1173)) lt!424537) (apply!865 lt!424547 lt!424537))))

(declare-fun lt!424538 () Unit!31682)

(assert (=> b!939879 (= lt!424538 lt!424553)))

(declare-fun lt!424550 () ListLongMap!12065)

(assert (=> b!939879 (= lt!424550 (getCurrentListMapNoExtraKeys!3348 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424536 () (_ BitVec 64))

(assert (=> b!939879 (= lt!424536 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424542 () (_ BitVec 64))

(assert (=> b!939879 (= lt!424542 (select (arr!27193 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (=> b!939879 (= lt!424554 (addApplyDifferent!440 lt!424550 lt!424536 minValue!1173 lt!424542))))

(assert (=> b!939879 (= (apply!865 (+!2856 lt!424550 (tuple2!13367 lt!424536 minValue!1173)) lt!424542) (apply!865 lt!424550 lt!424542))))

(declare-fun b!939880 () Bool)

(declare-fun res!631986 () Bool)

(assert (=> b!939880 (=> (not res!631986) (not e!527954))))

(assert (=> b!939880 (= res!631986 e!527962)))

(declare-fun c!98204 () Bool)

(assert (=> b!939880 (= c!98204 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40935 () Bool)

(assert (=> bm!40935 (= call!40935 call!40936)))

(declare-fun b!939881 () Bool)

(declare-fun Unit!31708 () Unit!31682)

(assert (=> b!939881 (= e!527961 Unit!31708)))

(declare-fun b!939882 () Bool)

(assert (=> b!939882 (= e!527959 e!527952)))

(assert (=> b!939882 (= c!98207 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!939883 () Bool)

(declare-fun res!631993 () Bool)

(assert (=> b!939883 (=> (not res!631993) (not e!527954))))

(assert (=> b!939883 (= res!631993 e!527957)))

(declare-fun res!631991 () Bool)

(assert (=> b!939883 (=> res!631991 e!527957)))

(assert (=> b!939883 (= res!631991 (not e!527951))))

(declare-fun res!631992 () Bool)

(assert (=> b!939883 (=> (not res!631992) (not e!527951))))

(assert (=> b!939883 (= res!631992 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(assert (= (and d!114193 c!98209) b!939878))

(assert (= (and d!114193 (not c!98209)) b!939882))

(assert (= (and b!939882 c!98207) b!939877))

(assert (= (and b!939882 (not c!98207)) b!939875))

(assert (= (and b!939875 c!98205) b!939870))

(assert (= (and b!939875 (not c!98205)) b!939874))

(assert (= (or b!939870 b!939874) bm!40935))

(assert (= (or b!939877 bm!40935) bm!40933))

(assert (= (or b!939877 b!939870) bm!40931))

(assert (= (or b!939878 bm!40933) bm!40934))

(assert (= (or b!939878 bm!40931) bm!40932))

(assert (= (and d!114193 res!631990) b!939863))

(assert (= (and d!114193 c!98206) b!939879))

(assert (= (and d!114193 (not c!98206)) b!939881))

(assert (= (and d!114193 res!631988) b!939883))

(assert (= (and b!939883 res!631992) b!939866))

(assert (= (and b!939883 (not res!631991)) b!939869))

(assert (= (and b!939869 res!631989) b!939873))

(assert (= (and b!939883 res!631993) b!939880))

(assert (= (and b!939880 c!98204) b!939871))

(assert (= (and b!939880 (not c!98204)) b!939865))

(assert (= (and b!939871 res!631987) b!939876))

(assert (= (or b!939871 b!939865) bm!40929))

(assert (= (and b!939880 res!631986) b!939864))

(assert (= (and b!939864 c!98208) b!939868))

(assert (= (and b!939864 (not c!98208)) b!939867))

(assert (= (and b!939868 res!631994) b!939872))

(assert (= (or b!939868 b!939867) bm!40930))

(declare-fun b_lambda!14263 () Bool)

(assert (=> (not b_lambda!14263) (not b!939873)))

(assert (=> b!939873 t!27436))

(declare-fun b_and!29169 () Bool)

(assert (= b_and!29167 (and (=> t!27436 result!12125) b_and!29169)))

(declare-fun m!875969 () Bool)

(assert (=> bm!40932 m!875969))

(declare-fun m!875971 () Bool)

(assert (=> b!939878 m!875971))

(declare-fun m!875973 () Bool)

(assert (=> b!939873 m!875973))

(assert (=> b!939873 m!875947))

(declare-fun m!875975 () Bool)

(assert (=> b!939873 m!875975))

(assert (=> b!939873 m!875947))

(assert (=> b!939873 m!875973))

(assert (=> b!939873 m!875007))

(declare-fun m!875977 () Bool)

(assert (=> b!939873 m!875977))

(assert (=> b!939873 m!875007))

(declare-fun m!875979 () Bool)

(assert (=> bm!40930 m!875979))

(assert (=> d!114193 m!875045))

(assert (=> b!939879 m!875463))

(declare-fun m!875981 () Bool)

(assert (=> b!939879 m!875981))

(declare-fun m!875983 () Bool)

(assert (=> b!939879 m!875983))

(declare-fun m!875985 () Bool)

(assert (=> b!939879 m!875985))

(declare-fun m!875987 () Bool)

(assert (=> b!939879 m!875987))

(declare-fun m!875989 () Bool)

(assert (=> b!939879 m!875989))

(declare-fun m!875991 () Bool)

(assert (=> b!939879 m!875991))

(declare-fun m!875993 () Bool)

(assert (=> b!939879 m!875993))

(assert (=> b!939879 m!875985))

(assert (=> b!939879 m!875947))

(declare-fun m!875995 () Bool)

(assert (=> b!939879 m!875995))

(declare-fun m!875997 () Bool)

(assert (=> b!939879 m!875997))

(declare-fun m!875999 () Bool)

(assert (=> b!939879 m!875999))

(declare-fun m!876001 () Bool)

(assert (=> b!939879 m!876001))

(assert (=> b!939879 m!875997))

(declare-fun m!876003 () Bool)

(assert (=> b!939879 m!876003))

(declare-fun m!876005 () Bool)

(assert (=> b!939879 m!876005))

(declare-fun m!876007 () Bool)

(assert (=> b!939879 m!876007))

(assert (=> b!939879 m!875999))

(declare-fun m!876009 () Bool)

(assert (=> b!939879 m!876009))

(assert (=> b!939879 m!875981))

(assert (=> bm!40934 m!875463))

(assert (=> b!939863 m!875947))

(assert (=> b!939863 m!875947))

(assert (=> b!939863 m!875949))

(assert (=> b!939866 m!875947))

(assert (=> b!939866 m!875947))

(assert (=> b!939866 m!875949))

(declare-fun m!876011 () Bool)

(assert (=> b!939872 m!876011))

(declare-fun m!876013 () Bool)

(assert (=> bm!40929 m!876013))

(declare-fun m!876015 () Bool)

(assert (=> b!939876 m!876015))

(assert (=> b!939869 m!875947))

(assert (=> b!939869 m!875947))

(declare-fun m!876017 () Bool)

(assert (=> b!939869 m!876017))

(assert (=> b!939524 d!114193))

(assert (=> b!939524 d!113991))

(declare-fun d!114195 () Bool)

(assert (=> d!114195 (= (apply!865 lt!424285 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14362 (getValueByKey!482 (toList!6048 lt!424285) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26392 () Bool)

(assert (= bs!26392 d!114195))

(declare-fun m!876019 () Bool)

(assert (=> bs!26392 m!876019))

(assert (=> bs!26392 m!876019))

(declare-fun m!876021 () Bool)

(assert (=> bs!26392 m!876021))

(assert (=> b!939504 d!114195))

(assert (=> b!939604 d!114073))

(assert (=> b!939542 d!114115))

(assert (=> b!939557 d!114183))

(declare-fun d!114197 () Bool)

(declare-fun e!527964 () Bool)

(assert (=> d!114197 e!527964))

(declare-fun res!631995 () Bool)

(assert (=> d!114197 (=> res!631995 e!527964)))

(declare-fun lt!424558 () Bool)

(assert (=> d!114197 (= res!631995 (not lt!424558))))

(declare-fun lt!424559 () Bool)

(assert (=> d!114197 (= lt!424558 lt!424559)))

(declare-fun lt!424557 () Unit!31682)

(declare-fun e!527963 () Unit!31682)

(assert (=> d!114197 (= lt!424557 e!527963)))

(declare-fun c!98210 () Bool)

(assert (=> d!114197 (= c!98210 lt!424559)))

(assert (=> d!114197 (= lt!424559 (containsKey!453 (toList!6048 lt!424285) (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> d!114197 (= (contains!5120 lt!424285 (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!424558)))

(declare-fun b!939884 () Bool)

(declare-fun lt!424560 () Unit!31682)

(assert (=> b!939884 (= e!527963 lt!424560)))

(assert (=> b!939884 (= lt!424560 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424285) (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!939884 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424285) (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!939885 () Bool)

(declare-fun Unit!31709 () Unit!31682)

(assert (=> b!939885 (= e!527963 Unit!31709)))

(declare-fun b!939886 () Bool)

(assert (=> b!939886 (= e!527964 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424285) (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (= (and d!114197 c!98210) b!939884))

(assert (= (and d!114197 (not c!98210)) b!939885))

(assert (= (and d!114197 (not res!631995)) b!939886))

(assert (=> d!114197 m!875031))

(declare-fun m!876023 () Bool)

(assert (=> d!114197 m!876023))

(assert (=> b!939884 m!875031))

(declare-fun m!876025 () Bool)

(assert (=> b!939884 m!876025))

(assert (=> b!939884 m!875031))

(assert (=> b!939884 m!875943))

(assert (=> b!939884 m!875943))

(declare-fun m!876027 () Bool)

(assert (=> b!939884 m!876027))

(assert (=> b!939886 m!875031))

(assert (=> b!939886 m!875943))

(assert (=> b!939886 m!875943))

(assert (=> b!939886 m!876027))

(assert (=> b!939501 d!114197))

(declare-fun d!114199 () Bool)

(assert (=> d!114199 (= (apply!865 (+!2856 lt!424333 (tuple2!13367 lt!424337 zeroValue!1173)) lt!424323) (get!14362 (getValueByKey!482 (toList!6048 (+!2856 lt!424333 (tuple2!13367 lt!424337 zeroValue!1173))) lt!424323)))))

(declare-fun bs!26393 () Bool)

(assert (= bs!26393 d!114199))

(declare-fun m!876029 () Bool)

(assert (=> bs!26393 m!876029))

(assert (=> bs!26393 m!876029))

(declare-fun m!876031 () Bool)

(assert (=> bs!26393 m!876031))

(assert (=> b!939573 d!114199))

(declare-fun d!114201 () Bool)

(declare-fun e!527966 () Bool)

(assert (=> d!114201 e!527966))

(declare-fun res!631996 () Bool)

(assert (=> d!114201 (=> res!631996 e!527966)))

(declare-fun lt!424562 () Bool)

(assert (=> d!114201 (= res!631996 (not lt!424562))))

(declare-fun lt!424563 () Bool)

(assert (=> d!114201 (= lt!424562 lt!424563)))

(declare-fun lt!424561 () Unit!31682)

(declare-fun e!527965 () Unit!31682)

(assert (=> d!114201 (= lt!424561 e!527965)))

(declare-fun c!98211 () Bool)

(assert (=> d!114201 (= c!98211 lt!424563)))

(assert (=> d!114201 (= lt!424563 (containsKey!453 (toList!6048 (+!2856 lt!424330 (tuple2!13367 lt!424341 zeroValue!1173))) lt!424325))))

(assert (=> d!114201 (= (contains!5120 (+!2856 lt!424330 (tuple2!13367 lt!424341 zeroValue!1173)) lt!424325) lt!424562)))

(declare-fun b!939887 () Bool)

(declare-fun lt!424564 () Unit!31682)

(assert (=> b!939887 (= e!527965 lt!424564)))

(assert (=> b!939887 (= lt!424564 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 (+!2856 lt!424330 (tuple2!13367 lt!424341 zeroValue!1173))) lt!424325))))

(assert (=> b!939887 (isDefined!355 (getValueByKey!482 (toList!6048 (+!2856 lt!424330 (tuple2!13367 lt!424341 zeroValue!1173))) lt!424325))))

(declare-fun b!939888 () Bool)

(declare-fun Unit!31710 () Unit!31682)

(assert (=> b!939888 (= e!527965 Unit!31710)))

(declare-fun b!939889 () Bool)

(assert (=> b!939889 (= e!527966 (isDefined!355 (getValueByKey!482 (toList!6048 (+!2856 lt!424330 (tuple2!13367 lt!424341 zeroValue!1173))) lt!424325)))))

(assert (= (and d!114201 c!98211) b!939887))

(assert (= (and d!114201 (not c!98211)) b!939888))

(assert (= (and d!114201 (not res!631996)) b!939889))

(declare-fun m!876033 () Bool)

(assert (=> d!114201 m!876033))

(declare-fun m!876035 () Bool)

(assert (=> b!939887 m!876035))

(declare-fun m!876037 () Bool)

(assert (=> b!939887 m!876037))

(assert (=> b!939887 m!876037))

(declare-fun m!876039 () Bool)

(assert (=> b!939887 m!876039))

(assert (=> b!939889 m!876037))

(assert (=> b!939889 m!876037))

(assert (=> b!939889 m!876039))

(assert (=> b!939573 d!114201))

(declare-fun d!114203 () Bool)

(assert (=> d!114203 (= (apply!865 lt!424336 lt!424328) (get!14362 (getValueByKey!482 (toList!6048 lt!424336) lt!424328)))))

(declare-fun bs!26394 () Bool)

(assert (= bs!26394 d!114203))

(declare-fun m!876041 () Bool)

(assert (=> bs!26394 m!876041))

(assert (=> bs!26394 m!876041))

(declare-fun m!876043 () Bool)

(assert (=> bs!26394 m!876043))

(assert (=> b!939573 d!114203))

(declare-fun d!114205 () Bool)

(assert (=> d!114205 (= (apply!865 (+!2856 lt!424336 (tuple2!13367 lt!424322 minValue!1173)) lt!424328) (apply!865 lt!424336 lt!424328))))

(declare-fun lt!424565 () Unit!31682)

(assert (=> d!114205 (= lt!424565 (choose!1566 lt!424336 lt!424322 minValue!1173 lt!424328))))

(declare-fun e!527967 () Bool)

(assert (=> d!114205 e!527967))

(declare-fun res!631997 () Bool)

(assert (=> d!114205 (=> (not res!631997) (not e!527967))))

(assert (=> d!114205 (= res!631997 (contains!5120 lt!424336 lt!424328))))

(assert (=> d!114205 (= (addApplyDifferent!440 lt!424336 lt!424322 minValue!1173 lt!424328) lt!424565)))

(declare-fun b!939890 () Bool)

(assert (=> b!939890 (= e!527967 (not (= lt!424328 lt!424322)))))

(assert (= (and d!114205 res!631997) b!939890))

(assert (=> d!114205 m!875363))

(assert (=> d!114205 m!875359))

(declare-fun m!876045 () Bool)

(assert (=> d!114205 m!876045))

(assert (=> d!114205 m!875359))

(assert (=> d!114205 m!875361))

(declare-fun m!876047 () Bool)

(assert (=> d!114205 m!876047))

(assert (=> b!939573 d!114205))

(declare-fun d!114207 () Bool)

(declare-fun e!527968 () Bool)

(assert (=> d!114207 e!527968))

(declare-fun res!631999 () Bool)

(assert (=> d!114207 (=> (not res!631999) (not e!527968))))

(declare-fun lt!424568 () ListLongMap!12065)

(assert (=> d!114207 (= res!631999 (contains!5120 lt!424568 (_1!6694 (tuple2!13367 lt!424337 zeroValue!1173))))))

(declare-fun lt!424566 () List!19146)

(assert (=> d!114207 (= lt!424568 (ListLongMap!12066 lt!424566))))

(declare-fun lt!424569 () Unit!31682)

(declare-fun lt!424567 () Unit!31682)

(assert (=> d!114207 (= lt!424569 lt!424567)))

(assert (=> d!114207 (= (getValueByKey!482 lt!424566 (_1!6694 (tuple2!13367 lt!424337 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424337 zeroValue!1173))))))

(assert (=> d!114207 (= lt!424567 (lemmaContainsTupThenGetReturnValue!261 lt!424566 (_1!6694 (tuple2!13367 lt!424337 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424337 zeroValue!1173))))))

(assert (=> d!114207 (= lt!424566 (insertStrictlySorted!318 (toList!6048 lt!424333) (_1!6694 (tuple2!13367 lt!424337 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424337 zeroValue!1173))))))

(assert (=> d!114207 (= (+!2856 lt!424333 (tuple2!13367 lt!424337 zeroValue!1173)) lt!424568)))

(declare-fun b!939891 () Bool)

(declare-fun res!631998 () Bool)

(assert (=> b!939891 (=> (not res!631998) (not e!527968))))

(assert (=> b!939891 (= res!631998 (= (getValueByKey!482 (toList!6048 lt!424568) (_1!6694 (tuple2!13367 lt!424337 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424337 zeroValue!1173)))))))

(declare-fun b!939892 () Bool)

(assert (=> b!939892 (= e!527968 (contains!5124 (toList!6048 lt!424568) (tuple2!13367 lt!424337 zeroValue!1173)))))

(assert (= (and d!114207 res!631999) b!939891))

(assert (= (and b!939891 res!631998) b!939892))

(declare-fun m!876049 () Bool)

(assert (=> d!114207 m!876049))

(declare-fun m!876051 () Bool)

(assert (=> d!114207 m!876051))

(declare-fun m!876053 () Bool)

(assert (=> d!114207 m!876053))

(declare-fun m!876055 () Bool)

(assert (=> d!114207 m!876055))

(declare-fun m!876057 () Bool)

(assert (=> b!939891 m!876057))

(declare-fun m!876059 () Bool)

(assert (=> b!939892 m!876059))

(assert (=> b!939573 d!114207))

(declare-fun d!114209 () Bool)

(assert (=> d!114209 (= (apply!865 (+!2856 lt!424333 (tuple2!13367 lt!424337 zeroValue!1173)) lt!424323) (apply!865 lt!424333 lt!424323))))

(declare-fun lt!424570 () Unit!31682)

(assert (=> d!114209 (= lt!424570 (choose!1566 lt!424333 lt!424337 zeroValue!1173 lt!424323))))

(declare-fun e!527969 () Bool)

(assert (=> d!114209 e!527969))

(declare-fun res!632000 () Bool)

(assert (=> d!114209 (=> (not res!632000) (not e!527969))))

(assert (=> d!114209 (= res!632000 (contains!5120 lt!424333 lt!424323))))

(assert (=> d!114209 (= (addApplyDifferent!440 lt!424333 lt!424337 zeroValue!1173 lt!424323) lt!424570)))

(declare-fun b!939893 () Bool)

(assert (=> b!939893 (= e!527969 (not (= lt!424323 lt!424337)))))

(assert (= (and d!114209 res!632000) b!939893))

(assert (=> d!114209 m!875365))

(assert (=> d!114209 m!875371))

(declare-fun m!876061 () Bool)

(assert (=> d!114209 m!876061))

(assert (=> d!114209 m!875371))

(assert (=> d!114209 m!875377))

(declare-fun m!876063 () Bool)

(assert (=> d!114209 m!876063))

(assert (=> b!939573 d!114209))

(declare-fun d!114211 () Bool)

(assert (=> d!114211 (= (apply!865 (+!2856 lt!424342 (tuple2!13367 lt!424332 minValue!1173)) lt!424321) (get!14362 (getValueByKey!482 (toList!6048 (+!2856 lt!424342 (tuple2!13367 lt!424332 minValue!1173))) lt!424321)))))

(declare-fun bs!26395 () Bool)

(assert (= bs!26395 d!114211))

(declare-fun m!876065 () Bool)

(assert (=> bs!26395 m!876065))

(assert (=> bs!26395 m!876065))

(declare-fun m!876067 () Bool)

(assert (=> bs!26395 m!876067))

(assert (=> b!939573 d!114211))

(declare-fun d!114213 () Bool)

(assert (=> d!114213 (contains!5120 (+!2856 lt!424330 (tuple2!13367 lt!424341 zeroValue!1173)) lt!424325)))

(declare-fun lt!424571 () Unit!31682)

(assert (=> d!114213 (= lt!424571 (choose!1567 lt!424330 lt!424341 zeroValue!1173 lt!424325))))

(assert (=> d!114213 (contains!5120 lt!424330 lt!424325)))

(assert (=> d!114213 (= (addStillContains!559 lt!424330 lt!424341 zeroValue!1173 lt!424325) lt!424571)))

(declare-fun bs!26396 () Bool)

(assert (= bs!26396 d!114213))

(assert (=> bs!26396 m!875373))

(assert (=> bs!26396 m!875373))

(assert (=> bs!26396 m!875383))

(declare-fun m!876069 () Bool)

(assert (=> bs!26396 m!876069))

(declare-fun m!876071 () Bool)

(assert (=> bs!26396 m!876071))

(assert (=> b!939573 d!114213))

(declare-fun d!114215 () Bool)

(declare-fun e!527970 () Bool)

(assert (=> d!114215 e!527970))

(declare-fun res!632002 () Bool)

(assert (=> d!114215 (=> (not res!632002) (not e!527970))))

(declare-fun lt!424574 () ListLongMap!12065)

(assert (=> d!114215 (= res!632002 (contains!5120 lt!424574 (_1!6694 (tuple2!13367 lt!424322 minValue!1173))))))

(declare-fun lt!424572 () List!19146)

(assert (=> d!114215 (= lt!424574 (ListLongMap!12066 lt!424572))))

(declare-fun lt!424575 () Unit!31682)

(declare-fun lt!424573 () Unit!31682)

(assert (=> d!114215 (= lt!424575 lt!424573)))

(assert (=> d!114215 (= (getValueByKey!482 lt!424572 (_1!6694 (tuple2!13367 lt!424322 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424322 minValue!1173))))))

(assert (=> d!114215 (= lt!424573 (lemmaContainsTupThenGetReturnValue!261 lt!424572 (_1!6694 (tuple2!13367 lt!424322 minValue!1173)) (_2!6694 (tuple2!13367 lt!424322 minValue!1173))))))

(assert (=> d!114215 (= lt!424572 (insertStrictlySorted!318 (toList!6048 lt!424336) (_1!6694 (tuple2!13367 lt!424322 minValue!1173)) (_2!6694 (tuple2!13367 lt!424322 minValue!1173))))))

(assert (=> d!114215 (= (+!2856 lt!424336 (tuple2!13367 lt!424322 minValue!1173)) lt!424574)))

(declare-fun b!939894 () Bool)

(declare-fun res!632001 () Bool)

(assert (=> b!939894 (=> (not res!632001) (not e!527970))))

(assert (=> b!939894 (= res!632001 (= (getValueByKey!482 (toList!6048 lt!424574) (_1!6694 (tuple2!13367 lt!424322 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424322 minValue!1173)))))))

(declare-fun b!939895 () Bool)

(assert (=> b!939895 (= e!527970 (contains!5124 (toList!6048 lt!424574) (tuple2!13367 lt!424322 minValue!1173)))))

(assert (= (and d!114215 res!632002) b!939894))

(assert (= (and b!939894 res!632001) b!939895))

(declare-fun m!876073 () Bool)

(assert (=> d!114215 m!876073))

(declare-fun m!876075 () Bool)

(assert (=> d!114215 m!876075))

(declare-fun m!876077 () Bool)

(assert (=> d!114215 m!876077))

(declare-fun m!876079 () Bool)

(assert (=> d!114215 m!876079))

(declare-fun m!876081 () Bool)

(assert (=> b!939894 m!876081))

(declare-fun m!876083 () Bool)

(assert (=> b!939895 m!876083))

(assert (=> b!939573 d!114215))

(assert (=> b!939573 d!114121))

(declare-fun d!114217 () Bool)

(assert (=> d!114217 (= (apply!865 lt!424333 lt!424323) (get!14362 (getValueByKey!482 (toList!6048 lt!424333) lt!424323)))))

(declare-fun bs!26397 () Bool)

(assert (= bs!26397 d!114217))

(declare-fun m!876085 () Bool)

(assert (=> bs!26397 m!876085))

(assert (=> bs!26397 m!876085))

(declare-fun m!876087 () Bool)

(assert (=> bs!26397 m!876087))

(assert (=> b!939573 d!114217))

(declare-fun d!114219 () Bool)

(assert (=> d!114219 (= (apply!865 (+!2856 lt!424342 (tuple2!13367 lt!424332 minValue!1173)) lt!424321) (apply!865 lt!424342 lt!424321))))

(declare-fun lt!424576 () Unit!31682)

(assert (=> d!114219 (= lt!424576 (choose!1566 lt!424342 lt!424332 minValue!1173 lt!424321))))

(declare-fun e!527971 () Bool)

(assert (=> d!114219 e!527971))

(declare-fun res!632003 () Bool)

(assert (=> d!114219 (=> (not res!632003) (not e!527971))))

(assert (=> d!114219 (= res!632003 (contains!5120 lt!424342 lt!424321))))

(assert (=> d!114219 (= (addApplyDifferent!440 lt!424342 lt!424332 minValue!1173 lt!424321) lt!424576)))

(declare-fun b!939896 () Bool)

(assert (=> b!939896 (= e!527971 (not (= lt!424321 lt!424332)))))

(assert (= (and d!114219 res!632003) b!939896))

(assert (=> d!114219 m!875369))

(assert (=> d!114219 m!875355))

(declare-fun m!876089 () Bool)

(assert (=> d!114219 m!876089))

(assert (=> d!114219 m!875355))

(assert (=> d!114219 m!875357))

(declare-fun m!876091 () Bool)

(assert (=> d!114219 m!876091))

(assert (=> b!939573 d!114219))

(declare-fun d!114221 () Bool)

(declare-fun e!527972 () Bool)

(assert (=> d!114221 e!527972))

(declare-fun res!632005 () Bool)

(assert (=> d!114221 (=> (not res!632005) (not e!527972))))

(declare-fun lt!424579 () ListLongMap!12065)

(assert (=> d!114221 (= res!632005 (contains!5120 lt!424579 (_1!6694 (tuple2!13367 lt!424341 zeroValue!1173))))))

(declare-fun lt!424577 () List!19146)

(assert (=> d!114221 (= lt!424579 (ListLongMap!12066 lt!424577))))

(declare-fun lt!424580 () Unit!31682)

(declare-fun lt!424578 () Unit!31682)

(assert (=> d!114221 (= lt!424580 lt!424578)))

(assert (=> d!114221 (= (getValueByKey!482 lt!424577 (_1!6694 (tuple2!13367 lt!424341 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424341 zeroValue!1173))))))

(assert (=> d!114221 (= lt!424578 (lemmaContainsTupThenGetReturnValue!261 lt!424577 (_1!6694 (tuple2!13367 lt!424341 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424341 zeroValue!1173))))))

(assert (=> d!114221 (= lt!424577 (insertStrictlySorted!318 (toList!6048 lt!424330) (_1!6694 (tuple2!13367 lt!424341 zeroValue!1173)) (_2!6694 (tuple2!13367 lt!424341 zeroValue!1173))))))

(assert (=> d!114221 (= (+!2856 lt!424330 (tuple2!13367 lt!424341 zeroValue!1173)) lt!424579)))

(declare-fun b!939897 () Bool)

(declare-fun res!632004 () Bool)

(assert (=> b!939897 (=> (not res!632004) (not e!527972))))

(assert (=> b!939897 (= res!632004 (= (getValueByKey!482 (toList!6048 lt!424579) (_1!6694 (tuple2!13367 lt!424341 zeroValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424341 zeroValue!1173)))))))

(declare-fun b!939898 () Bool)

(assert (=> b!939898 (= e!527972 (contains!5124 (toList!6048 lt!424579) (tuple2!13367 lt!424341 zeroValue!1173)))))

(assert (= (and d!114221 res!632005) b!939897))

(assert (= (and b!939897 res!632004) b!939898))

(declare-fun m!876093 () Bool)

(assert (=> d!114221 m!876093))

(declare-fun m!876095 () Bool)

(assert (=> d!114221 m!876095))

(declare-fun m!876097 () Bool)

(assert (=> d!114221 m!876097))

(declare-fun m!876099 () Bool)

(assert (=> d!114221 m!876099))

(declare-fun m!876101 () Bool)

(assert (=> b!939897 m!876101))

(declare-fun m!876103 () Bool)

(assert (=> b!939898 m!876103))

(assert (=> b!939573 d!114221))

(declare-fun d!114223 () Bool)

(assert (=> d!114223 (= (apply!865 (+!2856 lt!424336 (tuple2!13367 lt!424322 minValue!1173)) lt!424328) (get!14362 (getValueByKey!482 (toList!6048 (+!2856 lt!424336 (tuple2!13367 lt!424322 minValue!1173))) lt!424328)))))

(declare-fun bs!26398 () Bool)

(assert (= bs!26398 d!114223))

(declare-fun m!876105 () Bool)

(assert (=> bs!26398 m!876105))

(assert (=> bs!26398 m!876105))

(declare-fun m!876107 () Bool)

(assert (=> bs!26398 m!876107))

(assert (=> b!939573 d!114223))

(declare-fun d!114225 () Bool)

(assert (=> d!114225 (= (apply!865 lt!424342 lt!424321) (get!14362 (getValueByKey!482 (toList!6048 lt!424342) lt!424321)))))

(declare-fun bs!26399 () Bool)

(assert (= bs!26399 d!114225))

(declare-fun m!876109 () Bool)

(assert (=> bs!26399 m!876109))

(assert (=> bs!26399 m!876109))

(declare-fun m!876111 () Bool)

(assert (=> bs!26399 m!876111))

(assert (=> b!939573 d!114225))

(declare-fun d!114227 () Bool)

(declare-fun e!527973 () Bool)

(assert (=> d!114227 e!527973))

(declare-fun res!632007 () Bool)

(assert (=> d!114227 (=> (not res!632007) (not e!527973))))

(declare-fun lt!424583 () ListLongMap!12065)

(assert (=> d!114227 (= res!632007 (contains!5120 lt!424583 (_1!6694 (tuple2!13367 lt!424332 minValue!1173))))))

(declare-fun lt!424581 () List!19146)

(assert (=> d!114227 (= lt!424583 (ListLongMap!12066 lt!424581))))

(declare-fun lt!424584 () Unit!31682)

(declare-fun lt!424582 () Unit!31682)

(assert (=> d!114227 (= lt!424584 lt!424582)))

(assert (=> d!114227 (= (getValueByKey!482 lt!424581 (_1!6694 (tuple2!13367 lt!424332 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424332 minValue!1173))))))

(assert (=> d!114227 (= lt!424582 (lemmaContainsTupThenGetReturnValue!261 lt!424581 (_1!6694 (tuple2!13367 lt!424332 minValue!1173)) (_2!6694 (tuple2!13367 lt!424332 minValue!1173))))))

(assert (=> d!114227 (= lt!424581 (insertStrictlySorted!318 (toList!6048 lt!424342) (_1!6694 (tuple2!13367 lt!424332 minValue!1173)) (_2!6694 (tuple2!13367 lt!424332 minValue!1173))))))

(assert (=> d!114227 (= (+!2856 lt!424342 (tuple2!13367 lt!424332 minValue!1173)) lt!424583)))

(declare-fun b!939899 () Bool)

(declare-fun res!632006 () Bool)

(assert (=> b!939899 (=> (not res!632006) (not e!527973))))

(assert (=> b!939899 (= res!632006 (= (getValueByKey!482 (toList!6048 lt!424583) (_1!6694 (tuple2!13367 lt!424332 minValue!1173))) (Some!487 (_2!6694 (tuple2!13367 lt!424332 minValue!1173)))))))

(declare-fun b!939900 () Bool)

(assert (=> b!939900 (= e!527973 (contains!5124 (toList!6048 lt!424583) (tuple2!13367 lt!424332 minValue!1173)))))

(assert (= (and d!114227 res!632007) b!939899))

(assert (= (and b!939899 res!632006) b!939900))

(declare-fun m!876113 () Bool)

(assert (=> d!114227 m!876113))

(declare-fun m!876115 () Bool)

(assert (=> d!114227 m!876115))

(declare-fun m!876117 () Bool)

(assert (=> d!114227 m!876117))

(declare-fun m!876119 () Bool)

(assert (=> d!114227 m!876119))

(declare-fun m!876121 () Bool)

(assert (=> b!939899 m!876121))

(declare-fun m!876123 () Bool)

(assert (=> b!939900 m!876123))

(assert (=> b!939573 d!114227))

(assert (=> b!939539 d!114115))

(declare-fun d!114229 () Bool)

(assert (=> d!114229 (= (apply!865 lt!424259 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14362 (getValueByKey!482 (toList!6048 lt!424259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26400 () Bool)

(assert (= bs!26400 d!114229))

(assert (=> bs!26400 m!875451))

(assert (=> bs!26400 m!875451))

(declare-fun m!876125 () Bool)

(assert (=> bs!26400 m!876125))

(assert (=> b!939480 d!114229))

(declare-fun d!114231 () Bool)

(declare-fun res!632008 () Bool)

(declare-fun e!527974 () Bool)

(assert (=> d!114231 (=> res!632008 e!527974)))

(assert (=> d!114231 (= res!632008 (and ((_ is Cons!19142) (toList!6048 lt!424107)) (= (_1!6694 (h!20294 (toList!6048 lt!424107))) k0!1099)))))

(assert (=> d!114231 (= (containsKey!453 (toList!6048 lt!424107) k0!1099) e!527974)))

(declare-fun b!939901 () Bool)

(declare-fun e!527975 () Bool)

(assert (=> b!939901 (= e!527974 e!527975)))

(declare-fun res!632009 () Bool)

(assert (=> b!939901 (=> (not res!632009) (not e!527975))))

(assert (=> b!939901 (= res!632009 (and (or (not ((_ is Cons!19142) (toList!6048 lt!424107))) (bvsle (_1!6694 (h!20294 (toList!6048 lt!424107))) k0!1099)) ((_ is Cons!19142) (toList!6048 lt!424107)) (bvslt (_1!6694 (h!20294 (toList!6048 lt!424107))) k0!1099)))))

(declare-fun b!939902 () Bool)

(assert (=> b!939902 (= e!527975 (containsKey!453 (t!27437 (toList!6048 lt!424107)) k0!1099))))

(assert (= (and d!114231 (not res!632008)) b!939901))

(assert (= (and b!939901 res!632009) b!939902))

(declare-fun m!876127 () Bool)

(assert (=> b!939902 m!876127))

(assert (=> d!113955 d!114231))

(declare-fun d!114233 () Bool)

(assert (=> d!114233 (arrayContainsKey!0 _keys!1487 lt!424365 #b00000000000000000000000000000000)))

(declare-fun lt!424587 () Unit!31682)

(declare-fun choose!13 (array!56517 (_ BitVec 64) (_ BitVec 32)) Unit!31682)

(assert (=> d!114233 (= lt!424587 (choose!13 _keys!1487 lt!424365 #b00000000000000000000000000000000))))

(assert (=> d!114233 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!114233 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!424365 #b00000000000000000000000000000000) lt!424587)))

(declare-fun bs!26401 () Bool)

(assert (= bs!26401 d!114233))

(assert (=> bs!26401 m!875429))

(declare-fun m!876129 () Bool)

(assert (=> bs!26401 m!876129))

(assert (=> b!939600 d!114233))

(declare-fun d!114235 () Bool)

(declare-fun res!632010 () Bool)

(declare-fun e!527976 () Bool)

(assert (=> d!114235 (=> res!632010 e!527976)))

(assert (=> d!114235 (= res!632010 (= (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) lt!424365))))

(assert (=> d!114235 (= (arrayContainsKey!0 _keys!1487 lt!424365 #b00000000000000000000000000000000) e!527976)))

(declare-fun b!939903 () Bool)

(declare-fun e!527977 () Bool)

(assert (=> b!939903 (= e!527976 e!527977)))

(declare-fun res!632011 () Bool)

(assert (=> b!939903 (=> (not res!632011) (not e!527977))))

(assert (=> b!939903 (= res!632011 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27653 _keys!1487)))))

(declare-fun b!939904 () Bool)

(assert (=> b!939904 (= e!527977 (arrayContainsKey!0 _keys!1487 lt!424365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114235 (not res!632010)) b!939903))

(assert (= (and b!939903 res!632011) b!939904))

(assert (=> d!114235 m!875423))

(declare-fun m!876131 () Bool)

(assert (=> b!939904 m!876131))

(assert (=> b!939600 d!114235))

(declare-fun d!114237 () Bool)

(declare-fun lt!424596 () SeekEntryResult!8936)

(assert (=> d!114237 (and (or ((_ is Undefined!8936) lt!424596) (not ((_ is Found!8936) lt!424596)) (and (bvsge (index!38116 lt!424596) #b00000000000000000000000000000000) (bvslt (index!38116 lt!424596) (size!27653 _keys!1487)))) (or ((_ is Undefined!8936) lt!424596) ((_ is Found!8936) lt!424596) (not ((_ is MissingZero!8936) lt!424596)) (and (bvsge (index!38115 lt!424596) #b00000000000000000000000000000000) (bvslt (index!38115 lt!424596) (size!27653 _keys!1487)))) (or ((_ is Undefined!8936) lt!424596) ((_ is Found!8936) lt!424596) ((_ is MissingZero!8936) lt!424596) (not ((_ is MissingVacant!8936) lt!424596)) (and (bvsge (index!38118 lt!424596) #b00000000000000000000000000000000) (bvslt (index!38118 lt!424596) (size!27653 _keys!1487)))) (or ((_ is Undefined!8936) lt!424596) (ite ((_ is Found!8936) lt!424596) (= (select (arr!27193 _keys!1487) (index!38116 lt!424596)) (select (arr!27193 _keys!1487) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8936) lt!424596) (= (select (arr!27193 _keys!1487) (index!38115 lt!424596)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8936) lt!424596) (= (select (arr!27193 _keys!1487) (index!38118 lt!424596)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!527986 () SeekEntryResult!8936)

(assert (=> d!114237 (= lt!424596 e!527986)))

(declare-fun c!98218 () Bool)

(declare-fun lt!424594 () SeekEntryResult!8936)

(assert (=> d!114237 (= c!98218 (and ((_ is Intermediate!8936) lt!424594) (undefined!9748 lt!424594)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56517 (_ BitVec 32)) SeekEntryResult!8936)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114237 (= lt!424594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) mask!1881) (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(assert (=> d!114237 (validMask!0 mask!1881)))

(assert (=> d!114237 (= (seekEntryOrOpen!0 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) lt!424596)))

(declare-fun b!939917 () Bool)

(declare-fun c!98219 () Bool)

(declare-fun lt!424595 () (_ BitVec 64))

(assert (=> b!939917 (= c!98219 (= lt!424595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!527984 () SeekEntryResult!8936)

(declare-fun e!527985 () SeekEntryResult!8936)

(assert (=> b!939917 (= e!527984 e!527985)))

(declare-fun b!939918 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56517 (_ BitVec 32)) SeekEntryResult!8936)

(assert (=> b!939918 (= e!527985 (seekKeyOrZeroReturnVacant!0 (x!80430 lt!424594) (index!38117 lt!424594) (index!38117 lt!424594) (select (arr!27193 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(declare-fun b!939919 () Bool)

(assert (=> b!939919 (= e!527986 e!527984)))

(assert (=> b!939919 (= lt!424595 (select (arr!27193 _keys!1487) (index!38117 lt!424594)))))

(declare-fun c!98220 () Bool)

(assert (=> b!939919 (= c!98220 (= lt!424595 (select (arr!27193 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!939920 () Bool)

(assert (=> b!939920 (= e!527984 (Found!8936 (index!38117 lt!424594)))))

(declare-fun b!939921 () Bool)

(assert (=> b!939921 (= e!527986 Undefined!8936)))

(declare-fun b!939922 () Bool)

(assert (=> b!939922 (= e!527985 (MissingZero!8936 (index!38117 lt!424594)))))

(assert (= (and d!114237 c!98218) b!939921))

(assert (= (and d!114237 (not c!98218)) b!939919))

(assert (= (and b!939919 c!98220) b!939920))

(assert (= (and b!939919 (not c!98220)) b!939917))

(assert (= (and b!939917 c!98219) b!939922))

(assert (= (and b!939917 (not c!98219)) b!939918))

(declare-fun m!876133 () Bool)

(assert (=> d!114237 m!876133))

(declare-fun m!876135 () Bool)

(assert (=> d!114237 m!876135))

(assert (=> d!114237 m!875423))

(declare-fun m!876137 () Bool)

(assert (=> d!114237 m!876137))

(declare-fun m!876139 () Bool)

(assert (=> d!114237 m!876139))

(assert (=> d!114237 m!875045))

(assert (=> d!114237 m!876137))

(assert (=> d!114237 m!875423))

(declare-fun m!876141 () Bool)

(assert (=> d!114237 m!876141))

(assert (=> b!939918 m!875423))

(declare-fun m!876143 () Bool)

(assert (=> b!939918 m!876143))

(declare-fun m!876145 () Bool)

(assert (=> b!939919 m!876145))

(assert (=> b!939600 d!114237))

(declare-fun d!114239 () Bool)

(declare-fun e!527988 () Bool)

(assert (=> d!114239 e!527988))

(declare-fun res!632012 () Bool)

(assert (=> d!114239 (=> res!632012 e!527988)))

(declare-fun lt!424598 () Bool)

(assert (=> d!114239 (= res!632012 (not lt!424598))))

(declare-fun lt!424599 () Bool)

(assert (=> d!114239 (= lt!424598 lt!424599)))

(declare-fun lt!424597 () Unit!31682)

(declare-fun e!527987 () Unit!31682)

(assert (=> d!114239 (= lt!424597 e!527987)))

(declare-fun c!98221 () Bool)

(assert (=> d!114239 (= c!98221 lt!424599)))

(assert (=> d!114239 (= lt!424599 (containsKey!453 (toList!6048 lt!424345) (_1!6694 lt!424100)))))

(assert (=> d!114239 (= (contains!5120 lt!424345 (_1!6694 lt!424100)) lt!424598)))

(declare-fun b!939923 () Bool)

(declare-fun lt!424600 () Unit!31682)

(assert (=> b!939923 (= e!527987 lt!424600)))

(assert (=> b!939923 (= lt!424600 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424345) (_1!6694 lt!424100)))))

(assert (=> b!939923 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424345) (_1!6694 lt!424100)))))

(declare-fun b!939924 () Bool)

(declare-fun Unit!31711 () Unit!31682)

(assert (=> b!939924 (= e!527987 Unit!31711)))

(declare-fun b!939925 () Bool)

(assert (=> b!939925 (= e!527988 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424345) (_1!6694 lt!424100))))))

(assert (= (and d!114239 c!98221) b!939923))

(assert (= (and d!114239 (not c!98221)) b!939924))

(assert (= (and d!114239 (not res!632012)) b!939925))

(declare-fun m!876147 () Bool)

(assert (=> d!114239 m!876147))

(declare-fun m!876149 () Bool)

(assert (=> b!939923 m!876149))

(assert (=> b!939923 m!875403))

(assert (=> b!939923 m!875403))

(declare-fun m!876151 () Bool)

(assert (=> b!939923 m!876151))

(assert (=> b!939925 m!875403))

(assert (=> b!939925 m!875403))

(assert (=> b!939925 m!876151))

(assert (=> d!113985 d!114239))

(declare-fun b!939929 () Bool)

(declare-fun e!527990 () Option!488)

(assert (=> b!939929 (= e!527990 None!486)))

(declare-fun b!939928 () Bool)

(assert (=> b!939928 (= e!527990 (getValueByKey!482 (t!27437 lt!424343) (_1!6694 lt!424100)))))

(declare-fun d!114241 () Bool)

(declare-fun c!98222 () Bool)

(assert (=> d!114241 (= c!98222 (and ((_ is Cons!19142) lt!424343) (= (_1!6694 (h!20294 lt!424343)) (_1!6694 lt!424100))))))

(declare-fun e!527989 () Option!488)

(assert (=> d!114241 (= (getValueByKey!482 lt!424343 (_1!6694 lt!424100)) e!527989)))

(declare-fun b!939927 () Bool)

(assert (=> b!939927 (= e!527989 e!527990)))

(declare-fun c!98223 () Bool)

(assert (=> b!939927 (= c!98223 (and ((_ is Cons!19142) lt!424343) (not (= (_1!6694 (h!20294 lt!424343)) (_1!6694 lt!424100)))))))

(declare-fun b!939926 () Bool)

(assert (=> b!939926 (= e!527989 (Some!487 (_2!6694 (h!20294 lt!424343))))))

(assert (= (and d!114241 c!98222) b!939926))

(assert (= (and d!114241 (not c!98222)) b!939927))

(assert (= (and b!939927 c!98223) b!939928))

(assert (= (and b!939927 (not c!98223)) b!939929))

(declare-fun m!876153 () Bool)

(assert (=> b!939928 m!876153))

(assert (=> d!113985 d!114241))

(declare-fun d!114243 () Bool)

(assert (=> d!114243 (= (getValueByKey!482 lt!424343 (_1!6694 lt!424100)) (Some!487 (_2!6694 lt!424100)))))

(declare-fun lt!424601 () Unit!31682)

(assert (=> d!114243 (= lt!424601 (choose!1570 lt!424343 (_1!6694 lt!424100) (_2!6694 lt!424100)))))

(declare-fun e!527991 () Bool)

(assert (=> d!114243 e!527991))

(declare-fun res!632013 () Bool)

(assert (=> d!114243 (=> (not res!632013) (not e!527991))))

(assert (=> d!114243 (= res!632013 (isStrictlySorted!492 lt!424343))))

(assert (=> d!114243 (= (lemmaContainsTupThenGetReturnValue!261 lt!424343 (_1!6694 lt!424100) (_2!6694 lt!424100)) lt!424601)))

(declare-fun b!939930 () Bool)

(declare-fun res!632014 () Bool)

(assert (=> b!939930 (=> (not res!632014) (not e!527991))))

(assert (=> b!939930 (= res!632014 (containsKey!453 lt!424343 (_1!6694 lt!424100)))))

(declare-fun b!939931 () Bool)

(assert (=> b!939931 (= e!527991 (contains!5124 lt!424343 (tuple2!13367 (_1!6694 lt!424100) (_2!6694 lt!424100))))))

(assert (= (and d!114243 res!632013) b!939930))

(assert (= (and b!939930 res!632014) b!939931))

(assert (=> d!114243 m!875397))

(declare-fun m!876155 () Bool)

(assert (=> d!114243 m!876155))

(declare-fun m!876157 () Bool)

(assert (=> d!114243 m!876157))

(declare-fun m!876159 () Bool)

(assert (=> b!939930 m!876159))

(declare-fun m!876161 () Bool)

(assert (=> b!939931 m!876161))

(assert (=> d!113985 d!114243))

(declare-fun bm!40936 () Bool)

(declare-fun call!40940 () List!19146)

(declare-fun call!40939 () List!19146)

(assert (=> bm!40936 (= call!40940 call!40939)))

(declare-fun b!939932 () Bool)

(declare-fun e!527993 () List!19146)

(declare-fun call!40941 () List!19146)

(assert (=> b!939932 (= e!527993 call!40941)))

(declare-fun b!939933 () Bool)

(declare-fun e!527992 () List!19146)

(assert (=> b!939933 (= e!527993 e!527992)))

(declare-fun c!98224 () Bool)

(assert (=> b!939933 (= c!98224 (and ((_ is Cons!19142) (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (= (_1!6694 (h!20294 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6694 lt!424100))))))

(declare-fun b!939934 () Bool)

(declare-fun e!527995 () List!19146)

(assert (=> b!939934 (= e!527995 call!40940)))

(declare-fun b!939935 () Bool)

(assert (=> b!939935 (= e!527995 call!40940)))

(declare-fun bm!40938 () Bool)

(assert (=> bm!40938 (= call!40939 call!40941)))

(declare-fun b!939936 () Bool)

(declare-fun e!527994 () Bool)

(declare-fun lt!424602 () List!19146)

(assert (=> b!939936 (= e!527994 (contains!5124 lt!424602 (tuple2!13367 (_1!6694 lt!424100) (_2!6694 lt!424100))))))

(declare-fun b!939937 () Bool)

(declare-fun c!98225 () Bool)

(assert (=> b!939937 (= c!98225 (and ((_ is Cons!19142) (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvsgt (_1!6694 (h!20294 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6694 lt!424100))))))

(assert (=> b!939937 (= e!527992 e!527995)))

(declare-fun b!939938 () Bool)

(declare-fun res!632016 () Bool)

(assert (=> b!939938 (=> (not res!632016) (not e!527994))))

(assert (=> b!939938 (= res!632016 (containsKey!453 lt!424602 (_1!6694 lt!424100)))))

(declare-fun b!939939 () Bool)

(assert (=> b!939939 (= e!527992 call!40939)))

(declare-fun b!939940 () Bool)

(declare-fun e!527996 () List!19146)

(assert (=> b!939940 (= e!527996 (insertStrictlySorted!318 (t!27437 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (_1!6694 lt!424100) (_2!6694 lt!424100)))))

(declare-fun b!939941 () Bool)

(assert (=> b!939941 (= e!527996 (ite c!98224 (t!27437 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (ite c!98225 (Cons!19142 (h!20294 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (t!27437 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) Nil!19143)))))

(declare-fun c!98226 () Bool)

(declare-fun bm!40937 () Bool)

(assert (=> bm!40937 (= call!40941 ($colon$colon!552 e!527996 (ite c!98226 (h!20294 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (tuple2!13367 (_1!6694 lt!424100) (_2!6694 lt!424100)))))))

(declare-fun c!98227 () Bool)

(assert (=> bm!40937 (= c!98227 c!98226)))

(declare-fun d!114245 () Bool)

(assert (=> d!114245 e!527994))

(declare-fun res!632015 () Bool)

(assert (=> d!114245 (=> (not res!632015) (not e!527994))))

(assert (=> d!114245 (= res!632015 (isStrictlySorted!492 lt!424602))))

(assert (=> d!114245 (= lt!424602 e!527993)))

(assert (=> d!114245 (= c!98226 (and ((_ is Cons!19142) (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvslt (_1!6694 (h!20294 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6694 lt!424100))))))

(assert (=> d!114245 (isStrictlySorted!492 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))))

(assert (=> d!114245 (= (insertStrictlySorted!318 (toList!6048 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6694 lt!424100) (_2!6694 lt!424100)) lt!424602)))

(assert (= (and d!114245 c!98226) b!939932))

(assert (= (and d!114245 (not c!98226)) b!939933))

(assert (= (and b!939933 c!98224) b!939939))

(assert (= (and b!939933 (not c!98224)) b!939937))

(assert (= (and b!939937 c!98225) b!939934))

(assert (= (and b!939937 (not c!98225)) b!939935))

(assert (= (or b!939934 b!939935) bm!40936))

(assert (= (or b!939939 bm!40936) bm!40938))

(assert (= (or b!939932 bm!40938) bm!40937))

(assert (= (and bm!40937 c!98227) b!939940))

(assert (= (and bm!40937 (not c!98227)) b!939941))

(assert (= (and d!114245 res!632015) b!939938))

(assert (= (and b!939938 res!632016) b!939936))

(declare-fun m!876163 () Bool)

(assert (=> bm!40937 m!876163))

(declare-fun m!876165 () Bool)

(assert (=> b!939938 m!876165))

(declare-fun m!876167 () Bool)

(assert (=> b!939940 m!876167))

(declare-fun m!876169 () Bool)

(assert (=> d!114245 m!876169))

(declare-fun m!876171 () Bool)

(assert (=> d!114245 m!876171))

(declare-fun m!876173 () Bool)

(assert (=> b!939936 m!876173))

(assert (=> d!113985 d!114245))

(declare-fun d!114247 () Bool)

(assert (=> d!114247 (not (= (select (arr!27193 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!114247 true))

(declare-fun _$67!52 () Unit!31682)

(assert (=> d!114247 (= (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19144) _$67!52)))

(declare-fun bs!26402 () Bool)

(assert (= bs!26402 d!114247))

(assert (=> bs!26402 m!875031))

(assert (=> d!113989 d!114247))

(declare-fun d!114249 () Bool)

(assert (=> d!114249 (= (apply!865 (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105)) k0!1099) (apply!865 lt!424107 k0!1099))))

(assert (=> d!114249 true))

(declare-fun _$34!1161 () Unit!31682)

(assert (=> d!114249 (= (choose!1566 lt!424107 lt!424101 lt!424105 k0!1099) _$34!1161)))

(declare-fun bs!26403 () Bool)

(assert (= bs!26403 d!114249))

(assert (=> bs!26403 m!875307))

(assert (=> bs!26403 m!875307))

(assert (=> bs!26403 m!875309))

(assert (=> bs!26403 m!875039))

(assert (=> d!113971 d!114249))

(assert (=> d!113971 d!113995))

(assert (=> d!113971 d!114167))

(assert (=> d!113971 d!113955))

(declare-fun d!114251 () Bool)

(assert (=> d!114251 (= (apply!865 (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105)) k0!1099) (get!14362 (getValueByKey!482 (toList!6048 (+!2856 lt!424107 (tuple2!13367 lt!424101 lt!424105))) k0!1099)))))

(declare-fun bs!26404 () Bool)

(assert (= bs!26404 d!114251))

(assert (=> bs!26404 m!875905))

(assert (=> bs!26404 m!875905))

(declare-fun m!876175 () Bool)

(assert (=> bs!26404 m!876175))

(assert (=> d!113971 d!114251))

(assert (=> d!113993 d!113973))

(declare-fun d!114253 () Bool)

(assert (=> d!114253 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19144)))

(assert (=> d!114253 true))

(declare-fun _$71!183 () Unit!31682)

(assert (=> d!114253 (= (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) _$71!183)))

(declare-fun bs!26405 () Bool)

(assert (= bs!26405 d!114253))

(assert (=> bs!26405 m!875011))

(assert (=> d!113993 d!114253))

(declare-fun d!114255 () Bool)

(declare-fun e!527997 () Bool)

(assert (=> d!114255 e!527997))

(declare-fun res!632018 () Bool)

(assert (=> d!114255 (=> (not res!632018) (not e!527997))))

(declare-fun lt!424605 () ListLongMap!12065)

(assert (=> d!114255 (= res!632018 (contains!5120 lt!424605 (_1!6694 (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!424603 () List!19146)

(assert (=> d!114255 (= lt!424605 (ListLongMap!12066 lt!424603))))

(declare-fun lt!424606 () Unit!31682)

(declare-fun lt!424604 () Unit!31682)

(assert (=> d!114255 (= lt!424606 lt!424604)))

(assert (=> d!114255 (= (getValueByKey!482 lt!424603 (_1!6694 (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!487 (_2!6694 (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!114255 (= lt!424604 (lemmaContainsTupThenGetReturnValue!261 lt!424603 (_1!6694 (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6694 (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!114255 (= lt!424603 (insertStrictlySorted!318 (toList!6048 (ite c!98111 call!40887 (ite c!98109 call!40891 call!40890))) (_1!6694 (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6694 (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!114255 (= (+!2856 (ite c!98111 call!40887 (ite c!98109 call!40891 call!40890)) (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!424605)))

(declare-fun b!939943 () Bool)

(declare-fun res!632017 () Bool)

(assert (=> b!939943 (=> (not res!632017) (not e!527997))))

(assert (=> b!939943 (= res!632017 (= (getValueByKey!482 (toList!6048 lt!424605) (_1!6694 (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!487 (_2!6694 (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!939944 () Bool)

(assert (=> b!939944 (= e!527997 (contains!5124 (toList!6048 lt!424605) (ite (or c!98111 c!98109) (tuple2!13367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!114255 res!632018) b!939943))

(assert (= (and b!939943 res!632017) b!939944))

(declare-fun m!876177 () Bool)

(assert (=> d!114255 m!876177))

(declare-fun m!876179 () Bool)

(assert (=> d!114255 m!876179))

(declare-fun m!876181 () Bool)

(assert (=> d!114255 m!876181))

(declare-fun m!876183 () Bool)

(assert (=> d!114255 m!876183))

(declare-fun m!876185 () Bool)

(assert (=> b!939943 m!876185))

(declare-fun m!876187 () Bool)

(assert (=> b!939944 m!876187))

(assert (=> bm!40887 d!114255))

(assert (=> b!939582 d!114177))

(assert (=> b!939582 d!114119))

(assert (=> b!939498 d!114115))

(assert (=> b!939555 d!113965))

(declare-fun d!114257 () Bool)

(declare-fun e!527999 () Bool)

(assert (=> d!114257 e!527999))

(declare-fun res!632019 () Bool)

(assert (=> d!114257 (=> res!632019 e!527999)))

(declare-fun lt!424608 () Bool)

(assert (=> d!114257 (= res!632019 (not lt!424608))))

(declare-fun lt!424609 () Bool)

(assert (=> d!114257 (= lt!424608 lt!424609)))

(declare-fun lt!424607 () Unit!31682)

(declare-fun e!527998 () Unit!31682)

(assert (=> d!114257 (= lt!424607 e!527998)))

(declare-fun c!98228 () Bool)

(assert (=> d!114257 (= c!98228 lt!424609)))

(assert (=> d!114257 (= lt!424609 (containsKey!453 (toList!6048 lt!424285) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114257 (= (contains!5120 lt!424285 #b1000000000000000000000000000000000000000000000000000000000000000) lt!424608)))

(declare-fun b!939945 () Bool)

(declare-fun lt!424610 () Unit!31682)

(assert (=> b!939945 (= e!527998 lt!424610)))

(assert (=> b!939945 (= lt!424610 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6048 lt!424285) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939945 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424285) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939946 () Bool)

(declare-fun Unit!31712 () Unit!31682)

(assert (=> b!939946 (= e!527998 Unit!31712)))

(declare-fun b!939947 () Bool)

(assert (=> b!939947 (= e!527999 (isDefined!355 (getValueByKey!482 (toList!6048 lt!424285) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114257 c!98228) b!939945))

(assert (= (and d!114257 (not c!98228)) b!939946))

(assert (= (and d!114257 (not res!632019)) b!939947))

(declare-fun m!876189 () Bool)

(assert (=> d!114257 m!876189))

(declare-fun m!876191 () Bool)

(assert (=> b!939945 m!876191))

(assert (=> b!939945 m!876019))

(assert (=> b!939945 m!876019))

(declare-fun m!876193 () Bool)

(assert (=> b!939945 m!876193))

(assert (=> b!939947 m!876019))

(assert (=> b!939947 m!876019))

(assert (=> b!939947 m!876193))

(assert (=> bm!40892 d!114257))

(declare-fun d!114259 () Bool)

(assert (=> d!114259 (= (apply!865 lt!424331 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14362 (getValueByKey!482 (toList!6048 lt!424331) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26406 () Bool)

(assert (= bs!26406 d!114259))

(assert (=> bs!26406 m!875711))

(assert (=> bs!26406 m!875711))

(declare-fun m!876195 () Bool)

(assert (=> bs!26406 m!876195))

(assert (=> b!939570 d!114259))

(declare-fun b!939951 () Bool)

(declare-fun e!528001 () Option!488)

(assert (=> b!939951 (= e!528001 None!486)))

(declare-fun b!939950 () Bool)

(assert (=> b!939950 (= e!528001 (getValueByKey!482 (t!27437 (toList!6048 lt!424316)) (_1!6694 lt!424100)))))

(declare-fun d!114261 () Bool)

(declare-fun c!98229 () Bool)

(assert (=> d!114261 (= c!98229 (and ((_ is Cons!19142) (toList!6048 lt!424316)) (= (_1!6694 (h!20294 (toList!6048 lt!424316))) (_1!6694 lt!424100))))))

(declare-fun e!528000 () Option!488)

(assert (=> d!114261 (= (getValueByKey!482 (toList!6048 lt!424316) (_1!6694 lt!424100)) e!528000)))

(declare-fun b!939949 () Bool)

(assert (=> b!939949 (= e!528000 e!528001)))

(declare-fun c!98230 () Bool)

(assert (=> b!939949 (= c!98230 (and ((_ is Cons!19142) (toList!6048 lt!424316)) (not (= (_1!6694 (h!20294 (toList!6048 lt!424316))) (_1!6694 lt!424100)))))))

(declare-fun b!939948 () Bool)

(assert (=> b!939948 (= e!528000 (Some!487 (_2!6694 (h!20294 (toList!6048 lt!424316)))))))

(assert (= (and d!114261 c!98229) b!939948))

(assert (= (and d!114261 (not c!98229)) b!939949))

(assert (= (and b!939949 c!98230) b!939950))

(assert (= (and b!939949 (not c!98230)) b!939951))

(declare-fun m!876197 () Bool)

(assert (=> b!939950 m!876197))

(assert (=> b!939549 d!114261))

(declare-fun mapNonEmpty!32180 () Bool)

(declare-fun mapRes!32180 () Bool)

(declare-fun tp!61742 () Bool)

(declare-fun e!528002 () Bool)

(assert (=> mapNonEmpty!32180 (= mapRes!32180 (and tp!61742 e!528002))))

(declare-fun mapRest!32180 () (Array (_ BitVec 32) ValueCell!9650))

(declare-fun mapValue!32180 () ValueCell!9650)

(declare-fun mapKey!32180 () (_ BitVec 32))

(assert (=> mapNonEmpty!32180 (= mapRest!32179 (store mapRest!32180 mapKey!32180 mapValue!32180))))

(declare-fun b!939953 () Bool)

(declare-fun e!528003 () Bool)

(assert (=> b!939953 (= e!528003 tp_is_empty!20263)))

(declare-fun condMapEmpty!32180 () Bool)

(declare-fun mapDefault!32180 () ValueCell!9650)

(assert (=> mapNonEmpty!32179 (= condMapEmpty!32180 (= mapRest!32179 ((as const (Array (_ BitVec 32) ValueCell!9650)) mapDefault!32180)))))

(assert (=> mapNonEmpty!32179 (= tp!61741 (and e!528003 mapRes!32180))))

(declare-fun b!939952 () Bool)

(assert (=> b!939952 (= e!528002 tp_is_empty!20263)))

(declare-fun mapIsEmpty!32180 () Bool)

(assert (=> mapIsEmpty!32180 mapRes!32180))

(assert (= (and mapNonEmpty!32179 condMapEmpty!32180) mapIsEmpty!32180))

(assert (= (and mapNonEmpty!32179 (not condMapEmpty!32180)) mapNonEmpty!32180))

(assert (= (and mapNonEmpty!32180 ((_ is ValueCellFull!9650) mapValue!32180)) b!939952))

(assert (= (and mapNonEmpty!32179 ((_ is ValueCellFull!9650) mapDefault!32180)) b!939953))

(declare-fun m!876199 () Bool)

(assert (=> mapNonEmpty!32180 m!876199))

(declare-fun b_lambda!14265 () Bool)

(assert (= b_lambda!14249 (or (and start!79950 b_free!17755) b_lambda!14265)))

(declare-fun b_lambda!14267 () Bool)

(assert (= b_lambda!14259 (or (and start!79950 b_free!17755) b_lambda!14267)))

(declare-fun b_lambda!14269 () Bool)

(assert (= b_lambda!14263 (or (and start!79950 b_free!17755) b_lambda!14269)))

(declare-fun b_lambda!14271 () Bool)

(assert (= b_lambda!14251 (or (and start!79950 b_free!17755) b_lambda!14271)))

(declare-fun b_lambda!14273 () Bool)

(assert (= b_lambda!14261 (or (and start!79950 b_free!17755) b_lambda!14273)))

(declare-fun b_lambda!14275 () Bool)

(assert (= b_lambda!14257 (or (and start!79950 b_free!17755) b_lambda!14275)))

(declare-fun b_lambda!14277 () Bool)

(assert (= b_lambda!14253 (or (and start!79950 b_free!17755) b_lambda!14277)))

(declare-fun b_lambda!14279 () Bool)

(assert (= b_lambda!14255 (or (and start!79950 b_free!17755) b_lambda!14279)))

(check-sat (not b!939627) (not d!114251) (not b!939849) (not b!939848) (not b!939762) (not b_lambda!14267) (not d!114149) (not b!939887) (not d!114109) (not b!939775) (not d!114131) (not d!114161) (not d!114033) (not b!939624) (not b!939894) (not d!114155) (not b!939796) (not b!939716) (not b!939766) (not b!939878) (not b!939892) (not b!939838) (not b!939765) (not d!114083) (not d!114069) (not b!939783) (not bm!40932) (not d!114237) (not b!939787) (not b!939855) (not d!114219) (not b_lambda!14245) (not b!939780) (not d!114101) (not b_lambda!14275) (not b!939778) (not b!939733) (not d!114063) (not d!114147) (not b!939940) (not d!114061) (not b!939839) (not b!939936) (not b!939898) (not b!939667) (not d!114053) (not d!114039) (not d!114225) (not b!939814) (not d!114165) (not d!114105) (not d!114029) (not b!939928) (not d!114229) (not b!939821) (not b!939803) (not b!939861) (not b!939802) (not d!114187) (not b!939897) (not d!114259) (not b!939767) (not b!939712) (not d!114163) (not d!114197) (not d!114031) (not b!939702) (not d!114027) (not bm!40927) (not d!114065) (not d!114047) (not d!114151) (not b!939930) (not b!939817) (not d!114103) (not d!114227) (not b!939790) (not b!939797) (not bm!40914) (not b!939721) (not d!114199) (not b!939726) (not b!939772) (not b!939843) (not bm!40930) (not b!939943) (not b!939891) (not b!939862) (not d!114013) (not b!939678) (not b!939873) (not b!939714) (not d!114085) (not b!939669) (not bm!40925) (not b!939815) (not d!114207) (not b_lambda!14269) (not d!114111) (not b!939689) (not b!939904) (not b!939676) (not d!114121) (not b!939659) (not d!114129) (not d!114019) (not b!939899) (not d!114193) (not b!939902) (not d!114213) (not b!939661) (not b!939688) (not b!939660) (not d!114173) (not bm!40928) (not d!114253) (not b!939691) (not d!114215) (not d!114067) (not d!114245) (not d!114095) (not b!939823) (not b!939699) (not b!939845) (not d!114137) (not b!939682) (not b!939925) (not b!939774) (not b!939662) (not b!939794) (not b!939628) (not b!939768) (not d!114169) (not b!939876) (not d!114145) (not b!939860) (not b!939800) (not b!939841) (not b!939834) (not d!114025) (not b!939685) (not b_lambda!14265) (not b!939672) (not b_lambda!14241) (not bm!40937) (not b!939869) (not d!114077) (not d!114221) (not b!939799) (not b!939826) (not b!939832) (not d!114153) (not b!939710) (not d!114195) (not b!939708) (not b!939786) (not d!114087) (not b!939723) (not b!939760) (not d!114057) (not b!939856) (not d!114211) (not d!114135) (not b!939709) tp_is_empty!20263 (not b!939784) (not b!939818) (not d!114081) (not bm!40915) (not d!114239) (not b!939715) b_and!29169 (not d!114143) (not d!114181) (not b!939675) (not b_lambda!14277) (not b!939713) (not d!114035) (not b!939886) (not b!939884) (not b!939820) (not b!939776) (not b!939692) (not d!114133) (not b!939945) (not b!939835) (not d!114209) (not d!114223) (not b!939872) (not b!939852) (not d!114243) (not b!939779) (not d!114089) (not d!114043) (not d!114205) (not bm!40923) (not d!114139) (not b!939853) (not b!939895) (not d!114177) (not d!114041) (not d!114021) (not d!114233) (not b!939866) (not mapNonEmpty!32180) (not b!939923) (not bm!40934) (not d!114123) (not b_lambda!14273) (not b!939859) (not b!939658) (not bm!40926) (not b_lambda!14247) (not b!939668) (not b!939842) (not d!114023) (not b!939693) (not d!114097) (not b!939656) (not b!939918) (not b!939950) (not d!114255) (not b_lambda!14231) (not b!939681) (not b!939850) (not d!114179) (not d!114045) (not b!939836) (not b!939771) (not d!114075) (not d!114203) (not b_next!17755) (not b!939879) (not b!939655) (not d!114175) (not b_lambda!14279) (not b!939938) (not d!114059) (not d!114037) (not b!939863) (not d!114167) (not b!939806) (not d!114201) (not d!114049) (not d!114017) (not d!114141) (not b_lambda!14243) (not b!939819) (not b!939827) (not b!939900) (not b!939687) (not b!939630) (not b!939677) (not b!939758) (not d!114191) (not b!939947) (not b!939889) (not b!939670) (not bm!40929) (not d!114127) (not d!114257) (not b!939813) (not d!114217) (not b_lambda!14271) (not b!939674) (not b!939944) (not d!114249) (not b!939732) (not b!939801) (not b!939719) (not b!939781) (not b!939665) (not b!939931))
(check-sat b_and!29169 (not b_next!17755))
