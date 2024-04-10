; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78862 () Bool)

(assert start!78862)

(declare-fun b_free!17075 () Bool)

(declare-fun b_next!17075 () Bool)

(assert (=> start!78862 (= b_free!17075 (not b_next!17075))))

(declare-fun tp!59666 () Bool)

(declare-fun b_and!27887 () Bool)

(assert (=> start!78862 (= tp!59666 b_and!27887)))

(declare-fun b!921427 () Bool)

(declare-fun res!621376 () Bool)

(declare-fun e!517078 () Bool)

(assert (=> b!921427 (=> res!621376 e!517078)))

(declare-datatypes ((List!18604 0))(
  ( (Nil!18601) (Cons!18600 (h!19746 (_ BitVec 64)) (t!26409 List!18604)) )
))
(declare-fun contains!4823 (List!18604 (_ BitVec 64)) Bool)

(assert (=> b!921427 (= res!621376 (contains!4823 Nil!18601 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921428 () Bool)

(declare-fun e!517070 () Bool)

(assert (=> b!921428 (= e!517070 (not e!517078))))

(declare-fun res!621383 () Bool)

(assert (=> b!921428 (=> res!621383 e!517078)))

(declare-datatypes ((array!55144 0))(
  ( (array!55145 (arr!26517 (Array (_ BitVec 32) (_ BitVec 64))) (size!26976 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55144)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921428 (= res!621383 (or (bvsge (size!26976 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26976 _keys!1487))))))

(declare-fun e!517075 () Bool)

(assert (=> b!921428 e!517075))

(declare-fun c!96114 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!921428 (= c!96114 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31075 0))(
  ( (V!31076 (val!9842 Int)) )
))
(declare-datatypes ((ValueCell!9310 0))(
  ( (ValueCellFull!9310 (v!12360 V!31075)) (EmptyCell!9310) )
))
(declare-datatypes ((array!55146 0))(
  ( (array!55147 (arr!26518 (Array (_ BitVec 32) ValueCell!9310)) (size!26977 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55146)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31090 0))(
  ( (Unit!31091) )
))
(declare-fun lt!413691 () Unit!31090)

(declare-fun zeroValue!1173 () V!31075)

(declare-fun minValue!1173 () V!31075)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!178 (array!55144 array!55146 (_ BitVec 32) (_ BitVec 32) V!31075 V!31075 (_ BitVec 64) (_ BitVec 32) Int) Unit!31090)

(assert (=> b!921428 (= lt!413691 (lemmaListMapContainsThenArrayContainsFrom!178 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55144 (_ BitVec 32) List!18604) Bool)

(assert (=> b!921428 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18601)))

(declare-fun lt!413688 () Unit!31090)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55144 (_ BitVec 32) (_ BitVec 32)) Unit!31090)

(assert (=> b!921428 (= lt!413688 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12800 0))(
  ( (tuple2!12801 (_1!6411 (_ BitVec 64)) (_2!6411 V!31075)) )
))
(declare-datatypes ((List!18605 0))(
  ( (Nil!18602) (Cons!18601 (h!19747 tuple2!12800) (t!26410 List!18605)) )
))
(declare-datatypes ((ListLongMap!11497 0))(
  ( (ListLongMap!11498 (toList!5764 List!18605)) )
))
(declare-fun lt!413689 () ListLongMap!11497)

(declare-fun lt!413690 () tuple2!12800)

(declare-fun contains!4824 (ListLongMap!11497 (_ BitVec 64)) Bool)

(declare-fun +!2671 (ListLongMap!11497 tuple2!12800) ListLongMap!11497)

(assert (=> b!921428 (contains!4824 (+!2671 lt!413689 lt!413690) k!1099)))

(declare-fun lt!413687 () (_ BitVec 64))

(declare-fun lt!413695 () Unit!31090)

(declare-fun lt!413694 () V!31075)

(declare-fun addStillContains!395 (ListLongMap!11497 (_ BitVec 64) V!31075 (_ BitVec 64)) Unit!31090)

(assert (=> b!921428 (= lt!413695 (addStillContains!395 lt!413689 lt!413687 lt!413694 k!1099))))

(declare-fun getCurrentListMap!3018 (array!55144 array!55146 (_ BitVec 32) (_ BitVec 32) V!31075 V!31075 (_ BitVec 32) Int) ListLongMap!11497)

(assert (=> b!921428 (= (getCurrentListMap!3018 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2671 (getCurrentListMap!3018 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413690))))

(assert (=> b!921428 (= lt!413690 (tuple2!12801 lt!413687 lt!413694))))

(declare-fun get!13918 (ValueCell!9310 V!31075) V!31075)

(declare-fun dynLambda!1460 (Int (_ BitVec 64)) V!31075)

(assert (=> b!921428 (= lt!413694 (get!13918 (select (arr!26518 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1460 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413693 () Unit!31090)

(declare-fun lemmaListMapRecursiveValidKeyArray!61 (array!55144 array!55146 (_ BitVec 32) (_ BitVec 32) V!31075 V!31075 (_ BitVec 32) Int) Unit!31090)

(assert (=> b!921428 (= lt!413693 (lemmaListMapRecursiveValidKeyArray!61 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921429 () Bool)

(declare-fun res!621379 () Bool)

(declare-fun e!517073 () Bool)

(assert (=> b!921429 (=> (not res!621379) (not e!517073))))

(assert (=> b!921429 (= res!621379 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26976 _keys!1487))))))

(declare-fun b!921430 () Bool)

(declare-fun res!621380 () Bool)

(assert (=> b!921430 (=> (not res!621380) (not e!517073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55144 (_ BitVec 32)) Bool)

(assert (=> b!921430 (= res!621380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!621382 () Bool)

(assert (=> start!78862 (=> (not res!621382) (not e!517073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78862 (= res!621382 (validMask!0 mask!1881))))

(assert (=> start!78862 e!517073))

(assert (=> start!78862 true))

(declare-fun tp_is_empty!19583 () Bool)

(assert (=> start!78862 tp_is_empty!19583))

(declare-fun e!517072 () Bool)

(declare-fun array_inv!20662 (array!55146) Bool)

(assert (=> start!78862 (and (array_inv!20662 _values!1231) e!517072)))

(assert (=> start!78862 tp!59666))

(declare-fun array_inv!20663 (array!55144) Bool)

(assert (=> start!78862 (array_inv!20663 _keys!1487)))

(declare-fun b!921431 () Bool)

(declare-fun res!621377 () Bool)

(declare-fun e!517071 () Bool)

(assert (=> b!921431 (=> (not res!621377) (not e!517071))))

(assert (=> b!921431 (= res!621377 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921432 () Bool)

(declare-fun res!621378 () Bool)

(assert (=> b!921432 (=> res!621378 e!517078)))

(declare-fun noDuplicate!1345 (List!18604) Bool)

(assert (=> b!921432 (= res!621378 (not (noDuplicate!1345 Nil!18601)))))

(declare-fun b!921433 () Bool)

(declare-fun res!621384 () Bool)

(assert (=> b!921433 (=> (not res!621384) (not e!517071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921433 (= res!621384 (validKeyInArray!0 k!1099))))

(declare-fun b!921434 () Bool)

(assert (=> b!921434 (= e!517073 e!517071)))

(declare-fun res!621385 () Bool)

(assert (=> b!921434 (=> (not res!621385) (not e!517071))))

(assert (=> b!921434 (= res!621385 (contains!4824 lt!413689 k!1099))))

(assert (=> b!921434 (= lt!413689 (getCurrentListMap!3018 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921435 () Bool)

(declare-fun res!621387 () Bool)

(assert (=> b!921435 (=> (not res!621387) (not e!517073))))

(assert (=> b!921435 (= res!621387 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18601))))

(declare-fun b!921436 () Bool)

(declare-fun e!517077 () Bool)

(assert (=> b!921436 (= e!517077 tp_is_empty!19583)))

(declare-fun b!921437 () Bool)

(assert (=> b!921437 (= e!517078 true)))

(declare-fun lt!413692 () Bool)

(assert (=> b!921437 (= lt!413692 (contains!4823 Nil!18601 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921438 () Bool)

(declare-fun res!621388 () Bool)

(assert (=> b!921438 (=> (not res!621388) (not e!517073))))

(assert (=> b!921438 (= res!621388 (and (= (size!26977 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26976 _keys!1487) (size!26977 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921439 () Bool)

(assert (=> b!921439 (= e!517071 e!517070)))

(declare-fun res!621381 () Bool)

(assert (=> b!921439 (=> (not res!621381) (not e!517070))))

(assert (=> b!921439 (= res!621381 (validKeyInArray!0 lt!413687))))

(assert (=> b!921439 (= lt!413687 (select (arr!26517 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921440 () Bool)

(assert (=> b!921440 (= e!517075 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31131 () Bool)

(declare-fun mapRes!31131 () Bool)

(assert (=> mapIsEmpty!31131 mapRes!31131))

(declare-fun b!921441 () Bool)

(declare-fun res!621386 () Bool)

(assert (=> b!921441 (=> (not res!621386) (not e!517071))))

(declare-fun v!791 () V!31075)

(declare-fun apply!603 (ListLongMap!11497 (_ BitVec 64)) V!31075)

(assert (=> b!921441 (= res!621386 (= (apply!603 lt!413689 k!1099) v!791))))

(declare-fun b!921442 () Bool)

(declare-fun arrayContainsKey!0 (array!55144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921442 (= e!517075 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!921443 () Bool)

(declare-fun e!517074 () Bool)

(assert (=> b!921443 (= e!517074 tp_is_empty!19583)))

(declare-fun b!921444 () Bool)

(assert (=> b!921444 (= e!517072 (and e!517074 mapRes!31131))))

(declare-fun condMapEmpty!31131 () Bool)

(declare-fun mapDefault!31131 () ValueCell!9310)

