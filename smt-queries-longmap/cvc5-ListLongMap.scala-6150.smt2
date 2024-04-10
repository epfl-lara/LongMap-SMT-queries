; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79008 () Bool)

(assert start!79008)

(declare-fun b_free!17221 () Bool)

(declare-fun b_next!17221 () Bool)

(assert (=> start!79008 (= b_free!17221 (not b_next!17221))))

(declare-fun tp!60103 () Bool)

(declare-fun b_and!28179 () Bool)

(assert (=> start!79008 (= tp!60103 b_and!28179)))

(declare-fun b!925267 () Bool)

(declare-fun res!623544 () Bool)

(declare-fun e!519298 () Bool)

(assert (=> b!925267 (=> (not res!623544) (not e!519298))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31271 0))(
  ( (V!31272 (val!9915 Int)) )
))
(declare-datatypes ((tuple2!12926 0))(
  ( (tuple2!12927 (_1!6474 (_ BitVec 64)) (_2!6474 V!31271)) )
))
(declare-datatypes ((List!18728 0))(
  ( (Nil!18725) (Cons!18724 (h!19870 tuple2!12926) (t!26679 List!18728)) )
))
(declare-datatypes ((ListLongMap!11623 0))(
  ( (ListLongMap!11624 (toList!5827 List!18728)) )
))
(declare-fun lt!416331 () ListLongMap!11623)

(declare-fun v!791 () V!31271)

(declare-fun apply!657 (ListLongMap!11623 (_ BitVec 64)) V!31271)

(assert (=> b!925267 (= res!623544 (= (apply!657 lt!416331 k!1099) v!791))))

(declare-fun b!925268 () Bool)

(declare-datatypes ((Unit!31257 0))(
  ( (Unit!31258) )
))
(declare-fun e!519302 () Unit!31257)

(declare-fun e!519293 () Unit!31257)

(assert (=> b!925268 (= e!519302 e!519293)))

(declare-fun lt!416342 () (_ BitVec 64))

