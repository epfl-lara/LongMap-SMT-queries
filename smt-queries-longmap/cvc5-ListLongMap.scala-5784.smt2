; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74626 () Bool)

(assert start!74626)

(declare-fun b_free!15295 () Bool)

(declare-fun b_next!15295 () Bool)

(assert (=> start!74626 (= b_free!15295 (not b_next!15295))))

(declare-fun tp!53569 () Bool)

(declare-fun b_and!25193 () Bool)

(assert (=> start!74626 (= tp!53569 b_and!25193)))

(declare-fun b!879424 () Bool)

(declare-fun res!597474 () Bool)

(declare-fun e!489418 () Bool)

(assert (=> b!879424 (=> (not res!597474) (not e!489418))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879424 (= res!597474 (validKeyInArray!0 k!854))))

(declare-fun b!879425 () Bool)

(declare-fun e!489414 () Bool)

(declare-fun e!489415 () Bool)

(assert (=> b!879425 (= e!489414 (not e!489415))))

(declare-fun res!597476 () Bool)

(assert (=> b!879425 (=> res!597476 e!489415)))

(declare-datatypes ((array!51206 0))(
  ( (array!51207 (arr!24628 (Array (_ BitVec 32) (_ BitVec 64))) (size!25068 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51206)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!879425 (= res!597476 (not (validKeyInArray!0 (select (arr!24628 _keys!868) from!1053))))))

(declare-datatypes ((V!28433 0))(
  ( (V!28434 (val!8817 Int)) )
))
(declare-datatypes ((tuple2!11662 0))(
  ( (tuple2!11663 (_1!5842 (_ BitVec 64)) (_2!5842 V!28433)) )
))
(declare-datatypes ((List!17480 0))(
  ( (Nil!17477) (Cons!17476 (h!18607 tuple2!11662) (t!24577 List!17480)) )
))
(declare-datatypes ((ListLongMap!10431 0))(
  ( (ListLongMap!10432 (toList!5231 List!17480)) )
))
(declare-fun lt!397596 () ListLongMap!10431)

(declare-fun lt!397591 () ListLongMap!10431)

(assert (=> b!879425 (= lt!397596 lt!397591)))

(declare-fun lt!397595 () ListLongMap!10431)

(declare-fun v!557 () V!28433)

(declare-fun +!2504 (ListLongMap!10431 tuple2!11662) ListLongMap!10431)

(assert (=> b!879425 (= lt!397591 (+!2504 lt!397595 (tuple2!11663 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28433)

(declare-fun zeroValue!654 () V!28433)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8330 0))(
  ( (ValueCellFull!8330 (v!11261 V!28433)) (EmptyCell!8330) )
))
(declare-datatypes ((array!51208 0))(
  ( (array!51209 (arr!24629 (Array (_ BitVec 32) ValueCell!8330)) (size!25069 (_ BitVec 32))) )
))
(declare-fun lt!397594 () array!51208)

(declare-fun getCurrentListMapNoExtraKeys!3198 (array!51206 array!51208 (_ BitVec 32) (_ BitVec 32) V!28433 V!28433 (_ BitVec 32) Int) ListLongMap!10431)

(assert (=> b!879425 (= lt!397596 (getCurrentListMapNoExtraKeys!3198 _keys!868 lt!397594 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51208)

(assert (=> b!879425 (= lt!397595 (getCurrentListMapNoExtraKeys!3198 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30032 0))(
  ( (Unit!30033) )
))
(declare-fun lt!397593 () Unit!30032)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!698 (array!51206 array!51208 (_ BitVec 32) (_ BitVec 32) V!28433 V!28433 (_ BitVec 32) (_ BitVec 64) V!28433 (_ BitVec 32) Int) Unit!30032)

(assert (=> b!879425 (= lt!397593 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!698 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!597473 () Bool)

(assert (=> start!74626 (=> (not res!597473) (not e!489418))))

(assert (=> start!74626 (= res!597473 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25068 _keys!868))))))

(assert (=> start!74626 e!489418))

(declare-fun tp_is_empty!17539 () Bool)

(assert (=> start!74626 tp_is_empty!17539))

(assert (=> start!74626 true))

(assert (=> start!74626 tp!53569))

(declare-fun array_inv!19408 (array!51206) Bool)

(assert (=> start!74626 (array_inv!19408 _keys!868)))

(declare-fun e!489413 () Bool)

(declare-fun array_inv!19409 (array!51208) Bool)

(assert (=> start!74626 (and (array_inv!19409 _values!688) e!489413)))

(declare-fun b!879426 () Bool)

(declare-fun e!489417 () Bool)

(declare-fun mapRes!27927 () Bool)

(assert (=> b!879426 (= e!489413 (and e!489417 mapRes!27927))))

(declare-fun condMapEmpty!27927 () Bool)

(declare-fun mapDefault!27927 () ValueCell!8330)

