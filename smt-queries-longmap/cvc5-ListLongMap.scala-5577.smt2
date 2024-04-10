; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73246 () Bool)

(assert start!73246)

(declare-fun b_free!14161 () Bool)

(declare-fun b_next!14161 () Bool)

(assert (=> start!73246 (= b_free!14161 (not b_next!14161))))

(declare-fun tp!49986 () Bool)

(declare-fun b_and!23481 () Bool)

(assert (=> start!73246 (= tp!49986 b_and!23481)))

(declare-fun b!853938 () Bool)

(declare-fun res!579944 () Bool)

(declare-fun e!476193 () Bool)

(assert (=> b!853938 (=> (not res!579944) (not e!476193))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48792 0))(
  ( (array!48793 (arr!23427 (Array (_ BitVec 32) (_ BitVec 64))) (size!23867 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48792)

(assert (=> b!853938 (= res!579944 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23867 _keys!868))))))

(declare-fun b!853939 () Bool)

(declare-fun res!579938 () Bool)

(assert (=> b!853939 (=> (not res!579938) (not e!476193))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853939 (= res!579938 (validKeyInArray!0 k!854))))

(declare-datatypes ((V!26777 0))(
  ( (V!26778 (val!8196 Int)) )
))
(declare-datatypes ((ValueCell!7709 0))(
  ( (ValueCellFull!7709 (v!10621 V!26777)) (EmptyCell!7709) )
))
(declare-datatypes ((array!48794 0))(
  ( (array!48795 (arr!23428 (Array (_ BitVec 32) ValueCell!7709)) (size!23868 (_ BitVec 32))) )
))
(declare-fun lt!385062 () array!48794)

(declare-fun bm!38335 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10782 0))(
  ( (tuple2!10783 (_1!5402 (_ BitVec 64)) (_2!5402 V!26777)) )
))
(declare-datatypes ((List!16603 0))(
  ( (Nil!16600) (Cons!16599 (h!17730 tuple2!10782) (t!23210 List!16603)) )
))
(declare-datatypes ((ListLongMap!9551 0))(
  ( (ListLongMap!9552 (toList!4791 List!16603)) )
))
(declare-fun call!38338 () ListLongMap!9551)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26777)

(declare-fun zeroValue!654 () V!26777)

(declare-fun getCurrentListMapNoExtraKeys!2772 (array!48792 array!48794 (_ BitVec 32) (_ BitVec 32) V!26777 V!26777 (_ BitVec 32) Int) ListLongMap!9551)

