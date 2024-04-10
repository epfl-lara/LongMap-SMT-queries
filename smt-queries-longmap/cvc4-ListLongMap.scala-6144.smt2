; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78976 () Bool)

(assert start!78976)

(declare-fun b_free!17189 () Bool)

(declare-fun b_next!17189 () Bool)

(assert (=> start!78976 (= b_free!17189 (not b_next!17189))))

(declare-fun tp!60008 () Bool)

(declare-fun b_and!28115 () Bool)

(assert (=> start!78976 (= tp!60008 b_and!28115)))

(declare-fun b!924349 () Bool)

(declare-fun e!518713 () Bool)

(declare-fun e!518715 () Bool)

(assert (=> b!924349 (= e!518713 e!518715)))

(declare-fun res!623086 () Bool)

(assert (=> b!924349 (=> (not res!623086) (not e!518715))))

(declare-datatypes ((V!31227 0))(
  ( (V!31228 (val!9899 Int)) )
))
(declare-datatypes ((tuple2!12896 0))(
  ( (tuple2!12897 (_1!6459 (_ BitVec 64)) (_2!6459 V!31227)) )
))
(declare-datatypes ((List!18698 0))(
  ( (Nil!18695) (Cons!18694 (h!19840 tuple2!12896) (t!26617 List!18698)) )
))
(declare-datatypes ((ListLongMap!11593 0))(
  ( (ListLongMap!11594 (toList!5812 List!18698)) )
))
(declare-fun lt!415599 () ListLongMap!11593)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4872 (ListLongMap!11593 (_ BitVec 64)) Bool)

(assert (=> b!924349 (= res!623086 (contains!4872 lt!415599 k!1099))))

