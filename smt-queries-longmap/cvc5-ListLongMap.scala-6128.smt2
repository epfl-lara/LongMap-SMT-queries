; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78876 () Bool)

(assert start!78876)

(declare-fun b_free!17089 () Bool)

(declare-fun b_next!17089 () Bool)

(assert (=> start!78876 (= b_free!17089 (not b_next!17089))))

(declare-fun tp!59708 () Bool)

(declare-fun b_and!27915 () Bool)

(assert (=> start!78876 (= tp!59708 b_and!27915)))

(declare-fun b!921813 () Bool)

(declare-fun e!517262 () Bool)

(assert (=> b!921813 (= e!517262 (not true))))

(declare-fun lt!413879 () (_ BitVec 64))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!921813 (not (= lt!413879 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((Unit!31100 0))(
  ( (Unit!31101) )
))
(declare-fun lt!413877 () Unit!31100)

(declare-datatypes ((array!55172 0))(
  ( (array!55173 (arr!26531 (Array (_ BitVec 32) (_ BitVec 64))) (size!26990 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55172)

(declare-datatypes ((List!18615 0))(
  ( (Nil!18612) (Cons!18611 (h!19757 (_ BitVec 64)) (t!26434 List!18615)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55172 (_ BitVec 64) (_ BitVec 32) List!18615) Unit!31100)

(assert (=> b!921813 (= lt!413877 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18612))))

(declare-fun e!517259 () Bool)

(assert (=> b!921813 e!517259))

(declare-fun c!96135 () Bool)

(assert (=> b!921813 (= c!96135 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!413881 () Unit!31100)

(declare-datatypes ((V!31095 0))(
  ( (V!31096 (val!9849 Int)) )
))
(declare-datatypes ((ValueCell!9317 0))(
  ( (ValueCellFull!9317 (v!12367 V!31095)) (EmptyCell!9317) )
))
(declare-datatypes ((array!55174 0))(
  ( (array!55175 (arr!26532 (Array (_ BitVec 32) ValueCell!9317)) (size!26991 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55174)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31095)

(declare-fun minValue!1173 () V!31095)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!183 (array!55172 array!55174 (_ BitVec 32) (_ BitVec 32) V!31095 V!31095 (_ BitVec 64) (_ BitVec 32) Int) Unit!31100)

(assert (=> b!921813 (= lt!413881 (lemmaListMapContainsThenArrayContainsFrom!183 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55172 (_ BitVec 32) List!18615) Bool)

(assert (=> b!921813 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18612)))

(declare-fun lt!413884 () Unit!31100)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55172 (_ BitVec 32) (_ BitVec 32)) Unit!31100)

(assert (=> b!921813 (= lt!413884 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12810 0))(
  ( (tuple2!12811 (_1!6416 (_ BitVec 64)) (_2!6416 V!31095)) )
))
(declare-datatypes ((List!18616 0))(
  ( (Nil!18613) (Cons!18612 (h!19758 tuple2!12810) (t!26435 List!18616)) )
))
(declare-datatypes ((ListLongMap!11507 0))(
  ( (ListLongMap!11508 (toList!5769 List!18616)) )
))
(declare-fun lt!413878 () ListLongMap!11507)

(declare-fun lt!413880 () tuple2!12810)

(declare-fun contains!4832 (ListLongMap!11507 (_ BitVec 64)) Bool)

(declare-fun +!2676 (ListLongMap!11507 tuple2!12810) ListLongMap!11507)

(assert (=> b!921813 (contains!4832 (+!2676 lt!413878 lt!413880) k!1099)))

(declare-fun lt!413883 () Unit!31100)

(declare-fun lt!413876 () V!31095)

(declare-fun addStillContains!400 (ListLongMap!11507 (_ BitVec 64) V!31095 (_ BitVec 64)) Unit!31100)

(assert (=> b!921813 (= lt!413883 (addStillContains!400 lt!413878 lt!413879 lt!413876 k!1099))))

(declare-fun getCurrentListMap!3023 (array!55172 array!55174 (_ BitVec 32) (_ BitVec 32) V!31095 V!31095 (_ BitVec 32) Int) ListLongMap!11507)

(assert (=> b!921813 (= (getCurrentListMap!3023 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2676 (getCurrentListMap!3023 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413880))))

(assert (=> b!921813 (= lt!413880 (tuple2!12811 lt!413879 lt!413876))))

(declare-fun get!13929 (ValueCell!9317 V!31095) V!31095)

(declare-fun dynLambda!1465 (Int (_ BitVec 64)) V!31095)

(assert (=> b!921813 (= lt!413876 (get!13929 (select (arr!26532 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1465 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413882 () Unit!31100)

(declare-fun lemmaListMapRecursiveValidKeyArray!66 (array!55172 array!55174 (_ BitVec 32) (_ BitVec 32) V!31095 V!31095 (_ BitVec 32) Int) Unit!31100)

(assert (=> b!921813 (= lt!413882 (lemmaListMapRecursiveValidKeyArray!66 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921814 () Bool)

(declare-fun e!517257 () Bool)

(declare-fun e!517258 () Bool)

(declare-fun mapRes!31152 () Bool)

(assert (=> b!921814 (= e!517257 (and e!517258 mapRes!31152))))

(declare-fun condMapEmpty!31152 () Bool)

(declare-fun mapDefault!31152 () ValueCell!9317)

