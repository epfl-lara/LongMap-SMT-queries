; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72380 () Bool)

(assert start!72380)

(declare-fun b_free!13565 () Bool)

(declare-fun b_next!13565 () Bool)

(assert (=> start!72380 (= b_free!13565 (not b_next!13565))))

(declare-fun tp!47794 () Bool)

(declare-fun b_and!22651 () Bool)

(assert (=> start!72380 (= tp!47794 b_and!22651)))

(declare-fun b!838829 () Bool)

(declare-fun e!468200 () Bool)

(declare-datatypes ((V!25621 0))(
  ( (V!25622 (val!7763 Int)) )
))
(declare-datatypes ((tuple2!10272 0))(
  ( (tuple2!10273 (_1!5147 (_ BitVec 64)) (_2!5147 V!25621)) )
))
(declare-datatypes ((List!16072 0))(
  ( (Nil!16069) (Cons!16068 (h!17199 tuple2!10272) (t!22443 List!16072)) )
))
(declare-datatypes ((ListLongMap!9041 0))(
  ( (ListLongMap!9042 (toList!4536 List!16072)) )
))
(declare-fun call!36929 () ListLongMap!9041)

(declare-fun call!36928 () ListLongMap!9041)

(assert (=> b!838829 (= e!468200 (= call!36929 call!36928))))

(declare-fun v!557 () V!25621)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!36925 () Bool)

(declare-datatypes ((array!47148 0))(
  ( (array!47149 (arr!22605 (Array (_ BitVec 32) (_ BitVec 64))) (size!23045 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47148)

(declare-datatypes ((ValueCell!7276 0))(
  ( (ValueCellFull!7276 (v!10188 V!25621)) (EmptyCell!7276) )
))
(declare-datatypes ((array!47150 0))(
  ( (array!47151 (arr!22606 (Array (_ BitVec 32) ValueCell!7276)) (size!23046 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47150)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25621)

(declare-fun zeroValue!654 () V!25621)

(declare-fun getCurrentListMapNoExtraKeys!2528 (array!47148 array!47150 (_ BitVec 32) (_ BitVec 32) V!25621 V!25621 (_ BitVec 32) Int) ListLongMap!9041)

(assert (=> bm!36925 (= call!36929 (getCurrentListMapNoExtraKeys!2528 _keys!868 (array!47151 (store (arr!22606 _values!688) i!612 (ValueCellFull!7276 v!557)) (size!23046 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838830 () Bool)

(declare-fun e!468202 () Bool)

(declare-fun tp_is_empty!15431 () Bool)

(assert (=> b!838830 (= e!468202 tp_is_empty!15431)))

(declare-fun b!838831 () Bool)

(declare-fun res!570372 () Bool)

(declare-fun e!468197 () Bool)

(assert (=> b!838831 (=> (not res!570372) (not e!468197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47148 (_ BitVec 32)) Bool)

(assert (=> b!838831 (= res!570372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24746 () Bool)

(declare-fun mapRes!24746 () Bool)

(declare-fun tp!47793 () Bool)

(declare-fun e!468198 () Bool)

(assert (=> mapNonEmpty!24746 (= mapRes!24746 (and tp!47793 e!468198))))

(declare-fun mapValue!24746 () ValueCell!7276)

(declare-fun mapRest!24746 () (Array (_ BitVec 32) ValueCell!7276))

(declare-fun mapKey!24746 () (_ BitVec 32))

(assert (=> mapNonEmpty!24746 (= (arr!22606 _values!688) (store mapRest!24746 mapKey!24746 mapValue!24746))))

(declare-fun mapIsEmpty!24746 () Bool)

(assert (=> mapIsEmpty!24746 mapRes!24746))

(declare-fun res!570373 () Bool)

(assert (=> start!72380 (=> (not res!570373) (not e!468197))))

(assert (=> start!72380 (= res!570373 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23045 _keys!868))))))

(assert (=> start!72380 e!468197))

(assert (=> start!72380 tp_is_empty!15431))

(assert (=> start!72380 true))

(assert (=> start!72380 tp!47794))

(declare-fun array_inv!18008 (array!47148) Bool)

(assert (=> start!72380 (array_inv!18008 _keys!868)))

(declare-fun e!468199 () Bool)

(declare-fun array_inv!18009 (array!47150) Bool)

(assert (=> start!72380 (and (array_inv!18009 _values!688) e!468199)))

(declare-fun b!838832 () Bool)

(assert (=> b!838832 (= e!468197 (not true))))

(assert (=> b!838832 e!468200))

(declare-fun c!91207 () Bool)

(assert (=> b!838832 (= c!91207 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28807 0))(
  ( (Unit!28808) )
))
(declare-fun lt!380713 () Unit!28807)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!249 (array!47148 array!47150 (_ BitVec 32) (_ BitVec 32) V!25621 V!25621 (_ BitVec 32) (_ BitVec 64) V!25621 (_ BitVec 32) Int) Unit!28807)

(assert (=> b!838832 (= lt!380713 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!249 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838833 () Bool)

(declare-fun res!570374 () Bool)

(assert (=> b!838833 (=> (not res!570374) (not e!468197))))

(assert (=> b!838833 (= res!570374 (and (= (select (arr!22605 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23045 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838834 () Bool)

(declare-fun +!2009 (ListLongMap!9041 tuple2!10272) ListLongMap!9041)

(assert (=> b!838834 (= e!468200 (= call!36929 (+!2009 call!36928 (tuple2!10273 k!854 v!557))))))

(declare-fun b!838835 () Bool)

(assert (=> b!838835 (= e!468198 tp_is_empty!15431)))

(declare-fun b!838836 () Bool)

(declare-fun res!570370 () Bool)

(assert (=> b!838836 (=> (not res!570370) (not e!468197))))

(assert (=> b!838836 (= res!570370 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23045 _keys!868))))))

(declare-fun bm!36926 () Bool)

(assert (=> bm!36926 (= call!36928 (getCurrentListMapNoExtraKeys!2528 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838837 () Bool)

(assert (=> b!838837 (= e!468199 (and e!468202 mapRes!24746))))

(declare-fun condMapEmpty!24746 () Bool)

(declare-fun mapDefault!24746 () ValueCell!7276)

