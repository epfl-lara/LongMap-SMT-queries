; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79688 () Bool)

(assert start!79688)

(declare-fun b_free!17737 () Bool)

(declare-fun b_next!17737 () Bool)

(assert (=> start!79688 (= b_free!17737 (not b_next!17737))))

(declare-fun tp!61666 () Bool)

(declare-fun b_and!29065 () Bool)

(assert (=> start!79688 (= tp!61666 b_and!29065)))

(declare-fun b!937388 () Bool)

(declare-fun e!526378 () Bool)

(declare-fun e!526386 () Bool)

(assert (=> b!937388 (= e!526378 e!526386)))

(declare-fun res!630937 () Bool)

(assert (=> b!937388 (=> (not res!630937) (not e!526386))))

(declare-datatypes ((V!31959 0))(
  ( (V!31960 (val!10173 Int)) )
))
(declare-datatypes ((tuple2!13362 0))(
  ( (tuple2!13363 (_1!6692 (_ BitVec 64)) (_2!6692 V!31959)) )
))
(declare-datatypes ((List!19141 0))(
  ( (Nil!19138) (Cons!19137 (h!20283 tuple2!13362) (t!27422 List!19141)) )
))
(declare-datatypes ((ListLongMap!12059 0))(
  ( (ListLongMap!12060 (toList!6045 List!19141)) )
))
(declare-fun lt!422968 () ListLongMap!12059)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5104 (ListLongMap!12059 (_ BitVec 64)) Bool)

