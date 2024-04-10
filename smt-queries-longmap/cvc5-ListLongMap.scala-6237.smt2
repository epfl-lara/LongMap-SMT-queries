; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79694 () Bool)

(assert start!79694)

(declare-fun b_free!17743 () Bool)

(declare-fun b_next!17743 () Bool)

(assert (=> start!79694 (= b_free!17743 (not b_next!17743))))

(declare-fun tp!61685 () Bool)

(declare-fun b_and!29077 () Bool)

(assert (=> start!79694 (= tp!61685 b_and!29077)))

(declare-fun b!937538 () Bool)

(declare-fun e!526475 () Bool)

(declare-fun e!526469 () Bool)

(assert (=> b!937538 (= e!526475 e!526469)))

(declare-fun res!630996 () Bool)

(assert (=> b!937538 (=> (not res!630996) (not e!526469))))

(declare-datatypes ((V!31967 0))(
  ( (V!31968 (val!10176 Int)) )
))
(declare-datatypes ((tuple2!13368 0))(
  ( (tuple2!13369 (_1!6695 (_ BitVec 64)) (_2!6695 V!31967)) )
))
(declare-datatypes ((List!19147 0))(
  ( (Nil!19144) (Cons!19143 (h!20289 tuple2!13368) (t!27434 List!19147)) )
))
(declare-datatypes ((ListLongMap!12065 0))(
  ( (ListLongMap!12066 (toList!6048 List!19147)) )
))
(declare-fun lt!423089 () ListLongMap!12065)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5107 (ListLongMap!12065 (_ BitVec 64)) Bool)

(assert (=> b!937538 (= res!630996 (contains!5107 lt!423089 k!1099))))

