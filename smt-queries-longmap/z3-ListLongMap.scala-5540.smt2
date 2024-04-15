; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73006 () Bool)

(assert start!73006)

(declare-fun b_free!13939 () Bool)

(declare-fun b_next!13939 () Bool)

(assert (=> start!73006 (= b_free!13939 (not b_next!13939))))

(declare-fun tp!49321 () Bool)

(declare-fun b_and!23011 () Bool)

(assert (=> start!73006 (= tp!49321 b_and!23011)))

(declare-fun mapNonEmpty!25712 () Bool)

(declare-fun mapRes!25712 () Bool)

(declare-fun tp!49322 () Bool)

(declare-fun e!473382 () Bool)

(assert (=> mapNonEmpty!25712 (= mapRes!25712 (and tp!49322 e!473382))))

(declare-datatypes ((V!26481 0))(
  ( (V!26482 (val!8085 Int)) )
))
(declare-datatypes ((ValueCell!7598 0))(
  ( (ValueCellFull!7598 (v!10504 V!26481)) (EmptyCell!7598) )
))
(declare-fun mapRest!25712 () (Array (_ BitVec 32) ValueCell!7598))

(declare-fun mapKey!25712 () (_ BitVec 32))

(declare-fun mapValue!25712 () ValueCell!7598)