(assert (=> bm!38335 (= call!38338 (getCurrentListMapNoExtraKeys!2772 _keys!868 lt!385062 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853940 () Bool)

(declare-fun res!579946 () Bool)

(assert (=> b!853940 (=> (not res!579946) (not e!476193))))

(assert (=> b!853940 (= res!579946 (and (= (select (arr!23427 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!853941 () Bool)

(declare-fun res!579943 () Bool)

(assert (=> b!853941 (=> (not res!579943) (not e!476193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48792 (_ BitVec 32)) Bool)

(assert (=> b!853941 (= res!579943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26045 () Bool)

(declare-fun mapRes!26045 () Bool)

(assert (=> mapIsEmpty!26045 mapRes!26045))

(declare-fun b!853942 () Bool)

(declare-fun res!579945 () Bool)

(assert (=> b!853942 (=> (not res!579945) (not e!476193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853942 (= res!579945 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26045 () Bool)

(declare-fun tp!49987 () Bool)

(declare-fun e!476194 () Bool)

(assert (=> mapNonEmpty!26045 (= mapRes!26045 (and tp!49987 e!476194))))

(declare-fun mapValue!26045 () ValueCell!7709)

(declare-fun _values!688 () array!48794)

(declare-fun mapKey!26045 () (_ BitVec 32))

(declare-fun mapRest!26045 () (Array (_ BitVec 32) ValueCell!7709))

(assert (=> mapNonEmpty!26045 (= (arr!23428 _values!688) (store mapRest!26045 mapKey!26045 mapValue!26045))))

(declare-fun b!853943 () Bool)

(declare-fun res!579941 () Bool)

(assert (=> b!853943 (=> (not res!579941) (not e!476193))))

(assert (=> b!853943 (= res!579941 (and (= (size!23868 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23867 _keys!868) (size!23868 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853944 () Bool)

(declare-fun e!476196 () Bool)

(declare-fun tp_is_empty!16297 () Bool)

(assert (=> b!853944 (= e!476196 tp_is_empty!16297)))

(declare-fun call!38339 () ListLongMap!9551)

(declare-fun bm!38336 () Bool)

(assert (=> bm!38336 (= call!38339 (getCurrentListMapNoExtraKeys!2772 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!579939 () Bool)

(assert (=> start!73246 (=> (not res!579939) (not e!476193))))

(assert (=> start!73246 (= res!579939 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23867 _keys!868))))))

(assert (=> start!73246 e!476193))

(assert (=> start!73246 tp_is_empty!16297))

(assert (=> start!73246 true))

(assert (=> start!73246 tp!49986))

(declare-fun array_inv!18572 (array!48792) Bool)

(assert (=> start!73246 (array_inv!18572 _keys!868)))

(declare-fun e!476195 () Bool)

(declare-fun array_inv!18573 (array!48794) Bool)

(assert (=> start!73246 (and (array_inv!18573 _values!688) e!476195)))

(declare-fun b!853945 () Bool)

(declare-fun e!476198 () Bool)

(assert (=> b!853945 (= e!476198 (= call!38338 call!38339))))

(declare-fun b!853946 () Bool)

(declare-fun e!476199 () Bool)

(assert (=> b!853946 (= e!476193 e!476199)))

(declare-fun res!579942 () Bool)

(assert (=> b!853946 (=> (not res!579942) (not e!476199))))

(assert (=> b!853946 (= res!579942 (= from!1053 i!612))))

(declare-fun lt!385061 () ListLongMap!9551)

(assert (=> b!853946 (= lt!385061 (getCurrentListMapNoExtraKeys!2772 _keys!868 lt!385062 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26777)

(assert (=> b!853946 (= lt!385062 (array!48795 (store (arr!23428 _values!688) i!612 (ValueCellFull!7709 v!557)) (size!23868 _values!688)))))

(declare-fun lt!385058 () ListLongMap!9551)

(assert (=> b!853946 (= lt!385058 (getCurrentListMapNoExtraKeys!2772 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853947 () Bool)

(declare-fun e!476200 () Bool)

(assert (=> b!853947 (= e!476199 (not e!476200))))

(declare-fun res!579940 () Bool)

(assert (=> b!853947 (=> res!579940 e!476200)))

(assert (=> b!853947 (= res!579940 (not (validKeyInArray!0 (select (arr!23427 _keys!868) from!1053))))))

(assert (=> b!853947 e!476198))

(declare-fun c!91912 () Bool)

(assert (=> b!853947 (= c!91912 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29147 0))(
  ( (Unit!29148) )
))
(declare-fun lt!385054 () Unit!29147)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!405 (array!48792 array!48794 (_ BitVec 32) (_ BitVec 32) V!26777 V!26777 (_ BitVec 32) (_ BitVec 64) V!26777 (_ BitVec 32) Int) Unit!29147)

(assert (=> b!853947 (= lt!385054 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!405 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853948 () Bool)

(declare-fun +!2181 (ListLongMap!9551 tuple2!10782) ListLongMap!9551)

(assert (=> b!853948 (= e!476198 (= call!38338 (+!2181 call!38339 (tuple2!10783 k!854 v!557))))))

(declare-fun b!853949 () Bool)

(assert (=> b!853949 (= e!476195 (and e!476196 mapRes!26045))))

(declare-fun condMapEmpty!26045 () Bool)

(declare-fun mapDefault!26045 () ValueCell!7709)

