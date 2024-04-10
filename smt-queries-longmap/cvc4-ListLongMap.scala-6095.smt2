; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78682 () Bool)

(assert start!78682)

(declare-fun b_free!16895 () Bool)

(declare-fun b_next!16895 () Bool)

(assert (=> start!78682 (= b_free!16895 (not b_next!16895))))

(declare-fun tp!59125 () Bool)

(declare-fun b_and!27527 () Bool)

(assert (=> start!78682 (= tp!59125 b_and!27527)))

(declare-fun b!917427 () Bool)

(declare-fun res!618499 () Bool)

(declare-fun e!515060 () Bool)

(assert (=> b!917427 (=> (not res!618499) (not e!515060))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917427 (= res!618499 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917428 () Bool)

(declare-fun res!618494 () Bool)

(declare-fun e!515056 () Bool)

(assert (=> b!917428 (=> (not res!618494) (not e!515056))))

(declare-datatypes ((array!54792 0))(
  ( (array!54793 (arr!26341 (Array (_ BitVec 32) (_ BitVec 64))) (size!26800 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54792)

(declare-datatypes ((List!18476 0))(
  ( (Nil!18473) (Cons!18472 (h!19618 (_ BitVec 64)) (t!26101 List!18476)) )
))
(declare-fun arrayNoDuplicates!0 (array!54792 (_ BitVec 32) List!18476) Bool)

(assert (=> b!917428 (= res!618494 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18473))))

(declare-fun b!917429 () Bool)

(declare-fun res!618491 () Bool)

(assert (=> b!917429 (=> (not res!618491) (not e!515056))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30835 0))(
  ( (V!30836 (val!9752 Int)) )
))
(declare-datatypes ((ValueCell!9220 0))(
  ( (ValueCellFull!9220 (v!12270 V!30835)) (EmptyCell!9220) )
))
(declare-datatypes ((array!54794 0))(
  ( (array!54795 (arr!26342 (Array (_ BitVec 32) ValueCell!9220)) (size!26801 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54794)

(assert (=> b!917429 (= res!618491 (and (= (size!26801 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26800 _keys!1487) (size!26801 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917430 () Bool)

(assert (=> b!917430 (= e!515056 e!515060)))

(declare-fun res!618493 () Bool)

(assert (=> b!917430 (=> (not res!618493) (not e!515060))))

(declare-datatypes ((tuple2!12666 0))(
  ( (tuple2!12667 (_1!6344 (_ BitVec 64)) (_2!6344 V!30835)) )
))
(declare-datatypes ((List!18477 0))(
  ( (Nil!18474) (Cons!18473 (h!19619 tuple2!12666) (t!26102 List!18477)) )
))
(declare-datatypes ((ListLongMap!11363 0))(
  ( (ListLongMap!11364 (toList!5697 List!18477)) )
))
(declare-fun lt!412010 () ListLongMap!11363)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4749 (ListLongMap!11363 (_ BitVec 64)) Bool)

(assert (=> b!917430 (= res!618493 (contains!4749 lt!412010 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30835)

(declare-fun minValue!1173 () V!30835)

(declare-fun getCurrentListMap!2956 (array!54792 array!54794 (_ BitVec 32) (_ BitVec 32) V!30835 V!30835 (_ BitVec 32) Int) ListLongMap!11363)

(assert (=> b!917430 (= lt!412010 (getCurrentListMap!2956 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!30861 () Bool)

(declare-fun mapRes!30861 () Bool)

(assert (=> mapIsEmpty!30861 mapRes!30861))

(declare-fun b!917431 () Bool)

(declare-fun e!515057 () Bool)

(assert (=> b!917431 (= e!515057 (not true))))

(declare-fun lt!412011 () (_ BitVec 64))

(declare-fun +!2613 (ListLongMap!11363 tuple2!12666) ListLongMap!11363)

(declare-fun get!13800 (ValueCell!9220 V!30835) V!30835)

(declare-fun dynLambda!1402 (Int (_ BitVec 64)) V!30835)

(assert (=> b!917431 (= (getCurrentListMap!2956 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2613 (getCurrentListMap!2956 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12667 lt!412011 (get!13800 (select (arr!26342 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1402 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30974 0))(
  ( (Unit!30975) )
))
(declare-fun lt!412012 () Unit!30974)

(declare-fun lemmaListMapRecursiveValidKeyArray!3 (array!54792 array!54794 (_ BitVec 32) (_ BitVec 32) V!30835 V!30835 (_ BitVec 32) Int) Unit!30974)

(assert (=> b!917431 (= lt!412012 (lemmaListMapRecursiveValidKeyArray!3 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917432 () Bool)

(declare-fun e!515061 () Bool)

(declare-fun tp_is_empty!19403 () Bool)

(assert (=> b!917432 (= e!515061 tp_is_empty!19403)))

(declare-fun b!917433 () Bool)

(declare-fun e!515058 () Bool)

(assert (=> b!917433 (= e!515058 tp_is_empty!19403)))

(declare-fun b!917434 () Bool)

(declare-fun res!618492 () Bool)

(assert (=> b!917434 (=> (not res!618492) (not e!515060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917434 (= res!618492 (validKeyInArray!0 k!1099))))

(declare-fun b!917435 () Bool)

(declare-fun res!618498 () Bool)

(assert (=> b!917435 (=> (not res!618498) (not e!515056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54792 (_ BitVec 32)) Bool)

(assert (=> b!917435 (= res!618498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917436 () Bool)

(declare-fun e!515062 () Bool)

(assert (=> b!917436 (= e!515062 (and e!515058 mapRes!30861))))

(declare-fun condMapEmpty!30861 () Bool)

(declare-fun mapDefault!30861 () ValueCell!9220)