(declare-datatypes ((array!56442 0))(
  ( (array!56443 (arr!27161 (Array (_ BitVec 32) (_ BitVec 64))) (size!27620 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56442)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9644 0))(
  ( (ValueCellFull!9644 (v!12701 V!31967)) (EmptyCell!9644) )
))
(declare-datatypes ((array!56444 0))(
  ( (array!56445 (arr!27162 (Array (_ BitVec 32) ValueCell!9644)) (size!27621 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56444)

(declare-fun zeroValue!1173 () V!31967)

(declare-fun minValue!1173 () V!31967)

(declare-fun getCurrentListMap!3283 (array!56442 array!56444 (_ BitVec 32) (_ BitVec 32) V!31967 V!31967 (_ BitVec 32) Int) ListLongMap!12065)

(assert (=> b!937538 (= lt!423089 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937539 () Bool)

(declare-fun lt!423088 () ListLongMap!12065)

(declare-fun lt!423092 () V!31967)

(declare-fun apply!850 (ListLongMap!12065 (_ BitVec 64)) V!31967)

(assert (=> b!937539 (= (apply!850 lt!423088 k!1099) lt!423092)))

(declare-fun lt!423082 () (_ BitVec 64))

(declare-fun lt!423091 () V!31967)

(declare-datatypes ((Unit!31656 0))(
  ( (Unit!31657) )
))
(declare-fun lt!423084 () Unit!31656)

(declare-fun addApplyDifferent!436 (ListLongMap!12065 (_ BitVec 64) V!31967 (_ BitVec 64)) Unit!31656)

(assert (=> b!937539 (= lt!423084 (addApplyDifferent!436 lt!423089 lt!423082 lt!423091 k!1099))))

(assert (=> b!937539 (not (= lt!423082 k!1099))))

(declare-fun lt!423086 () Unit!31656)

(declare-datatypes ((List!19148 0))(
  ( (Nil!19145) (Cons!19144 (h!20290 (_ BitVec 64)) (t!27435 List!19148)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56442 (_ BitVec 64) (_ BitVec 32) List!19148) Unit!31656)

(assert (=> b!937539 (= lt!423086 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19145))))

(declare-fun e!526473 () Bool)

(assert (=> b!937539 e!526473))

(declare-fun c!97594 () Bool)

(assert (=> b!937539 (= c!97594 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423087 () Unit!31656)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!309 (array!56442 array!56444 (_ BitVec 32) (_ BitVec 32) V!31967 V!31967 (_ BitVec 64) (_ BitVec 32) Int) Unit!31656)

(assert (=> b!937539 (= lt!423087 (lemmaListMapContainsThenArrayContainsFrom!309 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56442 (_ BitVec 32) List!19148) Bool)

(assert (=> b!937539 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19145)))

(declare-fun lt!423083 () Unit!31656)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56442 (_ BitVec 32) (_ BitVec 32)) Unit!31656)

(assert (=> b!937539 (= lt!423083 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937539 (contains!5107 lt!423088 k!1099)))

(declare-fun lt!423085 () tuple2!13368)

(declare-fun +!2837 (ListLongMap!12065 tuple2!13368) ListLongMap!12065)

(assert (=> b!937539 (= lt!423088 (+!2837 lt!423089 lt!423085))))

(declare-fun lt!423081 () Unit!31656)

(declare-fun addStillContains!556 (ListLongMap!12065 (_ BitVec 64) V!31967 (_ BitVec 64)) Unit!31656)

(assert (=> b!937539 (= lt!423081 (addStillContains!556 lt!423089 lt!423082 lt!423091 k!1099))))

(assert (=> b!937539 (= (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2837 (getCurrentListMap!3283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423085))))

(assert (=> b!937539 (= lt!423085 (tuple2!13369 lt!423082 lt!423091))))

(declare-fun get!14323 (ValueCell!9644 V!31967) V!31967)

(declare-fun dynLambda!1626 (Int (_ BitVec 64)) V!31967)

(assert (=> b!937539 (= lt!423091 (get!14323 (select (arr!27162 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1626 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423080 () Unit!31656)

(declare-fun lemmaListMapRecursiveValidKeyArray!227 (array!56442 array!56444 (_ BitVec 32) (_ BitVec 32) V!31967 V!31967 (_ BitVec 32) Int) Unit!31656)

(assert (=> b!937539 (= lt!423080 (lemmaListMapRecursiveValidKeyArray!227 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526468 () Unit!31656)

(assert (=> b!937539 (= e!526468 lt!423084)))

(declare-fun b!937540 () Bool)

(declare-fun Unit!31658 () Unit!31656)

(assert (=> b!937540 (= e!526468 Unit!31658)))

(declare-fun b!937541 () Bool)

(declare-fun arrayContainsKey!0 (array!56442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937541 (= e!526473 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!937542 () Bool)

(declare-fun e!526474 () Bool)

(declare-fun tp_is_empty!20251 () Bool)

(assert (=> b!937542 (= e!526474 tp_is_empty!20251)))

(declare-fun b!937543 () Bool)

(declare-fun e!526472 () Unit!31656)

(declare-fun Unit!31659 () Unit!31656)

(assert (=> b!937543 (= e!526472 Unit!31659)))

(declare-fun b!937544 () Bool)

(assert (=> b!937544 (= e!526472 e!526468)))

(assert (=> b!937544 (= lt!423082 (select (arr!27161 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97595 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937544 (= c!97595 (validKeyInArray!0 lt!423082))))

(declare-fun b!937545 () Bool)

(declare-fun res!630999 () Bool)

(assert (=> b!937545 (=> (not res!630999) (not e!526475))))

(assert (=> b!937545 (= res!630999 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27620 _keys!1487))))))

(declare-fun b!937546 () Bool)

(declare-fun res!631000 () Bool)

(assert (=> b!937546 (=> (not res!631000) (not e!526475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56442 (_ BitVec 32)) Bool)

(assert (=> b!937546 (= res!631000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937547 () Bool)

(declare-fun e!526471 () Bool)

(declare-fun e!526467 () Bool)

(declare-fun mapRes!32148 () Bool)

(assert (=> b!937547 (= e!526471 (and e!526467 mapRes!32148))))

(declare-fun condMapEmpty!32148 () Bool)

(declare-fun mapDefault!32148 () ValueCell!9644)

