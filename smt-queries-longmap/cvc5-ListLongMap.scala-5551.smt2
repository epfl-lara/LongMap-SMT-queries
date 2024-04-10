; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73090 () Bool)

(assert start!73090)

(declare-fun b_free!14005 () Bool)

(declare-fun b_next!14005 () Bool)

(assert (=> start!73090 (= b_free!14005 (not b_next!14005))))

(declare-fun tp!49519 () Bool)

(declare-fun b_and!23169 () Bool)

(assert (=> start!73090 (= tp!49519 b_and!23169)))

(declare-fun b!850272 () Bool)

(declare-fun res!577602 () Bool)

(declare-fun e!474328 () Bool)

(assert (=> b!850272 (=> (not res!577602) (not e!474328))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48486 0))(
  ( (array!48487 (arr!23274 (Array (_ BitVec 32) (_ BitVec 64))) (size!23714 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48486)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!850272 (= res!577602 (and (= (select (arr!23274 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!850273 () Bool)

(declare-fun e!474325 () Bool)

(declare-datatypes ((V!26569 0))(
  ( (V!26570 (val!8118 Int)) )
))
(declare-datatypes ((tuple2!10638 0))(
  ( (tuple2!10639 (_1!5330 (_ BitVec 64)) (_2!5330 V!26569)) )
))
(declare-datatypes ((List!16483 0))(
  ( (Nil!16480) (Cons!16479 (h!17610 tuple2!10638) (t!22934 List!16483)) )
))
(declare-datatypes ((ListLongMap!9407 0))(
  ( (ListLongMap!9408 (toList!4719 List!16483)) )
))
(declare-fun call!37871 () ListLongMap!9407)

(declare-fun call!37870 () ListLongMap!9407)

(assert (=> b!850273 (= e!474325 (= call!37871 call!37870))))

(declare-fun b!850274 () Bool)

(declare-fun e!474322 () Bool)

(declare-fun e!474324 () Bool)

(assert (=> b!850274 (= e!474322 (not e!474324))))

(declare-fun res!577603 () Bool)

(assert (=> b!850274 (=> res!577603 e!474324)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850274 (= res!577603 (not (validKeyInArray!0 (select (arr!23274 _keys!868) from!1053))))))

(assert (=> b!850274 e!474325))

(declare-fun c!91678 () Bool)

(assert (=> b!850274 (= c!91678 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26569)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((Unit!29033 0))(
  ( (Unit!29034) )
))
(declare-fun lt!382723 () Unit!29033)

(declare-datatypes ((ValueCell!7631 0))(
  ( (ValueCellFull!7631 (v!10543 V!26569)) (EmptyCell!7631) )
))
(declare-datatypes ((array!48488 0))(
  ( (array!48489 (arr!23275 (Array (_ BitVec 32) ValueCell!7631)) (size!23715 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48488)

(declare-fun minValue!654 () V!26569)

(declare-fun zeroValue!654 () V!26569)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!360 (array!48486 array!48488 (_ BitVec 32) (_ BitVec 32) V!26569 V!26569 (_ BitVec 32) (_ BitVec 64) V!26569 (_ BitVec 32) Int) Unit!29033)

(assert (=> b!850274 (= lt!382723 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!360 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850275 () Bool)

(declare-fun res!577604 () Bool)

(assert (=> b!850275 (=> (not res!577604) (not e!474328))))

(assert (=> b!850275 (= res!577604 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23714 _keys!868))))))

(declare-fun mapNonEmpty!25811 () Bool)

(declare-fun mapRes!25811 () Bool)

(declare-fun tp!49518 () Bool)

(declare-fun e!474323 () Bool)

(assert (=> mapNonEmpty!25811 (= mapRes!25811 (and tp!49518 e!474323))))

(declare-fun mapKey!25811 () (_ BitVec 32))

(declare-fun mapValue!25811 () ValueCell!7631)

(declare-fun mapRest!25811 () (Array (_ BitVec 32) ValueCell!7631))

(assert (=> mapNonEmpty!25811 (= (arr!23275 _values!688) (store mapRest!25811 mapKey!25811 mapValue!25811))))

(declare-fun b!850276 () Bool)

(declare-fun res!577598 () Bool)

(assert (=> b!850276 (=> (not res!577598) (not e!474328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48486 (_ BitVec 32)) Bool)

(assert (=> b!850276 (= res!577598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850277 () Bool)

(declare-fun res!577599 () Bool)

(assert (=> b!850277 (=> (not res!577599) (not e!474328))))

(assert (=> b!850277 (= res!577599 (and (= (size!23715 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23714 _keys!868) (size!23715 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850278 () Bool)

(declare-fun e!474327 () Bool)

(declare-fun tp_is_empty!16141 () Bool)

(assert (=> b!850278 (= e!474327 tp_is_empty!16141)))

(declare-fun b!850279 () Bool)

(assert (=> b!850279 (= e!474324 true)))

(declare-fun lt!382714 () ListLongMap!9407)

(declare-fun lt!382720 () tuple2!10638)

(declare-fun lt!382722 () V!26569)

(declare-fun +!2121 (ListLongMap!9407 tuple2!10638) ListLongMap!9407)

(assert (=> b!850279 (= (+!2121 lt!382714 lt!382720) (+!2121 (+!2121 lt!382714 (tuple2!10639 k!854 lt!382722)) lt!382720))))

(declare-fun lt!382716 () V!26569)

(assert (=> b!850279 (= lt!382720 (tuple2!10639 k!854 lt!382716))))

(declare-fun lt!382721 () Unit!29033)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!257 (ListLongMap!9407 (_ BitVec 64) V!26569 V!26569) Unit!29033)

(assert (=> b!850279 (= lt!382721 (addSameAsAddTwiceSameKeyDiffValues!257 lt!382714 k!854 lt!382722 lt!382716))))

(declare-fun lt!382715 () V!26569)

(declare-fun get!12257 (ValueCell!7631 V!26569) V!26569)

(assert (=> b!850279 (= lt!382722 (get!12257 (select (arr!23275 _values!688) from!1053) lt!382715))))

(declare-fun lt!382717 () ListLongMap!9407)

(assert (=> b!850279 (= lt!382717 (+!2121 lt!382714 (tuple2!10639 (select (arr!23274 _keys!868) from!1053) lt!382716)))))

(assert (=> b!850279 (= lt!382716 (get!12257 (select (store (arr!23275 _values!688) i!612 (ValueCellFull!7631 v!557)) from!1053) lt!382715))))

(declare-fun dynLambda!1011 (Int (_ BitVec 64)) V!26569)

(assert (=> b!850279 (= lt!382715 (dynLambda!1011 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!382718 () array!48488)

(declare-fun getCurrentListMapNoExtraKeys!2701 (array!48486 array!48488 (_ BitVec 32) (_ BitVec 32) V!26569 V!26569 (_ BitVec 32) Int) ListLongMap!9407)

(assert (=> b!850279 (= lt!382714 (getCurrentListMapNoExtraKeys!2701 _keys!868 lt!382718 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850281 () Bool)

(assert (=> b!850281 (= e!474325 (= call!37871 (+!2121 call!37870 (tuple2!10639 k!854 v!557))))))

(declare-fun mapIsEmpty!25811 () Bool)

(assert (=> mapIsEmpty!25811 mapRes!25811))

(declare-fun b!850282 () Bool)

(declare-fun res!577606 () Bool)

(assert (=> b!850282 (=> (not res!577606) (not e!474328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850282 (= res!577606 (validMask!0 mask!1196))))

(declare-fun b!850280 () Bool)

(assert (=> b!850280 (= e!474323 tp_is_empty!16141)))

(declare-fun res!577607 () Bool)

(assert (=> start!73090 (=> (not res!577607) (not e!474328))))

(assert (=> start!73090 (= res!577607 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23714 _keys!868))))))

(assert (=> start!73090 e!474328))

(assert (=> start!73090 tp_is_empty!16141))

(assert (=> start!73090 true))

(assert (=> start!73090 tp!49519))

(declare-fun array_inv!18470 (array!48486) Bool)

(assert (=> start!73090 (array_inv!18470 _keys!868)))

(declare-fun e!474326 () Bool)

(declare-fun array_inv!18471 (array!48488) Bool)

(assert (=> start!73090 (and (array_inv!18471 _values!688) e!474326)))

(declare-fun bm!37867 () Bool)

(assert (=> bm!37867 (= call!37870 (getCurrentListMapNoExtraKeys!2701 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850283 () Bool)

(assert (=> b!850283 (= e!474326 (and e!474327 mapRes!25811))))

(declare-fun condMapEmpty!25811 () Bool)

(declare-fun mapDefault!25811 () ValueCell!7631)

