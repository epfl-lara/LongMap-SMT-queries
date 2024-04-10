; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73182 () Bool)

(assert start!73182)

(declare-fun b_free!14097 () Bool)

(declare-fun b_next!14097 () Bool)

(assert (=> start!73182 (= b_free!14097 (not b_next!14097))))

(declare-fun tp!49794 () Bool)

(declare-fun b_and!23353 () Bool)

(assert (=> start!73182 (= tp!49794 b_and!23353)))

(declare-fun mapIsEmpty!25949 () Bool)

(declare-fun mapRes!25949 () Bool)

(assert (=> mapIsEmpty!25949 mapRes!25949))

(declare-fun b!852434 () Bool)

(declare-fun res!578981 () Bool)

(declare-fun e!475428 () Bool)

(assert (=> b!852434 (=> (not res!578981) (not e!475428))))

(declare-datatypes ((array!48664 0))(
  ( (array!48665 (arr!23363 (Array (_ BitVec 32) (_ BitVec 64))) (size!23803 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48664)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48664 (_ BitVec 32)) Bool)

(assert (=> b!852434 (= res!578981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852435 () Bool)

(declare-fun e!475427 () Bool)

(declare-fun tp_is_empty!16233 () Bool)

(assert (=> b!852435 (= e!475427 tp_is_empty!16233)))

(declare-fun bm!38143 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26691 0))(
  ( (V!26692 (val!8164 Int)) )
))
(declare-datatypes ((tuple2!10722 0))(
  ( (tuple2!10723 (_1!5372 (_ BitVec 64)) (_2!5372 V!26691)) )
))
(declare-datatypes ((List!16555 0))(
  ( (Nil!16552) (Cons!16551 (h!17682 tuple2!10722) (t!23098 List!16555)) )
))
(declare-datatypes ((ListLongMap!9491 0))(
  ( (ListLongMap!9492 (toList!4761 List!16555)) )
))
(declare-fun call!38147 () ListLongMap!9491)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7677 0))(
  ( (ValueCellFull!7677 (v!10589 V!26691)) (EmptyCell!7677) )
))
(declare-datatypes ((array!48666 0))(
  ( (array!48667 (arr!23364 (Array (_ BitVec 32) ValueCell!7677)) (size!23804 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48666)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26691)

(declare-fun zeroValue!654 () V!26691)

(declare-fun getCurrentListMapNoExtraKeys!2743 (array!48664 array!48666 (_ BitVec 32) (_ BitVec 32) V!26691 V!26691 (_ BitVec 32) Int) ListLongMap!9491)

(assert (=> bm!38143 (= call!38147 (getCurrentListMapNoExtraKeys!2743 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38144 () Bool)

(declare-fun call!38146 () ListLongMap!9491)

(declare-fun lt!384095 () array!48666)

(assert (=> bm!38144 (= call!38146 (getCurrentListMapNoExtraKeys!2743 _keys!868 lt!384095 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852436 () Bool)

(declare-fun e!475432 () Bool)

(assert (=> b!852436 (= e!475432 (and e!475427 mapRes!25949))))

(declare-fun condMapEmpty!25949 () Bool)

(declare-fun mapDefault!25949 () ValueCell!7677)

(assert (=> b!852436 (= condMapEmpty!25949 (= (arr!23364 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7677)) mapDefault!25949)))))

(declare-fun b!852437 () Bool)

(declare-fun e!475430 () Bool)

(assert (=> b!852437 (= e!475430 tp_is_empty!16233)))

(declare-fun v!557 () V!26691)

(declare-fun b!852438 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun e!475425 () Bool)

(declare-fun +!2158 (ListLongMap!9491 tuple2!10722) ListLongMap!9491)

(assert (=> b!852438 (= e!475425 (= call!38146 (+!2158 call!38147 (tuple2!10723 k0!854 v!557))))))

(declare-fun b!852439 () Bool)

(declare-fun res!578986 () Bool)

(assert (=> b!852439 (=> (not res!578986) (not e!475428))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852439 (= res!578986 (and (= (select (arr!23363 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!25949 () Bool)

(declare-fun tp!49795 () Bool)

(assert (=> mapNonEmpty!25949 (= mapRes!25949 (and tp!49795 e!475430))))

(declare-fun mapValue!25949 () ValueCell!7677)

(declare-fun mapKey!25949 () (_ BitVec 32))

(declare-fun mapRest!25949 () (Array (_ BitVec 32) ValueCell!7677))

(assert (=> mapNonEmpty!25949 (= (arr!23364 _values!688) (store mapRest!25949 mapKey!25949 mapValue!25949))))

(declare-fun b!852440 () Bool)

(declare-fun e!475426 () Bool)

(assert (=> b!852440 (= e!475428 e!475426)))

(declare-fun res!578985 () Bool)

(assert (=> b!852440 (=> (not res!578985) (not e!475426))))

(assert (=> b!852440 (= res!578985 (= from!1053 i!612))))

(declare-fun lt!384103 () ListLongMap!9491)

(assert (=> b!852440 (= lt!384103 (getCurrentListMapNoExtraKeys!2743 _keys!868 lt!384095 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852440 (= lt!384095 (array!48667 (store (arr!23364 _values!688) i!612 (ValueCellFull!7677 v!557)) (size!23804 _values!688)))))

(declare-fun lt!384097 () ListLongMap!9491)

(assert (=> b!852440 (= lt!384097 (getCurrentListMapNoExtraKeys!2743 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852441 () Bool)

(declare-fun e!475431 () Bool)

(assert (=> b!852441 (= e!475426 (not e!475431))))

(declare-fun res!578980 () Bool)

(assert (=> b!852441 (=> res!578980 e!475431)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852441 (= res!578980 (not (validKeyInArray!0 (select (arr!23363 _keys!868) from!1053))))))

(assert (=> b!852441 e!475425))

(declare-fun c!91816 () Bool)

(assert (=> b!852441 (= c!91816 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29099 0))(
  ( (Unit!29100) )
))
(declare-fun lt!384100 () Unit!29099)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!389 (array!48664 array!48666 (_ BitVec 32) (_ BitVec 32) V!26691 V!26691 (_ BitVec 32) (_ BitVec 64) V!26691 (_ BitVec 32) Int) Unit!29099)

(assert (=> b!852441 (= lt!384100 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!389 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852442 () Bool)

(declare-fun res!578983 () Bool)

(assert (=> b!852442 (=> (not res!578983) (not e!475428))))

(assert (=> b!852442 (= res!578983 (validKeyInArray!0 k0!854))))

(declare-fun b!852443 () Bool)

(assert (=> b!852443 (= e!475431 true)))

(declare-fun lt!384098 () V!26691)

(declare-fun lt!384099 () ListLongMap!9491)

(declare-fun lt!384096 () tuple2!10722)

(assert (=> b!852443 (= (+!2158 lt!384099 lt!384096) (+!2158 (+!2158 lt!384099 (tuple2!10723 k0!854 lt!384098)) lt!384096))))

(declare-fun lt!384102 () V!26691)

(assert (=> b!852443 (= lt!384096 (tuple2!10723 k0!854 lt!384102))))

(declare-fun lt!384094 () Unit!29099)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!286 (ListLongMap!9491 (_ BitVec 64) V!26691 V!26691) Unit!29099)

(assert (=> b!852443 (= lt!384094 (addSameAsAddTwiceSameKeyDiffValues!286 lt!384099 k0!854 lt!384098 lt!384102))))

(declare-fun lt!384101 () V!26691)

(declare-fun get!12316 (ValueCell!7677 V!26691) V!26691)

(assert (=> b!852443 (= lt!384098 (get!12316 (select (arr!23364 _values!688) from!1053) lt!384101))))

(assert (=> b!852443 (= lt!384103 (+!2158 lt!384099 (tuple2!10723 (select (arr!23363 _keys!868) from!1053) lt!384102)))))

(assert (=> b!852443 (= lt!384102 (get!12316 (select (store (arr!23364 _values!688) i!612 (ValueCellFull!7677 v!557)) from!1053) lt!384101))))

(declare-fun dynLambda!1040 (Int (_ BitVec 64)) V!26691)

(assert (=> b!852443 (= lt!384101 (dynLambda!1040 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852443 (= lt!384099 (getCurrentListMapNoExtraKeys!2743 _keys!868 lt!384095 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852444 () Bool)

(assert (=> b!852444 (= e!475425 (= call!38146 call!38147))))

(declare-fun b!852445 () Bool)

(declare-fun res!578979 () Bool)

(assert (=> b!852445 (=> (not res!578979) (not e!475428))))

(assert (=> b!852445 (= res!578979 (and (= (size!23804 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23803 _keys!868) (size!23804 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852446 () Bool)

(declare-fun res!578982 () Bool)

(assert (=> b!852446 (=> (not res!578982) (not e!475428))))

(assert (=> b!852446 (= res!578982 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23803 _keys!868))))))

(declare-fun b!852448 () Bool)

(declare-fun res!578984 () Bool)

(assert (=> b!852448 (=> (not res!578984) (not e!475428))))

(declare-datatypes ((List!16556 0))(
  ( (Nil!16553) (Cons!16552 (h!17683 (_ BitVec 64)) (t!23099 List!16556)) )
))
(declare-fun arrayNoDuplicates!0 (array!48664 (_ BitVec 32) List!16556) Bool)

(assert (=> b!852448 (= res!578984 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16553))))

(declare-fun b!852447 () Bool)

(declare-fun res!578987 () Bool)

(assert (=> b!852447 (=> (not res!578987) (not e!475428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852447 (= res!578987 (validMask!0 mask!1196))))

(declare-fun res!578978 () Bool)

(assert (=> start!73182 (=> (not res!578978) (not e!475428))))

(assert (=> start!73182 (= res!578978 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23803 _keys!868))))))

(assert (=> start!73182 e!475428))

(assert (=> start!73182 tp_is_empty!16233))

(assert (=> start!73182 true))

(assert (=> start!73182 tp!49794))

(declare-fun array_inv!18532 (array!48664) Bool)

(assert (=> start!73182 (array_inv!18532 _keys!868)))

(declare-fun array_inv!18533 (array!48666) Bool)

(assert (=> start!73182 (and (array_inv!18533 _values!688) e!475432)))

(assert (= (and start!73182 res!578978) b!852447))

(assert (= (and b!852447 res!578987) b!852445))

(assert (= (and b!852445 res!578979) b!852434))

(assert (= (and b!852434 res!578981) b!852448))

(assert (= (and b!852448 res!578984) b!852446))

(assert (= (and b!852446 res!578982) b!852442))

(assert (= (and b!852442 res!578983) b!852439))

(assert (= (and b!852439 res!578986) b!852440))

(assert (= (and b!852440 res!578985) b!852441))

(assert (= (and b!852441 c!91816) b!852438))

(assert (= (and b!852441 (not c!91816)) b!852444))

(assert (= (or b!852438 b!852444) bm!38144))

(assert (= (or b!852438 b!852444) bm!38143))

(assert (= (and b!852441 (not res!578980)) b!852443))

(assert (= (and b!852436 condMapEmpty!25949) mapIsEmpty!25949))

(assert (= (and b!852436 (not condMapEmpty!25949)) mapNonEmpty!25949))

(get-info :version)

(assert (= (and mapNonEmpty!25949 ((_ is ValueCellFull!7677) mapValue!25949)) b!852437))

(assert (= (and b!852436 ((_ is ValueCellFull!7677) mapDefault!25949)) b!852435))

(assert (= start!73182 b!852436))

(declare-fun b_lambda!11629 () Bool)

(assert (=> (not b_lambda!11629) (not b!852443)))

(declare-fun t!23097 () Bool)

(declare-fun tb!4399 () Bool)

(assert (=> (and start!73182 (= defaultEntry!696 defaultEntry!696) t!23097) tb!4399))

(declare-fun result!8409 () Bool)

(assert (=> tb!4399 (= result!8409 tp_is_empty!16233)))

(assert (=> b!852443 t!23097))

(declare-fun b_and!23355 () Bool)

(assert (= b_and!23353 (and (=> t!23097 result!8409) b_and!23355)))

(declare-fun m!793495 () Bool)

(assert (=> b!852434 m!793495))

(declare-fun m!793497 () Bool)

(assert (=> b!852441 m!793497))

(assert (=> b!852441 m!793497))

(declare-fun m!793499 () Bool)

(assert (=> b!852441 m!793499))

(declare-fun m!793501 () Bool)

(assert (=> b!852441 m!793501))

(declare-fun m!793503 () Bool)

(assert (=> start!73182 m!793503))

(declare-fun m!793505 () Bool)

(assert (=> start!73182 m!793505))

(declare-fun m!793507 () Bool)

(assert (=> mapNonEmpty!25949 m!793507))

(declare-fun m!793509 () Bool)

(assert (=> b!852443 m!793509))

(declare-fun m!793511 () Bool)

(assert (=> b!852443 m!793511))

(declare-fun m!793513 () Bool)

(assert (=> b!852443 m!793513))

(declare-fun m!793515 () Bool)

(assert (=> b!852443 m!793515))

(declare-fun m!793517 () Bool)

(assert (=> b!852443 m!793517))

(declare-fun m!793519 () Bool)

(assert (=> b!852443 m!793519))

(assert (=> b!852443 m!793509))

(declare-fun m!793521 () Bool)

(assert (=> b!852443 m!793521))

(assert (=> b!852443 m!793517))

(declare-fun m!793523 () Bool)

(assert (=> b!852443 m!793523))

(assert (=> b!852443 m!793497))

(declare-fun m!793525 () Bool)

(assert (=> b!852443 m!793525))

(assert (=> b!852443 m!793515))

(declare-fun m!793527 () Bool)

(assert (=> b!852443 m!793527))

(declare-fun m!793529 () Bool)

(assert (=> b!852443 m!793529))

(declare-fun m!793531 () Bool)

(assert (=> b!852443 m!793531))

(declare-fun m!793533 () Bool)

(assert (=> b!852440 m!793533))

(assert (=> b!852440 m!793523))

(declare-fun m!793535 () Bool)

(assert (=> b!852440 m!793535))

(declare-fun m!793537 () Bool)

(assert (=> b!852442 m!793537))

(declare-fun m!793539 () Bool)

(assert (=> b!852438 m!793539))

(declare-fun m!793541 () Bool)

(assert (=> b!852448 m!793541))

(declare-fun m!793543 () Bool)

(assert (=> bm!38143 m!793543))

(assert (=> bm!38144 m!793521))

(declare-fun m!793545 () Bool)

(assert (=> b!852447 m!793545))

(declare-fun m!793547 () Bool)

(assert (=> b!852439 m!793547))

(check-sat tp_is_empty!16233 (not b!852443) b_and!23355 (not b!852448) (not bm!38144) (not start!73182) (not mapNonEmpty!25949) (not b!852441) (not b!852447) (not b!852438) (not b!852434) (not bm!38143) (not b!852442) (not b_next!14097) (not b!852440) (not b_lambda!11629))
(check-sat b_and!23355 (not b_next!14097))
