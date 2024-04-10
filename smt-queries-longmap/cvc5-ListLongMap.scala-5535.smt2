; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72994 () Bool)

(assert start!72994)

(declare-fun b_free!13909 () Bool)

(declare-fun b_next!13909 () Bool)

(assert (=> start!72994 (= b_free!13909 (not b_next!13909))))

(declare-fun tp!49230 () Bool)

(declare-fun b_and!22995 () Bool)

(assert (=> start!72994 (= tp!49230 b_and!22995)))

(declare-fun b!848050 () Bool)

(declare-fun res!576174 () Bool)

(declare-fun e!473187 () Bool)

(assert (=> b!848050 (=> (not res!576174) (not e!473187))))

(declare-datatypes ((array!48300 0))(
  ( (array!48301 (arr!23181 (Array (_ BitVec 32) (_ BitVec 64))) (size!23621 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48300)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48300 (_ BitVec 32)) Bool)

(assert (=> b!848050 (= res!576174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848051 () Bool)

(declare-fun res!576179 () Bool)

(assert (=> b!848051 (=> (not res!576179) (not e!473187))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848051 (= res!576179 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23621 _keys!868))))))

(declare-fun res!576182 () Bool)

(assert (=> start!72994 (=> (not res!576182) (not e!473187))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72994 (= res!576182 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23621 _keys!868))))))

(assert (=> start!72994 e!473187))

(declare-fun tp_is_empty!16045 () Bool)

(assert (=> start!72994 tp_is_empty!16045))

(assert (=> start!72994 true))

(assert (=> start!72994 tp!49230))

(declare-fun array_inv!18408 (array!48300) Bool)

(assert (=> start!72994 (array_inv!18408 _keys!868)))

