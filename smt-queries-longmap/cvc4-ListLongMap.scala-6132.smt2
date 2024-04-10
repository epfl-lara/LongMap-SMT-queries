; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78904 () Bool)

(assert start!78904)

(declare-fun b_free!17117 () Bool)

(declare-fun b_next!17117 () Bool)

(assert (=> start!78904 (= b_free!17117 (not b_next!17117))))

(declare-fun tp!59792 () Bool)

(declare-fun b_and!27971 () Bool)

(assert (=> start!78904 (= tp!59792 b_and!27971)))

(declare-fun mapNonEmpty!31194 () Bool)

(declare-fun mapRes!31194 () Bool)

(declare-fun tp!59791 () Bool)

(declare-fun e!517598 () Bool)

(assert (=> mapNonEmpty!31194 (= mapRes!31194 (and tp!59791 e!517598))))

(declare-fun mapKey!31194 () (_ BitVec 32))

(declare-datatypes ((V!31131 0))(
  ( (V!31132 (val!9863 Int)) )
))
(declare-datatypes ((ValueCell!9331 0))(
  ( (ValueCellFull!9331 (v!12381 V!31131)) (EmptyCell!9331) )
))
(declare-fun mapValue!31194 () ValueCell!9331)

(declare-fun mapRest!31194 () (Array (_ BitVec 32) ValueCell!9331))

(declare-datatypes ((array!55226 0))(
  ( (array!55227 (arr!26558 (Array (_ BitVec 32) ValueCell!9331)) (size!27017 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55226)

(assert (=> mapNonEmpty!31194 (= (arr!26558 _values!1231) (store mapRest!31194 mapKey!31194 mapValue!31194))))

(declare-fun b!922471 () Bool)

(declare-fun e!517596 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!922471 (= e!517596 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922472 () Bool)

(declare-fun e!517600 () Bool)

(assert (=> b!922472 (= e!517600 (not true))))

(declare-fun lt!414257 () (_ BitVec 64))

(assert (=> b!922472 (not (= lt!414257 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((Unit!31118 0))(
  ( (Unit!31119) )
))
(declare-fun lt!414255 () Unit!31118)

(declare-datatypes ((array!55228 0))(
  ( (array!55229 (arr!26559 (Array (_ BitVec 32) (_ BitVec 64))) (size!27018 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55228)

(declare-datatypes ((List!18636 0))(
  ( (Nil!18633) (Cons!18632 (h!19778 (_ BitVec 64)) (t!26483 List!18636)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55228 (_ BitVec 64) (_ BitVec 32) List!18636) Unit!31118)

(assert (=> b!922472 (= lt!414255 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18633))))

(assert (=> b!922472 e!517596))

(declare-fun c!96177 () Bool)

(assert (=> b!922472 (= c!96177 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!414262 () Unit!31118)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31131)

(declare-fun minValue!1173 () V!31131)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!192 (array!55228 array!55226 (_ BitVec 32) (_ BitVec 32) V!31131 V!31131 (_ BitVec 64) (_ BitVec 32) Int) Unit!31118)

(assert (=> b!922472 (= lt!414262 (lemmaListMapContainsThenArrayContainsFrom!192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55228 (_ BitVec 32) List!18636) Bool)

(assert (=> b!922472 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18633)))

(declare-fun lt!414258 () Unit!31118)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55228 (_ BitVec 32) (_ BitVec 32)) Unit!31118)

(assert (=> b!922472 (= lt!414258 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12832 0))(
  ( (tuple2!12833 (_1!6427 (_ BitVec 64)) (_2!6427 V!31131)) )
))
(declare-datatypes ((List!18637 0))(
  ( (Nil!18634) (Cons!18633 (h!19779 tuple2!12832) (t!26484 List!18637)) )
))
(declare-datatypes ((ListLongMap!11529 0))(
  ( (ListLongMap!11530 (toList!5780 List!18637)) )
))
(declare-fun lt!414256 () ListLongMap!11529)

(declare-fun lt!414261 () tuple2!12832)

(declare-fun contains!4843 (ListLongMap!11529 (_ BitVec 64)) Bool)

(declare-fun +!2685 (ListLongMap!11529 tuple2!12832) ListLongMap!11529)

(assert (=> b!922472 (contains!4843 (+!2685 lt!414256 lt!414261) k!1099)))

(declare-fun lt!414254 () Unit!31118)

(declare-fun lt!414259 () V!31131)

(declare-fun addStillContains!409 (ListLongMap!11529 (_ BitVec 64) V!31131 (_ BitVec 64)) Unit!31118)

(assert (=> b!922472 (= lt!414254 (addStillContains!409 lt!414256 lt!414257 lt!414259 k!1099))))

(declare-fun getCurrentListMap!3034 (array!55228 array!55226 (_ BitVec 32) (_ BitVec 32) V!31131 V!31131 (_ BitVec 32) Int) ListLongMap!11529)

(assert (=> b!922472 (= (getCurrentListMap!3034 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2685 (getCurrentListMap!3034 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414261))))

(assert (=> b!922472 (= lt!414261 (tuple2!12833 lt!414257 lt!414259))))

(declare-fun get!13946 (ValueCell!9331 V!31131) V!31131)

(declare-fun dynLambda!1474 (Int (_ BitVec 64)) V!31131)

(assert (=> b!922472 (= lt!414259 (get!13946 (select (arr!26558 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1474 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414260 () Unit!31118)

(declare-fun lemmaListMapRecursiveValidKeyArray!75 (array!55228 array!55226 (_ BitVec 32) (_ BitVec 32) V!31131 V!31131 (_ BitVec 32) Int) Unit!31118)

(assert (=> b!922472 (= lt!414260 (lemmaListMapRecursiveValidKeyArray!75 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922473 () Bool)

(declare-fun e!517597 () Bool)

(declare-fun tp_is_empty!19625 () Bool)

(assert (=> b!922473 (= e!517597 tp_is_empty!19625)))

(declare-fun b!922474 () Bool)

(declare-fun e!517599 () Bool)

(assert (=> b!922474 (= e!517599 (and e!517597 mapRes!31194))))

(declare-fun condMapEmpty!31194 () Bool)

(declare-fun mapDefault!31194 () ValueCell!9331)

