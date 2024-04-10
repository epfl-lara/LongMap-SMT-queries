; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73022 () Bool)

(assert start!73022)

(declare-fun b_free!13937 () Bool)

(declare-fun b_next!13937 () Bool)

(assert (=> start!73022 (= b_free!13937 (not b_next!13937))))

(declare-fun tp!49315 () Bool)

(declare-fun b_and!23033 () Bool)

(assert (=> start!73022 (= tp!49315 b_and!23033)))

(declare-fun b!848674 () Bool)

(declare-fun res!576583 () Bool)

(declare-fun e!473506 () Bool)

(assert (=> b!848674 (=> (not res!576583) (not e!473506))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48352 0))(
  ( (array!48353 (arr!23207 (Array (_ BitVec 32) (_ BitVec 64))) (size!23647 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48352)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!848674 (= res!576583 (and (= (select (arr!23207 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!848675 () Bool)

(declare-fun res!576585 () Bool)

(assert (=> b!848675 (=> (not res!576585) (not e!473506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848675 (= res!576585 (validKeyInArray!0 k!854))))

(declare-fun b!848676 () Bool)

(declare-fun res!576579 () Bool)

(assert (=> b!848676 (=> (not res!576579) (not e!473506))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48352 (_ BitVec 32)) Bool)

(assert (=> b!848676 (= res!576579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25709 () Bool)

(declare-fun mapRes!25709 () Bool)

(assert (=> mapIsEmpty!25709 mapRes!25709))

(declare-fun b!848677 () Bool)

(declare-datatypes ((V!26477 0))(
  ( (V!26478 (val!8084 Int)) )
))
(declare-fun v!557 () V!26477)

(declare-datatypes ((tuple2!10574 0))(
  ( (tuple2!10575 (_1!5298 (_ BitVec 64)) (_2!5298 V!26477)) )
))
(declare-datatypes ((List!16429 0))(
  ( (Nil!16426) (Cons!16425 (h!17556 tuple2!10574) (t!22812 List!16429)) )
))
(declare-datatypes ((ListLongMap!9343 0))(
  ( (ListLongMap!9344 (toList!4687 List!16429)) )
))
(declare-fun call!37666 () ListLongMap!9343)

(declare-fun call!37667 () ListLongMap!9343)

(declare-fun e!473507 () Bool)

(declare-fun +!2096 (ListLongMap!9343 tuple2!10574) ListLongMap!9343)

(assert (=> b!848677 (= e!473507 (= call!37666 (+!2096 call!37667 (tuple2!10575 k!854 v!557))))))

(declare-fun bm!37663 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7597 0))(
  ( (ValueCellFull!7597 (v!10509 V!26477)) (EmptyCell!7597) )
))
(declare-datatypes ((array!48354 0))(
  ( (array!48355 (arr!23208 (Array (_ BitVec 32) ValueCell!7597)) (size!23648 (_ BitVec 32))) )
))
(declare-fun lt!382080 () array!48354)

(declare-fun minValue!654 () V!26477)

(declare-fun zeroValue!654 () V!26477)

(declare-fun getCurrentListMapNoExtraKeys!2669 (array!48352 array!48354 (_ BitVec 32) (_ BitVec 32) V!26477 V!26477 (_ BitVec 32) Int) ListLongMap!9343)

(assert (=> bm!37663 (= call!37666 (getCurrentListMapNoExtraKeys!2669 _keys!868 lt!382080 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848678 () Bool)

(declare-fun res!576582 () Bool)

(assert (=> b!848678 (=> (not res!576582) (not e!473506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848678 (= res!576582 (validMask!0 mask!1196))))

(declare-fun b!848679 () Bool)

(declare-fun res!576581 () Bool)

(assert (=> b!848679 (=> (not res!576581) (not e!473506))))

(declare-datatypes ((List!16430 0))(
  ( (Nil!16427) (Cons!16426 (h!17557 (_ BitVec 64)) (t!22813 List!16430)) )
))
(declare-fun arrayNoDuplicates!0 (array!48352 (_ BitVec 32) List!16430) Bool)

(assert (=> b!848679 (= res!576581 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16427))))

(declare-fun b!848680 () Bool)

(declare-fun e!473509 () Bool)

(declare-fun tp_is_empty!16073 () Bool)

(assert (=> b!848680 (= e!473509 tp_is_empty!16073)))

(declare-fun b!848681 () Bool)

(declare-fun e!473508 () Bool)

(assert (=> b!848681 (= e!473508 tp_is_empty!16073)))

(declare-fun b!848682 () Bool)

(declare-fun res!576586 () Bool)

(assert (=> b!848682 (=> (not res!576586) (not e!473506))))

(declare-fun _values!688 () array!48354)

(assert (=> b!848682 (= res!576586 (and (= (size!23648 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23647 _keys!868) (size!23648 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25709 () Bool)

(declare-fun tp!49314 () Bool)

(assert (=> mapNonEmpty!25709 (= mapRes!25709 (and tp!49314 e!473509))))

(declare-fun mapValue!25709 () ValueCell!7597)

(declare-fun mapKey!25709 () (_ BitVec 32))

(declare-fun mapRest!25709 () (Array (_ BitVec 32) ValueCell!7597))

(assert (=> mapNonEmpty!25709 (= (arr!23208 _values!688) (store mapRest!25709 mapKey!25709 mapValue!25709))))

(declare-fun b!848683 () Bool)

(declare-fun e!473511 () Bool)

(assert (=> b!848683 (= e!473506 e!473511)))

(declare-fun res!576578 () Bool)

(assert (=> b!848683 (=> (not res!576578) (not e!473511))))

(assert (=> b!848683 (= res!576578 (= from!1053 i!612))))

(declare-fun lt!382078 () ListLongMap!9343)

(assert (=> b!848683 (= lt!382078 (getCurrentListMapNoExtraKeys!2669 _keys!868 lt!382080 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848683 (= lt!382080 (array!48355 (store (arr!23208 _values!688) i!612 (ValueCellFull!7597 v!557)) (size!23648 _values!688)))))

(declare-fun lt!382079 () ListLongMap!9343)

(assert (=> b!848683 (= lt!382079 (getCurrentListMapNoExtraKeys!2669 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!576580 () Bool)

(assert (=> start!73022 (=> (not res!576580) (not e!473506))))

(assert (=> start!73022 (= res!576580 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23647 _keys!868))))))

(assert (=> start!73022 e!473506))

(assert (=> start!73022 tp_is_empty!16073))

(assert (=> start!73022 true))

(assert (=> start!73022 tp!49315))

(declare-fun array_inv!18422 (array!48352) Bool)

(assert (=> start!73022 (array_inv!18422 _keys!868)))

(declare-fun e!473510 () Bool)

(declare-fun array_inv!18423 (array!48354) Bool)

(assert (=> start!73022 (and (array_inv!18423 _values!688) e!473510)))

(declare-fun b!848684 () Bool)

(declare-fun e!473512 () Bool)

(assert (=> b!848684 (= e!473512 true)))

(declare-fun get!12209 (ValueCell!7597 V!26477) V!26477)

(declare-fun dynLambda!987 (Int (_ BitVec 64)) V!26477)

(assert (=> b!848684 (= lt!382078 (+!2096 (getCurrentListMapNoExtraKeys!2669 _keys!868 lt!382080 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10575 (select (arr!23207 _keys!868) from!1053) (get!12209 (select (arr!23208 lt!382080) from!1053) (dynLambda!987 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!848685 () Bool)

(assert (=> b!848685 (= e!473507 (= call!37666 call!37667))))

(declare-fun b!848686 () Bool)

(declare-fun res!576584 () Bool)

(assert (=> b!848686 (=> (not res!576584) (not e!473506))))

(assert (=> b!848686 (= res!576584 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23647 _keys!868))))))

(declare-fun b!848687 () Bool)

(assert (=> b!848687 (= e!473510 (and e!473508 mapRes!25709))))

(declare-fun condMapEmpty!25709 () Bool)

(declare-fun mapDefault!25709 () ValueCell!7597)

