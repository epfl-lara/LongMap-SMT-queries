; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73336 () Bool)

(assert start!73336)

(declare-fun b_free!14083 () Bool)

(declare-fun b_next!14083 () Bool)

(assert (=> start!73336 (= b_free!14083 (not b_next!14083))))

(declare-fun tp!49753 () Bool)

(declare-fun b_and!23335 () Bool)

(assert (=> start!73336 (= tp!49753 b_and!23335)))

(declare-fun b!853008 () Bool)

(declare-fun res!579118 () Bool)

(declare-fun e!475845 () Bool)

(assert (=> b!853008 (=> (not res!579118) (not e!475845))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853008 (= res!579118 (validKeyInArray!0 k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun bm!38146 () Bool)

(declare-datatypes ((V!26673 0))(
  ( (V!26674 (val!8157 Int)) )
))
(declare-fun minValue!654 () V!26673)

(declare-fun zeroValue!654 () V!26673)

(declare-datatypes ((ValueCell!7670 0))(
  ( (ValueCellFull!7670 (v!10582 V!26673)) (EmptyCell!7670) )
))
(declare-datatypes ((array!48687 0))(
  ( (array!48688 (arr!23370 (Array (_ BitVec 32) ValueCell!7670)) (size!23811 (_ BitVec 32))) )
))
(declare-fun lt!384250 () array!48687)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48689 0))(
  ( (array!48690 (arr!23371 (Array (_ BitVec 32) (_ BitVec 64))) (size!23812 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48689)

(declare-datatypes ((tuple2!10632 0))(
  ( (tuple2!10633 (_1!5327 (_ BitVec 64)) (_2!5327 V!26673)) )
))
(declare-datatypes ((List!16487 0))(
  ( (Nil!16484) (Cons!16483 (h!17620 tuple2!10632) (t!23008 List!16487)) )
))
(declare-datatypes ((ListLongMap!9403 0))(
  ( (ListLongMap!9404 (toList!4717 List!16487)) )
))
(declare-fun call!38149 () ListLongMap!9403)

(declare-fun getCurrentListMapNoExtraKeys!2775 (array!48689 array!48687 (_ BitVec 32) (_ BitVec 32) V!26673 V!26673 (_ BitVec 32) Int) ListLongMap!9403)

(assert (=> bm!38146 (= call!38149 (getCurrentListMapNoExtraKeys!2775 _keys!868 lt!384250 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25928 () Bool)

(declare-fun mapRes!25928 () Bool)

(assert (=> mapIsEmpty!25928 mapRes!25928))

(declare-fun b!853010 () Bool)

(declare-fun e!475840 () Bool)

(declare-fun e!475842 () Bool)

(assert (=> b!853010 (= e!475840 (not e!475842))))

(declare-fun res!579117 () Bool)

(assert (=> b!853010 (=> res!579117 e!475842)))

(assert (=> b!853010 (= res!579117 (not (validKeyInArray!0 (select (arr!23371 _keys!868) from!1053))))))

(declare-fun e!475841 () Bool)

(assert (=> b!853010 e!475841))

(declare-fun c!92077 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853010 (= c!92077 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun _values!688 () array!48687)

(declare-fun v!557 () V!26673)

(declare-datatypes ((Unit!29088 0))(
  ( (Unit!29089) )
))
(declare-fun lt!384248 () Unit!29088)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!372 (array!48689 array!48687 (_ BitVec 32) (_ BitVec 32) V!26673 V!26673 (_ BitVec 32) (_ BitVec 64) V!26673 (_ BitVec 32) Int) Unit!29088)

(assert (=> b!853010 (= lt!384248 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!372 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853011 () Bool)

(assert (=> b!853011 (= e!475842 true)))

(declare-fun lt!384245 () ListLongMap!9403)

(declare-fun lt!384254 () tuple2!10632)

(declare-fun lt!384249 () V!26673)

(declare-fun +!2164 (ListLongMap!9403 tuple2!10632) ListLongMap!9403)

(assert (=> b!853011 (= (+!2164 lt!384245 lt!384254) (+!2164 (+!2164 lt!384245 (tuple2!10633 k0!854 lt!384249)) lt!384254))))

(declare-fun lt!384247 () V!26673)

(assert (=> b!853011 (= lt!384254 (tuple2!10633 k0!854 lt!384247))))

(declare-fun lt!384253 () Unit!29088)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!292 (ListLongMap!9403 (_ BitVec 64) V!26673 V!26673) Unit!29088)

(assert (=> b!853011 (= lt!384253 (addSameAsAddTwiceSameKeyDiffValues!292 lt!384245 k0!854 lt!384249 lt!384247))))

(declare-fun lt!384252 () V!26673)

(declare-fun get!12317 (ValueCell!7670 V!26673) V!26673)

(assert (=> b!853011 (= lt!384249 (get!12317 (select (arr!23370 _values!688) from!1053) lt!384252))))

(declare-fun lt!384246 () ListLongMap!9403)

(assert (=> b!853011 (= lt!384246 (+!2164 lt!384245 (tuple2!10633 (select (arr!23371 _keys!868) from!1053) lt!384247)))))

(assert (=> b!853011 (= lt!384247 (get!12317 (select (store (arr!23370 _values!688) i!612 (ValueCellFull!7670 v!557)) from!1053) lt!384252))))

(declare-fun dynLambda!1039 (Int (_ BitVec 64)) V!26673)

(assert (=> b!853011 (= lt!384252 (dynLambda!1039 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853011 (= lt!384245 (getCurrentListMapNoExtraKeys!2775 _keys!868 lt!384250 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853012 () Bool)

(declare-fun e!475839 () Bool)

(declare-fun tp_is_empty!16219 () Bool)

(assert (=> b!853012 (= e!475839 tp_is_empty!16219)))

(declare-fun b!853013 () Bool)

(declare-fun res!579121 () Bool)

(assert (=> b!853013 (=> (not res!579121) (not e!475845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853013 (= res!579121 (validMask!0 mask!1196))))

(declare-fun b!853014 () Bool)

(declare-fun res!579119 () Bool)

(assert (=> b!853014 (=> (not res!579119) (not e!475845))))

(assert (=> b!853014 (= res!579119 (and (= (select (arr!23371 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853015 () Bool)

(declare-fun call!38150 () ListLongMap!9403)

(assert (=> b!853015 (= e!475841 (= call!38149 (+!2164 call!38150 (tuple2!10633 k0!854 v!557))))))

(declare-fun b!853016 () Bool)

(assert (=> b!853016 (= e!475841 (= call!38149 call!38150))))

(declare-fun res!579120 () Bool)

(assert (=> start!73336 (=> (not res!579120) (not e!475845))))

(assert (=> start!73336 (= res!579120 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23812 _keys!868))))))

(assert (=> start!73336 e!475845))

(assert (=> start!73336 tp_is_empty!16219))

(assert (=> start!73336 true))

(assert (=> start!73336 tp!49753))

(declare-fun array_inv!18586 (array!48689) Bool)

(assert (=> start!73336 (array_inv!18586 _keys!868)))

(declare-fun e!475846 () Bool)

(declare-fun array_inv!18587 (array!48687) Bool)

(assert (=> start!73336 (and (array_inv!18587 _values!688) e!475846)))

(declare-fun b!853009 () Bool)

(declare-fun res!579112 () Bool)

(assert (=> b!853009 (=> (not res!579112) (not e!475845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48689 (_ BitVec 32)) Bool)

(assert (=> b!853009 (= res!579112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25928 () Bool)

(declare-fun tp!49754 () Bool)

(declare-fun e!475843 () Bool)

(assert (=> mapNonEmpty!25928 (= mapRes!25928 (and tp!49754 e!475843))))

(declare-fun mapValue!25928 () ValueCell!7670)

(declare-fun mapKey!25928 () (_ BitVec 32))

(declare-fun mapRest!25928 () (Array (_ BitVec 32) ValueCell!7670))

(assert (=> mapNonEmpty!25928 (= (arr!23370 _values!688) (store mapRest!25928 mapKey!25928 mapValue!25928))))

(declare-fun b!853017 () Bool)

(declare-fun res!579115 () Bool)

(assert (=> b!853017 (=> (not res!579115) (not e!475845))))

(declare-datatypes ((List!16488 0))(
  ( (Nil!16485) (Cons!16484 (h!17621 (_ BitVec 64)) (t!23009 List!16488)) )
))
(declare-fun arrayNoDuplicates!0 (array!48689 (_ BitVec 32) List!16488) Bool)

(assert (=> b!853017 (= res!579115 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16485))))

(declare-fun b!853018 () Bool)

(assert (=> b!853018 (= e!475843 tp_is_empty!16219)))

(declare-fun b!853019 () Bool)

(declare-fun res!579114 () Bool)

(assert (=> b!853019 (=> (not res!579114) (not e!475845))))

(assert (=> b!853019 (= res!579114 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23812 _keys!868))))))

(declare-fun b!853020 () Bool)

(assert (=> b!853020 (= e!475845 e!475840)))

(declare-fun res!579116 () Bool)

(assert (=> b!853020 (=> (not res!579116) (not e!475840))))

(assert (=> b!853020 (= res!579116 (= from!1053 i!612))))

(assert (=> b!853020 (= lt!384246 (getCurrentListMapNoExtraKeys!2775 _keys!868 lt!384250 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853020 (= lt!384250 (array!48688 (store (arr!23370 _values!688) i!612 (ValueCellFull!7670 v!557)) (size!23811 _values!688)))))

(declare-fun lt!384251 () ListLongMap!9403)

(assert (=> b!853020 (= lt!384251 (getCurrentListMapNoExtraKeys!2775 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853021 () Bool)

(assert (=> b!853021 (= e!475846 (and e!475839 mapRes!25928))))

(declare-fun condMapEmpty!25928 () Bool)

(declare-fun mapDefault!25928 () ValueCell!7670)

(assert (=> b!853021 (= condMapEmpty!25928 (= (arr!23370 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7670)) mapDefault!25928)))))

(declare-fun b!853022 () Bool)

(declare-fun res!579113 () Bool)

(assert (=> b!853022 (=> (not res!579113) (not e!475845))))

(assert (=> b!853022 (= res!579113 (and (= (size!23811 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23812 _keys!868) (size!23811 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38147 () Bool)

(assert (=> bm!38147 (= call!38150 (getCurrentListMapNoExtraKeys!2775 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73336 res!579120) b!853013))

(assert (= (and b!853013 res!579121) b!853022))

(assert (= (and b!853022 res!579113) b!853009))

(assert (= (and b!853009 res!579112) b!853017))

(assert (= (and b!853017 res!579115) b!853019))

(assert (= (and b!853019 res!579114) b!853008))

(assert (= (and b!853008 res!579118) b!853014))

(assert (= (and b!853014 res!579119) b!853020))

(assert (= (and b!853020 res!579116) b!853010))

(assert (= (and b!853010 c!92077) b!853015))

(assert (= (and b!853010 (not c!92077)) b!853016))

(assert (= (or b!853015 b!853016) bm!38146))

(assert (= (or b!853015 b!853016) bm!38147))

(assert (= (and b!853010 (not res!579117)) b!853011))

(assert (= (and b!853021 condMapEmpty!25928) mapIsEmpty!25928))

(assert (= (and b!853021 (not condMapEmpty!25928)) mapNonEmpty!25928))

(get-info :version)

(assert (= (and mapNonEmpty!25928 ((_ is ValueCellFull!7670) mapValue!25928)) b!853018))

(assert (= (and b!853021 ((_ is ValueCellFull!7670) mapDefault!25928)) b!853012))

(assert (= start!73336 b!853021))

(declare-fun b_lambda!11629 () Bool)

(assert (=> (not b_lambda!11629) (not b!853011)))

(declare-fun t!23007 () Bool)

(declare-fun tb!4377 () Bool)

(assert (=> (and start!73336 (= defaultEntry!696 defaultEntry!696) t!23007) tb!4377))

(declare-fun result!8373 () Bool)

(assert (=> tb!4377 (= result!8373 tp_is_empty!16219)))

(assert (=> b!853011 t!23007))

(declare-fun b_and!23337 () Bool)

(assert (= b_and!23335 (and (=> t!23007 result!8373) b_and!23337)))

(declare-fun m!794407 () Bool)

(assert (=> b!853009 m!794407))

(declare-fun m!794409 () Bool)

(assert (=> b!853010 m!794409))

(assert (=> b!853010 m!794409))

(declare-fun m!794411 () Bool)

(assert (=> b!853010 m!794411))

(declare-fun m!794413 () Bool)

(assert (=> b!853010 m!794413))

(declare-fun m!794415 () Bool)

(assert (=> b!853013 m!794415))

(declare-fun m!794417 () Bool)

(assert (=> bm!38147 m!794417))

(declare-fun m!794419 () Bool)

(assert (=> bm!38146 m!794419))

(declare-fun m!794421 () Bool)

(assert (=> b!853014 m!794421))

(declare-fun m!794423 () Bool)

(assert (=> b!853011 m!794423))

(declare-fun m!794425 () Bool)

(assert (=> b!853011 m!794425))

(assert (=> b!853011 m!794419))

(declare-fun m!794427 () Bool)

(assert (=> b!853011 m!794427))

(declare-fun m!794429 () Bool)

(assert (=> b!853011 m!794429))

(assert (=> b!853011 m!794423))

(assert (=> b!853011 m!794427))

(declare-fun m!794431 () Bool)

(assert (=> b!853011 m!794431))

(declare-fun m!794433 () Bool)

(assert (=> b!853011 m!794433))

(declare-fun m!794435 () Bool)

(assert (=> b!853011 m!794435))

(declare-fun m!794437 () Bool)

(assert (=> b!853011 m!794437))

(declare-fun m!794439 () Bool)

(assert (=> b!853011 m!794439))

(assert (=> b!853011 m!794437))

(declare-fun m!794441 () Bool)

(assert (=> b!853011 m!794441))

(assert (=> b!853011 m!794409))

(declare-fun m!794443 () Bool)

(assert (=> b!853011 m!794443))

(declare-fun m!794445 () Bool)

(assert (=> b!853008 m!794445))

(declare-fun m!794447 () Bool)

(assert (=> b!853017 m!794447))

(declare-fun m!794449 () Bool)

(assert (=> b!853015 m!794449))

(declare-fun m!794451 () Bool)

(assert (=> start!73336 m!794451))

(declare-fun m!794453 () Bool)

(assert (=> start!73336 m!794453))

(declare-fun m!794455 () Bool)

(assert (=> mapNonEmpty!25928 m!794455))

(declare-fun m!794457 () Bool)

(assert (=> b!853020 m!794457))

(assert (=> b!853020 m!794439))

(declare-fun m!794459 () Bool)

(assert (=> b!853020 m!794459))

(check-sat (not b!853008) (not bm!38146) (not b!853020) tp_is_empty!16219 (not bm!38147) (not b_next!14083) (not b_lambda!11629) (not b!853010) (not b!853015) (not b!853009) (not mapNonEmpty!25928) (not start!73336) (not b!853013) (not b!853017) (not b!853011) b_and!23337)
(check-sat b_and!23337 (not b_next!14083))
