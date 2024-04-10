; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78870 () Bool)

(assert start!78870)

(declare-fun b_free!17083 () Bool)

(declare-fun b_next!17083 () Bool)

(assert (=> start!78870 (= b_free!17083 (not b_next!17083))))

(declare-fun tp!59689 () Bool)

(declare-fun b_and!27903 () Bool)

(assert (=> start!78870 (= tp!59689 b_and!27903)))

(declare-fun b!921651 () Bool)

(declare-fun e!517185 () Bool)

(declare-fun tp_is_empty!19591 () Bool)

(assert (=> b!921651 (= e!517185 tp_is_empty!19591)))

(declare-fun b!921652 () Bool)

(declare-fun e!517180 () Bool)

(declare-fun e!517179 () Bool)

(assert (=> b!921652 (= e!517180 (not e!517179))))

(declare-fun res!621542 () Bool)

(assert (=> b!921652 (=> res!621542 e!517179)))

(declare-datatypes ((array!55160 0))(
  ( (array!55161 (arr!26525 (Array (_ BitVec 32) (_ BitVec 64))) (size!26984 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55160)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921652 (= res!621542 (or (bvsge (size!26984 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26984 _keys!1487))))))

(declare-fun e!517183 () Bool)

(assert (=> b!921652 e!517183))

(declare-fun c!96126 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!921652 (= c!96126 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((Unit!31096 0))(
  ( (Unit!31097) )
))
(declare-fun lt!413798 () Unit!31096)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31087 0))(
  ( (V!31088 (val!9846 Int)) )
))
(declare-datatypes ((ValueCell!9314 0))(
  ( (ValueCellFull!9314 (v!12364 V!31087)) (EmptyCell!9314) )
))
(declare-datatypes ((array!55162 0))(
  ( (array!55163 (arr!26526 (Array (_ BitVec 32) ValueCell!9314)) (size!26985 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55162)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31087)

(declare-fun minValue!1173 () V!31087)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!181 (array!55160 array!55162 (_ BitVec 32) (_ BitVec 32) V!31087 V!31087 (_ BitVec 64) (_ BitVec 32) Int) Unit!31096)

(assert (=> b!921652 (= lt!413798 (lemmaListMapContainsThenArrayContainsFrom!181 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!18610 0))(
  ( (Nil!18607) (Cons!18606 (h!19752 (_ BitVec 64)) (t!26423 List!18610)) )
))
(declare-fun arrayNoDuplicates!0 (array!55160 (_ BitVec 32) List!18610) Bool)

(assert (=> b!921652 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18607)))

(declare-fun lt!413802 () Unit!31096)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55160 (_ BitVec 32) (_ BitVec 32)) Unit!31096)

(assert (=> b!921652 (= lt!413802 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12806 0))(
  ( (tuple2!12807 (_1!6414 (_ BitVec 64)) (_2!6414 V!31087)) )
))
(declare-datatypes ((List!18611 0))(
  ( (Nil!18608) (Cons!18607 (h!19753 tuple2!12806) (t!26424 List!18611)) )
))
(declare-datatypes ((ListLongMap!11503 0))(
  ( (ListLongMap!11504 (toList!5767 List!18611)) )
))
(declare-fun lt!413801 () ListLongMap!11503)

(declare-fun lt!413797 () tuple2!12806)

(declare-fun contains!4829 (ListLongMap!11503 (_ BitVec 64)) Bool)

(declare-fun +!2674 (ListLongMap!11503 tuple2!12806) ListLongMap!11503)

(assert (=> b!921652 (contains!4829 (+!2674 lt!413801 lt!413797) k!1099)))

(declare-fun lt!413799 () V!31087)

(declare-fun lt!413796 () Unit!31096)

(declare-fun lt!413795 () (_ BitVec 64))

(declare-fun addStillContains!398 (ListLongMap!11503 (_ BitVec 64) V!31087 (_ BitVec 64)) Unit!31096)

(assert (=> b!921652 (= lt!413796 (addStillContains!398 lt!413801 lt!413795 lt!413799 k!1099))))

(declare-fun getCurrentListMap!3021 (array!55160 array!55162 (_ BitVec 32) (_ BitVec 32) V!31087 V!31087 (_ BitVec 32) Int) ListLongMap!11503)

(assert (=> b!921652 (= (getCurrentListMap!3021 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2674 (getCurrentListMap!3021 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413797))))

(assert (=> b!921652 (= lt!413797 (tuple2!12807 lt!413795 lt!413799))))

(declare-fun get!13925 (ValueCell!9314 V!31087) V!31087)

(declare-fun dynLambda!1463 (Int (_ BitVec 64)) V!31087)

(assert (=> b!921652 (= lt!413799 (get!13925 (select (arr!26526 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1463 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413800 () Unit!31096)

(declare-fun lemmaListMapRecursiveValidKeyArray!64 (array!55160 array!55162 (_ BitVec 32) (_ BitVec 32) V!31087 V!31087 (_ BitVec 32) Int) Unit!31096)

(assert (=> b!921652 (= lt!413800 (lemmaListMapRecursiveValidKeyArray!64 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921653 () Bool)

(declare-fun res!621543 () Bool)

(declare-fun e!517184 () Bool)

(assert (=> b!921653 (=> (not res!621543) (not e!517184))))

(declare-fun v!791 () V!31087)

(declare-fun apply!606 (ListLongMap!11503 (_ BitVec 64)) V!31087)

(assert (=> b!921653 (= res!621543 (= (apply!606 lt!413801 k!1099) v!791))))

(declare-fun b!921654 () Bool)

(declare-fun e!517181 () Bool)

(declare-fun e!517178 () Bool)

(declare-fun mapRes!31143 () Bool)

(assert (=> b!921654 (= e!517181 (and e!517178 mapRes!31143))))

(declare-fun condMapEmpty!31143 () Bool)

(declare-fun mapDefault!31143 () ValueCell!9314)

