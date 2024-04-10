; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74600 () Bool)

(assert start!74600)

(declare-fun b_free!15289 () Bool)

(declare-fun b_next!15289 () Bool)

(assert (=> start!74600 (= b_free!15289 (not b_next!15289))))

(declare-fun tp!53548 () Bool)

(declare-fun b_and!25165 () Bool)

(assert (=> start!74600 (= tp!53548 b_and!25165)))

(declare-fun b!879171 () Bool)

(declare-fun e!489272 () Bool)

(declare-fun e!489268 () Bool)

(assert (=> b!879171 (= e!489272 e!489268)))

(declare-fun res!597340 () Bool)

(assert (=> b!879171 (=> (not res!597340) (not e!489268))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879171 (= res!597340 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28425 0))(
  ( (V!28426 (val!8814 Int)) )
))
(declare-datatypes ((tuple2!11656 0))(
  ( (tuple2!11657 (_1!5839 (_ BitVec 64)) (_2!5839 V!28425)) )
))
(declare-datatypes ((List!17474 0))(
  ( (Nil!17471) (Cons!17470 (h!18601 tuple2!11656) (t!24565 List!17474)) )
))
(declare-datatypes ((ListLongMap!10425 0))(
  ( (ListLongMap!10426 (toList!5228 List!17474)) )
))
(declare-fun lt!397463 () ListLongMap!10425)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51192 0))(
  ( (array!51193 (arr!24622 (Array (_ BitVec 32) (_ BitVec 64))) (size!25062 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51192)

(declare-fun minValue!654 () V!28425)

(declare-fun zeroValue!654 () V!28425)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8327 0))(
  ( (ValueCellFull!8327 (v!11254 V!28425)) (EmptyCell!8327) )
))
(declare-datatypes ((array!51194 0))(
  ( (array!51195 (arr!24623 (Array (_ BitVec 32) ValueCell!8327)) (size!25063 (_ BitVec 32))) )
))
(declare-fun lt!397464 () array!51194)

(declare-fun getCurrentListMapNoExtraKeys!3195 (array!51192 array!51194 (_ BitVec 32) (_ BitVec 32) V!28425 V!28425 (_ BitVec 32) Int) ListLongMap!10425)

(assert (=> b!879171 (= lt!397463 (getCurrentListMapNoExtraKeys!3195 _keys!868 lt!397464 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28425)

(declare-fun _values!688 () array!51194)

(assert (=> b!879171 (= lt!397464 (array!51195 (store (arr!24623 _values!688) i!612 (ValueCellFull!8327 v!557)) (size!25063 _values!688)))))

(declare-fun lt!397459 () ListLongMap!10425)

(assert (=> b!879171 (= lt!397459 (getCurrentListMapNoExtraKeys!3195 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879172 () Bool)

(declare-fun e!489273 () Bool)

(declare-fun tp_is_empty!17533 () Bool)

(assert (=> b!879172 (= e!489273 tp_is_empty!17533)))

(declare-fun b!879173 () Bool)

(declare-fun res!597335 () Bool)

(assert (=> b!879173 (=> (not res!597335) (not e!489272))))

(assert (=> b!879173 (= res!597335 (and (= (size!25063 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25062 _keys!868) (size!25063 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879174 () Bool)

(declare-fun res!597336 () Bool)

(assert (=> b!879174 (=> (not res!597336) (not e!489272))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879174 (= res!597336 (validKeyInArray!0 k!854))))

(declare-fun b!879175 () Bool)

(declare-fun res!597332 () Bool)

(assert (=> b!879175 (=> (not res!597332) (not e!489272))))

(assert (=> b!879175 (= res!597332 (and (= (select (arr!24622 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27915 () Bool)

(declare-fun mapRes!27915 () Bool)

(assert (=> mapIsEmpty!27915 mapRes!27915))

(declare-fun lt!397458 () ListLongMap!10425)

(declare-fun b!879176 () Bool)

(declare-fun e!489271 () Bool)

(declare-fun +!2501 (ListLongMap!10425 tuple2!11656) ListLongMap!10425)

(declare-fun get!12935 (ValueCell!8327 V!28425) V!28425)

(declare-fun dynLambda!1220 (Int (_ BitVec 64)) V!28425)

(assert (=> b!879176 (= e!489271 (= lt!397463 (+!2501 lt!397458 (tuple2!11657 (select (arr!24622 _keys!868) from!1053) (get!12935 (select (arr!24623 _values!688) from!1053) (dynLambda!1220 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun res!597341 () Bool)

(assert (=> start!74600 (=> (not res!597341) (not e!489272))))

(assert (=> start!74600 (= res!597341 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25062 _keys!868))))))

(assert (=> start!74600 e!489272))

(assert (=> start!74600 tp_is_empty!17533))

(assert (=> start!74600 true))

(assert (=> start!74600 tp!53548))

(declare-fun array_inv!19404 (array!51192) Bool)

(assert (=> start!74600 (array_inv!19404 _keys!868)))

(declare-fun e!489270 () Bool)

(declare-fun array_inv!19405 (array!51194) Bool)

(assert (=> start!74600 (and (array_inv!19405 _values!688) e!489270)))

(declare-fun b!879177 () Bool)

(declare-fun res!597337 () Bool)

(assert (=> b!879177 (=> (not res!597337) (not e!489272))))

(declare-datatypes ((List!17475 0))(
  ( (Nil!17472) (Cons!17471 (h!18602 (_ BitVec 64)) (t!24566 List!17475)) )
))
(declare-fun arrayNoDuplicates!0 (array!51192 (_ BitVec 32) List!17475) Bool)

(assert (=> b!879177 (= res!597337 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17472))))

(declare-fun b!879178 () Bool)

(declare-fun e!489269 () Bool)

(assert (=> b!879178 (= e!489269 tp_is_empty!17533)))

(declare-fun b!879179 () Bool)

(assert (=> b!879179 (= e!489270 (and e!489273 mapRes!27915))))

(declare-fun condMapEmpty!27915 () Bool)

(declare-fun mapDefault!27915 () ValueCell!8327)

