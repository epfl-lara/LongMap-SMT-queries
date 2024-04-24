; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72520 () Bool)

(assert start!72520)

(declare-fun b_free!13537 () Bool)

(declare-fun b_next!13537 () Bool)

(assert (=> start!72520 (= b_free!13537 (not b_next!13537))))

(declare-fun tp!47710 () Bool)

(declare-fun b_and!22633 () Bool)

(assert (=> start!72520 (= tp!47710 b_and!22633)))

(declare-fun b!839186 () Bool)

(declare-fun e!468527 () Bool)

(declare-fun tp_is_empty!15403 () Bool)

(assert (=> b!839186 (= e!468527 tp_is_empty!15403)))

(declare-fun b!839187 () Bool)

(declare-fun res!570384 () Bool)

(declare-fun e!468531 () Bool)

(assert (=> b!839187 (=> (not res!570384) (not e!468531))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839187 (= res!570384 (validKeyInArray!0 k0!854))))

(declare-fun b!839188 () Bool)

(declare-fun e!468532 () Bool)

(declare-fun e!468529 () Bool)

(declare-fun mapRes!24704 () Bool)

(assert (=> b!839188 (= e!468532 (and e!468529 mapRes!24704))))

(declare-fun condMapEmpty!24704 () Bool)

(declare-datatypes ((V!25585 0))(
  ( (V!25586 (val!7749 Int)) )
))
(declare-datatypes ((ValueCell!7262 0))(
  ( (ValueCellFull!7262 (v!10174 V!25585)) (EmptyCell!7262) )
))
(declare-datatypes ((array!47103 0))(
  ( (array!47104 (arr!22578 (Array (_ BitVec 32) ValueCell!7262)) (size!23019 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47103)

(declare-fun mapDefault!24704 () ValueCell!7262)

(assert (=> b!839188 (= condMapEmpty!24704 (= (arr!22578 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7262)) mapDefault!24704)))))

(declare-fun b!839189 () Bool)

(assert (=> b!839189 (= e!468531 (not true))))

(declare-fun e!468528 () Bool)

(assert (=> b!839189 e!468528))

(declare-fun c!91447 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839189 (= c!91447 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25585)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28802 0))(
  ( (Unit!28803) )
))
(declare-fun lt!381032 () Unit!28802)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47105 0))(
  ( (array!47106 (arr!22579 (Array (_ BitVec 32) (_ BitVec 64))) (size!23020 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47105)

(declare-fun minValue!654 () V!25585)

(declare-fun zeroValue!654 () V!25585)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!237 (array!47105 array!47103 (_ BitVec 32) (_ BitVec 32) V!25585 V!25585 (_ BitVec 32) (_ BitVec 64) V!25585 (_ BitVec 32) Int) Unit!28802)

(assert (=> b!839189 (= lt!381032 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!237 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839190 () Bool)

(declare-fun res!570378 () Bool)

(assert (=> b!839190 (=> (not res!570378) (not e!468531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47105 (_ BitVec 32)) Bool)

(assert (=> b!839190 (= res!570378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839192 () Bool)

(declare-fun res!570383 () Bool)

(assert (=> b!839192 (=> (not res!570383) (not e!468531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839192 (= res!570383 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24704 () Bool)

(assert (=> mapIsEmpty!24704 mapRes!24704))

(declare-fun b!839193 () Bool)

(declare-fun res!570382 () Bool)

(assert (=> b!839193 (=> (not res!570382) (not e!468531))))

(assert (=> b!839193 (= res!570382 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23020 _keys!868))))))

(declare-fun b!839194 () Bool)

(declare-datatypes ((tuple2!10174 0))(
  ( (tuple2!10175 (_1!5098 (_ BitVec 64)) (_2!5098 V!25585)) )
))
(declare-datatypes ((List!15959 0))(
  ( (Nil!15956) (Cons!15955 (h!17092 tuple2!10174) (t!22322 List!15959)) )
))
(declare-datatypes ((ListLongMap!8945 0))(
  ( (ListLongMap!8946 (toList!4488 List!15959)) )
))
(declare-fun call!36889 () ListLongMap!8945)

(declare-fun call!36890 () ListLongMap!8945)

(assert (=> b!839194 (= e!468528 (= call!36889 call!36890))))

(declare-fun mapNonEmpty!24704 () Bool)

(declare-fun tp!47711 () Bool)

(assert (=> mapNonEmpty!24704 (= mapRes!24704 (and tp!47711 e!468527))))

(declare-fun mapValue!24704 () ValueCell!7262)

(declare-fun mapKey!24704 () (_ BitVec 32))

(declare-fun mapRest!24704 () (Array (_ BitVec 32) ValueCell!7262))

(assert (=> mapNonEmpty!24704 (= (arr!22578 _values!688) (store mapRest!24704 mapKey!24704 mapValue!24704))))

(declare-fun bm!36886 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2551 (array!47105 array!47103 (_ BitVec 32) (_ BitVec 32) V!25585 V!25585 (_ BitVec 32) Int) ListLongMap!8945)

(assert (=> bm!36886 (= call!36890 (getCurrentListMapNoExtraKeys!2551 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839195 () Bool)

(declare-fun res!570381 () Bool)

(assert (=> b!839195 (=> (not res!570381) (not e!468531))))

(assert (=> b!839195 (= res!570381 (and (= (select (arr!22579 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23020 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun res!570379 () Bool)

(assert (=> start!72520 (=> (not res!570379) (not e!468531))))

(assert (=> start!72520 (= res!570379 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23020 _keys!868))))))

(assert (=> start!72520 e!468531))

(assert (=> start!72520 tp_is_empty!15403))

(assert (=> start!72520 true))

(assert (=> start!72520 tp!47710))

(declare-fun array_inv!18028 (array!47105) Bool)

(assert (=> start!72520 (array_inv!18028 _keys!868)))

(declare-fun array_inv!18029 (array!47103) Bool)

(assert (=> start!72520 (and (array_inv!18029 _values!688) e!468532)))

(declare-fun b!839191 () Bool)

(declare-fun res!570385 () Bool)

(assert (=> b!839191 (=> (not res!570385) (not e!468531))))

(declare-datatypes ((List!15960 0))(
  ( (Nil!15957) (Cons!15956 (h!17093 (_ BitVec 64)) (t!22323 List!15960)) )
))
(declare-fun arrayNoDuplicates!0 (array!47105 (_ BitVec 32) List!15960) Bool)

(assert (=> b!839191 (= res!570385 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15957))))

(declare-fun b!839196 () Bool)

(declare-fun +!2005 (ListLongMap!8945 tuple2!10174) ListLongMap!8945)

(assert (=> b!839196 (= e!468528 (= call!36889 (+!2005 call!36890 (tuple2!10175 k0!854 v!557))))))

(declare-fun bm!36887 () Bool)

(assert (=> bm!36887 (= call!36889 (getCurrentListMapNoExtraKeys!2551 _keys!868 (array!47104 (store (arr!22578 _values!688) i!612 (ValueCellFull!7262 v!557)) (size!23019 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839197 () Bool)

(assert (=> b!839197 (= e!468529 tp_is_empty!15403)))

(declare-fun b!839198 () Bool)

(declare-fun res!570380 () Bool)

(assert (=> b!839198 (=> (not res!570380) (not e!468531))))

(assert (=> b!839198 (= res!570380 (and (= (size!23019 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23020 _keys!868) (size!23019 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72520 res!570379) b!839192))

(assert (= (and b!839192 res!570383) b!839198))

(assert (= (and b!839198 res!570380) b!839190))

(assert (= (and b!839190 res!570378) b!839191))

(assert (= (and b!839191 res!570385) b!839193))

(assert (= (and b!839193 res!570382) b!839187))

(assert (= (and b!839187 res!570384) b!839195))

(assert (= (and b!839195 res!570381) b!839189))

(assert (= (and b!839189 c!91447) b!839196))

(assert (= (and b!839189 (not c!91447)) b!839194))

(assert (= (or b!839196 b!839194) bm!36887))

(assert (= (or b!839196 b!839194) bm!36886))

(assert (= (and b!839188 condMapEmpty!24704) mapIsEmpty!24704))

(assert (= (and b!839188 (not condMapEmpty!24704)) mapNonEmpty!24704))

(get-info :version)

(assert (= (and mapNonEmpty!24704 ((_ is ValueCellFull!7262) mapValue!24704)) b!839186))

(assert (= (and b!839188 ((_ is ValueCellFull!7262) mapDefault!24704)) b!839197))

(assert (= start!72520 b!839188))

(declare-fun m!784067 () Bool)

(assert (=> b!839189 m!784067))

(declare-fun m!784069 () Bool)

(assert (=> bm!36886 m!784069))

(declare-fun m!784071 () Bool)

(assert (=> start!72520 m!784071))

(declare-fun m!784073 () Bool)

(assert (=> start!72520 m!784073))

(declare-fun m!784075 () Bool)

(assert (=> bm!36887 m!784075))

(declare-fun m!784077 () Bool)

(assert (=> bm!36887 m!784077))

(declare-fun m!784079 () Bool)

(assert (=> b!839196 m!784079))

(declare-fun m!784081 () Bool)

(assert (=> b!839195 m!784081))

(declare-fun m!784083 () Bool)

(assert (=> b!839190 m!784083))

(declare-fun m!784085 () Bool)

(assert (=> b!839191 m!784085))

(declare-fun m!784087 () Bool)

(assert (=> b!839187 m!784087))

(declare-fun m!784089 () Bool)

(assert (=> b!839192 m!784089))

(declare-fun m!784091 () Bool)

(assert (=> mapNonEmpty!24704 m!784091))

(check-sat (not b!839190) (not b!839187) (not start!72520) (not b!839191) (not b!839192) tp_is_empty!15403 (not b!839196) (not b_next!13537) (not b!839189) (not bm!36887) (not bm!36886) b_and!22633 (not mapNonEmpty!24704))
(check-sat b_and!22633 (not b_next!13537))
