; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79092 () Bool)

(assert start!79092)

(declare-fun b_free!17305 () Bool)

(declare-fun b_next!17305 () Bool)

(assert (=> start!79092 (= b_free!17305 (not b_next!17305))))

(declare-fun tp!60355 () Bool)

(declare-fun b_and!28347 () Bool)

(assert (=> start!79092 (= tp!60355 b_and!28347)))

(declare-fun b!927871 () Bool)

(declare-fun e!520932 () Bool)

(declare-fun e!520938 () Bool)

(assert (=> b!927871 (= e!520932 e!520938)))

(declare-fun res!624923 () Bool)

(assert (=> b!927871 (=> (not res!624923) (not e!520938))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!31383 0))(
  ( (V!31384 (val!9957 Int)) )
))
(declare-fun lt!418356 () V!31383)

(declare-fun v!791 () V!31383)

(assert (=> b!927871 (= res!624923 (and (= lt!418356 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13002 0))(
  ( (tuple2!13003 (_1!6512 (_ BitVec 64)) (_2!6512 V!31383)) )
))
(declare-datatypes ((List!18802 0))(
  ( (Nil!18799) (Cons!18798 (h!19944 tuple2!13002) (t!26837 List!18802)) )
))
(declare-datatypes ((ListLongMap!11699 0))(
  ( (ListLongMap!11700 (toList!5865 List!18802)) )
))
(declare-fun lt!418350 () ListLongMap!11699)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!695 (ListLongMap!11699 (_ BitVec 64)) V!31383)

(assert (=> b!927871 (= lt!418356 (apply!695 lt!418350 k!1099))))

(declare-fun b!927872 () Bool)

(declare-fun e!520939 () Bool)

(declare-fun tp_is_empty!19813 () Bool)

(assert (=> b!927872 (= e!520939 tp_is_empty!19813)))

(declare-fun b!927873 () Bool)

(declare-fun res!624930 () Bool)

(declare-fun e!520931 () Bool)

(assert (=> b!927873 (=> (not res!624930) (not e!520931))))

(declare-datatypes ((array!55586 0))(
  ( (array!55587 (arr!26738 (Array (_ BitVec 32) (_ BitVec 64))) (size!27197 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55586)

(declare-datatypes ((List!18803 0))(
  ( (Nil!18800) (Cons!18799 (h!19945 (_ BitVec 64)) (t!26838 List!18803)) )
))
(declare-fun arrayNoDuplicates!0 (array!55586 (_ BitVec 32) List!18803) Bool)

(assert (=> b!927873 (= res!624930 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18800))))

(declare-fun b!927874 () Bool)

(declare-fun e!520933 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!927874 (= e!520933 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927875 () Bool)

(declare-fun e!520942 () Bool)

(declare-fun e!520940 () Bool)

(assert (=> b!927875 (= e!520942 e!520940)))

(declare-fun res!624928 () Bool)

(assert (=> b!927875 (=> (not res!624928) (not e!520940))))

(declare-fun lt!418353 () ListLongMap!11699)

(declare-fun contains!4923 (ListLongMap!11699 (_ BitVec 64)) Bool)

(assert (=> b!927875 (= res!624928 (contains!4923 lt!418353 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9425 0))(
  ( (ValueCellFull!9425 (v!12475 V!31383)) (EmptyCell!9425) )
))
(declare-datatypes ((array!55588 0))(
  ( (array!55589 (arr!26739 (Array (_ BitVec 32) ValueCell!9425)) (size!27198 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55588)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31383)

(declare-fun minValue!1173 () V!31383)

(declare-fun getCurrentListMap!3114 (array!55586 array!55588 (_ BitVec 32) (_ BitVec 32) V!31383 V!31383 (_ BitVec 32) Int) ListLongMap!11699)

(assert (=> b!927875 (= lt!418353 (getCurrentListMap!3114 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927876 () Bool)

(declare-fun res!624931 () Bool)

(assert (=> b!927876 (=> (not res!624931) (not e!520931))))

(assert (=> b!927876 (= res!624931 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27197 _keys!1487))))))

(declare-fun b!927877 () Bool)

(declare-fun lt!418360 () ListLongMap!11699)

(assert (=> b!927877 (= (apply!695 lt!418360 k!1099) lt!418356)))

(declare-fun lt!418357 () (_ BitVec 64))

(declare-datatypes ((Unit!31392 0))(
  ( (Unit!31393) )
))
(declare-fun lt!418351 () Unit!31392)

(declare-fun lt!418359 () V!31383)

(declare-fun addApplyDifferent!409 (ListLongMap!11699 (_ BitVec 64) V!31383 (_ BitVec 64)) Unit!31392)

(assert (=> b!927877 (= lt!418351 (addApplyDifferent!409 lt!418350 lt!418357 lt!418359 k!1099))))

(assert (=> b!927877 (not (= lt!418357 k!1099))))

(declare-fun lt!418346 () Unit!31392)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55586 (_ BitVec 64) (_ BitVec 32) List!18803) Unit!31392)

(assert (=> b!927877 (= lt!418346 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18800))))

(assert (=> b!927877 e!520933))

(declare-fun c!96933 () Bool)

(assert (=> b!927877 (= c!96933 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418355 () Unit!31392)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!260 (array!55586 array!55588 (_ BitVec 32) (_ BitVec 32) V!31383 V!31383 (_ BitVec 64) (_ BitVec 32) Int) Unit!31392)

(assert (=> b!927877 (= lt!418355 (lemmaListMapContainsThenArrayContainsFrom!260 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!927877 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18800)))

(declare-fun lt!418348 () Unit!31392)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55586 (_ BitVec 32) (_ BitVec 32)) Unit!31392)

(assert (=> b!927877 (= lt!418348 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927877 (contains!4923 lt!418360 k!1099)))

(declare-fun lt!418345 () tuple2!13002)

(declare-fun +!2753 (ListLongMap!11699 tuple2!13002) ListLongMap!11699)

(assert (=> b!927877 (= lt!418360 (+!2753 lt!418350 lt!418345))))

(declare-fun lt!418349 () Unit!31392)

(declare-fun addStillContains!477 (ListLongMap!11699 (_ BitVec 64) V!31383 (_ BitVec 64)) Unit!31392)

(assert (=> b!927877 (= lt!418349 (addStillContains!477 lt!418350 lt!418357 lt!418359 k!1099))))

(assert (=> b!927877 (= (getCurrentListMap!3114 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2753 (getCurrentListMap!3114 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418345))))

(assert (=> b!927877 (= lt!418345 (tuple2!13003 lt!418357 lt!418359))))

(declare-fun get!14078 (ValueCell!9425 V!31383) V!31383)

(declare-fun dynLambda!1542 (Int (_ BitVec 64)) V!31383)

(assert (=> b!927877 (= lt!418359 (get!14078 (select (arr!26739 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1542 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418347 () Unit!31392)

(declare-fun lemmaListMapRecursiveValidKeyArray!143 (array!55586 array!55588 (_ BitVec 32) (_ BitVec 32) V!31383 V!31383 (_ BitVec 32) Int) Unit!31392)

(assert (=> b!927877 (= lt!418347 (lemmaListMapRecursiveValidKeyArray!143 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520936 () Unit!31392)

(assert (=> b!927877 (= e!520936 lt!418351)))

(declare-fun b!927878 () Bool)

(declare-fun e!520930 () Unit!31392)

(assert (=> b!927878 (= e!520930 e!520936)))

(assert (=> b!927878 (= lt!418357 (select (arr!26738 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96932 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927878 (= c!96932 (validKeyInArray!0 lt!418357))))

(declare-fun res!624924 () Bool)

(assert (=> start!79092 (=> (not res!624924) (not e!520931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79092 (= res!624924 (validMask!0 mask!1881))))

(assert (=> start!79092 e!520931))

(assert (=> start!79092 true))

(assert (=> start!79092 tp_is_empty!19813))

(declare-fun e!520937 () Bool)

(declare-fun array_inv!20818 (array!55588) Bool)

(assert (=> start!79092 (and (array_inv!20818 _values!1231) e!520937)))

(assert (=> start!79092 tp!60355))

(declare-fun array_inv!20819 (array!55586) Bool)

(assert (=> start!79092 (array_inv!20819 _keys!1487)))

(declare-fun mapNonEmpty!31476 () Bool)

(declare-fun mapRes!31476 () Bool)

(declare-fun tp!60356 () Bool)

(declare-fun e!520941 () Bool)

(assert (=> mapNonEmpty!31476 (= mapRes!31476 (and tp!60356 e!520941))))

(declare-fun mapValue!31476 () ValueCell!9425)

(declare-fun mapRest!31476 () (Array (_ BitVec 32) ValueCell!9425))

(declare-fun mapKey!31476 () (_ BitVec 32))

(assert (=> mapNonEmpty!31476 (= (arr!26739 _values!1231) (store mapRest!31476 mapKey!31476 mapValue!31476))))

(declare-fun b!927879 () Bool)

(assert (=> b!927879 (= e!520937 (and e!520939 mapRes!31476))))

(declare-fun condMapEmpty!31476 () Bool)

(declare-fun mapDefault!31476 () ValueCell!9425)

