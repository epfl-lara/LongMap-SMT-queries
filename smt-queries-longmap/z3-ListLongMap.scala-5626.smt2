; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73708 () Bool)

(assert start!73708)

(declare-fun b_free!14455 () Bool)

(declare-fun b_next!14455 () Bool)

(assert (=> start!73708 (= b_free!14455 (not b_next!14455))))

(declare-fun tp!50869 () Bool)

(declare-fun b_and!23899 () Bool)

(assert (=> start!73708 (= tp!50869 b_and!23899)))

(declare-fun b!860557 () Bool)

(declare-fun e!479643 () Bool)

(declare-fun e!479647 () Bool)

(assert (=> b!860557 (= e!479643 e!479647)))

(declare-fun res!584459 () Bool)

(assert (=> b!860557 (=> (not res!584459) (not e!479647))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860557 (= res!584459 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27169 0))(
  ( (V!27170 (val!8343 Int)) )
))
(declare-datatypes ((ValueCell!7856 0))(
  ( (ValueCellFull!7856 (v!10768 V!27169)) (EmptyCell!7856) )
))
(declare-datatypes ((array!49411 0))(
  ( (array!49412 (arr!23732 (Array (_ BitVec 32) ValueCell!7856)) (size!24173 (_ BitVec 32))) )
))
(declare-fun lt!387755 () array!49411)

(declare-datatypes ((tuple2!10944 0))(
  ( (tuple2!10945 (_1!5483 (_ BitVec 64)) (_2!5483 V!27169)) )
))
(declare-datatypes ((List!16784 0))(
  ( (Nil!16781) (Cons!16780 (h!17917 tuple2!10944) (t!23497 List!16784)) )
))
(declare-datatypes ((ListLongMap!9715 0))(
  ( (ListLongMap!9716 (toList!4873 List!16784)) )
))
(declare-fun lt!387751 () ListLongMap!9715)

(declare-fun minValue!654 () V!27169)

(declare-fun zeroValue!654 () V!27169)

