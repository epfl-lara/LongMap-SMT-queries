; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72940 () Bool)

(assert start!72940)

(declare-fun b_free!13873 () Bool)

(declare-fun b_next!13873 () Bool)

(assert (=> start!72940 (= b_free!13873 (not b_next!13873))))

(declare-fun tp!49124 () Bool)

(declare-fun b_and!22933 () Bool)

(assert (=> start!72940 (= tp!49124 b_and!22933)))

(declare-fun res!575586 () Bool)

(declare-fun e!472663 () Bool)

(assert (=> start!72940 (=> (not res!575586) (not e!472663))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48227 0))(
  ( (array!48228 (arr!23145 (Array (_ BitVec 32) (_ BitVec 64))) (size!23587 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48227)

(assert (=> start!72940 (= res!575586 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23587 _keys!868))))))

(assert (=> start!72940 e!472663))

(declare-fun tp_is_empty!16009 () Bool)

(assert (=> start!72940 tp_is_empty!16009))

(assert (=> start!72940 true))

(assert (=> start!72940 tp!49124))

(declare-fun array_inv!18456 (array!48227) Bool)

(assert (=> start!72940 (array_inv!18456 _keys!868)))

(declare-datatypes ((V!26393 0))(
  ( (V!26394 (val!8052 Int)) )
))
(declare-datatypes ((ValueCell!7565 0))(
  ( (ValueCellFull!7565 (v!10471 V!26393)) (EmptyCell!7565) )
))
(declare-datatypes ((array!48229 0))(
  ( (array!48230 (arr!23146 (Array (_ BitVec 32) ValueCell!7565)) (size!23588 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48229)

(declare-fun e!472660 () Bool)

(declare-fun array_inv!18457 (array!48229) Bool)

(assert (=> start!72940 (and (array_inv!18457 _values!688) e!472660)))

(declare-fun b!847055 () Bool)

(declare-fun res!575580 () Bool)

(assert (=> b!847055 (=> (not res!575580) (not e!472663))))

(declare-datatypes ((List!16402 0))(
  ( (Nil!16399) (Cons!16398 (h!17529 (_ BitVec 64)) (t!22764 List!16402)) )
))
(declare-fun arrayNoDuplicates!0 (array!48227 (_ BitVec 32) List!16402) Bool)

(assert (=> b!847055 (= res!575580 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16399))))

(declare-fun mapIsEmpty!25613 () Bool)

(declare-fun mapRes!25613 () Bool)

(assert (=> mapIsEmpty!25613 mapRes!25613))

(declare-fun b!847056 () Bool)

(declare-fun e!472662 () Bool)

(declare-datatypes ((tuple2!10544 0))(
  ( (tuple2!10545 (_1!5283 (_ BitVec 64)) (_2!5283 V!26393)) )
))
(declare-datatypes ((List!16403 0))(
  ( (Nil!16400) (Cons!16399 (h!17530 tuple2!10544) (t!22765 List!16403)) )
))
(declare-datatypes ((ListLongMap!9303 0))(
  ( (ListLongMap!9304 (toList!4667 List!16403)) )
))
(declare-fun call!37448 () ListLongMap!9303)

(declare-fun call!37449 () ListLongMap!9303)

(assert (=> b!847056 (= e!472662 (= call!37448 call!37449))))

(declare-fun mapNonEmpty!25613 () Bool)

(declare-fun tp!49123 () Bool)

(declare-fun e!472659 () Bool)

(assert (=> mapNonEmpty!25613 (= mapRes!25613 (and tp!49123 e!472659))))

(declare-fun mapKey!25613 () (_ BitVec 32))

(declare-fun mapValue!25613 () ValueCell!7565)

(declare-fun mapRest!25613 () (Array (_ BitVec 32) ValueCell!7565))

(assert (=> mapNonEmpty!25613 (= (arr!23146 _values!688) (store mapRest!25613 mapKey!25613 mapValue!25613))))

(declare-fun b!847057 () Bool)

(declare-fun res!575579 () Bool)

(assert (=> b!847057 (=> (not res!575579) (not e!472663))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847057 (= res!575579 (validMask!0 mask!1196))))

(declare-fun b!847058 () Bool)

(declare-fun res!575583 () Bool)

(assert (=> b!847058 (=> (not res!575583) (not e!472663))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847058 (= res!575583 (validKeyInArray!0 k0!854))))

(declare-fun b!847059 () Bool)

(declare-fun e!472665 () Bool)

(assert (=> b!847059 (= e!472665 (not true))))

(assert (=> b!847059 e!472662))

(declare-fun c!91415 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847059 (= c!91415 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26393)

(declare-fun zeroValue!654 () V!26393)

(declare-datatypes ((Unit!28881 0))(
  ( (Unit!28882) )
))
(declare-fun lt!381459 () Unit!28881)

(declare-fun v!557 () V!26393)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!315 (array!48227 array!48229 (_ BitVec 32) (_ BitVec 32) V!26393 V!26393 (_ BitVec 32) (_ BitVec 64) V!26393 (_ BitVec 32) Int) Unit!28881)

(assert (=> b!847059 (= lt!381459 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!315 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847060 () Bool)

(declare-fun res!575585 () Bool)

(assert (=> b!847060 (=> (not res!575585) (not e!472663))))

(assert (=> b!847060 (= res!575585 (and (= (select (arr!23145 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!37445 () Bool)

(declare-fun lt!381460 () array!48229)

(declare-fun getCurrentListMapNoExtraKeys!2681 (array!48227 array!48229 (_ BitVec 32) (_ BitVec 32) V!26393 V!26393 (_ BitVec 32) Int) ListLongMap!9303)

(assert (=> bm!37445 (= call!37448 (getCurrentListMapNoExtraKeys!2681 _keys!868 lt!381460 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847061 () Bool)

(declare-fun e!472664 () Bool)

(assert (=> b!847061 (= e!472660 (and e!472664 mapRes!25613))))

(declare-fun condMapEmpty!25613 () Bool)

(declare-fun mapDefault!25613 () ValueCell!7565)

(assert (=> b!847061 (= condMapEmpty!25613 (= (arr!23146 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7565)) mapDefault!25613)))))

(declare-fun b!847062 () Bool)

(declare-fun res!575578 () Bool)

(assert (=> b!847062 (=> (not res!575578) (not e!472663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48227 (_ BitVec 32)) Bool)

(assert (=> b!847062 (= res!575578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847063 () Bool)

(declare-fun res!575584 () Bool)

(assert (=> b!847063 (=> (not res!575584) (not e!472663))))

(assert (=> b!847063 (= res!575584 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23587 _keys!868))))))

(declare-fun bm!37446 () Bool)

(assert (=> bm!37446 (= call!37449 (getCurrentListMapNoExtraKeys!2681 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847064 () Bool)

(assert (=> b!847064 (= e!472664 tp_is_empty!16009)))

(declare-fun b!847065 () Bool)

(assert (=> b!847065 (= e!472659 tp_is_empty!16009)))

(declare-fun b!847066 () Bool)

(assert (=> b!847066 (= e!472663 e!472665)))

(declare-fun res!575581 () Bool)

(assert (=> b!847066 (=> (not res!575581) (not e!472665))))

(assert (=> b!847066 (= res!575581 (= from!1053 i!612))))

(declare-fun lt!381461 () ListLongMap!9303)

(assert (=> b!847066 (= lt!381461 (getCurrentListMapNoExtraKeys!2681 _keys!868 lt!381460 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!847066 (= lt!381460 (array!48230 (store (arr!23146 _values!688) i!612 (ValueCellFull!7565 v!557)) (size!23588 _values!688)))))

(declare-fun lt!381458 () ListLongMap!9303)

(assert (=> b!847066 (= lt!381458 (getCurrentListMapNoExtraKeys!2681 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847067 () Bool)

(declare-fun +!2100 (ListLongMap!9303 tuple2!10544) ListLongMap!9303)

(assert (=> b!847067 (= e!472662 (= call!37448 (+!2100 call!37449 (tuple2!10545 k0!854 v!557))))))

(declare-fun b!847068 () Bool)

(declare-fun res!575582 () Bool)

(assert (=> b!847068 (=> (not res!575582) (not e!472663))))

(assert (=> b!847068 (= res!575582 (and (= (size!23588 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23587 _keys!868) (size!23588 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72940 res!575586) b!847057))

(assert (= (and b!847057 res!575579) b!847068))

(assert (= (and b!847068 res!575582) b!847062))

(assert (= (and b!847062 res!575578) b!847055))

(assert (= (and b!847055 res!575580) b!847063))

(assert (= (and b!847063 res!575584) b!847058))

(assert (= (and b!847058 res!575583) b!847060))

(assert (= (and b!847060 res!575585) b!847066))

(assert (= (and b!847066 res!575581) b!847059))

(assert (= (and b!847059 c!91415) b!847067))

(assert (= (and b!847059 (not c!91415)) b!847056))

(assert (= (or b!847067 b!847056) bm!37445))

(assert (= (or b!847067 b!847056) bm!37446))

(assert (= (and b!847061 condMapEmpty!25613) mapIsEmpty!25613))

(assert (= (and b!847061 (not condMapEmpty!25613)) mapNonEmpty!25613))

(get-info :version)

(assert (= (and mapNonEmpty!25613 ((_ is ValueCellFull!7565) mapValue!25613)) b!847065))

(assert (= (and b!847061 ((_ is ValueCellFull!7565) mapDefault!25613)) b!847064))

(assert (= start!72940 b!847061))

(declare-fun m!787649 () Bool)

(assert (=> start!72940 m!787649))

(declare-fun m!787651 () Bool)

(assert (=> start!72940 m!787651))

(declare-fun m!787653 () Bool)

(assert (=> b!847059 m!787653))

(declare-fun m!787655 () Bool)

(assert (=> b!847057 m!787655))

(declare-fun m!787657 () Bool)

(assert (=> b!847055 m!787657))

(declare-fun m!787659 () Bool)

(assert (=> b!847066 m!787659))

(declare-fun m!787661 () Bool)

(assert (=> b!847066 m!787661))

(declare-fun m!787663 () Bool)

(assert (=> b!847066 m!787663))

(declare-fun m!787665 () Bool)

(assert (=> b!847062 m!787665))

(declare-fun m!787667 () Bool)

(assert (=> bm!37445 m!787667))

(declare-fun m!787669 () Bool)

(assert (=> bm!37446 m!787669))

(declare-fun m!787671 () Bool)

(assert (=> b!847067 m!787671))

(declare-fun m!787673 () Bool)

(assert (=> b!847060 m!787673))

(declare-fun m!787675 () Bool)

(assert (=> mapNonEmpty!25613 m!787675))

(declare-fun m!787677 () Bool)

(assert (=> b!847058 m!787677))

(check-sat (not b!847057) (not b!847062) (not bm!37445) (not b!847059) (not b!847058) (not b!847066) b_and!22933 (not mapNonEmpty!25613) tp_is_empty!16009 (not b!847055) (not bm!37446) (not b!847067) (not b_next!13873) (not start!72940))
(check-sat b_and!22933 (not b_next!13873))
