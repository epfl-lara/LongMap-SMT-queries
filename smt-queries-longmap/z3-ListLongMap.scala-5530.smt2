; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73132 () Bool)

(assert start!73132)

(declare-fun b_free!13879 () Bool)

(declare-fun b_next!13879 () Bool)

(assert (=> start!73132 (= b_free!13879 (not b_next!13879))))

(declare-fun tp!49141 () Bool)

(declare-fun b_and!22975 () Bool)

(assert (=> start!73132 (= tp!49141 b_and!22975)))

(declare-fun b!848323 () Bool)

(declare-fun e!473452 () Bool)

(declare-datatypes ((V!26401 0))(
  ( (V!26402 (val!8055 Int)) )
))
(declare-datatypes ((tuple2!10448 0))(
  ( (tuple2!10449 (_1!5235 (_ BitVec 64)) (_2!5235 V!26401)) )
))
(declare-datatypes ((List!16319 0))(
  ( (Nil!16316) (Cons!16315 (h!17452 tuple2!10448) (t!22682 List!16319)) )
))
(declare-datatypes ((ListLongMap!9219 0))(
  ( (ListLongMap!9220 (toList!4625 List!16319)) )
))
(declare-fun call!37538 () ListLongMap!9219)

(declare-fun call!37537 () ListLongMap!9219)

(assert (=> b!848323 (= e!473452 (= call!37538 call!37537))))

(declare-fun b!848324 () Bool)

(declare-fun res!576117 () Bool)

(declare-fun e!473456 () Bool)

