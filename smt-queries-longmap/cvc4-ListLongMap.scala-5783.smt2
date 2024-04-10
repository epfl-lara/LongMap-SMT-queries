; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74604 () Bool)

(assert start!74604)

(declare-fun b_free!15293 () Bool)

(declare-fun b_next!15293 () Bool)

(assert (=> start!74604 (= b_free!15293 (not b_next!15293))))

(declare-fun tp!53561 () Bool)

(declare-fun b_and!25173 () Bool)

(assert (=> start!74604 (= tp!53561 b_and!25173)))

(declare-fun b!879253 () Bool)

(declare-fun e!489311 () Bool)

(declare-fun tp_is_empty!17537 () Bool)

(assert (=> b!879253 (= e!489311 tp_is_empty!17537)))

(declare-fun b!879254 () Bool)

(declare-fun e!489314 () Bool)

(declare-fun e!489312 () Bool)

(assert (=> b!879254 (= e!489314 (not e!489312))))

(declare-fun res!597400 () Bool)

(assert (=> b!879254 (=> res!597400 e!489312)))

(declare-datatypes ((array!51200 0))(
  ( (array!51201 (arr!24626 (Array (_ BitVec 32) (_ BitVec 64))) (size!25066 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51200)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879254 (= res!597400 (not (validKeyInArray!0 (select (arr!24626 _keys!868) from!1053))))))

(declare-datatypes ((V!28429 0))(
  ( (V!28430 (val!8816 Int)) )
))
(declare-datatypes ((tuple2!11660 0))(
  ( (tuple2!11661 (_1!5841 (_ BitVec 64)) (_2!5841 V!28429)) )
))
(declare-datatypes ((List!17478 0))(
  ( (Nil!17475) (Cons!17474 (h!18605 tuple2!11660) (t!24573 List!17478)) )
))
(declare-datatypes ((ListLongMap!10429 0))(
  ( (ListLongMap!10430 (toList!5230 List!17478)) )
))
(declare-fun lt!397506 () ListLongMap!10429)

(declare-fun lt!397504 () ListLongMap!10429)

(assert (=> b!879254 (= lt!397506 lt!397504)))

(declare-fun v!557 () V!28429)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!397505 () ListLongMap!10429)

(declare-fun +!2503 (ListLongMap!10429 tuple2!11660) ListLongMap!10429)

(assert (=> b!879254 (= lt!397504 (+!2503 lt!397505 (tuple2!11661 k!854 v!557)))))

(declare-datatypes ((ValueCell!8329 0))(
  ( (ValueCellFull!8329 (v!11256 V!28429)) (EmptyCell!8329) )
))
(declare-datatypes ((array!51202 0))(
  ( (array!51203 (arr!24627 (Array (_ BitVec 32) ValueCell!8329)) (size!25067 (_ BitVec 32))) )
))
(declare-fun lt!397500 () array!51202)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28429)

(declare-fun zeroValue!654 () V!28429)

(declare-fun getCurrentListMapNoExtraKeys!3197 (array!51200 array!51202 (_ BitVec 32) (_ BitVec 32) V!28429 V!28429 (_ BitVec 32) Int) ListLongMap!10429)

(assert (=> b!879254 (= lt!397506 (getCurrentListMapNoExtraKeys!3197 _keys!868 lt!397500 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51202)

(assert (=> b!879254 (= lt!397505 (getCurrentListMapNoExtraKeys!3197 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30030 0))(
  ( (Unit!30031) )
))
(declare-fun lt!397502 () Unit!30030)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!697 (array!51200 array!51202 (_ BitVec 32) (_ BitVec 32) V!28429 V!28429 (_ BitVec 32) (_ BitVec 64) V!28429 (_ BitVec 32) Int) Unit!30030)

(assert (=> b!879254 (= lt!397502 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!697 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879255 () Bool)

(declare-fun lt!397503 () ListLongMap!10429)

(declare-fun get!12937 (ValueCell!8329 V!28429) V!28429)

(declare-fun dynLambda!1222 (Int (_ BitVec 64)) V!28429)

(assert (=> b!879255 (= e!489312 (= lt!397503 (+!2503 lt!397504 (tuple2!11661 (select (arr!24626 _keys!868) from!1053) (get!12937 (select (arr!24627 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun mapNonEmpty!27921 () Bool)

(declare-fun mapRes!27921 () Bool)

(declare-fun tp!53560 () Bool)

(assert (=> mapNonEmpty!27921 (= mapRes!27921 (and tp!53560 e!489311))))

(declare-fun mapKey!27921 () (_ BitVec 32))

(declare-fun mapRest!27921 () (Array (_ BitVec 32) ValueCell!8329))

(declare-fun mapValue!27921 () ValueCell!8329)

(assert (=> mapNonEmpty!27921 (= (arr!24627 _values!688) (store mapRest!27921 mapKey!27921 mapValue!27921))))

(declare-fun b!879256 () Bool)

(declare-fun res!597395 () Bool)

(declare-fun e!489316 () Bool)

(assert (=> b!879256 (=> (not res!597395) (not e!489316))))

(declare-datatypes ((List!17479 0))(
  ( (Nil!17476) (Cons!17475 (h!18606 (_ BitVec 64)) (t!24574 List!17479)) )
))
(declare-fun arrayNoDuplicates!0 (array!51200 (_ BitVec 32) List!17479) Bool)

(assert (=> b!879256 (= res!597395 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17476))))

(declare-fun b!879257 () Bool)

(declare-fun e!489313 () Bool)

(declare-fun e!489310 () Bool)

(assert (=> b!879257 (= e!489313 (and e!489310 mapRes!27921))))

(declare-fun condMapEmpty!27921 () Bool)

(declare-fun mapDefault!27921 () ValueCell!8329)

