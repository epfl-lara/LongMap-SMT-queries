; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74802 () Bool)

(assert start!74802)

(declare-fun b_free!15379 () Bool)

(declare-fun b_next!15379 () Bool)

(assert (=> start!74802 (= b_free!15379 (not b_next!15379))))

(declare-fun tp!53833 () Bool)

(declare-fun b_and!25425 () Bool)

(assert (=> start!74802 (= tp!53833 b_and!25425)))

(declare-fun b!881776 () Bool)

(declare-fun e!490734 () Bool)

(declare-fun tp_is_empty!17623 () Bool)

(assert (=> b!881776 (= e!490734 tp_is_empty!17623)))

(declare-fun b!881777 () Bool)

(declare-fun res!599037 () Bool)

(declare-fun e!490730 () Bool)

(assert (=> b!881777 (=> (not res!599037) (not e!490730))))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51374 0))(
  ( (array!51375 (arr!24708 (Array (_ BitVec 32) (_ BitVec 64))) (size!25148 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51374)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!881777 (= res!599037 (and (= (select (arr!24708 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!881778 () Bool)

(declare-fun e!490731 () Bool)

(declare-fun e!490737 () Bool)

(assert (=> b!881778 (= e!490731 (not e!490737))))

(declare-fun res!599044 () Bool)

(assert (=> b!881778 (=> res!599044 e!490737)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881778 (= res!599044 (not (validKeyInArray!0 (select (arr!24708 _keys!868) from!1053))))))

(declare-datatypes ((V!28545 0))(
  ( (V!28546 (val!8859 Int)) )
))
(declare-datatypes ((tuple2!11728 0))(
  ( (tuple2!11729 (_1!5875 (_ BitVec 64)) (_2!5875 V!28545)) )
))
(declare-datatypes ((List!17541 0))(
  ( (Nil!17538) (Cons!17537 (h!18668 tuple2!11728) (t!24722 List!17541)) )
))
(declare-datatypes ((ListLongMap!10497 0))(
  ( (ListLongMap!10498 (toList!5264 List!17541)) )
))
(declare-fun lt!398863 () ListLongMap!10497)

(declare-fun lt!398860 () ListLongMap!10497)

(assert (=> b!881778 (= lt!398863 lt!398860)))

(declare-fun v!557 () V!28545)

(declare-fun lt!398864 () ListLongMap!10497)

(declare-fun +!2536 (ListLongMap!10497 tuple2!11728) ListLongMap!10497)

(assert (=> b!881778 (= lt!398860 (+!2536 lt!398864 (tuple2!11729 k!854 v!557)))))

(declare-datatypes ((ValueCell!8372 0))(
  ( (ValueCellFull!8372 (v!11319 V!28545)) (EmptyCell!8372) )
))
(declare-datatypes ((array!51376 0))(
  ( (array!51377 (arr!24709 (Array (_ BitVec 32) ValueCell!8372)) (size!25149 (_ BitVec 32))) )
))
(declare-fun lt!398861 () array!51376)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28545)

(declare-fun zeroValue!654 () V!28545)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3227 (array!51374 array!51376 (_ BitVec 32) (_ BitVec 32) V!28545 V!28545 (_ BitVec 32) Int) ListLongMap!10497)

(assert (=> b!881778 (= lt!398863 (getCurrentListMapNoExtraKeys!3227 _keys!868 lt!398861 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51376)

(assert (=> b!881778 (= lt!398864 (getCurrentListMapNoExtraKeys!3227 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30090 0))(
  ( (Unit!30091) )
))
(declare-fun lt!398862 () Unit!30090)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!725 (array!51374 array!51376 (_ BitVec 32) (_ BitVec 32) V!28545 V!28545 (_ BitVec 32) (_ BitVec 64) V!28545 (_ BitVec 32) Int) Unit!30090)

(assert (=> b!881778 (= lt!398862 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!725 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!599039 () Bool)

(assert (=> start!74802 (=> (not res!599039) (not e!490730))))

(assert (=> start!74802 (= res!599039 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25148 _keys!868))))))

(assert (=> start!74802 e!490730))

(assert (=> start!74802 tp_is_empty!17623))

(assert (=> start!74802 true))

(assert (=> start!74802 tp!53833))

(declare-fun array_inv!19458 (array!51374) Bool)

(assert (=> start!74802 (array_inv!19458 _keys!868)))

(declare-fun e!490736 () Bool)

(declare-fun array_inv!19459 (array!51376) Bool)

(assert (=> start!74802 (and (array_inv!19459 _values!688) e!490736)))

(declare-fun b!881779 () Bool)

(declare-fun mapRes!28065 () Bool)

(assert (=> b!881779 (= e!490736 (and e!490734 mapRes!28065))))

(declare-fun condMapEmpty!28065 () Bool)

(declare-fun mapDefault!28065 () ValueCell!8372)

