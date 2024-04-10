; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78966 () Bool)

(assert start!78966)

(declare-fun b_free!17179 () Bool)

(declare-fun b_next!17179 () Bool)

(assert (=> start!78966 (= b_free!17179 (not b_next!17179))))

(declare-fun tp!59977 () Bool)

(declare-fun b_and!28095 () Bool)

(assert (=> start!78966 (= tp!59977 b_and!28095)))

(declare-fun mapIsEmpty!31287 () Bool)

(declare-fun mapRes!31287 () Bool)

(assert (=> mapIsEmpty!31287 mapRes!31287))

(declare-fun b!924069 () Bool)

(declare-fun e!518534 () Bool)

(declare-fun e!518532 () Bool)

(assert (=> b!924069 (= e!518534 e!518532)))

(declare-fun res!622949 () Bool)

(assert (=> b!924069 (=> (not res!622949) (not e!518532))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55346 0))(
  ( (array!55347 (arr!26618 (Array (_ BitVec 32) (_ BitVec 64))) (size!27077 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55346)

(assert (=> b!924069 (= res!622949 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27077 _keys!1487)))))

(declare-datatypes ((Unit!31187 0))(
  ( (Unit!31188) )
))
(declare-fun lt!415373 () Unit!31187)

(declare-fun e!518527 () Unit!31187)

(assert (=> b!924069 (= lt!415373 e!518527)))

(declare-fun c!96366 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924069 (= c!96366 (validKeyInArray!0 k!1099))))

(declare-fun b!924070 () Bool)

(declare-fun e!518525 () Bool)

(assert (=> b!924070 (= e!518525 false)))

(declare-datatypes ((V!31215 0))(
  ( (V!31216 (val!9894 Int)) )
))
(declare-fun lt!415378 () V!31215)

(declare-datatypes ((tuple2!12886 0))(
  ( (tuple2!12887 (_1!6454 (_ BitVec 64)) (_2!6454 V!31215)) )
))
(declare-datatypes ((List!18689 0))(
  ( (Nil!18686) (Cons!18685 (h!19831 tuple2!12886) (t!26598 List!18689)) )
))
(declare-datatypes ((ListLongMap!11583 0))(
  ( (ListLongMap!11584 (toList!5807 List!18689)) )
))
(declare-fun lt!415379 () ListLongMap!11583)

(declare-fun apply!637 (ListLongMap!11583 (_ BitVec 64)) V!31215)

(assert (=> b!924070 (= lt!415378 (apply!637 lt!415379 k!1099))))

(declare-fun b!924071 () Bool)

(declare-fun e!518529 () Unit!31187)

(declare-fun Unit!31189 () Unit!31187)

(assert (=> b!924071 (= e!518529 Unit!31189)))

(declare-fun b!924072 () Bool)

(declare-fun e!518536 () Bool)

(declare-fun e!518530 () Bool)

(assert (=> b!924072 (= e!518536 e!518530)))

(declare-fun res!622950 () Bool)

(assert (=> b!924072 (=> (not res!622950) (not e!518530))))

(declare-fun lt!415374 () ListLongMap!11583)

(declare-fun contains!4868 (ListLongMap!11583 (_ BitVec 64)) Bool)

