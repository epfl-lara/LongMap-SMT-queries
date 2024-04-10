; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73082 () Bool)

(assert start!73082)

(declare-fun b_free!13997 () Bool)

(declare-fun b_next!13997 () Bool)

(assert (=> start!73082 (= b_free!13997 (not b_next!13997))))

(declare-fun tp!49495 () Bool)

(declare-fun b_and!23153 () Bool)

(assert (=> start!73082 (= tp!49495 b_and!23153)))

(declare-fun bm!37843 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26557 0))(
  ( (V!26558 (val!8114 Int)) )
))
(declare-datatypes ((tuple2!10632 0))(
  ( (tuple2!10633 (_1!5327 (_ BitVec 64)) (_2!5327 V!26557)) )
))
(declare-datatypes ((List!16477 0))(
  ( (Nil!16474) (Cons!16473 (h!17604 tuple2!10632) (t!22920 List!16477)) )
))
(declare-datatypes ((ListLongMap!9401 0))(
  ( (ListLongMap!9402 (toList!4716 List!16477)) )
))
(declare-fun call!37847 () ListLongMap!9401)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48472 0))(
  ( (array!48473 (arr!23267 (Array (_ BitVec 32) (_ BitVec 64))) (size!23707 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48472)

(declare-datatypes ((ValueCell!7627 0))(
  ( (ValueCellFull!7627 (v!10539 V!26557)) (EmptyCell!7627) )
))
(declare-datatypes ((array!48474 0))(
  ( (array!48475 (arr!23268 (Array (_ BitVec 32) ValueCell!7627)) (size!23708 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48474)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26557)

(declare-fun zeroValue!654 () V!26557)

(declare-fun getCurrentListMapNoExtraKeys!2698 (array!48472 array!48474 (_ BitVec 32) (_ BitVec 32) V!26557 V!26557 (_ BitVec 32) Int) ListLongMap!9401)

(assert (=> bm!37843 (= call!37847 (getCurrentListMapNoExtraKeys!2698 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37846 () ListLongMap!9401)

(declare-fun e!474229 () Bool)

(declare-fun v!557 () V!26557)

(declare-fun b!850084 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2118 (ListLongMap!9401 tuple2!10632) ListLongMap!9401)

(assert (=> b!850084 (= e!474229 (= call!37846 (+!2118 call!37847 (tuple2!10633 k!854 v!557))))))

(declare-fun mapNonEmpty!25799 () Bool)

(declare-fun mapRes!25799 () Bool)

(declare-fun tp!49494 () Bool)

(declare-fun e!474232 () Bool)

(assert (=> mapNonEmpty!25799 (= mapRes!25799 (and tp!49494 e!474232))))

(declare-fun mapValue!25799 () ValueCell!7627)

(declare-fun mapRest!25799 () (Array (_ BitVec 32) ValueCell!7627))

(declare-fun mapKey!25799 () (_ BitVec 32))

(assert (=> mapNonEmpty!25799 (= (arr!23268 _values!688) (store mapRest!25799 mapKey!25799 mapValue!25799))))

(declare-fun b!850085 () Bool)

(assert (=> b!850085 (= e!474229 (= call!37846 call!37847))))

(declare-fun b!850086 () Bool)

(declare-fun res!577480 () Bool)

(declare-fun e!474230 () Bool)

(assert (=> b!850086 (=> (not res!577480) (not e!474230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48472 (_ BitVec 32)) Bool)

(assert (=> b!850086 (= res!577480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850088 () Bool)

(declare-fun res!577479 () Bool)

(assert (=> b!850088 (=> (not res!577479) (not e!474230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850088 (= res!577479 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!25799 () Bool)

(assert (=> mapIsEmpty!25799 mapRes!25799))

(declare-fun bm!37844 () Bool)

(declare-fun lt!382600 () array!48474)

(assert (=> bm!37844 (= call!37846 (getCurrentListMapNoExtraKeys!2698 _keys!868 lt!382600 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850089 () Bool)

(declare-fun e!474227 () Bool)

(assert (=> b!850089 (= e!474230 e!474227)))

(declare-fun res!577481 () Bool)

(assert (=> b!850089 (=> (not res!577481) (not e!474227))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850089 (= res!577481 (= from!1053 i!612))))

(declare-fun lt!382601 () ListLongMap!9401)

(assert (=> b!850089 (= lt!382601 (getCurrentListMapNoExtraKeys!2698 _keys!868 lt!382600 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850089 (= lt!382600 (array!48475 (store (arr!23268 _values!688) i!612 (ValueCellFull!7627 v!557)) (size!23708 _values!688)))))

(declare-fun lt!382603 () ListLongMap!9401)

(assert (=> b!850089 (= lt!382603 (getCurrentListMapNoExtraKeys!2698 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850090 () Bool)

(declare-fun e!474231 () Bool)

(assert (=> b!850090 (= e!474231 true)))

(declare-fun lt!382599 () V!26557)

(declare-fun lt!382598 () ListLongMap!9401)

(declare-fun lt!382595 () tuple2!10632)

(assert (=> b!850090 (= (+!2118 lt!382598 lt!382595) (+!2118 (+!2118 lt!382598 (tuple2!10633 k!854 lt!382599)) lt!382595))))

(declare-fun lt!382597 () V!26557)

(assert (=> b!850090 (= lt!382595 (tuple2!10633 k!854 lt!382597))))

(declare-datatypes ((Unit!29027 0))(
  ( (Unit!29028) )
))
(declare-fun lt!382594 () Unit!29027)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!255 (ListLongMap!9401 (_ BitVec 64) V!26557 V!26557) Unit!29027)

(assert (=> b!850090 (= lt!382594 (addSameAsAddTwiceSameKeyDiffValues!255 lt!382598 k!854 lt!382599 lt!382597))))

(declare-fun lt!382602 () V!26557)

(declare-fun get!12251 (ValueCell!7627 V!26557) V!26557)

(assert (=> b!850090 (= lt!382599 (get!12251 (select (arr!23268 _values!688) from!1053) lt!382602))))

(assert (=> b!850090 (= lt!382601 (+!2118 lt!382598 (tuple2!10633 (select (arr!23267 _keys!868) from!1053) lt!382597)))))

(assert (=> b!850090 (= lt!382597 (get!12251 (select (store (arr!23268 _values!688) i!612 (ValueCellFull!7627 v!557)) from!1053) lt!382602))))

(declare-fun dynLambda!1009 (Int (_ BitVec 64)) V!26557)

(assert (=> b!850090 (= lt!382602 (dynLambda!1009 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850090 (= lt!382598 (getCurrentListMapNoExtraKeys!2698 _keys!868 lt!382600 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850091 () Bool)

(declare-fun res!577486 () Bool)

(assert (=> b!850091 (=> (not res!577486) (not e!474230))))

(assert (=> b!850091 (= res!577486 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23707 _keys!868))))))

(declare-fun b!850092 () Bool)

(declare-fun res!577487 () Bool)

(assert (=> b!850092 (=> (not res!577487) (not e!474230))))

(assert (=> b!850092 (= res!577487 (and (= (select (arr!23267 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!850093 () Bool)

(declare-fun e!474226 () Bool)

(declare-fun tp_is_empty!16133 () Bool)

(assert (=> b!850093 (= e!474226 tp_is_empty!16133)))

(declare-fun b!850094 () Bool)

(assert (=> b!850094 (= e!474232 tp_is_empty!16133)))

(declare-fun b!850095 () Bool)

(assert (=> b!850095 (= e!474227 (not e!474231))))

(declare-fun res!577484 () Bool)

(assert (=> b!850095 (=> res!577484 e!474231)))

(assert (=> b!850095 (= res!577484 (not (validKeyInArray!0 (select (arr!23267 _keys!868) from!1053))))))

(assert (=> b!850095 e!474229))

(declare-fun c!91666 () Bool)

(assert (=> b!850095 (= c!91666 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382596 () Unit!29027)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!357 (array!48472 array!48474 (_ BitVec 32) (_ BitVec 32) V!26557 V!26557 (_ BitVec 32) (_ BitVec 64) V!26557 (_ BitVec 32) Int) Unit!29027)

(assert (=> b!850095 (= lt!382596 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!357 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850096 () Bool)

(declare-fun res!577478 () Bool)

(assert (=> b!850096 (=> (not res!577478) (not e!474230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850096 (= res!577478 (validMask!0 mask!1196))))

(declare-fun res!577482 () Bool)

(assert (=> start!73082 (=> (not res!577482) (not e!474230))))

(assert (=> start!73082 (= res!577482 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23707 _keys!868))))))

(assert (=> start!73082 e!474230))

(assert (=> start!73082 tp_is_empty!16133))

(assert (=> start!73082 true))

(assert (=> start!73082 tp!49495))

(declare-fun array_inv!18464 (array!48472) Bool)

(assert (=> start!73082 (array_inv!18464 _keys!868)))

(declare-fun e!474225 () Bool)

(declare-fun array_inv!18465 (array!48474) Bool)

(assert (=> start!73082 (and (array_inv!18465 _values!688) e!474225)))

(declare-fun b!850087 () Bool)

(declare-fun res!577483 () Bool)

(assert (=> b!850087 (=> (not res!577483) (not e!474230))))

(declare-datatypes ((List!16478 0))(
  ( (Nil!16475) (Cons!16474 (h!17605 (_ BitVec 64)) (t!22921 List!16478)) )
))
(declare-fun arrayNoDuplicates!0 (array!48472 (_ BitVec 32) List!16478) Bool)

(assert (=> b!850087 (= res!577483 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16475))))

(declare-fun b!850097 () Bool)

(assert (=> b!850097 (= e!474225 (and e!474226 mapRes!25799))))

(declare-fun condMapEmpty!25799 () Bool)

(declare-fun mapDefault!25799 () ValueCell!7627)

