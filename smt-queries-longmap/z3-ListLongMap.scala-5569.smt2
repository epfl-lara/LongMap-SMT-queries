; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73180 () Bool)

(assert start!73180)

(declare-fun b_free!14113 () Bool)

(declare-fun b_next!14113 () Bool)

(assert (=> start!73180 (= b_free!14113 (not b_next!14113))))

(declare-fun tp!49844 () Bool)

(declare-fun b_and!23359 () Bool)

(assert (=> start!73180 (= tp!49844 b_and!23359)))

(declare-fun b!852571 () Bool)

(declare-fun res!579111 () Bool)

(declare-fun e!475475 () Bool)

(assert (=> b!852571 (=> (not res!579111) (not e!475475))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48683 0))(
  ( (array!48684 (arr!23373 (Array (_ BitVec 32) (_ BitVec 64))) (size!23815 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48683)

(assert (=> b!852571 (= res!579111 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23815 _keys!868))))))

(declare-fun b!852572 () Bool)

(declare-fun res!579112 () Bool)

(assert (=> b!852572 (=> (not res!579112) (not e!475475))))

(declare-datatypes ((List!16579 0))(
  ( (Nil!16576) (Cons!16575 (h!17706 (_ BitVec 64)) (t!23129 List!16579)) )
))
(declare-fun arrayNoDuplicates!0 (array!48683 (_ BitVec 32) List!16579) Bool)

(assert (=> b!852572 (= res!579112 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16576))))

(declare-fun mapNonEmpty!25973 () Bool)

(declare-fun mapRes!25973 () Bool)

(declare-fun tp!49843 () Bool)

(declare-fun e!475473 () Bool)

(assert (=> mapNonEmpty!25973 (= mapRes!25973 (and tp!49843 e!475473))))

(declare-datatypes ((V!26713 0))(
  ( (V!26714 (val!8172 Int)) )
))
(declare-datatypes ((ValueCell!7685 0))(
  ( (ValueCellFull!7685 (v!10591 V!26713)) (EmptyCell!7685) )
))
(declare-fun mapValue!25973 () ValueCell!7685)

(declare-fun mapKey!25973 () (_ BitVec 32))

(declare-fun mapRest!25973 () (Array (_ BitVec 32) ValueCell!7685))

