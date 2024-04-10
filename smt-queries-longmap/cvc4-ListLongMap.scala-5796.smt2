; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74768 () Bool)

(assert start!74768)

(declare-fun b_free!15371 () Bool)

(declare-fun b_next!15371 () Bool)

(assert (=> start!74768 (= b_free!15371 (not b_next!15371))))

(declare-fun tp!53806 () Bool)

(declare-fun b_and!25393 () Bool)

(assert (=> start!74768 (= tp!53806 b_and!25393)))

(declare-fun b!881459 () Bool)

(declare-fun res!598854 () Bool)

(declare-fun e!490546 () Bool)

(assert (=> b!881459 (=> (not res!598854) (not e!490546))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51358 0))(
  ( (array!51359 (arr!24701 (Array (_ BitVec 32) (_ BitVec 64))) (size!25141 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51358)

(declare-datatypes ((V!28533 0))(
  ( (V!28534 (val!8855 Int)) )
))
(declare-datatypes ((ValueCell!8368 0))(
  ( (ValueCellFull!8368 (v!11311 V!28533)) (EmptyCell!8368) )
))
(declare-datatypes ((array!51360 0))(
  ( (array!51361 (arr!24702 (Array (_ BitVec 32) ValueCell!8368)) (size!25142 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51360)

(assert (=> b!881459 (= res!598854 (and (= (size!25142 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25141 _keys!868) (size!25142 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28050 () Bool)

(declare-fun mapRes!28050 () Bool)

(declare-fun tp!53807 () Bool)

(declare-fun e!490545 () Bool)

(assert (=> mapNonEmpty!28050 (= mapRes!28050 (and tp!53807 e!490545))))

(declare-fun mapKey!28050 () (_ BitVec 32))

(declare-fun mapRest!28050 () (Array (_ BitVec 32) ValueCell!8368))

(declare-fun mapValue!28050 () ValueCell!8368)

(assert (=> mapNonEmpty!28050 (= (arr!24702 _values!688) (store mapRest!28050 mapKey!28050 mapValue!28050))))

(declare-fun b!881460 () Bool)

(declare-fun e!490549 () Bool)

(declare-fun tp_is_empty!17615 () Bool)

(assert (=> b!881460 (= e!490549 tp_is_empty!17615)))

(declare-fun b!881461 () Bool)

(declare-fun res!598847 () Bool)

(assert (=> b!881461 (=> (not res!598847) (not e!490546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51358 (_ BitVec 32)) Bool)

(assert (=> b!881461 (= res!598847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!28050 () Bool)

(assert (=> mapIsEmpty!28050 mapRes!28050))

(declare-fun b!881463 () Bool)

(declare-fun e!490548 () Bool)

(declare-fun e!490543 () Bool)

(assert (=> b!881463 (= e!490548 (not e!490543))))

(declare-fun res!598845 () Bool)

(assert (=> b!881463 (=> res!598845 e!490543)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881463 (= res!598845 (not (validKeyInArray!0 (select (arr!24701 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11722 0))(
  ( (tuple2!11723 (_1!5872 (_ BitVec 64)) (_2!5872 V!28533)) )
))
(declare-datatypes ((List!17536 0))(
  ( (Nil!17533) (Cons!17532 (h!18663 tuple2!11722) (t!24709 List!17536)) )
))
(declare-datatypes ((ListLongMap!10491 0))(
  ( (ListLongMap!10492 (toList!5261 List!17536)) )
))
(declare-fun lt!398675 () ListLongMap!10491)

(declare-fun lt!398683 () ListLongMap!10491)

(assert (=> b!881463 (= lt!398675 lt!398683)))

(declare-fun lt!398680 () ListLongMap!10491)

(declare-fun v!557 () V!28533)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2533 (ListLongMap!10491 tuple2!11722) ListLongMap!10491)

(assert (=> b!881463 (= lt!398683 (+!2533 lt!398680 (tuple2!11723 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28533)

(declare-fun zeroValue!654 () V!28533)

(declare-fun lt!398681 () array!51360)

(declare-fun getCurrentListMapNoExtraKeys!3224 (array!51358 array!51360 (_ BitVec 32) (_ BitVec 32) V!28533 V!28533 (_ BitVec 32) Int) ListLongMap!10491)

(assert (=> b!881463 (= lt!398675 (getCurrentListMapNoExtraKeys!3224 _keys!868 lt!398681 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881463 (= lt!398680 (getCurrentListMapNoExtraKeys!3224 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30084 0))(
  ( (Unit!30085) )
))
(declare-fun lt!398677 () Unit!30084)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!722 (array!51358 array!51360 (_ BitVec 32) (_ BitVec 32) V!28533 V!28533 (_ BitVec 32) (_ BitVec 64) V!28533 (_ BitVec 32) Int) Unit!30084)

(assert (=> b!881463 (= lt!398677 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!722 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881464 () Bool)

(declare-fun e!490547 () Bool)

(assert (=> b!881464 (= e!490543 e!490547)))

(declare-fun res!598855 () Bool)

(assert (=> b!881464 (=> res!598855 e!490547)))

(assert (=> b!881464 (= res!598855 (not (= (select (arr!24701 _keys!868) from!1053) k!854)))))

(declare-fun lt!398682 () ListLongMap!10491)

(declare-fun get!12997 (ValueCell!8368 V!28533) V!28533)

(declare-fun dynLambda!1248 (Int (_ BitVec 64)) V!28533)

(assert (=> b!881464 (= lt!398682 (+!2533 lt!398683 (tuple2!11723 (select (arr!24701 _keys!868) from!1053) (get!12997 (select (arr!24702 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881465 () Bool)

(declare-fun e!490544 () Bool)

(assert (=> b!881465 (= e!490544 (and e!490549 mapRes!28050))))

(declare-fun condMapEmpty!28050 () Bool)

(declare-fun mapDefault!28050 () ValueCell!8368)

