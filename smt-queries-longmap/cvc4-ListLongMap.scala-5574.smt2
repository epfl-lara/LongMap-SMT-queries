; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73232 () Bool)

(assert start!73232)

(declare-fun b_free!14147 () Bool)

(declare-fun b_next!14147 () Bool)

(assert (=> start!73232 (= b_free!14147 (not b_next!14147))))

(declare-fun tp!49945 () Bool)

(declare-fun b_and!23453 () Bool)

(assert (=> start!73232 (= tp!49945 b_and!23453)))

(declare-fun b!853609 () Bool)

(declare-fun res!579730 () Bool)

(declare-fun e!476030 () Bool)

(assert (=> b!853609 (=> (not res!579730) (not e!476030))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853609 (= res!579730 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!26024 () Bool)

(declare-fun mapRes!26024 () Bool)

(declare-fun tp!49944 () Bool)

(declare-fun e!476025 () Bool)

(assert (=> mapNonEmpty!26024 (= mapRes!26024 (and tp!49944 e!476025))))

(declare-datatypes ((V!26757 0))(
  ( (V!26758 (val!8189 Int)) )
))
(declare-datatypes ((ValueCell!7702 0))(
  ( (ValueCellFull!7702 (v!10614 V!26757)) (EmptyCell!7702) )
))
(declare-fun mapValue!26024 () ValueCell!7702)

(declare-fun mapRest!26024 () (Array (_ BitVec 32) ValueCell!7702))

(declare-datatypes ((array!48764 0))(
  ( (array!48765 (arr!23413 (Array (_ BitVec 32) ValueCell!7702)) (size!23853 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48764)

(declare-fun mapKey!26024 () (_ BitVec 32))

(assert (=> mapNonEmpty!26024 (= (arr!23413 _values!688) (store mapRest!26024 mapKey!26024 mapValue!26024))))

(declare-fun b!853610 () Bool)

(declare-fun res!579735 () Bool)

(assert (=> b!853610 (=> (not res!579735) (not e!476030))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48766 0))(
  ( (array!48767 (arr!23414 (Array (_ BitVec 32) (_ BitVec 64))) (size!23854 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48766)

(assert (=> b!853610 (= res!579735 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23854 _keys!868))))))

(declare-fun b!853611 () Bool)

(declare-fun res!579737 () Bool)

(assert (=> b!853611 (=> (not res!579737) (not e!476030))))

(declare-datatypes ((List!16592 0))(
  ( (Nil!16589) (Cons!16588 (h!17719 (_ BitVec 64)) (t!23185 List!16592)) )
))
(declare-fun arrayNoDuplicates!0 (array!48766 (_ BitVec 32) List!16592) Bool)

(assert (=> b!853611 (= res!579737 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16589))))

(declare-fun res!579732 () Bool)

(assert (=> start!73232 (=> (not res!579732) (not e!476030))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73232 (= res!579732 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23854 _keys!868))))))

(assert (=> start!73232 e!476030))

(declare-fun tp_is_empty!16283 () Bool)

(assert (=> start!73232 tp_is_empty!16283))

(assert (=> start!73232 true))

(assert (=> start!73232 tp!49945))

(declare-fun array_inv!18564 (array!48766) Bool)

(assert (=> start!73232 (array_inv!18564 _keys!868)))

(declare-fun e!476031 () Bool)

(declare-fun array_inv!18565 (array!48764) Bool)

(assert (=> start!73232 (and (array_inv!18565 _values!688) e!476031)))

(declare-fun lt!384852 () array!48764)

(declare-datatypes ((tuple2!10768 0))(
  ( (tuple2!10769 (_1!5395 (_ BitVec 64)) (_2!5395 V!26757)) )
))
(declare-datatypes ((List!16593 0))(
  ( (Nil!16590) (Cons!16589 (h!17720 tuple2!10768) (t!23186 List!16593)) )
))
(declare-datatypes ((ListLongMap!9537 0))(
  ( (ListLongMap!9538 (toList!4784 List!16593)) )
))
(declare-fun call!38297 () ListLongMap!9537)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38293 () Bool)

(declare-fun c!91891 () Bool)

(declare-fun minValue!654 () V!26757)

(declare-fun zeroValue!654 () V!26757)

(declare-fun getCurrentListMapNoExtraKeys!2765 (array!48766 array!48764 (_ BitVec 32) (_ BitVec 32) V!26757 V!26757 (_ BitVec 32) Int) ListLongMap!9537)

(assert (=> bm!38293 (= call!38297 (getCurrentListMapNoExtraKeys!2765 _keys!868 (ite c!91891 _values!688 lt!384852) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853612 () Bool)

(declare-fun e!476028 () Bool)

(assert (=> b!853612 (= e!476028 tp_is_empty!16283)))

(declare-fun mapIsEmpty!26024 () Bool)

(assert (=> mapIsEmpty!26024 mapRes!26024))

(declare-fun b!853613 () Bool)

(assert (=> b!853613 (= e!476025 tp_is_empty!16283)))

(declare-fun b!853614 () Bool)

(declare-fun res!579733 () Bool)

(assert (=> b!853614 (=> (not res!579733) (not e!476030))))

(assert (=> b!853614 (= res!579733 (and (= (size!23853 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23854 _keys!868) (size!23853 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853615 () Bool)

(declare-fun e!476027 () Bool)

(assert (=> b!853615 (= e!476027 true)))

(declare-fun lt!384847 () ListLongMap!9537)

(declare-fun lt!384853 () V!26757)

(declare-fun lt!384844 () tuple2!10768)

(declare-fun +!2176 (ListLongMap!9537 tuple2!10768) ListLongMap!9537)

(assert (=> b!853615 (= (+!2176 lt!384847 lt!384844) (+!2176 (+!2176 lt!384847 (tuple2!10769 k!854 lt!384853)) lt!384844))))

(declare-fun lt!384845 () V!26757)

(assert (=> b!853615 (= lt!384844 (tuple2!10769 k!854 lt!384845))))

(declare-datatypes ((Unit!29135 0))(
  ( (Unit!29136) )
))
(declare-fun lt!384846 () Unit!29135)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!303 (ListLongMap!9537 (_ BitVec 64) V!26757 V!26757) Unit!29135)

(assert (=> b!853615 (= lt!384846 (addSameAsAddTwiceSameKeyDiffValues!303 lt!384847 k!854 lt!384853 lt!384845))))

(declare-fun lt!384849 () V!26757)

(declare-fun get!12349 (ValueCell!7702 V!26757) V!26757)

(assert (=> b!853615 (= lt!384853 (get!12349 (select (arr!23413 _values!688) from!1053) lt!384849))))

(declare-fun lt!384851 () ListLongMap!9537)

(assert (=> b!853615 (= lt!384851 (+!2176 lt!384847 (tuple2!10769 (select (arr!23414 _keys!868) from!1053) lt!384845)))))

(declare-fun v!557 () V!26757)

(assert (=> b!853615 (= lt!384845 (get!12349 (select (store (arr!23413 _values!688) i!612 (ValueCellFull!7702 v!557)) from!1053) lt!384849))))

(declare-fun dynLambda!1057 (Int (_ BitVec 64)) V!26757)

(assert (=> b!853615 (= lt!384849 (dynLambda!1057 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853615 (= lt!384847 (getCurrentListMapNoExtraKeys!2765 _keys!868 lt!384852 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853616 () Bool)

(declare-fun e!476032 () Bool)

(assert (=> b!853616 (= e!476030 e!476032)))

(declare-fun res!579736 () Bool)

(assert (=> b!853616 (=> (not res!579736) (not e!476032))))

(assert (=> b!853616 (= res!579736 (= from!1053 i!612))))

(assert (=> b!853616 (= lt!384851 (getCurrentListMapNoExtraKeys!2765 _keys!868 lt!384852 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853616 (= lt!384852 (array!48765 (store (arr!23413 _values!688) i!612 (ValueCellFull!7702 v!557)) (size!23853 _values!688)))))

(declare-fun lt!384850 () ListLongMap!9537)

(assert (=> b!853616 (= lt!384850 (getCurrentListMapNoExtraKeys!2765 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun call!38296 () ListLongMap!9537)

(declare-fun bm!38294 () Bool)

(assert (=> bm!38294 (= call!38296 (getCurrentListMapNoExtraKeys!2765 _keys!868 (ite c!91891 lt!384852 _values!688) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853617 () Bool)

(assert (=> b!853617 (= e!476031 (and e!476028 mapRes!26024))))

(declare-fun condMapEmpty!26024 () Bool)

(declare-fun mapDefault!26024 () ValueCell!7702)