(assert (=> b!924072 (= res!622950 (contains!4868 lt!415374 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9362 0))(
  ( (ValueCellFull!9362 (v!12412 V!31215)) (EmptyCell!9362) )
))
(declare-datatypes ((array!55348 0))(
  ( (array!55349 (arr!26619 (Array (_ BitVec 32) ValueCell!9362)) (size!27078 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55348)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31215)

(declare-fun minValue!1173 () V!31215)

(declare-fun getCurrentListMap!3059 (array!55346 array!55348 (_ BitVec 32) (_ BitVec 32) V!31215 V!31215 (_ BitVec 32) Int) ListLongMap!11583)

(assert (=> b!924072 (= lt!415374 (getCurrentListMap!3059 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924074 () Bool)

(declare-fun e!518528 () Bool)

(declare-fun tp_is_empty!19687 () Bool)

(assert (=> b!924074 (= e!518528 tp_is_empty!19687)))

(declare-fun b!924075 () Bool)

(assert (=> b!924075 (= e!518527 e!518529)))

(declare-fun lt!415386 () (_ BitVec 64))

(assert (=> b!924075 (= lt!415386 (select (arr!26618 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96365 () Bool)

(assert (=> b!924075 (= c!96365 (validKeyInArray!0 lt!415386))))

(declare-fun b!924076 () Bool)

(declare-fun res!622954 () Bool)

(assert (=> b!924076 (=> (not res!622954) (not e!518536))))

(assert (=> b!924076 (= res!622954 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27077 _keys!1487))))))

(declare-fun b!924077 () Bool)

(declare-fun res!622951 () Bool)

(assert (=> b!924077 (=> (not res!622951) (not e!518536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55346 (_ BitVec 32)) Bool)

(assert (=> b!924077 (= res!622951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924078 () Bool)

(declare-fun res!622947 () Bool)

(assert (=> b!924078 (=> (not res!622947) (not e!518536))))

(assert (=> b!924078 (= res!622947 (and (= (size!27078 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27077 _keys!1487) (size!27078 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924079 () Bool)

(declare-fun e!518526 () Bool)

(declare-fun arrayContainsKey!0 (array!55346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924079 (= e!518526 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!924080 () Bool)

(assert (=> b!924080 (= e!518530 e!518534)))

(declare-fun res!622946 () Bool)

(assert (=> b!924080 (=> (not res!622946) (not e!518534))))

(declare-fun v!791 () V!31215)

(declare-fun lt!415383 () V!31215)

(assert (=> b!924080 (= res!622946 (and (= lt!415383 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924080 (= lt!415383 (apply!637 lt!415374 k!1099))))

(declare-fun b!924081 () Bool)

(declare-fun Unit!31190 () Unit!31187)

(assert (=> b!924081 (= e!518527 Unit!31190)))

(declare-fun b!924073 () Bool)

(declare-fun lt!415384 () ListLongMap!11583)

(assert (=> b!924073 (= (apply!637 lt!415384 k!1099) lt!415383)))

(declare-fun lt!415385 () Unit!31187)

(declare-fun lt!415377 () V!31215)

(declare-fun addApplyDifferent!361 (ListLongMap!11583 (_ BitVec 64) V!31215 (_ BitVec 64)) Unit!31187)

(assert (=> b!924073 (= lt!415385 (addApplyDifferent!361 lt!415374 lt!415386 lt!415377 k!1099))))

(assert (=> b!924073 (not (= lt!415386 k!1099))))

(declare-fun lt!415381 () Unit!31187)

(declare-datatypes ((List!18690 0))(
  ( (Nil!18687) (Cons!18686 (h!19832 (_ BitVec 64)) (t!26599 List!18690)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55346 (_ BitVec 64) (_ BitVec 32) List!18690) Unit!31187)

(assert (=> b!924073 (= lt!415381 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18687))))

(assert (=> b!924073 e!518526))

(declare-fun c!96364 () Bool)

(assert (=> b!924073 (= c!96364 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415375 () Unit!31187)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!212 (array!55346 array!55348 (_ BitVec 32) (_ BitVec 32) V!31215 V!31215 (_ BitVec 64) (_ BitVec 32) Int) Unit!31187)

(assert (=> b!924073 (= lt!415375 (lemmaListMapContainsThenArrayContainsFrom!212 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55346 (_ BitVec 32) List!18690) Bool)

(assert (=> b!924073 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18687)))

(declare-fun lt!415382 () Unit!31187)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55346 (_ BitVec 32) (_ BitVec 32)) Unit!31187)

(assert (=> b!924073 (= lt!415382 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924073 (contains!4868 lt!415384 k!1099)))

(declare-fun lt!415380 () tuple2!12886)

(declare-fun +!2705 (ListLongMap!11583 tuple2!12886) ListLongMap!11583)

(assert (=> b!924073 (= lt!415384 (+!2705 lt!415374 lt!415380))))

(declare-fun lt!415387 () Unit!31187)

(declare-fun addStillContains!429 (ListLongMap!11583 (_ BitVec 64) V!31215 (_ BitVec 64)) Unit!31187)

(assert (=> b!924073 (= lt!415387 (addStillContains!429 lt!415374 lt!415386 lt!415377 k!1099))))

(assert (=> b!924073 (= (getCurrentListMap!3059 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2705 (getCurrentListMap!3059 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415380))))

(assert (=> b!924073 (= lt!415380 (tuple2!12887 lt!415386 lt!415377))))

(declare-fun get!13988 (ValueCell!9362 V!31215) V!31215)

(declare-fun dynLambda!1494 (Int (_ BitVec 64)) V!31215)

(assert (=> b!924073 (= lt!415377 (get!13988 (select (arr!26619 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1494 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415376 () Unit!31187)

(declare-fun lemmaListMapRecursiveValidKeyArray!95 (array!55346 array!55348 (_ BitVec 32) (_ BitVec 32) V!31215 V!31215 (_ BitVec 32) Int) Unit!31187)

(assert (=> b!924073 (= lt!415376 (lemmaListMapRecursiveValidKeyArray!95 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924073 (= e!518529 lt!415385)))

(declare-fun res!622948 () Bool)

(assert (=> start!78966 (=> (not res!622948) (not e!518536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78966 (= res!622948 (validMask!0 mask!1881))))

(assert (=> start!78966 e!518536))

(assert (=> start!78966 true))

(assert (=> start!78966 tp_is_empty!19687))

(declare-fun e!518531 () Bool)

(declare-fun array_inv!20732 (array!55348) Bool)

(assert (=> start!78966 (and (array_inv!20732 _values!1231) e!518531)))

(assert (=> start!78966 tp!59977))

(declare-fun array_inv!20733 (array!55346) Bool)

(assert (=> start!78966 (array_inv!20733 _keys!1487)))

(declare-fun b!924082 () Bool)

(assert (=> b!924082 (= e!518532 e!518525)))

(declare-fun res!622952 () Bool)

(assert (=> b!924082 (=> (not res!622952) (not e!518525))))

(assert (=> b!924082 (= res!622952 (contains!4868 lt!415379 k!1099))))

(assert (=> b!924082 (= lt!415379 (getCurrentListMap!3059 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924083 () Bool)

(declare-fun res!622953 () Bool)

(assert (=> b!924083 (=> (not res!622953) (not e!518536))))

(assert (=> b!924083 (= res!622953 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18687))))

(declare-fun mapNonEmpty!31287 () Bool)

(declare-fun tp!59978 () Bool)

(declare-fun e!518533 () Bool)

(assert (=> mapNonEmpty!31287 (= mapRes!31287 (and tp!59978 e!518533))))

(declare-fun mapKey!31287 () (_ BitVec 32))

(declare-fun mapRest!31287 () (Array (_ BitVec 32) ValueCell!9362))

(declare-fun mapValue!31287 () ValueCell!9362)

(assert (=> mapNonEmpty!31287 (= (arr!26619 _values!1231) (store mapRest!31287 mapKey!31287 mapValue!31287))))

(declare-fun b!924084 () Bool)

(assert (=> b!924084 (= e!518526 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924085 () Bool)

(assert (=> b!924085 (= e!518531 (and e!518528 mapRes!31287))))

(declare-fun condMapEmpty!31287 () Bool)

(declare-fun mapDefault!31287 () ValueCell!9362)

