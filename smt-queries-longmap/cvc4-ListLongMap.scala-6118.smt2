; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78820 () Bool)

(assert start!78820)

(declare-fun b_free!17033 () Bool)

(declare-fun b_next!17033 () Bool)

(assert (=> start!78820 (= b_free!17033 (not b_next!17033))))

(declare-fun tp!59539 () Bool)

(declare-fun b_and!27803 () Bool)

(assert (=> start!78820 (= tp!59539 b_and!27803)))

(declare-fun res!620568 () Bool)

(declare-fun e!516507 () Bool)

(assert (=> start!78820 (=> (not res!620568) (not e!516507))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78820 (= res!620568 (validMask!0 mask!1881))))

(assert (=> start!78820 e!516507))

(assert (=> start!78820 true))

(declare-fun tp_is_empty!19541 () Bool)

(assert (=> start!78820 tp_is_empty!19541))

(declare-datatypes ((V!31019 0))(
  ( (V!31020 (val!9821 Int)) )
))
(declare-datatypes ((ValueCell!9289 0))(
  ( (ValueCellFull!9289 (v!12339 V!31019)) (EmptyCell!9289) )
))
(declare-datatypes ((array!55062 0))(
  ( (array!55063 (arr!26476 (Array (_ BitVec 32) ValueCell!9289)) (size!26935 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55062)

(declare-fun e!516511 () Bool)

(declare-fun array_inv!20634 (array!55062) Bool)

(assert (=> start!78820 (and (array_inv!20634 _values!1231) e!516511)))

(assert (=> start!78820 tp!59539))

(declare-datatypes ((array!55064 0))(
  ( (array!55065 (arr!26477 (Array (_ BitVec 32) (_ BitVec 64))) (size!26936 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55064)

(declare-fun array_inv!20635 (array!55064) Bool)

(assert (=> start!78820 (array_inv!20635 _keys!1487)))

(declare-fun b!920256 () Bool)

(declare-fun e!516509 () Bool)

(assert (=> b!920256 (= e!516509 (not true))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!18569 0))(
  ( (Nil!18566) (Cons!18565 (h!19711 (_ BitVec 64)) (t!26332 List!18569)) )
))
(declare-fun arrayNoDuplicates!0 (array!55064 (_ BitVec 32) List!18569) Bool)

(assert (=> b!920256 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18566)))

(declare-datatypes ((Unit!31058 0))(
  ( (Unit!31059) )
))
(declare-fun lt!413124 () Unit!31058)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55064 (_ BitVec 32) (_ BitVec 32)) Unit!31058)

(assert (=> b!920256 (= lt!413124 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12766 0))(
  ( (tuple2!12767 (_1!6394 (_ BitVec 64)) (_2!6394 V!31019)) )
))
(declare-datatypes ((List!18570 0))(
  ( (Nil!18567) (Cons!18566 (h!19712 tuple2!12766) (t!26333 List!18570)) )
))
(declare-datatypes ((ListLongMap!11463 0))(
  ( (ListLongMap!11464 (toList!5747 List!18570)) )
))
(declare-fun lt!413125 () ListLongMap!11463)

(declare-fun lt!413127 () tuple2!12766)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4792 (ListLongMap!11463 (_ BitVec 64)) Bool)

(declare-fun +!2655 (ListLongMap!11463 tuple2!12766) ListLongMap!11463)

(assert (=> b!920256 (contains!4792 (+!2655 lt!413125 lt!413127) k!1099)))

(declare-fun lt!413128 () Unit!31058)

(declare-fun lt!413123 () V!31019)

(declare-fun lt!413126 () (_ BitVec 64))

(declare-fun addStillContains!379 (ListLongMap!11463 (_ BitVec 64) V!31019 (_ BitVec 64)) Unit!31058)

(assert (=> b!920256 (= lt!413128 (addStillContains!379 lt!413125 lt!413126 lt!413123 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31019)

(declare-fun minValue!1173 () V!31019)

(declare-fun getCurrentListMap!3002 (array!55064 array!55062 (_ BitVec 32) (_ BitVec 32) V!31019 V!31019 (_ BitVec 32) Int) ListLongMap!11463)

(assert (=> b!920256 (= (getCurrentListMap!3002 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2655 (getCurrentListMap!3002 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413127))))

(assert (=> b!920256 (= lt!413127 (tuple2!12767 lt!413126 lt!413123))))

(declare-fun get!13888 (ValueCell!9289 V!31019) V!31019)

(declare-fun dynLambda!1444 (Int (_ BitVec 64)) V!31019)

(assert (=> b!920256 (= lt!413123 (get!13888 (select (arr!26476 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1444 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413122 () Unit!31058)

(declare-fun lemmaListMapRecursiveValidKeyArray!45 (array!55064 array!55062 (_ BitVec 32) (_ BitVec 32) V!31019 V!31019 (_ BitVec 32) Int) Unit!31058)

(assert (=> b!920256 (= lt!413122 (lemmaListMapRecursiveValidKeyArray!45 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920257 () Bool)

(declare-fun e!516505 () Bool)

(assert (=> b!920257 (= e!516505 tp_is_empty!19541)))

(declare-fun b!920258 () Bool)

(declare-fun res!620565 () Bool)

(declare-fun e!516508 () Bool)

(assert (=> b!920258 (=> (not res!620565) (not e!516508))))

(declare-fun v!791 () V!31019)

(declare-fun apply!589 (ListLongMap!11463 (_ BitVec 64)) V!31019)

(assert (=> b!920258 (= res!620565 (= (apply!589 lt!413125 k!1099) v!791))))

(declare-fun b!920259 () Bool)

(declare-fun res!620566 () Bool)

(assert (=> b!920259 (=> (not res!620566) (not e!516508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920259 (= res!620566 (validKeyInArray!0 k!1099))))

(declare-fun b!920260 () Bool)

(declare-fun res!620560 () Bool)

(assert (=> b!920260 (=> (not res!620560) (not e!516507))))

(assert (=> b!920260 (= res!620560 (and (= (size!26935 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26936 _keys!1487) (size!26935 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920261 () Bool)

(declare-fun res!620561 () Bool)

(assert (=> b!920261 (=> (not res!620561) (not e!516507))))

(assert (=> b!920261 (= res!620561 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26936 _keys!1487))))))

(declare-fun b!920262 () Bool)

(declare-fun res!620564 () Bool)

(assert (=> b!920262 (=> (not res!620564) (not e!516507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55064 (_ BitVec 32)) Bool)

(assert (=> b!920262 (= res!620564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920263 () Bool)

(declare-fun e!516506 () Bool)

(assert (=> b!920263 (= e!516506 tp_is_empty!19541)))

(declare-fun b!920264 () Bool)

(assert (=> b!920264 (= e!516508 e!516509)))

(declare-fun res!620562 () Bool)

(assert (=> b!920264 (=> (not res!620562) (not e!516509))))

(assert (=> b!920264 (= res!620562 (validKeyInArray!0 lt!413126))))

(assert (=> b!920264 (= lt!413126 (select (arr!26477 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31068 () Bool)

(declare-fun mapRes!31068 () Bool)

(assert (=> mapIsEmpty!31068 mapRes!31068))

(declare-fun b!920265 () Bool)

(declare-fun res!620567 () Bool)

(assert (=> b!920265 (=> (not res!620567) (not e!516508))))

(assert (=> b!920265 (= res!620567 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31068 () Bool)

(declare-fun tp!59540 () Bool)

(assert (=> mapNonEmpty!31068 (= mapRes!31068 (and tp!59540 e!516506))))

(declare-fun mapKey!31068 () (_ BitVec 32))

(declare-fun mapRest!31068 () (Array (_ BitVec 32) ValueCell!9289))

(declare-fun mapValue!31068 () ValueCell!9289)

(assert (=> mapNonEmpty!31068 (= (arr!26476 _values!1231) (store mapRest!31068 mapKey!31068 mapValue!31068))))

(declare-fun b!920266 () Bool)

(assert (=> b!920266 (= e!516511 (and e!516505 mapRes!31068))))

(declare-fun condMapEmpty!31068 () Bool)

(declare-fun mapDefault!31068 () ValueCell!9289)

