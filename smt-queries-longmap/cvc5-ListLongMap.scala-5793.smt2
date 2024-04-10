; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74700 () Bool)

(assert start!74700)

(declare-fun b_free!15349 () Bool)

(declare-fun b_next!15349 () Bool)

(assert (=> start!74700 (= b_free!15349 (not b_next!15349))))

(declare-fun tp!53735 () Bool)

(declare-fun b_and!25317 () Bool)

(assert (=> start!74700 (= tp!53735 b_and!25317)))

(declare-fun b!880690 () Bool)

(declare-fun res!598365 () Bool)

(declare-fun e!490093 () Bool)

(assert (=> b!880690 (=> (not res!598365) (not e!490093))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51312 0))(
  ( (array!51313 (arr!24680 (Array (_ BitVec 32) (_ BitVec 64))) (size!25120 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51312)

(assert (=> b!880690 (= res!598365 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25120 _keys!868))))))

(declare-fun mapIsEmpty!28011 () Bool)

(declare-fun mapRes!28011 () Bool)

(assert (=> mapIsEmpty!28011 mapRes!28011))

(declare-fun b!880691 () Bool)

(declare-fun res!598369 () Bool)

(assert (=> b!880691 (=> (not res!598369) (not e!490093))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880691 (= res!598369 (validKeyInArray!0 k!854))))

(declare-fun b!880692 () Bool)

(declare-fun e!490095 () Bool)

(declare-fun e!490091 () Bool)

(assert (=> b!880692 (= e!490095 (not e!490091))))

(declare-fun res!598366 () Bool)

(assert (=> b!880692 (=> res!598366 e!490091)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880692 (= res!598366 (not (validKeyInArray!0 (select (arr!24680 _keys!868) from!1053))))))

(declare-datatypes ((V!28505 0))(
  ( (V!28506 (val!8844 Int)) )
))
(declare-datatypes ((tuple2!11706 0))(
  ( (tuple2!11707 (_1!5864 (_ BitVec 64)) (_2!5864 V!28505)) )
))
(declare-datatypes ((List!17520 0))(
  ( (Nil!17517) (Cons!17516 (h!18647 tuple2!11706) (t!24671 List!17520)) )
))
(declare-datatypes ((ListLongMap!10475 0))(
  ( (ListLongMap!10476 (toList!5253 List!17520)) )
))
(declare-fun lt!398257 () ListLongMap!10475)

(declare-fun lt!398259 () ListLongMap!10475)

(assert (=> b!880692 (= lt!398257 lt!398259)))

(declare-fun v!557 () V!28505)

(declare-fun lt!398263 () ListLongMap!10475)

(declare-fun +!2525 (ListLongMap!10475 tuple2!11706) ListLongMap!10475)

(assert (=> b!880692 (= lt!398259 (+!2525 lt!398263 (tuple2!11707 k!854 v!557)))))

(declare-datatypes ((ValueCell!8357 0))(
  ( (ValueCellFull!8357 (v!11292 V!28505)) (EmptyCell!8357) )
))
(declare-datatypes ((array!51314 0))(
  ( (array!51315 (arr!24681 (Array (_ BitVec 32) ValueCell!8357)) (size!25121 (_ BitVec 32))) )
))
(declare-fun lt!398261 () array!51314)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28505)

(declare-fun zeroValue!654 () V!28505)

(declare-fun getCurrentListMapNoExtraKeys!3216 (array!51312 array!51314 (_ BitVec 32) (_ BitVec 32) V!28505 V!28505 (_ BitVec 32) Int) ListLongMap!10475)

