; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73180 () Bool)

(assert start!73180)

(declare-fun b_free!14095 () Bool)

(declare-fun b_next!14095 () Bool)

(assert (=> start!73180 (= b_free!14095 (not b_next!14095))))

(declare-fun tp!49788 () Bool)

(declare-fun b_and!23349 () Bool)

(assert (=> start!73180 (= tp!49788 b_and!23349)))

(declare-datatypes ((V!26689 0))(
  ( (V!26690 (val!8163 Int)) )
))
(declare-datatypes ((tuple2!10720 0))(
  ( (tuple2!10721 (_1!5371 (_ BitVec 64)) (_2!5371 V!26689)) )
))
(declare-datatypes ((List!16554 0))(
  ( (Nil!16551) (Cons!16550 (h!17681 tuple2!10720) (t!23095 List!16554)) )
))
(declare-datatypes ((ListLongMap!9489 0))(
  ( (ListLongMap!9490 (toList!4760 List!16554)) )
))
(declare-fun call!38141 () ListLongMap!9489)

(declare-fun v!557 () V!26689)

(declare-fun b!852387 () Bool)

(declare-fun e!475407 () Bool)

(declare-fun call!38140 () ListLongMap!9489)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2157 (ListLongMap!9489 tuple2!10720) ListLongMap!9489)

(assert (=> b!852387 (= e!475407 (= call!38141 (+!2157 call!38140 (tuple2!10721 k!854 v!557))))))

(declare-fun b!852388 () Bool)

(declare-fun res!578956 () Bool)

(declare-fun e!475404 () Bool)

(assert (=> b!852388 (=> (not res!578956) (not e!475404))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48660 0))(
  ( (array!48661 (arr!23361 (Array (_ BitVec 32) (_ BitVec 64))) (size!23801 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48660)

(assert (=> b!852388 (= res!578956 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23801 _keys!868))))))

(declare-fun res!578951 () Bool)

(assert (=> start!73180 (=> (not res!578951) (not e!475404))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73180 (= res!578951 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23801 _keys!868))))))

(assert (=> start!73180 e!475404))

(declare-fun tp_is_empty!16231 () Bool)

(assert (=> start!73180 tp_is_empty!16231))

(assert (=> start!73180 true))

(assert (=> start!73180 tp!49788))

(declare-fun array_inv!18530 (array!48660) Bool)

(assert (=> start!73180 (array_inv!18530 _keys!868)))

