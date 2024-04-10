; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73208 () Bool)

(assert start!73208)

(declare-fun b_free!14123 () Bool)

(declare-fun b_next!14123 () Bool)

(assert (=> start!73208 (= b_free!14123 (not b_next!14123))))

(declare-fun tp!49873 () Bool)

(declare-fun b_and!23405 () Bool)

(assert (=> start!73208 (= tp!49873 b_and!23405)))

(declare-fun b!853045 () Bool)

(declare-fun e!475744 () Bool)

(declare-fun tp_is_empty!16259 () Bool)

(assert (=> b!853045 (= e!475744 tp_is_empty!16259)))

(declare-fun mapIsEmpty!25988 () Bool)

(declare-fun mapRes!25988 () Bool)

(assert (=> mapIsEmpty!25988 mapRes!25988))

(declare-fun res!579377 () Bool)

(declare-fun e!475742 () Bool)

(assert (=> start!73208 (=> (not res!579377) (not e!475742))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48716 0))(
  ( (array!48717 (arr!23389 (Array (_ BitVec 32) (_ BitVec 64))) (size!23829 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48716)

(assert (=> start!73208 (= res!579377 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23829 _keys!868))))))

(assert (=> start!73208 e!475742))

(assert (=> start!73208 tp_is_empty!16259))

(assert (=> start!73208 true))

(assert (=> start!73208 tp!49873))

(declare-fun array_inv!18546 (array!48716) Bool)

(assert (=> start!73208 (array_inv!18546 _keys!868)))

(declare-datatypes ((V!26725 0))(
  ( (V!26726 (val!8177 Int)) )
))
(declare-datatypes ((ValueCell!7690 0))(
  ( (ValueCellFull!7690 (v!10602 V!26725)) (EmptyCell!7690) )
))
(declare-datatypes ((array!48718 0))(
  ( (array!48719 (arr!23390 (Array (_ BitVec 32) ValueCell!7690)) (size!23830 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48718)

(declare-fun e!475741 () Bool)

(declare-fun array_inv!18547 (array!48718) Bool)

(assert (=> start!73208 (and (array_inv!18547 _values!688) e!475741)))

(declare-datatypes ((tuple2!10744 0))(
  ( (tuple2!10745 (_1!5383 (_ BitVec 64)) (_2!5383 V!26725)) )
))
(declare-datatypes ((List!16572 0))(
  ( (Nil!16569) (Cons!16568 (h!17699 tuple2!10744) (t!23141 List!16572)) )
))
(declare-datatypes ((ListLongMap!9513 0))(
  ( (ListLongMap!9514 (toList!4772 List!16572)) )
))
(declare-fun call!38225 () ListLongMap!9513)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!38221 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!384490 () array!48718)

(declare-fun c!91855 () Bool)

(declare-fun minValue!654 () V!26725)

(declare-fun zeroValue!654 () V!26725)

(declare-fun getCurrentListMapNoExtraKeys!2753 (array!48716 array!48718 (_ BitVec 32) (_ BitVec 32) V!26725 V!26725 (_ BitVec 32) Int) ListLongMap!9513)

(assert (=> bm!38221 (= call!38225 (getCurrentListMapNoExtraKeys!2753 _keys!868 (ite c!91855 lt!384490 _values!688) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38222 () Bool)

(declare-fun call!38224 () ListLongMap!9513)

(assert (=> bm!38222 (= call!38224 (getCurrentListMapNoExtraKeys!2753 _keys!868 (ite c!91855 _values!688 lt!384490) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853046 () Bool)

(declare-fun res!579376 () Bool)

(assert (=> b!853046 (=> (not res!579376) (not e!475742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853046 (= res!579376 (validMask!0 mask!1196))))

(declare-fun b!853047 () Bool)

(declare-fun res!579375 () Bool)

(assert (=> b!853047 (=> (not res!579375) (not e!475742))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853047 (= res!579375 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!25988 () Bool)

(declare-fun tp!49872 () Bool)

(declare-fun e!475743 () Bool)

(assert (=> mapNonEmpty!25988 (= mapRes!25988 (and tp!49872 e!475743))))

(declare-fun mapKey!25988 () (_ BitVec 32))

(declare-fun mapRest!25988 () (Array (_ BitVec 32) ValueCell!7690))

(declare-fun mapValue!25988 () ValueCell!7690)

(assert (=> mapNonEmpty!25988 (= (arr!23390 _values!688) (store mapRest!25988 mapKey!25988 mapValue!25988))))

(declare-fun b!853048 () Bool)

(declare-fun res!579374 () Bool)

(assert (=> b!853048 (=> (not res!579374) (not e!475742))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853048 (= res!579374 (and (= (select (arr!23389 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!853049 () Bool)

(declare-fun res!579368 () Bool)

(assert (=> b!853049 (=> (not res!579368) (not e!475742))))

(assert (=> b!853049 (= res!579368 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23829 _keys!868))))))

(declare-fun b!853050 () Bool)

(declare-fun e!475739 () Bool)

(assert (=> b!853050 (= e!475739 (= call!38224 call!38225))))

(declare-fun b!853051 () Bool)

(declare-fun res!579370 () Bool)

(assert (=> b!853051 (=> (not res!579370) (not e!475742))))

(declare-datatypes ((List!16573 0))(
  ( (Nil!16570) (Cons!16569 (h!17700 (_ BitVec 64)) (t!23142 List!16573)) )
))
(declare-fun arrayNoDuplicates!0 (array!48716 (_ BitVec 32) List!16573) Bool)

(assert (=> b!853051 (= res!579370 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16570))))

(declare-fun b!853052 () Bool)

(declare-fun e!475740 () Bool)

(assert (=> b!853052 (= e!475742 e!475740)))

(declare-fun res!579371 () Bool)

(assert (=> b!853052 (=> (not res!579371) (not e!475740))))

(assert (=> b!853052 (= res!579371 (= from!1053 i!612))))

(declare-fun lt!384491 () ListLongMap!9513)

(assert (=> b!853052 (= lt!384491 (getCurrentListMapNoExtraKeys!2753 _keys!868 lt!384490 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26725)

(assert (=> b!853052 (= lt!384490 (array!48719 (store (arr!23390 _values!688) i!612 (ValueCellFull!7690 v!557)) (size!23830 _values!688)))))

(declare-fun lt!384485 () ListLongMap!9513)

(assert (=> b!853052 (= lt!384485 (getCurrentListMapNoExtraKeys!2753 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853053 () Bool)

(assert (=> b!853053 (= e!475741 (and e!475744 mapRes!25988))))

(declare-fun condMapEmpty!25988 () Bool)

(declare-fun mapDefault!25988 () ValueCell!7690)

