; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73094 () Bool)

(assert start!73094)

(declare-fun b_free!14009 () Bool)

(declare-fun b_next!14009 () Bool)

(assert (=> start!73094 (= b_free!14009 (not b_next!14009))))

(declare-fun tp!49531 () Bool)

(declare-fun b_and!23177 () Bool)

(assert (=> start!73094 (= tp!49531 b_and!23177)))

(declare-fun b!850366 () Bool)

(declare-fun res!577663 () Bool)

(declare-fun e!474370 () Bool)

(assert (=> b!850366 (=> (not res!577663) (not e!474370))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850366 (= res!577663 (validKeyInArray!0 k!854))))

(declare-fun b!850367 () Bool)

(declare-fun res!577658 () Bool)

(assert (=> b!850367 (=> (not res!577658) (not e!474370))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850367 (= res!577658 (validMask!0 mask!1196))))

(declare-fun b!850368 () Bool)

(declare-fun res!577659 () Bool)

(assert (=> b!850368 (=> (not res!577659) (not e!474370))))

(declare-datatypes ((array!48494 0))(
  ( (array!48495 (arr!23278 (Array (_ BitVec 32) (_ BitVec 64))) (size!23718 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48494)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48494 (_ BitVec 32)) Bool)

(assert (=> b!850368 (= res!577659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850369 () Bool)

(declare-fun res!577661 () Bool)

(assert (=> b!850369 (=> (not res!577661) (not e!474370))))

(declare-datatypes ((List!16486 0))(
  ( (Nil!16483) (Cons!16482 (h!17613 (_ BitVec 64)) (t!22941 List!16486)) )
))
(declare-fun arrayNoDuplicates!0 (array!48494 (_ BitVec 32) List!16486) Bool)

(assert (=> b!850369 (= res!577661 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16483))))

(declare-fun b!850370 () Bool)

(declare-fun res!577662 () Bool)

(assert (=> b!850370 (=> (not res!577662) (not e!474370))))

(declare-datatypes ((V!26573 0))(
  ( (V!26574 (val!8120 Int)) )
))
(declare-datatypes ((ValueCell!7633 0))(
  ( (ValueCellFull!7633 (v!10545 V!26573)) (EmptyCell!7633) )
))
(declare-datatypes ((array!48496 0))(
  ( (array!48497 (arr!23279 (Array (_ BitVec 32) ValueCell!7633)) (size!23719 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48496)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!850370 (= res!577662 (and (= (size!23719 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23718 _keys!868) (size!23719 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850371 () Bool)

(declare-fun e!474376 () Bool)

(declare-fun tp_is_empty!16145 () Bool)

(assert (=> b!850371 (= e!474376 tp_is_empty!16145)))

(declare-fun b!850372 () Bool)

(declare-fun e!474374 () Bool)

(declare-fun e!474375 () Bool)

(assert (=> b!850372 (= e!474374 (not e!474375))))

(declare-fun res!577664 () Bool)

(assert (=> b!850372 (=> res!577664 e!474375)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!850372 (= res!577664 (not (validKeyInArray!0 (select (arr!23278 _keys!868) from!1053))))))

(declare-fun e!474371 () Bool)

(assert (=> b!850372 e!474371))

(declare-fun c!91684 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850372 (= c!91684 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26573)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26573)

(declare-fun zeroValue!654 () V!26573)

(declare-datatypes ((Unit!29037 0))(
  ( (Unit!29038) )
))
(declare-fun lt!382777 () Unit!29037)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!362 (array!48494 array!48496 (_ BitVec 32) (_ BitVec 32) V!26573 V!26573 (_ BitVec 32) (_ BitVec 64) V!26573 (_ BitVec 32) Int) Unit!29037)

(assert (=> b!850372 (= lt!382777 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!362 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!577665 () Bool)

(assert (=> start!73094 (=> (not res!577665) (not e!474370))))

(assert (=> start!73094 (= res!577665 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23718 _keys!868))))))

(assert (=> start!73094 e!474370))

(assert (=> start!73094 tp_is_empty!16145))

(assert (=> start!73094 true))

(assert (=> start!73094 tp!49531))

(declare-fun array_inv!18474 (array!48494) Bool)

(assert (=> start!73094 (array_inv!18474 _keys!868)))

(declare-fun e!474369 () Bool)

(declare-fun array_inv!18475 (array!48496) Bool)

(assert (=> start!73094 (and (array_inv!18475 _values!688) e!474369)))

(declare-fun bm!37879 () Bool)

(declare-datatypes ((tuple2!10642 0))(
  ( (tuple2!10643 (_1!5332 (_ BitVec 64)) (_2!5332 V!26573)) )
))
(declare-datatypes ((List!16487 0))(
  ( (Nil!16484) (Cons!16483 (h!17614 tuple2!10642) (t!22942 List!16487)) )
))
(declare-datatypes ((ListLongMap!9411 0))(
  ( (ListLongMap!9412 (toList!4721 List!16487)) )
))
(declare-fun call!37883 () ListLongMap!9411)

(declare-fun getCurrentListMapNoExtraKeys!2703 (array!48494 array!48496 (_ BitVec 32) (_ BitVec 32) V!26573 V!26573 (_ BitVec 32) Int) ListLongMap!9411)

(assert (=> bm!37879 (= call!37883 (getCurrentListMapNoExtraKeys!2703 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850373 () Bool)

(declare-fun res!577660 () Bool)

(assert (=> b!850373 (=> (not res!577660) (not e!474370))))

(assert (=> b!850373 (= res!577660 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23718 _keys!868))))))

(declare-fun b!850374 () Bool)

(declare-fun call!37882 () ListLongMap!9411)

(declare-fun +!2123 (ListLongMap!9411 tuple2!10642) ListLongMap!9411)

(assert (=> b!850374 (= e!474371 (= call!37882 (+!2123 call!37883 (tuple2!10643 k!854 v!557))))))

(declare-fun mapIsEmpty!25817 () Bool)

(declare-fun mapRes!25817 () Bool)

(assert (=> mapIsEmpty!25817 mapRes!25817))

(declare-fun b!850375 () Bool)

(declare-fun e!474373 () Bool)

(assert (=> b!850375 (= e!474373 tp_is_empty!16145)))

(declare-fun mapNonEmpty!25817 () Bool)

(declare-fun tp!49530 () Bool)

(assert (=> mapNonEmpty!25817 (= mapRes!25817 (and tp!49530 e!474373))))

(declare-fun mapValue!25817 () ValueCell!7633)

(declare-fun mapKey!25817 () (_ BitVec 32))

(declare-fun mapRest!25817 () (Array (_ BitVec 32) ValueCell!7633))

(assert (=> mapNonEmpty!25817 (= (arr!23279 _values!688) (store mapRest!25817 mapKey!25817 mapValue!25817))))

(declare-fun b!850376 () Bool)

(assert (=> b!850376 (= e!474371 (= call!37882 call!37883))))

(declare-fun b!850377 () Bool)

(assert (=> b!850377 (= e!474370 e!474374)))

(declare-fun res!577667 () Bool)

(assert (=> b!850377 (=> (not res!577667) (not e!474374))))

(assert (=> b!850377 (= res!577667 (= from!1053 i!612))))

(declare-fun lt!382782 () array!48496)

(declare-fun lt!382781 () ListLongMap!9411)

(assert (=> b!850377 (= lt!382781 (getCurrentListMapNoExtraKeys!2703 _keys!868 lt!382782 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850377 (= lt!382782 (array!48497 (store (arr!23279 _values!688) i!612 (ValueCellFull!7633 v!557)) (size!23719 _values!688)))))

(declare-fun lt!382783 () ListLongMap!9411)

(assert (=> b!850377 (= lt!382783 (getCurrentListMapNoExtraKeys!2703 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850378 () Bool)

(declare-fun res!577666 () Bool)

(assert (=> b!850378 (=> (not res!577666) (not e!474370))))

(assert (=> b!850378 (= res!577666 (and (= (select (arr!23278 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!850379 () Bool)

(assert (=> b!850379 (= e!474369 (and e!474376 mapRes!25817))))

(declare-fun condMapEmpty!25817 () Bool)

(declare-fun mapDefault!25817 () ValueCell!7633)

