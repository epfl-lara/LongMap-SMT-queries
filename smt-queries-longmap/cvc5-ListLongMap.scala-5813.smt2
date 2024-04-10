; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74950 () Bool)

(assert start!74950)

(declare-fun b_free!15469 () Bool)

(declare-fun b_next!15469 () Bool)

(assert (=> start!74950 (= b_free!15469 (not b_next!15469))))

(declare-fun tp!54109 () Bool)

(declare-fun b_and!25637 () Bool)

(assert (=> start!74950 (= tp!54109 b_and!25637)))

(declare-fun b!884233 () Bool)

(declare-fun res!600706 () Bool)

(declare-fun e!492083 () Bool)

(assert (=> b!884233 (=> (not res!600706) (not e!492083))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51552 0))(
  ( (array!51553 (arr!24795 (Array (_ BitVec 32) (_ BitVec 64))) (size!25235 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51552)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!884233 (= res!600706 (and (= (select (arr!24795 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!884234 () Bool)

(declare-fun res!600708 () Bool)

(assert (=> b!884234 (=> (not res!600708) (not e!492083))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51552 (_ BitVec 32)) Bool)

(assert (=> b!884234 (= res!600708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884235 () Bool)

(declare-fun res!600710 () Bool)

(assert (=> b!884235 (=> (not res!600710) (not e!492083))))

(declare-datatypes ((List!17613 0))(
  ( (Nil!17610) (Cons!17609 (h!18740 (_ BitVec 64)) (t!24884 List!17613)) )
))
(declare-fun arrayNoDuplicates!0 (array!51552 (_ BitVec 32) List!17613) Bool)

(assert (=> b!884235 (= res!600710 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17610))))

(declare-fun b!884236 () Bool)

(declare-fun res!600714 () Bool)

(assert (=> b!884236 (=> (not res!600714) (not e!492083))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28665 0))(
  ( (V!28666 (val!8904 Int)) )
))
(declare-datatypes ((ValueCell!8417 0))(
  ( (ValueCellFull!8417 (v!11373 V!28665)) (EmptyCell!8417) )
))
(declare-datatypes ((array!51554 0))(
  ( (array!51555 (arr!24796 (Array (_ BitVec 32) ValueCell!8417)) (size!25236 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51554)

(assert (=> b!884236 (= res!600714 (and (= (size!25236 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25235 _keys!868) (size!25236 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884237 () Bool)

(declare-fun e!492086 () Bool)

(declare-fun e!492079 () Bool)

(assert (=> b!884237 (= e!492086 (not e!492079))))

(declare-fun res!600707 () Bool)

(assert (=> b!884237 (=> res!600707 e!492079)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884237 (= res!600707 (not (validKeyInArray!0 (select (arr!24795 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11806 0))(
  ( (tuple2!11807 (_1!5914 (_ BitVec 64)) (_2!5914 V!28665)) )
))
(declare-datatypes ((List!17614 0))(
  ( (Nil!17611) (Cons!17610 (h!18741 tuple2!11806) (t!24885 List!17614)) )
))
(declare-datatypes ((ListLongMap!10575 0))(
  ( (ListLongMap!10576 (toList!5303 List!17614)) )
))
(declare-fun lt!400494 () ListLongMap!10575)

(declare-fun lt!400489 () ListLongMap!10575)

(assert (=> b!884237 (= lt!400494 lt!400489)))

(declare-fun lt!400495 () ListLongMap!10575)

(declare-fun lt!400488 () tuple2!11806)

(declare-fun +!2572 (ListLongMap!10575 tuple2!11806) ListLongMap!10575)

(assert (=> b!884237 (= lt!400489 (+!2572 lt!400495 lt!400488))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!400499 () array!51554)

(declare-fun minValue!654 () V!28665)

(declare-fun zeroValue!654 () V!28665)

(declare-fun getCurrentListMapNoExtraKeys!3262 (array!51552 array!51554 (_ BitVec 32) (_ BitVec 32) V!28665 V!28665 (_ BitVec 32) Int) ListLongMap!10575)

(assert (=> b!884237 (= lt!400494 (getCurrentListMapNoExtraKeys!3262 _keys!868 lt!400499 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!28665)

(assert (=> b!884237 (= lt!400488 (tuple2!11807 k!854 v!557))))

(assert (=> b!884237 (= lt!400495 (getCurrentListMapNoExtraKeys!3262 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30194 0))(
  ( (Unit!30195) )
))
(declare-fun lt!400496 () Unit!30194)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!755 (array!51552 array!51554 (_ BitVec 32) (_ BitVec 32) V!28665 V!28665 (_ BitVec 32) (_ BitVec 64) V!28665 (_ BitVec 32) Int) Unit!30194)

(assert (=> b!884237 (= lt!400496 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!755 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884238 () Bool)

(declare-fun e!492081 () Bool)

(assert (=> b!884238 (= e!492079 e!492081)))

(declare-fun res!600704 () Bool)

(assert (=> b!884238 (=> res!600704 e!492081)))

(assert (=> b!884238 (= res!600704 (= k!854 (select (arr!24795 _keys!868) from!1053)))))

(assert (=> b!884238 (not (= (select (arr!24795 _keys!868) from!1053) k!854))))

(declare-fun lt!400497 () Unit!30194)

(declare-fun e!492080 () Unit!30194)

(assert (=> b!884238 (= lt!400497 e!492080)))

(declare-fun c!93109 () Bool)

(assert (=> b!884238 (= c!93109 (= (select (arr!24795 _keys!868) from!1053) k!854))))

(declare-fun lt!400492 () ListLongMap!10575)

(declare-fun lt!400493 () ListLongMap!10575)

(assert (=> b!884238 (= lt!400492 lt!400493)))

(declare-fun lt!400500 () tuple2!11806)

(assert (=> b!884238 (= lt!400493 (+!2572 lt!400489 lt!400500))))

(declare-fun lt!400490 () V!28665)

(assert (=> b!884238 (= lt!400500 (tuple2!11807 (select (arr!24795 _keys!868) from!1053) lt!400490))))

(declare-fun get!13071 (ValueCell!8417 V!28665) V!28665)

(declare-fun dynLambda!1282 (Int (_ BitVec 64)) V!28665)

(assert (=> b!884238 (= lt!400490 (get!13071 (select (arr!24796 _values!688) from!1053) (dynLambda!1282 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884239 () Bool)

(declare-fun e!492084 () Bool)

(declare-fun tp_is_empty!17713 () Bool)

(assert (=> b!884239 (= e!492084 tp_is_empty!17713)))

(declare-fun b!884240 () Bool)

(declare-fun res!600712 () Bool)

(assert (=> b!884240 (=> (not res!600712) (not e!492083))))

(assert (=> b!884240 (= res!600712 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25235 _keys!868))))))

(declare-fun b!884241 () Bool)

(assert (=> b!884241 (= e!492083 e!492086)))

(declare-fun res!600709 () Bool)

(assert (=> b!884241 (=> (not res!600709) (not e!492086))))

(assert (=> b!884241 (= res!600709 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!884241 (= lt!400492 (getCurrentListMapNoExtraKeys!3262 _keys!868 lt!400499 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884241 (= lt!400499 (array!51555 (store (arr!24796 _values!688) i!612 (ValueCellFull!8417 v!557)) (size!25236 _values!688)))))

(declare-fun lt!400487 () ListLongMap!10575)

(assert (=> b!884241 (= lt!400487 (getCurrentListMapNoExtraKeys!3262 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884242 () Bool)

(declare-fun e!492082 () Bool)

(assert (=> b!884242 (= e!492082 tp_is_empty!17713)))

(declare-fun res!600713 () Bool)

(assert (=> start!74950 (=> (not res!600713) (not e!492083))))

(assert (=> start!74950 (= res!600713 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25235 _keys!868))))))

(assert (=> start!74950 e!492083))

(assert (=> start!74950 tp_is_empty!17713))

(assert (=> start!74950 true))

(assert (=> start!74950 tp!54109))

(declare-fun array_inv!19520 (array!51552) Bool)

(assert (=> start!74950 (array_inv!19520 _keys!868)))

(declare-fun e!492087 () Bool)

(declare-fun array_inv!19521 (array!51554) Bool)

(assert (=> start!74950 (and (array_inv!19521 _values!688) e!492087)))

(declare-fun b!884243 () Bool)

(assert (=> b!884243 (= e!492081 (= lt!400492 (+!2572 lt!400487 lt!400488)))))

(assert (=> b!884243 (= lt!400493 (+!2572 (+!2572 lt!400495 lt!400500) lt!400488))))

(declare-fun lt!400501 () Unit!30194)

(declare-fun addCommutativeForDiffKeys!555 (ListLongMap!10575 (_ BitVec 64) V!28665 (_ BitVec 64) V!28665) Unit!30194)

(assert (=> b!884243 (= lt!400501 (addCommutativeForDiffKeys!555 lt!400495 k!854 v!557 (select (arr!24795 _keys!868) from!1053) lt!400490))))

(declare-fun mapNonEmpty!28206 () Bool)

(declare-fun mapRes!28206 () Bool)

(declare-fun tp!54110 () Bool)

(assert (=> mapNonEmpty!28206 (= mapRes!28206 (and tp!54110 e!492082))))

(declare-fun mapRest!28206 () (Array (_ BitVec 32) ValueCell!8417))

(declare-fun mapKey!28206 () (_ BitVec 32))

(declare-fun mapValue!28206 () ValueCell!8417)

(assert (=> mapNonEmpty!28206 (= (arr!24796 _values!688) (store mapRest!28206 mapKey!28206 mapValue!28206))))

(declare-fun b!884244 () Bool)

(declare-fun Unit!30196 () Unit!30194)

(assert (=> b!884244 (= e!492080 Unit!30196)))

(declare-fun b!884245 () Bool)

(declare-fun Unit!30197 () Unit!30194)

(assert (=> b!884245 (= e!492080 Unit!30197)))

(declare-fun lt!400498 () Unit!30194)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51552 (_ BitVec 32) (_ BitVec 32)) Unit!30194)

(assert (=> b!884245 (= lt!400498 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!884245 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17610)))

(declare-fun lt!400502 () Unit!30194)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51552 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30194)

(assert (=> b!884245 (= lt!400502 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884245 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400491 () Unit!30194)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51552 (_ BitVec 64) (_ BitVec 32) List!17613) Unit!30194)

(assert (=> b!884245 (= lt!400491 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17610))))

(assert (=> b!884245 false))

(declare-fun b!884246 () Bool)

(declare-fun res!600711 () Bool)

(assert (=> b!884246 (=> (not res!600711) (not e!492083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884246 (= res!600711 (validMask!0 mask!1196))))

(declare-fun b!884247 () Bool)

(assert (=> b!884247 (= e!492087 (and e!492084 mapRes!28206))))

(declare-fun condMapEmpty!28206 () Bool)

(declare-fun mapDefault!28206 () ValueCell!8417)

