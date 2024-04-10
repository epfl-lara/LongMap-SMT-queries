; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79692 () Bool)

(assert start!79692)

(declare-fun b_free!17741 () Bool)

(declare-fun b_next!17741 () Bool)

(assert (=> start!79692 (= b_free!17741 (not b_next!17741))))

(declare-fun tp!61678 () Bool)

(declare-fun b_and!29073 () Bool)

(assert (=> start!79692 (= tp!61678 b_and!29073)))

(declare-fun b!937488 () Bool)

(declare-fun e!526439 () Bool)

(declare-fun e!526440 () Bool)

(assert (=> b!937488 (= e!526439 e!526440)))

(declare-fun res!630975 () Bool)

(assert (=> b!937488 (=> (not res!630975) (not e!526440))))

(declare-datatypes ((V!31963 0))(
  ( (V!31964 (val!10175 Int)) )
))
(declare-datatypes ((tuple2!13366 0))(
  ( (tuple2!13367 (_1!6694 (_ BitVec 64)) (_2!6694 V!31963)) )
))
(declare-datatypes ((List!19145 0))(
  ( (Nil!19142) (Cons!19141 (h!20287 tuple2!13366) (t!27430 List!19145)) )
))
(declare-datatypes ((ListLongMap!12063 0))(
  ( (ListLongMap!12064 (toList!6047 List!19145)) )
))
(declare-fun lt!423051 () ListLongMap!12063)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5106 (ListLongMap!12063 (_ BitVec 64)) Bool)

(assert (=> b!937488 (= res!630975 (contains!5106 lt!423051 k!1099))))

(declare-datatypes ((array!56438 0))(
  ( (array!56439 (arr!27159 (Array (_ BitVec 32) (_ BitVec 64))) (size!27618 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56438)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9643 0))(
  ( (ValueCellFull!9643 (v!12700 V!31963)) (EmptyCell!9643) )
))
(declare-datatypes ((array!56440 0))(
  ( (array!56441 (arr!27160 (Array (_ BitVec 32) ValueCell!9643)) (size!27619 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56440)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31963)

(declare-fun minValue!1173 () V!31963)

(declare-fun getCurrentListMap!3282 (array!56438 array!56440 (_ BitVec 32) (_ BitVec 32) V!31963 V!31963 (_ BitVec 32) Int) ListLongMap!12063)

(assert (=> b!937488 (= lt!423051 (getCurrentListMap!3282 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937489 () Bool)

(declare-fun e!526442 () Bool)

(declare-fun tp_is_empty!20249 () Bool)

(assert (=> b!937489 (= e!526442 tp_is_empty!20249)))

(declare-fun b!937490 () Bool)

(declare-datatypes ((Unit!31654 0))(
  ( (Unit!31655) )
))
(declare-fun e!526443 () Unit!31654)

(declare-fun e!526437 () Unit!31654)

(assert (=> b!937490 (= e!526443 e!526437)))

(declare-fun lt!423041 () (_ BitVec 64))

(assert (=> b!937490 (= lt!423041 (select (arr!27159 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97585 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937490 (= c!97585 (validKeyInArray!0 lt!423041))))

(declare-fun b!937491 () Bool)

(declare-fun e!526446 () Bool)

(assert (=> b!937491 (= e!526446 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937492 () Bool)

(declare-fun lt!423050 () ListLongMap!12063)

(declare-fun lt!423044 () V!31963)

(declare-fun apply!849 (ListLongMap!12063 (_ BitVec 64)) V!31963)

(assert (=> b!937492 (= (apply!849 lt!423050 k!1099) lt!423044)))

(declare-fun lt!423047 () Unit!31654)

(declare-fun lt!423053 () V!31963)

(declare-fun addApplyDifferent!435 (ListLongMap!12063 (_ BitVec 64) V!31963 (_ BitVec 64)) Unit!31654)

(assert (=> b!937492 (= lt!423047 (addApplyDifferent!435 lt!423051 lt!423041 lt!423053 k!1099))))

(assert (=> b!937492 (not (= lt!423041 k!1099))))

(declare-fun lt!423043 () Unit!31654)

(declare-datatypes ((List!19146 0))(
  ( (Nil!19143) (Cons!19142 (h!20288 (_ BitVec 64)) (t!27431 List!19146)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56438 (_ BitVec 64) (_ BitVec 32) List!19146) Unit!31654)

(assert (=> b!937492 (= lt!423043 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19143))))

(assert (=> b!937492 e!526446))

(declare-fun c!97587 () Bool)

(assert (=> b!937492 (= c!97587 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423046 () Unit!31654)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!308 (array!56438 array!56440 (_ BitVec 32) (_ BitVec 32) V!31963 V!31963 (_ BitVec 64) (_ BitVec 32) Int) Unit!31654)

(assert (=> b!937492 (= lt!423046 (lemmaListMapContainsThenArrayContainsFrom!308 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56438 (_ BitVec 32) List!19146) Bool)

(assert (=> b!937492 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19143)))

(declare-fun lt!423052 () Unit!31654)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56438 (_ BitVec 32) (_ BitVec 32)) Unit!31654)

(assert (=> b!937492 (= lt!423052 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937492 (contains!5106 lt!423050 k!1099)))

(declare-fun lt!423048 () tuple2!13366)

(declare-fun +!2836 (ListLongMap!12063 tuple2!13366) ListLongMap!12063)

(assert (=> b!937492 (= lt!423050 (+!2836 lt!423051 lt!423048))))

(declare-fun lt!423042 () Unit!31654)

(declare-fun addStillContains!555 (ListLongMap!12063 (_ BitVec 64) V!31963 (_ BitVec 64)) Unit!31654)

(assert (=> b!937492 (= lt!423042 (addStillContains!555 lt!423051 lt!423041 lt!423053 k!1099))))

(assert (=> b!937492 (= (getCurrentListMap!3282 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2836 (getCurrentListMap!3282 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423048))))

(assert (=> b!937492 (= lt!423048 (tuple2!13367 lt!423041 lt!423053))))

(declare-fun get!14320 (ValueCell!9643 V!31963) V!31963)

(declare-fun dynLambda!1625 (Int (_ BitVec 64)) V!31963)

(assert (=> b!937492 (= lt!423053 (get!14320 (select (arr!27160 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1625 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423045 () Unit!31654)

(declare-fun lemmaListMapRecursiveValidKeyArray!226 (array!56438 array!56440 (_ BitVec 32) (_ BitVec 32) V!31963 V!31963 (_ BitVec 32) Int) Unit!31654)

(assert (=> b!937492 (= lt!423045 (lemmaListMapRecursiveValidKeyArray!226 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937492 (= e!526437 lt!423047)))

(declare-fun b!937493 () Bool)

(declare-fun res!630976 () Bool)

(assert (=> b!937493 (=> (not res!630976) (not e!526439))))

(assert (=> b!937493 (= res!630976 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27618 _keys!1487))))))

(declare-fun b!937494 () Bool)

(declare-fun e!526441 () Bool)

(declare-fun mapRes!32145 () Bool)

(assert (=> b!937494 (= e!526441 (and e!526442 mapRes!32145))))

(declare-fun condMapEmpty!32145 () Bool)

(declare-fun mapDefault!32145 () ValueCell!9643)

