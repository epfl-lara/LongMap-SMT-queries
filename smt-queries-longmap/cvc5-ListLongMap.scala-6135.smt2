; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78918 () Bool)

(assert start!78918)

(declare-fun b_free!17131 () Bool)

(declare-fun b_next!17131 () Bool)

(assert (=> start!78918 (= b_free!17131 (not b_next!17131))))

(declare-fun tp!59833 () Bool)

(declare-fun b_and!27999 () Bool)

(assert (=> start!78918 (= tp!59833 b_and!27999)))

(declare-fun b!922800 () Bool)

(declare-fun res!622282 () Bool)

(declare-fun e!517766 () Bool)

(assert (=> b!922800 (=> (not res!622282) (not e!517766))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922800 (= res!622282 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922801 () Bool)

(declare-fun e!517762 () Bool)

(declare-fun tp_is_empty!19639 () Bool)

(assert (=> b!922801 (= e!517762 tp_is_empty!19639)))

(declare-fun b!922802 () Bool)

(declare-fun res!622281 () Bool)

(declare-fun e!517763 () Bool)

(assert (=> b!922802 (=> (not res!622281) (not e!517763))))

(declare-datatypes ((array!55254 0))(
  ( (array!55255 (arr!26572 (Array (_ BitVec 32) (_ BitVec 64))) (size!27031 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55254)

(assert (=> b!922802 (= res!622281 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27031 _keys!1487))))))

(declare-fun b!922803 () Bool)

(declare-fun e!517765 () Bool)

(assert (=> b!922803 (= e!517765 (not true))))

(declare-fun lt!414449 () (_ BitVec 64))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!922803 (not (= lt!414449 k!1099))))

(declare-datatypes ((Unit!31126 0))(
  ( (Unit!31127) )
))
(declare-fun lt!414446 () Unit!31126)

(declare-datatypes ((List!18647 0))(
  ( (Nil!18644) (Cons!18643 (h!19789 (_ BitVec 64)) (t!26508 List!18647)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55254 (_ BitVec 64) (_ BitVec 32) List!18647) Unit!31126)

(assert (=> b!922803 (= lt!414446 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18644))))

(declare-fun e!517767 () Bool)

(assert (=> b!922803 e!517767))

(declare-fun c!96198 () Bool)

(assert (=> b!922803 (= c!96198 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!414450 () Unit!31126)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31151 0))(
  ( (V!31152 (val!9870 Int)) )
))
(declare-datatypes ((ValueCell!9338 0))(
  ( (ValueCellFull!9338 (v!12388 V!31151)) (EmptyCell!9338) )
))
(declare-datatypes ((array!55256 0))(
  ( (array!55257 (arr!26573 (Array (_ BitVec 32) ValueCell!9338)) (size!27032 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55256)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31151)

(declare-fun minValue!1173 () V!31151)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!196 (array!55254 array!55256 (_ BitVec 32) (_ BitVec 32) V!31151 V!31151 (_ BitVec 64) (_ BitVec 32) Int) Unit!31126)

(assert (=> b!922803 (= lt!414450 (lemmaListMapContainsThenArrayContainsFrom!196 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55254 (_ BitVec 32) List!18647) Bool)

(assert (=> b!922803 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18644)))

(declare-fun lt!414444 () Unit!31126)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55254 (_ BitVec 32) (_ BitVec 32)) Unit!31126)

(assert (=> b!922803 (= lt!414444 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12842 0))(
  ( (tuple2!12843 (_1!6432 (_ BitVec 64)) (_2!6432 V!31151)) )
))
(declare-datatypes ((List!18648 0))(
  ( (Nil!18645) (Cons!18644 (h!19790 tuple2!12842) (t!26509 List!18648)) )
))
(declare-datatypes ((ListLongMap!11539 0))(
  ( (ListLongMap!11540 (toList!5785 List!18648)) )
))
(declare-fun lt!414445 () ListLongMap!11539)

(declare-fun lt!414447 () tuple2!12842)

(declare-fun contains!4848 (ListLongMap!11539 (_ BitVec 64)) Bool)

(declare-fun +!2689 (ListLongMap!11539 tuple2!12842) ListLongMap!11539)

(assert (=> b!922803 (contains!4848 (+!2689 lt!414445 lt!414447) k!1099)))

(declare-fun lt!414451 () Unit!31126)

(declare-fun lt!414443 () V!31151)

(declare-fun addStillContains!413 (ListLongMap!11539 (_ BitVec 64) V!31151 (_ BitVec 64)) Unit!31126)

(assert (=> b!922803 (= lt!414451 (addStillContains!413 lt!414445 lt!414449 lt!414443 k!1099))))

(declare-fun getCurrentListMap!3039 (array!55254 array!55256 (_ BitVec 32) (_ BitVec 32) V!31151 V!31151 (_ BitVec 32) Int) ListLongMap!11539)

(assert (=> b!922803 (= (getCurrentListMap!3039 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2689 (getCurrentListMap!3039 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414447))))

(assert (=> b!922803 (= lt!414447 (tuple2!12843 lt!414449 lt!414443))))

(declare-fun get!13956 (ValueCell!9338 V!31151) V!31151)

(declare-fun dynLambda!1478 (Int (_ BitVec 64)) V!31151)

(assert (=> b!922803 (= lt!414443 (get!13956 (select (arr!26573 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1478 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414448 () Unit!31126)

(declare-fun lemmaListMapRecursiveValidKeyArray!79 (array!55254 array!55256 (_ BitVec 32) (_ BitVec 32) V!31151 V!31151 (_ BitVec 32) Int) Unit!31126)

(assert (=> b!922803 (= lt!414448 (lemmaListMapRecursiveValidKeyArray!79 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922804 () Bool)

(declare-fun e!517768 () Bool)

(declare-fun mapRes!31215 () Bool)

(assert (=> b!922804 (= e!517768 (and e!517762 mapRes!31215))))

(declare-fun condMapEmpty!31215 () Bool)

(declare-fun mapDefault!31215 () ValueCell!9338)

