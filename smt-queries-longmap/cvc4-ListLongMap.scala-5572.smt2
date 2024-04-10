; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73220 () Bool)

(assert start!73220)

(declare-fun b_free!14135 () Bool)

(declare-fun b_next!14135 () Bool)

(assert (=> start!73220 (= b_free!14135 (not b_next!14135))))

(declare-fun tp!49908 () Bool)

(declare-fun b_and!23429 () Bool)

(assert (=> start!73220 (= tp!49908 b_and!23429)))

(declare-fun b!853327 () Bool)

(declare-fun res!579552 () Bool)

(declare-fun e!475885 () Bool)

(assert (=> b!853327 (=> (not res!579552) (not e!475885))))

(declare-datatypes ((array!48740 0))(
  ( (array!48741 (arr!23401 (Array (_ BitVec 32) (_ BitVec 64))) (size!23841 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48740)

(declare-datatypes ((List!16582 0))(
  ( (Nil!16579) (Cons!16578 (h!17709 (_ BitVec 64)) (t!23163 List!16582)) )
))
(declare-fun arrayNoDuplicates!0 (array!48740 (_ BitVec 32) List!16582) Bool)

(assert (=> b!853327 (= res!579552 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16579))))

(declare-fun b!853328 () Bool)

(declare-datatypes ((V!26741 0))(
  ( (V!26742 (val!8183 Int)) )
))
(declare-datatypes ((tuple2!10756 0))(
  ( (tuple2!10757 (_1!5389 (_ BitVec 64)) (_2!5389 V!26741)) )
))
(declare-datatypes ((List!16583 0))(
  ( (Nil!16580) (Cons!16579 (h!17710 tuple2!10756) (t!23164 List!16583)) )
))
(declare-datatypes ((ListLongMap!9525 0))(
  ( (ListLongMap!9526 (toList!4778 List!16583)) )
))
(declare-fun call!38261 () ListLongMap!9525)

(declare-fun v!557 () V!26741)

(declare-fun e!475886 () Bool)

(declare-fun call!38260 () ListLongMap!9525)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2170 (ListLongMap!9525 tuple2!10756) ListLongMap!9525)

(assert (=> b!853328 (= e!475886 (= call!38261 (+!2170 call!38260 (tuple2!10757 k!854 v!557))))))

(declare-fun b!853329 () Bool)

(declare-fun e!475882 () Bool)

(declare-fun tp_is_empty!16271 () Bool)

(assert (=> b!853329 (= e!475882 tp_is_empty!16271)))

(declare-fun b!853330 () Bool)

(declare-fun res!579555 () Bool)

(assert (=> b!853330 (=> (not res!579555) (not e!475885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853330 (= res!579555 (validKeyInArray!0 k!854))))

(declare-fun b!853331 () Bool)

(declare-fun res!579551 () Bool)

(assert (=> b!853331 (=> (not res!579551) (not e!475885))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853331 (= res!579551 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23841 _keys!868))))))

(declare-fun b!853332 () Bool)

(declare-fun res!579550 () Bool)

(assert (=> b!853332 (=> (not res!579550) (not e!475885))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853332 (= res!579550 (validMask!0 mask!1196))))

(declare-fun b!853333 () Bool)

(declare-fun e!475883 () Bool)

(assert (=> b!853333 (= e!475883 true)))

(declare-fun lt!384664 () V!26741)

(declare-fun lt!384671 () ListLongMap!9525)

(declare-fun lt!384672 () tuple2!10756)

(assert (=> b!853333 (= (+!2170 lt!384671 lt!384672) (+!2170 (+!2170 lt!384671 (tuple2!10757 k!854 lt!384664)) lt!384672))))

(declare-fun lt!384669 () V!26741)

(assert (=> b!853333 (= lt!384672 (tuple2!10757 k!854 lt!384669))))

(declare-datatypes ((Unit!29123 0))(
  ( (Unit!29124) )
))
(declare-fun lt!384670 () Unit!29123)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!297 (ListLongMap!9525 (_ BitVec 64) V!26741 V!26741) Unit!29123)

(assert (=> b!853333 (= lt!384670 (addSameAsAddTwiceSameKeyDiffValues!297 lt!384671 k!854 lt!384664 lt!384669))))

