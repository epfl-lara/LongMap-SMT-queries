; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79006 () Bool)

(assert start!79006)

(declare-fun b_free!17219 () Bool)

(declare-fun b_next!17219 () Bool)

(assert (=> start!79006 (= b_free!17219 (not b_next!17219))))

(declare-fun tp!60098 () Bool)

(declare-fun b_and!28175 () Bool)

(assert (=> start!79006 (= tp!60098 b_and!28175)))

(declare-fun b!925205 () Bool)

(declare-fun e!519254 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!925205 (= e!519254 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925206 () Bool)

(declare-datatypes ((Unit!31253 0))(
  ( (Unit!31254) )
))
(declare-fun e!519263 () Unit!31253)

(declare-fun Unit!31255 () Unit!31253)

(assert (=> b!925206 (= e!519263 Unit!31255)))

(declare-fun b!925207 () Bool)

(declare-fun e!519255 () Bool)

(declare-fun e!519253 () Bool)

(assert (=> b!925207 (= e!519255 e!519253)))

(declare-fun res!623512 () Bool)

(assert (=> b!925207 (=> (not res!623512) (not e!519253))))

(declare-datatypes ((V!31267 0))(
  ( (V!31268 (val!9914 Int)) )
))
(declare-datatypes ((tuple2!12924 0))(
  ( (tuple2!12925 (_1!6473 (_ BitVec 64)) (_2!6473 V!31267)) )
))
(declare-datatypes ((List!18726 0))(
  ( (Nil!18723) (Cons!18722 (h!19868 tuple2!12924) (t!26675 List!18726)) )
))
(declare-datatypes ((ListLongMap!11621 0))(
  ( (ListLongMap!11622 (toList!5826 List!18726)) )
))
(declare-fun lt!416282 () ListLongMap!11621)

(declare-fun contains!4886 (ListLongMap!11621 (_ BitVec 64)) Bool)

(assert (=> b!925207 (= res!623512 (contains!4886 lt!416282 k!1099))))

(declare-datatypes ((array!55422 0))(
  ( (array!55423 (arr!26656 (Array (_ BitVec 32) (_ BitVec 64))) (size!27115 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55422)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9382 0))(
  ( (ValueCellFull!9382 (v!12432 V!31267)) (EmptyCell!9382) )
))
(declare-datatypes ((array!55424 0))(
  ( (array!55425 (arr!26657 (Array (_ BitVec 32) ValueCell!9382)) (size!27116 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55424)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31267)

(declare-fun minValue!1173 () V!31267)

(declare-fun getCurrentListMap!3077 (array!55422 array!55424 (_ BitVec 32) (_ BitVec 32) V!31267 V!31267 (_ BitVec 32) Int) ListLongMap!11621)

(assert (=> b!925207 (= lt!416282 (getCurrentListMap!3077 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925208 () Bool)

(declare-fun e!519257 () Unit!31253)

(assert (=> b!925208 (= e!519263 e!519257)))

(declare-fun lt!416295 () (_ BitVec 64))

(assert (=> b!925208 (= lt!416295 (select (arr!26656 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96545 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925208 (= c!96545 (validKeyInArray!0 lt!416295))))

(declare-fun b!925209 () Bool)

(declare-fun Unit!31256 () Unit!31253)

(assert (=> b!925209 (= e!519257 Unit!31256)))

(declare-fun b!925210 () Bool)

(declare-fun res!623510 () Bool)

(declare-fun e!519261 () Bool)

(assert (=> b!925210 (=> (not res!623510) (not e!519261))))

(declare-datatypes ((List!18727 0))(
  ( (Nil!18724) (Cons!18723 (h!19869 (_ BitVec 64)) (t!26676 List!18727)) )
))
(declare-fun arrayNoDuplicates!0 (array!55422 (_ BitVec 32) List!18727) Bool)

(assert (=> b!925210 (= res!623510 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18724))))

(declare-fun b!925212 () Bool)

(declare-fun lt!416291 () ListLongMap!11621)

(declare-fun lt!416285 () V!31267)

(declare-fun apply!656 (ListLongMap!11621 (_ BitVec 64)) V!31267)

(assert (=> b!925212 (= (apply!656 lt!416291 k!1099) lt!416285)))

(declare-fun lt!416287 () ListLongMap!11621)

(declare-fun lt!416281 () V!31267)

(declare-fun lt!416296 () Unit!31253)

(declare-fun addApplyDifferent!377 (ListLongMap!11621 (_ BitVec 64) V!31267 (_ BitVec 64)) Unit!31253)

(assert (=> b!925212 (= lt!416296 (addApplyDifferent!377 lt!416287 lt!416295 lt!416281 k!1099))))

(assert (=> b!925212 (not (= lt!416295 k!1099))))

(declare-fun lt!416284 () Unit!31253)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55422 (_ BitVec 64) (_ BitVec 32) List!18727) Unit!31253)

(assert (=> b!925212 (= lt!416284 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18724))))

(assert (=> b!925212 e!519254))

(declare-fun c!96544 () Bool)

(assert (=> b!925212 (= c!96544 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416294 () Unit!31253)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!228 (array!55422 array!55424 (_ BitVec 32) (_ BitVec 32) V!31267 V!31267 (_ BitVec 64) (_ BitVec 32) Int) Unit!31253)

(assert (=> b!925212 (= lt!416294 (lemmaListMapContainsThenArrayContainsFrom!228 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925212 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18724)))

(declare-fun lt!416283 () Unit!31253)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55422 (_ BitVec 32) (_ BitVec 32)) Unit!31253)

(assert (=> b!925212 (= lt!416283 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925212 (contains!4886 lt!416291 k!1099)))

(declare-fun lt!416292 () tuple2!12924)

(declare-fun +!2721 (ListLongMap!11621 tuple2!12924) ListLongMap!11621)

(assert (=> b!925212 (= lt!416291 (+!2721 lt!416287 lt!416292))))

(declare-fun lt!416286 () Unit!31253)

(declare-fun addStillContains!445 (ListLongMap!11621 (_ BitVec 64) V!31267 (_ BitVec 64)) Unit!31253)

(assert (=> b!925212 (= lt!416286 (addStillContains!445 lt!416287 lt!416295 lt!416281 k!1099))))

(assert (=> b!925212 (= (getCurrentListMap!3077 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2721 (getCurrentListMap!3077 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416292))))

(assert (=> b!925212 (= lt!416292 (tuple2!12925 lt!416295 lt!416281))))

(declare-fun get!14016 (ValueCell!9382 V!31267) V!31267)

(declare-fun dynLambda!1510 (Int (_ BitVec 64)) V!31267)

(assert (=> b!925212 (= lt!416281 (get!14016 (select (arr!26657 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1510 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416289 () Unit!31253)

(declare-fun lemmaListMapRecursiveValidKeyArray!111 (array!55422 array!55424 (_ BitVec 32) (_ BitVec 32) V!31267 V!31267 (_ BitVec 32) Int) Unit!31253)

(assert (=> b!925212 (= lt!416289 (lemmaListMapRecursiveValidKeyArray!111 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925212 (= e!519257 lt!416296)))

(declare-fun b!925213 () Bool)

(declare-fun res!623509 () Bool)

(assert (=> b!925213 (=> (not res!623509) (not e!519261))))

(assert (=> b!925213 (= res!623509 (and (= (size!27116 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27115 _keys!1487) (size!27116 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun v!791 () V!31267)

(declare-fun b!925214 () Bool)

(declare-fun e!519256 () Bool)

(declare-fun lt!416290 () ListLongMap!11621)

(assert (=> b!925214 (= e!519256 (= (apply!656 lt!416290 k!1099) v!791))))

(declare-fun b!925215 () Bool)

(declare-fun res!623503 () Bool)

(assert (=> b!925215 (=> (not res!623503) (not e!519253))))

(assert (=> b!925215 (= res!623503 (= (apply!656 lt!416282 k!1099) v!791))))

(declare-fun b!925216 () Bool)

(declare-fun res!623506 () Bool)

(assert (=> b!925216 (=> (not res!623506) (not e!519261))))

(assert (=> b!925216 (= res!623506 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27115 _keys!1487))))))

(declare-fun b!925217 () Bool)

(declare-fun e!519262 () Bool)

(assert (=> b!925217 (= e!519261 e!519262)))

(declare-fun res!623502 () Bool)

(assert (=> b!925217 (=> (not res!623502) (not e!519262))))

(assert (=> b!925217 (= res!623502 (contains!4886 lt!416287 k!1099))))

(assert (=> b!925217 (= lt!416287 (getCurrentListMap!3077 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925218 () Bool)

(declare-fun e!519258 () Bool)

(assert (=> b!925218 (= e!519262 e!519258)))

(declare-fun res!623505 () Bool)

(assert (=> b!925218 (=> (not res!623505) (not e!519258))))

(assert (=> b!925218 (= res!623505 (and (= lt!416285 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925218 (= lt!416285 (apply!656 lt!416287 k!1099))))

(declare-fun b!925219 () Bool)

(declare-fun arrayContainsKey!0 (array!55422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925219 (= e!519254 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!925220 () Bool)

(declare-fun res!623507 () Bool)

(assert (=> b!925220 (=> (not res!623507) (not e!519261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55422 (_ BitVec 32)) Bool)

(assert (=> b!925220 (= res!623507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31347 () Bool)

(declare-fun mapRes!31347 () Bool)

(assert (=> mapIsEmpty!31347 mapRes!31347))

(declare-fun b!925211 () Bool)

(declare-fun e!519264 () Bool)

(declare-fun tp_is_empty!19727 () Bool)

(assert (=> b!925211 (= e!519264 tp_is_empty!19727)))

(declare-fun res!623508 () Bool)

(assert (=> start!79006 (=> (not res!623508) (not e!519261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79006 (= res!623508 (validMask!0 mask!1881))))

(assert (=> start!79006 e!519261))

(assert (=> start!79006 true))

(assert (=> start!79006 tp_is_empty!19727))

(declare-fun e!519265 () Bool)

(declare-fun array_inv!20760 (array!55424) Bool)

(assert (=> start!79006 (and (array_inv!20760 _values!1231) e!519265)))

(assert (=> start!79006 tp!60098))

(declare-fun array_inv!20761 (array!55422) Bool)

(assert (=> start!79006 (array_inv!20761 _keys!1487)))

(declare-fun b!925221 () Bool)

(assert (=> b!925221 (= e!519265 (and e!519264 mapRes!31347))))

(declare-fun condMapEmpty!31347 () Bool)

(declare-fun mapDefault!31347 () ValueCell!9382)

