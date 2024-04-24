; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73702 () Bool)

(assert start!73702)

(declare-fun b_free!14449 () Bool)

(declare-fun b_next!14449 () Bool)

(assert (=> start!73702 (= b_free!14449 (not b_next!14449))))

(declare-fun tp!50851 () Bool)

(declare-fun b_and!23887 () Bool)

(assert (=> start!73702 (= tp!50851 b_and!23887)))

(declare-fun b!860398 () Bool)

(declare-fun e!479563 () Bool)

(declare-fun tp_is_empty!16585 () Bool)

(assert (=> b!860398 (= e!479563 tp_is_empty!16585)))

(declare-fun res!584333 () Bool)

(declare-fun e!479562 () Bool)

(assert (=> start!73702 (=> (not res!584333) (not e!479562))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49399 0))(
  ( (array!49400 (arr!23726 (Array (_ BitVec 32) (_ BitVec 64))) (size!24167 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49399)

(assert (=> start!73702 (= res!584333 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24167 _keys!868))))))

(assert (=> start!73702 e!479562))

(assert (=> start!73702 tp_is_empty!16585))

(assert (=> start!73702 true))

(assert (=> start!73702 tp!50851))

(declare-fun array_inv!18832 (array!49399) Bool)

(assert (=> start!73702 (array_inv!18832 _keys!868)))

