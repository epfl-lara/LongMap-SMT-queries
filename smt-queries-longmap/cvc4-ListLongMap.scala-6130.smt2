; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78892 () Bool)

(assert start!78892)

(declare-fun b_free!17105 () Bool)

(declare-fun b_next!17105 () Bool)

(assert (=> start!78892 (= b_free!17105 (not b_next!17105))))

(declare-fun tp!59755 () Bool)

(declare-fun b_and!27947 () Bool)

(assert (=> start!78892 (= tp!59755 b_and!27947)))

(declare-fun b!922189 () Bool)

(declare-fun res!621888 () Bool)

(declare-fun e!517451 () Bool)

(assert (=> b!922189 (=> (not res!621888) (not e!517451))))

(declare-datatypes ((array!55202 0))(
  ( (array!55203 (arr!26546 (Array (_ BitVec 32) (_ BitVec 64))) (size!27005 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55202)

(declare-datatypes ((List!18627 0))(
  ( (Nil!18624) (Cons!18623 (h!19769 (_ BitVec 64)) (t!26462 List!18627)) )
))
(declare-fun arrayNoDuplicates!0 (array!55202 (_ BitVec 32) List!18627) Bool)

(assert (=> b!922189 (= res!621888 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18624))))

(declare-fun b!922190 () Bool)

(declare-fun e!517452 () Bool)

(assert (=> b!922190 (= e!517452 (not true))))

(declare-fun lt!414099 () (_ BitVec 64))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!922190 (not (= lt!414099 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((Unit!31112 0))(
  ( (Unit!31113) )
))
(declare-fun lt!414093 () Unit!31112)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55202 (_ BitVec 64) (_ BitVec 32) List!18627) Unit!31112)

(assert (=> b!922190 (= lt!414093 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18624))))

(declare-fun e!517455 () Bool)

(assert (=> b!922190 e!517455))

(declare-fun c!96159 () Bool)

(assert (=> b!922190 (= c!96159 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!414095 () Unit!31112)

(declare-datatypes ((V!31115 0))(
  ( (V!31116 (val!9857 Int)) )
))
(declare-datatypes ((ValueCell!9325 0))(
  ( (ValueCellFull!9325 (v!12375 V!31115)) (EmptyCell!9325) )
))
(declare-datatypes ((array!55204 0))(
  ( (array!55205 (arr!26547 (Array (_ BitVec 32) ValueCell!9325)) (size!27006 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55204)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31115)

(declare-fun minValue!1173 () V!31115)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!189 (array!55202 array!55204 (_ BitVec 32) (_ BitVec 32) V!31115 V!31115 (_ BitVec 64) (_ BitVec 32) Int) Unit!31112)

(assert (=> b!922190 (= lt!414095 (lemmaListMapContainsThenArrayContainsFrom!189 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922190 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18624)))

(declare-fun lt!414094 () Unit!31112)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55202 (_ BitVec 32) (_ BitVec 32)) Unit!31112)

(assert (=> b!922190 (= lt!414094 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12822 0))(
  ( (tuple2!12823 (_1!6422 (_ BitVec 64)) (_2!6422 V!31115)) )
))
(declare-datatypes ((List!18628 0))(
  ( (Nil!18625) (Cons!18624 (h!19770 tuple2!12822) (t!26463 List!18628)) )
))
(declare-datatypes ((ListLongMap!11519 0))(
  ( (ListLongMap!11520 (toList!5775 List!18628)) )
))
(declare-fun lt!414097 () ListLongMap!11519)

(declare-fun lt!414092 () tuple2!12822)

(declare-fun contains!4838 (ListLongMap!11519 (_ BitVec 64)) Bool)

(declare-fun +!2682 (ListLongMap!11519 tuple2!12822) ListLongMap!11519)

(assert (=> b!922190 (contains!4838 (+!2682 lt!414097 lt!414092) k!1099)))

(declare-fun lt!414096 () V!31115)

(declare-fun lt!414100 () Unit!31112)

(declare-fun addStillContains!406 (ListLongMap!11519 (_ BitVec 64) V!31115 (_ BitVec 64)) Unit!31112)

(assert (=> b!922190 (= lt!414100 (addStillContains!406 lt!414097 lt!414099 lt!414096 k!1099))))

(declare-fun getCurrentListMap!3029 (array!55202 array!55204 (_ BitVec 32) (_ BitVec 32) V!31115 V!31115 (_ BitVec 32) Int) ListLongMap!11519)

(assert (=> b!922190 (= (getCurrentListMap!3029 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2682 (getCurrentListMap!3029 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414092))))

(assert (=> b!922190 (= lt!414092 (tuple2!12823 lt!414099 lt!414096))))

(declare-fun get!13939 (ValueCell!9325 V!31115) V!31115)

(declare-fun dynLambda!1471 (Int (_ BitVec 64)) V!31115)

(assert (=> b!922190 (= lt!414096 (get!13939 (select (arr!26547 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1471 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414098 () Unit!31112)

(declare-fun lemmaListMapRecursiveValidKeyArray!72 (array!55202 array!55204 (_ BitVec 32) (_ BitVec 32) V!31115 V!31115 (_ BitVec 32) Int) Unit!31112)

(assert (=> b!922190 (= lt!414098 (lemmaListMapRecursiveValidKeyArray!72 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922191 () Bool)

(declare-fun e!517453 () Bool)

(declare-fun tp_is_empty!19613 () Bool)

(assert (=> b!922191 (= e!517453 tp_is_empty!19613)))

(declare-fun b!922192 () Bool)

(declare-fun res!621887 () Bool)

(declare-fun e!517456 () Bool)

(assert (=> b!922192 (=> (not res!621887) (not e!517456))))

(assert (=> b!922192 (= res!621887 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!621885 () Bool)

(assert (=> start!78892 (=> (not res!621885) (not e!517451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78892 (= res!621885 (validMask!0 mask!1881))))

(assert (=> start!78892 e!517451))

(assert (=> start!78892 true))

(assert (=> start!78892 tp_is_empty!19613))

(declare-fun e!517454 () Bool)

(declare-fun array_inv!20678 (array!55204) Bool)

(assert (=> start!78892 (and (array_inv!20678 _values!1231) e!517454)))

(assert (=> start!78892 tp!59755))

(declare-fun array_inv!20679 (array!55202) Bool)

(assert (=> start!78892 (array_inv!20679 _keys!1487)))

(declare-fun b!922193 () Bool)

(declare-fun res!621889 () Bool)

(assert (=> b!922193 (=> (not res!621889) (not e!517451))))

(assert (=> b!922193 (= res!621889 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27005 _keys!1487))))))

(declare-fun b!922194 () Bool)

(declare-fun res!621892 () Bool)

(assert (=> b!922194 (=> (not res!621892) (not e!517451))))

(assert (=> b!922194 (= res!621892 (and (= (size!27006 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27005 _keys!1487) (size!27006 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922195 () Bool)

(assert (=> b!922195 (= e!517456 e!517452)))

(declare-fun res!621886 () Bool)

(assert (=> b!922195 (=> (not res!621886) (not e!517452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922195 (= res!621886 (validKeyInArray!0 lt!414099))))

(assert (=> b!922195 (= lt!414099 (select (arr!26546 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922196 () Bool)

(declare-fun arrayContainsKey!0 (array!55202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922196 (= e!517455 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!922197 () Bool)

(declare-fun e!517450 () Bool)

(assert (=> b!922197 (= e!517450 tp_is_empty!19613)))

(declare-fun b!922198 () Bool)

(assert (=> b!922198 (= e!517455 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922199 () Bool)

(declare-fun mapRes!31176 () Bool)

(assert (=> b!922199 (= e!517454 (and e!517453 mapRes!31176))))

(declare-fun condMapEmpty!31176 () Bool)

(declare-fun mapDefault!31176 () ValueCell!9325)

