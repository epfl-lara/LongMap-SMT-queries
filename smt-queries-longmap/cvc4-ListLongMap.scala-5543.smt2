; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73046 () Bool)

(assert start!73046)

(declare-fun b_free!13961 () Bool)

(declare-fun b_next!13961 () Bool)

(assert (=> start!73046 (= b_free!13961 (not b_next!13961))))

(declare-fun tp!49386 () Bool)

(declare-fun b_and!23081 () Bool)

(assert (=> start!73046 (= tp!49386 b_and!23081)))

(declare-fun b!849238 () Bool)

(declare-fun e!473800 () Bool)

(declare-fun tp_is_empty!16097 () Bool)

(assert (=> b!849238 (= e!473800 tp_is_empty!16097)))

(declare-fun b!849239 () Bool)

(declare-fun res!576938 () Bool)

(declare-fun e!473796 () Bool)

(assert (=> b!849239 (=> (not res!576938) (not e!473796))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849239 (= res!576938 (validMask!0 mask!1196))))

(declare-fun b!849240 () Bool)

(declare-fun e!473799 () Bool)

(declare-fun e!473794 () Bool)

(assert (=> b!849240 (= e!473799 (not e!473794))))

(declare-fun res!576940 () Bool)

(assert (=> b!849240 (=> res!576940 e!473794)))

