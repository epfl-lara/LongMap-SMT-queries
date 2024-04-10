; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72446 () Bool)

(assert start!72446)

(declare-fun b_free!13631 () Bool)

(declare-fun b_next!13631 () Bool)

(assert (=> start!72446 (= b_free!13631 (not b_next!13631))))

(declare-fun tp!47992 () Bool)

(declare-fun b_and!22717 () Bool)

(assert (=> start!72446 (= tp!47992 b_and!22717)))

(declare-fun b!840116 () Bool)

(declare-fun res!571165 () Bool)

(declare-fun e!468791 () Bool)

(assert (=> b!840116 (=> (not res!571165) (not e!468791))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840116 (= res!571165 (validKeyInArray!0 k!854))))

(declare-fun b!840117 () Bool)

(declare-fun e!468794 () Bool)

(declare-fun tp_is_empty!15497 () Bool)

(assert (=> b!840117 (= e!468794 tp_is_empty!15497)))

(declare-fun b!840118 () Bool)

(declare-fun res!571164 () Bool)

(assert (=> b!840118 (=> (not res!571164) (not e!468791))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47274 0))(
  ( (array!47275 (arr!22668 (Array (_ BitVec 32) (_ BitVec 64))) (size!23108 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47274)

(declare-datatypes ((V!25709 0))(
  ( (V!25710 (val!7796 Int)) )
))
(declare-datatypes ((ValueCell!7309 0))(
  ( (ValueCellFull!7309 (v!10221 V!25709)) (EmptyCell!7309) )
))
(declare-datatypes ((array!47276 0))(
  ( (array!47277 (arr!22669 (Array (_ BitVec 32) ValueCell!7309)) (size!23109 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47276)

(assert (=> b!840118 (= res!571164 (and (= (size!23109 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23108 _keys!868) (size!23109 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840119 () Bool)

(declare-fun res!571167 () Bool)

(assert (=> b!840119 (=> (not res!571167) (not e!468791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47274 (_ BitVec 32)) Bool)

(assert (=> b!840119 (= res!571167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun e!468795 () Bool)

(declare-fun b!840120 () Bool)

(declare-fun v!557 () V!25709)

(declare-datatypes ((tuple2!10328 0))(
  ( (tuple2!10329 (_1!5175 (_ BitVec 64)) (_2!5175 V!25709)) )
))
(declare-datatypes ((List!16122 0))(
  ( (Nil!16119) (Cons!16118 (h!17249 tuple2!10328) (t!22493 List!16122)) )
))
(declare-datatypes ((ListLongMap!9097 0))(
  ( (ListLongMap!9098 (toList!4564 List!16122)) )
))
(declare-fun call!37127 () ListLongMap!9097)

(declare-fun call!37126 () ListLongMap!9097)

(declare-fun +!2033 (ListLongMap!9097 tuple2!10328) ListLongMap!9097)

(assert (=> b!840120 (= e!468795 (= call!37127 (+!2033 call!37126 (tuple2!10329 k!854 v!557))))))

(declare-fun mapNonEmpty!24845 () Bool)

(declare-fun mapRes!24845 () Bool)

(declare-fun tp!47991 () Bool)

(assert (=> mapNonEmpty!24845 (= mapRes!24845 (and tp!47991 e!468794))))

(declare-fun mapKey!24845 () (_ BitVec 32))

(declare-fun mapValue!24845 () ValueCell!7309)

(declare-fun mapRest!24845 () (Array (_ BitVec 32) ValueCell!7309))

(assert (=> mapNonEmpty!24845 (= (arr!22669 _values!688) (store mapRest!24845 mapKey!24845 mapValue!24845))))

(declare-fun b!840121 () Bool)

(declare-fun res!571169 () Bool)

(assert (=> b!840121 (=> (not res!571169) (not e!468791))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!840121 (= res!571169 (and (= (select (arr!22668 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23108 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840122 () Bool)

(declare-fun res!571163 () Bool)

(assert (=> b!840122 (=> (not res!571163) (not e!468791))))

(assert (=> b!840122 (= res!571163 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23108 _keys!868))))))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37123 () Bool)

(declare-fun minValue!654 () V!25709)

(declare-fun zeroValue!654 () V!25709)

(declare-fun getCurrentListMapNoExtraKeys!2552 (array!47274 array!47276 (_ BitVec 32) (_ BitVec 32) V!25709 V!25709 (_ BitVec 32) Int) ListLongMap!9097)

(assert (=> bm!37123 (= call!37127 (getCurrentListMapNoExtraKeys!2552 _keys!868 (array!47277 (store (arr!22669 _values!688) i!612 (ValueCellFull!7309 v!557)) (size!23109 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24845 () Bool)

(assert (=> mapIsEmpty!24845 mapRes!24845))

(declare-fun b!840123 () Bool)

(declare-fun e!468793 () Bool)

(assert (=> b!840123 (= e!468793 tp_is_empty!15497)))

(declare-fun res!571162 () Bool)

(assert (=> start!72446 (=> (not res!571162) (not e!468791))))

(assert (=> start!72446 (= res!571162 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23108 _keys!868))))))

(assert (=> start!72446 e!468791))

(assert (=> start!72446 tp_is_empty!15497))

(assert (=> start!72446 true))

(assert (=> start!72446 tp!47992))

(declare-fun array_inv!18050 (array!47274) Bool)

(assert (=> start!72446 (array_inv!18050 _keys!868)))

(declare-fun e!468796 () Bool)

(declare-fun array_inv!18051 (array!47276) Bool)

(assert (=> start!72446 (and (array_inv!18051 _values!688) e!468796)))

(declare-fun b!840124 () Bool)

(declare-fun res!571166 () Bool)

(assert (=> b!840124 (=> (not res!571166) (not e!468791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840124 (= res!571166 (validMask!0 mask!1196))))

(declare-fun b!840125 () Bool)

(assert (=> b!840125 (= e!468791 (not true))))

(assert (=> b!840125 e!468795))

(declare-fun c!91306 () Bool)

(assert (=> b!840125 (= c!91306 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28853 0))(
  ( (Unit!28854) )
))
(declare-fun lt!380812 () Unit!28853)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!272 (array!47274 array!47276 (_ BitVec 32) (_ BitVec 32) V!25709 V!25709 (_ BitVec 32) (_ BitVec 64) V!25709 (_ BitVec 32) Int) Unit!28853)

(assert (=> b!840125 (= lt!380812 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!272 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840126 () Bool)

(declare-fun res!571168 () Bool)

(assert (=> b!840126 (=> (not res!571168) (not e!468791))))

(declare-datatypes ((List!16123 0))(
  ( (Nil!16120) (Cons!16119 (h!17250 (_ BitVec 64)) (t!22494 List!16123)) )
))
(declare-fun arrayNoDuplicates!0 (array!47274 (_ BitVec 32) List!16123) Bool)

(assert (=> b!840126 (= res!571168 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16120))))

(declare-fun b!840127 () Bool)

(assert (=> b!840127 (= e!468795 (= call!37127 call!37126))))

(declare-fun b!840128 () Bool)

(assert (=> b!840128 (= e!468796 (and e!468793 mapRes!24845))))

(declare-fun condMapEmpty!24845 () Bool)

(declare-fun mapDefault!24845 () ValueCell!7309)

