; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72392 () Bool)

(assert start!72392)

(declare-fun b_free!13577 () Bool)

(declare-fun b_next!13577 () Bool)

(assert (=> start!72392 (= b_free!13577 (not b_next!13577))))

(declare-fun tp!47830 () Bool)

(declare-fun b_and!22663 () Bool)

(assert (=> start!72392 (= tp!47830 b_and!22663)))

(declare-fun b!839063 () Bool)

(declare-fun e!468306 () Bool)

(assert (=> b!839063 (= e!468306 (not true))))

(declare-fun e!468307 () Bool)

(assert (=> b!839063 e!468307))

(declare-fun c!91225 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839063 (= c!91225 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25637 0))(
  ( (V!25638 (val!7769 Int)) )
))
(declare-fun v!557 () V!25637)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47170 0))(
  ( (array!47171 (arr!22616 (Array (_ BitVec 32) (_ BitVec 64))) (size!23056 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47170)

(declare-datatypes ((ValueCell!7282 0))(
  ( (ValueCellFull!7282 (v!10194 V!25637)) (EmptyCell!7282) )
))
(declare-datatypes ((array!47172 0))(
  ( (array!47173 (arr!22617 (Array (_ BitVec 32) ValueCell!7282)) (size!23057 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47172)

(declare-fun minValue!654 () V!25637)

(declare-fun zeroValue!654 () V!25637)

(declare-datatypes ((Unit!28817 0))(
  ( (Unit!28818) )
))
(declare-fun lt!380731 () Unit!28817)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!254 (array!47170 array!47172 (_ BitVec 32) (_ BitVec 32) V!25637 V!25637 (_ BitVec 32) (_ BitVec 64) V!25637 (_ BitVec 32) Int) Unit!28817)

(assert (=> b!839063 (= lt!380731 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570514 () Bool)

(assert (=> start!72392 (=> (not res!570514) (not e!468306))))

(assert (=> start!72392 (= res!570514 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23056 _keys!868))))))

(assert (=> start!72392 e!468306))

(declare-fun tp_is_empty!15443 () Bool)

(assert (=> start!72392 tp_is_empty!15443))

(assert (=> start!72392 true))

(assert (=> start!72392 tp!47830))

(declare-fun array_inv!18018 (array!47170) Bool)

(assert (=> start!72392 (array_inv!18018 _keys!868)))

(declare-fun e!468308 () Bool)

(declare-fun array_inv!18019 (array!47172) Bool)

(assert (=> start!72392 (and (array_inv!18019 _values!688) e!468308)))

(declare-fun b!839064 () Bool)

(declare-fun res!570518 () Bool)

(assert (=> b!839064 (=> (not res!570518) (not e!468306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839064 (= res!570518 (validKeyInArray!0 k!854))))

(declare-fun b!839065 () Bool)

(declare-fun res!570520 () Bool)

(assert (=> b!839065 (=> (not res!570520) (not e!468306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47170 (_ BitVec 32)) Bool)

(assert (=> b!839065 (= res!570520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24764 () Bool)

(declare-fun mapRes!24764 () Bool)

(assert (=> mapIsEmpty!24764 mapRes!24764))

(declare-fun b!839066 () Bool)

(declare-fun res!570516 () Bool)

(assert (=> b!839066 (=> (not res!570516) (not e!468306))))

(declare-datatypes ((List!16080 0))(
  ( (Nil!16077) (Cons!16076 (h!17207 (_ BitVec 64)) (t!22451 List!16080)) )
))
(declare-fun arrayNoDuplicates!0 (array!47170 (_ BitVec 32) List!16080) Bool)

(assert (=> b!839066 (= res!570516 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16077))))

(declare-fun b!839067 () Bool)

(declare-datatypes ((tuple2!10280 0))(
  ( (tuple2!10281 (_1!5151 (_ BitVec 64)) (_2!5151 V!25637)) )
))
(declare-datatypes ((List!16081 0))(
  ( (Nil!16078) (Cons!16077 (h!17208 tuple2!10280) (t!22452 List!16081)) )
))
(declare-datatypes ((ListLongMap!9049 0))(
  ( (ListLongMap!9050 (toList!4540 List!16081)) )
))
(declare-fun call!36964 () ListLongMap!9049)

(declare-fun call!36965 () ListLongMap!9049)

(assert (=> b!839067 (= e!468307 (= call!36964 call!36965))))

(declare-fun b!839068 () Bool)

(declare-fun res!570519 () Bool)

(assert (=> b!839068 (=> (not res!570519) (not e!468306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839068 (= res!570519 (validMask!0 mask!1196))))

(declare-fun b!839069 () Bool)

(declare-fun res!570517 () Bool)

(assert (=> b!839069 (=> (not res!570517) (not e!468306))))

(assert (=> b!839069 (= res!570517 (and (= (size!23057 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23056 _keys!868) (size!23057 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839070 () Bool)

(declare-fun e!468310 () Bool)

(assert (=> b!839070 (= e!468310 tp_is_empty!15443)))

(declare-fun b!839071 () Bool)

(declare-fun e!468309 () Bool)

(assert (=> b!839071 (= e!468309 tp_is_empty!15443)))

(declare-fun b!839072 () Bool)

(declare-fun res!570515 () Bool)

(assert (=> b!839072 (=> (not res!570515) (not e!468306))))

(assert (=> b!839072 (= res!570515 (and (= (select (arr!22616 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23056 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!36961 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2532 (array!47170 array!47172 (_ BitVec 32) (_ BitVec 32) V!25637 V!25637 (_ BitVec 32) Int) ListLongMap!9049)

(assert (=> bm!36961 (= call!36965 (getCurrentListMapNoExtraKeys!2532 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24764 () Bool)

(declare-fun tp!47829 () Bool)

(assert (=> mapNonEmpty!24764 (= mapRes!24764 (and tp!47829 e!468309))))

(declare-fun mapRest!24764 () (Array (_ BitVec 32) ValueCell!7282))

(declare-fun mapKey!24764 () (_ BitVec 32))

(declare-fun mapValue!24764 () ValueCell!7282)

(assert (=> mapNonEmpty!24764 (= (arr!22617 _values!688) (store mapRest!24764 mapKey!24764 mapValue!24764))))

(declare-fun b!839073 () Bool)

(declare-fun +!2013 (ListLongMap!9049 tuple2!10280) ListLongMap!9049)

(assert (=> b!839073 (= e!468307 (= call!36964 (+!2013 call!36965 (tuple2!10281 k!854 v!557))))))

(declare-fun b!839074 () Bool)

(declare-fun res!570521 () Bool)

(assert (=> b!839074 (=> (not res!570521) (not e!468306))))

(assert (=> b!839074 (= res!570521 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23056 _keys!868))))))

(declare-fun b!839075 () Bool)

(assert (=> b!839075 (= e!468308 (and e!468310 mapRes!24764))))

(declare-fun condMapEmpty!24764 () Bool)

(declare-fun mapDefault!24764 () ValueCell!7282)

