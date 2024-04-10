; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73054 () Bool)

(assert start!73054)

(declare-fun b_free!13969 () Bool)

(declare-fun b_next!13969 () Bool)

(assert (=> start!73054 (= b_free!13969 (not b_next!13969))))

(declare-fun tp!49410 () Bool)

(declare-fun b_and!23097 () Bool)

(assert (=> start!73054 (= tp!49410 b_and!23097)))

(declare-fun b!849426 () Bool)

(declare-fun res!577059 () Bool)

(declare-fun e!473893 () Bool)

(assert (=> b!849426 (=> (not res!577059) (not e!473893))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849426 (= res!577059 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25757 () Bool)

(declare-fun mapRes!25757 () Bool)

(declare-fun tp!49411 () Bool)

(declare-fun e!473896 () Bool)

(assert (=> mapNonEmpty!25757 (= mapRes!25757 (and tp!49411 e!473896))))

(declare-datatypes ((V!26521 0))(
  ( (V!26522 (val!8100 Int)) )
))
(declare-datatypes ((ValueCell!7613 0))(
  ( (ValueCellFull!7613 (v!10525 V!26521)) (EmptyCell!7613) )
))
(declare-fun mapRest!25757 () (Array (_ BitVec 32) ValueCell!7613))

(declare-fun mapKey!25757 () (_ BitVec 32))

(declare-datatypes ((array!48416 0))(
  ( (array!48417 (arr!23239 (Array (_ BitVec 32) ValueCell!7613)) (size!23679 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48416)

(declare-fun mapValue!25757 () ValueCell!7613)

(assert (=> mapNonEmpty!25757 (= (arr!23239 _values!688) (store mapRest!25757 mapKey!25757 mapValue!25757))))

(declare-fun b!849427 () Bool)

(declare-fun res!577065 () Bool)

(assert (=> b!849427 (=> (not res!577065) (not e!473893))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48418 0))(
  ( (array!48419 (arr!23240 (Array (_ BitVec 32) (_ BitVec 64))) (size!23680 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48418)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!849427 (= res!577065 (and (= (select (arr!23240 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!849428 () Bool)

(declare-fun res!577060 () Bool)

(assert (=> b!849428 (=> (not res!577060) (not e!473893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48418 (_ BitVec 32)) Bool)

(assert (=> b!849428 (= res!577060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37759 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10606 0))(
  ( (tuple2!10607 (_1!5314 (_ BitVec 64)) (_2!5314 V!26521)) )
))
(declare-datatypes ((List!16454 0))(
  ( (Nil!16451) (Cons!16450 (h!17581 tuple2!10606) (t!22869 List!16454)) )
))
(declare-datatypes ((ListLongMap!9375 0))(
  ( (ListLongMap!9376 (toList!4703 List!16454)) )
))
(declare-fun call!37762 () ListLongMap!9375)

(declare-fun lt!382272 () array!48416)

(declare-fun minValue!654 () V!26521)

(declare-fun zeroValue!654 () V!26521)

(declare-fun getCurrentListMapNoExtraKeys!2685 (array!48418 array!48416 (_ BitVec 32) (_ BitVec 32) V!26521 V!26521 (_ BitVec 32) Int) ListLongMap!9375)

(assert (=> bm!37759 (= call!37762 (getCurrentListMapNoExtraKeys!2685 _keys!868 lt!382272 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849429 () Bool)

(declare-fun e!473894 () Bool)

(declare-fun e!473895 () Bool)

(assert (=> b!849429 (= e!473894 (not e!473895))))

(declare-fun res!577067 () Bool)

(assert (=> b!849429 (=> res!577067 e!473895)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849429 (= res!577067 (not (validKeyInArray!0 (select (arr!23240 _keys!868) from!1053))))))

(declare-fun e!473891 () Bool)

(assert (=> b!849429 e!473891))

(declare-fun c!91624 () Bool)

(assert (=> b!849429 (= c!91624 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26521)

(declare-datatypes ((Unit!29005 0))(
  ( (Unit!29006) )
))
(declare-fun lt!382271 () Unit!29005)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!348 (array!48418 array!48416 (_ BitVec 32) (_ BitVec 32) V!26521 V!26521 (_ BitVec 32) (_ BitVec 64) V!26521 (_ BitVec 32) Int) Unit!29005)

(assert (=> b!849429 (= lt!382271 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!348 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849430 () Bool)

(declare-fun res!577066 () Bool)

(assert (=> b!849430 (=> (not res!577066) (not e!473893))))

(assert (=> b!849430 (= res!577066 (validKeyInArray!0 k!854))))

(declare-fun b!849431 () Bool)

(declare-fun call!37763 () ListLongMap!9375)

(assert (=> b!849431 (= e!473891 (= call!37762 call!37763))))

(declare-fun b!849432 () Bool)

(declare-fun tp_is_empty!16105 () Bool)

(assert (=> b!849432 (= e!473896 tp_is_empty!16105)))

(declare-fun b!849433 () Bool)

(assert (=> b!849433 (= e!473895 true)))

(declare-fun lt!382270 () ListLongMap!9375)

(declare-fun +!2108 (ListLongMap!9375 tuple2!10606) ListLongMap!9375)

(declare-fun get!12233 (ValueCell!7613 V!26521) V!26521)

(declare-fun dynLambda!999 (Int (_ BitVec 64)) V!26521)

(assert (=> b!849433 (= lt!382270 (+!2108 (getCurrentListMapNoExtraKeys!2685 _keys!868 lt!382272 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10607 (select (arr!23240 _keys!868) from!1053) (get!12233 (select (arr!23239 lt!382272) from!1053) (dynLambda!999 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849435 () Bool)

(assert (=> b!849435 (= e!473893 e!473894)))

(declare-fun res!577061 () Bool)

(assert (=> b!849435 (=> (not res!577061) (not e!473894))))

(assert (=> b!849435 (= res!577061 (= from!1053 i!612))))

(assert (=> b!849435 (= lt!382270 (getCurrentListMapNoExtraKeys!2685 _keys!868 lt!382272 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849435 (= lt!382272 (array!48417 (store (arr!23239 _values!688) i!612 (ValueCellFull!7613 v!557)) (size!23679 _values!688)))))

(declare-fun lt!382273 () ListLongMap!9375)

(assert (=> b!849435 (= lt!382273 (getCurrentListMapNoExtraKeys!2685 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!37760 () Bool)

(assert (=> bm!37760 (= call!37763 (getCurrentListMapNoExtraKeys!2685 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849436 () Bool)

(declare-fun res!577064 () Bool)

(assert (=> b!849436 (=> (not res!577064) (not e!473893))))

(assert (=> b!849436 (= res!577064 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23680 _keys!868))))))

(declare-fun b!849437 () Bool)

(declare-fun res!577063 () Bool)

(assert (=> b!849437 (=> (not res!577063) (not e!473893))))

(declare-datatypes ((List!16455 0))(
  ( (Nil!16452) (Cons!16451 (h!17582 (_ BitVec 64)) (t!22870 List!16455)) )
))
(declare-fun arrayNoDuplicates!0 (array!48418 (_ BitVec 32) List!16455) Bool)

(assert (=> b!849437 (= res!577063 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16452))))

(declare-fun b!849438 () Bool)

(declare-fun res!577062 () Bool)

(assert (=> b!849438 (=> (not res!577062) (not e!473893))))

(assert (=> b!849438 (= res!577062 (and (= (size!23679 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23680 _keys!868) (size!23679 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!577058 () Bool)

(assert (=> start!73054 (=> (not res!577058) (not e!473893))))

(assert (=> start!73054 (= res!577058 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23680 _keys!868))))))

(assert (=> start!73054 e!473893))

(assert (=> start!73054 tp_is_empty!16105))

(assert (=> start!73054 true))

(assert (=> start!73054 tp!49410))

(declare-fun array_inv!18444 (array!48418) Bool)

(assert (=> start!73054 (array_inv!18444 _keys!868)))

(declare-fun e!473890 () Bool)

(declare-fun array_inv!18445 (array!48416) Bool)

(assert (=> start!73054 (and (array_inv!18445 _values!688) e!473890)))

(declare-fun b!849434 () Bool)

(declare-fun e!473889 () Bool)

(assert (=> b!849434 (= e!473889 tp_is_empty!16105)))

(declare-fun mapIsEmpty!25757 () Bool)

(assert (=> mapIsEmpty!25757 mapRes!25757))

(declare-fun b!849439 () Bool)

(assert (=> b!849439 (= e!473890 (and e!473889 mapRes!25757))))

(declare-fun condMapEmpty!25757 () Bool)

(declare-fun mapDefault!25757 () ValueCell!7613)

