; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79870 () Bool)

(assert start!79870)

(declare-fun b_free!17767 () Bool)

(declare-fun b_next!17767 () Bool)

(assert (=> start!79870 (= b_free!17767 (not b_next!17767))))

(declare-fun tp!61764 () Bool)

(declare-fun b_and!29173 () Bool)

(assert (=> start!79870 (= tp!61764 b_and!29173)))

(declare-fun mapIsEmpty!32192 () Bool)

(declare-fun mapRes!32192 () Bool)

(assert (=> mapIsEmpty!32192 mapRes!32192))

(declare-fun e!527562 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!56494 0))(
  ( (array!56495 (arr!27185 (Array (_ BitVec 32) (_ BitVec 64))) (size!27644 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56494)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!939268 () Bool)

(declare-fun arrayContainsKey!0 (array!56494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939268 (= e!527562 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun mapNonEmpty!32192 () Bool)

(declare-fun tp!61765 () Bool)

(declare-fun e!527567 () Bool)

(assert (=> mapNonEmpty!32192 (= mapRes!32192 (and tp!61765 e!527567))))

(declare-datatypes ((V!31999 0))(
  ( (V!32000 (val!10188 Int)) )
))
(declare-datatypes ((ValueCell!9656 0))(
  ( (ValueCellFull!9656 (v!12719 V!31999)) (EmptyCell!9656) )
))
(declare-fun mapRest!32192 () (Array (_ BitVec 32) ValueCell!9656))

(declare-fun mapValue!32192 () ValueCell!9656)

(declare-datatypes ((array!56496 0))(
  ( (array!56497 (arr!27186 (Array (_ BitVec 32) ValueCell!9656)) (size!27645 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56496)

(declare-fun mapKey!32192 () (_ BitVec 32))

(assert (=> mapNonEmpty!32192 (= (arr!27186 _values!1231) (store mapRest!32192 mapKey!32192 mapValue!32192))))

(declare-fun b!939270 () Bool)

(declare-fun e!527559 () Bool)

(declare-fun e!527558 () Bool)

(assert (=> b!939270 (= e!527559 e!527558)))

(declare-fun res!631792 () Bool)

(assert (=> b!939270 (=> (not res!631792) (not e!527558))))

(assert (=> b!939270 (= res!631792 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27644 _keys!1487)))))

(declare-datatypes ((Unit!31742 0))(
  ( (Unit!31743) )
))
(declare-fun lt!424422 () Unit!31742)

(declare-fun e!527556 () Unit!31742)

(assert (=> b!939270 (= lt!424422 e!527556)))

(declare-fun c!97984 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939270 (= c!97984 (validKeyInArray!0 k!1099))))

(declare-fun b!939271 () Bool)

(declare-fun e!527557 () Bool)

(assert (=> b!939271 (= e!527557 e!527559)))

(declare-fun res!631794 () Bool)

(assert (=> b!939271 (=> (not res!631794) (not e!527559))))

(declare-fun v!791 () V!31999)

(declare-fun lt!424415 () V!31999)

(assert (=> b!939271 (= res!631794 (and (= lt!424415 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13392 0))(
  ( (tuple2!13393 (_1!6707 (_ BitVec 64)) (_2!6707 V!31999)) )
))
(declare-datatypes ((List!19169 0))(
  ( (Nil!19166) (Cons!19165 (h!20311 tuple2!13392) (t!27480 List!19169)) )
))
(declare-datatypes ((ListLongMap!12089 0))(
  ( (ListLongMap!12090 (toList!6060 List!19169)) )
))
(declare-fun lt!424426 () ListLongMap!12089)

(declare-fun apply!861 (ListLongMap!12089 (_ BitVec 64)) V!31999)

(assert (=> b!939271 (= lt!424415 (apply!861 lt!424426 k!1099))))

(declare-fun b!939272 () Bool)

(declare-fun e!527568 () Unit!31742)

(declare-fun Unit!31744 () Unit!31742)

(assert (=> b!939272 (= e!527568 Unit!31744)))

(declare-fun b!939273 () Bool)

(declare-fun tp_is_empty!20275 () Bool)

(assert (=> b!939273 (= e!527567 tp_is_empty!20275)))

(declare-fun b!939274 () Bool)

(declare-fun res!631788 () Bool)

(declare-fun e!527565 () Bool)

(assert (=> b!939274 (=> (not res!631788) (not e!527565))))

(declare-datatypes ((List!19170 0))(
  ( (Nil!19167) (Cons!19166 (h!20312 (_ BitVec 64)) (t!27481 List!19170)) )
))
(declare-fun arrayNoDuplicates!0 (array!56494 (_ BitVec 32) List!19170) Bool)

(assert (=> b!939274 (= res!631788 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19167))))

(declare-fun b!939275 () Bool)

(declare-fun lt!424413 () ListLongMap!12089)

(assert (=> b!939275 (= (apply!861 lt!424413 k!1099) lt!424415)))

(declare-fun lt!424419 () (_ BitVec 64))

(declare-fun lt!424412 () Unit!31742)

(declare-fun lt!424416 () V!31999)

(declare-fun addApplyDifferent!446 (ListLongMap!12089 (_ BitVec 64) V!31999 (_ BitVec 64)) Unit!31742)

(assert (=> b!939275 (= lt!424412 (addApplyDifferent!446 lt!424426 lt!424419 lt!424416 k!1099))))

(assert (=> b!939275 (not (= lt!424419 k!1099))))

(declare-fun lt!424424 () Unit!31742)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56494 (_ BitVec 64) (_ BitVec 32) List!19170) Unit!31742)

(assert (=> b!939275 (= lt!424424 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19167))))

(assert (=> b!939275 e!527562))

(declare-fun c!97983 () Bool)

(assert (=> b!939275 (= c!97983 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!424414 () Unit!31742)

(declare-fun zeroValue!1173 () V!31999)

(declare-fun minValue!1173 () V!31999)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!319 (array!56494 array!56496 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 64) (_ BitVec 32) Int) Unit!31742)

(assert (=> b!939275 (= lt!424414 (lemmaListMapContainsThenArrayContainsFrom!319 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!939275 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19167)))

(declare-fun lt!424411 () Unit!31742)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56494 (_ BitVec 32) (_ BitVec 32)) Unit!31742)

(assert (=> b!939275 (= lt!424411 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5122 (ListLongMap!12089 (_ BitVec 64)) Bool)

(assert (=> b!939275 (contains!5122 lt!424413 k!1099)))

(declare-fun lt!424421 () tuple2!13392)

(declare-fun +!2847 (ListLongMap!12089 tuple2!13392) ListLongMap!12089)

(assert (=> b!939275 (= lt!424413 (+!2847 lt!424426 lt!424421))))

(declare-fun lt!424420 () Unit!31742)

(declare-fun addStillContains!566 (ListLongMap!12089 (_ BitVec 64) V!31999 (_ BitVec 64)) Unit!31742)

(assert (=> b!939275 (= lt!424420 (addStillContains!566 lt!424426 lt!424419 lt!424416 k!1099))))

(declare-fun getCurrentListMap!3294 (array!56494 array!56496 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 32) Int) ListLongMap!12089)

(assert (=> b!939275 (= (getCurrentListMap!3294 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2847 (getCurrentListMap!3294 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424421))))

(assert (=> b!939275 (= lt!424421 (tuple2!13393 lt!424419 lt!424416))))

(declare-fun get!14347 (ValueCell!9656 V!31999) V!31999)

(declare-fun dynLambda!1636 (Int (_ BitVec 64)) V!31999)

(assert (=> b!939275 (= lt!424416 (get!14347 (select (arr!27186 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1636 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424418 () Unit!31742)

(declare-fun lemmaListMapRecursiveValidKeyArray!237 (array!56494 array!56496 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 32) Int) Unit!31742)

(assert (=> b!939275 (= lt!424418 (lemmaListMapRecursiveValidKeyArray!237 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!939275 (= e!527568 lt!424412)))

(declare-fun b!939276 () Bool)

(declare-fun e!527563 () Bool)

(assert (=> b!939276 (= e!527558 e!527563)))

(declare-fun res!631795 () Bool)

(assert (=> b!939276 (=> (not res!631795) (not e!527563))))

(declare-fun lt!424423 () ListLongMap!12089)

(assert (=> b!939276 (= res!631795 (contains!5122 lt!424423 k!1099))))

(assert (=> b!939276 (= lt!424423 (getCurrentListMap!3294 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939277 () Bool)

(assert (=> b!939277 (= e!527563 (not true))))

(declare-fun lt!424410 () V!31999)

(declare-fun lt!424425 () ListLongMap!12089)

(assert (=> b!939277 (= lt!424410 (apply!861 lt!424425 k!1099))))

(declare-fun e!527560 () Bool)

(assert (=> b!939277 e!527560))

(declare-fun res!631798 () Bool)

(assert (=> b!939277 (=> (not res!631798) (not e!527560))))

(assert (=> b!939277 (= res!631798 (contains!5122 lt!424425 k!1099))))

(assert (=> b!939277 (= lt!424425 (getCurrentListMap!3294 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!424417 () Unit!31742)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!104 (array!56494 array!56496 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 64) V!31999 (_ BitVec 32) Int) Unit!31742)

(assert (=> b!939277 (= lt!424417 (lemmaListMapApplyFromThenApplyFromZero!104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939278 () Bool)

(declare-fun res!631793 () Bool)

(assert (=> b!939278 (=> (not res!631793) (not e!527565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56494 (_ BitVec 32)) Bool)

(assert (=> b!939278 (= res!631793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!631796 () Bool)

(assert (=> start!79870 (=> (not res!631796) (not e!527565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79870 (= res!631796 (validMask!0 mask!1881))))

(assert (=> start!79870 e!527565))

(assert (=> start!79870 true))

(assert (=> start!79870 tp_is_empty!20275))

(declare-fun e!527564 () Bool)

(declare-fun array_inv!21144 (array!56496) Bool)

(assert (=> start!79870 (and (array_inv!21144 _values!1231) e!527564)))

(assert (=> start!79870 tp!61764))

(declare-fun array_inv!21145 (array!56494) Bool)

(assert (=> start!79870 (array_inv!21145 _keys!1487)))

(declare-fun b!939269 () Bool)

(assert (=> b!939269 (= e!527556 e!527568)))

(assert (=> b!939269 (= lt!424419 (select (arr!27185 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97982 () Bool)

(assert (=> b!939269 (= c!97982 (validKeyInArray!0 lt!424419))))

(declare-fun b!939279 () Bool)

(declare-fun e!527566 () Bool)

(assert (=> b!939279 (= e!527566 tp_is_empty!20275)))

(declare-fun b!939280 () Bool)

(declare-fun res!631789 () Bool)

(assert (=> b!939280 (=> (not res!631789) (not e!527565))))

(assert (=> b!939280 (= res!631789 (and (= (size!27645 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27644 _keys!1487) (size!27645 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!939281 () Bool)

(declare-fun Unit!31745 () Unit!31742)

(assert (=> b!939281 (= e!527556 Unit!31745)))

(declare-fun b!939282 () Bool)

(assert (=> b!939282 (= e!527560 (= (apply!861 lt!424425 k!1099) v!791))))

(declare-fun b!939283 () Bool)

(declare-fun res!631797 () Bool)

(assert (=> b!939283 (=> (not res!631797) (not e!527563))))

(assert (=> b!939283 (= res!631797 (= (apply!861 lt!424423 k!1099) v!791))))

(declare-fun b!939284 () Bool)

(assert (=> b!939284 (= e!527564 (and e!527566 mapRes!32192))))

(declare-fun condMapEmpty!32192 () Bool)

(declare-fun mapDefault!32192 () ValueCell!9656)

