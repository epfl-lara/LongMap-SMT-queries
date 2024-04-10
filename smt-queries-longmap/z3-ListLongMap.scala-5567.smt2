; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73188 () Bool)

(assert start!73188)

(declare-fun b_free!14103 () Bool)

(declare-fun b_next!14103 () Bool)

(assert (=> start!73188 (= b_free!14103 (not b_next!14103))))

(declare-fun tp!49813 () Bool)

(declare-fun b_and!23365 () Bool)

(assert (=> start!73188 (= tp!49813 b_and!23365)))

(declare-fun mapNonEmpty!25958 () Bool)

(declare-fun mapRes!25958 () Bool)

(declare-fun tp!49812 () Bool)

(declare-fun e!475504 () Bool)

(assert (=> mapNonEmpty!25958 (= mapRes!25958 (and tp!49812 e!475504))))

(declare-datatypes ((V!26699 0))(
  ( (V!26700 (val!8167 Int)) )
))
(declare-datatypes ((ValueCell!7680 0))(
  ( (ValueCellFull!7680 (v!10592 V!26699)) (EmptyCell!7680) )
))
(declare-fun mapValue!25958 () ValueCell!7680)

(declare-datatypes ((array!48676 0))(
  ( (array!48677 (arr!23369 (Array (_ BitVec 32) ValueCell!7680)) (size!23809 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48676)

(declare-fun mapKey!25958 () (_ BitVec 32))

(declare-fun mapRest!25958 () (Array (_ BitVec 32) ValueCell!7680))

(assert (=> mapNonEmpty!25958 (= (arr!23369 _values!688) (store mapRest!25958 mapKey!25958 mapValue!25958))))

(declare-fun b!852575 () Bool)

(declare-fun res!579071 () Bool)

(declare-fun e!475499 () Bool)

(assert (=> b!852575 (=> (not res!579071) (not e!475499))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48678 0))(
  ( (array!48679 (arr!23370 (Array (_ BitVec 32) (_ BitVec 64))) (size!23810 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48678)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!852575 (= res!579071 (and (= (select (arr!23370 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852576 () Bool)

(declare-fun e!475502 () Bool)

(declare-datatypes ((tuple2!10726 0))(
  ( (tuple2!10727 (_1!5374 (_ BitVec 64)) (_2!5374 V!26699)) )
))
(declare-datatypes ((List!16558 0))(
  ( (Nil!16555) (Cons!16554 (h!17685 tuple2!10726) (t!23107 List!16558)) )
))
(declare-datatypes ((ListLongMap!9495 0))(
  ( (ListLongMap!9496 (toList!4763 List!16558)) )
))
(declare-fun call!38165 () ListLongMap!9495)

(declare-fun call!38164 () ListLongMap!9495)

(assert (=> b!852576 (= e!475502 (= call!38165 call!38164))))

(declare-fun b!852577 () Bool)

(declare-fun v!557 () V!26699)

(declare-fun +!2160 (ListLongMap!9495 tuple2!10726) ListLongMap!9495)

(assert (=> b!852577 (= e!475502 (= call!38165 (+!2160 call!38164 (tuple2!10727 k0!854 v!557))))))

(declare-fun b!852578 () Bool)

(declare-fun e!475500 () Bool)

(declare-fun e!475501 () Bool)

(assert (=> b!852578 (= e!475500 (and e!475501 mapRes!25958))))

(declare-fun condMapEmpty!25958 () Bool)

(declare-fun mapDefault!25958 () ValueCell!7680)

(assert (=> b!852578 (= condMapEmpty!25958 (= (arr!23369 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7680)) mapDefault!25958)))))

(declare-fun b!852579 () Bool)

(declare-fun res!579075 () Bool)

(assert (=> b!852579 (=> (not res!579075) (not e!475499))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!852579 (= res!579075 (and (= (size!23809 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23810 _keys!868) (size!23809 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852580 () Bool)

(declare-fun tp_is_empty!16239 () Bool)

(assert (=> b!852580 (= e!475501 tp_is_empty!16239)))

(declare-fun b!852581 () Bool)

(declare-fun res!579077 () Bool)

(assert (=> b!852581 (=> (not res!579077) (not e!475499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852581 (= res!579077 (validKeyInArray!0 k0!854))))

(declare-fun b!852582 () Bool)

(declare-fun res!579072 () Bool)

(assert (=> b!852582 (=> (not res!579072) (not e!475499))))

(assert (=> b!852582 (= res!579072 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23810 _keys!868))))))

(declare-fun b!852583 () Bool)

(declare-fun e!475503 () Bool)

(assert (=> b!852583 (= e!475499 e!475503)))

(declare-fun res!579068 () Bool)

(assert (=> b!852583 (=> (not res!579068) (not e!475503))))

(assert (=> b!852583 (= res!579068 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!384191 () array!48676)

(declare-fun lt!384184 () ListLongMap!9495)

(declare-fun minValue!654 () V!26699)

(declare-fun zeroValue!654 () V!26699)

(declare-fun getCurrentListMapNoExtraKeys!2745 (array!48678 array!48676 (_ BitVec 32) (_ BitVec 32) V!26699 V!26699 (_ BitVec 32) Int) ListLongMap!9495)

(assert (=> b!852583 (= lt!384184 (getCurrentListMapNoExtraKeys!2745 _keys!868 lt!384191 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852583 (= lt!384191 (array!48677 (store (arr!23369 _values!688) i!612 (ValueCellFull!7680 v!557)) (size!23809 _values!688)))))

(declare-fun lt!384189 () ListLongMap!9495)

(assert (=> b!852583 (= lt!384189 (getCurrentListMapNoExtraKeys!2745 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25958 () Bool)

(assert (=> mapIsEmpty!25958 mapRes!25958))

(declare-fun b!852584 () Bool)

(declare-fun e!475497 () Bool)

(assert (=> b!852584 (= e!475503 (not e!475497))))

(declare-fun res!579069 () Bool)

(assert (=> b!852584 (=> res!579069 e!475497)))

(assert (=> b!852584 (= res!579069 (not (validKeyInArray!0 (select (arr!23370 _keys!868) from!1053))))))

(assert (=> b!852584 e!475502))

(declare-fun c!91825 () Bool)

(assert (=> b!852584 (= c!91825 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29103 0))(
  ( (Unit!29104) )
))
(declare-fun lt!384187 () Unit!29103)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!390 (array!48678 array!48676 (_ BitVec 32) (_ BitVec 32) V!26699 V!26699 (_ BitVec 32) (_ BitVec 64) V!26699 (_ BitVec 32) Int) Unit!29103)

(assert (=> b!852584 (= lt!384187 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!390 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38161 () Bool)

(assert (=> bm!38161 (= call!38164 (getCurrentListMapNoExtraKeys!2745 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852585 () Bool)

(declare-fun res!579076 () Bool)

(assert (=> b!852585 (=> (not res!579076) (not e!475499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48678 (_ BitVec 32)) Bool)

(assert (=> b!852585 (= res!579076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852586 () Bool)

(declare-fun res!579070 () Bool)

(assert (=> b!852586 (=> (not res!579070) (not e!475499))))

(declare-datatypes ((List!16559 0))(
  ( (Nil!16556) (Cons!16555 (h!17686 (_ BitVec 64)) (t!23108 List!16559)) )
))
(declare-fun arrayNoDuplicates!0 (array!48678 (_ BitVec 32) List!16559) Bool)

(assert (=> b!852586 (= res!579070 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16556))))

(declare-fun bm!38162 () Bool)

(assert (=> bm!38162 (= call!38165 (getCurrentListMapNoExtraKeys!2745 _keys!868 lt!384191 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852587 () Bool)

(assert (=> b!852587 (= e!475504 tp_is_empty!16239)))

(declare-fun b!852588 () Bool)

(declare-fun res!579074 () Bool)

(assert (=> b!852588 (=> (not res!579074) (not e!475499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852588 (= res!579074 (validMask!0 mask!1196))))

(declare-fun res!579073 () Bool)

(assert (=> start!73188 (=> (not res!579073) (not e!475499))))

(assert (=> start!73188 (= res!579073 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23810 _keys!868))))))

(assert (=> start!73188 e!475499))

(assert (=> start!73188 tp_is_empty!16239))

(assert (=> start!73188 true))

(assert (=> start!73188 tp!49813))

(declare-fun array_inv!18534 (array!48678) Bool)

(assert (=> start!73188 (array_inv!18534 _keys!868)))

(declare-fun array_inv!18535 (array!48676) Bool)

(assert (=> start!73188 (and (array_inv!18535 _values!688) e!475500)))

(declare-fun b!852589 () Bool)

(assert (=> b!852589 (= e!475497 true)))

(declare-fun lt!384185 () ListLongMap!9495)

(declare-fun lt!384190 () V!26699)

(declare-fun lt!384193 () tuple2!10726)

(assert (=> b!852589 (= (+!2160 lt!384185 lt!384193) (+!2160 (+!2160 lt!384185 (tuple2!10727 k0!854 lt!384190)) lt!384193))))

(declare-fun lt!384192 () V!26699)

(assert (=> b!852589 (= lt!384193 (tuple2!10727 k0!854 lt!384192))))

(declare-fun lt!384186 () Unit!29103)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!288 (ListLongMap!9495 (_ BitVec 64) V!26699 V!26699) Unit!29103)

(assert (=> b!852589 (= lt!384186 (addSameAsAddTwiceSameKeyDiffValues!288 lt!384185 k0!854 lt!384190 lt!384192))))

(declare-fun lt!384188 () V!26699)

(declare-fun get!12320 (ValueCell!7680 V!26699) V!26699)

(assert (=> b!852589 (= lt!384190 (get!12320 (select (arr!23369 _values!688) from!1053) lt!384188))))

(assert (=> b!852589 (= lt!384184 (+!2160 lt!384185 (tuple2!10727 (select (arr!23370 _keys!868) from!1053) lt!384192)))))

(assert (=> b!852589 (= lt!384192 (get!12320 (select (store (arr!23369 _values!688) i!612 (ValueCellFull!7680 v!557)) from!1053) lt!384188))))

(declare-fun dynLambda!1042 (Int (_ BitVec 64)) V!26699)

(assert (=> b!852589 (= lt!384188 (dynLambda!1042 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852589 (= lt!384185 (getCurrentListMapNoExtraKeys!2745 _keys!868 lt!384191 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73188 res!579073) b!852588))

(assert (= (and b!852588 res!579074) b!852579))

(assert (= (and b!852579 res!579075) b!852585))

(assert (= (and b!852585 res!579076) b!852586))

(assert (= (and b!852586 res!579070) b!852582))

(assert (= (and b!852582 res!579072) b!852581))

(assert (= (and b!852581 res!579077) b!852575))

(assert (= (and b!852575 res!579071) b!852583))

(assert (= (and b!852583 res!579068) b!852584))

(assert (= (and b!852584 c!91825) b!852577))

(assert (= (and b!852584 (not c!91825)) b!852576))

(assert (= (or b!852577 b!852576) bm!38161))

(assert (= (or b!852577 b!852576) bm!38162))

(assert (= (and b!852584 (not res!579069)) b!852589))

(assert (= (and b!852578 condMapEmpty!25958) mapIsEmpty!25958))

(assert (= (and b!852578 (not condMapEmpty!25958)) mapNonEmpty!25958))

(get-info :version)

(assert (= (and mapNonEmpty!25958 ((_ is ValueCellFull!7680) mapValue!25958)) b!852587))

(assert (= (and b!852578 ((_ is ValueCellFull!7680) mapDefault!25958)) b!852580))

(assert (= start!73188 b!852578))

(declare-fun b_lambda!11635 () Bool)

(assert (=> (not b_lambda!11635) (not b!852589)))

(declare-fun t!23106 () Bool)

(declare-fun tb!4405 () Bool)

(assert (=> (and start!73188 (= defaultEntry!696 defaultEntry!696) t!23106) tb!4405))

(declare-fun result!8421 () Bool)

(assert (=> tb!4405 (= result!8421 tp_is_empty!16239)))

(assert (=> b!852589 t!23106))

(declare-fun b_and!23367 () Bool)

(assert (= b_and!23365 (and (=> t!23106 result!8421) b_and!23367)))

(declare-fun m!793657 () Bool)

(assert (=> b!852583 m!793657))

(declare-fun m!793659 () Bool)

(assert (=> b!852583 m!793659))

(declare-fun m!793661 () Bool)

(assert (=> b!852583 m!793661))

(declare-fun m!793663 () Bool)

(assert (=> b!852584 m!793663))

(assert (=> b!852584 m!793663))

(declare-fun m!793665 () Bool)

(assert (=> b!852584 m!793665))

(declare-fun m!793667 () Bool)

(assert (=> b!852584 m!793667))

(declare-fun m!793669 () Bool)

(assert (=> b!852586 m!793669))

(declare-fun m!793671 () Bool)

(assert (=> b!852575 m!793671))

(declare-fun m!793673 () Bool)

(assert (=> start!73188 m!793673))

(declare-fun m!793675 () Bool)

(assert (=> start!73188 m!793675))

(declare-fun m!793677 () Bool)

(assert (=> mapNonEmpty!25958 m!793677))

(declare-fun m!793679 () Bool)

(assert (=> b!852589 m!793679))

(declare-fun m!793681 () Bool)

(assert (=> b!852589 m!793681))

(declare-fun m!793683 () Bool)

(assert (=> b!852589 m!793683))

(assert (=> b!852589 m!793679))

(declare-fun m!793685 () Bool)

(assert (=> b!852589 m!793685))

(declare-fun m!793687 () Bool)

(assert (=> b!852589 m!793687))

(assert (=> b!852589 m!793683))

(declare-fun m!793689 () Bool)

(assert (=> b!852589 m!793689))

(declare-fun m!793691 () Bool)

(assert (=> b!852589 m!793691))

(declare-fun m!793693 () Bool)

(assert (=> b!852589 m!793693))

(declare-fun m!793695 () Bool)

(assert (=> b!852589 m!793695))

(assert (=> b!852589 m!793693))

(assert (=> b!852589 m!793663))

(declare-fun m!793697 () Bool)

(assert (=> b!852589 m!793697))

(declare-fun m!793699 () Bool)

(assert (=> b!852589 m!793699))

(assert (=> b!852589 m!793659))

(declare-fun m!793701 () Bool)

(assert (=> b!852581 m!793701))

(declare-fun m!793703 () Bool)

(assert (=> b!852588 m!793703))

(declare-fun m!793705 () Bool)

(assert (=> b!852585 m!793705))

(assert (=> bm!38162 m!793699))

(declare-fun m!793707 () Bool)

(assert (=> b!852577 m!793707))

(declare-fun m!793709 () Bool)

(assert (=> bm!38161 m!793709))

(check-sat (not b_lambda!11635) (not b!852585) (not mapNonEmpty!25958) (not bm!38161) (not b!852581) (not b_next!14103) (not b!852584) (not b!852586) (not b!852583) (not b!852589) (not bm!38162) b_and!23367 tp_is_empty!16239 (not b!852588) (not b!852577) (not start!73188))
(check-sat b_and!23367 (not b_next!14103))
