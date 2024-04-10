; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73272 () Bool)

(assert start!73272)

(declare-fun b_free!14187 () Bool)

(declare-fun b_next!14187 () Bool)

(assert (=> start!73272 (= b_free!14187 (not b_next!14187))))

(declare-fun tp!50064 () Bool)

(declare-fun b_and!23533 () Bool)

(assert (=> start!73272 (= tp!50064 b_and!23533)))

(declare-fun b!854550 () Bool)

(declare-fun res!580328 () Bool)

(declare-fun e!476511 () Bool)

(assert (=> b!854550 (=> (not res!580328) (not e!476511))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854550 (= res!580328 (validKeyInArray!0 k0!854))))

(declare-fun b!854551 () Bool)

(declare-fun res!580334 () Bool)

(assert (=> b!854551 (=> (not res!580334) (not e!476511))))

(declare-datatypes ((array!48844 0))(
  ( (array!48845 (arr!23453 (Array (_ BitVec 32) (_ BitVec 64))) (size!23893 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48844)

(declare-datatypes ((List!16624 0))(
  ( (Nil!16621) (Cons!16620 (h!17751 (_ BitVec 64)) (t!23257 List!16624)) )
))
(declare-fun arrayNoDuplicates!0 (array!48844 (_ BitVec 32) List!16624) Bool)

(assert (=> b!854551 (= res!580334 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16621))))

(declare-fun b!854552 () Bool)

(declare-fun e!476510 () Bool)

(assert (=> b!854552 (= e!476511 e!476510)))

(declare-fun res!580335 () Bool)

(assert (=> b!854552 (=> (not res!580335) (not e!476510))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854552 (= res!580335 (= from!1053 i!612))))

(declare-datatypes ((V!26811 0))(
  ( (V!26812 (val!8209 Int)) )
))
(declare-datatypes ((tuple2!10808 0))(
  ( (tuple2!10809 (_1!5415 (_ BitVec 64)) (_2!5415 V!26811)) )
))
(declare-datatypes ((List!16625 0))(
  ( (Nil!16622) (Cons!16621 (h!17752 tuple2!10808) (t!23258 List!16625)) )
))
(declare-datatypes ((ListLongMap!9577 0))(
  ( (ListLongMap!9578 (toList!4804 List!16625)) )
))
(declare-fun lt!385446 () ListLongMap!9577)

(declare-datatypes ((ValueCell!7722 0))(
  ( (ValueCellFull!7722 (v!10634 V!26811)) (EmptyCell!7722) )
))
(declare-datatypes ((array!48846 0))(
  ( (array!48847 (arr!23454 (Array (_ BitVec 32) ValueCell!7722)) (size!23894 (_ BitVec 32))) )
))
(declare-fun lt!385445 () array!48846)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26811)

(declare-fun zeroValue!654 () V!26811)

(declare-fun getCurrentListMapNoExtraKeys!2785 (array!48844 array!48846 (_ BitVec 32) (_ BitVec 32) V!26811 V!26811 (_ BitVec 32) Int) ListLongMap!9577)

(assert (=> b!854552 (= lt!385446 (getCurrentListMapNoExtraKeys!2785 _keys!868 lt!385445 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26811)

(declare-fun _values!688 () array!48846)

(assert (=> b!854552 (= lt!385445 (array!48847 (store (arr!23454 _values!688) i!612 (ValueCellFull!7722 v!557)) (size!23894 _values!688)))))

(declare-fun lt!385451 () ListLongMap!9577)

(assert (=> b!854552 (= lt!385451 (getCurrentListMapNoExtraKeys!2785 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854553 () Bool)

(declare-fun res!580333 () Bool)

(assert (=> b!854553 (=> (not res!580333) (not e!476511))))

(assert (=> b!854553 (= res!580333 (and (= (size!23894 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23893 _keys!868) (size!23894 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854554 () Bool)

(declare-fun e!476508 () Bool)

(assert (=> b!854554 (= e!476508 true)))

(declare-fun lt!385452 () tuple2!10808)

(declare-fun lt!385450 () ListLongMap!9577)

(declare-fun lt!385447 () V!26811)

(declare-fun +!2192 (ListLongMap!9577 tuple2!10808) ListLongMap!9577)

(assert (=> b!854554 (= (+!2192 lt!385450 lt!385452) (+!2192 (+!2192 lt!385450 (tuple2!10809 k0!854 lt!385447)) lt!385452))))

(declare-fun lt!385444 () V!26811)

(assert (=> b!854554 (= lt!385452 (tuple2!10809 k0!854 lt!385444))))

(declare-datatypes ((Unit!29171 0))(
  ( (Unit!29172) )
))
(declare-fun lt!385448 () Unit!29171)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!317 (ListLongMap!9577 (_ BitVec 64) V!26811 V!26811) Unit!29171)

(assert (=> b!854554 (= lt!385448 (addSameAsAddTwiceSameKeyDiffValues!317 lt!385450 k0!854 lt!385447 lt!385444))))

(declare-fun lt!385453 () V!26811)

(declare-fun get!12377 (ValueCell!7722 V!26811) V!26811)

(assert (=> b!854554 (= lt!385447 (get!12377 (select (arr!23454 _values!688) from!1053) lt!385453))))

(assert (=> b!854554 (= lt!385446 (+!2192 lt!385450 (tuple2!10809 (select (arr!23453 _keys!868) from!1053) lt!385444)))))

(assert (=> b!854554 (= lt!385444 (get!12377 (select (store (arr!23454 _values!688) i!612 (ValueCellFull!7722 v!557)) from!1053) lt!385453))))

(declare-fun dynLambda!1071 (Int (_ BitVec 64)) V!26811)

(assert (=> b!854554 (= lt!385453 (dynLambda!1071 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854554 (= lt!385450 (getCurrentListMapNoExtraKeys!2785 _keys!868 lt!385445 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854555 () Bool)

(declare-fun res!580337 () Bool)

(assert (=> b!854555 (=> (not res!580337) (not e!476511))))

(assert (=> b!854555 (= res!580337 (and (= (select (arr!23453 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun call!38417 () ListLongMap!9577)

(declare-fun call!38416 () ListLongMap!9577)

(declare-fun e!476505 () Bool)

(declare-fun b!854556 () Bool)

(assert (=> b!854556 (= e!476505 (= call!38417 (+!2192 call!38416 (tuple2!10809 k0!854 v!557))))))

(declare-fun b!854557 () Bool)

(declare-fun e!476507 () Bool)

(declare-fun e!476512 () Bool)

(declare-fun mapRes!26084 () Bool)

(assert (=> b!854557 (= e!476507 (and e!476512 mapRes!26084))))

(declare-fun condMapEmpty!26084 () Bool)

(declare-fun mapDefault!26084 () ValueCell!7722)

(assert (=> b!854557 (= condMapEmpty!26084 (= (arr!23454 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7722)) mapDefault!26084)))))

(declare-fun bm!38413 () Bool)

(assert (=> bm!38413 (= call!38417 (getCurrentListMapNoExtraKeys!2785 _keys!868 lt!385445 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854558 () Bool)

(assert (=> b!854558 (= e!476505 (= call!38417 call!38416))))

(declare-fun b!854559 () Bool)

(assert (=> b!854559 (= e!476510 (not e!476508))))

(declare-fun res!580330 () Bool)

(assert (=> b!854559 (=> res!580330 e!476508)))

(assert (=> b!854559 (= res!580330 (not (validKeyInArray!0 (select (arr!23453 _keys!868) from!1053))))))

(assert (=> b!854559 e!476505))

(declare-fun c!91951 () Bool)

(assert (=> b!854559 (= c!91951 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!385449 () Unit!29171)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!414 (array!48844 array!48846 (_ BitVec 32) (_ BitVec 32) V!26811 V!26811 (_ BitVec 32) (_ BitVec 64) V!26811 (_ BitVec 32) Int) Unit!29171)

(assert (=> b!854559 (= lt!385449 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!414 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854560 () Bool)

(declare-fun res!580332 () Bool)

(assert (=> b!854560 (=> (not res!580332) (not e!476511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48844 (_ BitVec 32)) Bool)

(assert (=> b!854560 (= res!580332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26084 () Bool)

(assert (=> mapIsEmpty!26084 mapRes!26084))

(declare-fun b!854561 () Bool)

(declare-fun e!476506 () Bool)

(declare-fun tp_is_empty!16323 () Bool)

(assert (=> b!854561 (= e!476506 tp_is_empty!16323)))

(declare-fun res!580336 () Bool)

(assert (=> start!73272 (=> (not res!580336) (not e!476511))))

(assert (=> start!73272 (= res!580336 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23893 _keys!868))))))

(assert (=> start!73272 e!476511))

(assert (=> start!73272 tp_is_empty!16323))

(assert (=> start!73272 true))

(assert (=> start!73272 tp!50064))

(declare-fun array_inv!18588 (array!48844) Bool)

(assert (=> start!73272 (array_inv!18588 _keys!868)))

(declare-fun array_inv!18589 (array!48846) Bool)

(assert (=> start!73272 (and (array_inv!18589 _values!688) e!476507)))

(declare-fun b!854549 () Bool)

(assert (=> b!854549 (= e!476512 tp_is_empty!16323)))

(declare-fun b!854562 () Bool)

(declare-fun res!580329 () Bool)

(assert (=> b!854562 (=> (not res!580329) (not e!476511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854562 (= res!580329 (validMask!0 mask!1196))))

(declare-fun b!854563 () Bool)

(declare-fun res!580331 () Bool)

(assert (=> b!854563 (=> (not res!580331) (not e!476511))))

(assert (=> b!854563 (= res!580331 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23893 _keys!868))))))

(declare-fun mapNonEmpty!26084 () Bool)

(declare-fun tp!50065 () Bool)

(assert (=> mapNonEmpty!26084 (= mapRes!26084 (and tp!50065 e!476506))))

(declare-fun mapRest!26084 () (Array (_ BitVec 32) ValueCell!7722))

(declare-fun mapValue!26084 () ValueCell!7722)

(declare-fun mapKey!26084 () (_ BitVec 32))

(assert (=> mapNonEmpty!26084 (= (arr!23454 _values!688) (store mapRest!26084 mapKey!26084 mapValue!26084))))

(declare-fun bm!38414 () Bool)

(assert (=> bm!38414 (= call!38416 (getCurrentListMapNoExtraKeys!2785 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73272 res!580336) b!854562))

(assert (= (and b!854562 res!580329) b!854553))

(assert (= (and b!854553 res!580333) b!854560))

(assert (= (and b!854560 res!580332) b!854551))

(assert (= (and b!854551 res!580334) b!854563))

(assert (= (and b!854563 res!580331) b!854550))

(assert (= (and b!854550 res!580328) b!854555))

(assert (= (and b!854555 res!580337) b!854552))

(assert (= (and b!854552 res!580335) b!854559))

(assert (= (and b!854559 c!91951) b!854556))

(assert (= (and b!854559 (not c!91951)) b!854558))

(assert (= (or b!854556 b!854558) bm!38414))

(assert (= (or b!854556 b!854558) bm!38413))

(assert (= (and b!854559 (not res!580330)) b!854554))

(assert (= (and b!854557 condMapEmpty!26084) mapIsEmpty!26084))

(assert (= (and b!854557 (not condMapEmpty!26084)) mapNonEmpty!26084))

(get-info :version)

(assert (= (and mapNonEmpty!26084 ((_ is ValueCellFull!7722) mapValue!26084)) b!854561))

(assert (= (and b!854557 ((_ is ValueCellFull!7722) mapDefault!26084)) b!854549))

(assert (= start!73272 b!854557))

(declare-fun b_lambda!11719 () Bool)

(assert (=> (not b_lambda!11719) (not b!854554)))

(declare-fun t!23256 () Bool)

(declare-fun tb!4489 () Bool)

(assert (=> (and start!73272 (= defaultEntry!696 defaultEntry!696) t!23256) tb!4489))

(declare-fun result!8589 () Bool)

(assert (=> tb!4489 (= result!8589 tp_is_empty!16323)))

(assert (=> b!854554 t!23256))

(declare-fun b_and!23535 () Bool)

(assert (= b_and!23533 (and (=> t!23256 result!8589) b_and!23535)))

(declare-fun m!795929 () Bool)

(assert (=> b!854550 m!795929))

(declare-fun m!795931 () Bool)

(assert (=> b!854559 m!795931))

(assert (=> b!854559 m!795931))

(declare-fun m!795933 () Bool)

(assert (=> b!854559 m!795933))

(declare-fun m!795935 () Bool)

(assert (=> b!854559 m!795935))

(declare-fun m!795937 () Bool)

(assert (=> b!854554 m!795937))

(assert (=> b!854554 m!795937))

(declare-fun m!795939 () Bool)

(assert (=> b!854554 m!795939))

(declare-fun m!795941 () Bool)

(assert (=> b!854554 m!795941))

(declare-fun m!795943 () Bool)

(assert (=> b!854554 m!795943))

(declare-fun m!795945 () Bool)

(assert (=> b!854554 m!795945))

(declare-fun m!795947 () Bool)

(assert (=> b!854554 m!795947))

(declare-fun m!795949 () Bool)

(assert (=> b!854554 m!795949))

(declare-fun m!795951 () Bool)

(assert (=> b!854554 m!795951))

(assert (=> b!854554 m!795949))

(declare-fun m!795953 () Bool)

(assert (=> b!854554 m!795953))

(assert (=> b!854554 m!795941))

(assert (=> b!854554 m!795931))

(declare-fun m!795955 () Bool)

(assert (=> b!854554 m!795955))

(declare-fun m!795957 () Bool)

(assert (=> b!854554 m!795957))

(declare-fun m!795959 () Bool)

(assert (=> b!854554 m!795959))

(declare-fun m!795961 () Bool)

(assert (=> b!854551 m!795961))

(declare-fun m!795963 () Bool)

(assert (=> b!854562 m!795963))

(declare-fun m!795965 () Bool)

(assert (=> start!73272 m!795965))

(declare-fun m!795967 () Bool)

(assert (=> start!73272 m!795967))

(declare-fun m!795969 () Bool)

(assert (=> b!854555 m!795969))

(declare-fun m!795971 () Bool)

(assert (=> b!854552 m!795971))

(assert (=> b!854552 m!795957))

(declare-fun m!795973 () Bool)

(assert (=> b!854552 m!795973))

(declare-fun m!795975 () Bool)

(assert (=> bm!38414 m!795975))

(declare-fun m!795977 () Bool)

(assert (=> b!854556 m!795977))

(declare-fun m!795979 () Bool)

(assert (=> b!854560 m!795979))

(declare-fun m!795981 () Bool)

(assert (=> mapNonEmpty!26084 m!795981))

(assert (=> bm!38413 m!795959))

(check-sat (not b!854562) (not b!854559) (not b!854556) tp_is_empty!16323 (not b!854552) (not b!854551) (not b!854560) b_and!23535 (not b_lambda!11719) (not b!854554) (not bm!38413) (not b_next!14187) (not bm!38414) (not start!73272) (not b!854550) (not mapNonEmpty!26084))
(check-sat b_and!23535 (not b_next!14187))