(assert (=> b!848324 (=> (not res!576117) (not e!473456))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7568 0))(
  ( (ValueCellFull!7568 (v!10480 V!26401)) (EmptyCell!7568) )
))
(declare-datatypes ((array!48293 0))(
  ( (array!48294 (arr!23173 (Array (_ BitVec 32) ValueCell!7568)) (size!23614 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48293)

(declare-datatypes ((array!48295 0))(
  ( (array!48296 (arr!23174 (Array (_ BitVec 32) (_ BitVec 64))) (size!23615 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48295)

(assert (=> b!848324 (= res!576117 (and (= (size!23614 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23615 _keys!868) (size!23614 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26401)

(declare-fun zeroValue!654 () V!26401)

(declare-fun bm!37534 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2683 (array!48295 array!48293 (_ BitVec 32) (_ BitVec 32) V!26401 V!26401 (_ BitVec 32) Int) ListLongMap!9219)

(assert (=> bm!37534 (= call!37537 (getCurrentListMapNoExtraKeys!2683 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25622 () Bool)

(declare-fun mapRes!25622 () Bool)

(assert (=> mapIsEmpty!25622 mapRes!25622))

(declare-fun b!848326 () Bool)

(declare-fun res!576121 () Bool)

(assert (=> b!848326 (=> (not res!576121) (not e!473456))))

(declare-datatypes ((List!16320 0))(
  ( (Nil!16317) (Cons!16316 (h!17453 (_ BitVec 64)) (t!22683 List!16320)) )
))
(declare-fun arrayNoDuplicates!0 (array!48295 (_ BitVec 32) List!16320) Bool)

(assert (=> b!848326 (= res!576121 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16317))))

(declare-fun b!848327 () Bool)

(declare-fun e!473453 () Bool)

(assert (=> b!848327 (= e!473456 e!473453)))

(declare-fun res!576114 () Bool)

(assert (=> b!848327 (=> (not res!576114) (not e!473453))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848327 (= res!576114 (= from!1053 i!612))))

(declare-fun lt!382093 () array!48293)

(declare-fun lt!382091 () ListLongMap!9219)

(assert (=> b!848327 (= lt!382091 (getCurrentListMapNoExtraKeys!2683 _keys!868 lt!382093 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26401)

(assert (=> b!848327 (= lt!382093 (array!48294 (store (arr!23173 _values!688) i!612 (ValueCellFull!7568 v!557)) (size!23614 _values!688)))))

(declare-fun lt!382092 () ListLongMap!9219)

(assert (=> b!848327 (= lt!382092 (getCurrentListMapNoExtraKeys!2683 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848328 () Bool)

(assert (=> b!848328 (= e!473453 (not true))))

(assert (=> b!848328 e!473452))

(declare-fun c!91771 () Bool)

(assert (=> b!848328 (= c!91771 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28952 0))(
  ( (Unit!28953) )
))
(declare-fun lt!382094 () Unit!28952)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!312 (array!48295 array!48293 (_ BitVec 32) (_ BitVec 32) V!26401 V!26401 (_ BitVec 32) (_ BitVec 64) V!26401 (_ BitVec 32) Int) Unit!28952)

(assert (=> b!848328 (= lt!382094 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!312 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37535 () Bool)

(assert (=> bm!37535 (= call!37538 (getCurrentListMapNoExtraKeys!2683 _keys!868 lt!382093 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848329 () Bool)

(declare-fun res!576118 () Bool)

(assert (=> b!848329 (=> (not res!576118) (not e!473456))))

(assert (=> b!848329 (= res!576118 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23615 _keys!868))))))

(declare-fun mapNonEmpty!25622 () Bool)

(declare-fun tp!49142 () Bool)

(declare-fun e!473454 () Bool)

(assert (=> mapNonEmpty!25622 (= mapRes!25622 (and tp!49142 e!473454))))

(declare-fun mapKey!25622 () (_ BitVec 32))

(declare-fun mapValue!25622 () ValueCell!7568)

(declare-fun mapRest!25622 () (Array (_ BitVec 32) ValueCell!7568))

(assert (=> mapNonEmpty!25622 (= (arr!23173 _values!688) (store mapRest!25622 mapKey!25622 mapValue!25622))))

(declare-fun b!848330 () Bool)

(declare-fun res!576115 () Bool)

(assert (=> b!848330 (=> (not res!576115) (not e!473456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848330 (= res!576115 (validMask!0 mask!1196))))

(declare-fun b!848331 () Bool)

(declare-fun +!2086 (ListLongMap!9219 tuple2!10448) ListLongMap!9219)

(assert (=> b!848331 (= e!473452 (= call!37538 (+!2086 call!37537 (tuple2!10449 k0!854 v!557))))))

(declare-fun res!576116 () Bool)

(assert (=> start!73132 (=> (not res!576116) (not e!473456))))

(assert (=> start!73132 (= res!576116 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23615 _keys!868))))))

(assert (=> start!73132 e!473456))

(declare-fun tp_is_empty!16015 () Bool)

(assert (=> start!73132 tp_is_empty!16015))

(assert (=> start!73132 true))

(assert (=> start!73132 tp!49141))

(declare-fun array_inv!18454 (array!48295) Bool)

(assert (=> start!73132 (array_inv!18454 _keys!868)))

(declare-fun e!473458 () Bool)

(declare-fun array_inv!18455 (array!48293) Bool)

(assert (=> start!73132 (and (array_inv!18455 _values!688) e!473458)))

(declare-fun b!848325 () Bool)

(assert (=> b!848325 (= e!473454 tp_is_empty!16015)))

(declare-fun b!848332 () Bool)

(declare-fun e!473457 () Bool)

(assert (=> b!848332 (= e!473458 (and e!473457 mapRes!25622))))

(declare-fun condMapEmpty!25622 () Bool)

(declare-fun mapDefault!25622 () ValueCell!7568)

(assert (=> b!848332 (= condMapEmpty!25622 (= (arr!23173 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7568)) mapDefault!25622)))))

(declare-fun b!848333 () Bool)

(declare-fun res!576119 () Bool)

(assert (=> b!848333 (=> (not res!576119) (not e!473456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848333 (= res!576119 (validKeyInArray!0 k0!854))))

(declare-fun b!848334 () Bool)

(assert (=> b!848334 (= e!473457 tp_is_empty!16015)))

(declare-fun b!848335 () Bool)

(declare-fun res!576113 () Bool)

(assert (=> b!848335 (=> (not res!576113) (not e!473456))))

(assert (=> b!848335 (= res!576113 (and (= (select (arr!23174 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848336 () Bool)

(declare-fun res!576120 () Bool)

(assert (=> b!848336 (=> (not res!576120) (not e!473456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48295 (_ BitVec 32)) Bool)

(assert (=> b!848336 (= res!576120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73132 res!576116) b!848330))

(assert (= (and b!848330 res!576115) b!848324))

(assert (= (and b!848324 res!576117) b!848336))

(assert (= (and b!848336 res!576120) b!848326))

(assert (= (and b!848326 res!576121) b!848329))

(assert (= (and b!848329 res!576118) b!848333))

(assert (= (and b!848333 res!576119) b!848335))

(assert (= (and b!848335 res!576113) b!848327))

(assert (= (and b!848327 res!576114) b!848328))

(assert (= (and b!848328 c!91771) b!848331))

(assert (= (and b!848328 (not c!91771)) b!848323))

(assert (= (or b!848331 b!848323) bm!37535))

(assert (= (or b!848331 b!848323) bm!37534))

(assert (= (and b!848332 condMapEmpty!25622) mapIsEmpty!25622))

(assert (= (and b!848332 (not condMapEmpty!25622)) mapNonEmpty!25622))

(get-info :version)

(assert (= (and mapNonEmpty!25622 ((_ is ValueCellFull!7568) mapValue!25622)) b!848325))

(assert (= (and b!848332 ((_ is ValueCellFull!7568) mapDefault!25622)) b!848334))

(assert (= start!73132 b!848332))

(declare-fun m!789785 () Bool)

(assert (=> b!848336 m!789785))

(declare-fun m!789787 () Bool)

(assert (=> bm!37534 m!789787))

(declare-fun m!789789 () Bool)

(assert (=> b!848326 m!789789))

(declare-fun m!789791 () Bool)

(assert (=> b!848335 m!789791))

(declare-fun m!789793 () Bool)

(assert (=> b!848328 m!789793))

(declare-fun m!789795 () Bool)

(assert (=> mapNonEmpty!25622 m!789795))

(declare-fun m!789797 () Bool)

(assert (=> b!848331 m!789797))

(declare-fun m!789799 () Bool)

(assert (=> start!73132 m!789799))

(declare-fun m!789801 () Bool)

(assert (=> start!73132 m!789801))

(declare-fun m!789803 () Bool)

(assert (=> bm!37535 m!789803))

(declare-fun m!789805 () Bool)

(assert (=> b!848333 m!789805))

(declare-fun m!789807 () Bool)

(assert (=> b!848327 m!789807))

(declare-fun m!789809 () Bool)

(assert (=> b!848327 m!789809))

(declare-fun m!789811 () Bool)

(assert (=> b!848327 m!789811))

(declare-fun m!789813 () Bool)

(assert (=> b!848330 m!789813))

(check-sat (not bm!37534) tp_is_empty!16015 (not start!73132) (not b!848333) (not b_next!13879) (not b!848331) (not mapNonEmpty!25622) (not b!848327) (not b!848330) (not b!848336) (not bm!37535) b_and!22975 (not b!848326) (not b!848328))
(check-sat b_and!22975 (not b_next!13879))