(declare-datatypes ((array!48685 0))(
  ( (array!48686 (arr!23374 (Array (_ BitVec 32) ValueCell!7685)) (size!23816 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48685)

(assert (=> mapNonEmpty!25973 (= (arr!23374 _values!688) (store mapRest!25973 mapKey!25973 mapValue!25973))))

(declare-fun b!852573 () Bool)

(declare-fun e!475469 () Bool)

(assert (=> b!852573 (= e!475475 e!475469)))

(declare-fun res!579108 () Bool)

(assert (=> b!852573 (=> (not res!579108) (not e!475469))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!852573 (= res!579108 (= from!1053 i!612))))

(declare-datatypes ((tuple2!10754 0))(
  ( (tuple2!10755 (_1!5388 (_ BitVec 64)) (_2!5388 V!26713)) )
))
(declare-datatypes ((List!16580 0))(
  ( (Nil!16577) (Cons!16576 (h!17707 tuple2!10754) (t!23130 List!16580)) )
))
(declare-datatypes ((ListLongMap!9513 0))(
  ( (ListLongMap!9514 (toList!4772 List!16580)) )
))
(declare-fun lt!384104 () ListLongMap!9513)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26713)

(declare-fun zeroValue!654 () V!26713)

(declare-fun lt!384107 () array!48685)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2780 (array!48683 array!48685 (_ BitVec 32) (_ BitVec 32) V!26713 V!26713 (_ BitVec 32) Int) ListLongMap!9513)

(assert (=> b!852573 (= lt!384104 (getCurrentListMapNoExtraKeys!2780 _keys!868 lt!384107 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26713)

(assert (=> b!852573 (= lt!384107 (array!48686 (store (arr!23374 _values!688) i!612 (ValueCellFull!7685 v!557)) (size!23816 _values!688)))))

(declare-fun lt!384106 () ListLongMap!9513)

(assert (=> b!852573 (= lt!384106 (getCurrentListMapNoExtraKeys!2780 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852574 () Bool)

(declare-fun res!579114 () Bool)

(assert (=> b!852574 (=> (not res!579114) (not e!475475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48683 (_ BitVec 32)) Bool)

(assert (=> b!852574 (= res!579114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852575 () Bool)

(declare-fun e!475476 () Bool)

(declare-fun call!38169 () ListLongMap!9513)

(declare-fun call!38168 () ListLongMap!9513)

(assert (=> b!852575 (= e!475476 (= call!38169 call!38168))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!852576 () Bool)

(declare-fun +!2187 (ListLongMap!9513 tuple2!10754) ListLongMap!9513)

(assert (=> b!852576 (= e!475476 (= call!38169 (+!2187 call!38168 (tuple2!10755 k0!854 v!557))))))

(declare-fun b!852577 () Bool)

(declare-fun tp_is_empty!16249 () Bool)

(assert (=> b!852577 (= e!475473 tp_is_empty!16249)))

(declare-fun bm!38165 () Bool)

(assert (=> bm!38165 (= call!38168 (getCurrentListMapNoExtraKeys!2780 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852578 () Bool)

(declare-fun e!475474 () Bool)

(assert (=> b!852578 (= e!475474 true)))

(declare-fun lt!384100 () V!26713)

(declare-fun lt!384105 () ListLongMap!9513)

(declare-fun lt!384102 () tuple2!10754)

(assert (=> b!852578 (= (+!2187 lt!384105 lt!384102) (+!2187 (+!2187 lt!384105 (tuple2!10755 k0!854 lt!384100)) lt!384102))))

(declare-fun lt!384101 () V!26713)

(assert (=> b!852578 (= lt!384102 (tuple2!10755 k0!854 lt!384101))))

(declare-datatypes ((Unit!29045 0))(
  ( (Unit!29046) )
))
(declare-fun lt!384098 () Unit!29045)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!297 (ListLongMap!9513 (_ BitVec 64) V!26713 V!26713) Unit!29045)

(assert (=> b!852578 (= lt!384098 (addSameAsAddTwiceSameKeyDiffValues!297 lt!384105 k0!854 lt!384100 lt!384101))))

(declare-fun lt!384103 () V!26713)

(declare-fun get!12332 (ValueCell!7685 V!26713) V!26713)

(assert (=> b!852578 (= lt!384100 (get!12332 (select (arr!23374 _values!688) from!1053) lt!384103))))

(assert (=> b!852578 (= lt!384104 (+!2187 lt!384105 (tuple2!10755 (select (arr!23373 _keys!868) from!1053) lt!384101)))))

(assert (=> b!852578 (= lt!384101 (get!12332 (select (store (arr!23374 _values!688) i!612 (ValueCellFull!7685 v!557)) from!1053) lt!384103))))

(declare-fun dynLambda!1047 (Int (_ BitVec 64)) V!26713)

(assert (=> b!852578 (= lt!384103 (dynLambda!1047 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852578 (= lt!384105 (getCurrentListMapNoExtraKeys!2780 _keys!868 lt!384107 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25973 () Bool)

(assert (=> mapIsEmpty!25973 mapRes!25973))

(declare-fun bm!38166 () Bool)

(assert (=> bm!38166 (= call!38169 (getCurrentListMapNoExtraKeys!2780 _keys!868 lt!384107 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852580 () Bool)

(declare-fun res!579109 () Bool)

(assert (=> b!852580 (=> (not res!579109) (not e!475475))))

(assert (=> b!852580 (= res!579109 (and (= (select (arr!23373 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852581 () Bool)

(declare-fun e!475470 () Bool)

(assert (=> b!852581 (= e!475470 tp_is_empty!16249)))

(declare-fun b!852582 () Bool)

(declare-fun res!579110 () Bool)

(assert (=> b!852582 (=> (not res!579110) (not e!475475))))

(assert (=> b!852582 (= res!579110 (and (= (size!23816 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23815 _keys!868) (size!23816 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852583 () Bool)

(declare-fun e!475472 () Bool)

(assert (=> b!852583 (= e!475472 (and e!475470 mapRes!25973))))

(declare-fun condMapEmpty!25973 () Bool)

(declare-fun mapDefault!25973 () ValueCell!7685)

(assert (=> b!852583 (= condMapEmpty!25973 (= (arr!23374 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7685)) mapDefault!25973)))))

(declare-fun b!852584 () Bool)

(assert (=> b!852584 (= e!475469 (not e!475474))))

(declare-fun res!579117 () Bool)

(assert (=> b!852584 (=> res!579117 e!475474)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852584 (= res!579117 (not (validKeyInArray!0 (select (arr!23373 _keys!868) from!1053))))))

(assert (=> b!852584 e!475476))

(declare-fun c!91775 () Bool)

(assert (=> b!852584 (= c!91775 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384099 () Unit!29045)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!390 (array!48683 array!48685 (_ BitVec 32) (_ BitVec 32) V!26713 V!26713 (_ BitVec 32) (_ BitVec 64) V!26713 (_ BitVec 32) Int) Unit!29045)

(assert (=> b!852584 (= lt!384099 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!390 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852585 () Bool)

(declare-fun res!579116 () Bool)

(assert (=> b!852585 (=> (not res!579116) (not e!475475))))

(assert (=> b!852585 (= res!579116 (validKeyInArray!0 k0!854))))

(declare-fun b!852579 () Bool)

(declare-fun res!579115 () Bool)

(assert (=> b!852579 (=> (not res!579115) (not e!475475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852579 (= res!579115 (validMask!0 mask!1196))))

(declare-fun res!579113 () Bool)

(assert (=> start!73180 (=> (not res!579113) (not e!475475))))

(assert (=> start!73180 (= res!579113 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23815 _keys!868))))))

(assert (=> start!73180 e!475475))

(assert (=> start!73180 tp_is_empty!16249))

(assert (=> start!73180 true))

(assert (=> start!73180 tp!49844))

(declare-fun array_inv!18618 (array!48683) Bool)

(assert (=> start!73180 (array_inv!18618 _keys!868)))

(declare-fun array_inv!18619 (array!48685) Bool)

(assert (=> start!73180 (and (array_inv!18619 _values!688) e!475472)))

(assert (= (and start!73180 res!579113) b!852579))

(assert (= (and b!852579 res!579115) b!852582))

(assert (= (and b!852582 res!579110) b!852574))

(assert (= (and b!852574 res!579114) b!852572))

(assert (= (and b!852572 res!579112) b!852571))

(assert (= (and b!852571 res!579111) b!852585))

(assert (= (and b!852585 res!579116) b!852580))

(assert (= (and b!852580 res!579109) b!852573))

(assert (= (and b!852573 res!579108) b!852584))

(assert (= (and b!852584 c!91775) b!852576))

(assert (= (and b!852584 (not c!91775)) b!852575))

(assert (= (or b!852576 b!852575) bm!38166))

(assert (= (or b!852576 b!852575) bm!38165))

(assert (= (and b!852584 (not res!579117)) b!852578))

(assert (= (and b!852583 condMapEmpty!25973) mapIsEmpty!25973))

(assert (= (and b!852583 (not condMapEmpty!25973)) mapNonEmpty!25973))

(get-info :version)

(assert (= (and mapNonEmpty!25973 ((_ is ValueCellFull!7685) mapValue!25973)) b!852577))

(assert (= (and b!852583 ((_ is ValueCellFull!7685) mapDefault!25973)) b!852581))

(assert (= start!73180 b!852583))

(declare-fun b_lambda!11627 () Bool)

(assert (=> (not b_lambda!11627) (not b!852578)))

(declare-fun t!23128 () Bool)

(declare-fun tb!4407 () Bool)

(assert (=> (and start!73180 (= defaultEntry!696 defaultEntry!696) t!23128) tb!4407))

(declare-fun result!8433 () Bool)

(assert (=> tb!4407 (= result!8433 tp_is_empty!16249)))

(assert (=> b!852578 t!23128))

(declare-fun b_and!23361 () Bool)

(assert (= b_and!23359 (and (=> t!23128 result!8433) b_and!23361)))

(declare-fun m!793171 () Bool)

(assert (=> b!852572 m!793171))

(declare-fun m!793173 () Bool)

(assert (=> mapNonEmpty!25973 m!793173))

(declare-fun m!793175 () Bool)

(assert (=> b!852574 m!793175))

(declare-fun m!793177 () Bool)

(assert (=> bm!38166 m!793177))

(declare-fun m!793179 () Bool)

(assert (=> start!73180 m!793179))

(declare-fun m!793181 () Bool)

(assert (=> start!73180 m!793181))

(declare-fun m!793183 () Bool)

(assert (=> b!852584 m!793183))

(assert (=> b!852584 m!793183))

(declare-fun m!793185 () Bool)

(assert (=> b!852584 m!793185))

(declare-fun m!793187 () Bool)

(assert (=> b!852584 m!793187))

(declare-fun m!793189 () Bool)

(assert (=> b!852580 m!793189))

(declare-fun m!793191 () Bool)

(assert (=> b!852585 m!793191))

(declare-fun m!793193 () Bool)

(assert (=> b!852573 m!793193))

(declare-fun m!793195 () Bool)

(assert (=> b!852573 m!793195))

(declare-fun m!793197 () Bool)

(assert (=> b!852573 m!793197))

(declare-fun m!793199 () Bool)

(assert (=> b!852578 m!793199))

(assert (=> b!852578 m!793177))

(declare-fun m!793201 () Bool)

(assert (=> b!852578 m!793201))

(declare-fun m!793203 () Bool)

(assert (=> b!852578 m!793203))

(declare-fun m!793205 () Bool)

(assert (=> b!852578 m!793205))

(assert (=> b!852578 m!793201))

(declare-fun m!793207 () Bool)

(assert (=> b!852578 m!793207))

(declare-fun m!793209 () Bool)

(assert (=> b!852578 m!793209))

(declare-fun m!793211 () Bool)

(assert (=> b!852578 m!793211))

(assert (=> b!852578 m!793209))

(assert (=> b!852578 m!793195))

(declare-fun m!793213 () Bool)

(assert (=> b!852578 m!793213))

(assert (=> b!852578 m!793205))

(declare-fun m!793215 () Bool)

(assert (=> b!852578 m!793215))

(assert (=> b!852578 m!793183))

(declare-fun m!793217 () Bool)

(assert (=> b!852578 m!793217))

(declare-fun m!793219 () Bool)

(assert (=> b!852576 m!793219))

(declare-fun m!793221 () Bool)

(assert (=> b!852579 m!793221))

(declare-fun m!793223 () Bool)

(assert (=> bm!38165 m!793223))

(check-sat (not start!73180) (not b!852573) (not b!852574) (not b_next!14113) (not b!852572) (not b!852584) (not bm!38166) (not b!852579) (not b!852576) tp_is_empty!16249 (not b!852585) (not b!852578) (not b_lambda!11627) (not mapNonEmpty!25973) (not bm!38165) b_and!23361)
(check-sat b_and!23361 (not b_next!14113))