(assert (=> b!937388 (= res!630937 (contains!5104 lt!422968 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9641 0))(
  ( (ValueCellFull!9641 (v!12698 V!31959)) (EmptyCell!9641) )
))
(declare-datatypes ((array!56430 0))(
  ( (array!56431 (arr!27155 (Array (_ BitVec 32) ValueCell!9641)) (size!27614 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56430)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((array!56432 0))(
  ( (array!56433 (arr!27156 (Array (_ BitVec 32) (_ BitVec 64))) (size!27615 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56432)

(declare-fun zeroValue!1173 () V!31959)

(declare-fun minValue!1173 () V!31959)

(declare-fun getCurrentListMap!3280 (array!56432 array!56430 (_ BitVec 32) (_ BitVec 32) V!31959 V!31959 (_ BitVec 32) Int) ListLongMap!12059)

(assert (=> b!937388 (= lt!422968 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!32139 () Bool)

(declare-fun mapRes!32139 () Bool)

(assert (=> mapIsEmpty!32139 mapRes!32139))

(declare-fun b!937389 () Bool)

(declare-fun e!526377 () Bool)

(declare-fun tp_is_empty!20245 () Bool)

(assert (=> b!937389 (= e!526377 tp_is_empty!20245)))

(declare-fun b!937390 () Bool)

(declare-fun e!526384 () Bool)

(assert (=> b!937390 (= e!526384 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937391 () Bool)

(declare-fun res!630931 () Bool)

(assert (=> b!937391 (=> (not res!630931) (not e!526378))))

(declare-datatypes ((List!19142 0))(
  ( (Nil!19139) (Cons!19138 (h!20284 (_ BitVec 64)) (t!27423 List!19142)) )
))
(declare-fun arrayNoDuplicates!0 (array!56432 (_ BitVec 32) List!19142) Bool)

(assert (=> b!937391 (= res!630931 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19139))))

(declare-fun b!937392 () Bool)

(declare-fun res!630935 () Bool)

(assert (=> b!937392 (=> (not res!630935) (not e!526378))))

(assert (=> b!937392 (= res!630935 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27615 _keys!1487))))))

(declare-fun b!937393 () Bool)

(declare-fun e!526382 () Bool)

(assert (=> b!937393 (= e!526382 false)))

(declare-datatypes ((Unit!31647 0))(
  ( (Unit!31648) )
))
(declare-fun lt!422973 () Unit!31647)

(declare-fun e!526383 () Unit!31647)

(assert (=> b!937393 (= lt!422973 e!526383)))

(declare-fun c!97569 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937393 (= c!97569 (validKeyInArray!0 k!1099))))

(declare-fun b!937394 () Bool)

(declare-fun lt!422974 () ListLongMap!12059)

(declare-fun lt!422965 () V!31959)

(declare-fun apply!847 (ListLongMap!12059 (_ BitVec 64)) V!31959)

(assert (=> b!937394 (= (apply!847 lt!422974 k!1099) lt!422965)))

(declare-fun lt!422975 () Unit!31647)

(declare-fun lt!422970 () V!31959)

(declare-fun lt!422969 () (_ BitVec 64))

(declare-fun addApplyDifferent!433 (ListLongMap!12059 (_ BitVec 64) V!31959 (_ BitVec 64)) Unit!31647)

(assert (=> b!937394 (= lt!422975 (addApplyDifferent!433 lt!422968 lt!422969 lt!422970 k!1099))))

(assert (=> b!937394 (not (= lt!422969 k!1099))))

(declare-fun lt!422972 () Unit!31647)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56432 (_ BitVec 64) (_ BitVec 32) List!19142) Unit!31647)

(assert (=> b!937394 (= lt!422972 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19139))))

(assert (=> b!937394 e!526384))

(declare-fun c!97568 () Bool)

(assert (=> b!937394 (= c!97568 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422966 () Unit!31647)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!306 (array!56432 array!56430 (_ BitVec 32) (_ BitVec 32) V!31959 V!31959 (_ BitVec 64) (_ BitVec 32) Int) Unit!31647)

(assert (=> b!937394 (= lt!422966 (lemmaListMapContainsThenArrayContainsFrom!306 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!937394 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19139)))

(declare-fun lt!422967 () Unit!31647)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56432 (_ BitVec 32) (_ BitVec 32)) Unit!31647)

(assert (=> b!937394 (= lt!422967 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937394 (contains!5104 lt!422974 k!1099)))

(declare-fun lt!422964 () tuple2!13362)

(declare-fun +!2834 (ListLongMap!12059 tuple2!13362) ListLongMap!12059)

(assert (=> b!937394 (= lt!422974 (+!2834 lt!422968 lt!422964))))

(declare-fun lt!422971 () Unit!31647)

(declare-fun addStillContains!553 (ListLongMap!12059 (_ BitVec 64) V!31959 (_ BitVec 64)) Unit!31647)

(assert (=> b!937394 (= lt!422971 (addStillContains!553 lt!422968 lt!422969 lt!422970 k!1099))))

(assert (=> b!937394 (= (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2834 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422964))))

(assert (=> b!937394 (= lt!422964 (tuple2!13363 lt!422969 lt!422970))))

(declare-fun get!14318 (ValueCell!9641 V!31959) V!31959)

(declare-fun dynLambda!1623 (Int (_ BitVec 64)) V!31959)

(assert (=> b!937394 (= lt!422970 (get!14318 (select (arr!27155 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1623 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422963 () Unit!31647)

(declare-fun lemmaListMapRecursiveValidKeyArray!224 (array!56432 array!56430 (_ BitVec 32) (_ BitVec 32) V!31959 V!31959 (_ BitVec 32) Int) Unit!31647)

(assert (=> b!937394 (= lt!422963 (lemmaListMapRecursiveValidKeyArray!224 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526381 () Unit!31647)

(assert (=> b!937394 (= e!526381 lt!422975)))

(declare-fun b!937395 () Bool)

(assert (=> b!937395 (= e!526383 e!526381)))

(assert (=> b!937395 (= lt!422969 (select (arr!27156 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97567 () Bool)

(assert (=> b!937395 (= c!97567 (validKeyInArray!0 lt!422969))))

(declare-fun b!937396 () Bool)

(declare-fun res!630936 () Bool)

(assert (=> b!937396 (=> (not res!630936) (not e!526378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56432 (_ BitVec 32)) Bool)

(assert (=> b!937396 (= res!630936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!32139 () Bool)

(declare-fun tp!61667 () Bool)

(declare-fun e!526380 () Bool)

(assert (=> mapNonEmpty!32139 (= mapRes!32139 (and tp!61667 e!526380))))

(declare-fun mapRest!32139 () (Array (_ BitVec 32) ValueCell!9641))

(declare-fun mapValue!32139 () ValueCell!9641)

(declare-fun mapKey!32139 () (_ BitVec 32))

(assert (=> mapNonEmpty!32139 (= (arr!27155 _values!1231) (store mapRest!32139 mapKey!32139 mapValue!32139))))

(declare-fun b!937397 () Bool)

(declare-fun arrayContainsKey!0 (array!56432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937397 (= e!526384 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!937398 () Bool)

(assert (=> b!937398 (= e!526380 tp_is_empty!20245)))

(declare-fun b!937399 () Bool)

(declare-fun Unit!31649 () Unit!31647)

(assert (=> b!937399 (= e!526383 Unit!31649)))

(declare-fun b!937400 () Bool)

(assert (=> b!937400 (= e!526386 e!526382)))

(declare-fun res!630933 () Bool)

(assert (=> b!937400 (=> (not res!630933) (not e!526382))))

(declare-fun v!791 () V!31959)

(assert (=> b!937400 (= res!630933 (and (= lt!422965 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937400 (= lt!422965 (apply!847 lt!422968 k!1099))))

(declare-fun res!630934 () Bool)

(assert (=> start!79688 (=> (not res!630934) (not e!526378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79688 (= res!630934 (validMask!0 mask!1881))))

(assert (=> start!79688 e!526378))

(assert (=> start!79688 true))

(assert (=> start!79688 tp_is_empty!20245))

(declare-fun e!526385 () Bool)

(declare-fun array_inv!21126 (array!56430) Bool)

(assert (=> start!79688 (and (array_inv!21126 _values!1231) e!526385)))

(assert (=> start!79688 tp!61666))

(declare-fun array_inv!21127 (array!56432) Bool)

(assert (=> start!79688 (array_inv!21127 _keys!1487)))

(declare-fun b!937401 () Bool)

(declare-fun res!630932 () Bool)

(assert (=> b!937401 (=> (not res!630932) (not e!526378))))

(assert (=> b!937401 (= res!630932 (and (= (size!27614 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27615 _keys!1487) (size!27614 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937402 () Bool)

(assert (=> b!937402 (= e!526385 (and e!526377 mapRes!32139))))

(declare-fun condMapEmpty!32139 () Bool)

(declare-fun mapDefault!32139 () ValueCell!9641)

