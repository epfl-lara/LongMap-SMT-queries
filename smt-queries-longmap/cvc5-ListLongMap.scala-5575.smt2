; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73234 () Bool)

(assert start!73234)

(declare-fun b_free!14149 () Bool)

(declare-fun b_next!14149 () Bool)

(assert (=> start!73234 (= b_free!14149 (not b_next!14149))))

(declare-fun tp!49950 () Bool)

(declare-fun b_and!23457 () Bool)

(assert (=> start!73234 (= tp!49950 b_and!23457)))

(declare-fun b!853656 () Bool)

(declare-fun e!476049 () Bool)

(declare-fun tp_is_empty!16285 () Bool)

(assert (=> b!853656 (= e!476049 tp_is_empty!16285)))

(declare-fun b!853657 () Bool)

(declare-fun res!579763 () Bool)

(declare-fun e!476050 () Bool)

(assert (=> b!853657 (=> (not res!579763) (not e!476050))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48768 0))(
  ( (array!48769 (arr!23415 (Array (_ BitVec 32) (_ BitVec 64))) (size!23855 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48768)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!853657 (= res!579763 (and (= (select (arr!23415 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!853658 () Bool)

(declare-fun e!476051 () Bool)

(declare-datatypes ((V!26761 0))(
  ( (V!26762 (val!8190 Int)) )
))
(declare-datatypes ((tuple2!10770 0))(
  ( (tuple2!10771 (_1!5396 (_ BitVec 64)) (_2!5396 V!26761)) )
))
(declare-datatypes ((List!16594 0))(
  ( (Nil!16591) (Cons!16590 (h!17721 tuple2!10770) (t!23189 List!16594)) )
))
(declare-datatypes ((ListLongMap!9539 0))(
  ( (ListLongMap!9540 (toList!4785 List!16594)) )
))
(declare-fun call!38302 () ListLongMap!9539)

(declare-fun call!38303 () ListLongMap!9539)

(assert (=> b!853658 (= e!476051 (= call!38302 call!38303))))

(declare-fun mapNonEmpty!26027 () Bool)

(declare-fun mapRes!26027 () Bool)

(declare-fun tp!49951 () Bool)

(declare-fun e!476052 () Bool)

(assert (=> mapNonEmpty!26027 (= mapRes!26027 (and tp!49951 e!476052))))

(declare-datatypes ((ValueCell!7703 0))(
  ( (ValueCellFull!7703 (v!10615 V!26761)) (EmptyCell!7703) )
))
(declare-fun mapValue!26027 () ValueCell!7703)

(declare-fun mapRest!26027 () (Array (_ BitVec 32) ValueCell!7703))

(declare-fun mapKey!26027 () (_ BitVec 32))

(declare-datatypes ((array!48770 0))(
  ( (array!48771 (arr!23416 (Array (_ BitVec 32) ValueCell!7703)) (size!23856 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48770)

(assert (=> mapNonEmpty!26027 (= (arr!23416 _values!688) (store mapRest!26027 mapKey!26027 mapValue!26027))))

(declare-fun b!853659 () Bool)

(declare-fun e!476054 () Bool)

(assert (=> b!853659 (= e!476050 e!476054)))

(declare-fun res!579762 () Bool)

(assert (=> b!853659 (=> (not res!579762) (not e!476054))))

(assert (=> b!853659 (= res!579762 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!384882 () ListLongMap!9539)

(declare-fun lt!384875 () array!48770)

(declare-fun minValue!654 () V!26761)

(declare-fun zeroValue!654 () V!26761)

(declare-fun getCurrentListMapNoExtraKeys!2766 (array!48768 array!48770 (_ BitVec 32) (_ BitVec 32) V!26761 V!26761 (_ BitVec 32) Int) ListLongMap!9539)

(assert (=> b!853659 (= lt!384882 (getCurrentListMapNoExtraKeys!2766 _keys!868 lt!384875 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26761)

(assert (=> b!853659 (= lt!384875 (array!48771 (store (arr!23416 _values!688) i!612 (ValueCellFull!7703 v!557)) (size!23856 _values!688)))))

(declare-fun lt!384877 () ListLongMap!9539)

(assert (=> b!853659 (= lt!384877 (getCurrentListMapNoExtraKeys!2766 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26027 () Bool)

(assert (=> mapIsEmpty!26027 mapRes!26027))

(declare-fun b!853660 () Bool)

(declare-fun e!476056 () Bool)

(assert (=> b!853660 (= e!476056 true)))

(declare-fun lt!384878 () tuple2!10770)

(declare-fun lt!384880 () ListLongMap!9539)

(declare-fun lt!384881 () V!26761)

(declare-fun +!2177 (ListLongMap!9539 tuple2!10770) ListLongMap!9539)

(assert (=> b!853660 (= (+!2177 lt!384880 lt!384878) (+!2177 (+!2177 lt!384880 (tuple2!10771 k!854 lt!384881)) lt!384878))))

(declare-fun lt!384883 () V!26761)

(assert (=> b!853660 (= lt!384878 (tuple2!10771 k!854 lt!384883))))

(declare-datatypes ((Unit!29137 0))(
  ( (Unit!29138) )
))
(declare-fun lt!384874 () Unit!29137)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!304 (ListLongMap!9539 (_ BitVec 64) V!26761 V!26761) Unit!29137)

(assert (=> b!853660 (= lt!384874 (addSameAsAddTwiceSameKeyDiffValues!304 lt!384880 k!854 lt!384881 lt!384883))))

(declare-fun lt!384879 () V!26761)

(declare-fun get!12352 (ValueCell!7703 V!26761) V!26761)

(assert (=> b!853660 (= lt!384881 (get!12352 (select (arr!23416 _values!688) from!1053) lt!384879))))

(assert (=> b!853660 (= lt!384882 (+!2177 lt!384880 (tuple2!10771 (select (arr!23415 _keys!868) from!1053) lt!384883)))))

(assert (=> b!853660 (= lt!384883 (get!12352 (select (store (arr!23416 _values!688) i!612 (ValueCellFull!7703 v!557)) from!1053) lt!384879))))

(declare-fun dynLambda!1058 (Int (_ BitVec 64)) V!26761)

(assert (=> b!853660 (= lt!384879 (dynLambda!1058 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853660 (= lt!384880 (getCurrentListMapNoExtraKeys!2766 _keys!868 lt!384875 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853661 () Bool)

(assert (=> b!853661 (= e!476051 (= call!38302 (+!2177 call!38303 (tuple2!10771 k!854 v!557))))))

(declare-fun b!853662 () Bool)

(declare-fun e!476055 () Bool)

(assert (=> b!853662 (= e!476055 (and e!476049 mapRes!26027))))

(declare-fun condMapEmpty!26027 () Bool)

(declare-fun mapDefault!26027 () ValueCell!7703)

