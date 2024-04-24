; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73660 () Bool)

(assert start!73660)

(declare-fun b_free!14407 () Bool)

(declare-fun b_next!14407 () Bool)

(assert (=> start!73660 (= b_free!14407 (not b_next!14407))))

(declare-fun tp!50725 () Bool)

(declare-fun b_and!23803 () Bool)

(assert (=> start!73660 (= tp!50725 b_and!23803)))

(declare-fun res!583606 () Bool)

(declare-fun e!479046 () Bool)

(assert (=> start!73660 (=> (not res!583606) (not e!479046))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49317 0))(
  ( (array!49318 (arr!23685 (Array (_ BitVec 32) (_ BitVec 64))) (size!24126 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49317)

(assert (=> start!73660 (= res!583606 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24126 _keys!868))))))

(assert (=> start!73660 e!479046))

(declare-fun tp_is_empty!16543 () Bool)

(assert (=> start!73660 tp_is_empty!16543))

(assert (=> start!73660 true))

(assert (=> start!73660 tp!50725))

(declare-fun array_inv!18804 (array!49317) Bool)

(assert (=> start!73660 (array_inv!18804 _keys!868)))

(declare-datatypes ((V!27105 0))(
  ( (V!27106 (val!8319 Int)) )
))
(declare-datatypes ((ValueCell!7832 0))(
  ( (ValueCellFull!7832 (v!10744 V!27105)) (EmptyCell!7832) )
))
(declare-datatypes ((array!49319 0))(
  ( (array!49320 (arr!23686 (Array (_ BitVec 32) ValueCell!7832)) (size!24127 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49319)

(declare-fun e!479044 () Bool)

(declare-fun array_inv!18805 (array!49319) Bool)

(assert (=> start!73660 (and (array_inv!18805 _values!688) e!479044)))

(declare-fun b!859441 () Bool)

(declare-fun e!479050 () Bool)

(assert (=> b!859441 (= e!479046 e!479050)))

(declare-fun res!583608 () Bool)

(assert (=> b!859441 (=> (not res!583608) (not e!479050))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859441 (= res!583608 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!10906 0))(
  ( (tuple2!10907 (_1!5464 (_ BitVec 64)) (_2!5464 V!27105)) )
))
(declare-datatypes ((List!16745 0))(
  ( (Nil!16742) (Cons!16741 (h!17878 tuple2!10906) (t!23410 List!16745)) )
))
(declare-datatypes ((ListLongMap!9677 0))(
  ( (ListLongMap!9678 (toList!4854 List!16745)) )
))
(declare-fun lt!387135 () ListLongMap!9677)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387134 () array!49319)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27105)

(declare-fun zeroValue!654 () V!27105)

(declare-fun getCurrentListMapNoExtraKeys!2910 (array!49317 array!49319 (_ BitVec 32) (_ BitVec 32) V!27105 V!27105 (_ BitVec 32) Int) ListLongMap!9677)

(assert (=> b!859441 (= lt!387135 (getCurrentListMapNoExtraKeys!2910 _keys!868 lt!387134 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27105)

(assert (=> b!859441 (= lt!387134 (array!49320 (store (arr!23686 _values!688) i!612 (ValueCellFull!7832 v!557)) (size!24127 _values!688)))))

(declare-fun lt!387130 () ListLongMap!9677)

(assert (=> b!859441 (= lt!387130 (getCurrentListMapNoExtraKeys!2910 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859442 () Bool)

(declare-fun res!583613 () Bool)

(assert (=> b!859442 (=> (not res!583613) (not e!479046))))

(assert (=> b!859442 (= res!583613 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24126 _keys!868))))))

(declare-fun b!859443 () Bool)

(declare-fun res!583615 () Bool)

(assert (=> b!859443 (=> (not res!583615) (not e!479046))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859443 (= res!583615 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26414 () Bool)

(declare-fun mapRes!26414 () Bool)

(assert (=> mapIsEmpty!26414 mapRes!26414))

(declare-fun b!859444 () Bool)

(declare-fun res!583614 () Bool)

(assert (=> b!859444 (=> (not res!583614) (not e!479046))))

(declare-datatypes ((List!16746 0))(
  ( (Nil!16743) (Cons!16742 (h!17879 (_ BitVec 64)) (t!23411 List!16746)) )
))
(declare-fun arrayNoDuplicates!0 (array!49317 (_ BitVec 32) List!16746) Bool)

(assert (=> b!859444 (= res!583614 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16743))))

(declare-fun b!859445 () Bool)

(declare-fun e!479049 () Bool)

(declare-fun e!479048 () Bool)

(assert (=> b!859445 (= e!479049 e!479048)))

(declare-fun res!583610 () Bool)

(assert (=> b!859445 (=> res!583610 e!479048)))

(assert (=> b!859445 (= res!583610 (not (= (select (arr!23685 _keys!868) from!1053) k0!854)))))

(declare-fun lt!387137 () ListLongMap!9677)

(declare-fun +!2260 (ListLongMap!9677 tuple2!10906) ListLongMap!9677)

(declare-fun get!12480 (ValueCell!7832 V!27105) V!27105)

(declare-fun dynLambda!1094 (Int (_ BitVec 64)) V!27105)

(assert (=> b!859445 (= lt!387135 (+!2260 lt!387137 (tuple2!10907 (select (arr!23685 _keys!868) from!1053) (get!12480 (select (arr!23686 _values!688) from!1053) (dynLambda!1094 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859446 () Bool)

(assert (=> b!859446 (= e!479050 (not e!479049))))

(declare-fun res!583605 () Bool)

(assert (=> b!859446 (=> res!583605 e!479049)))

(assert (=> b!859446 (= res!583605 (not (validKeyInArray!0 (select (arr!23685 _keys!868) from!1053))))))

(declare-fun lt!387136 () ListLongMap!9677)

(assert (=> b!859446 (= lt!387136 lt!387137)))

(declare-fun lt!387131 () ListLongMap!9677)

(assert (=> b!859446 (= lt!387137 (+!2260 lt!387131 (tuple2!10907 k0!854 v!557)))))

(assert (=> b!859446 (= lt!387136 (getCurrentListMapNoExtraKeys!2910 _keys!868 lt!387134 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859446 (= lt!387131 (getCurrentListMapNoExtraKeys!2910 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29272 0))(
  ( (Unit!29273) )
))
(declare-fun lt!387132 () Unit!29272)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!456 (array!49317 array!49319 (_ BitVec 32) (_ BitVec 32) V!27105 V!27105 (_ BitVec 32) (_ BitVec 64) V!27105 (_ BitVec 32) Int) Unit!29272)

(assert (=> b!859446 (= lt!387132 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!456 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859447 () Bool)

(declare-fun res!583607 () Bool)

(assert (=> b!859447 (=> (not res!583607) (not e!479046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49317 (_ BitVec 32)) Bool)

(assert (=> b!859447 (= res!583607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859448 () Bool)

(declare-fun e!479043 () Bool)

(assert (=> b!859448 (= e!479044 (and e!479043 mapRes!26414))))

(declare-fun condMapEmpty!26414 () Bool)

(declare-fun mapDefault!26414 () ValueCell!7832)

(assert (=> b!859448 (= condMapEmpty!26414 (= (arr!23686 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7832)) mapDefault!26414)))))

(declare-fun b!859449 () Bool)

(declare-fun res!583611 () Bool)

(assert (=> b!859449 (=> (not res!583611) (not e!479046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859449 (= res!583611 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26414 () Bool)

(declare-fun tp!50726 () Bool)

(declare-fun e!479045 () Bool)

(assert (=> mapNonEmpty!26414 (= mapRes!26414 (and tp!50726 e!479045))))

(declare-fun mapRest!26414 () (Array (_ BitVec 32) ValueCell!7832))

(declare-fun mapValue!26414 () ValueCell!7832)

(declare-fun mapKey!26414 () (_ BitVec 32))

(assert (=> mapNonEmpty!26414 (= (arr!23686 _values!688) (store mapRest!26414 mapKey!26414 mapValue!26414))))

(declare-fun b!859450 () Bool)

(assert (=> b!859450 (= e!479043 tp_is_empty!16543)))

(declare-fun b!859451 () Bool)

(declare-fun res!583612 () Bool)

(assert (=> b!859451 (=> (not res!583612) (not e!479046))))

(assert (=> b!859451 (= res!583612 (and (= (select (arr!23685 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859452 () Bool)

(assert (=> b!859452 (= e!479045 tp_is_empty!16543)))

(declare-fun b!859453 () Bool)

(assert (=> b!859453 (= e!479048 true)))

(assert (=> b!859453 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16743)))

(declare-fun lt!387133 () Unit!29272)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49317 (_ BitVec 32) (_ BitVec 32)) Unit!29272)

(assert (=> b!859453 (= lt!387133 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859454 () Bool)

(declare-fun res!583609 () Bool)

(assert (=> b!859454 (=> (not res!583609) (not e!479046))))

(assert (=> b!859454 (= res!583609 (and (= (size!24127 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24126 _keys!868) (size!24127 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73660 res!583606) b!859449))

(assert (= (and b!859449 res!583611) b!859454))

(assert (= (and b!859454 res!583609) b!859447))

(assert (= (and b!859447 res!583607) b!859444))

(assert (= (and b!859444 res!583614) b!859442))

(assert (= (and b!859442 res!583613) b!859443))

(assert (= (and b!859443 res!583615) b!859451))

(assert (= (and b!859451 res!583612) b!859441))

(assert (= (and b!859441 res!583608) b!859446))

(assert (= (and b!859446 (not res!583605)) b!859445))

(assert (= (and b!859445 (not res!583610)) b!859453))

(assert (= (and b!859448 condMapEmpty!26414) mapIsEmpty!26414))

(assert (= (and b!859448 (not condMapEmpty!26414)) mapNonEmpty!26414))

(get-info :version)

(assert (= (and mapNonEmpty!26414 ((_ is ValueCellFull!7832) mapValue!26414)) b!859452))

(assert (= (and b!859448 ((_ is ValueCellFull!7832) mapDefault!26414)) b!859450))

(assert (= start!73660 b!859448))

(declare-fun b_lambda!11773 () Bool)

(assert (=> (not b_lambda!11773) (not b!859445)))

(declare-fun t!23409 () Bool)

(declare-fun tb!4521 () Bool)

(assert (=> (and start!73660 (= defaultEntry!696 defaultEntry!696) t!23409) tb!4521))

(declare-fun result!8661 () Bool)

(assert (=> tb!4521 (= result!8661 tp_is_empty!16543)))

(assert (=> b!859445 t!23409))

(declare-fun b_and!23805 () Bool)

(assert (= b_and!23803 (and (=> t!23409 result!8661) b_and!23805)))

(declare-fun m!800543 () Bool)

(assert (=> b!859441 m!800543))

(declare-fun m!800545 () Bool)

(assert (=> b!859441 m!800545))

(declare-fun m!800547 () Bool)

(assert (=> b!859441 m!800547))

(declare-fun m!800549 () Bool)

(assert (=> b!859453 m!800549))

(declare-fun m!800551 () Bool)

(assert (=> b!859453 m!800551))

(declare-fun m!800553 () Bool)

(assert (=> b!859444 m!800553))

(declare-fun m!800555 () Bool)

(assert (=> b!859451 m!800555))

(declare-fun m!800557 () Bool)

(assert (=> b!859447 m!800557))

(declare-fun m!800559 () Bool)

(assert (=> b!859445 m!800559))

(declare-fun m!800561 () Bool)

(assert (=> b!859445 m!800561))

(declare-fun m!800563 () Bool)

(assert (=> b!859445 m!800563))

(declare-fun m!800565 () Bool)

(assert (=> b!859445 m!800565))

(assert (=> b!859445 m!800561))

(declare-fun m!800567 () Bool)

(assert (=> b!859445 m!800567))

(assert (=> b!859445 m!800563))

(declare-fun m!800569 () Bool)

(assert (=> b!859446 m!800569))

(declare-fun m!800571 () Bool)

(assert (=> b!859446 m!800571))

(assert (=> b!859446 m!800567))

(declare-fun m!800573 () Bool)

(assert (=> b!859446 m!800573))

(assert (=> b!859446 m!800567))

(declare-fun m!800575 () Bool)

(assert (=> b!859446 m!800575))

(declare-fun m!800577 () Bool)

(assert (=> b!859446 m!800577))

(declare-fun m!800579 () Bool)

(assert (=> mapNonEmpty!26414 m!800579))

(declare-fun m!800581 () Bool)

(assert (=> b!859449 m!800581))

(declare-fun m!800583 () Bool)

(assert (=> b!859443 m!800583))

(declare-fun m!800585 () Bool)

(assert (=> start!73660 m!800585))

(declare-fun m!800587 () Bool)

(assert (=> start!73660 m!800587))

(check-sat b_and!23805 (not b!859446) (not b!859441) (not b!859453) (not b!859449) (not b_next!14407) (not start!73660) (not b!859444) (not mapNonEmpty!26414) (not b!859443) (not b!859447) (not b!859445) tp_is_empty!16543 (not b_lambda!11773))
(check-sat b_and!23805 (not b_next!14407))
