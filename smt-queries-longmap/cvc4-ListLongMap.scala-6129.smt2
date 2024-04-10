; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78886 () Bool)

(assert start!78886)

(declare-fun b_free!17099 () Bool)

(declare-fun b_next!17099 () Bool)

(assert (=> start!78886 (= b_free!17099 (not b_next!17099))))

(declare-fun tp!59738 () Bool)

(declare-fun b_and!27935 () Bool)

(assert (=> start!78886 (= tp!59738 b_and!27935)))

(declare-fun res!621799 () Bool)

(declare-fun e!517380 () Bool)

(assert (=> start!78886 (=> (not res!621799) (not e!517380))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78886 (= res!621799 (validMask!0 mask!1881))))

(assert (=> start!78886 e!517380))

(assert (=> start!78886 true))

(declare-fun tp_is_empty!19607 () Bool)

(assert (=> start!78886 tp_is_empty!19607))

(declare-datatypes ((V!31107 0))(
  ( (V!31108 (val!9854 Int)) )
))
(declare-datatypes ((ValueCell!9322 0))(
  ( (ValueCellFull!9322 (v!12372 V!31107)) (EmptyCell!9322) )
))
(declare-datatypes ((array!55192 0))(
  ( (array!55193 (arr!26541 (Array (_ BitVec 32) ValueCell!9322)) (size!27000 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55192)

(declare-fun e!517377 () Bool)

(declare-fun array_inv!20674 (array!55192) Bool)

(assert (=> start!78886 (and (array_inv!20674 _values!1231) e!517377)))

(assert (=> start!78886 tp!59738))

(declare-datatypes ((array!55194 0))(
  ( (array!55195 (arr!26542 (Array (_ BitVec 32) (_ BitVec 64))) (size!27001 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55194)

(declare-fun array_inv!20675 (array!55194) Bool)

(assert (=> start!78886 (array_inv!20675 _keys!1487)))

(declare-fun b!922048 () Bool)

(declare-fun e!517384 () Bool)

(assert (=> b!922048 (= e!517384 (not true))))

(declare-fun lt!414018 () (_ BitVec 64))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!922048 (not (= lt!414018 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((Unit!31108 0))(
  ( (Unit!31109) )
))
(declare-fun lt!414017 () Unit!31108)

(declare-datatypes ((List!18623 0))(
  ( (Nil!18620) (Cons!18619 (h!19765 (_ BitVec 64)) (t!26452 List!18623)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55194 (_ BitVec 64) (_ BitVec 32) List!18623) Unit!31108)

(assert (=> b!922048 (= lt!414017 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18620))))

(declare-fun e!517379 () Bool)

(assert (=> b!922048 e!517379))

(declare-fun c!96150 () Bool)

(assert (=> b!922048 (= c!96150 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!414016 () Unit!31108)

(declare-fun zeroValue!1173 () V!31107)

(declare-fun minValue!1173 () V!31107)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!187 (array!55194 array!55192 (_ BitVec 32) (_ BitVec 32) V!31107 V!31107 (_ BitVec 64) (_ BitVec 32) Int) Unit!31108)

(assert (=> b!922048 (= lt!414016 (lemmaListMapContainsThenArrayContainsFrom!187 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55194 (_ BitVec 32) List!18623) Bool)

(assert (=> b!922048 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18620)))

(declare-fun lt!414015 () Unit!31108)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55194 (_ BitVec 32) (_ BitVec 32)) Unit!31108)

(assert (=> b!922048 (= lt!414015 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12818 0))(
  ( (tuple2!12819 (_1!6420 (_ BitVec 64)) (_2!6420 V!31107)) )
))
(declare-datatypes ((List!18624 0))(
  ( (Nil!18621) (Cons!18620 (h!19766 tuple2!12818) (t!26453 List!18624)) )
))
(declare-datatypes ((ListLongMap!11515 0))(
  ( (ListLongMap!11516 (toList!5773 List!18624)) )
))
(declare-fun lt!414014 () ListLongMap!11515)

(declare-fun lt!414019 () tuple2!12818)

(declare-fun contains!4836 (ListLongMap!11515 (_ BitVec 64)) Bool)

(declare-fun +!2680 (ListLongMap!11515 tuple2!12818) ListLongMap!11515)

(assert (=> b!922048 (contains!4836 (+!2680 lt!414014 lt!414019) k!1099)))

(declare-fun lt!414013 () Unit!31108)

(declare-fun lt!414011 () V!31107)

(declare-fun addStillContains!404 (ListLongMap!11515 (_ BitVec 64) V!31107 (_ BitVec 64)) Unit!31108)

(assert (=> b!922048 (= lt!414013 (addStillContains!404 lt!414014 lt!414018 lt!414011 k!1099))))

(declare-fun getCurrentListMap!3027 (array!55194 array!55192 (_ BitVec 32) (_ BitVec 32) V!31107 V!31107 (_ BitVec 32) Int) ListLongMap!11515)

(assert (=> b!922048 (= (getCurrentListMap!3027 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2680 (getCurrentListMap!3027 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414019))))

(assert (=> b!922048 (= lt!414019 (tuple2!12819 lt!414018 lt!414011))))

(declare-fun get!13935 (ValueCell!9322 V!31107) V!31107)

(declare-fun dynLambda!1469 (Int (_ BitVec 64)) V!31107)

(assert (=> b!922048 (= lt!414011 (get!13935 (select (arr!26541 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1469 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414012 () Unit!31108)

(declare-fun lemmaListMapRecursiveValidKeyArray!70 (array!55194 array!55192 (_ BitVec 32) (_ BitVec 32) V!31107 V!31107 (_ BitVec 32) Int) Unit!31108)

(assert (=> b!922048 (= lt!414012 (lemmaListMapRecursiveValidKeyArray!70 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922049 () Bool)

(assert (=> b!922049 (= e!517379 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922050 () Bool)

(declare-fun res!621794 () Bool)

(declare-fun e!517381 () Bool)

(assert (=> b!922050 (=> (not res!621794) (not e!517381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922050 (= res!621794 (validKeyInArray!0 k!1099))))

(declare-fun b!922051 () Bool)

(declare-fun res!621802 () Bool)

(assert (=> b!922051 (=> (not res!621802) (not e!517380))))

(assert (=> b!922051 (= res!621802 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27001 _keys!1487))))))

(declare-fun b!922052 () Bool)

(declare-fun res!621796 () Bool)

(assert (=> b!922052 (=> (not res!621796) (not e!517381))))

(declare-fun v!791 () V!31107)

(declare-fun apply!611 (ListLongMap!11515 (_ BitVec 64)) V!31107)

(assert (=> b!922052 (= res!621796 (= (apply!611 lt!414014 k!1099) v!791))))

(declare-fun b!922053 () Bool)

(assert (=> b!922053 (= e!517381 e!517384)))

(declare-fun res!621793 () Bool)

(assert (=> b!922053 (=> (not res!621793) (not e!517384))))

(assert (=> b!922053 (= res!621793 (validKeyInArray!0 lt!414018))))

(assert (=> b!922053 (= lt!414018 (select (arr!26542 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922054 () Bool)

(declare-fun e!517383 () Bool)

(declare-fun mapRes!31167 () Bool)

(assert (=> b!922054 (= e!517377 (and e!517383 mapRes!31167))))

(declare-fun condMapEmpty!31167 () Bool)

(declare-fun mapDefault!31167 () ValueCell!9322)

