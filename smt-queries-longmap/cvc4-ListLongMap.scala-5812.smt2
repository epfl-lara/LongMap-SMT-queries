; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74948 () Bool)

(assert start!74948)

(declare-fun b_free!15467 () Bool)

(declare-fun b_next!15467 () Bool)

(assert (=> start!74948 (= b_free!15467 (not b_next!15467))))

(declare-fun tp!54103 () Bool)

(declare-fun b_and!25633 () Bool)

(assert (=> start!74948 (= tp!54103 b_and!25633)))

(declare-fun b!884183 () Bool)

(declare-fun res!600671 () Bool)

(declare-fun e!492058 () Bool)

(assert (=> b!884183 (=> (not res!600671) (not e!492058))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51548 0))(
  ( (array!51549 (arr!24793 (Array (_ BitVec 32) (_ BitVec 64))) (size!25233 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51548)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!884183 (= res!600671 (and (= (select (arr!24793 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!28203 () Bool)

(declare-fun mapRes!28203 () Bool)

(declare-fun tp!54104 () Bool)

(declare-fun e!492057 () Bool)

(assert (=> mapNonEmpty!28203 (= mapRes!28203 (and tp!54104 e!492057))))

(declare-datatypes ((V!28661 0))(
  ( (V!28662 (val!8903 Int)) )
))
(declare-datatypes ((ValueCell!8416 0))(
  ( (ValueCellFull!8416 (v!11372 V!28661)) (EmptyCell!8416) )
))
(declare-fun mapRest!28203 () (Array (_ BitVec 32) ValueCell!8416))

(declare-fun mapValue!28203 () ValueCell!8416)

(declare-fun mapKey!28203 () (_ BitVec 32))

(declare-datatypes ((array!51550 0))(
  ( (array!51551 (arr!24794 (Array (_ BitVec 32) ValueCell!8416)) (size!25234 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51550)

(assert (=> mapNonEmpty!28203 (= (arr!24794 _values!688) (store mapRest!28203 mapKey!28203 mapValue!28203))))

(declare-fun res!600680 () Bool)

(assert (=> start!74948 (=> (not res!600680) (not e!492058))))

(assert (=> start!74948 (= res!600680 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25233 _keys!868))))))

(assert (=> start!74948 e!492058))

(declare-fun tp_is_empty!17711 () Bool)

(assert (=> start!74948 tp_is_empty!17711))

(assert (=> start!74948 true))

(assert (=> start!74948 tp!54103))

(declare-fun array_inv!19518 (array!51548) Bool)

(assert (=> start!74948 (array_inv!19518 _keys!868)))

(declare-fun e!492055 () Bool)

(declare-fun array_inv!19519 (array!51550) Bool)

(assert (=> start!74948 (and (array_inv!19519 _values!688) e!492055)))

(declare-fun b!884184 () Bool)

(declare-fun e!492059 () Bool)

(assert (=> b!884184 (= e!492059 tp_is_empty!17711)))

(declare-fun b!884185 () Bool)

(declare-fun res!600676 () Bool)

(assert (=> b!884185 (=> (not res!600676) (not e!492058))))

(assert (=> b!884185 (= res!600676 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25233 _keys!868))))))

(declare-fun b!884186 () Bool)

(assert (=> b!884186 (= e!492057 tp_is_empty!17711)))

(declare-fun b!884187 () Bool)

(declare-fun res!600677 () Bool)

(assert (=> b!884187 (=> (not res!600677) (not e!492058))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!884187 (= res!600677 (and (= (size!25234 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25233 _keys!868) (size!25234 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884188 () Bool)

(declare-fun e!492056 () Bool)

(declare-fun e!492060 () Bool)

(assert (=> b!884188 (= e!492056 e!492060)))

(declare-fun res!600672 () Bool)

(assert (=> b!884188 (=> res!600672 e!492060)))

(assert (=> b!884188 (= res!600672 (= k!854 (select (arr!24793 _keys!868) from!1053)))))

(assert (=> b!884188 (not (= (select (arr!24793 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!30190 0))(
  ( (Unit!30191) )
))
(declare-fun lt!400439 () Unit!30190)

(declare-fun e!492052 () Unit!30190)

(assert (=> b!884188 (= lt!400439 e!492052)))

(declare-fun c!93106 () Bool)

(assert (=> b!884188 (= c!93106 (= (select (arr!24793 _keys!868) from!1053) k!854))))

(declare-datatypes ((tuple2!11804 0))(
  ( (tuple2!11805 (_1!5913 (_ BitVec 64)) (_2!5913 V!28661)) )
))
(declare-datatypes ((List!17611 0))(
  ( (Nil!17608) (Cons!17607 (h!18738 tuple2!11804) (t!24880 List!17611)) )
))
(declare-datatypes ((ListLongMap!10573 0))(
  ( (ListLongMap!10574 (toList!5302 List!17611)) )
))
(declare-fun lt!400449 () ListLongMap!10573)

(declare-fun lt!400442 () ListLongMap!10573)

(assert (=> b!884188 (= lt!400449 lt!400442)))

(declare-fun lt!400451 () ListLongMap!10573)

(declare-fun lt!400446 () tuple2!11804)

(declare-fun +!2571 (ListLongMap!10573 tuple2!11804) ListLongMap!10573)

(assert (=> b!884188 (= lt!400442 (+!2571 lt!400451 lt!400446))))

(declare-fun lt!400452 () V!28661)

(assert (=> b!884188 (= lt!400446 (tuple2!11805 (select (arr!24793 _keys!868) from!1053) lt!400452))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!13068 (ValueCell!8416 V!28661) V!28661)

(declare-fun dynLambda!1281 (Int (_ BitVec 64)) V!28661)

(assert (=> b!884188 (= lt!400452 (get!13068 (select (arr!24794 _values!688) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884189 () Bool)

(assert (=> b!884189 (= e!492060 true)))

(declare-fun lt!400441 () ListLongMap!10573)

(declare-fun lt!400448 () tuple2!11804)

(assert (=> b!884189 (= lt!400442 (+!2571 (+!2571 lt!400441 lt!400446) lt!400448))))

(declare-fun v!557 () V!28661)

(declare-fun lt!400440 () Unit!30190)

(declare-fun addCommutativeForDiffKeys!554 (ListLongMap!10573 (_ BitVec 64) V!28661 (_ BitVec 64) V!28661) Unit!30190)

(assert (=> b!884189 (= lt!400440 (addCommutativeForDiffKeys!554 lt!400441 k!854 v!557 (select (arr!24793 _keys!868) from!1053) lt!400452))))

(declare-fun b!884190 () Bool)

(declare-fun res!600681 () Bool)

(assert (=> b!884190 (=> (not res!600681) (not e!492058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884190 (= res!600681 (validKeyInArray!0 k!854))))

(declare-fun b!884191 () Bool)

(declare-fun Unit!30192 () Unit!30190)

(assert (=> b!884191 (= e!492052 Unit!30192)))

(declare-fun b!884192 () Bool)

(declare-fun res!600673 () Bool)

(assert (=> b!884192 (=> (not res!600673) (not e!492058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884192 (= res!600673 (validMask!0 mask!1196))))

(declare-fun b!884193 () Bool)

(declare-fun res!600678 () Bool)

(assert (=> b!884193 (=> (not res!600678) (not e!492058))))

(declare-datatypes ((List!17612 0))(
  ( (Nil!17609) (Cons!17608 (h!18739 (_ BitVec 64)) (t!24881 List!17612)) )
))
(declare-fun arrayNoDuplicates!0 (array!51548 (_ BitVec 32) List!17612) Bool)

(assert (=> b!884193 (= res!600678 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17609))))

(declare-fun b!884194 () Bool)

(declare-fun res!600674 () Bool)

(assert (=> b!884194 (=> (not res!600674) (not e!492058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51548 (_ BitVec 32)) Bool)

(assert (=> b!884194 (= res!600674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884195 () Bool)

(declare-fun e!492053 () Bool)

(assert (=> b!884195 (= e!492053 (not e!492056))))

(declare-fun res!600679 () Bool)

(assert (=> b!884195 (=> res!600679 e!492056)))

(assert (=> b!884195 (= res!600679 (not (validKeyInArray!0 (select (arr!24793 _keys!868) from!1053))))))

(declare-fun lt!400454 () ListLongMap!10573)

(assert (=> b!884195 (= lt!400454 lt!400451)))

(assert (=> b!884195 (= lt!400451 (+!2571 lt!400441 lt!400448))))

(declare-fun minValue!654 () V!28661)

(declare-fun zeroValue!654 () V!28661)

(declare-fun lt!400447 () array!51550)

(declare-fun getCurrentListMapNoExtraKeys!3261 (array!51548 array!51550 (_ BitVec 32) (_ BitVec 32) V!28661 V!28661 (_ BitVec 32) Int) ListLongMap!10573)

(assert (=> b!884195 (= lt!400454 (getCurrentListMapNoExtraKeys!3261 _keys!868 lt!400447 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!884195 (= lt!400448 (tuple2!11805 k!854 v!557))))

(assert (=> b!884195 (= lt!400441 (getCurrentListMapNoExtraKeys!3261 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400445 () Unit!30190)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!754 (array!51548 array!51550 (_ BitVec 32) (_ BitVec 32) V!28661 V!28661 (_ BitVec 32) (_ BitVec 64) V!28661 (_ BitVec 32) Int) Unit!30190)

(assert (=> b!884195 (= lt!400445 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!754 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884196 () Bool)

(declare-fun Unit!30193 () Unit!30190)

(assert (=> b!884196 (= e!492052 Unit!30193)))

(declare-fun lt!400453 () Unit!30190)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51548 (_ BitVec 32) (_ BitVec 32)) Unit!30190)

(assert (=> b!884196 (= lt!400453 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!884196 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17609)))

(declare-fun lt!400443 () Unit!30190)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30190)

(assert (=> b!884196 (= lt!400443 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884196 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400444 () Unit!30190)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51548 (_ BitVec 64) (_ BitVec 32) List!17612) Unit!30190)

(assert (=> b!884196 (= lt!400444 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17609))))

(assert (=> b!884196 false))

(declare-fun b!884197 () Bool)

(assert (=> b!884197 (= e!492055 (and e!492059 mapRes!28203))))

(declare-fun condMapEmpty!28203 () Bool)

(declare-fun mapDefault!28203 () ValueCell!8416)

