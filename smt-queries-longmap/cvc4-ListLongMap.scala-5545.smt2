; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73058 () Bool)

(assert start!73058)

(declare-fun b_free!13973 () Bool)

(declare-fun b_next!13973 () Bool)

(assert (=> start!73058 (= b_free!13973 (not b_next!13973))))

(declare-fun tp!49422 () Bool)

(declare-fun b_and!23105 () Bool)

(assert (=> start!73058 (= tp!49422 b_and!23105)))

(declare-fun b!849520 () Bool)

(declare-fun res!577121 () Bool)

(declare-fun e!473941 () Bool)

(assert (=> b!849520 (=> (not res!577121) (not e!473941))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26525 0))(
  ( (V!26526 (val!8102 Int)) )
))
(declare-datatypes ((ValueCell!7615 0))(
  ( (ValueCellFull!7615 (v!10527 V!26525)) (EmptyCell!7615) )
))
(declare-datatypes ((array!48424 0))(
  ( (array!48425 (arr!23243 (Array (_ BitVec 32) ValueCell!7615)) (size!23683 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48424)

(declare-datatypes ((array!48426 0))(
  ( (array!48427 (arr!23244 (Array (_ BitVec 32) (_ BitVec 64))) (size!23684 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48426)

(assert (=> b!849520 (= res!577121 (and (= (size!23683 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23684 _keys!868) (size!23683 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun e!473938 () Bool)

(declare-datatypes ((tuple2!10610 0))(
  ( (tuple2!10611 (_1!5316 (_ BitVec 64)) (_2!5316 V!26525)) )
))
(declare-datatypes ((List!16458 0))(
  ( (Nil!16455) (Cons!16454 (h!17585 tuple2!10610) (t!22877 List!16458)) )
))
(declare-datatypes ((ListLongMap!9379 0))(
  ( (ListLongMap!9380 (toList!4705 List!16458)) )
))
(declare-fun call!37775 () ListLongMap!9379)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun call!37774 () ListLongMap!9379)

(declare-fun v!557 () V!26525)

(declare-fun b!849521 () Bool)

(declare-fun +!2110 (ListLongMap!9379 tuple2!10610) ListLongMap!9379)

(assert (=> b!849521 (= e!473938 (= call!37775 (+!2110 call!37774 (tuple2!10611 k!854 v!557))))))

(declare-fun b!849522 () Bool)

(declare-fun e!473937 () Bool)

(assert (=> b!849522 (= e!473937 true)))

(declare-fun lt!382297 () array!48424)

(declare-fun lt!382294 () ListLongMap!9379)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26525)

(declare-fun zeroValue!654 () V!26525)

(declare-fun getCurrentListMapNoExtraKeys!2687 (array!48426 array!48424 (_ BitVec 32) (_ BitVec 32) V!26525 V!26525 (_ BitVec 32) Int) ListLongMap!9379)

(declare-fun get!12235 (ValueCell!7615 V!26525) V!26525)

(declare-fun dynLambda!1001 (Int (_ BitVec 64)) V!26525)

(assert (=> b!849522 (= lt!382294 (+!2110 (getCurrentListMapNoExtraKeys!2687 _keys!868 lt!382297 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10611 (select (arr!23244 _keys!868) from!1053) (get!12235 (select (arr!23243 lt!382297) from!1053) (dynLambda!1001 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849523 () Bool)

(declare-fun res!577120 () Bool)

(assert (=> b!849523 (=> (not res!577120) (not e!473941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48426 (_ BitVec 32)) Bool)

(assert (=> b!849523 (= res!577120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25763 () Bool)

(declare-fun mapRes!25763 () Bool)

(assert (=> mapIsEmpty!25763 mapRes!25763))

(declare-fun mapNonEmpty!25763 () Bool)

(declare-fun tp!49423 () Bool)

(declare-fun e!473944 () Bool)

(assert (=> mapNonEmpty!25763 (= mapRes!25763 (and tp!49423 e!473944))))

(declare-fun mapValue!25763 () ValueCell!7615)

(declare-fun mapRest!25763 () (Array (_ BitVec 32) ValueCell!7615))

(declare-fun mapKey!25763 () (_ BitVec 32))

(assert (=> mapNonEmpty!25763 (= (arr!23243 _values!688) (store mapRest!25763 mapKey!25763 mapValue!25763))))

(declare-fun bm!37771 () Bool)

(assert (=> bm!37771 (= call!37774 (getCurrentListMapNoExtraKeys!2687 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849524 () Bool)

(declare-fun res!577125 () Bool)

(assert (=> b!849524 (=> (not res!577125) (not e!473941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849524 (= res!577125 (validKeyInArray!0 k!854))))

(declare-fun b!849525 () Bool)

(declare-fun res!577124 () Bool)

(assert (=> b!849525 (=> (not res!577124) (not e!473941))))

(declare-datatypes ((List!16459 0))(
  ( (Nil!16456) (Cons!16455 (h!17586 (_ BitVec 64)) (t!22878 List!16459)) )
))
(declare-fun arrayNoDuplicates!0 (array!48426 (_ BitVec 32) List!16459) Bool)

(assert (=> b!849525 (= res!577124 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16456))))

(declare-fun b!849526 () Bool)

(declare-fun tp_is_empty!16109 () Bool)

(assert (=> b!849526 (= e!473944 tp_is_empty!16109)))

(declare-fun b!849527 () Bool)

(declare-fun e!473943 () Bool)

(assert (=> b!849527 (= e!473943 tp_is_empty!16109)))

(declare-fun b!849528 () Bool)

(declare-fun e!473942 () Bool)

(assert (=> b!849528 (= e!473942 (not e!473937))))

(declare-fun res!577123 () Bool)

(assert (=> b!849528 (=> res!577123 e!473937)))

(assert (=> b!849528 (= res!577123 (not (validKeyInArray!0 (select (arr!23244 _keys!868) from!1053))))))

(assert (=> b!849528 e!473938))

(declare-fun c!91630 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849528 (= c!91630 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29009 0))(
  ( (Unit!29010) )
))
(declare-fun lt!382295 () Unit!29009)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!350 (array!48426 array!48424 (_ BitVec 32) (_ BitVec 32) V!26525 V!26525 (_ BitVec 32) (_ BitVec 64) V!26525 (_ BitVec 32) Int) Unit!29009)

(assert (=> b!849528 (= lt!382295 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!350 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37772 () Bool)

(assert (=> bm!37772 (= call!37775 (getCurrentListMapNoExtraKeys!2687 _keys!868 lt!382297 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849529 () Bool)

(declare-fun res!577127 () Bool)

(assert (=> b!849529 (=> (not res!577127) (not e!473941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849529 (= res!577127 (validMask!0 mask!1196))))

(declare-fun b!849530 () Bool)

(assert (=> b!849530 (= e!473941 e!473942)))

(declare-fun res!577126 () Bool)

(assert (=> b!849530 (=> (not res!577126) (not e!473942))))

(assert (=> b!849530 (= res!577126 (= from!1053 i!612))))

(assert (=> b!849530 (= lt!382294 (getCurrentListMapNoExtraKeys!2687 _keys!868 lt!382297 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849530 (= lt!382297 (array!48425 (store (arr!23243 _values!688) i!612 (ValueCellFull!7615 v!557)) (size!23683 _values!688)))))

(declare-fun lt!382296 () ListLongMap!9379)

(assert (=> b!849530 (= lt!382296 (getCurrentListMapNoExtraKeys!2687 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!577118 () Bool)

(assert (=> start!73058 (=> (not res!577118) (not e!473941))))

(assert (=> start!73058 (= res!577118 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23684 _keys!868))))))

(assert (=> start!73058 e!473941))

(assert (=> start!73058 tp_is_empty!16109))

(assert (=> start!73058 true))

(assert (=> start!73058 tp!49422))

(declare-fun array_inv!18448 (array!48426) Bool)

(assert (=> start!73058 (array_inv!18448 _keys!868)))

(declare-fun e!473939 () Bool)

(declare-fun array_inv!18449 (array!48424) Bool)

(assert (=> start!73058 (and (array_inv!18449 _values!688) e!473939)))

(declare-fun b!849531 () Bool)

(declare-fun res!577119 () Bool)

(assert (=> b!849531 (=> (not res!577119) (not e!473941))))

(assert (=> b!849531 (= res!577119 (and (= (select (arr!23244 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!849532 () Bool)

(assert (=> b!849532 (= e!473939 (and e!473943 mapRes!25763))))

(declare-fun condMapEmpty!25763 () Bool)

(declare-fun mapDefault!25763 () ValueCell!7615)

