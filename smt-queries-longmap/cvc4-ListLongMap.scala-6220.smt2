; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79490 () Bool)

(assert start!79490)

(declare-fun b_free!17645 () Bool)

(declare-fun b_next!17645 () Bool)

(assert (=> start!79490 (= b_free!17645 (not b_next!17645))))

(declare-fun tp!61381 () Bool)

(declare-fun b_and!28857 () Bool)

(assert (=> start!79490 (= tp!61381 b_and!28857)))

(declare-fun b!934465 () Bool)

(declare-fun e!524696 () Bool)

(assert (=> b!934465 (= e!524696 (not true))))

(declare-fun e!524694 () Bool)

(assert (=> b!934465 e!524694))

(declare-fun c!97158 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!934465 (= c!97158 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31835 0))(
  ( (V!31836 (val!10127 Int)) )
))
(declare-datatypes ((ValueCell!9595 0))(
  ( (ValueCellFull!9595 (v!12647 V!31835)) (EmptyCell!9595) )
))
(declare-datatypes ((array!56244 0))(
  ( (array!56245 (arr!27065 (Array (_ BitVec 32) ValueCell!9595)) (size!27524 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56244)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31528 0))(
  ( (Unit!31529) )
))
(declare-fun lt!420992 () Unit!31528)

(declare-datatypes ((array!56246 0))(
  ( (array!56247 (arr!27066 (Array (_ BitVec 32) (_ BitVec 64))) (size!27525 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56246)

(declare-fun zeroValue!1173 () V!31835)

(declare-fun minValue!1173 () V!31835)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!276 (array!56246 array!56244 (_ BitVec 32) (_ BitVec 32) V!31835 V!31835 (_ BitVec 64) (_ BitVec 32) Int) Unit!31528)

(assert (=> b!934465 (= lt!420992 (lemmaListMapContainsThenArrayContainsFrom!276 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19064 0))(
  ( (Nil!19061) (Cons!19060 (h!20206 (_ BitVec 64)) (t!27253 List!19064)) )
))
(declare-fun arrayNoDuplicates!0 (array!56246 (_ BitVec 32) List!19064) Bool)

(assert (=> b!934465 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19061)))

(declare-fun lt!420995 () Unit!31528)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56246 (_ BitVec 32) (_ BitVec 32)) Unit!31528)

(assert (=> b!934465 (= lt!420995 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13284 0))(
  ( (tuple2!13285 (_1!6653 (_ BitVec 64)) (_2!6653 V!31835)) )
))
(declare-datatypes ((List!19065 0))(
  ( (Nil!19062) (Cons!19061 (h!20207 tuple2!13284) (t!27254 List!19065)) )
))
(declare-datatypes ((ListLongMap!11981 0))(
  ( (ListLongMap!11982 (toList!6006 List!19065)) )
))
(declare-fun lt!420993 () ListLongMap!11981)

(declare-fun lt!420998 () tuple2!13284)

(declare-fun contains!5056 (ListLongMap!11981 (_ BitVec 64)) Bool)

(declare-fun +!2804 (ListLongMap!11981 tuple2!13284) ListLongMap!11981)

(assert (=> b!934465 (contains!5056 (+!2804 lt!420993 lt!420998) k!1099)))

(declare-fun lt!420994 () Unit!31528)

(declare-fun lt!420996 () V!31835)

(declare-fun lt!420997 () (_ BitVec 64))

(declare-fun addStillContains!523 (ListLongMap!11981 (_ BitVec 64) V!31835 (_ BitVec 64)) Unit!31528)

(assert (=> b!934465 (= lt!420994 (addStillContains!523 lt!420993 lt!420997 lt!420996 k!1099))))

(declare-fun getCurrentListMap!3243 (array!56246 array!56244 (_ BitVec 32) (_ BitVec 32) V!31835 V!31835 (_ BitVec 32) Int) ListLongMap!11981)

(assert (=> b!934465 (= (getCurrentListMap!3243 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2804 (getCurrentListMap!3243 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420998))))

(assert (=> b!934465 (= lt!420998 (tuple2!13285 lt!420997 lt!420996))))

(declare-fun get!14247 (ValueCell!9595 V!31835) V!31835)

(declare-fun dynLambda!1593 (Int (_ BitVec 64)) V!31835)

(assert (=> b!934465 (= lt!420996 (get!14247 (select (arr!27065 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1593 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420999 () Unit!31528)

(declare-fun lemmaListMapRecursiveValidKeyArray!194 (array!56246 array!56244 (_ BitVec 32) (_ BitVec 32) V!31835 V!31835 (_ BitVec 32) Int) Unit!31528)

(assert (=> b!934465 (= lt!420999 (lemmaListMapRecursiveValidKeyArray!194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31992 () Bool)

(declare-fun mapRes!31992 () Bool)

(assert (=> mapIsEmpty!31992 mapRes!31992))

(declare-fun b!934466 () Bool)

(declare-fun e!524693 () Bool)

(assert (=> b!934466 (= e!524693 e!524696)))

(declare-fun res!629367 () Bool)

(assert (=> b!934466 (=> (not res!629367) (not e!524696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934466 (= res!629367 (validKeyInArray!0 lt!420997))))

(assert (=> b!934466 (= lt!420997 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934467 () Bool)

(declare-fun e!524699 () Bool)

(declare-fun tp_is_empty!20153 () Bool)

(assert (=> b!934467 (= e!524699 tp_is_empty!20153)))

(declare-fun b!934468 () Bool)

(declare-fun e!524695 () Bool)

(assert (=> b!934468 (= e!524695 (and e!524699 mapRes!31992))))

(declare-fun condMapEmpty!31992 () Bool)

(declare-fun mapDefault!31992 () ValueCell!9595)

