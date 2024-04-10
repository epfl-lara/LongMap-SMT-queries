; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74764 () Bool)

(assert start!74764)

(declare-fun b_free!15367 () Bool)

(declare-fun b_next!15367 () Bool)

(assert (=> start!74764 (= b_free!15367 (not b_next!15367))))

(declare-fun tp!53795 () Bool)

(declare-fun b_and!25385 () Bool)

(assert (=> start!74764 (= tp!53795 b_and!25385)))

(declare-fun b!881371 () Bool)

(declare-fun e!490501 () Bool)

(declare-fun e!490497 () Bool)

(assert (=> b!881371 (= e!490501 e!490497)))

(declare-fun res!598782 () Bool)

(assert (=> b!881371 (=> (not res!598782) (not e!490497))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!881371 (= res!598782 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28529 0))(
  ( (V!28530 (val!8853 Int)) )
))
(declare-datatypes ((tuple2!11718 0))(
  ( (tuple2!11719 (_1!5870 (_ BitVec 64)) (_2!5870 V!28529)) )
))
(declare-datatypes ((List!17532 0))(
  ( (Nil!17529) (Cons!17528 (h!18659 tuple2!11718) (t!24701 List!17532)) )
))
(declare-datatypes ((ListLongMap!10487 0))(
  ( (ListLongMap!10488 (toList!5259 List!17532)) )
))
(declare-fun lt!398629 () ListLongMap!10487)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8366 0))(
  ( (ValueCellFull!8366 (v!11309 V!28529)) (EmptyCell!8366) )
))
(declare-datatypes ((array!51350 0))(
  ( (array!51351 (arr!24697 (Array (_ BitVec 32) ValueCell!8366)) (size!25137 (_ BitVec 32))) )
))
(declare-fun lt!398628 () array!51350)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51352 0))(
  ( (array!51353 (arr!24698 (Array (_ BitVec 32) (_ BitVec 64))) (size!25138 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51352)

(declare-fun minValue!654 () V!28529)

(declare-fun zeroValue!654 () V!28529)

(declare-fun getCurrentListMapNoExtraKeys!3222 (array!51352 array!51350 (_ BitVec 32) (_ BitVec 32) V!28529 V!28529 (_ BitVec 32) Int) ListLongMap!10487)

(assert (=> b!881371 (= lt!398629 (getCurrentListMapNoExtraKeys!3222 _keys!868 lt!398628 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28529)

(declare-fun _values!688 () array!51350)

(assert (=> b!881371 (= lt!398628 (array!51351 (store (arr!24697 _values!688) i!612 (ValueCellFull!8366 v!557)) (size!25137 _values!688)))))

(declare-fun lt!398623 () ListLongMap!10487)

(assert (=> b!881371 (= lt!398623 (getCurrentListMapNoExtraKeys!3222 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881372 () Bool)

(declare-fun e!490499 () Bool)

(declare-fun e!490495 () Bool)

(assert (=> b!881372 (= e!490499 e!490495)))

(declare-fun res!598787 () Bool)

(assert (=> b!881372 (=> res!598787 e!490495)))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!881372 (= res!598787 (not (= (select (arr!24698 _keys!868) from!1053) k!854)))))

(declare-fun lt!398621 () ListLongMap!10487)

(declare-fun +!2531 (ListLongMap!10487 tuple2!11718) ListLongMap!10487)

(declare-fun get!12995 (ValueCell!8366 V!28529) V!28529)

(declare-fun dynLambda!1246 (Int (_ BitVec 64)) V!28529)

(assert (=> b!881372 (= lt!398629 (+!2531 lt!398621 (tuple2!11719 (select (arr!24698 _keys!868) from!1053) (get!12995 (select (arr!24697 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881373 () Bool)

(declare-fun res!598779 () Bool)

(assert (=> b!881373 (=> (not res!598779) (not e!490501))))

(assert (=> b!881373 (= res!598779 (and (= (select (arr!24698 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!881374 () Bool)

(declare-fun res!598789 () Bool)

(assert (=> b!881374 (=> (not res!598789) (not e!490501))))

(assert (=> b!881374 (= res!598789 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25138 _keys!868))))))

(declare-fun b!881375 () Bool)

(declare-fun res!598785 () Bool)

(assert (=> b!881375 (=> (not res!598785) (not e!490501))))

(declare-datatypes ((List!17533 0))(
  ( (Nil!17530) (Cons!17529 (h!18660 (_ BitVec 64)) (t!24702 List!17533)) )
))
(declare-fun arrayNoDuplicates!0 (array!51352 (_ BitVec 32) List!17533) Bool)

(assert (=> b!881375 (= res!598785 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17530))))

(declare-fun res!598781 () Bool)

(assert (=> start!74764 (=> (not res!598781) (not e!490501))))

(assert (=> start!74764 (= res!598781 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25138 _keys!868))))))

(assert (=> start!74764 e!490501))

(declare-fun tp_is_empty!17611 () Bool)

(assert (=> start!74764 tp_is_empty!17611))

(assert (=> start!74764 true))

(assert (=> start!74764 tp!53795))

(declare-fun array_inv!19450 (array!51352) Bool)

(assert (=> start!74764 (array_inv!19450 _keys!868)))

(declare-fun e!490500 () Bool)

(declare-fun array_inv!19451 (array!51350) Bool)

(assert (=> start!74764 (and (array_inv!19451 _values!688) e!490500)))

(declare-fun mapIsEmpty!28044 () Bool)

(declare-fun mapRes!28044 () Bool)

(assert (=> mapIsEmpty!28044 mapRes!28044))

(declare-fun b!881376 () Bool)

(declare-fun res!598784 () Bool)

(assert (=> b!881376 (=> (not res!598784) (not e!490501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881376 (= res!598784 (validMask!0 mask!1196))))

(declare-fun b!881377 () Bool)

(assert (=> b!881377 (= e!490495 (bvslt (size!25138 _keys!868) #b01111111111111111111111111111111))))

(declare-fun arrayContainsKey!0 (array!51352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881377 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!30080 0))(
  ( (Unit!30081) )
))
(declare-fun lt!398627 () Unit!30080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30080)

(assert (=> b!881377 (= lt!398627 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881377 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17530)))

(declare-fun lt!398622 () Unit!30080)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51352 (_ BitVec 32) (_ BitVec 32)) Unit!30080)

(assert (=> b!881377 (= lt!398622 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881378 () Bool)

(assert (=> b!881378 (= e!490497 (not e!490499))))

(declare-fun res!598788 () Bool)

(assert (=> b!881378 (=> res!598788 e!490499)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881378 (= res!598788 (not (validKeyInArray!0 (select (arr!24698 _keys!868) from!1053))))))

(declare-fun lt!398624 () ListLongMap!10487)

(assert (=> b!881378 (= lt!398624 lt!398621)))

(declare-fun lt!398626 () ListLongMap!10487)

(assert (=> b!881378 (= lt!398621 (+!2531 lt!398626 (tuple2!11719 k!854 v!557)))))

(assert (=> b!881378 (= lt!398624 (getCurrentListMapNoExtraKeys!3222 _keys!868 lt!398628 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881378 (= lt!398626 (getCurrentListMapNoExtraKeys!3222 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398625 () Unit!30080)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!720 (array!51352 array!51350 (_ BitVec 32) (_ BitVec 32) V!28529 V!28529 (_ BitVec 32) (_ BitVec 64) V!28529 (_ BitVec 32) Int) Unit!30080)

(assert (=> b!881378 (= lt!398625 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!720 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881379 () Bool)

(declare-fun res!598786 () Bool)

(assert (=> b!881379 (=> (not res!598786) (not e!490501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51352 (_ BitVec 32)) Bool)

(assert (=> b!881379 (= res!598786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881380 () Bool)

(declare-fun e!490494 () Bool)

(assert (=> b!881380 (= e!490494 tp_is_empty!17611)))

(declare-fun b!881381 () Bool)

(declare-fun res!598780 () Bool)

(assert (=> b!881381 (=> (not res!598780) (not e!490501))))

(assert (=> b!881381 (= res!598780 (and (= (size!25137 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25138 _keys!868) (size!25137 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881382 () Bool)

(declare-fun e!490498 () Bool)

(assert (=> b!881382 (= e!490498 tp_is_empty!17611)))

(declare-fun b!881383 () Bool)

(assert (=> b!881383 (= e!490500 (and e!490498 mapRes!28044))))

(declare-fun condMapEmpty!28044 () Bool)

(declare-fun mapDefault!28044 () ValueCell!8366)