(declare-datatypes ((ValueCell!7676 0))(
  ( (ValueCellFull!7676 (v!10588 V!26689)) (EmptyCell!7676) )
))
(declare-datatypes ((array!48662 0))(
  ( (array!48663 (arr!23362 (Array (_ BitVec 32) ValueCell!7676)) (size!23802 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48662)

(declare-fun e!475401 () Bool)

(declare-fun array_inv!18531 (array!48662) Bool)

(assert (=> start!73180 (and (array_inv!18531 _values!688) e!475401)))

(declare-fun mapIsEmpty!25946 () Bool)

(declare-fun mapRes!25946 () Bool)

(assert (=> mapIsEmpty!25946 mapRes!25946))

(declare-fun b!852389 () Bool)

(declare-fun res!578955 () Bool)

(assert (=> b!852389 (=> (not res!578955) (not e!475404))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!852389 (= res!578955 (and (= (size!23802 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23801 _keys!868) (size!23802 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852390 () Bool)

(declare-fun e!475402 () Bool)

(assert (=> b!852390 (= e!475402 tp_is_empty!16231)))

(declare-fun b!852391 () Bool)

(declare-fun e!475405 () Bool)

(assert (=> b!852391 (= e!475405 true)))

(declare-fun lt!384067 () ListLongMap!9489)

(declare-fun lt!384068 () tuple2!10720)

(declare-fun lt!384066 () V!26689)

(assert (=> b!852391 (= (+!2157 lt!384067 lt!384068) (+!2157 (+!2157 lt!384067 (tuple2!10721 k!854 lt!384066)) lt!384068))))

(declare-fun lt!384069 () V!26689)

(assert (=> b!852391 (= lt!384068 (tuple2!10721 k!854 lt!384069))))

(declare-datatypes ((Unit!29097 0))(
  ( (Unit!29098) )
))
(declare-fun lt!384072 () Unit!29097)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!285 (ListLongMap!9489 (_ BitVec 64) V!26689 V!26689) Unit!29097)

(assert (=> b!852391 (= lt!384072 (addSameAsAddTwiceSameKeyDiffValues!285 lt!384067 k!854 lt!384066 lt!384069))))

(declare-fun lt!384070 () V!26689)

(declare-fun get!12315 (ValueCell!7676 V!26689) V!26689)

(assert (=> b!852391 (= lt!384066 (get!12315 (select (arr!23362 _values!688) from!1053) lt!384070))))

(declare-fun lt!384065 () ListLongMap!9489)

(assert (=> b!852391 (= lt!384065 (+!2157 lt!384067 (tuple2!10721 (select (arr!23361 _keys!868) from!1053) lt!384069)))))

(assert (=> b!852391 (= lt!384069 (get!12315 (select (store (arr!23362 _values!688) i!612 (ValueCellFull!7676 v!557)) from!1053) lt!384070))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1039 (Int (_ BitVec 64)) V!26689)

(assert (=> b!852391 (= lt!384070 (dynLambda!1039 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!384064 () array!48662)

(declare-fun minValue!654 () V!26689)

(declare-fun zeroValue!654 () V!26689)

(declare-fun getCurrentListMapNoExtraKeys!2742 (array!48660 array!48662 (_ BitVec 32) (_ BitVec 32) V!26689 V!26689 (_ BitVec 32) Int) ListLongMap!9489)

(assert (=> b!852391 (= lt!384067 (getCurrentListMapNoExtraKeys!2742 _keys!868 lt!384064 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852392 () Bool)

(declare-fun res!578954 () Bool)

(assert (=> b!852392 (=> (not res!578954) (not e!475404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852392 (= res!578954 (validKeyInArray!0 k!854))))

(declare-fun b!852393 () Bool)

(assert (=> b!852393 (= e!475407 (= call!38141 call!38140))))

(declare-fun b!852394 () Bool)

(declare-fun e!475408 () Bool)

(assert (=> b!852394 (= e!475408 tp_is_empty!16231)))

(declare-fun bm!38137 () Bool)

(assert (=> bm!38137 (= call!38140 (getCurrentListMapNoExtraKeys!2742 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852395 () Bool)

(declare-fun e!475406 () Bool)

(assert (=> b!852395 (= e!475406 (not e!475405))))

(declare-fun res!578952 () Bool)

(assert (=> b!852395 (=> res!578952 e!475405)))

(assert (=> b!852395 (= res!578952 (not (validKeyInArray!0 (select (arr!23361 _keys!868) from!1053))))))

(assert (=> b!852395 e!475407))

(declare-fun c!91813 () Bool)

(assert (=> b!852395 (= c!91813 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384071 () Unit!29097)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!388 (array!48660 array!48662 (_ BitVec 32) (_ BitVec 32) V!26689 V!26689 (_ BitVec 32) (_ BitVec 64) V!26689 (_ BitVec 32) Int) Unit!29097)

(assert (=> b!852395 (= lt!384071 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!388 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38138 () Bool)

(assert (=> bm!38138 (= call!38141 (getCurrentListMapNoExtraKeys!2742 _keys!868 lt!384064 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852396 () Bool)

(declare-fun res!578948 () Bool)

(assert (=> b!852396 (=> (not res!578948) (not e!475404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852396 (= res!578948 (validMask!0 mask!1196))))

(declare-fun b!852397 () Bool)

(declare-fun res!578957 () Bool)

(assert (=> b!852397 (=> (not res!578957) (not e!475404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48660 (_ BitVec 32)) Bool)

(assert (=> b!852397 (= res!578957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852398 () Bool)

(assert (=> b!852398 (= e!475401 (and e!475408 mapRes!25946))))

(declare-fun condMapEmpty!25946 () Bool)

(declare-fun mapDefault!25946 () ValueCell!7676)

