; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73154 () Bool)

(assert start!73154)

(declare-fun b_free!14069 () Bool)

(declare-fun b_next!14069 () Bool)

(assert (=> start!73154 (= b_free!14069 (not b_next!14069))))

(declare-fun tp!49710 () Bool)

(declare-fun b_and!23297 () Bool)

(assert (=> start!73154 (= tp!49710 b_and!23297)))

(declare-fun res!578567 () Bool)

(declare-fun e!475096 () Bool)

(assert (=> start!73154 (=> (not res!578567) (not e!475096))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48608 0))(
  ( (array!48609 (arr!23335 (Array (_ BitVec 32) (_ BitVec 64))) (size!23775 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48608)

(assert (=> start!73154 (= res!578567 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23775 _keys!868))))))

(assert (=> start!73154 e!475096))

(declare-fun tp_is_empty!16205 () Bool)

(assert (=> start!73154 tp_is_empty!16205))

(assert (=> start!73154 true))

(assert (=> start!73154 tp!49710))

(declare-fun array_inv!18510 (array!48608) Bool)

(assert (=> start!73154 (array_inv!18510 _keys!868)))

(declare-datatypes ((V!26653 0))(
  ( (V!26654 (val!8150 Int)) )
))
(declare-datatypes ((ValueCell!7663 0))(
  ( (ValueCellFull!7663 (v!10575 V!26653)) (EmptyCell!7663) )
))
(declare-datatypes ((array!48610 0))(
  ( (array!48611 (arr!23336 (Array (_ BitVec 32) ValueCell!7663)) (size!23776 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48610)

(declare-fun e!475095 () Bool)

(declare-fun array_inv!18511 (array!48610) Bool)

(assert (=> start!73154 (and (array_inv!18511 _values!688) e!475095)))

(declare-fun b!851776 () Bool)

(declare-fun res!578561 () Bool)

(assert (=> b!851776 (=> (not res!578561) (not e!475096))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48608 (_ BitVec 32)) Bool)

(assert (=> b!851776 (= res!578561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851777 () Bool)

(declare-fun res!578564 () Bool)

(assert (=> b!851777 (=> (not res!578564) (not e!475096))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!851777 (= res!578564 (and (= (size!23776 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23775 _keys!868) (size!23776 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851778 () Bool)

(declare-fun e!475094 () Bool)

(assert (=> b!851778 (= e!475094 tp_is_empty!16205)))

(declare-fun b!851779 () Bool)

(declare-fun res!578565 () Bool)

(assert (=> b!851779 (=> (not res!578565) (not e!475096))))

(declare-datatypes ((List!16530 0))(
  ( (Nil!16527) (Cons!16526 (h!17657 (_ BitVec 64)) (t!23045 List!16530)) )
))
(declare-fun arrayNoDuplicates!0 (array!48608 (_ BitVec 32) List!16530) Bool)

(assert (=> b!851779 (= res!578565 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16527))))

(declare-fun v!557 () V!26653)

(declare-datatypes ((tuple2!10694 0))(
  ( (tuple2!10695 (_1!5358 (_ BitVec 64)) (_2!5358 V!26653)) )
))
(declare-datatypes ((List!16531 0))(
  ( (Nil!16528) (Cons!16527 (h!17658 tuple2!10694) (t!23046 List!16531)) )
))
(declare-datatypes ((ListLongMap!9463 0))(
  ( (ListLongMap!9464 (toList!4747 List!16531)) )
))
(declare-fun call!38063 () ListLongMap!9463)

(declare-fun call!38062 () ListLongMap!9463)

(declare-fun b!851780 () Bool)

(declare-fun e!475091 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2146 (ListLongMap!9463 tuple2!10694) ListLongMap!9463)

(assert (=> b!851780 (= e!475091 (= call!38062 (+!2146 call!38063 (tuple2!10695 k!854 v!557))))))

(declare-fun lt!383683 () array!48610)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!38059 () Bool)

(declare-fun minValue!654 () V!26653)

(declare-fun zeroValue!654 () V!26653)

(declare-fun getCurrentListMapNoExtraKeys!2729 (array!48608 array!48610 (_ BitVec 32) (_ BitVec 32) V!26653 V!26653 (_ BitVec 32) Int) ListLongMap!9463)

(assert (=> bm!38059 (= call!38062 (getCurrentListMapNoExtraKeys!2729 _keys!868 lt!383683 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38060 () Bool)

(assert (=> bm!38060 (= call!38063 (getCurrentListMapNoExtraKeys!2729 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851781 () Bool)

(assert (=> b!851781 (= e!475091 (= call!38062 call!38063))))

(declare-fun b!851782 () Bool)

(declare-fun res!578559 () Bool)

(assert (=> b!851782 (=> (not res!578559) (not e!475096))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851782 (= res!578559 (and (= (select (arr!23335 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!851783 () Bool)

(declare-fun e!475090 () Bool)

(declare-fun e!475092 () Bool)

(assert (=> b!851783 (= e!475090 (not e!475092))))

(declare-fun res!578563 () Bool)

(assert (=> b!851783 (=> res!578563 e!475092)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851783 (= res!578563 (not (validKeyInArray!0 (select (arr!23335 _keys!868) from!1053))))))

(assert (=> b!851783 e!475091))

(declare-fun c!91774 () Bool)

(assert (=> b!851783 (= c!91774 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29079 0))(
  ( (Unit!29080) )
))
(declare-fun lt!383678 () Unit!29079)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!381 (array!48608 array!48610 (_ BitVec 32) (_ BitVec 32) V!26653 V!26653 (_ BitVec 32) (_ BitVec 64) V!26653 (_ BitVec 32) Int) Unit!29079)

(assert (=> b!851783 (= lt!383678 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!381 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851784 () Bool)

(assert (=> b!851784 (= e!475096 e!475090)))

(declare-fun res!578560 () Bool)

(assert (=> b!851784 (=> (not res!578560) (not e!475090))))

(assert (=> b!851784 (= res!578560 (= from!1053 i!612))))

(declare-fun lt!383677 () ListLongMap!9463)

(assert (=> b!851784 (= lt!383677 (getCurrentListMapNoExtraKeys!2729 _keys!868 lt!383683 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851784 (= lt!383683 (array!48611 (store (arr!23336 _values!688) i!612 (ValueCellFull!7663 v!557)) (size!23776 _values!688)))))

(declare-fun lt!383675 () ListLongMap!9463)

(assert (=> b!851784 (= lt!383675 (getCurrentListMapNoExtraKeys!2729 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851785 () Bool)

(assert (=> b!851785 (= e!475092 true)))

(declare-fun lt!383676 () V!26653)

(declare-fun lt!383680 () ListLongMap!9463)

(declare-fun lt!383682 () tuple2!10694)

(assert (=> b!851785 (= (+!2146 lt!383680 lt!383682) (+!2146 (+!2146 lt!383680 (tuple2!10695 k!854 lt!383676)) lt!383682))))

(declare-fun lt!383674 () V!26653)

(assert (=> b!851785 (= lt!383682 (tuple2!10695 k!854 lt!383674))))

(declare-fun lt!383679 () Unit!29079)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!277 (ListLongMap!9463 (_ BitVec 64) V!26653 V!26653) Unit!29079)

(assert (=> b!851785 (= lt!383679 (addSameAsAddTwiceSameKeyDiffValues!277 lt!383680 k!854 lt!383676 lt!383674))))

(declare-fun lt!383681 () V!26653)

(declare-fun get!12297 (ValueCell!7663 V!26653) V!26653)

(assert (=> b!851785 (= lt!383676 (get!12297 (select (arr!23336 _values!688) from!1053) lt!383681))))

(assert (=> b!851785 (= lt!383677 (+!2146 lt!383680 (tuple2!10695 (select (arr!23335 _keys!868) from!1053) lt!383674)))))

(assert (=> b!851785 (= lt!383674 (get!12297 (select (store (arr!23336 _values!688) i!612 (ValueCellFull!7663 v!557)) from!1053) lt!383681))))

(declare-fun dynLambda!1031 (Int (_ BitVec 64)) V!26653)

(assert (=> b!851785 (= lt!383681 (dynLambda!1031 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851785 (= lt!383680 (getCurrentListMapNoExtraKeys!2729 _keys!868 lt!383683 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851786 () Bool)

(declare-fun res!578562 () Bool)

(assert (=> b!851786 (=> (not res!578562) (not e!475096))))

(assert (=> b!851786 (= res!578562 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23775 _keys!868))))))

(declare-fun b!851787 () Bool)

(declare-fun mapRes!25907 () Bool)

(assert (=> b!851787 (= e!475095 (and e!475094 mapRes!25907))))

(declare-fun condMapEmpty!25907 () Bool)

(declare-fun mapDefault!25907 () ValueCell!7663)

