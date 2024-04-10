; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78744 () Bool)

(assert start!78744)

(declare-fun b_free!16957 () Bool)

(declare-fun b_next!16957 () Bool)

(assert (=> start!78744 (= b_free!16957 (not b_next!16957))))

(declare-fun tp!59312 () Bool)

(declare-fun b_and!27651 () Bool)

(assert (=> start!78744 (= tp!59312 b_and!27651)))

(declare-fun b!918699 () Bool)

(declare-fun e!515709 () Bool)

(assert (=> b!918699 (= e!515709 (not true))))

(declare-datatypes ((V!30919 0))(
  ( (V!30920 (val!9783 Int)) )
))
(declare-datatypes ((tuple2!12712 0))(
  ( (tuple2!12713 (_1!6367 (_ BitVec 64)) (_2!6367 V!30919)) )
))
(declare-datatypes ((List!18518 0))(
  ( (Nil!18515) (Cons!18514 (h!19660 tuple2!12712) (t!26205 List!18518)) )
))
(declare-datatypes ((ListLongMap!11409 0))(
  ( (ListLongMap!11410 (toList!5720 List!18518)) )
))
(declare-fun lt!412350 () ListLongMap!11409)

(declare-fun lt!412352 () tuple2!12712)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4766 (ListLongMap!11409 (_ BitVec 64)) Bool)

(declare-fun +!2632 (ListLongMap!11409 tuple2!12712) ListLongMap!11409)

(assert (=> b!918699 (contains!4766 (+!2632 lt!412350 lt!412352) k!1099)))

(declare-fun lt!412353 () V!30919)

(declare-datatypes ((Unit!31012 0))(
  ( (Unit!31013) )
))
(declare-fun lt!412354 () Unit!31012)

(declare-fun lt!412351 () (_ BitVec 64))

(declare-fun addStillContains!356 (ListLongMap!11409 (_ BitVec 64) V!30919 (_ BitVec 64)) Unit!31012)

(assert (=> b!918699 (= lt!412354 (addStillContains!356 lt!412350 lt!412351 lt!412353 k!1099))))

(declare-datatypes ((array!54914 0))(
  ( (array!54915 (arr!26402 (Array (_ BitVec 32) (_ BitVec 64))) (size!26861 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54914)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9251 0))(
  ( (ValueCellFull!9251 (v!12301 V!30919)) (EmptyCell!9251) )
))
(declare-datatypes ((array!54916 0))(
  ( (array!54917 (arr!26403 (Array (_ BitVec 32) ValueCell!9251)) (size!26862 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54916)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30919)

(declare-fun minValue!1173 () V!30919)

(declare-fun getCurrentListMap!2976 (array!54914 array!54916 (_ BitVec 32) (_ BitVec 32) V!30919 V!30919 (_ BitVec 32) Int) ListLongMap!11409)

(assert (=> b!918699 (= (getCurrentListMap!2976 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2632 (getCurrentListMap!2976 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412352))))

(assert (=> b!918699 (= lt!412352 (tuple2!12713 lt!412351 lt!412353))))

(declare-fun get!13841 (ValueCell!9251 V!30919) V!30919)

(declare-fun dynLambda!1421 (Int (_ BitVec 64)) V!30919)

(assert (=> b!918699 (= lt!412353 (get!13841 (select (arr!26403 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1421 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412349 () Unit!31012)

(declare-fun lemmaListMapRecursiveValidKeyArray!22 (array!54914 array!54916 (_ BitVec 32) (_ BitVec 32) V!30919 V!30919 (_ BitVec 32) Int) Unit!31012)

(assert (=> b!918699 (= lt!412349 (lemmaListMapRecursiveValidKeyArray!22 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918700 () Bool)

(declare-fun e!515707 () Bool)

(declare-fun e!515708 () Bool)

(declare-fun mapRes!30954 () Bool)

(assert (=> b!918700 (= e!515707 (and e!515708 mapRes!30954))))

(declare-fun condMapEmpty!30954 () Bool)

(declare-fun mapDefault!30954 () ValueCell!9251)

