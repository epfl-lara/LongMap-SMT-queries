; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74692 () Bool)

(assert start!74692)

(declare-fun b_free!15341 () Bool)

(declare-fun b_next!15341 () Bool)

(assert (=> start!74692 (= b_free!15341 (not b_next!15341))))

(declare-fun tp!53710 () Bool)

(declare-fun b_and!25301 () Bool)

(assert (=> start!74692 (= tp!53710 b_and!25301)))

(declare-fun b!880514 () Bool)

(declare-fun res!598235 () Bool)

(declare-fun e!489998 () Bool)

(assert (=> b!880514 (=> (not res!598235) (not e!489998))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880514 (= res!598235 (validKeyInArray!0 k!854))))

(declare-fun b!880515 () Bool)

(declare-fun res!598229 () Bool)

(assert (=> b!880515 (=> (not res!598229) (not e!489998))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51296 0))(
  ( (array!51297 (arr!24672 (Array (_ BitVec 32) (_ BitVec 64))) (size!25112 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51296)

(assert (=> b!880515 (= res!598229 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25112 _keys!868))))))

(declare-fun b!880516 () Bool)

(declare-fun res!598230 () Bool)

(assert (=> b!880516 (=> (not res!598230) (not e!489998))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880516 (= res!598230 (validMask!0 mask!1196))))

(declare-fun b!880517 () Bool)

(declare-fun e!489997 () Bool)

(declare-fun e!489995 () Bool)

(assert (=> b!880517 (= e!489997 e!489995)))

(declare-fun res!598233 () Bool)