(declare-datatypes ((array!49413 0))(
  ( (array!49414 (arr!23733 (Array (_ BitVec 32) (_ BitVec 64))) (size!24174 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49413)

(declare-fun getCurrentListMapNoExtraKeys!2927 (array!49413 array!49411 (_ BitVec 32) (_ BitVec 32) V!27169 V!27169 (_ BitVec 32) Int) ListLongMap!9715)

(assert (=> b!860557 (= lt!387751 (getCurrentListMapNoExtraKeys!2927 _keys!868 lt!387755 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27169)

(declare-fun _values!688 () array!49411)

(assert (=> b!860557 (= lt!387755 (array!49412 (store (arr!23732 _values!688) i!612 (ValueCellFull!7856 v!557)) (size!24173 _values!688)))))

(declare-fun lt!387750 () ListLongMap!9715)

(assert (=> b!860557 (= lt!387750 (getCurrentListMapNoExtraKeys!2927 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860558 () Bool)

(declare-fun res!584462 () Bool)

(assert (=> b!860558 (=> (not res!584462) (not e!479643))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!860558 (= res!584462 (and (= (select (arr!23733 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860559 () Bool)

(declare-fun res!584465 () Bool)

(assert (=> b!860559 (=> (not res!584465) (not e!479643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860559 (= res!584465 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26486 () Bool)

(declare-fun mapRes!26486 () Bool)

(declare-fun tp!50870 () Bool)

(declare-fun e!479644 () Bool)

(assert (=> mapNonEmpty!26486 (= mapRes!26486 (and tp!50870 e!479644))))

(declare-fun mapValue!26486 () ValueCell!7856)

(declare-fun mapKey!26486 () (_ BitVec 32))

(declare-fun mapRest!26486 () (Array (_ BitVec 32) ValueCell!7856))

(assert (=> mapNonEmpty!26486 (= (arr!23732 _values!688) (store mapRest!26486 mapKey!26486 mapValue!26486))))

(declare-fun b!860560 () Bool)

(declare-fun e!479645 () Bool)

(declare-fun e!479642 () Bool)

(assert (=> b!860560 (= e!479645 (and e!479642 mapRes!26486))))

(declare-fun condMapEmpty!26486 () Bool)

(declare-fun mapDefault!26486 () ValueCell!7856)

(assert (=> b!860560 (= condMapEmpty!26486 (= (arr!23732 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7856)) mapDefault!26486)))))

(declare-fun b!860561 () Bool)

(declare-fun tp_is_empty!16591 () Bool)

(assert (=> b!860561 (= e!479644 tp_is_empty!16591)))

(declare-fun b!860562 () Bool)

(declare-fun res!584467 () Bool)

(declare-fun e!479640 () Bool)

(assert (=> b!860562 (=> res!584467 e!479640)))

(declare-datatypes ((List!16785 0))(
  ( (Nil!16782) (Cons!16781 (h!17918 (_ BitVec 64)) (t!23498 List!16785)) )
))
(declare-fun noDuplicate!1308 (List!16785) Bool)

(assert (=> b!860562 (= res!584467 (not (noDuplicate!1308 Nil!16782)))))

(declare-fun b!860563 () Bool)

(declare-fun res!584469 () Bool)

(assert (=> b!860563 (=> (not res!584469) (not e!479643))))

(declare-fun arrayNoDuplicates!0 (array!49413 (_ BitVec 32) List!16785) Bool)

(assert (=> b!860563 (= res!584469 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16782))))

(declare-fun res!584466 () Bool)

(assert (=> start!73708 (=> (not res!584466) (not e!479643))))

(assert (=> start!73708 (= res!584466 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24174 _keys!868))))))

(assert (=> start!73708 e!479643))

(assert (=> start!73708 tp_is_empty!16591))

(assert (=> start!73708 true))

(assert (=> start!73708 tp!50869))

(declare-fun array_inv!18836 (array!49413) Bool)

(assert (=> start!73708 (array_inv!18836 _keys!868)))

(declare-fun array_inv!18837 (array!49411) Bool)

(assert (=> start!73708 (and (array_inv!18837 _values!688) e!479645)))

(declare-fun b!860564 () Bool)

(declare-fun res!584458 () Bool)

(assert (=> b!860564 (=> (not res!584458) (not e!479643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860564 (= res!584458 (validMask!0 mask!1196))))

(declare-fun b!860565 () Bool)

(assert (=> b!860565 (= e!479640 true)))

(declare-fun lt!387753 () Bool)

(declare-fun contains!4201 (List!16785 (_ BitVec 64)) Bool)

(assert (=> b!860565 (= lt!387753 (contains!4201 Nil!16782 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860566 () Bool)

(declare-fun res!584457 () Bool)

(assert (=> b!860566 (=> (not res!584457) (not e!479643))))

(assert (=> b!860566 (= res!584457 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24174 _keys!868))))))

(declare-fun b!860567 () Bool)

(declare-fun res!584463 () Bool)

(assert (=> b!860567 (=> (not res!584463) (not e!479643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49413 (_ BitVec 32)) Bool)

(assert (=> b!860567 (= res!584463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860568 () Bool)

(declare-fun res!584470 () Bool)

(assert (=> b!860568 (=> res!584470 e!479640)))

(assert (=> b!860568 (= res!584470 (contains!4201 Nil!16782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860569 () Bool)

(declare-fun e!479641 () Bool)

(assert (=> b!860569 (= e!479641 e!479640)))

(declare-fun res!584468 () Bool)

(assert (=> b!860569 (=> res!584468 e!479640)))

(assert (=> b!860569 (= res!584468 (or (bvsge (size!24174 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24174 _keys!868)) (bvsge from!1053 (size!24174 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860569 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!29310 0))(
  ( (Unit!29311) )
))
(declare-fun lt!387749 () Unit!29310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29310)

(assert (=> b!860569 (= lt!387749 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!860569 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16782)))

(declare-fun lt!387748 () Unit!29310)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49413 (_ BitVec 32) (_ BitVec 32)) Unit!29310)

(assert (=> b!860569 (= lt!387748 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860570 () Bool)

(declare-fun res!584461 () Bool)

(assert (=> b!860570 (=> (not res!584461) (not e!479643))))

(assert (=> b!860570 (= res!584461 (and (= (size!24173 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24174 _keys!868) (size!24173 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860571 () Bool)

(assert (=> b!860571 (= e!479642 tp_is_empty!16591)))

(declare-fun b!860572 () Bool)

(declare-fun e!479639 () Bool)

(assert (=> b!860572 (= e!479639 e!479641)))

(declare-fun res!584464 () Bool)

(assert (=> b!860572 (=> res!584464 e!479641)))

(assert (=> b!860572 (= res!584464 (not (= (select (arr!23733 _keys!868) from!1053) k0!854)))))

(declare-fun lt!387746 () ListLongMap!9715)

(declare-fun +!2278 (ListLongMap!9715 tuple2!10944) ListLongMap!9715)

(declare-fun get!12513 (ValueCell!7856 V!27169) V!27169)

(declare-fun dynLambda!1111 (Int (_ BitVec 64)) V!27169)

(assert (=> b!860572 (= lt!387751 (+!2278 lt!387746 (tuple2!10945 (select (arr!23733 _keys!868) from!1053) (get!12513 (select (arr!23732 _values!688) from!1053) (dynLambda!1111 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!26486 () Bool)

(assert (=> mapIsEmpty!26486 mapRes!26486))

(declare-fun b!860573 () Bool)

(assert (=> b!860573 (= e!479647 (not e!479639))))

(declare-fun res!584460 () Bool)

(assert (=> b!860573 (=> res!584460 e!479639)))

(assert (=> b!860573 (= res!584460 (not (validKeyInArray!0 (select (arr!23733 _keys!868) from!1053))))))

(declare-fun lt!387752 () ListLongMap!9715)

(assert (=> b!860573 (= lt!387752 lt!387746)))

(declare-fun lt!387747 () ListLongMap!9715)

(assert (=> b!860573 (= lt!387746 (+!2278 lt!387747 (tuple2!10945 k0!854 v!557)))))

(assert (=> b!860573 (= lt!387752 (getCurrentListMapNoExtraKeys!2927 _keys!868 lt!387755 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860573 (= lt!387747 (getCurrentListMapNoExtraKeys!2927 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387754 () Unit!29310)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!471 (array!49413 array!49411 (_ BitVec 32) (_ BitVec 32) V!27169 V!27169 (_ BitVec 32) (_ BitVec 64) V!27169 (_ BitVec 32) Int) Unit!29310)

(assert (=> b!860573 (= lt!387754 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!471 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73708 res!584466) b!860564))

(assert (= (and b!860564 res!584458) b!860570))

(assert (= (and b!860570 res!584461) b!860567))

(assert (= (and b!860567 res!584463) b!860563))

(assert (= (and b!860563 res!584469) b!860566))

(assert (= (and b!860566 res!584457) b!860559))

(assert (= (and b!860559 res!584465) b!860558))

(assert (= (and b!860558 res!584462) b!860557))

(assert (= (and b!860557 res!584459) b!860573))

(assert (= (and b!860573 (not res!584460)) b!860572))

(assert (= (and b!860572 (not res!584464)) b!860569))

(assert (= (and b!860569 (not res!584468)) b!860562))

(assert (= (and b!860562 (not res!584467)) b!860568))

(assert (= (and b!860568 (not res!584470)) b!860565))

(assert (= (and b!860560 condMapEmpty!26486) mapIsEmpty!26486))

(assert (= (and b!860560 (not condMapEmpty!26486)) mapNonEmpty!26486))

(get-info :version)

(assert (= (and mapNonEmpty!26486 ((_ is ValueCellFull!7856) mapValue!26486)) b!860561))

(assert (= (and b!860560 ((_ is ValueCellFull!7856) mapDefault!26486)) b!860571))

(assert (= start!73708 b!860560))

(declare-fun b_lambda!11821 () Bool)

(assert (=> (not b_lambda!11821) (not b!860572)))

(declare-fun t!23496 () Bool)

(declare-fun tb!4569 () Bool)

(assert (=> (and start!73708 (= defaultEntry!696 defaultEntry!696) t!23496) tb!4569))

(declare-fun result!8757 () Bool)

(assert (=> tb!4569 (= result!8757 tp_is_empty!16591)))

(assert (=> b!860572 t!23496))

(declare-fun b_and!23901 () Bool)

(assert (= b_and!23899 (and (=> t!23496 result!8757) b_and!23901)))

(declare-fun m!801707 () Bool)

(assert (=> b!860564 m!801707))

(declare-fun m!801709 () Bool)

(assert (=> start!73708 m!801709))

(declare-fun m!801711 () Bool)

(assert (=> start!73708 m!801711))

(declare-fun m!801713 () Bool)

(assert (=> b!860557 m!801713))

(declare-fun m!801715 () Bool)

(assert (=> b!860557 m!801715))

(declare-fun m!801717 () Bool)

(assert (=> b!860557 m!801717))

(declare-fun m!801719 () Bool)

(assert (=> mapNonEmpty!26486 m!801719))

(declare-fun m!801721 () Bool)

(assert (=> b!860567 m!801721))

(declare-fun m!801723 () Bool)

(assert (=> b!860573 m!801723))

(declare-fun m!801725 () Bool)

(assert (=> b!860573 m!801725))

(declare-fun m!801727 () Bool)

(assert (=> b!860573 m!801727))

(declare-fun m!801729 () Bool)

(assert (=> b!860573 m!801729))

(assert (=> b!860573 m!801727))

(declare-fun m!801731 () Bool)

(assert (=> b!860573 m!801731))

(declare-fun m!801733 () Bool)

(assert (=> b!860573 m!801733))

(declare-fun m!801735 () Bool)

(assert (=> b!860562 m!801735))

(declare-fun m!801737 () Bool)

(assert (=> b!860563 m!801737))

(declare-fun m!801739 () Bool)

(assert (=> b!860569 m!801739))

(declare-fun m!801741 () Bool)

(assert (=> b!860569 m!801741))

(declare-fun m!801743 () Bool)

(assert (=> b!860569 m!801743))

(declare-fun m!801745 () Bool)

(assert (=> b!860569 m!801745))

(declare-fun m!801747 () Bool)

(assert (=> b!860565 m!801747))

(declare-fun m!801749 () Bool)

(assert (=> b!860572 m!801749))

(declare-fun m!801751 () Bool)

(assert (=> b!860572 m!801751))

(declare-fun m!801753 () Bool)

(assert (=> b!860572 m!801753))

(declare-fun m!801755 () Bool)

(assert (=> b!860572 m!801755))

(assert (=> b!860572 m!801751))

(assert (=> b!860572 m!801727))

(assert (=> b!860572 m!801753))

(declare-fun m!801757 () Bool)

(assert (=> b!860568 m!801757))

(declare-fun m!801759 () Bool)

(assert (=> b!860559 m!801759))

(declare-fun m!801761 () Bool)

(assert (=> b!860558 m!801761))

(check-sat (not b!860559) (not b!860565) (not b!860567) (not b!860573) (not b_lambda!11821) (not b!860568) b_and!23901 (not b!860569) (not b!860564) (not b_next!14455) (not b!860562) (not start!73708) (not mapNonEmpty!26486) (not b!860563) (not b!860572) tp_is_empty!16591 (not b!860557))
(check-sat b_and!23901 (not b_next!14455))
