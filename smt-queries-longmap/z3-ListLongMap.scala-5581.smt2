; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73438 () Bool)

(assert start!73438)

(declare-fun b_free!14185 () Bool)

(declare-fun b_next!14185 () Bool)

(assert (=> start!73438 (= b_free!14185 (not b_next!14185))))

(declare-fun tp!50059 () Bool)

(declare-fun b_and!23539 () Bool)

(assert (=> start!73438 (= tp!50059 b_and!23539)))

(declare-fun b!855405 () Bool)

(declare-fun res!580645 () Bool)

(declare-fun e!477070 () Bool)

(assert (=> b!855405 (=> (not res!580645) (not e!477070))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48887 0))(
  ( (array!48888 (arr!23470 (Array (_ BitVec 32) (_ BitVec 64))) (size!23911 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48887)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855405 (= res!580645 (and (= (select (arr!23470 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855406 () Bool)

(declare-fun res!580646 () Bool)

(assert (=> b!855406 (=> (not res!580646) (not e!477070))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26809 0))(
  ( (V!26810 (val!8208 Int)) )
))
(declare-datatypes ((ValueCell!7721 0))(
  ( (ValueCellFull!7721 (v!10633 V!26809)) (EmptyCell!7721) )
))
(declare-datatypes ((array!48889 0))(
  ( (array!48890 (arr!23471 (Array (_ BitVec 32) ValueCell!7721)) (size!23912 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48889)

(assert (=> b!855406 (= res!580646 (and (= (size!23912 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23911 _keys!868) (size!23912 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855407 () Bool)

(declare-fun e!477065 () Bool)

(declare-fun e!477067 () Bool)

(declare-fun mapRes!26081 () Bool)

(assert (=> b!855407 (= e!477065 (and e!477067 mapRes!26081))))

(declare-fun condMapEmpty!26081 () Bool)

(declare-fun mapDefault!26081 () ValueCell!7721)

(assert (=> b!855407 (= condMapEmpty!26081 (= (arr!23471 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7721)) mapDefault!26081)))))

(declare-fun b!855408 () Bool)

(declare-fun tp_is_empty!16321 () Bool)

(assert (=> b!855408 (= e!477067 tp_is_empty!16321)))

(declare-fun b!855409 () Bool)

(declare-fun e!477069 () Bool)

(assert (=> b!855409 (= e!477069 tp_is_empty!16321)))

(declare-fun bm!38452 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10730 0))(
  ( (tuple2!10731 (_1!5376 (_ BitVec 64)) (_2!5376 V!26809)) )
))
(declare-datatypes ((List!16577 0))(
  ( (Nil!16574) (Cons!16573 (h!17710 tuple2!10730) (t!23200 List!16577)) )
))
(declare-datatypes ((ListLongMap!9501 0))(
  ( (ListLongMap!9502 (toList!4766 List!16577)) )
))
(declare-fun call!38455 () ListLongMap!9501)

(declare-fun minValue!654 () V!26809)

(declare-fun zeroValue!654 () V!26809)

(declare-fun getCurrentListMapNoExtraKeys!2822 (array!48887 array!48889 (_ BitVec 32) (_ BitVec 32) V!26809 V!26809 (_ BitVec 32) Int) ListLongMap!9501)

(assert (=> bm!38452 (= call!38455 (getCurrentListMapNoExtraKeys!2822 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!580644 () Bool)

(assert (=> start!73438 (=> (not res!580644) (not e!477070))))

(assert (=> start!73438 (= res!580644 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23911 _keys!868))))))

(assert (=> start!73438 e!477070))

(assert (=> start!73438 tp_is_empty!16321))

(assert (=> start!73438 true))

(assert (=> start!73438 tp!50059))

(declare-fun array_inv!18650 (array!48887) Bool)

(assert (=> start!73438 (array_inv!18650 _keys!868)))

(declare-fun array_inv!18651 (array!48889) Bool)

(assert (=> start!73438 (and (array_inv!18651 _values!688) e!477065)))

(declare-fun b!855410 () Bool)

(declare-fun e!477064 () Bool)

(assert (=> b!855410 (= e!477070 e!477064)))

(declare-fun res!580643 () Bool)

(assert (=> b!855410 (=> (not res!580643) (not e!477064))))

(assert (=> b!855410 (= res!580643 (= from!1053 i!612))))

(declare-fun lt!385781 () array!48889)

(declare-fun lt!385780 () ListLongMap!9501)

(assert (=> b!855410 (= lt!385780 (getCurrentListMapNoExtraKeys!2822 _keys!868 lt!385781 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26809)

(assert (=> b!855410 (= lt!385781 (array!48890 (store (arr!23471 _values!688) i!612 (ValueCellFull!7721 v!557)) (size!23912 _values!688)))))

(declare-fun lt!385775 () ListLongMap!9501)

(assert (=> b!855410 (= lt!385775 (getCurrentListMapNoExtraKeys!2822 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855411 () Bool)

(declare-fun e!477066 () Bool)

(assert (=> b!855411 (= e!477066 true)))

(declare-fun lt!385782 () ListLongMap!9501)

(declare-fun lt!385776 () tuple2!10730)

(declare-fun lt!385784 () V!26809)

(declare-fun +!2208 (ListLongMap!9501 tuple2!10730) ListLongMap!9501)

(assert (=> b!855411 (= (+!2208 lt!385782 lt!385776) (+!2208 (+!2208 lt!385782 (tuple2!10731 k0!854 lt!385784)) lt!385776))))

(declare-fun lt!385778 () V!26809)

(assert (=> b!855411 (= lt!385776 (tuple2!10731 k0!854 lt!385778))))

(declare-datatypes ((Unit!29172 0))(
  ( (Unit!29173) )
))
(declare-fun lt!385779 () Unit!29172)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!330 (ListLongMap!9501 (_ BitVec 64) V!26809 V!26809) Unit!29172)

(assert (=> b!855411 (= lt!385779 (addSameAsAddTwiceSameKeyDiffValues!330 lt!385782 k0!854 lt!385784 lt!385778))))

(declare-fun lt!385777 () V!26809)

(declare-fun get!12389 (ValueCell!7721 V!26809) V!26809)

(assert (=> b!855411 (= lt!385784 (get!12389 (select (arr!23471 _values!688) from!1053) lt!385777))))

(assert (=> b!855411 (= lt!385780 (+!2208 lt!385782 (tuple2!10731 (select (arr!23470 _keys!868) from!1053) lt!385778)))))

(assert (=> b!855411 (= lt!385778 (get!12389 (select (store (arr!23471 _values!688) i!612 (ValueCellFull!7721 v!557)) from!1053) lt!385777))))

(declare-fun dynLambda!1077 (Int (_ BitVec 64)) V!26809)

(assert (=> b!855411 (= lt!385777 (dynLambda!1077 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!855411 (= lt!385782 (getCurrentListMapNoExtraKeys!2822 _keys!868 lt!385781 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855412 () Bool)

(declare-fun res!580650 () Bool)

(assert (=> b!855412 (=> (not res!580650) (not e!477070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855412 (= res!580650 (validKeyInArray!0 k0!854))))

(declare-fun b!855413 () Bool)

(declare-fun res!580648 () Bool)

(assert (=> b!855413 (=> (not res!580648) (not e!477070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855413 (= res!580648 (validMask!0 mask!1196))))

(declare-fun b!855414 () Bool)

(declare-fun e!477063 () Bool)

(declare-fun call!38456 () ListLongMap!9501)

(assert (=> b!855414 (= e!477063 (= call!38456 call!38455))))

(declare-fun b!855415 () Bool)

(declare-fun res!580647 () Bool)

(assert (=> b!855415 (=> (not res!580647) (not e!477070))))

(declare-datatypes ((List!16578 0))(
  ( (Nil!16575) (Cons!16574 (h!17711 (_ BitVec 64)) (t!23201 List!16578)) )
))
(declare-fun arrayNoDuplicates!0 (array!48887 (_ BitVec 32) List!16578) Bool)

(assert (=> b!855415 (= res!580647 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16575))))

(declare-fun bm!38453 () Bool)

(assert (=> bm!38453 (= call!38456 (getCurrentListMapNoExtraKeys!2822 _keys!868 lt!385781 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855416 () Bool)

(assert (=> b!855416 (= e!477063 (= call!38456 (+!2208 call!38455 (tuple2!10731 k0!854 v!557))))))

(declare-fun b!855417 () Bool)

(declare-fun res!580642 () Bool)

(assert (=> b!855417 (=> (not res!580642) (not e!477070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48887 (_ BitVec 32)) Bool)

(assert (=> b!855417 (= res!580642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26081 () Bool)

(assert (=> mapIsEmpty!26081 mapRes!26081))

(declare-fun b!855418 () Bool)

(assert (=> b!855418 (= e!477064 (not e!477066))))

(declare-fun res!580649 () Bool)

(assert (=> b!855418 (=> res!580649 e!477066)))

(assert (=> b!855418 (= res!580649 (not (validKeyInArray!0 (select (arr!23470 _keys!868) from!1053))))))

(assert (=> b!855418 e!477063))

(declare-fun c!92230 () Bool)

(assert (=> b!855418 (= c!92230 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!385783 () Unit!29172)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!408 (array!48887 array!48889 (_ BitVec 32) (_ BitVec 32) V!26809 V!26809 (_ BitVec 32) (_ BitVec 64) V!26809 (_ BitVec 32) Int) Unit!29172)

(assert (=> b!855418 (= lt!385783 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!408 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855419 () Bool)

(declare-fun res!580651 () Bool)

(assert (=> b!855419 (=> (not res!580651) (not e!477070))))

(assert (=> b!855419 (= res!580651 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23911 _keys!868))))))

(declare-fun mapNonEmpty!26081 () Bool)

(declare-fun tp!50060 () Bool)

(assert (=> mapNonEmpty!26081 (= mapRes!26081 (and tp!50060 e!477069))))

(declare-fun mapKey!26081 () (_ BitVec 32))

(declare-fun mapRest!26081 () (Array (_ BitVec 32) ValueCell!7721))

(declare-fun mapValue!26081 () ValueCell!7721)

(assert (=> mapNonEmpty!26081 (= (arr!23471 _values!688) (store mapRest!26081 mapKey!26081 mapValue!26081))))

(assert (= (and start!73438 res!580644) b!855413))

(assert (= (and b!855413 res!580648) b!855406))

(assert (= (and b!855406 res!580646) b!855417))

(assert (= (and b!855417 res!580642) b!855415))

(assert (= (and b!855415 res!580647) b!855419))

(assert (= (and b!855419 res!580651) b!855412))

(assert (= (and b!855412 res!580650) b!855405))

(assert (= (and b!855405 res!580645) b!855410))

(assert (= (and b!855410 res!580643) b!855418))

(assert (= (and b!855418 c!92230) b!855416))

(assert (= (and b!855418 (not c!92230)) b!855414))

(assert (= (or b!855416 b!855414) bm!38453))

(assert (= (or b!855416 b!855414) bm!38452))

(assert (= (and b!855418 (not res!580649)) b!855411))

(assert (= (and b!855407 condMapEmpty!26081) mapIsEmpty!26081))

(assert (= (and b!855407 (not condMapEmpty!26081)) mapNonEmpty!26081))

(get-info :version)

(assert (= (and mapNonEmpty!26081 ((_ is ValueCellFull!7721) mapValue!26081)) b!855409))

(assert (= (and b!855407 ((_ is ValueCellFull!7721) mapDefault!26081)) b!855408))

(assert (= start!73438 b!855407))

(declare-fun b_lambda!11731 () Bool)

(assert (=> (not b_lambda!11731) (not b!855411)))

(declare-fun t!23199 () Bool)

(declare-fun tb!4479 () Bool)

(assert (=> (and start!73438 (= defaultEntry!696 defaultEntry!696) t!23199) tb!4479))

(declare-fun result!8577 () Bool)

(assert (=> tb!4479 (= result!8577 tp_is_empty!16321)))

(assert (=> b!855411 t!23199))

(declare-fun b_and!23541 () Bool)

(assert (= b_and!23539 (and (=> t!23199 result!8577) b_and!23541)))

(declare-fun m!797165 () Bool)

(assert (=> mapNonEmpty!26081 m!797165))

(declare-fun m!797167 () Bool)

(assert (=> b!855405 m!797167))

(declare-fun m!797169 () Bool)

(assert (=> b!855410 m!797169))

(declare-fun m!797171 () Bool)

(assert (=> b!855410 m!797171))

(declare-fun m!797173 () Bool)

(assert (=> b!855410 m!797173))

(declare-fun m!797175 () Bool)

(assert (=> start!73438 m!797175))

(declare-fun m!797177 () Bool)

(assert (=> start!73438 m!797177))

(declare-fun m!797179 () Bool)

(assert (=> b!855413 m!797179))

(declare-fun m!797181 () Bool)

(assert (=> b!855412 m!797181))

(declare-fun m!797183 () Bool)

(assert (=> b!855416 m!797183))

(declare-fun m!797185 () Bool)

(assert (=> b!855415 m!797185))

(declare-fun m!797187 () Bool)

(assert (=> b!855411 m!797187))

(declare-fun m!797189 () Bool)

(assert (=> b!855411 m!797189))

(declare-fun m!797191 () Bool)

(assert (=> b!855411 m!797191))

(declare-fun m!797193 () Bool)

(assert (=> b!855411 m!797193))

(declare-fun m!797195 () Bool)

(assert (=> b!855411 m!797195))

(assert (=> b!855411 m!797189))

(declare-fun m!797197 () Bool)

(assert (=> b!855411 m!797197))

(declare-fun m!797199 () Bool)

(assert (=> b!855411 m!797199))

(declare-fun m!797201 () Bool)

(assert (=> b!855411 m!797201))

(declare-fun m!797203 () Bool)

(assert (=> b!855411 m!797203))

(assert (=> b!855411 m!797199))

(declare-fun m!797205 () Bool)

(assert (=> b!855411 m!797205))

(declare-fun m!797207 () Bool)

(assert (=> b!855411 m!797207))

(declare-fun m!797209 () Bool)

(assert (=> b!855411 m!797209))

(assert (=> b!855411 m!797207))

(assert (=> b!855411 m!797171))

(declare-fun m!797211 () Bool)

(assert (=> bm!38452 m!797211))

(assert (=> b!855418 m!797201))

(assert (=> b!855418 m!797201))

(declare-fun m!797213 () Bool)

(assert (=> b!855418 m!797213))

(declare-fun m!797215 () Bool)

(assert (=> b!855418 m!797215))

(assert (=> bm!38453 m!797195))

(declare-fun m!797217 () Bool)

(assert (=> b!855417 m!797217))

(check-sat (not b!855413) (not b_lambda!11731) (not b!855412) (not b!855410) tp_is_empty!16321 (not b!855411) (not b!855418) (not b!855416) b_and!23541 (not b_next!14185) (not b!855417) (not bm!38452) (not bm!38453) (not b!855415) (not start!73438) (not mapNonEmpty!26081))
(check-sat b_and!23541 (not b_next!14185))