(declare-datatypes ((array!48357 0))(
  ( (array!48358 (arr!23210 (Array (_ BitVec 32) ValueCell!7598)) (size!23652 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48357)

(assert (=> mapNonEmpty!25712 (= (arr!23210 _values!688) (store mapRest!25712 mapKey!25712 mapValue!25712))))

(declare-fun b!848483 () Bool)

(declare-fun res!576502 () Bool)

(declare-fun e!473387 () Bool)

(assert (=> b!848483 (=> (not res!576502) (not e!473387))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848483 (= res!576502 (validKeyInArray!0 k0!854))))

(declare-fun b!848484 () Bool)

(declare-fun e!473381 () Bool)

(declare-datatypes ((tuple2!10606 0))(
  ( (tuple2!10607 (_1!5314 (_ BitVec 64)) (_2!5314 V!26481)) )
))
(declare-datatypes ((List!16455 0))(
  ( (Nil!16452) (Cons!16451 (h!17582 tuple2!10606) (t!22831 List!16455)) )
))
(declare-datatypes ((ListLongMap!9365 0))(
  ( (ListLongMap!9366 (toList!4698 List!16455)) )
))
(declare-fun call!37647 () ListLongMap!9365)

(declare-fun call!37646 () ListLongMap!9365)

(assert (=> b!848484 (= e!473381 (= call!37647 call!37646))))

(declare-fun b!848485 () Bool)

(declare-fun res!576500 () Bool)

(assert (=> b!848485 (=> (not res!576500) (not e!473387))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48359 0))(
  ( (array!48360 (arr!23211 (Array (_ BitVec 32) (_ BitVec 64))) (size!23653 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48359)

(assert (=> b!848485 (= res!576500 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23653 _keys!868))))))

(declare-fun v!557 () V!26481)

(declare-fun b!848486 () Bool)

(declare-fun +!2126 (ListLongMap!9365 tuple2!10606) ListLongMap!9365)

(assert (=> b!848486 (= e!473381 (= call!37647 (+!2126 call!37646 (tuple2!10607 k0!854 v!557))))))

(declare-fun b!848487 () Bool)

(declare-fun res!576503 () Bool)

(assert (=> b!848487 (=> (not res!576503) (not e!473387))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!848487 (= res!576503 (and (= (size!23652 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23653 _keys!868) (size!23652 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848488 () Bool)

(declare-fun e!473385 () Bool)

(declare-fun e!473386 () Bool)

(assert (=> b!848488 (= e!473385 (and e!473386 mapRes!25712))))

(declare-fun condMapEmpty!25712 () Bool)

(declare-fun mapDefault!25712 () ValueCell!7598)

(assert (=> b!848488 (= condMapEmpty!25712 (= (arr!23210 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7598)) mapDefault!25712)))))

(declare-fun b!848489 () Bool)

(declare-fun e!473383 () Bool)

(assert (=> b!848489 (= e!473383 true)))

(declare-fun lt!381855 () ListLongMap!9365)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!381857 () array!48357)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26481)

(declare-fun zeroValue!654 () V!26481)

(declare-fun getCurrentListMapNoExtraKeys!2708 (array!48359 array!48357 (_ BitVec 32) (_ BitVec 32) V!26481 V!26481 (_ BitVec 32) Int) ListLongMap!9365)

(declare-fun get!12220 (ValueCell!7598 V!26481) V!26481)

(declare-fun dynLambda!993 (Int (_ BitVec 64)) V!26481)

(assert (=> b!848489 (= lt!381855 (+!2126 (getCurrentListMapNoExtraKeys!2708 _keys!868 lt!381857 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10607 (select (arr!23211 _keys!868) from!1053) (get!12220 (select (arr!23210 lt!381857) from!1053) (dynLambda!993 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!848490 () Bool)

(declare-fun res!576507 () Bool)

(assert (=> b!848490 (=> (not res!576507) (not e!473387))))

(declare-datatypes ((List!16456 0))(
  ( (Nil!16453) (Cons!16452 (h!17583 (_ BitVec 64)) (t!22832 List!16456)) )
))
(declare-fun arrayNoDuplicates!0 (array!48359 (_ BitVec 32) List!16456) Bool)

(assert (=> b!848490 (= res!576507 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16453))))

(declare-fun res!576501 () Bool)

(assert (=> start!73006 (=> (not res!576501) (not e!473387))))

(assert (=> start!73006 (= res!576501 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23653 _keys!868))))))

(assert (=> start!73006 e!473387))

(declare-fun tp_is_empty!16075 () Bool)

(assert (=> start!73006 tp_is_empty!16075))

(assert (=> start!73006 true))

(assert (=> start!73006 tp!49321))

(declare-fun array_inv!18508 (array!48359) Bool)

(assert (=> start!73006 (array_inv!18508 _keys!868)))

(declare-fun array_inv!18509 (array!48357) Bool)

(assert (=> start!73006 (and (array_inv!18509 _values!688) e!473385)))

(declare-fun b!848482 () Bool)

(assert (=> b!848482 (= e!473382 tp_is_empty!16075)))

(declare-fun bm!37643 () Bool)

(assert (=> bm!37643 (= call!37647 (getCurrentListMapNoExtraKeys!2708 _keys!868 lt!381857 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848491 () Bool)

(assert (=> b!848491 (= e!473386 tp_is_empty!16075)))

(declare-fun mapIsEmpty!25712 () Bool)

(assert (=> mapIsEmpty!25712 mapRes!25712))

(declare-fun b!848492 () Bool)

(declare-fun e!473388 () Bool)

(assert (=> b!848492 (= e!473388 (not e!473383))))

(declare-fun res!576498 () Bool)

(assert (=> b!848492 (=> res!576498 e!473383)))

(assert (=> b!848492 (= res!576498 (not (validKeyInArray!0 (select (arr!23211 _keys!868) from!1053))))))

(assert (=> b!848492 e!473381))

(declare-fun c!91514 () Bool)

(assert (=> b!848492 (= c!91514 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28931 0))(
  ( (Unit!28932) )
))
(declare-fun lt!381856 () Unit!28931)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!340 (array!48359 array!48357 (_ BitVec 32) (_ BitVec 32) V!26481 V!26481 (_ BitVec 32) (_ BitVec 64) V!26481 (_ BitVec 32) Int) Unit!28931)

(assert (=> b!848492 (= lt!381856 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!340 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848493 () Bool)

(declare-fun res!576506 () Bool)

(assert (=> b!848493 (=> (not res!576506) (not e!473387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48359 (_ BitVec 32)) Bool)

(assert (=> b!848493 (= res!576506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848494 () Bool)

(declare-fun res!576505 () Bool)

(assert (=> b!848494 (=> (not res!576505) (not e!473387))))

(assert (=> b!848494 (= res!576505 (and (= (select (arr!23211 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848495 () Bool)

(declare-fun res!576504 () Bool)

(assert (=> b!848495 (=> (not res!576504) (not e!473387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848495 (= res!576504 (validMask!0 mask!1196))))

(declare-fun bm!37644 () Bool)

(assert (=> bm!37644 (= call!37646 (getCurrentListMapNoExtraKeys!2708 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848496 () Bool)

(assert (=> b!848496 (= e!473387 e!473388)))

(declare-fun res!576499 () Bool)

(assert (=> b!848496 (=> (not res!576499) (not e!473388))))

(assert (=> b!848496 (= res!576499 (= from!1053 i!612))))

(assert (=> b!848496 (= lt!381855 (getCurrentListMapNoExtraKeys!2708 _keys!868 lt!381857 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848496 (= lt!381857 (array!48358 (store (arr!23210 _values!688) i!612 (ValueCellFull!7598 v!557)) (size!23652 _values!688)))))

(declare-fun lt!381854 () ListLongMap!9365)

(assert (=> b!848496 (= lt!381854 (getCurrentListMapNoExtraKeys!2708 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73006 res!576501) b!848495))

(assert (= (and b!848495 res!576504) b!848487))

(assert (= (and b!848487 res!576503) b!848493))

(assert (= (and b!848493 res!576506) b!848490))

(assert (= (and b!848490 res!576507) b!848485))

(assert (= (and b!848485 res!576500) b!848483))

(assert (= (and b!848483 res!576502) b!848494))

(assert (= (and b!848494 res!576505) b!848496))

(assert (= (and b!848496 res!576499) b!848492))

(assert (= (and b!848492 c!91514) b!848486))

(assert (= (and b!848492 (not c!91514)) b!848484))

(assert (= (or b!848486 b!848484) bm!37643))

(assert (= (or b!848486 b!848484) bm!37644))

(assert (= (and b!848492 (not res!576498)) b!848489))

(assert (= (and b!848488 condMapEmpty!25712) mapIsEmpty!25712))

(assert (= (and b!848488 (not condMapEmpty!25712)) mapNonEmpty!25712))

(get-info :version)

(assert (= (and mapNonEmpty!25712 ((_ is ValueCellFull!7598) mapValue!25712)) b!848482))

(assert (= (and b!848488 ((_ is ValueCellFull!7598) mapDefault!25712)) b!848491))

(assert (= start!73006 b!848488))

(declare-fun b_lambda!11453 () Bool)

(assert (=> (not b_lambda!11453) (not b!848489)))

(declare-fun t!22830 () Bool)

(declare-fun tb!4233 () Bool)

(assert (=> (and start!73006 (= defaultEntry!696 defaultEntry!696) t!22830) tb!4233))

(declare-fun result!8085 () Bool)

(assert (=> tb!4233 (= result!8085 tp_is_empty!16075)))

(assert (=> b!848489 t!22830))

(declare-fun b_and!23013 () Bool)

(assert (= b_and!23011 (and (=> t!22830 result!8085) b_and!23013)))

(declare-fun m!788723 () Bool)

(assert (=> b!848490 m!788723))

(declare-fun m!788725 () Bool)

(assert (=> bm!37643 m!788725))

(declare-fun m!788727 () Bool)

(assert (=> bm!37644 m!788727))

(declare-fun m!788729 () Bool)

(assert (=> start!73006 m!788729))

(declare-fun m!788731 () Bool)

(assert (=> start!73006 m!788731))

(declare-fun m!788733 () Bool)

(assert (=> b!848493 m!788733))

(declare-fun m!788735 () Bool)

(assert (=> b!848492 m!788735))

(assert (=> b!848492 m!788735))

(declare-fun m!788737 () Bool)

(assert (=> b!848492 m!788737))

(declare-fun m!788739 () Bool)

(assert (=> b!848492 m!788739))

(declare-fun m!788741 () Bool)

(assert (=> b!848494 m!788741))

(declare-fun m!788743 () Bool)

(assert (=> b!848486 m!788743))

(declare-fun m!788745 () Bool)

(assert (=> b!848483 m!788745))

(declare-fun m!788747 () Bool)

(assert (=> mapNonEmpty!25712 m!788747))

(declare-fun m!788749 () Bool)

(assert (=> b!848489 m!788749))

(assert (=> b!848489 m!788749))

(declare-fun m!788751 () Bool)

(assert (=> b!848489 m!788751))

(declare-fun m!788753 () Bool)

(assert (=> b!848489 m!788753))

(assert (=> b!848489 m!788725))

(declare-fun m!788755 () Bool)

(assert (=> b!848489 m!788755))

(assert (=> b!848489 m!788735))

(assert (=> b!848489 m!788751))

(assert (=> b!848489 m!788725))

(declare-fun m!788757 () Bool)

(assert (=> b!848495 m!788757))

(declare-fun m!788759 () Bool)

(assert (=> b!848496 m!788759))

(declare-fun m!788761 () Bool)

(assert (=> b!848496 m!788761))

(declare-fun m!788763 () Bool)

(assert (=> b!848496 m!788763))

(check-sat (not b!848490) (not mapNonEmpty!25712) (not b!848495) (not b_lambda!11453) (not b!848496) (not bm!37643) tp_is_empty!16075 (not b!848483) (not start!73006) (not b!848486) (not b!848492) (not b_next!13939) b_and!23013 (not bm!37644) (not b!848493) (not b!848489))
(check-sat b_and!23013 (not b_next!13939))