(declare-datatypes ((V!26441 0))(
  ( (V!26442 (val!8070 Int)) )
))
(declare-datatypes ((ValueCell!7583 0))(
  ( (ValueCellFull!7583 (v!10495 V!26441)) (EmptyCell!7583) )
))
(declare-datatypes ((array!48302 0))(
  ( (array!48303 (arr!23182 (Array (_ BitVec 32) ValueCell!7583)) (size!23622 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48302)

(declare-fun e!473188 () Bool)

(declare-fun array_inv!18409 (array!48302) Bool)

(assert (=> start!72994 (and (array_inv!18409 _values!688) e!473188)))

(declare-fun b!848052 () Bool)

(declare-fun res!576176 () Bool)

(assert (=> b!848052 (=> (not res!576176) (not e!473187))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848052 (= res!576176 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!25667 () Bool)

(declare-fun mapRes!25667 () Bool)

(assert (=> mapIsEmpty!25667 mapRes!25667))

(declare-fun b!848053 () Bool)

(declare-fun e!473191 () Bool)

(assert (=> b!848053 (= e!473191 (not true))))

(declare-fun e!473189 () Bool)

(assert (=> b!848053 e!473189))

(declare-fun c!91534 () Bool)

(assert (=> b!848053 (= c!91534 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26441)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!28963 0))(
  ( (Unit!28964) )
))
(declare-fun lt!381913 () Unit!28963)

(declare-fun minValue!654 () V!26441)

(declare-fun zeroValue!654 () V!26441)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!327 (array!48300 array!48302 (_ BitVec 32) (_ BitVec 32) V!26441 V!26441 (_ BitVec 32) (_ BitVec 64) V!26441 (_ BitVec 32) Int) Unit!28963)

(assert (=> b!848053 (= lt!381913 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!327 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848054 () Bool)

(assert (=> b!848054 (= e!473187 e!473191)))

(declare-fun res!576180 () Bool)

(assert (=> b!848054 (=> (not res!576180) (not e!473191))))

(assert (=> b!848054 (= res!576180 (= from!1053 i!612))))

(declare-datatypes ((tuple2!10550 0))(
  ( (tuple2!10551 (_1!5286 (_ BitVec 64)) (_2!5286 V!26441)) )
))
(declare-datatypes ((List!16407 0))(
  ( (Nil!16404) (Cons!16403 (h!17534 tuple2!10550) (t!22778 List!16407)) )
))
(declare-datatypes ((ListLongMap!9319 0))(
  ( (ListLongMap!9320 (toList!4675 List!16407)) )
))
(declare-fun lt!381910 () ListLongMap!9319)

(declare-fun lt!381912 () array!48302)

(declare-fun getCurrentListMapNoExtraKeys!2659 (array!48300 array!48302 (_ BitVec 32) (_ BitVec 32) V!26441 V!26441 (_ BitVec 32) Int) ListLongMap!9319)

(assert (=> b!848054 (= lt!381910 (getCurrentListMapNoExtraKeys!2659 _keys!868 lt!381912 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848054 (= lt!381912 (array!48303 (store (arr!23182 _values!688) i!612 (ValueCellFull!7583 v!557)) (size!23622 _values!688)))))

(declare-fun lt!381911 () ListLongMap!9319)

(assert (=> b!848054 (= lt!381911 (getCurrentListMapNoExtraKeys!2659 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun call!37583 () ListLongMap!9319)

(declare-fun bm!37579 () Bool)

(assert (=> bm!37579 (= call!37583 (getCurrentListMapNoExtraKeys!2659 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25667 () Bool)

(declare-fun tp!49231 () Bool)

(declare-fun e!473185 () Bool)

(assert (=> mapNonEmpty!25667 (= mapRes!25667 (and tp!49231 e!473185))))

(declare-fun mapKey!25667 () (_ BitVec 32))

(declare-fun mapValue!25667 () ValueCell!7583)

(declare-fun mapRest!25667 () (Array (_ BitVec 32) ValueCell!7583))

(assert (=> mapNonEmpty!25667 (= (arr!23182 _values!688) (store mapRest!25667 mapKey!25667 mapValue!25667))))

(declare-fun b!848055 () Bool)

(declare-fun res!576178 () Bool)

(assert (=> b!848055 (=> (not res!576178) (not e!473187))))

(assert (=> b!848055 (= res!576178 (and (= (size!23622 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23621 _keys!868) (size!23622 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848056 () Bool)

(declare-fun res!576181 () Bool)

(assert (=> b!848056 (=> (not res!576181) (not e!473187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848056 (= res!576181 (validMask!0 mask!1196))))

(declare-fun b!848057 () Bool)

(declare-fun res!576177 () Bool)

(assert (=> b!848057 (=> (not res!576177) (not e!473187))))

(declare-datatypes ((List!16408 0))(
  ( (Nil!16405) (Cons!16404 (h!17535 (_ BitVec 64)) (t!22779 List!16408)) )
))
(declare-fun arrayNoDuplicates!0 (array!48300 (_ BitVec 32) List!16408) Bool)

(assert (=> b!848057 (= res!576177 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16405))))

(declare-fun b!848058 () Bool)

(assert (=> b!848058 (= e!473185 tp_is_empty!16045)))

(declare-fun b!848059 () Bool)

(declare-fun e!473186 () Bool)

(assert (=> b!848059 (= e!473186 tp_is_empty!16045)))

(declare-fun b!848060 () Bool)

(declare-fun call!37582 () ListLongMap!9319)

(declare-fun +!2088 (ListLongMap!9319 tuple2!10550) ListLongMap!9319)

(assert (=> b!848060 (= e!473189 (= call!37582 (+!2088 call!37583 (tuple2!10551 k!854 v!557))))))

(declare-fun bm!37580 () Bool)

(assert (=> bm!37580 (= call!37582 (getCurrentListMapNoExtraKeys!2659 _keys!868 lt!381912 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848061 () Bool)

(assert (=> b!848061 (= e!473188 (and e!473186 mapRes!25667))))

(declare-fun condMapEmpty!25667 () Bool)

(declare-fun mapDefault!25667 () ValueCell!7583)