(declare-datatypes ((array!55364 0))(
  ( (array!55365 (arr!26627 (Array (_ BitVec 32) (_ BitVec 64))) (size!27086 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55364)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9367 0))(
  ( (ValueCellFull!9367 (v!12417 V!31227)) (EmptyCell!9367) )
))
(declare-datatypes ((array!55366 0))(
  ( (array!55367 (arr!26628 (Array (_ BitVec 32) ValueCell!9367)) (size!27087 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55366)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31227)

(declare-fun minValue!1173 () V!31227)

(declare-fun getCurrentListMap!3063 (array!55364 array!55366 (_ BitVec 32) (_ BitVec 32) V!31227 V!31227 (_ BitVec 32) Int) ListLongMap!11593)

(assert (=> b!924349 (= lt!415599 (getCurrentListMap!3063 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924350 () Bool)

(declare-fun lt!415611 () ListLongMap!11593)

(declare-fun lt!415601 () V!31227)

(declare-fun apply!642 (ListLongMap!11593 (_ BitVec 64)) V!31227)

(assert (=> b!924350 (= (apply!642 lt!415611 k!1099) lt!415601)))

(declare-fun lt!415598 () V!31227)

(declare-datatypes ((Unit!31202 0))(
  ( (Unit!31203) )
))
(declare-fun lt!415609 () Unit!31202)

(declare-fun lt!415603 () (_ BitVec 64))

(declare-fun addApplyDifferent!364 (ListLongMap!11593 (_ BitVec 64) V!31227 (_ BitVec 64)) Unit!31202)

(assert (=> b!924350 (= lt!415609 (addApplyDifferent!364 lt!415599 lt!415603 lt!415598 k!1099))))

(assert (=> b!924350 (not (= lt!415603 k!1099))))

(declare-fun lt!415608 () Unit!31202)

(declare-datatypes ((List!18699 0))(
  ( (Nil!18696) (Cons!18695 (h!19841 (_ BitVec 64)) (t!26618 List!18699)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55364 (_ BitVec 64) (_ BitVec 32) List!18699) Unit!31202)

(assert (=> b!924350 (= lt!415608 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18696))))

(declare-fun e!518707 () Bool)

(assert (=> b!924350 e!518707))

(declare-fun c!96409 () Bool)

(assert (=> b!924350 (= c!96409 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415607 () Unit!31202)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!215 (array!55364 array!55366 (_ BitVec 32) (_ BitVec 32) V!31227 V!31227 (_ BitVec 64) (_ BitVec 32) Int) Unit!31202)

(assert (=> b!924350 (= lt!415607 (lemmaListMapContainsThenArrayContainsFrom!215 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55364 (_ BitVec 32) List!18699) Bool)

(assert (=> b!924350 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18696)))

(declare-fun lt!415606 () Unit!31202)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55364 (_ BitVec 32) (_ BitVec 32)) Unit!31202)

(assert (=> b!924350 (= lt!415606 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924350 (contains!4872 lt!415611 k!1099)))

(declare-fun lt!415602 () tuple2!12896)

(declare-fun +!2708 (ListLongMap!11593 tuple2!12896) ListLongMap!11593)

(assert (=> b!924350 (= lt!415611 (+!2708 lt!415599 lt!415602))))

(declare-fun lt!415605 () Unit!31202)

(declare-fun addStillContains!432 (ListLongMap!11593 (_ BitVec 64) V!31227 (_ BitVec 64)) Unit!31202)

(assert (=> b!924350 (= lt!415605 (addStillContains!432 lt!415599 lt!415603 lt!415598 k!1099))))

(assert (=> b!924350 (= (getCurrentListMap!3063 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2708 (getCurrentListMap!3063 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415602))))

(assert (=> b!924350 (= lt!415602 (tuple2!12897 lt!415603 lt!415598))))

(declare-fun get!13993 (ValueCell!9367 V!31227) V!31227)

(declare-fun dynLambda!1497 (Int (_ BitVec 64)) V!31227)

(assert (=> b!924350 (= lt!415598 (get!13993 (select (arr!26628 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1497 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415600 () Unit!31202)

(declare-fun lemmaListMapRecursiveValidKeyArray!98 (array!55364 array!55366 (_ BitVec 32) (_ BitVec 32) V!31227 V!31227 (_ BitVec 32) Int) Unit!31202)

(assert (=> b!924350 (= lt!415600 (lemmaListMapRecursiveValidKeyArray!98 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!518708 () Unit!31202)

(assert (=> b!924350 (= e!518708 lt!415609)))

(declare-fun b!924351 () Bool)

(declare-fun res!623088 () Bool)

(assert (=> b!924351 (=> (not res!623088) (not e!518713))))

(assert (=> b!924351 (= res!623088 (and (= (size!27087 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27086 _keys!1487) (size!27087 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924352 () Bool)

(declare-fun res!623081 () Bool)

(assert (=> b!924352 (=> (not res!623081) (not e!518713))))

(assert (=> b!924352 (= res!623081 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18696))))

(declare-fun b!924353 () Bool)

(declare-fun e!518714 () Bool)

(declare-fun tp_is_empty!19697 () Bool)

(assert (=> b!924353 (= e!518714 tp_is_empty!19697)))

(declare-fun b!924354 () Bool)

(declare-fun Unit!31204 () Unit!31202)

(assert (=> b!924354 (= e!518708 Unit!31204)))

(declare-fun b!924355 () Bool)

(declare-fun e!518716 () Bool)

(assert (=> b!924355 (= e!518715 e!518716)))

(declare-fun res!623087 () Bool)

(assert (=> b!924355 (=> (not res!623087) (not e!518716))))

(declare-fun v!791 () V!31227)

(assert (=> b!924355 (= res!623087 (and (= lt!415601 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924355 (= lt!415601 (apply!642 lt!415599 k!1099))))

(declare-fun b!924356 () Bool)

(declare-fun e!518706 () Bool)

(declare-fun e!518705 () Bool)

(declare-fun mapRes!31302 () Bool)

(assert (=> b!924356 (= e!518706 (and e!518705 mapRes!31302))))

(declare-fun condMapEmpty!31302 () Bool)

(declare-fun mapDefault!31302 () ValueCell!9367)

