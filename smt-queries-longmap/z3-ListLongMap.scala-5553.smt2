; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73104 () Bool)

(assert start!73104)

(declare-fun b_free!14019 () Bool)

(declare-fun b_next!14019 () Bool)

(assert (=> start!73104 (= b_free!14019 (not b_next!14019))))

(declare-fun tp!49560 () Bool)

(declare-fun b_and!23197 () Bool)

(assert (=> start!73104 (= tp!49560 b_and!23197)))

(declare-fun b!850601 () Bool)

(declare-fun res!577817 () Bool)

(declare-fun e!474496 () Bool)

(assert (=> b!850601 (=> (not res!577817) (not e!474496))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48514 0))(
  ( (array!48515 (arr!23288 (Array (_ BitVec 32) (_ BitVec 64))) (size!23728 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48514)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26587 0))(
  ( (V!26588 (val!8125 Int)) )
))
(declare-datatypes ((ValueCell!7638 0))(
  ( (ValueCellFull!7638 (v!10550 V!26587)) (EmptyCell!7638) )
))
(declare-datatypes ((array!48516 0))(
  ( (array!48517 (arr!23289 (Array (_ BitVec 32) ValueCell!7638)) (size!23729 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48516)

(assert (=> b!850601 (= res!577817 (and (= (size!23729 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23728 _keys!868) (size!23729 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!577815 () Bool)

(assert (=> start!73104 (=> (not res!577815) (not e!474496))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73104 (= res!577815 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23728 _keys!868))))))

(assert (=> start!73104 e!474496))

(declare-fun tp_is_empty!16155 () Bool)

(assert (=> start!73104 tp_is_empty!16155))

(assert (=> start!73104 true))

(assert (=> start!73104 tp!49560))

(declare-fun array_inv!18482 (array!48514) Bool)

(assert (=> start!73104 (array_inv!18482 _keys!868)))

(declare-fun e!474493 () Bool)

(declare-fun array_inv!18483 (array!48516) Bool)

(assert (=> start!73104 (and (array_inv!18483 _values!688) e!474493)))

(declare-fun b!850602 () Bool)

(declare-fun res!577811 () Bool)

(assert (=> b!850602 (=> (not res!577811) (not e!474496))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850602 (= res!577811 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23728 _keys!868))))))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37909 () Bool)

(declare-datatypes ((tuple2!10652 0))(
  ( (tuple2!10653 (_1!5337 (_ BitVec 64)) (_2!5337 V!26587)) )
))
(declare-datatypes ((List!16495 0))(
  ( (Nil!16492) (Cons!16491 (h!17622 tuple2!10652) (t!22960 List!16495)) )
))
(declare-datatypes ((ListLongMap!9421 0))(
  ( (ListLongMap!9422 (toList!4726 List!16495)) )
))
(declare-fun call!37913 () ListLongMap!9421)

(declare-fun minValue!654 () V!26587)

(declare-fun zeroValue!654 () V!26587)

(declare-fun getCurrentListMapNoExtraKeys!2708 (array!48514 array!48516 (_ BitVec 32) (_ BitVec 32) V!26587 V!26587 (_ BitVec 32) Int) ListLongMap!9421)

(assert (=> bm!37909 (= call!37913 (getCurrentListMapNoExtraKeys!2708 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850603 () Bool)

(declare-fun res!577808 () Bool)

(assert (=> b!850603 (=> (not res!577808) (not e!474496))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850603 (= res!577808 (validKeyInArray!0 k0!854))))

(declare-fun b!850604 () Bool)

(declare-fun e!474495 () Bool)

(assert (=> b!850604 (= e!474496 e!474495)))

(declare-fun res!577812 () Bool)

(assert (=> b!850604 (=> (not res!577812) (not e!474495))))

(assert (=> b!850604 (= res!577812 (= from!1053 i!612))))

(declare-fun lt!382928 () array!48516)

(declare-fun lt!382931 () ListLongMap!9421)

(assert (=> b!850604 (= lt!382931 (getCurrentListMapNoExtraKeys!2708 _keys!868 lt!382928 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26587)

(assert (=> b!850604 (= lt!382928 (array!48517 (store (arr!23289 _values!688) i!612 (ValueCellFull!7638 v!557)) (size!23729 _values!688)))))

(declare-fun lt!382930 () ListLongMap!9421)

(assert (=> b!850604 (= lt!382930 (getCurrentListMapNoExtraKeys!2708 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850605 () Bool)

(declare-fun e!474491 () Bool)

(assert (=> b!850605 (= e!474491 tp_is_empty!16155)))

(declare-fun b!850606 () Bool)

(declare-fun res!577809 () Bool)

(assert (=> b!850606 (=> (not res!577809) (not e!474496))))

(declare-datatypes ((List!16496 0))(
  ( (Nil!16493) (Cons!16492 (h!17623 (_ BitVec 64)) (t!22961 List!16496)) )
))
(declare-fun arrayNoDuplicates!0 (array!48514 (_ BitVec 32) List!16496) Bool)

(assert (=> b!850606 (= res!577809 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16493))))

(declare-fun b!850607 () Bool)

(declare-fun e!474489 () Bool)

(assert (=> b!850607 (= e!474489 true)))

(declare-fun lt!382924 () ListLongMap!9421)

(declare-fun lt!382927 () V!26587)

(declare-fun lt!382926 () tuple2!10652)

(declare-fun +!2127 (ListLongMap!9421 tuple2!10652) ListLongMap!9421)

(assert (=> b!850607 (= (+!2127 lt!382924 lt!382926) (+!2127 (+!2127 lt!382924 (tuple2!10653 k0!854 lt!382927)) lt!382926))))

(declare-fun lt!382933 () V!26587)

(assert (=> b!850607 (= lt!382926 (tuple2!10653 k0!854 lt!382933))))

(declare-datatypes ((Unit!29045 0))(
  ( (Unit!29046) )
))
(declare-fun lt!382932 () Unit!29045)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!262 (ListLongMap!9421 (_ BitVec 64) V!26587 V!26587) Unit!29045)

(assert (=> b!850607 (= lt!382932 (addSameAsAddTwiceSameKeyDiffValues!262 lt!382924 k0!854 lt!382927 lt!382933))))

(declare-fun lt!382929 () V!26587)

(declare-fun get!12266 (ValueCell!7638 V!26587) V!26587)

(assert (=> b!850607 (= lt!382927 (get!12266 (select (arr!23289 _values!688) from!1053) lt!382929))))

(assert (=> b!850607 (= lt!382931 (+!2127 lt!382924 (tuple2!10653 (select (arr!23288 _keys!868) from!1053) lt!382933)))))

(assert (=> b!850607 (= lt!382933 (get!12266 (select (store (arr!23289 _values!688) i!612 (ValueCellFull!7638 v!557)) from!1053) lt!382929))))

(declare-fun dynLambda!1016 (Int (_ BitVec 64)) V!26587)

(assert (=> b!850607 (= lt!382929 (dynLambda!1016 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850607 (= lt!382924 (getCurrentListMapNoExtraKeys!2708 _keys!868 lt!382928 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850608 () Bool)

(declare-fun e!474494 () Bool)

(declare-fun mapRes!25832 () Bool)

(assert (=> b!850608 (= e!474493 (and e!474494 mapRes!25832))))

(declare-fun condMapEmpty!25832 () Bool)

(declare-fun mapDefault!25832 () ValueCell!7638)

(assert (=> b!850608 (= condMapEmpty!25832 (= (arr!23289 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7638)) mapDefault!25832)))))

(declare-fun b!850609 () Bool)

(declare-fun e!474492 () Bool)

(declare-fun call!37912 () ListLongMap!9421)

(assert (=> b!850609 (= e!474492 (= call!37912 call!37913))))

(declare-fun bm!37910 () Bool)

(assert (=> bm!37910 (= call!37912 (getCurrentListMapNoExtraKeys!2708 _keys!868 lt!382928 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25832 () Bool)

(assert (=> mapIsEmpty!25832 mapRes!25832))

(declare-fun b!850610 () Bool)

(assert (=> b!850610 (= e!474494 tp_is_empty!16155)))

(declare-fun b!850611 () Bool)

(declare-fun res!577813 () Bool)

(assert (=> b!850611 (=> (not res!577813) (not e!474496))))

(assert (=> b!850611 (= res!577813 (and (= (select (arr!23288 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850612 () Bool)

(assert (=> b!850612 (= e!474492 (= call!37912 (+!2127 call!37913 (tuple2!10653 k0!854 v!557))))))

(declare-fun mapNonEmpty!25832 () Bool)

(declare-fun tp!49561 () Bool)

(assert (=> mapNonEmpty!25832 (= mapRes!25832 (and tp!49561 e!474491))))

(declare-fun mapValue!25832 () ValueCell!7638)

(declare-fun mapRest!25832 () (Array (_ BitVec 32) ValueCell!7638))

(declare-fun mapKey!25832 () (_ BitVec 32))

(assert (=> mapNonEmpty!25832 (= (arr!23289 _values!688) (store mapRest!25832 mapKey!25832 mapValue!25832))))

(declare-fun b!850613 () Bool)

(declare-fun res!577810 () Bool)

(assert (=> b!850613 (=> (not res!577810) (not e!474496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48514 (_ BitVec 32)) Bool)

(assert (=> b!850613 (= res!577810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850614 () Bool)

(declare-fun res!577816 () Bool)

(assert (=> b!850614 (=> (not res!577816) (not e!474496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850614 (= res!577816 (validMask!0 mask!1196))))

(declare-fun b!850615 () Bool)

(assert (=> b!850615 (= e!474495 (not e!474489))))

(declare-fun res!577814 () Bool)

(assert (=> b!850615 (=> res!577814 e!474489)))

(assert (=> b!850615 (= res!577814 (not (validKeyInArray!0 (select (arr!23288 _keys!868) from!1053))))))

(assert (=> b!850615 e!474492))

(declare-fun c!91699 () Bool)

(assert (=> b!850615 (= c!91699 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382925 () Unit!29045)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!366 (array!48514 array!48516 (_ BitVec 32) (_ BitVec 32) V!26587 V!26587 (_ BitVec 32) (_ BitVec 64) V!26587 (_ BitVec 32) Int) Unit!29045)

(assert (=> b!850615 (= lt!382925 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!366 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73104 res!577815) b!850614))

(assert (= (and b!850614 res!577816) b!850601))

(assert (= (and b!850601 res!577817) b!850613))

(assert (= (and b!850613 res!577810) b!850606))

(assert (= (and b!850606 res!577809) b!850602))

(assert (= (and b!850602 res!577811) b!850603))

(assert (= (and b!850603 res!577808) b!850611))

(assert (= (and b!850611 res!577813) b!850604))

(assert (= (and b!850604 res!577812) b!850615))

(assert (= (and b!850615 c!91699) b!850612))

(assert (= (and b!850615 (not c!91699)) b!850609))

(assert (= (or b!850612 b!850609) bm!37909))

(assert (= (or b!850612 b!850609) bm!37910))

(assert (= (and b!850615 (not res!577814)) b!850607))

(assert (= (and b!850608 condMapEmpty!25832) mapIsEmpty!25832))

(assert (= (and b!850608 (not condMapEmpty!25832)) mapNonEmpty!25832))

(get-info :version)

(assert (= (and mapNonEmpty!25832 ((_ is ValueCellFull!7638) mapValue!25832)) b!850605))

(assert (= (and b!850608 ((_ is ValueCellFull!7638) mapDefault!25832)) b!850610))

(assert (= start!73104 b!850608))

(declare-fun b_lambda!11551 () Bool)

(assert (=> (not b_lambda!11551) (not b!850607)))

(declare-fun t!22959 () Bool)

(declare-fun tb!4321 () Bool)

(assert (=> (and start!73104 (= defaultEntry!696 defaultEntry!696) t!22959) tb!4321))

(declare-fun result!8253 () Bool)

(assert (=> tb!4321 (= result!8253 tp_is_empty!16155)))

(assert (=> b!850607 t!22959))

(declare-fun b_and!23199 () Bool)

(assert (= b_and!23197 (and (=> t!22959 result!8253) b_and!23199)))

(declare-fun m!791385 () Bool)

(assert (=> b!850606 m!791385))

(declare-fun m!791387 () Bool)

(assert (=> mapNonEmpty!25832 m!791387))

(declare-fun m!791389 () Bool)

(assert (=> b!850607 m!791389))

(declare-fun m!791391 () Bool)

(assert (=> b!850607 m!791391))

(declare-fun m!791393 () Bool)

(assert (=> b!850607 m!791393))

(declare-fun m!791395 () Bool)

(assert (=> b!850607 m!791395))

(assert (=> b!850607 m!791389))

(declare-fun m!791397 () Bool)

(assert (=> b!850607 m!791397))

(declare-fun m!791399 () Bool)

(assert (=> b!850607 m!791399))

(assert (=> b!850607 m!791395))

(declare-fun m!791401 () Bool)

(assert (=> b!850607 m!791401))

(declare-fun m!791403 () Bool)

(assert (=> b!850607 m!791403))

(declare-fun m!791405 () Bool)

(assert (=> b!850607 m!791405))

(declare-fun m!791407 () Bool)

(assert (=> b!850607 m!791407))

(declare-fun m!791409 () Bool)

(assert (=> b!850607 m!791409))

(declare-fun m!791411 () Bool)

(assert (=> b!850607 m!791411))

(assert (=> b!850607 m!791391))

(declare-fun m!791413 () Bool)

(assert (=> b!850607 m!791413))

(assert (=> bm!37910 m!791405))

(declare-fun m!791415 () Bool)

(assert (=> b!850614 m!791415))

(declare-fun m!791417 () Bool)

(assert (=> b!850612 m!791417))

(declare-fun m!791419 () Bool)

(assert (=> b!850603 m!791419))

(declare-fun m!791421 () Bool)

(assert (=> b!850611 m!791421))

(declare-fun m!791423 () Bool)

(assert (=> start!73104 m!791423))

(declare-fun m!791425 () Bool)

(assert (=> start!73104 m!791425))

(declare-fun m!791427 () Bool)

(assert (=> b!850604 m!791427))

(assert (=> b!850604 m!791407))

(declare-fun m!791429 () Bool)

(assert (=> b!850604 m!791429))

(declare-fun m!791431 () Bool)

(assert (=> bm!37909 m!791431))

(declare-fun m!791433 () Bool)

(assert (=> b!850613 m!791433))

(assert (=> b!850615 m!791409))

(assert (=> b!850615 m!791409))

(declare-fun m!791435 () Bool)

(assert (=> b!850615 m!791435))

(declare-fun m!791437 () Bool)

(assert (=> b!850615 m!791437))

(check-sat (not b!850615) (not mapNonEmpty!25832) tp_is_empty!16155 (not b_lambda!11551) (not b!850612) (not b!850607) (not bm!37910) (not bm!37909) (not b!850603) (not b!850614) b_and!23199 (not b!850606) (not start!73104) (not b!850604) (not b_next!14019) (not b!850613))
(check-sat b_and!23199 (not b_next!14019))
