; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73360 () Bool)

(assert start!73360)

(declare-fun b_free!14107 () Bool)

(declare-fun b_next!14107 () Bool)

(assert (=> start!73360 (= b_free!14107 (not b_next!14107))))

(declare-fun tp!49826 () Bool)

(declare-fun b_and!23383 () Bool)

(assert (=> start!73360 (= tp!49826 b_and!23383)))

(declare-fun b!853572 () Bool)

(declare-fun res!579476 () Bool)

(declare-fun e!476134 () Bool)

(assert (=> b!853572 (=> (not res!579476) (not e!476134))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48735 0))(
  ( (array!48736 (arr!23394 (Array (_ BitVec 32) (_ BitVec 64))) (size!23835 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48735)

(declare-datatypes ((V!26705 0))(
  ( (V!26706 (val!8169 Int)) )
))
(declare-datatypes ((ValueCell!7682 0))(
  ( (ValueCellFull!7682 (v!10594 V!26705)) (EmptyCell!7682) )
))
(declare-datatypes ((array!48737 0))(
  ( (array!48738 (arr!23395 (Array (_ BitVec 32) ValueCell!7682)) (size!23836 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48737)

(assert (=> b!853572 (= res!579476 (and (= (size!23836 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23835 _keys!868) (size!23836 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25964 () Bool)

(declare-fun mapRes!25964 () Bool)

(declare-fun tp!49825 () Bool)

(declare-fun e!476133 () Bool)

(assert (=> mapNonEmpty!25964 (= mapRes!25964 (and tp!49825 e!476133))))

(declare-fun mapRest!25964 () (Array (_ BitVec 32) ValueCell!7682))

(declare-fun mapValue!25964 () ValueCell!7682)

(declare-fun mapKey!25964 () (_ BitVec 32))

(assert (=> mapNonEmpty!25964 (= (arr!23395 _values!688) (store mapRest!25964 mapKey!25964 mapValue!25964))))

(declare-fun b!853573 () Bool)

(declare-fun e!476128 () Bool)

(assert (=> b!853573 (= e!476134 e!476128)))

(declare-fun res!579475 () Bool)

(assert (=> b!853573 (=> (not res!579475) (not e!476128))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853573 (= res!579475 (= from!1053 i!612))))

(declare-datatypes ((tuple2!10656 0))(
  ( (tuple2!10657 (_1!5339 (_ BitVec 64)) (_2!5339 V!26705)) )
))
(declare-datatypes ((List!16508 0))(
  ( (Nil!16505) (Cons!16504 (h!17641 tuple2!10656) (t!23053 List!16508)) )
))
(declare-datatypes ((ListLongMap!9427 0))(
  ( (ListLongMap!9428 (toList!4729 List!16508)) )
))
(declare-fun lt!384605 () ListLongMap!9427)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26705)

(declare-fun zeroValue!654 () V!26705)

(declare-fun lt!384609 () array!48737)

(declare-fun getCurrentListMapNoExtraKeys!2786 (array!48735 array!48737 (_ BitVec 32) (_ BitVec 32) V!26705 V!26705 (_ BitVec 32) Int) ListLongMap!9427)

(assert (=> b!853573 (= lt!384605 (getCurrentListMapNoExtraKeys!2786 _keys!868 lt!384609 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26705)

(assert (=> b!853573 (= lt!384609 (array!48738 (store (arr!23395 _values!688) i!612 (ValueCellFull!7682 v!557)) (size!23836 _values!688)))))

(declare-fun lt!384612 () ListLongMap!9427)

(assert (=> b!853573 (= lt!384612 (getCurrentListMapNoExtraKeys!2786 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun call!38221 () ListLongMap!9427)

(declare-fun bm!38218 () Bool)

(assert (=> bm!38218 (= call!38221 (getCurrentListMapNoExtraKeys!2786 _keys!868 lt!384609 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38222 () ListLongMap!9427)

(declare-fun b!853575 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun e!476131 () Bool)

(declare-fun +!2175 (ListLongMap!9427 tuple2!10656) ListLongMap!9427)

(assert (=> b!853575 (= e!476131 (= call!38221 (+!2175 call!38222 (tuple2!10657 k0!854 v!557))))))

(declare-fun b!853576 () Bool)

(declare-fun res!579473 () Bool)

(assert (=> b!853576 (=> (not res!579473) (not e!476134))))

(declare-datatypes ((List!16509 0))(
  ( (Nil!16506) (Cons!16505 (h!17642 (_ BitVec 64)) (t!23054 List!16509)) )
))
(declare-fun arrayNoDuplicates!0 (array!48735 (_ BitVec 32) List!16509) Bool)

(assert (=> b!853576 (= res!579473 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16506))))

(declare-fun b!853577 () Bool)

(declare-fun e!476132 () Bool)

(assert (=> b!853577 (= e!476128 (not e!476132))))

(declare-fun res!579472 () Bool)

(assert (=> b!853577 (=> res!579472 e!476132)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853577 (= res!579472 (not (validKeyInArray!0 (select (arr!23394 _keys!868) from!1053))))))

(assert (=> b!853577 e!476131))

(declare-fun c!92113 () Bool)

(assert (=> b!853577 (= c!92113 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29110 0))(
  ( (Unit!29111) )
))
(declare-fun lt!384608 () Unit!29110)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!381 (array!48735 array!48737 (_ BitVec 32) (_ BitVec 32) V!26705 V!26705 (_ BitVec 32) (_ BitVec 64) V!26705 (_ BitVec 32) Int) Unit!29110)

(assert (=> b!853577 (= lt!384608 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!381 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853578 () Bool)

(declare-fun res!579481 () Bool)

(assert (=> b!853578 (=> (not res!579481) (not e!476134))))

(assert (=> b!853578 (= res!579481 (and (= (select (arr!23394 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853579 () Bool)

(declare-fun res!579480 () Bool)

(assert (=> b!853579 (=> (not res!579480) (not e!476134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48735 (_ BitVec 32)) Bool)

(assert (=> b!853579 (= res!579480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853580 () Bool)

(declare-fun e!476129 () Bool)

(declare-fun tp_is_empty!16243 () Bool)

(assert (=> b!853580 (= e!476129 tp_is_empty!16243)))

(declare-fun bm!38219 () Bool)

(assert (=> bm!38219 (= call!38222 (getCurrentListMapNoExtraKeys!2786 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853581 () Bool)

(assert (=> b!853581 (= e!476131 (= call!38221 call!38222))))

(declare-fun b!853582 () Bool)

(assert (=> b!853582 (= e!476132 true)))

(declare-fun lt!384613 () V!26705)

(declare-fun lt!384611 () ListLongMap!9427)

(declare-fun lt!384610 () tuple2!10656)

(assert (=> b!853582 (= (+!2175 lt!384611 lt!384610) (+!2175 (+!2175 lt!384611 (tuple2!10657 k0!854 lt!384613)) lt!384610))))

(declare-fun lt!384607 () V!26705)

(assert (=> b!853582 (= lt!384610 (tuple2!10657 k0!854 lt!384607))))

(declare-fun lt!384614 () Unit!29110)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!302 (ListLongMap!9427 (_ BitVec 64) V!26705 V!26705) Unit!29110)

(assert (=> b!853582 (= lt!384614 (addSameAsAddTwiceSameKeyDiffValues!302 lt!384611 k0!854 lt!384613 lt!384607))))

(declare-fun lt!384606 () V!26705)

(declare-fun get!12335 (ValueCell!7682 V!26705) V!26705)

(assert (=> b!853582 (= lt!384613 (get!12335 (select (arr!23395 _values!688) from!1053) lt!384606))))

(assert (=> b!853582 (= lt!384605 (+!2175 lt!384611 (tuple2!10657 (select (arr!23394 _keys!868) from!1053) lt!384607)))))

(assert (=> b!853582 (= lt!384607 (get!12335 (select (store (arr!23395 _values!688) i!612 (ValueCellFull!7682 v!557)) from!1053) lt!384606))))

(declare-fun dynLambda!1049 (Int (_ BitVec 64)) V!26705)

(assert (=> b!853582 (= lt!384606 (dynLambda!1049 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853582 (= lt!384611 (getCurrentListMapNoExtraKeys!2786 _keys!868 lt!384609 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853583 () Bool)

(assert (=> b!853583 (= e!476133 tp_is_empty!16243)))

(declare-fun b!853584 () Bool)

(declare-fun res!579478 () Bool)

(assert (=> b!853584 (=> (not res!579478) (not e!476134))))

(assert (=> b!853584 (= res!579478 (validKeyInArray!0 k0!854))))

(declare-fun b!853574 () Bool)

(declare-fun e!476127 () Bool)

(assert (=> b!853574 (= e!476127 (and e!476129 mapRes!25964))))

(declare-fun condMapEmpty!25964 () Bool)

(declare-fun mapDefault!25964 () ValueCell!7682)

(assert (=> b!853574 (= condMapEmpty!25964 (= (arr!23395 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7682)) mapDefault!25964)))))

(declare-fun res!579479 () Bool)

(assert (=> start!73360 (=> (not res!579479) (not e!476134))))

(assert (=> start!73360 (= res!579479 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23835 _keys!868))))))

(assert (=> start!73360 e!476134))

(assert (=> start!73360 tp_is_empty!16243))

(assert (=> start!73360 true))

(assert (=> start!73360 tp!49826))

(declare-fun array_inv!18606 (array!48735) Bool)

(assert (=> start!73360 (array_inv!18606 _keys!868)))

(declare-fun array_inv!18607 (array!48737) Bool)

(assert (=> start!73360 (and (array_inv!18607 _values!688) e!476127)))

(declare-fun mapIsEmpty!25964 () Bool)

(assert (=> mapIsEmpty!25964 mapRes!25964))

(declare-fun b!853585 () Bool)

(declare-fun res!579474 () Bool)

(assert (=> b!853585 (=> (not res!579474) (not e!476134))))

(assert (=> b!853585 (= res!579474 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23835 _keys!868))))))

(declare-fun b!853586 () Bool)

(declare-fun res!579477 () Bool)

(assert (=> b!853586 (=> (not res!579477) (not e!476134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853586 (= res!579477 (validMask!0 mask!1196))))

(assert (= (and start!73360 res!579479) b!853586))

(assert (= (and b!853586 res!579477) b!853572))

(assert (= (and b!853572 res!579476) b!853579))

(assert (= (and b!853579 res!579480) b!853576))

(assert (= (and b!853576 res!579473) b!853585))

(assert (= (and b!853585 res!579474) b!853584))

(assert (= (and b!853584 res!579478) b!853578))

(assert (= (and b!853578 res!579481) b!853573))

(assert (= (and b!853573 res!579475) b!853577))

(assert (= (and b!853577 c!92113) b!853575))

(assert (= (and b!853577 (not c!92113)) b!853581))

(assert (= (or b!853575 b!853581) bm!38218))

(assert (= (or b!853575 b!853581) bm!38219))

(assert (= (and b!853577 (not res!579472)) b!853582))

(assert (= (and b!853574 condMapEmpty!25964) mapIsEmpty!25964))

(assert (= (and b!853574 (not condMapEmpty!25964)) mapNonEmpty!25964))

(get-info :version)

(assert (= (and mapNonEmpty!25964 ((_ is ValueCellFull!7682) mapValue!25964)) b!853583))

(assert (= (and b!853574 ((_ is ValueCellFull!7682) mapDefault!25964)) b!853580))

(assert (= start!73360 b!853574))

(declare-fun b_lambda!11653 () Bool)

(assert (=> (not b_lambda!11653) (not b!853582)))

(declare-fun t!23052 () Bool)

(declare-fun tb!4401 () Bool)

(assert (=> (and start!73360 (= defaultEntry!696 defaultEntry!696) t!23052) tb!4401))

(declare-fun result!8421 () Bool)

(assert (=> tb!4401 (= result!8421 tp_is_empty!16243)))

(assert (=> b!853582 t!23052))

(declare-fun b_and!23385 () Bool)

(assert (= b_and!23383 (and (=> t!23052 result!8421) b_and!23385)))

(declare-fun m!795055 () Bool)

(assert (=> bm!38218 m!795055))

(declare-fun m!795057 () Bool)

(assert (=> b!853586 m!795057))

(declare-fun m!795059 () Bool)

(assert (=> b!853578 m!795059))

(declare-fun m!795061 () Bool)

(assert (=> b!853582 m!795061))

(declare-fun m!795063 () Bool)

(assert (=> b!853582 m!795063))

(assert (=> b!853582 m!795061))

(declare-fun m!795065 () Bool)

(assert (=> b!853582 m!795065))

(declare-fun m!795067 () Bool)

(assert (=> b!853582 m!795067))

(assert (=> b!853582 m!795065))

(declare-fun m!795069 () Bool)

(assert (=> b!853582 m!795069))

(assert (=> b!853582 m!795055))

(declare-fun m!795071 () Bool)

(assert (=> b!853582 m!795071))

(declare-fun m!795073 () Bool)

(assert (=> b!853582 m!795073))

(assert (=> b!853582 m!795071))

(declare-fun m!795075 () Bool)

(assert (=> b!853582 m!795075))

(declare-fun m!795077 () Bool)

(assert (=> b!853582 m!795077))

(declare-fun m!795079 () Bool)

(assert (=> b!853582 m!795079))

(declare-fun m!795081 () Bool)

(assert (=> b!853582 m!795081))

(declare-fun m!795083 () Bool)

(assert (=> b!853582 m!795083))

(declare-fun m!795085 () Bool)

(assert (=> b!853584 m!795085))

(declare-fun m!795087 () Bool)

(assert (=> b!853579 m!795087))

(declare-fun m!795089 () Bool)

(assert (=> b!853573 m!795089))

(assert (=> b!853573 m!795073))

(declare-fun m!795091 () Bool)

(assert (=> b!853573 m!795091))

(declare-fun m!795093 () Bool)

(assert (=> bm!38219 m!795093))

(declare-fun m!795095 () Bool)

(assert (=> b!853576 m!795095))

(declare-fun m!795097 () Bool)

(assert (=> mapNonEmpty!25964 m!795097))

(declare-fun m!795099 () Bool)

(assert (=> b!853575 m!795099))

(declare-fun m!795101 () Bool)

(assert (=> start!73360 m!795101))

(declare-fun m!795103 () Bool)

(assert (=> start!73360 m!795103))

(assert (=> b!853577 m!795081))

(assert (=> b!853577 m!795081))

(declare-fun m!795105 () Bool)

(assert (=> b!853577 m!795105))

(declare-fun m!795107 () Bool)

(assert (=> b!853577 m!795107))

(check-sat (not b!853575) (not bm!38218) (not b!853577) (not b!853579) (not b!853573) b_and!23385 (not b!853576) (not b!853582) (not b_next!14107) tp_is_empty!16243 (not b!853586) (not bm!38219) (not mapNonEmpty!25964) (not b_lambda!11653) (not b!853584) (not start!73360))
(check-sat b_and!23385 (not b_next!14107))
