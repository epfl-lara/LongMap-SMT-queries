; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73096 () Bool)

(assert start!73096)

(declare-fun b_free!14011 () Bool)

(declare-fun b_next!14011 () Bool)

(assert (=> start!73096 (= b_free!14011 (not b_next!14011))))

(declare-fun tp!49537 () Bool)

(declare-fun b_and!23181 () Bool)

(assert (=> start!73096 (= tp!49537 b_and!23181)))

(declare-fun b!850413 () Bool)

(declare-fun res!577690 () Bool)

(declare-fun e!474397 () Bool)

(assert (=> b!850413 (=> (not res!577690) (not e!474397))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48498 0))(
  ( (array!48499 (arr!23280 (Array (_ BitVec 32) (_ BitVec 64))) (size!23720 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48498)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!850413 (= res!577690 (and (= (select (arr!23280 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26577 0))(
  ( (V!26578 (val!8121 Int)) )
))
(declare-datatypes ((tuple2!10644 0))(
  ( (tuple2!10645 (_1!5333 (_ BitVec 64)) (_2!5333 V!26577)) )
))
(declare-datatypes ((List!16488 0))(
  ( (Nil!16485) (Cons!16484 (h!17615 tuple2!10644) (t!22945 List!16488)) )
))
(declare-datatypes ((ListLongMap!9413 0))(
  ( (ListLongMap!9414 (toList!4722 List!16488)) )
))
(declare-fun call!37888 () ListLongMap!9413)

(declare-datatypes ((ValueCell!7634 0))(
  ( (ValueCellFull!7634 (v!10546 V!26577)) (EmptyCell!7634) )
))
(declare-datatypes ((array!48500 0))(
  ( (array!48501 (arr!23281 (Array (_ BitVec 32) ValueCell!7634)) (size!23721 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48500)

(declare-fun minValue!654 () V!26577)

(declare-fun zeroValue!654 () V!26577)

(declare-fun bm!37885 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2704 (array!48498 array!48500 (_ BitVec 32) (_ BitVec 32) V!26577 V!26577 (_ BitVec 32) Int) ListLongMap!9413)

(assert (=> bm!37885 (= call!37888 (getCurrentListMapNoExtraKeys!2704 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!577697 () Bool)

(assert (=> start!73096 (=> (not res!577697) (not e!474397))))

(assert (=> start!73096 (= res!577697 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23720 _keys!868))))))

(assert (=> start!73096 e!474397))

(declare-fun tp_is_empty!16147 () Bool)

(assert (=> start!73096 tp_is_empty!16147))

(assert (=> start!73096 true))

(assert (=> start!73096 tp!49537))

(declare-fun array_inv!18476 (array!48498) Bool)

(assert (=> start!73096 (array_inv!18476 _keys!868)))

(declare-fun e!474400 () Bool)

(declare-fun array_inv!18477 (array!48500) Bool)

(assert (=> start!73096 (and (array_inv!18477 _values!688) e!474400)))

(declare-fun b!850414 () Bool)

(declare-fun e!474398 () Bool)

(declare-fun e!474396 () Bool)

(assert (=> b!850414 (= e!474398 (not e!474396))))

(declare-fun res!577688 () Bool)

(assert (=> b!850414 (=> res!577688 e!474396)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850414 (= res!577688 (not (validKeyInArray!0 (select (arr!23280 _keys!868) from!1053))))))

(declare-fun e!474399 () Bool)

(assert (=> b!850414 e!474399))

(declare-fun c!91687 () Bool)

(assert (=> b!850414 (= c!91687 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26577)

(declare-datatypes ((Unit!29039 0))(
  ( (Unit!29040) )
))
(declare-fun lt!382807 () Unit!29039)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!363 (array!48498 array!48500 (_ BitVec 32) (_ BitVec 32) V!26577 V!26577 (_ BitVec 32) (_ BitVec 64) V!26577 (_ BitVec 32) Int) Unit!29039)

(assert (=> b!850414 (= lt!382807 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!363 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850415 () Bool)

(assert (=> b!850415 (= e!474396 true)))

(declare-fun lt!382810 () ListLongMap!9413)

(declare-fun lt!382812 () tuple2!10644)

(declare-fun lt!382813 () V!26577)

(declare-fun +!2124 (ListLongMap!9413 tuple2!10644) ListLongMap!9413)

(assert (=> b!850415 (= (+!2124 lt!382810 lt!382812) (+!2124 (+!2124 lt!382810 (tuple2!10645 k!854 lt!382813)) lt!382812))))

(declare-fun lt!382806 () V!26577)

(assert (=> b!850415 (= lt!382812 (tuple2!10645 k!854 lt!382806))))

(declare-fun lt!382808 () Unit!29039)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!259 (ListLongMap!9413 (_ BitVec 64) V!26577 V!26577) Unit!29039)

(assert (=> b!850415 (= lt!382808 (addSameAsAddTwiceSameKeyDiffValues!259 lt!382810 k!854 lt!382813 lt!382806))))

(declare-fun lt!382804 () V!26577)

(declare-fun get!12261 (ValueCell!7634 V!26577) V!26577)

(assert (=> b!850415 (= lt!382813 (get!12261 (select (arr!23281 _values!688) from!1053) lt!382804))))

(declare-fun lt!382811 () ListLongMap!9413)

(assert (=> b!850415 (= lt!382811 (+!2124 lt!382810 (tuple2!10645 (select (arr!23280 _keys!868) from!1053) lt!382806)))))

(assert (=> b!850415 (= lt!382806 (get!12261 (select (store (arr!23281 _values!688) i!612 (ValueCellFull!7634 v!557)) from!1053) lt!382804))))

(declare-fun dynLambda!1013 (Int (_ BitVec 64)) V!26577)

(assert (=> b!850415 (= lt!382804 (dynLambda!1013 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!382809 () array!48500)

(assert (=> b!850415 (= lt!382810 (getCurrentListMapNoExtraKeys!2704 _keys!868 lt!382809 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850416 () Bool)

(declare-fun res!577693 () Bool)

(assert (=> b!850416 (=> (not res!577693) (not e!474397))))

(assert (=> b!850416 (= res!577693 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23720 _keys!868))))))

(declare-fun b!850417 () Bool)

(assert (=> b!850417 (= e!474397 e!474398)))

(declare-fun res!577695 () Bool)

(assert (=> b!850417 (=> (not res!577695) (not e!474398))))

(assert (=> b!850417 (= res!577695 (= from!1053 i!612))))

(assert (=> b!850417 (= lt!382811 (getCurrentListMapNoExtraKeys!2704 _keys!868 lt!382809 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850417 (= lt!382809 (array!48501 (store (arr!23281 _values!688) i!612 (ValueCellFull!7634 v!557)) (size!23721 _values!688)))))

(declare-fun lt!382805 () ListLongMap!9413)

(assert (=> b!850417 (= lt!382805 (getCurrentListMapNoExtraKeys!2704 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850418 () Bool)

(declare-fun res!577689 () Bool)

(assert (=> b!850418 (=> (not res!577689) (not e!474397))))

(assert (=> b!850418 (= res!577689 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!25820 () Bool)

(declare-fun mapRes!25820 () Bool)

(declare-fun tp!49536 () Bool)

(declare-fun e!474393 () Bool)

(assert (=> mapNonEmpty!25820 (= mapRes!25820 (and tp!49536 e!474393))))

(declare-fun mapKey!25820 () (_ BitVec 32))

(declare-fun mapValue!25820 () ValueCell!7634)

(declare-fun mapRest!25820 () (Array (_ BitVec 32) ValueCell!7634))

(assert (=> mapNonEmpty!25820 (= (arr!23281 _values!688) (store mapRest!25820 mapKey!25820 mapValue!25820))))

(declare-fun mapIsEmpty!25820 () Bool)

(assert (=> mapIsEmpty!25820 mapRes!25820))

(declare-fun b!850419 () Bool)

(declare-fun res!577691 () Bool)

(assert (=> b!850419 (=> (not res!577691) (not e!474397))))

(declare-datatypes ((List!16489 0))(
  ( (Nil!16486) (Cons!16485 (h!17616 (_ BitVec 64)) (t!22946 List!16489)) )
))
(declare-fun arrayNoDuplicates!0 (array!48498 (_ BitVec 32) List!16489) Bool)

(assert (=> b!850419 (= res!577691 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16486))))

(declare-fun b!850420 () Bool)

(declare-fun call!37889 () ListLongMap!9413)

(assert (=> b!850420 (= e!474399 (= call!37889 call!37888))))

(declare-fun b!850421 () Bool)

(assert (=> b!850421 (= e!474393 tp_is_empty!16147)))

(declare-fun b!850422 () Bool)

(declare-fun e!474395 () Bool)

(assert (=> b!850422 (= e!474400 (and e!474395 mapRes!25820))))

(declare-fun condMapEmpty!25820 () Bool)

(declare-fun mapDefault!25820 () ValueCell!7634)