(declare-datatypes ((ValueCell!7696 0))(
  ( (ValueCellFull!7696 (v!10608 V!26741)) (EmptyCell!7696) )
))
(declare-datatypes ((array!48742 0))(
  ( (array!48743 (arr!23402 (Array (_ BitVec 32) ValueCell!7696)) (size!23842 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48742)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!384673 () V!26741)

(declare-fun get!12339 (ValueCell!7696 V!26741) V!26741)

(assert (=> b!853333 (= lt!384664 (get!12339 (select (arr!23402 _values!688) from!1053) lt!384673))))

(declare-fun lt!384667 () ListLongMap!9525)

(assert (=> b!853333 (= lt!384667 (+!2170 lt!384671 (tuple2!10757 (select (arr!23401 _keys!868) from!1053) lt!384669)))))

(assert (=> b!853333 (= lt!384669 (get!12339 (select (store (arr!23402 _values!688) i!612 (ValueCellFull!7696 v!557)) from!1053) lt!384673))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1051 (Int (_ BitVec 64)) V!26741)

(assert (=> b!853333 (= lt!384673 (dynLambda!1051 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!384668 () array!48742)

(declare-fun minValue!654 () V!26741)

(declare-fun zeroValue!654 () V!26741)

(declare-fun getCurrentListMapNoExtraKeys!2759 (array!48740 array!48742 (_ BitVec 32) (_ BitVec 32) V!26741 V!26741 (_ BitVec 32) Int) ListLongMap!9525)

(assert (=> b!853333 (= lt!384671 (getCurrentListMapNoExtraKeys!2759 _keys!868 lt!384668 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38257 () Bool)

(assert (=> bm!38257 (= call!38260 (getCurrentListMapNoExtraKeys!2759 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853334 () Bool)

(assert (=> b!853334 (= e!475886 (= call!38261 call!38260))))

(declare-fun b!853335 () Bool)

(declare-fun res!579556 () Bool)

(assert (=> b!853335 (=> (not res!579556) (not e!475885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48740 (_ BitVec 32)) Bool)

(assert (=> b!853335 (= res!579556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853336 () Bool)

(declare-fun e!475884 () Bool)

(assert (=> b!853336 (= e!475884 tp_is_empty!16271)))

(declare-fun b!853337 () Bool)

(declare-fun res!579549 () Bool)

(assert (=> b!853337 (=> (not res!579549) (not e!475885))))

(assert (=> b!853337 (= res!579549 (and (= (select (arr!23401 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!579553 () Bool)

(assert (=> start!73220 (=> (not res!579553) (not e!475885))))

(assert (=> start!73220 (= res!579553 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23841 _keys!868))))))

(assert (=> start!73220 e!475885))

(assert (=> start!73220 tp_is_empty!16271))

(assert (=> start!73220 true))

(assert (=> start!73220 tp!49908))

(declare-fun array_inv!18556 (array!48740) Bool)

(assert (=> start!73220 (array_inv!18556 _keys!868)))

(declare-fun e!475888 () Bool)

(declare-fun array_inv!18557 (array!48742) Bool)

(assert (=> start!73220 (and (array_inv!18557 _values!688) e!475888)))

(declare-fun mapIsEmpty!26006 () Bool)

(declare-fun mapRes!26006 () Bool)

(assert (=> mapIsEmpty!26006 mapRes!26006))

(declare-fun b!853338 () Bool)

(declare-fun e!475881 () Bool)

(assert (=> b!853338 (= e!475885 e!475881)))

(declare-fun res!579557 () Bool)

(assert (=> b!853338 (=> (not res!579557) (not e!475881))))

(assert (=> b!853338 (= res!579557 (= from!1053 i!612))))

(assert (=> b!853338 (= lt!384667 (getCurrentListMapNoExtraKeys!2759 _keys!868 lt!384668 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853338 (= lt!384668 (array!48743 (store (arr!23402 _values!688) i!612 (ValueCellFull!7696 v!557)) (size!23842 _values!688)))))

(declare-fun lt!384666 () ListLongMap!9525)

(assert (=> b!853338 (= lt!384666 (getCurrentListMapNoExtraKeys!2759 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!38258 () Bool)

(assert (=> bm!38258 (= call!38261 (getCurrentListMapNoExtraKeys!2759 _keys!868 lt!384668 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26006 () Bool)

(declare-fun tp!49909 () Bool)

(assert (=> mapNonEmpty!26006 (= mapRes!26006 (and tp!49909 e!475882))))

(declare-fun mapKey!26006 () (_ BitVec 32))

(declare-fun mapRest!26006 () (Array (_ BitVec 32) ValueCell!7696))

(declare-fun mapValue!26006 () ValueCell!7696)

(assert (=> mapNonEmpty!26006 (= (arr!23402 _values!688) (store mapRest!26006 mapKey!26006 mapValue!26006))))

(declare-fun b!853339 () Bool)

(declare-fun res!579548 () Bool)

(assert (=> b!853339 (=> (not res!579548) (not e!475885))))

(assert (=> b!853339 (= res!579548 (and (= (size!23842 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23841 _keys!868) (size!23842 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853340 () Bool)

(assert (=> b!853340 (= e!475881 (not e!475883))))

(declare-fun res!579554 () Bool)

(assert (=> b!853340 (=> res!579554 e!475883)))

(assert (=> b!853340 (= res!579554 (not (validKeyInArray!0 (select (arr!23401 _keys!868) from!1053))))))

(assert (=> b!853340 e!475886))

(declare-fun c!91873 () Bool)

(assert (=> b!853340 (= c!91873 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384665 () Unit!29123)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!397 (array!48740 array!48742 (_ BitVec 32) (_ BitVec 32) V!26741 V!26741 (_ BitVec 32) (_ BitVec 64) V!26741 (_ BitVec 32) Int) Unit!29123)

(assert (=> b!853340 (= lt!384665 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!397 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853341 () Bool)

(assert (=> b!853341 (= e!475888 (and e!475884 mapRes!26006))))

(declare-fun condMapEmpty!26006 () Bool)

(declare-fun mapDefault!26006 () ValueCell!7696)