(declare-datatypes ((array!48400 0))(
  ( (array!48401 (arr!23231 (Array (_ BitVec 32) (_ BitVec 64))) (size!23671 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48400)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849240 (= res!576940 (not (validKeyInArray!0 (select (arr!23231 _keys!868) from!1053))))))

(declare-fun e!473795 () Bool)

(assert (=> b!849240 e!473795))

(declare-fun c!91612 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849240 (= c!91612 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26509 0))(
  ( (V!26510 (val!8096 Int)) )
))
(declare-fun v!557 () V!26509)

(declare-datatypes ((Unit!28999 0))(
  ( (Unit!29000) )
))
(declare-fun lt!382224 () Unit!28999)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7609 0))(
  ( (ValueCellFull!7609 (v!10521 V!26509)) (EmptyCell!7609) )
))
(declare-datatypes ((array!48402 0))(
  ( (array!48403 (arr!23232 (Array (_ BitVec 32) ValueCell!7609)) (size!23672 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48402)

(declare-fun minValue!654 () V!26509)

(declare-fun zeroValue!654 () V!26509)

(declare-fun defaultEntry!696 () Int)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!345 (array!48400 array!48402 (_ BitVec 32) (_ BitVec 32) V!26509 V!26509 (_ BitVec 32) (_ BitVec 64) V!26509 (_ BitVec 32) Int) Unit!28999)

(assert (=> b!849240 (= lt!382224 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!345 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849241 () Bool)

(assert (=> b!849241 (= e!473794 true)))

(declare-fun lt!382222 () array!48402)

(declare-datatypes ((tuple2!10598 0))(
  ( (tuple2!10599 (_1!5310 (_ BitVec 64)) (_2!5310 V!26509)) )
))
(declare-datatypes ((List!16447 0))(
  ( (Nil!16444) (Cons!16443 (h!17574 tuple2!10598) (t!22854 List!16447)) )
))
(declare-datatypes ((ListLongMap!9367 0))(
  ( (ListLongMap!9368 (toList!4699 List!16447)) )
))
(declare-fun lt!382225 () ListLongMap!9367)

(declare-fun +!2104 (ListLongMap!9367 tuple2!10598) ListLongMap!9367)

(declare-fun getCurrentListMapNoExtraKeys!2681 (array!48400 array!48402 (_ BitVec 32) (_ BitVec 32) V!26509 V!26509 (_ BitVec 32) Int) ListLongMap!9367)

(declare-fun get!12225 (ValueCell!7609 V!26509) V!26509)

(declare-fun dynLambda!995 (Int (_ BitVec 64)) V!26509)

(assert (=> b!849241 (= lt!382225 (+!2104 (getCurrentListMapNoExtraKeys!2681 _keys!868 lt!382222 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10599 (select (arr!23231 _keys!868) from!1053) (get!12225 (select (arr!23232 lt!382222) from!1053) (dynLambda!995 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun call!37739 () ListLongMap!9367)

(declare-fun bm!37735 () Bool)

(assert (=> bm!37735 (= call!37739 (getCurrentListMapNoExtraKeys!2681 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849242 () Bool)

(declare-fun res!576945 () Bool)

(assert (=> b!849242 (=> (not res!576945) (not e!473796))))

(assert (=> b!849242 (= res!576945 (and (= (size!23672 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23671 _keys!868) (size!23672 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25745 () Bool)

(declare-fun mapRes!25745 () Bool)

(declare-fun tp!49387 () Bool)

(declare-fun e!473793 () Bool)

(assert (=> mapNonEmpty!25745 (= mapRes!25745 (and tp!49387 e!473793))))

(declare-fun mapRest!25745 () (Array (_ BitVec 32) ValueCell!7609))

(declare-fun mapValue!25745 () ValueCell!7609)

(declare-fun mapKey!25745 () (_ BitVec 32))

(assert (=> mapNonEmpty!25745 (= (arr!23232 _values!688) (store mapRest!25745 mapKey!25745 mapValue!25745))))

(declare-fun res!576944 () Bool)

(assert (=> start!73046 (=> (not res!576944) (not e!473796))))

(assert (=> start!73046 (= res!576944 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23671 _keys!868))))))

(assert (=> start!73046 e!473796))

(assert (=> start!73046 tp_is_empty!16097))

(assert (=> start!73046 true))

(assert (=> start!73046 tp!49386))

(declare-fun array_inv!18438 (array!48400) Bool)

(assert (=> start!73046 (array_inv!18438 _keys!868)))

(declare-fun e!473797 () Bool)

(declare-fun array_inv!18439 (array!48402) Bool)

(assert (=> start!73046 (and (array_inv!18439 _values!688) e!473797)))

(declare-fun bm!37736 () Bool)

(declare-fun call!37738 () ListLongMap!9367)

(assert (=> bm!37736 (= call!37738 (getCurrentListMapNoExtraKeys!2681 _keys!868 lt!382222 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849243 () Bool)

(declare-fun res!576946 () Bool)

(assert (=> b!849243 (=> (not res!576946) (not e!473796))))

(declare-datatypes ((List!16448 0))(
  ( (Nil!16445) (Cons!16444 (h!17575 (_ BitVec 64)) (t!22855 List!16448)) )
))
(declare-fun arrayNoDuplicates!0 (array!48400 (_ BitVec 32) List!16448) Bool)

(assert (=> b!849243 (= res!576946 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16445))))

(declare-fun b!849244 () Bool)

(assert (=> b!849244 (= e!473796 e!473799)))

(declare-fun res!576941 () Bool)

(assert (=> b!849244 (=> (not res!576941) (not e!473799))))

(assert (=> b!849244 (= res!576941 (= from!1053 i!612))))

(assert (=> b!849244 (= lt!382225 (getCurrentListMapNoExtraKeys!2681 _keys!868 lt!382222 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849244 (= lt!382222 (array!48403 (store (arr!23232 _values!688) i!612 (ValueCellFull!7609 v!557)) (size!23672 _values!688)))))

(declare-fun lt!382223 () ListLongMap!9367)

(assert (=> b!849244 (= lt!382223 (getCurrentListMapNoExtraKeys!2681 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849245 () Bool)

(declare-fun res!576942 () Bool)

(assert (=> b!849245 (=> (not res!576942) (not e!473796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48400 (_ BitVec 32)) Bool)

(assert (=> b!849245 (= res!576942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849246 () Bool)

(declare-fun res!576939 () Bool)

(assert (=> b!849246 (=> (not res!576939) (not e!473796))))

(assert (=> b!849246 (= res!576939 (validKeyInArray!0 k!854))))

(declare-fun b!849247 () Bool)

(assert (=> b!849247 (= e!473793 tp_is_empty!16097)))

(declare-fun b!849248 () Bool)

(declare-fun res!576943 () Bool)

(assert (=> b!849248 (=> (not res!576943) (not e!473796))))

(assert (=> b!849248 (= res!576943 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23671 _keys!868))))))

(declare-fun b!849249 () Bool)

(declare-fun res!576947 () Bool)

(assert (=> b!849249 (=> (not res!576947) (not e!473796))))

(assert (=> b!849249 (= res!576947 (and (= (select (arr!23231 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!849250 () Bool)

(assert (=> b!849250 (= e!473797 (and e!473800 mapRes!25745))))

(declare-fun condMapEmpty!25745 () Bool)

(declare-fun mapDefault!25745 () ValueCell!7609)