(assert (=> b!880692 (= lt!398257 (getCurrentListMapNoExtraKeys!3216 _keys!868 lt!398261 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51314)

(assert (=> b!880692 (= lt!398263 (getCurrentListMapNoExtraKeys!3216 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30066 0))(
  ( (Unit!30067) )
))
(declare-fun lt!398258 () Unit!30066)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!714 (array!51312 array!51314 (_ BitVec 32) (_ BitVec 32) V!28505 V!28505 (_ BitVec 32) (_ BitVec 64) V!28505 (_ BitVec 32) Int) Unit!30066)

(assert (=> b!880692 (= lt!398258 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!714 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880693 () Bool)

(declare-fun res!598363 () Bool)

(assert (=> b!880693 (=> (not res!598363) (not e!490093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880693 (= res!598363 (validMask!0 mask!1196))))

(declare-fun res!598367 () Bool)

(assert (=> start!74700 (=> (not res!598367) (not e!490093))))

(assert (=> start!74700 (= res!598367 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25120 _keys!868))))))

(assert (=> start!74700 e!490093))

(declare-fun tp_is_empty!17593 () Bool)

(assert (=> start!74700 tp_is_empty!17593))

(assert (=> start!74700 true))

(assert (=> start!74700 tp!53735))

(declare-fun array_inv!19436 (array!51312) Bool)

(assert (=> start!74700 (array_inv!19436 _keys!868)))

(declare-fun e!490094 () Bool)

(declare-fun array_inv!19437 (array!51314) Bool)

(assert (=> start!74700 (and (array_inv!19437 _values!688) e!490094)))

(declare-fun b!880694 () Bool)

(declare-fun e!490098 () Bool)

(assert (=> b!880694 (= e!490098 tp_is_empty!17593)))

(declare-fun b!880695 () Bool)

(declare-fun res!598370 () Bool)

(assert (=> b!880695 (=> (not res!598370) (not e!490093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51312 (_ BitVec 32)) Bool)

(assert (=> b!880695 (= res!598370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!28011 () Bool)

(declare-fun tp!53734 () Bool)

(assert (=> mapNonEmpty!28011 (= mapRes!28011 (and tp!53734 e!490098))))

(declare-fun mapRest!28011 () (Array (_ BitVec 32) ValueCell!8357))

(declare-fun mapValue!28011 () ValueCell!8357)

(declare-fun mapKey!28011 () (_ BitVec 32))

(assert (=> mapNonEmpty!28011 (= (arr!24681 _values!688) (store mapRest!28011 mapKey!28011 mapValue!28011))))

(declare-fun b!880696 () Bool)

(declare-fun e!490096 () Bool)

(assert (=> b!880696 (= e!490091 e!490096)))

(declare-fun res!598371 () Bool)

(assert (=> b!880696 (=> res!598371 e!490096)))

(assert (=> b!880696 (= res!598371 (not (= (select (arr!24680 _keys!868) from!1053) k!854)))))

(declare-fun lt!398260 () ListLongMap!10475)

(declare-fun get!12980 (ValueCell!8357 V!28505) V!28505)

(declare-fun dynLambda!1241 (Int (_ BitVec 64)) V!28505)

(assert (=> b!880696 (= lt!398260 (+!2525 lt!398259 (tuple2!11707 (select (arr!24680 _keys!868) from!1053) (get!12980 (select (arr!24681 _values!688) from!1053) (dynLambda!1241 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880697 () Bool)

(assert (=> b!880697 (= e!490096 true)))

(declare-datatypes ((List!17521 0))(
  ( (Nil!17518) (Cons!17517 (h!18648 (_ BitVec 64)) (t!24672 List!17521)) )
))
(declare-fun arrayNoDuplicates!0 (array!51312 (_ BitVec 32) List!17521) Bool)

(assert (=> b!880697 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17518)))

(declare-fun lt!398264 () Unit!30066)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51312 (_ BitVec 32) (_ BitVec 32)) Unit!30066)

(assert (=> b!880697 (= lt!398264 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880698 () Bool)

(assert (=> b!880698 (= e!490093 e!490095)))

(declare-fun res!598362 () Bool)

(assert (=> b!880698 (=> (not res!598362) (not e!490095))))

(assert (=> b!880698 (= res!598362 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!880698 (= lt!398260 (getCurrentListMapNoExtraKeys!3216 _keys!868 lt!398261 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880698 (= lt!398261 (array!51315 (store (arr!24681 _values!688) i!612 (ValueCellFull!8357 v!557)) (size!25121 _values!688)))))

(declare-fun lt!398262 () ListLongMap!10475)

(assert (=> b!880698 (= lt!398262 (getCurrentListMapNoExtraKeys!3216 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880699 () Bool)

(declare-fun res!598361 () Bool)

(assert (=> b!880699 (=> (not res!598361) (not e!490093))))

(assert (=> b!880699 (= res!598361 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17518))))

(declare-fun b!880700 () Bool)

(declare-fun e!490097 () Bool)

(assert (=> b!880700 (= e!490094 (and e!490097 mapRes!28011))))

(declare-fun condMapEmpty!28011 () Bool)

(declare-fun mapDefault!28011 () ValueCell!8357)