(declare-datatypes ((array!55426 0))(
  ( (array!55427 (arr!26658 (Array (_ BitVec 32) (_ BitVec 64))) (size!27117 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55426)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!925268 (= lt!416342 (select (arr!26658 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96553 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925268 (= c!96553 (validKeyInArray!0 lt!416342))))

(declare-fun b!925270 () Bool)

(declare-fun res!623538 () Bool)

(declare-fun e!519301 () Bool)

(assert (=> b!925270 (=> (not res!623538) (not e!519301))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9383 0))(
  ( (ValueCellFull!9383 (v!12433 V!31271)) (EmptyCell!9383) )
))
(declare-datatypes ((array!55428 0))(
  ( (array!55429 (arr!26659 (Array (_ BitVec 32) ValueCell!9383)) (size!27118 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55428)

(assert (=> b!925270 (= res!623538 (and (= (size!27118 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27117 _keys!1487) (size!27118 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925271 () Bool)

(declare-fun res!623541 () Bool)

(assert (=> b!925271 (=> (not res!623541) (not e!519301))))

(assert (=> b!925271 (= res!623541 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27117 _keys!1487))))))

(declare-fun b!925272 () Bool)

(declare-fun e!519292 () Bool)

(assert (=> b!925272 (= e!519292 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925273 () Bool)

(declare-fun e!519303 () Bool)

(assert (=> b!925273 (= e!519303 e!519298)))

(declare-fun res!623537 () Bool)

(assert (=> b!925273 (=> (not res!623537) (not e!519298))))

(declare-fun contains!4887 (ListLongMap!11623 (_ BitVec 64)) Bool)

(assert (=> b!925273 (= res!623537 (contains!4887 lt!416331 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31271)

(declare-fun minValue!1173 () V!31271)

(declare-fun getCurrentListMap!3078 (array!55426 array!55428 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 32) Int) ListLongMap!11623)

(assert (=> b!925273 (= lt!416331 (getCurrentListMap!3078 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925274 () Bool)

(declare-fun res!623545 () Bool)

(assert (=> b!925274 (=> (not res!623545) (not e!519301))))

(declare-datatypes ((List!18729 0))(
  ( (Nil!18726) (Cons!18725 (h!19871 (_ BitVec 64)) (t!26680 List!18729)) )
))
(declare-fun arrayNoDuplicates!0 (array!55426 (_ BitVec 32) List!18729) Bool)

(assert (=> b!925274 (= res!623545 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18726))))

(declare-fun b!925275 () Bool)

(assert (=> b!925275 (= e!519298 (not true))))

(declare-fun e!519300 () Bool)

(assert (=> b!925275 e!519300))

(declare-fun res!623540 () Bool)

(assert (=> b!925275 (=> (not res!623540) (not e!519300))))

(declare-fun lt!416330 () ListLongMap!11623)

(assert (=> b!925275 (= res!623540 (contains!4887 lt!416330 k!1099))))

(assert (=> b!925275 (= lt!416330 (getCurrentListMap!3078 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!416344 () Unit!31257)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!68 (array!55426 array!55428 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 64) V!31271 (_ BitVec 32) Int) Unit!31257)

(assert (=> b!925275 (= lt!416344 (lemmaListMapApplyFromThenApplyFromZero!68 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925276 () Bool)

(declare-fun lt!416337 () ListLongMap!11623)

(declare-fun lt!416335 () V!31271)

(assert (=> b!925276 (= (apply!657 lt!416337 k!1099) lt!416335)))

(declare-fun lt!416339 () Unit!31257)

(declare-fun lt!416333 () V!31271)

(declare-fun lt!416329 () ListLongMap!11623)

(declare-fun addApplyDifferent!378 (ListLongMap!11623 (_ BitVec 64) V!31271 (_ BitVec 64)) Unit!31257)

(assert (=> b!925276 (= lt!416339 (addApplyDifferent!378 lt!416329 lt!416342 lt!416333 k!1099))))

(assert (=> b!925276 (not (= lt!416342 k!1099))))

(declare-fun lt!416340 () Unit!31257)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55426 (_ BitVec 64) (_ BitVec 32) List!18729) Unit!31257)

(assert (=> b!925276 (= lt!416340 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18726))))

(assert (=> b!925276 e!519292))

(declare-fun c!96555 () Bool)

(assert (=> b!925276 (= c!96555 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416343 () Unit!31257)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!229 (array!55426 array!55428 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 64) (_ BitVec 32) Int) Unit!31257)

(assert (=> b!925276 (= lt!416343 (lemmaListMapContainsThenArrayContainsFrom!229 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925276 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18726)))

(declare-fun lt!416338 () Unit!31257)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55426 (_ BitVec 32) (_ BitVec 32)) Unit!31257)

(assert (=> b!925276 (= lt!416338 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925276 (contains!4887 lt!416337 k!1099)))

(declare-fun lt!416332 () tuple2!12926)

(declare-fun +!2722 (ListLongMap!11623 tuple2!12926) ListLongMap!11623)

(assert (=> b!925276 (= lt!416337 (+!2722 lt!416329 lt!416332))))

(declare-fun lt!416334 () Unit!31257)

(declare-fun addStillContains!446 (ListLongMap!11623 (_ BitVec 64) V!31271 (_ BitVec 64)) Unit!31257)

(assert (=> b!925276 (= lt!416334 (addStillContains!446 lt!416329 lt!416342 lt!416333 k!1099))))

(assert (=> b!925276 (= (getCurrentListMap!3078 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2722 (getCurrentListMap!3078 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416332))))

(assert (=> b!925276 (= lt!416332 (tuple2!12927 lt!416342 lt!416333))))

(declare-fun get!14019 (ValueCell!9383 V!31271) V!31271)

(declare-fun dynLambda!1511 (Int (_ BitVec 64)) V!31271)

(assert (=> b!925276 (= lt!416333 (get!14019 (select (arr!26659 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1511 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416336 () Unit!31257)

(declare-fun lemmaListMapRecursiveValidKeyArray!112 (array!55426 array!55428 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 32) Int) Unit!31257)

(assert (=> b!925276 (= lt!416336 (lemmaListMapRecursiveValidKeyArray!112 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925276 (= e!519293 lt!416339)))

(declare-fun mapIsEmpty!31350 () Bool)

(declare-fun mapRes!31350 () Bool)

(assert (=> mapIsEmpty!31350 mapRes!31350))

(declare-fun b!925277 () Bool)

(declare-fun e!519296 () Bool)

(declare-fun tp_is_empty!19729 () Bool)

(assert (=> b!925277 (= e!519296 tp_is_empty!19729)))

(declare-fun b!925278 () Bool)

(declare-fun e!519294 () Bool)

(assert (=> b!925278 (= e!519301 e!519294)))

(declare-fun res!623536 () Bool)

(assert (=> b!925278 (=> (not res!623536) (not e!519294))))

(assert (=> b!925278 (= res!623536 (contains!4887 lt!416329 k!1099))))

(assert (=> b!925278 (= lt!416329 (getCurrentListMap!3078 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31350 () Bool)

(declare-fun tp!60104 () Bool)

(declare-fun e!519299 () Bool)

(assert (=> mapNonEmpty!31350 (= mapRes!31350 (and tp!60104 e!519299))))

(declare-fun mapValue!31350 () ValueCell!9383)

(declare-fun mapKey!31350 () (_ BitVec 32))

(declare-fun mapRest!31350 () (Array (_ BitVec 32) ValueCell!9383))

(assert (=> mapNonEmpty!31350 (= (arr!26659 _values!1231) (store mapRest!31350 mapKey!31350 mapValue!31350))))

(declare-fun b!925279 () Bool)

(declare-fun Unit!31259 () Unit!31257)

(assert (=> b!925279 (= e!519302 Unit!31259)))

(declare-fun res!623535 () Bool)

(assert (=> start!79008 (=> (not res!623535) (not e!519301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79008 (= res!623535 (validMask!0 mask!1881))))

(assert (=> start!79008 e!519301))

(assert (=> start!79008 true))

(assert (=> start!79008 tp_is_empty!19729))

(declare-fun e!519304 () Bool)

(declare-fun array_inv!20762 (array!55428) Bool)

(assert (=> start!79008 (and (array_inv!20762 _values!1231) e!519304)))

(assert (=> start!79008 tp!60103))

(declare-fun array_inv!20763 (array!55426) Bool)

(assert (=> start!79008 (array_inv!20763 _keys!1487)))

(declare-fun b!925269 () Bool)

(declare-fun arrayContainsKey!0 (array!55426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925269 (= e!519292 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!925280 () Bool)

(declare-fun Unit!31260 () Unit!31257)

(assert (=> b!925280 (= e!519293 Unit!31260)))

(declare-fun b!925281 () Bool)

(assert (=> b!925281 (= e!519300 (= (apply!657 lt!416330 k!1099) v!791))))

(declare-fun b!925282 () Bool)

(declare-fun e!519297 () Bool)

(assert (=> b!925282 (= e!519297 e!519303)))

(declare-fun res!623539 () Bool)

(assert (=> b!925282 (=> (not res!623539) (not e!519303))))

(assert (=> b!925282 (= res!623539 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27117 _keys!1487)))))

(declare-fun lt!416341 () Unit!31257)

(assert (=> b!925282 (= lt!416341 e!519302)))

(declare-fun c!96554 () Bool)

(assert (=> b!925282 (= c!96554 (validKeyInArray!0 k!1099))))

(declare-fun b!925283 () Bool)

(assert (=> b!925283 (= e!519299 tp_is_empty!19729)))

(declare-fun b!925284 () Bool)

(declare-fun res!623542 () Bool)

(assert (=> b!925284 (=> (not res!623542) (not e!519301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55426 (_ BitVec 32)) Bool)

(assert (=> b!925284 (= res!623542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925285 () Bool)

(assert (=> b!925285 (= e!519294 e!519297)))

(declare-fun res!623543 () Bool)

(assert (=> b!925285 (=> (not res!623543) (not e!519297))))

(assert (=> b!925285 (= res!623543 (and (= lt!416335 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925285 (= lt!416335 (apply!657 lt!416329 k!1099))))

(declare-fun b!925286 () Bool)

(assert (=> b!925286 (= e!519304 (and e!519296 mapRes!31350))))

(declare-fun condMapEmpty!31350 () Bool)

(declare-fun mapDefault!31350 () ValueCell!9383)

