; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78828 () Bool)

(assert start!78828)

(declare-fun b_free!17041 () Bool)

(declare-fun b_next!17041 () Bool)

(assert (=> start!78828 (= b_free!17041 (not b_next!17041))))

(declare-fun tp!59563 () Bool)

(declare-fun b_and!27819 () Bool)

(assert (=> start!78828 (= tp!59563 b_and!27819)))

(declare-fun b!920475 () Bool)

(declare-fun e!516617 () Bool)

(declare-fun e!516613 () Bool)

(assert (=> b!920475 (= e!516617 e!516613)))

(declare-fun res!620724 () Bool)

(assert (=> b!920475 (=> (not res!620724) (not e!516613))))

(declare-datatypes ((V!31031 0))(
  ( (V!31032 (val!9825 Int)) )
))
(declare-datatypes ((tuple2!12774 0))(
  ( (tuple2!12775 (_1!6398 (_ BitVec 64)) (_2!6398 V!31031)) )
))
(declare-datatypes ((List!18577 0))(
  ( (Nil!18574) (Cons!18573 (h!19719 tuple2!12774) (t!26348 List!18577)) )
))
(declare-datatypes ((ListLongMap!11471 0))(
  ( (ListLongMap!11472 (toList!5751 List!18577)) )
))
(declare-fun lt!413231 () ListLongMap!11471)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4799 (ListLongMap!11471 (_ BitVec 64)) Bool)

(assert (=> b!920475 (= res!620724 (contains!4799 lt!413231 k!1099))))

(declare-datatypes ((array!55078 0))(
  ( (array!55079 (arr!26484 (Array (_ BitVec 32) (_ BitVec 64))) (size!26943 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55078)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9293 0))(
  ( (ValueCellFull!9293 (v!12343 V!31031)) (EmptyCell!9293) )
))
(declare-datatypes ((array!55080 0))(
  ( (array!55081 (arr!26485 (Array (_ BitVec 32) ValueCell!9293)) (size!26944 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55080)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31031)

(declare-fun minValue!1173 () V!31031)

(declare-fun getCurrentListMap!3006 (array!55078 array!55080 (_ BitVec 32) (_ BitVec 32) V!31031 V!31031 (_ BitVec 32) Int) ListLongMap!11471)

(assert (=> b!920475 (= lt!413231 (getCurrentListMap!3006 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920476 () Bool)

(declare-fun e!516611 () Bool)

(declare-fun tp_is_empty!19549 () Bool)

(assert (=> b!920476 (= e!516611 tp_is_empty!19549)))

(declare-fun b!920477 () Bool)

(declare-fun e!516612 () Bool)

(declare-fun e!516616 () Bool)

(assert (=> b!920477 (= e!516612 (not e!516616))))

(declare-fun res!620713 () Bool)

(assert (=> b!920477 (=> res!620713 e!516616)))

(assert (=> b!920477 (= res!620713 (or (bvsge (size!26943 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26943 _keys!1487))))))

(declare-fun e!516619 () Bool)

(assert (=> b!920477 e!516619))

(declare-fun c!96063 () Bool)

(assert (=> b!920477 (= c!96063 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31066 0))(
  ( (Unit!31067) )
))
(declare-fun lt!413232 () Unit!31066)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!166 (array!55078 array!55080 (_ BitVec 32) (_ BitVec 32) V!31031 V!31031 (_ BitVec 64) (_ BitVec 32) Int) Unit!31066)

(assert (=> b!920477 (= lt!413232 (lemmaListMapContainsThenArrayContainsFrom!166 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!18578 0))(
  ( (Nil!18575) (Cons!18574 (h!19720 (_ BitVec 64)) (t!26349 List!18578)) )
))
(declare-fun arrayNoDuplicates!0 (array!55078 (_ BitVec 32) List!18578) Bool)

(assert (=> b!920477 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18575)))

(declare-fun lt!413234 () Unit!31066)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55078 (_ BitVec 32) (_ BitVec 32)) Unit!31066)

(assert (=> b!920477 (= lt!413234 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413230 () tuple2!12774)

(declare-fun +!2659 (ListLongMap!11471 tuple2!12774) ListLongMap!11471)

(assert (=> b!920477 (contains!4799 (+!2659 lt!413231 lt!413230) k!1099)))

(declare-fun lt!413229 () V!31031)

(declare-fun lt!413228 () Unit!31066)

(declare-fun lt!413233 () (_ BitVec 64))

(declare-fun addStillContains!383 (ListLongMap!11471 (_ BitVec 64) V!31031 (_ BitVec 64)) Unit!31066)

(assert (=> b!920477 (= lt!413228 (addStillContains!383 lt!413231 lt!413233 lt!413229 k!1099))))

(assert (=> b!920477 (= (getCurrentListMap!3006 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2659 (getCurrentListMap!3006 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413230))))

(assert (=> b!920477 (= lt!413230 (tuple2!12775 lt!413233 lt!413229))))

(declare-fun get!13896 (ValueCell!9293 V!31031) V!31031)

(declare-fun dynLambda!1448 (Int (_ BitVec 64)) V!31031)

(assert (=> b!920477 (= lt!413229 (get!13896 (select (arr!26485 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1448 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413235 () Unit!31066)

(declare-fun lemmaListMapRecursiveValidKeyArray!49 (array!55078 array!55080 (_ BitVec 32) (_ BitVec 32) V!31031 V!31031 (_ BitVec 32) Int) Unit!31066)

(assert (=> b!920477 (= lt!413235 (lemmaListMapRecursiveValidKeyArray!49 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920478 () Bool)

(declare-fun e!516618 () Bool)

(declare-fun mapRes!31080 () Bool)

(assert (=> b!920478 (= e!516618 (and e!516611 mapRes!31080))))

(declare-fun condMapEmpty!31080 () Bool)

(declare-fun mapDefault!31080 () ValueCell!9293)

