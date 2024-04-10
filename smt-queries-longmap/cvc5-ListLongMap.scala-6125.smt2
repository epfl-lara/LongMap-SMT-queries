; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78858 () Bool)

(assert start!78858)

(declare-fun b_free!17071 () Bool)

(declare-fun b_next!17071 () Bool)

(assert (=> start!78858 (= b_free!17071 (not b_next!17071))))

(declare-fun tp!59654 () Bool)

(declare-fun b_and!27879 () Bool)

(assert (=> start!78858 (= tp!59654 b_and!27879)))

(declare-fun b!921315 () Bool)

(declare-fun res!621304 () Bool)

(declare-fun e!517019 () Bool)

(assert (=> b!921315 (=> (not res!621304) (not e!517019))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921315 (= res!621304 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921316 () Bool)

(declare-fun e!517024 () Bool)

(declare-fun e!517023 () Bool)

(assert (=> b!921316 (= e!517024 (not e!517023))))

(declare-fun res!621298 () Bool)

(assert (=> b!921316 (=> res!621298 e!517023)))

(declare-datatypes ((array!55136 0))(
  ( (array!55137 (arr!26513 (Array (_ BitVec 32) (_ BitVec 64))) (size!26972 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55136)

(assert (=> b!921316 (= res!621298 (or (bvsge (size!26972 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26972 _keys!1487))))))

(declare-fun e!517021 () Bool)

(assert (=> b!921316 e!517021))

(declare-fun c!96108 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!921316 (= c!96108 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31086 0))(
  ( (Unit!31087) )
))
(declare-fun lt!413639 () Unit!31086)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31071 0))(
  ( (V!31072 (val!9840 Int)) )
))
(declare-datatypes ((ValueCell!9308 0))(
  ( (ValueCellFull!9308 (v!12358 V!31071)) (EmptyCell!9308) )
))
(declare-datatypes ((array!55138 0))(
  ( (array!55139 (arr!26514 (Array (_ BitVec 32) ValueCell!9308)) (size!26973 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55138)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31071)

(declare-fun minValue!1173 () V!31071)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!176 (array!55136 array!55138 (_ BitVec 32) (_ BitVec 32) V!31071 V!31071 (_ BitVec 64) (_ BitVec 32) Int) Unit!31086)

(assert (=> b!921316 (= lt!413639 (lemmaListMapContainsThenArrayContainsFrom!176 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!18600 0))(
  ( (Nil!18597) (Cons!18596 (h!19742 (_ BitVec 64)) (t!26401 List!18600)) )
))
(declare-fun arrayNoDuplicates!0 (array!55136 (_ BitVec 32) List!18600) Bool)

(assert (=> b!921316 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18597)))

(declare-fun lt!413633 () Unit!31086)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55136 (_ BitVec 32) (_ BitVec 32)) Unit!31086)

(assert (=> b!921316 (= lt!413633 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12796 0))(
  ( (tuple2!12797 (_1!6409 (_ BitVec 64)) (_2!6409 V!31071)) )
))
(declare-datatypes ((List!18601 0))(
  ( (Nil!18598) (Cons!18597 (h!19743 tuple2!12796) (t!26402 List!18601)) )
))
(declare-datatypes ((ListLongMap!11493 0))(
  ( (ListLongMap!11494 (toList!5762 List!18601)) )
))
(declare-fun lt!413638 () ListLongMap!11493)

(declare-fun lt!413640 () tuple2!12796)

(declare-fun contains!4820 (ListLongMap!11493 (_ BitVec 64)) Bool)

(declare-fun +!2669 (ListLongMap!11493 tuple2!12796) ListLongMap!11493)

(assert (=> b!921316 (contains!4820 (+!2669 lt!413638 lt!413640) k!1099)))

(declare-fun lt!413635 () (_ BitVec 64))

(declare-fun lt!413637 () Unit!31086)

(declare-fun lt!413641 () V!31071)

(declare-fun addStillContains!393 (ListLongMap!11493 (_ BitVec 64) V!31071 (_ BitVec 64)) Unit!31086)

(assert (=> b!921316 (= lt!413637 (addStillContains!393 lt!413638 lt!413635 lt!413641 k!1099))))

(declare-fun getCurrentListMap!3016 (array!55136 array!55138 (_ BitVec 32) (_ BitVec 32) V!31071 V!31071 (_ BitVec 32) Int) ListLongMap!11493)

(assert (=> b!921316 (= (getCurrentListMap!3016 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2669 (getCurrentListMap!3016 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413640))))

(assert (=> b!921316 (= lt!413640 (tuple2!12797 lt!413635 lt!413641))))

(declare-fun get!13916 (ValueCell!9308 V!31071) V!31071)

(declare-fun dynLambda!1458 (Int (_ BitVec 64)) V!31071)

(assert (=> b!921316 (= lt!413641 (get!13916 (select (arr!26514 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1458 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413634 () Unit!31086)

(declare-fun lemmaListMapRecursiveValidKeyArray!59 (array!55136 array!55138 (_ BitVec 32) (_ BitVec 32) V!31071 V!31071 (_ BitVec 32) Int) Unit!31086)

(assert (=> b!921316 (= lt!413634 (lemmaListMapRecursiveValidKeyArray!59 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921317 () Bool)

(declare-fun e!517016 () Bool)

(declare-fun tp_is_empty!19579 () Bool)

(assert (=> b!921317 (= e!517016 tp_is_empty!19579)))

(declare-fun mapIsEmpty!31125 () Bool)

(declare-fun mapRes!31125 () Bool)

(assert (=> mapIsEmpty!31125 mapRes!31125))

(declare-fun b!921318 () Bool)

(declare-fun e!517018 () Bool)

(declare-fun e!517020 () Bool)

(assert (=> b!921318 (= e!517018 (and e!517020 mapRes!31125))))

(declare-fun condMapEmpty!31125 () Bool)

(declare-fun mapDefault!31125 () ValueCell!9308)