(declare-datatypes ((V!27161 0))(
  ( (V!27162 (val!8340 Int)) )
))
(declare-datatypes ((ValueCell!7853 0))(
  ( (ValueCellFull!7853 (v!10765 V!27161)) (EmptyCell!7853) )
))
(declare-datatypes ((array!49401 0))(
  ( (array!49402 (arr!23727 (Array (_ BitVec 32) ValueCell!7853)) (size!24168 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49401)

(declare-fun e!479558 () Bool)

(declare-fun array_inv!18833 (array!49401) Bool)

(assert (=> start!73702 (and (array_inv!18833 _values!688) e!479558)))

(declare-fun b!860399 () Bool)

(declare-fun res!584343 () Bool)

(assert (=> b!860399 (=> (not res!584343) (not e!479562))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860399 (= res!584343 (validKeyInArray!0 k0!854))))

(declare-fun b!860400 () Bool)

(declare-fun res!584338 () Bool)

(assert (=> b!860400 (=> (not res!584338) (not e!479562))))

(declare-datatypes ((List!16779 0))(
  ( (Nil!16776) (Cons!16775 (h!17912 (_ BitVec 64)) (t!23486 List!16779)) )
))
(declare-fun arrayNoDuplicates!0 (array!49399 (_ BitVec 32) List!16779) Bool)

(assert (=> b!860400 (= res!584338 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16776))))

(declare-fun mapNonEmpty!26477 () Bool)

(declare-fun mapRes!26477 () Bool)

(declare-fun tp!50852 () Bool)

(declare-fun e!479561 () Bool)

(assert (=> mapNonEmpty!26477 (= mapRes!26477 (and tp!50852 e!479561))))

(declare-fun mapKey!26477 () (_ BitVec 32))

(declare-fun mapRest!26477 () (Array (_ BitVec 32) ValueCell!7853))

(declare-fun mapValue!26477 () ValueCell!7853)

(assert (=> mapNonEmpty!26477 (= (arr!23727 _values!688) (store mapRest!26477 mapKey!26477 mapValue!26477))))

(declare-fun b!860401 () Bool)

(declare-fun res!584335 () Bool)

(assert (=> b!860401 (=> (not res!584335) (not e!479562))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860401 (= res!584335 (and (= (select (arr!23726 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860402 () Bool)

(declare-fun res!584341 () Bool)

(assert (=> b!860402 (=> (not res!584341) (not e!479562))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860402 (= res!584341 (validMask!0 mask!1196))))

(declare-fun b!860403 () Bool)

(declare-fun e!479565 () Bool)

(assert (=> b!860403 (= e!479565 true)))

(declare-fun lt!387657 () Bool)

(declare-fun contains!4199 (List!16779 (_ BitVec 64)) Bool)

(assert (=> b!860403 (= lt!387657 (contains!4199 Nil!16776 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860404 () Bool)

(declare-fun res!584340 () Bool)

(assert (=> b!860404 (=> (not res!584340) (not e!479562))))

(assert (=> b!860404 (= res!584340 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24167 _keys!868))))))

(declare-fun b!860405 () Bool)

(declare-fun e!479564 () Bool)

(declare-fun e!479559 () Bool)

(assert (=> b!860405 (= e!479564 e!479559)))

(declare-fun res!584342 () Bool)

(assert (=> b!860405 (=> res!584342 e!479559)))

(assert (=> b!860405 (= res!584342 (not (= (select (arr!23726 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((tuple2!10940 0))(
  ( (tuple2!10941 (_1!5481 (_ BitVec 64)) (_2!5481 V!27161)) )
))
(declare-datatypes ((List!16780 0))(
  ( (Nil!16777) (Cons!16776 (h!17913 tuple2!10940) (t!23487 List!16780)) )
))
(declare-datatypes ((ListLongMap!9711 0))(
  ( (ListLongMap!9712 (toList!4871 List!16780)) )
))
(declare-fun lt!387665 () ListLongMap!9711)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387660 () ListLongMap!9711)

(declare-fun +!2277 (ListLongMap!9711 tuple2!10940) ListLongMap!9711)

(declare-fun get!12510 (ValueCell!7853 V!27161) V!27161)

(declare-fun dynLambda!1110 (Int (_ BitVec 64)) V!27161)

(assert (=> b!860405 (= lt!387660 (+!2277 lt!387665 (tuple2!10941 (select (arr!23726 _keys!868) from!1053) (get!12510 (select (arr!23727 _values!688) from!1053) (dynLambda!1110 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860406 () Bool)

(assert (=> b!860406 (= e!479561 tp_is_empty!16585)))

(declare-fun b!860407 () Bool)

(assert (=> b!860407 (= e!479558 (and e!479563 mapRes!26477))))

(declare-fun condMapEmpty!26477 () Bool)

(declare-fun mapDefault!26477 () ValueCell!7853)

(assert (=> b!860407 (= condMapEmpty!26477 (= (arr!23727 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7853)) mapDefault!26477)))))

(declare-fun b!860408 () Bool)

(declare-fun res!584331 () Bool)

(assert (=> b!860408 (=> (not res!584331) (not e!479562))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!860408 (= res!584331 (and (= (size!24168 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24167 _keys!868) (size!24168 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860409 () Bool)

(declare-fun res!584344 () Bool)

(assert (=> b!860409 (=> (not res!584344) (not e!479562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49399 (_ BitVec 32)) Bool)

(assert (=> b!860409 (= res!584344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860410 () Bool)

(declare-fun res!584332 () Bool)

(assert (=> b!860410 (=> res!584332 e!479565)))

(assert (=> b!860410 (= res!584332 (contains!4199 Nil!16776 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860411 () Bool)

(declare-fun e!479560 () Bool)

(assert (=> b!860411 (= e!479560 (not e!479564))))

(declare-fun res!584337 () Bool)

(assert (=> b!860411 (=> res!584337 e!479564)))

(assert (=> b!860411 (= res!584337 (not (validKeyInArray!0 (select (arr!23726 _keys!868) from!1053))))))

(declare-fun lt!387662 () ListLongMap!9711)

(assert (=> b!860411 (= lt!387662 lt!387665)))

(declare-fun v!557 () V!27161)

(declare-fun lt!387656 () ListLongMap!9711)

(assert (=> b!860411 (= lt!387665 (+!2277 lt!387656 (tuple2!10941 k0!854 v!557)))))

(declare-fun minValue!654 () V!27161)

(declare-fun zeroValue!654 () V!27161)

(declare-fun lt!387658 () array!49401)

(declare-fun getCurrentListMapNoExtraKeys!2925 (array!49399 array!49401 (_ BitVec 32) (_ BitVec 32) V!27161 V!27161 (_ BitVec 32) Int) ListLongMap!9711)

(assert (=> b!860411 (= lt!387662 (getCurrentListMapNoExtraKeys!2925 _keys!868 lt!387658 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860411 (= lt!387656 (getCurrentListMapNoExtraKeys!2925 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29306 0))(
  ( (Unit!29307) )
))
(declare-fun lt!387661 () Unit!29306)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!470 (array!49399 array!49401 (_ BitVec 32) (_ BitVec 32) V!27161 V!27161 (_ BitVec 32) (_ BitVec 64) V!27161 (_ BitVec 32) Int) Unit!29306)

(assert (=> b!860411 (= lt!387661 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!470 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860412 () Bool)

(assert (=> b!860412 (= e!479562 e!479560)))

(declare-fun res!584336 () Bool)

(assert (=> b!860412 (=> (not res!584336) (not e!479560))))

(assert (=> b!860412 (= res!584336 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!860412 (= lt!387660 (getCurrentListMapNoExtraKeys!2925 _keys!868 lt!387658 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!860412 (= lt!387658 (array!49402 (store (arr!23727 _values!688) i!612 (ValueCellFull!7853 v!557)) (size!24168 _values!688)))))

(declare-fun lt!387663 () ListLongMap!9711)

(assert (=> b!860412 (= lt!387663 (getCurrentListMapNoExtraKeys!2925 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26477 () Bool)

(assert (=> mapIsEmpty!26477 mapRes!26477))

(declare-fun b!860413 () Bool)

(declare-fun res!584334 () Bool)

(assert (=> b!860413 (=> res!584334 e!479565)))

(declare-fun noDuplicate!1305 (List!16779) Bool)

(assert (=> b!860413 (= res!584334 (not (noDuplicate!1305 Nil!16776)))))

(declare-fun b!860414 () Bool)

(assert (=> b!860414 (= e!479559 e!479565)))

(declare-fun res!584339 () Bool)

(assert (=> b!860414 (=> res!584339 e!479565)))

(assert (=> b!860414 (= res!584339 (or (bvsge (size!24167 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24167 _keys!868)) (bvsge from!1053 (size!24167 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860414 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387659 () Unit!29306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49399 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29306)

(assert (=> b!860414 (= lt!387659 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!860414 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16776)))

(declare-fun lt!387664 () Unit!29306)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49399 (_ BitVec 32) (_ BitVec 32)) Unit!29306)

(assert (=> b!860414 (= lt!387664 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (= (and start!73702 res!584333) b!860402))

(assert (= (and b!860402 res!584341) b!860408))

(assert (= (and b!860408 res!584331) b!860409))

(assert (= (and b!860409 res!584344) b!860400))

(assert (= (and b!860400 res!584338) b!860404))

(assert (= (and b!860404 res!584340) b!860399))

(assert (= (and b!860399 res!584343) b!860401))

(assert (= (and b!860401 res!584335) b!860412))

(assert (= (and b!860412 res!584336) b!860411))

(assert (= (and b!860411 (not res!584337)) b!860405))

(assert (= (and b!860405 (not res!584342)) b!860414))

(assert (= (and b!860414 (not res!584339)) b!860413))

(assert (= (and b!860413 (not res!584334)) b!860410))

(assert (= (and b!860410 (not res!584332)) b!860403))

(assert (= (and b!860407 condMapEmpty!26477) mapIsEmpty!26477))

(assert (= (and b!860407 (not condMapEmpty!26477)) mapNonEmpty!26477))

(get-info :version)

(assert (= (and mapNonEmpty!26477 ((_ is ValueCellFull!7853) mapValue!26477)) b!860406))

(assert (= (and b!860407 ((_ is ValueCellFull!7853) mapDefault!26477)) b!860398))

(assert (= start!73702 b!860407))

(declare-fun b_lambda!11815 () Bool)

(assert (=> (not b_lambda!11815) (not b!860405)))

(declare-fun t!23485 () Bool)

(declare-fun tb!4563 () Bool)

(assert (=> (and start!73702 (= defaultEntry!696 defaultEntry!696) t!23485) tb!4563))

(declare-fun result!8745 () Bool)

(assert (=> tb!4563 (= result!8745 tp_is_empty!16585)))

(assert (=> b!860405 t!23485))

(declare-fun b_and!23889 () Bool)

(assert (= b_and!23887 (and (=> t!23485 result!8745) b_and!23889)))

(declare-fun m!801539 () Bool)

(assert (=> b!860411 m!801539))

(declare-fun m!801541 () Bool)

(assert (=> b!860411 m!801541))

(declare-fun m!801543 () Bool)

(assert (=> b!860411 m!801543))

(declare-fun m!801545 () Bool)

(assert (=> b!860411 m!801545))

(declare-fun m!801547 () Bool)

(assert (=> b!860411 m!801547))

(assert (=> b!860411 m!801545))

(declare-fun m!801549 () Bool)

(assert (=> b!860411 m!801549))

(declare-fun m!801551 () Bool)

(assert (=> b!860409 m!801551))

(declare-fun m!801553 () Bool)

(assert (=> b!860401 m!801553))

(declare-fun m!801555 () Bool)

(assert (=> b!860403 m!801555))

(declare-fun m!801557 () Bool)

(assert (=> start!73702 m!801557))

(declare-fun m!801559 () Bool)

(assert (=> start!73702 m!801559))

(declare-fun m!801561 () Bool)

(assert (=> b!860405 m!801561))

(declare-fun m!801563 () Bool)

(assert (=> b!860405 m!801563))

(declare-fun m!801565 () Bool)

(assert (=> b!860405 m!801565))

(declare-fun m!801567 () Bool)

(assert (=> b!860405 m!801567))

(assert (=> b!860405 m!801563))

(assert (=> b!860405 m!801545))

(assert (=> b!860405 m!801565))

(declare-fun m!801569 () Bool)

(assert (=> mapNonEmpty!26477 m!801569))

(declare-fun m!801571 () Bool)

(assert (=> b!860413 m!801571))

(declare-fun m!801573 () Bool)

(assert (=> b!860410 m!801573))

(declare-fun m!801575 () Bool)

(assert (=> b!860400 m!801575))

(declare-fun m!801577 () Bool)

(assert (=> b!860399 m!801577))

(declare-fun m!801579 () Bool)

(assert (=> b!860414 m!801579))

(declare-fun m!801581 () Bool)

(assert (=> b!860414 m!801581))

(declare-fun m!801583 () Bool)

(assert (=> b!860414 m!801583))

(declare-fun m!801585 () Bool)

(assert (=> b!860414 m!801585))

(declare-fun m!801587 () Bool)

(assert (=> b!860402 m!801587))

(declare-fun m!801589 () Bool)

(assert (=> b!860412 m!801589))

(declare-fun m!801591 () Bool)

(assert (=> b!860412 m!801591))

(declare-fun m!801593 () Bool)

(assert (=> b!860412 m!801593))

(check-sat b_and!23889 (not b!860413) (not b!860414) (not b!860403) (not b!860411) (not start!73702) (not b!860410) (not b_next!14449) (not b!860405) tp_is_empty!16585 (not b!860412) (not b!860402) (not mapNonEmpty!26477) (not b_lambda!11815) (not b!860400) (not b!860409) (not b!860399))
(check-sat b_and!23889 (not b_next!14449))
