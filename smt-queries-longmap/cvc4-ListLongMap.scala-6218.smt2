; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79478 () Bool)

(assert start!79478)

(declare-fun b_free!17633 () Bool)

(declare-fun b_next!17633 () Bool)

(assert (=> start!79478 (= b_free!17633 (not b_next!17633))))

(declare-fun tp!61345 () Bool)

(declare-fun b_and!28833 () Bool)

(assert (=> start!79478 (= tp!61345 b_and!28833)))

(declare-fun b!934183 () Bool)

(declare-fun e!524556 () Bool)

(declare-fun e!524554 () Bool)

(assert (=> b!934183 (= e!524556 e!524554)))

(declare-fun res!629186 () Bool)

(assert (=> b!934183 (=> (not res!629186) (not e!524554))))

(declare-fun lt!420851 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934183 (= res!629186 (validKeyInArray!0 lt!420851))))

(declare-datatypes ((array!56220 0))(
  ( (array!56221 (arr!27053 (Array (_ BitVec 32) (_ BitVec 64))) (size!27512 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56220)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934183 (= lt!420851 (select (arr!27053 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934184 () Bool)

(declare-fun e!524551 () Bool)

(declare-fun tp_is_empty!20141 () Bool)

(assert (=> b!934184 (= e!524551 tp_is_empty!20141)))

(declare-fun b!934185 () Bool)

(declare-fun e!524553 () Bool)

(assert (=> b!934185 (= e!524553 tp_is_empty!20141)))

(declare-fun mapIsEmpty!31974 () Bool)

(declare-fun mapRes!31974 () Bool)

(assert (=> mapIsEmpty!31974 mapRes!31974))

(declare-fun b!934186 () Bool)

(declare-fun res!629187 () Bool)

(assert (=> b!934186 (=> (not res!629187) (not e!524556))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31819 0))(
  ( (V!31820 (val!10121 Int)) )
))
(declare-fun v!791 () V!31819)

(declare-datatypes ((tuple2!13272 0))(
  ( (tuple2!13273 (_1!6647 (_ BitVec 64)) (_2!6647 V!31819)) )
))
(declare-datatypes ((List!19054 0))(
  ( (Nil!19051) (Cons!19050 (h!20196 tuple2!13272) (t!27231 List!19054)) )
))
(declare-datatypes ((ListLongMap!11969 0))(
  ( (ListLongMap!11970 (toList!6000 List!19054)) )
))
(declare-fun lt!420855 () ListLongMap!11969)

(declare-fun apply!807 (ListLongMap!11969 (_ BitVec 64)) V!31819)

(assert (=> b!934186 (= res!629187 (= (apply!807 lt!420855 k!1099) v!791))))

(declare-fun b!934187 () Bool)

(declare-fun e!524550 () Bool)

(assert (=> b!934187 (= e!524550 e!524556)))

(declare-fun res!629184 () Bool)

(assert (=> b!934187 (=> (not res!629184) (not e!524556))))

(declare-fun contains!5051 (ListLongMap!11969 (_ BitVec 64)) Bool)

(assert (=> b!934187 (= res!629184 (contains!5051 lt!420855 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9589 0))(
  ( (ValueCellFull!9589 (v!12641 V!31819)) (EmptyCell!9589) )
))
(declare-datatypes ((array!56222 0))(
  ( (array!56223 (arr!27054 (Array (_ BitVec 32) ValueCell!9589)) (size!27513 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56222)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31819)

(declare-fun minValue!1173 () V!31819)

(declare-fun getCurrentListMap!3238 (array!56220 array!56222 (_ BitVec 32) (_ BitVec 32) V!31819 V!31819 (_ BitVec 32) Int) ListLongMap!11969)

(assert (=> b!934187 (= lt!420855 (getCurrentListMap!3238 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934188 () Bool)

(declare-fun e!524549 () Bool)

(assert (=> b!934188 (= e!524549 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!934189 () Bool)

(declare-fun res!629181 () Bool)

(assert (=> b!934189 (=> (not res!629181) (not e!524550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56220 (_ BitVec 32)) Bool)

(assert (=> b!934189 (= res!629181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!629188 () Bool)

(assert (=> start!79478 (=> (not res!629188) (not e!524550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79478 (= res!629188 (validMask!0 mask!1881))))

(assert (=> start!79478 e!524550))

(assert (=> start!79478 true))

(assert (=> start!79478 tp_is_empty!20141))

(declare-fun e!524555 () Bool)

(declare-fun array_inv!21056 (array!56222) Bool)

(assert (=> start!79478 (and (array_inv!21056 _values!1231) e!524555)))

(assert (=> start!79478 tp!61345))

(declare-fun array_inv!21057 (array!56220) Bool)

(assert (=> start!79478 (array_inv!21057 _keys!1487)))

(declare-fun b!934190 () Bool)

(assert (=> b!934190 (= e!524555 (and e!524551 mapRes!31974))))

(declare-fun condMapEmpty!31974 () Bool)

(declare-fun mapDefault!31974 () ValueCell!9589)

