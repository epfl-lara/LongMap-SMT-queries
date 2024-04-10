; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79072 () Bool)

(assert start!79072)

(declare-fun b_free!17285 () Bool)

(declare-fun b_next!17285 () Bool)

(assert (=> start!79072 (= b_free!17285 (not b_next!17285))))

(declare-fun tp!60296 () Bool)

(declare-fun b_and!28307 () Bool)

(assert (=> start!79072 (= tp!60296 b_and!28307)))

(declare-fun b!927251 () Bool)

(declare-fun res!624593 () Bool)

(declare-fun e!520550 () Bool)

(assert (=> b!927251 (=> (not res!624593) (not e!520550))))

(declare-datatypes ((array!55548 0))(
  ( (array!55549 (arr!26719 (Array (_ BitVec 32) (_ BitVec 64))) (size!27178 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55548)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55548 (_ BitVec 32)) Bool)

(assert (=> b!927251 (= res!624593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927252 () Bool)

(declare-fun e!520541 () Bool)

(declare-fun tp_is_empty!19793 () Bool)

(assert (=> b!927252 (= e!520541 tp_is_empty!19793)))

(declare-fun b!927254 () Bool)

(declare-fun e!520549 () Bool)

(declare-fun e!520551 () Bool)

(assert (=> b!927254 (= e!520549 e!520551)))

(declare-fun res!624591 () Bool)

(assert (=> b!927254 (=> (not res!624591) (not e!520551))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!927254 (= res!624591 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27178 _keys!1487)))))

(declare-datatypes ((Unit!31355 0))(
  ( (Unit!31356) )
))
(declare-fun lt!417868 () Unit!31355)

(declare-fun e!520544 () Unit!31355)

(assert (=> b!927254 (= lt!417868 e!520544)))

(declare-fun c!96841 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927254 (= c!96841 (validKeyInArray!0 k!1099))))

(declare-fun b!927255 () Bool)

(declare-fun e!520548 () Unit!31355)

(declare-fun Unit!31357 () Unit!31355)

(assert (=> b!927255 (= e!520548 Unit!31357)))

(declare-fun b!927256 () Bool)

(declare-fun e!520540 () Bool)

(assert (=> b!927256 (= e!520550 e!520540)))

(declare-fun res!624592 () Bool)

(assert (=> b!927256 (=> (not res!624592) (not e!520540))))

(declare-datatypes ((V!31355 0))(
  ( (V!31356 (val!9947 Int)) )
))
(declare-datatypes ((tuple2!12984 0))(
  ( (tuple2!12985 (_1!6503 (_ BitVec 64)) (_2!6503 V!31355)) )
))
(declare-datatypes ((List!18785 0))(
  ( (Nil!18782) (Cons!18781 (h!19927 tuple2!12984) (t!26800 List!18785)) )
))
(declare-datatypes ((ListLongMap!11681 0))(
  ( (ListLongMap!11682 (toList!5856 List!18785)) )
))
(declare-fun lt!417875 () ListLongMap!11681)

(declare-fun contains!4914 (ListLongMap!11681 (_ BitVec 64)) Bool)

(assert (=> b!927256 (= res!624592 (contains!4914 lt!417875 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9415 0))(
  ( (ValueCellFull!9415 (v!12465 V!31355)) (EmptyCell!9415) )
))
(declare-datatypes ((array!55550 0))(
  ( (array!55551 (arr!26720 (Array (_ BitVec 32) ValueCell!9415)) (size!27179 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55550)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31355)

(declare-fun minValue!1173 () V!31355)

(declare-fun getCurrentListMap!3105 (array!55548 array!55550 (_ BitVec 32) (_ BitVec 32) V!31355 V!31355 (_ BitVec 32) Int) ListLongMap!11681)

(assert (=> b!927256 (= lt!417875 (getCurrentListMap!3105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927257 () Bool)

(declare-fun e!520547 () Bool)

(assert (=> b!927257 (= e!520547 (not true))))

(declare-fun e!520546 () Bool)

(assert (=> b!927257 e!520546))

(declare-fun res!624596 () Bool)

(assert (=> b!927257 (=> (not res!624596) (not e!520546))))

(declare-fun lt!417871 () ListLongMap!11681)

(assert (=> b!927257 (= res!624596 (contains!4914 lt!417871 k!1099))))

(assert (=> b!927257 (= lt!417871 (getCurrentListMap!3105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31355)

(declare-fun lt!417880 () Unit!31355)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!87 (array!55548 array!55550 (_ BitVec 32) (_ BitVec 32) V!31355 V!31355 (_ BitVec 64) V!31355 (_ BitVec 32) Int) Unit!31355)

(assert (=> b!927257 (= lt!417880 (lemmaListMapApplyFromThenApplyFromZero!87 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927258 () Bool)

(declare-fun res!624597 () Bool)

(assert (=> b!927258 (=> (not res!624597) (not e!520550))))

(assert (=> b!927258 (= res!624597 (and (= (size!27179 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27178 _keys!1487) (size!27179 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927259 () Bool)

(declare-fun e!520542 () Bool)

(assert (=> b!927259 (= e!520542 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927260 () Bool)

(declare-fun res!624601 () Bool)

(assert (=> b!927260 (=> (not res!624601) (not e!520547))))

(declare-fun lt!417872 () ListLongMap!11681)

(declare-fun apply!686 (ListLongMap!11681 (_ BitVec 64)) V!31355)

(assert (=> b!927260 (= res!624601 (= (apply!686 lt!417872 k!1099) v!791))))

(declare-fun b!927261 () Bool)

(declare-fun res!624595 () Bool)

(assert (=> b!927261 (=> (not res!624595) (not e!520550))))

(declare-datatypes ((List!18786 0))(
  ( (Nil!18783) (Cons!18782 (h!19928 (_ BitVec 64)) (t!26801 List!18786)) )
))
(declare-fun arrayNoDuplicates!0 (array!55548 (_ BitVec 32) List!18786) Bool)

(assert (=> b!927261 (= res!624595 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18783))))

(declare-fun b!927262 () Bool)

(declare-fun Unit!31358 () Unit!31355)

(assert (=> b!927262 (= e!520544 Unit!31358)))

(declare-fun mapNonEmpty!31446 () Bool)

(declare-fun mapRes!31446 () Bool)

(declare-fun tp!60295 () Bool)

(declare-fun e!520552 () Bool)

(assert (=> mapNonEmpty!31446 (= mapRes!31446 (and tp!60295 e!520552))))

(declare-fun mapKey!31446 () (_ BitVec 32))

(declare-fun mapRest!31446 () (Array (_ BitVec 32) ValueCell!9415))

(declare-fun mapValue!31446 () ValueCell!9415)

(assert (=> mapNonEmpty!31446 (= (arr!26720 _values!1231) (store mapRest!31446 mapKey!31446 mapValue!31446))))

(declare-fun b!927263 () Bool)

(assert (=> b!927263 (= e!520540 e!520549)))

(declare-fun res!624600 () Bool)

(assert (=> b!927263 (=> (not res!624600) (not e!520549))))

(declare-fun lt!417874 () V!31355)

(assert (=> b!927263 (= res!624600 (and (= lt!417874 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927263 (= lt!417874 (apply!686 lt!417875 k!1099))))

(declare-fun mapIsEmpty!31446 () Bool)

(assert (=> mapIsEmpty!31446 mapRes!31446))

(declare-fun b!927253 () Bool)

(assert (=> b!927253 (= e!520544 e!520548)))

(declare-fun lt!417867 () (_ BitVec 64))

(assert (=> b!927253 (= lt!417867 (select (arr!26719 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96842 () Bool)

(assert (=> b!927253 (= c!96842 (validKeyInArray!0 lt!417867))))

(declare-fun res!624594 () Bool)

(assert (=> start!79072 (=> (not res!624594) (not e!520550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79072 (= res!624594 (validMask!0 mask!1881))))

(assert (=> start!79072 e!520550))

(assert (=> start!79072 true))

(assert (=> start!79072 tp_is_empty!19793))

(declare-fun e!520543 () Bool)

(declare-fun array_inv!20806 (array!55550) Bool)

(assert (=> start!79072 (and (array_inv!20806 _values!1231) e!520543)))

(assert (=> start!79072 tp!60296))

(declare-fun array_inv!20807 (array!55548) Bool)

(assert (=> start!79072 (array_inv!20807 _keys!1487)))

(declare-fun b!927264 () Bool)

(assert (=> b!927264 (= e!520552 tp_is_empty!19793)))

(declare-fun b!927265 () Bool)

(declare-fun arrayContainsKey!0 (array!55548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927265 (= e!520542 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!927266 () Bool)

(assert (=> b!927266 (= e!520551 e!520547)))

(declare-fun res!624598 () Bool)

(assert (=> b!927266 (=> (not res!624598) (not e!520547))))

(assert (=> b!927266 (= res!624598 (contains!4914 lt!417872 k!1099))))

(assert (=> b!927266 (= lt!417872 (getCurrentListMap!3105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927267 () Bool)

(declare-fun res!624599 () Bool)

(assert (=> b!927267 (=> (not res!624599) (not e!520550))))

(assert (=> b!927267 (= res!624599 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27178 _keys!1487))))))

(declare-fun b!927268 () Bool)

(assert (=> b!927268 (= e!520543 (and e!520541 mapRes!31446))))

(declare-fun condMapEmpty!31446 () Bool)

(declare-fun mapDefault!31446 () ValueCell!9415)