(assert (=> b!880517 (=> res!598233 e!489995)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880517 (= res!598233 (not (= (select (arr!24672 _keys!868) from!1053) k!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28493 0))(
  ( (V!28494 (val!8840 Int)) )
))
(declare-datatypes ((tuple2!11700 0))(
  ( (tuple2!11701 (_1!5861 (_ BitVec 64)) (_2!5861 V!28493)) )
))
(declare-datatypes ((List!17513 0))(
  ( (Nil!17510) (Cons!17509 (h!18640 tuple2!11700) (t!24656 List!17513)) )
))
(declare-datatypes ((ListLongMap!10469 0))(
  ( (ListLongMap!10470 (toList!5250 List!17513)) )
))
(declare-fun lt!398164 () ListLongMap!10469)

(declare-fun lt!398166 () ListLongMap!10469)

(declare-datatypes ((ValueCell!8353 0))(
  ( (ValueCellFull!8353 (v!11288 V!28493)) (EmptyCell!8353) )
))
(declare-datatypes ((array!51298 0))(
  ( (array!51299 (arr!24673 (Array (_ BitVec 32) ValueCell!8353)) (size!25113 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51298)

(declare-fun +!2522 (ListLongMap!10469 tuple2!11700) ListLongMap!10469)

(declare-fun get!12973 (ValueCell!8353 V!28493) V!28493)

(declare-fun dynLambda!1238 (Int (_ BitVec 64)) V!28493)

(assert (=> b!880517 (= lt!398166 (+!2522 lt!398164 (tuple2!11701 (select (arr!24672 _keys!868) from!1053) (get!12973 (select (arr!24673 _values!688) from!1053) (dynLambda!1238 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880518 () Bool)

(declare-fun e!489999 () Bool)

(declare-fun tp_is_empty!17585 () Bool)

(assert (=> b!880518 (= e!489999 tp_is_empty!17585)))

(declare-fun b!880519 () Bool)

(declare-fun e!490002 () Bool)

(assert (=> b!880519 (= e!490002 tp_is_empty!17585)))

(declare-fun b!880520 () Bool)

(declare-fun e!490001 () Bool)

(assert (=> b!880520 (= e!489998 e!490001)))

(declare-fun res!598231 () Bool)

(assert (=> b!880520 (=> (not res!598231) (not e!490001))))

(assert (=> b!880520 (= res!598231 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398161 () array!51298)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28493)

(declare-fun zeroValue!654 () V!28493)

(declare-fun getCurrentListMapNoExtraKeys!3213 (array!51296 array!51298 (_ BitVec 32) (_ BitVec 32) V!28493 V!28493 (_ BitVec 32) Int) ListLongMap!10469)

(assert (=> b!880520 (= lt!398166 (getCurrentListMapNoExtraKeys!3213 _keys!868 lt!398161 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28493)

(assert (=> b!880520 (= lt!398161 (array!51299 (store (arr!24673 _values!688) i!612 (ValueCellFull!8353 v!557)) (size!25113 _values!688)))))

(declare-fun lt!398167 () ListLongMap!10469)

(assert (=> b!880520 (= lt!398167 (getCurrentListMapNoExtraKeys!3213 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880521 () Bool)

(declare-fun res!598238 () Bool)

(assert (=> b!880521 (=> (not res!598238) (not e!489998))))

(assert (=> b!880521 (= res!598238 (and (= (select (arr!24672 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!598232 () Bool)

(assert (=> start!74692 (=> (not res!598232) (not e!489998))))

(assert (=> start!74692 (= res!598232 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25112 _keys!868))))))

(assert (=> start!74692 e!489998))

(assert (=> start!74692 tp_is_empty!17585))

(assert (=> start!74692 true))

(assert (=> start!74692 tp!53710))

(declare-fun array_inv!19432 (array!51296) Bool)

(assert (=> start!74692 (array_inv!19432 _keys!868)))

(declare-fun e!490000 () Bool)

(declare-fun array_inv!19433 (array!51298) Bool)

(assert (=> start!74692 (and (array_inv!19433 _values!688) e!490000)))

(declare-fun b!880522 () Bool)

(assert (=> b!880522 (= e!489995 true)))

(declare-datatypes ((List!17514 0))(
  ( (Nil!17511) (Cons!17510 (h!18641 (_ BitVec 64)) (t!24657 List!17514)) )
))
(declare-fun arrayNoDuplicates!0 (array!51296 (_ BitVec 32) List!17514) Bool)

(assert (=> b!880522 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17511)))

(declare-datatypes ((Unit!30060 0))(
  ( (Unit!30061) )
))
(declare-fun lt!398162 () Unit!30060)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51296 (_ BitVec 32) (_ BitVec 32)) Unit!30060)

(assert (=> b!880522 (= lt!398162 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880523 () Bool)

(declare-fun res!598234 () Bool)

(assert (=> b!880523 (=> (not res!598234) (not e!489998))))

(assert (=> b!880523 (= res!598234 (and (= (size!25113 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25112 _keys!868) (size!25113 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880524 () Bool)

(declare-fun res!598239 () Bool)

(assert (=> b!880524 (=> (not res!598239) (not e!489998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51296 (_ BitVec 32)) Bool)

(assert (=> b!880524 (= res!598239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880525 () Bool)

(declare-fun res!598236 () Bool)

(assert (=> b!880525 (=> (not res!598236) (not e!489998))))

(assert (=> b!880525 (= res!598236 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17511))))

(declare-fun mapIsEmpty!27999 () Bool)

(declare-fun mapRes!27999 () Bool)

(assert (=> mapIsEmpty!27999 mapRes!27999))

(declare-fun b!880526 () Bool)

(assert (=> b!880526 (= e!490001 (not e!489997))))

(declare-fun res!598237 () Bool)

(assert (=> b!880526 (=> res!598237 e!489997)))

(assert (=> b!880526 (= res!598237 (not (validKeyInArray!0 (select (arr!24672 _keys!868) from!1053))))))

(declare-fun lt!398163 () ListLongMap!10469)

(assert (=> b!880526 (= lt!398163 lt!398164)))

(declare-fun lt!398168 () ListLongMap!10469)

(assert (=> b!880526 (= lt!398164 (+!2522 lt!398168 (tuple2!11701 k!854 v!557)))))

(assert (=> b!880526 (= lt!398163 (getCurrentListMapNoExtraKeys!3213 _keys!868 lt!398161 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880526 (= lt!398168 (getCurrentListMapNoExtraKeys!3213 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398165 () Unit!30060)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!712 (array!51296 array!51298 (_ BitVec 32) (_ BitVec 32) V!28493 V!28493 (_ BitVec 32) (_ BitVec 64) V!28493 (_ BitVec 32) Int) Unit!30060)

(assert (=> b!880526 (= lt!398165 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!712 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880527 () Bool)

(assert (=> b!880527 (= e!490000 (and e!489999 mapRes!27999))))

(declare-fun condMapEmpty!27999 () Bool)

(declare-fun mapDefault!27999 () ValueCell!8353)

