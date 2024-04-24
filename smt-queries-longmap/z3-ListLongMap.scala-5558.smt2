; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73300 () Bool)

(assert start!73300)

(declare-fun b_free!14047 () Bool)

(declare-fun b_next!14047 () Bool)

(assert (=> start!73300 (= b_free!14047 (not b_next!14047))))

(declare-fun tp!49646 () Bool)

(declare-fun b_and!23263 () Bool)

(assert (=> start!73300 (= tp!49646 b_and!23263)))

(declare-fun res!578580 () Bool)

(declare-fun e!475412 () Bool)

(assert (=> start!73300 (=> (not res!578580) (not e!475412))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48617 0))(
  ( (array!48618 (arr!23335 (Array (_ BitVec 32) (_ BitVec 64))) (size!23776 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48617)

(assert (=> start!73300 (= res!578580 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23776 _keys!868))))))

(assert (=> start!73300 e!475412))

(declare-fun tp_is_empty!16183 () Bool)

(assert (=> start!73300 tp_is_empty!16183))

(assert (=> start!73300 true))

(assert (=> start!73300 tp!49646))

(declare-fun array_inv!18562 (array!48617) Bool)

(assert (=> start!73300 (array_inv!18562 _keys!868)))

(declare-datatypes ((V!26625 0))(
  ( (V!26626 (val!8139 Int)) )
))
(declare-datatypes ((ValueCell!7652 0))(
  ( (ValueCellFull!7652 (v!10564 V!26625)) (EmptyCell!7652) )
))
(declare-datatypes ((array!48619 0))(
  ( (array!48620 (arr!23336 (Array (_ BitVec 32) ValueCell!7652)) (size!23777 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48619)

(declare-fun e!475410 () Bool)

(declare-fun array_inv!18563 (array!48619) Bool)

(assert (=> start!73300 (and (array_inv!18563 _values!688) e!475410)))

(declare-fun b!852162 () Bool)

(declare-fun e!475413 () Bool)

(declare-fun v!557 () V!26625)

(declare-datatypes ((tuple2!10600 0))(
  ( (tuple2!10601 (_1!5311 (_ BitVec 64)) (_2!5311 V!26625)) )
))
(declare-datatypes ((List!16458 0))(
  ( (Nil!16455) (Cons!16454 (h!17591 tuple2!10600) (t!22943 List!16458)) )
))
(declare-datatypes ((ListLongMap!9371 0))(
  ( (ListLongMap!9372 (toList!4701 List!16458)) )
))
(declare-fun call!38042 () ListLongMap!9371)

(declare-fun call!38041 () ListLongMap!9371)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2148 (ListLongMap!9371 tuple2!10600) ListLongMap!9371)

(assert (=> b!852162 (= e!475413 (= call!38041 (+!2148 call!38042 (tuple2!10601 k0!854 v!557))))))

(declare-fun b!852163 () Bool)

(declare-fun e!475411 () Bool)

(assert (=> b!852163 (= e!475412 e!475411)))

(declare-fun res!578572 () Bool)

(assert (=> b!852163 (=> (not res!578572) (not e!475411))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852163 (= res!578572 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!383712 () ListLongMap!9371)

(declare-fun minValue!654 () V!26625)

(declare-fun zeroValue!654 () V!26625)

(declare-fun lt!383706 () array!48619)

(declare-fun getCurrentListMapNoExtraKeys!2759 (array!48617 array!48619 (_ BitVec 32) (_ BitVec 32) V!26625 V!26625 (_ BitVec 32) Int) ListLongMap!9371)

(assert (=> b!852163 (= lt!383712 (getCurrentListMapNoExtraKeys!2759 _keys!868 lt!383706 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852163 (= lt!383706 (array!48620 (store (arr!23336 _values!688) i!612 (ValueCellFull!7652 v!557)) (size!23777 _values!688)))))

(declare-fun lt!383709 () ListLongMap!9371)

(assert (=> b!852163 (= lt!383709 (getCurrentListMapNoExtraKeys!2759 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852164 () Bool)

(declare-fun e!475414 () Bool)

(assert (=> b!852164 (= e!475414 tp_is_empty!16183)))

(declare-fun mapIsEmpty!25874 () Bool)

(declare-fun mapRes!25874 () Bool)

(assert (=> mapIsEmpty!25874 mapRes!25874))

(declare-fun b!852165 () Bool)

(declare-fun res!578579 () Bool)

(assert (=> b!852165 (=> (not res!578579) (not e!475412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852165 (= res!578579 (validMask!0 mask!1196))))

(declare-fun b!852166 () Bool)

(declare-fun res!578578 () Bool)

(assert (=> b!852166 (=> (not res!578578) (not e!475412))))

(assert (=> b!852166 (= res!578578 (and (= (size!23777 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23776 _keys!868) (size!23777 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852167 () Bool)

(declare-fun e!475409 () Bool)

(assert (=> b!852167 (= e!475409 true)))

(declare-fun lt!383713 () tuple2!10600)

(declare-fun lt!383707 () V!26625)

(declare-fun lt!383710 () ListLongMap!9371)

(assert (=> b!852167 (= (+!2148 lt!383710 lt!383713) (+!2148 (+!2148 lt!383710 (tuple2!10601 k0!854 lt!383707)) lt!383713))))

(declare-fun lt!383708 () V!26625)

(assert (=> b!852167 (= lt!383713 (tuple2!10601 k0!854 lt!383708))))

(declare-datatypes ((Unit!29058 0))(
  ( (Unit!29059) )
))
(declare-fun lt!383714 () Unit!29058)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!277 (ListLongMap!9371 (_ BitVec 64) V!26625 V!26625) Unit!29058)

(assert (=> b!852167 (= lt!383714 (addSameAsAddTwiceSameKeyDiffValues!277 lt!383710 k0!854 lt!383707 lt!383708))))

(declare-fun lt!383705 () V!26625)

(declare-fun get!12290 (ValueCell!7652 V!26625) V!26625)

(assert (=> b!852167 (= lt!383707 (get!12290 (select (arr!23336 _values!688) from!1053) lt!383705))))

(assert (=> b!852167 (= lt!383712 (+!2148 lt!383710 (tuple2!10601 (select (arr!23335 _keys!868) from!1053) lt!383708)))))

(assert (=> b!852167 (= lt!383708 (get!12290 (select (store (arr!23336 _values!688) i!612 (ValueCellFull!7652 v!557)) from!1053) lt!383705))))

(declare-fun dynLambda!1024 (Int (_ BitVec 64)) V!26625)

(assert (=> b!852167 (= lt!383705 (dynLambda!1024 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852167 (= lt!383710 (getCurrentListMapNoExtraKeys!2759 _keys!868 lt!383706 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38038 () Bool)

(assert (=> bm!38038 (= call!38041 (getCurrentListMapNoExtraKeys!2759 _keys!868 lt!383706 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852168 () Bool)

(declare-fun res!578574 () Bool)

(assert (=> b!852168 (=> (not res!578574) (not e!475412))))

(assert (=> b!852168 (= res!578574 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23776 _keys!868))))))

(declare-fun bm!38039 () Bool)

(assert (=> bm!38039 (= call!38042 (getCurrentListMapNoExtraKeys!2759 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852169 () Bool)

(assert (=> b!852169 (= e!475411 (not e!475409))))

(declare-fun res!578577 () Bool)

(assert (=> b!852169 (=> res!578577 e!475409)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852169 (= res!578577 (not (validKeyInArray!0 (select (arr!23335 _keys!868) from!1053))))))

(assert (=> b!852169 e!475413))

(declare-fun c!92023 () Bool)

(assert (=> b!852169 (= c!92023 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383711 () Unit!29058)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!362 (array!48617 array!48619 (_ BitVec 32) (_ BitVec 32) V!26625 V!26625 (_ BitVec 32) (_ BitVec 64) V!26625 (_ BitVec 32) Int) Unit!29058)

(assert (=> b!852169 (= lt!383711 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!362 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852170 () Bool)

(assert (=> b!852170 (= e!475410 (and e!475414 mapRes!25874))))

(declare-fun condMapEmpty!25874 () Bool)

(declare-fun mapDefault!25874 () ValueCell!7652)

(assert (=> b!852170 (= condMapEmpty!25874 (= (arr!23336 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7652)) mapDefault!25874)))))

(declare-fun b!852171 () Bool)

(declare-fun res!578575 () Bool)

(assert (=> b!852171 (=> (not res!578575) (not e!475412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48617 (_ BitVec 32)) Bool)

(assert (=> b!852171 (= res!578575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852172 () Bool)

(declare-fun res!578573 () Bool)

(assert (=> b!852172 (=> (not res!578573) (not e!475412))))

(assert (=> b!852172 (= res!578573 (and (= (select (arr!23335 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!25874 () Bool)

(declare-fun tp!49645 () Bool)

(declare-fun e!475407 () Bool)

(assert (=> mapNonEmpty!25874 (= mapRes!25874 (and tp!49645 e!475407))))

(declare-fun mapValue!25874 () ValueCell!7652)

(declare-fun mapRest!25874 () (Array (_ BitVec 32) ValueCell!7652))

(declare-fun mapKey!25874 () (_ BitVec 32))

(assert (=> mapNonEmpty!25874 (= (arr!23336 _values!688) (store mapRest!25874 mapKey!25874 mapValue!25874))))

(declare-fun b!852173 () Bool)

(assert (=> b!852173 (= e!475407 tp_is_empty!16183)))

(declare-fun b!852174 () Bool)

(declare-fun res!578581 () Bool)

(assert (=> b!852174 (=> (not res!578581) (not e!475412))))

(assert (=> b!852174 (= res!578581 (validKeyInArray!0 k0!854))))

(declare-fun b!852175 () Bool)

(declare-fun res!578576 () Bool)

(assert (=> b!852175 (=> (not res!578576) (not e!475412))))

(declare-datatypes ((List!16459 0))(
  ( (Nil!16456) (Cons!16455 (h!17592 (_ BitVec 64)) (t!22944 List!16459)) )
))
(declare-fun arrayNoDuplicates!0 (array!48617 (_ BitVec 32) List!16459) Bool)

(assert (=> b!852175 (= res!578576 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16456))))

(declare-fun b!852176 () Bool)

(assert (=> b!852176 (= e!475413 (= call!38041 call!38042))))

(assert (= (and start!73300 res!578580) b!852165))

(assert (= (and b!852165 res!578579) b!852166))

(assert (= (and b!852166 res!578578) b!852171))

(assert (= (and b!852171 res!578575) b!852175))

(assert (= (and b!852175 res!578576) b!852168))

(assert (= (and b!852168 res!578574) b!852174))

(assert (= (and b!852174 res!578581) b!852172))

(assert (= (and b!852172 res!578573) b!852163))

(assert (= (and b!852163 res!578572) b!852169))

(assert (= (and b!852169 c!92023) b!852162))

(assert (= (and b!852169 (not c!92023)) b!852176))

(assert (= (or b!852162 b!852176) bm!38038))

(assert (= (or b!852162 b!852176) bm!38039))

(assert (= (and b!852169 (not res!578577)) b!852167))

(assert (= (and b!852170 condMapEmpty!25874) mapIsEmpty!25874))

(assert (= (and b!852170 (not condMapEmpty!25874)) mapNonEmpty!25874))

(get-info :version)

(assert (= (and mapNonEmpty!25874 ((_ is ValueCellFull!7652) mapValue!25874)) b!852173))

(assert (= (and b!852170 ((_ is ValueCellFull!7652) mapDefault!25874)) b!852164))

(assert (= start!73300 b!852170))

(declare-fun b_lambda!11593 () Bool)

(assert (=> (not b_lambda!11593) (not b!852167)))

(declare-fun t!22942 () Bool)

(declare-fun tb!4341 () Bool)

(assert (=> (and start!73300 (= defaultEntry!696 defaultEntry!696) t!22942) tb!4341))

(declare-fun result!8301 () Bool)

(assert (=> tb!4341 (= result!8301 tp_is_empty!16183)))

(assert (=> b!852167 t!22942))

(declare-fun b_and!23265 () Bool)

(assert (= b_and!23263 (and (=> t!22942 result!8301) b_and!23265)))

(declare-fun m!793435 () Bool)

(assert (=> b!852174 m!793435))

(declare-fun m!793437 () Bool)

(assert (=> b!852175 m!793437))

(declare-fun m!793439 () Bool)

(assert (=> b!852165 m!793439))

(declare-fun m!793441 () Bool)

(assert (=> b!852171 m!793441))

(declare-fun m!793443 () Bool)

(assert (=> start!73300 m!793443))

(declare-fun m!793445 () Bool)

(assert (=> start!73300 m!793445))

(declare-fun m!793447 () Bool)

(assert (=> b!852162 m!793447))

(declare-fun m!793449 () Bool)

(assert (=> b!852163 m!793449))

(declare-fun m!793451 () Bool)

(assert (=> b!852163 m!793451))

(declare-fun m!793453 () Bool)

(assert (=> b!852163 m!793453))

(declare-fun m!793455 () Bool)

(assert (=> mapNonEmpty!25874 m!793455))

(declare-fun m!793457 () Bool)

(assert (=> b!852167 m!793457))

(declare-fun m!793459 () Bool)

(assert (=> b!852167 m!793459))

(declare-fun m!793461 () Bool)

(assert (=> b!852167 m!793461))

(assert (=> b!852167 m!793461))

(declare-fun m!793463 () Bool)

(assert (=> b!852167 m!793463))

(assert (=> b!852167 m!793457))

(declare-fun m!793465 () Bool)

(assert (=> b!852167 m!793465))

(declare-fun m!793467 () Bool)

(assert (=> b!852167 m!793467))

(declare-fun m!793469 () Bool)

(assert (=> b!852167 m!793469))

(declare-fun m!793471 () Bool)

(assert (=> b!852167 m!793471))

(assert (=> b!852167 m!793467))

(assert (=> b!852167 m!793451))

(declare-fun m!793473 () Bool)

(assert (=> b!852167 m!793473))

(declare-fun m!793475 () Bool)

(assert (=> b!852167 m!793475))

(declare-fun m!793477 () Bool)

(assert (=> b!852167 m!793477))

(declare-fun m!793479 () Bool)

(assert (=> b!852167 m!793479))

(declare-fun m!793481 () Bool)

(assert (=> bm!38039 m!793481))

(declare-fun m!793483 () Bool)

(assert (=> b!852172 m!793483))

(assert (=> b!852169 m!793477))

(assert (=> b!852169 m!793477))

(declare-fun m!793485 () Bool)

(assert (=> b!852169 m!793485))

(declare-fun m!793487 () Bool)

(assert (=> b!852169 m!793487))

(assert (=> bm!38038 m!793473))

(check-sat (not b!852175) (not b!852163) (not start!73300) (not b!852167) (not b!852165) (not b!852174) b_and!23265 (not b!852171) (not bm!38038) tp_is_empty!16183 (not mapNonEmpty!25874) (not b_lambda!11593) (not b_next!14047) (not bm!38039) (not b!852169) (not b!852162))
(check-sat b_and!23265 (not b_next!14047))
