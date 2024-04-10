; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73204 () Bool)

(assert start!73204)

(declare-fun b_free!14119 () Bool)

(declare-fun b_next!14119 () Bool)

(assert (=> start!73204 (= b_free!14119 (not b_next!14119))))

(declare-fun tp!49861 () Bool)

(declare-fun b_and!23397 () Bool)

(assert (=> start!73204 (= tp!49861 b_and!23397)))

(declare-fun res!579315 () Bool)

(declare-fun e!475695 () Bool)

(assert (=> start!73204 (=> (not res!579315) (not e!475695))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48708 0))(
  ( (array!48709 (arr!23385 (Array (_ BitVec 32) (_ BitVec 64))) (size!23825 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48708)

(assert (=> start!73204 (= res!579315 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23825 _keys!868))))))

(assert (=> start!73204 e!475695))

(declare-fun tp_is_empty!16255 () Bool)

(assert (=> start!73204 tp_is_empty!16255))

(assert (=> start!73204 true))

(assert (=> start!73204 tp!49861))

(declare-fun array_inv!18542 (array!48708) Bool)

(assert (=> start!73204 (array_inv!18542 _keys!868)))

(declare-datatypes ((V!26721 0))(
  ( (V!26722 (val!8175 Int)) )
))
(declare-datatypes ((ValueCell!7688 0))(
  ( (ValueCellFull!7688 (v!10600 V!26721)) (EmptyCell!7688) )
))
(declare-datatypes ((array!48710 0))(
  ( (array!48711 (arr!23386 (Array (_ BitVec 32) ValueCell!7688)) (size!23826 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48710)

(declare-fun e!475693 () Bool)

(declare-fun array_inv!18543 (array!48710) Bool)

(assert (=> start!73204 (and (array_inv!18543 _values!688) e!475693)))

(declare-datatypes ((tuple2!10740 0))(
  ( (tuple2!10741 (_1!5381 (_ BitVec 64)) (_2!5381 V!26721)) )
))
(declare-datatypes ((List!16569 0))(
  ( (Nil!16566) (Cons!16565 (h!17696 tuple2!10740) (t!23134 List!16569)) )
))
(declare-datatypes ((ListLongMap!9509 0))(
  ( (ListLongMap!9510 (toList!4770 List!16569)) )
))
(declare-fun call!38212 () ListLongMap!9509)

(declare-fun bm!38209 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!384425 () array!48710)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26721)

(declare-fun zeroValue!654 () V!26721)

(declare-fun getCurrentListMapNoExtraKeys!2751 (array!48708 array!48710 (_ BitVec 32) (_ BitVec 32) V!26721 V!26721 (_ BitVec 32) Int) ListLongMap!9509)

(assert (=> bm!38209 (= call!38212 (getCurrentListMapNoExtraKeys!2751 _keys!868 lt!384425 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!26721)

(declare-fun e!475696 () Bool)

(declare-fun b!852951 () Bool)

(declare-fun call!38213 () ListLongMap!9509)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2164 (ListLongMap!9509 tuple2!10740) ListLongMap!9509)

(assert (=> b!852951 (= e!475696 (= call!38212 (+!2164 call!38213 (tuple2!10741 k!854 v!557))))))

(declare-fun mapNonEmpty!25982 () Bool)

(declare-fun mapRes!25982 () Bool)

(declare-fun tp!49860 () Bool)

(declare-fun e!475692 () Bool)

(assert (=> mapNonEmpty!25982 (= mapRes!25982 (and tp!49860 e!475692))))

(declare-fun mapValue!25982 () ValueCell!7688)

(declare-fun mapRest!25982 () (Array (_ BitVec 32) ValueCell!7688))

(declare-fun mapKey!25982 () (_ BitVec 32))

(assert (=> mapNonEmpty!25982 (= (arr!23386 _values!688) (store mapRest!25982 mapKey!25982 mapValue!25982))))

(declare-fun b!852952 () Bool)

(declare-fun res!579310 () Bool)

(assert (=> b!852952 (=> (not res!579310) (not e!475695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852952 (= res!579310 (validMask!0 mask!1196))))

(declare-fun b!852953 () Bool)

(declare-fun e!475694 () Bool)

(assert (=> b!852953 (= e!475694 tp_is_empty!16255)))

(declare-fun b!852954 () Bool)

(assert (=> b!852954 (= e!475692 tp_is_empty!16255)))

(declare-fun b!852955 () Bool)

(declare-fun res!579316 () Bool)

(assert (=> b!852955 (=> (not res!579316) (not e!475695))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852955 (= res!579316 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23825 _keys!868))))))

(declare-fun bm!38210 () Bool)

(assert (=> bm!38210 (= call!38213 (getCurrentListMapNoExtraKeys!2751 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852956 () Bool)

(declare-fun res!579312 () Bool)

(assert (=> b!852956 (=> (not res!579312) (not e!475695))))

(assert (=> b!852956 (= res!579312 (and (= (size!23826 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23825 _keys!868) (size!23826 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852957 () Bool)

(declare-fun e!475690 () Bool)

(assert (=> b!852957 (= e!475695 e!475690)))

(declare-fun res!579317 () Bool)

(assert (=> b!852957 (=> (not res!579317) (not e!475690))))

(assert (=> b!852957 (= res!579317 (= from!1053 i!612))))

(declare-fun lt!384432 () ListLongMap!9509)

(assert (=> b!852957 (= lt!384432 (getCurrentListMapNoExtraKeys!2751 _keys!868 lt!384425 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852957 (= lt!384425 (array!48711 (store (arr!23386 _values!688) i!612 (ValueCellFull!7688 v!557)) (size!23826 _values!688)))))

(declare-fun lt!384427 () ListLongMap!9509)

(assert (=> b!852957 (= lt!384427 (getCurrentListMapNoExtraKeys!2751 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852958 () Bool)

(assert (=> b!852958 (= e!475696 (= call!38212 call!38213))))

(declare-fun b!852959 () Bool)

(declare-fun e!475689 () Bool)

(assert (=> b!852959 (= e!475689 true)))

(declare-fun lt!384426 () ListLongMap!9509)

(declare-fun lt!384431 () V!26721)

(declare-fun lt!384428 () tuple2!10740)

(assert (=> b!852959 (= (+!2164 lt!384426 lt!384428) (+!2164 (+!2164 lt!384426 (tuple2!10741 k!854 lt!384431)) lt!384428))))

(declare-fun lt!384433 () V!26721)

(assert (=> b!852959 (= lt!384428 (tuple2!10741 k!854 lt!384433))))

(declare-datatypes ((Unit!29113 0))(
  ( (Unit!29114) )
))
(declare-fun lt!384424 () Unit!29113)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!292 (ListLongMap!9509 (_ BitVec 64) V!26721 V!26721) Unit!29113)

(assert (=> b!852959 (= lt!384424 (addSameAsAddTwiceSameKeyDiffValues!292 lt!384426 k!854 lt!384431 lt!384433))))

(declare-fun lt!384430 () V!26721)

(declare-fun get!12330 (ValueCell!7688 V!26721) V!26721)

(assert (=> b!852959 (= lt!384431 (get!12330 (select (arr!23386 _values!688) from!1053) lt!384430))))

(assert (=> b!852959 (= lt!384432 (+!2164 lt!384426 (tuple2!10741 (select (arr!23385 _keys!868) from!1053) lt!384433)))))

(assert (=> b!852959 (= lt!384433 (get!12330 (select (store (arr!23386 _values!688) i!612 (ValueCellFull!7688 v!557)) from!1053) lt!384430))))

(declare-fun dynLambda!1046 (Int (_ BitVec 64)) V!26721)

(assert (=> b!852959 (= lt!384430 (dynLambda!1046 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852959 (= lt!384426 (getCurrentListMapNoExtraKeys!2751 _keys!868 lt!384425 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852960 () Bool)

(declare-fun res!579311 () Bool)

(assert (=> b!852960 (=> (not res!579311) (not e!475695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852960 (= res!579311 (validKeyInArray!0 k!854))))

(declare-fun b!852961 () Bool)

(assert (=> b!852961 (= e!475693 (and e!475694 mapRes!25982))))

(declare-fun condMapEmpty!25982 () Bool)

(declare-fun mapDefault!25982 () ValueCell!7688)

