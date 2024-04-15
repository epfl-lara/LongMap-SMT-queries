; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39410 () Bool)

(assert start!39410)

(declare-fun b_free!9691 () Bool)

(declare-fun b_next!9691 () Bool)

(assert (=> start!39410 (= b_free!9691 (not b_next!9691))))

(declare-fun tp!34601 () Bool)

(declare-fun b_and!17231 () Bool)

(assert (=> start!39410 (= tp!34601 b_and!17231)))

(declare-fun mapNonEmpty!17886 () Bool)

(declare-fun mapRes!17886 () Bool)

(declare-fun tp!34602 () Bool)

(declare-fun e!249912 () Bool)

(assert (=> mapNonEmpty!17886 (= mapRes!17886 (and tp!34602 e!249912))))

(declare-datatypes ((V!15563 0))(
  ( (V!15564 (val!5466 Int)) )
))
(declare-datatypes ((ValueCell!5078 0))(
  ( (ValueCellFull!5078 (v!7707 V!15563)) (EmptyCell!5078) )
))
(declare-fun mapValue!17886 () ValueCell!5078)

(declare-fun mapRest!17886 () (Array (_ BitVec 32) ValueCell!5078))

(declare-datatypes ((array!25521 0))(
  ( (array!25522 (arr!12210 (Array (_ BitVec 32) ValueCell!5078)) (size!12563 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25521)

(declare-fun mapKey!17886 () (_ BitVec 32))

(assert (=> mapNonEmpty!17886 (= (arr!12210 _values!549) (store mapRest!17886 mapKey!17886 mapValue!17886))))

(declare-fun minValue!515 () V!15563)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55179 () Bool)

(declare-datatypes ((array!25523 0))(
  ( (array!25524 (arr!12211 (Array (_ BitVec 32) (_ BitVec 64))) (size!12564 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25523)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!29223 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7140 0))(
  ( (tuple2!7141 (_1!3581 (_ BitVec 64)) (_2!3581 V!15563)) )
))
(declare-datatypes ((List!7138 0))(
  ( (Nil!7135) (Cons!7134 (h!7990 tuple2!7140) (t!12485 List!7138)) )
))
(declare-datatypes ((ListLongMap!6043 0))(
  ( (ListLongMap!6044 (toList!3037 List!7138)) )
))
(declare-fun call!29226 () ListLongMap!6043)

(declare-fun lt!192247 () array!25521)

(declare-fun zeroValue!515 () V!15563)

(declare-fun lt!192245 () array!25523)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1247 (array!25523 array!25521 (_ BitVec 32) (_ BitVec 32) V!15563 V!15563 (_ BitVec 32) Int) ListLongMap!6043)

(assert (=> bm!29223 (= call!29226 (getCurrentListMapNoExtraKeys!1247 (ite c!55179 _keys!709 lt!192245) (ite c!55179 _values!549 lt!192247) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419401 () Bool)

(declare-fun e!249904 () Bool)

(declare-fun e!249911 () Bool)

(assert (=> b!419401 (= e!249904 e!249911)))

(declare-fun res!244567 () Bool)

(assert (=> b!419401 (=> (not res!244567) (not e!249911))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419401 (= res!244567 (= from!863 i!563))))

(declare-fun lt!192249 () ListLongMap!6043)

(assert (=> b!419401 (= lt!192249 (getCurrentListMapNoExtraKeys!1247 lt!192245 lt!192247 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15563)

(assert (=> b!419401 (= lt!192247 (array!25522 (store (arr!12210 _values!549) i!563 (ValueCellFull!5078 v!412)) (size!12563 _values!549)))))

(declare-fun lt!192246 () ListLongMap!6043)

(assert (=> b!419401 (= lt!192246 (getCurrentListMapNoExtraKeys!1247 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419402 () Bool)

(declare-fun e!249906 () Bool)

(declare-fun tp_is_empty!10843 () Bool)

(assert (=> b!419402 (= e!249906 tp_is_empty!10843)))

(declare-fun b!419403 () Bool)

(declare-fun call!29227 () ListLongMap!6043)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!249909 () Bool)

(declare-fun +!1263 (ListLongMap!6043 tuple2!7140) ListLongMap!6043)

(assert (=> b!419403 (= e!249909 (= call!29227 (+!1263 call!29226 (tuple2!7141 k0!794 v!412))))))

(declare-fun b!419404 () Bool)

(declare-fun res!244576 () Bool)

(declare-fun e!249910 () Bool)

(assert (=> b!419404 (=> (not res!244576) (not e!249910))))

(assert (=> b!419404 (= res!244576 (and (= (size!12563 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12564 _keys!709) (size!12563 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419405 () Bool)

(declare-fun e!249908 () Bool)

(assert (=> b!419405 (= e!249911 (not e!249908))))

(declare-fun res!244577 () Bool)

(assert (=> b!419405 (=> res!244577 e!249908)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419405 (= res!244577 (validKeyInArray!0 (select (arr!12211 _keys!709) from!863)))))

(assert (=> b!419405 e!249909))

(assert (=> b!419405 (= c!55179 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12370 0))(
  ( (Unit!12371) )
))
(declare-fun lt!192241 () Unit!12370)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!439 (array!25523 array!25521 (_ BitVec 32) (_ BitVec 32) V!15563 V!15563 (_ BitVec 32) (_ BitVec 64) V!15563 (_ BitVec 32) Int) Unit!12370)

(assert (=> b!419405 (= lt!192241 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!439 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419406 () Bool)

(declare-fun res!244569 () Bool)

(assert (=> b!419406 (=> (not res!244569) (not e!249904))))

(assert (=> b!419406 (= res!244569 (bvsle from!863 i!563))))

(declare-fun b!419407 () Bool)

(declare-fun res!244570 () Bool)

(assert (=> b!419407 (=> (not res!244570) (not e!249910))))

(assert (=> b!419407 (= res!244570 (validKeyInArray!0 k0!794))))

(declare-fun b!419408 () Bool)

(declare-fun res!244573 () Bool)

(assert (=> b!419408 (=> (not res!244573) (not e!249904))))

(declare-datatypes ((List!7139 0))(
  ( (Nil!7136) (Cons!7135 (h!7991 (_ BitVec 64)) (t!12486 List!7139)) )
))
(declare-fun arrayNoDuplicates!0 (array!25523 (_ BitVec 32) List!7139) Bool)

(assert (=> b!419408 (= res!244573 (arrayNoDuplicates!0 lt!192245 #b00000000000000000000000000000000 Nil!7136))))

(declare-fun b!419409 () Bool)

(declare-fun res!244575 () Bool)

(assert (=> b!419409 (=> (not res!244575) (not e!249910))))

(assert (=> b!419409 (= res!244575 (or (= (select (arr!12211 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12211 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419410 () Bool)

(declare-fun res!244565 () Bool)

(assert (=> b!419410 (=> (not res!244565) (not e!249910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25523 (_ BitVec 32)) Bool)

(assert (=> b!419410 (= res!244565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419411 () Bool)

(declare-fun res!244568 () Bool)

(assert (=> b!419411 (=> (not res!244568) (not e!249910))))

(assert (=> b!419411 (= res!244568 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7136))))

(declare-fun b!419412 () Bool)

(declare-fun res!244566 () Bool)

(assert (=> b!419412 (=> (not res!244566) (not e!249910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419412 (= res!244566 (validMask!0 mask!1025))))

(declare-fun res!244578 () Bool)

(assert (=> start!39410 (=> (not res!244578) (not e!249910))))

(assert (=> start!39410 (= res!244578 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12564 _keys!709))))))

(assert (=> start!39410 e!249910))

(assert (=> start!39410 tp_is_empty!10843))

(assert (=> start!39410 tp!34601))

(assert (=> start!39410 true))

(declare-fun e!249907 () Bool)

(declare-fun array_inv!8948 (array!25521) Bool)

(assert (=> start!39410 (and (array_inv!8948 _values!549) e!249907)))

(declare-fun array_inv!8949 (array!25523) Bool)

(assert (=> start!39410 (array_inv!8949 _keys!709)))

(declare-fun bm!29224 () Bool)

(assert (=> bm!29224 (= call!29227 (getCurrentListMapNoExtraKeys!1247 (ite c!55179 lt!192245 _keys!709) (ite c!55179 lt!192247 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419413 () Bool)

(declare-fun res!244571 () Bool)

(assert (=> b!419413 (=> (not res!244571) (not e!249910))))

(declare-fun arrayContainsKey!0 (array!25523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419413 (= res!244571 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17886 () Bool)

(assert (=> mapIsEmpty!17886 mapRes!17886))

(declare-fun b!419414 () Bool)

(assert (=> b!419414 (= e!249907 (and e!249906 mapRes!17886))))

(declare-fun condMapEmpty!17886 () Bool)

(declare-fun mapDefault!17886 () ValueCell!5078)

(assert (=> b!419414 (= condMapEmpty!17886 (= (arr!12210 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5078)) mapDefault!17886)))))

(declare-fun b!419415 () Bool)

(assert (=> b!419415 (= e!249909 (= call!29226 call!29227))))

(declare-fun b!419416 () Bool)

(assert (=> b!419416 (= e!249908 true)))

(declare-fun lt!192243 () V!15563)

(declare-fun lt!192242 () ListLongMap!6043)

(declare-fun lt!192251 () tuple2!7140)

(assert (=> b!419416 (= (+!1263 lt!192242 lt!192251) (+!1263 (+!1263 lt!192242 (tuple2!7141 k0!794 lt!192243)) lt!192251))))

(declare-fun lt!192248 () V!15563)

(assert (=> b!419416 (= lt!192251 (tuple2!7141 k0!794 lt!192248))))

(declare-fun lt!192250 () Unit!12370)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!48 (ListLongMap!6043 (_ BitVec 64) V!15563 V!15563) Unit!12370)

(assert (=> b!419416 (= lt!192250 (addSameAsAddTwiceSameKeyDiffValues!48 lt!192242 k0!794 lt!192243 lt!192248))))

(declare-fun lt!192244 () V!15563)

(declare-fun get!6053 (ValueCell!5078 V!15563) V!15563)

(assert (=> b!419416 (= lt!192243 (get!6053 (select (arr!12210 _values!549) from!863) lt!192244))))

(assert (=> b!419416 (= lt!192249 (+!1263 lt!192242 (tuple2!7141 (select (arr!12211 lt!192245) from!863) lt!192248)))))

(assert (=> b!419416 (= lt!192248 (get!6053 (select (store (arr!12210 _values!549) i!563 (ValueCellFull!5078 v!412)) from!863) lt!192244))))

(declare-fun dynLambda!705 (Int (_ BitVec 64)) V!15563)

(assert (=> b!419416 (= lt!192244 (dynLambda!705 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419416 (= lt!192242 (getCurrentListMapNoExtraKeys!1247 lt!192245 lt!192247 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419417 () Bool)

(declare-fun res!244572 () Bool)

(assert (=> b!419417 (=> (not res!244572) (not e!249910))))

(assert (=> b!419417 (= res!244572 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12564 _keys!709))))))

(declare-fun b!419418 () Bool)

(assert (=> b!419418 (= e!249910 e!249904)))

(declare-fun res!244574 () Bool)

(assert (=> b!419418 (=> (not res!244574) (not e!249904))))

(assert (=> b!419418 (= res!244574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192245 mask!1025))))

(assert (=> b!419418 (= lt!192245 (array!25524 (store (arr!12211 _keys!709) i!563 k0!794) (size!12564 _keys!709)))))

(declare-fun b!419419 () Bool)

(assert (=> b!419419 (= e!249912 tp_is_empty!10843)))

(assert (= (and start!39410 res!244578) b!419412))

(assert (= (and b!419412 res!244566) b!419404))

(assert (= (and b!419404 res!244576) b!419410))

(assert (= (and b!419410 res!244565) b!419411))

(assert (= (and b!419411 res!244568) b!419417))

(assert (= (and b!419417 res!244572) b!419407))

(assert (= (and b!419407 res!244570) b!419409))

(assert (= (and b!419409 res!244575) b!419413))

(assert (= (and b!419413 res!244571) b!419418))

(assert (= (and b!419418 res!244574) b!419408))

(assert (= (and b!419408 res!244573) b!419406))

(assert (= (and b!419406 res!244569) b!419401))

(assert (= (and b!419401 res!244567) b!419405))

(assert (= (and b!419405 c!55179) b!419403))

(assert (= (and b!419405 (not c!55179)) b!419415))

(assert (= (or b!419403 b!419415) bm!29224))

(assert (= (or b!419403 b!419415) bm!29223))

(assert (= (and b!419405 (not res!244577)) b!419416))

(assert (= (and b!419414 condMapEmpty!17886) mapIsEmpty!17886))

(assert (= (and b!419414 (not condMapEmpty!17886)) mapNonEmpty!17886))

(get-info :version)

(assert (= (and mapNonEmpty!17886 ((_ is ValueCellFull!5078) mapValue!17886)) b!419419))

(assert (= (and b!419414 ((_ is ValueCellFull!5078) mapDefault!17886)) b!419402))

(assert (= start!39410 b!419414))

(declare-fun b_lambda!8977 () Bool)

(assert (=> (not b_lambda!8977) (not b!419416)))

(declare-fun t!12484 () Bool)

(declare-fun tb!3305 () Bool)

(assert (=> (and start!39410 (= defaultEntry!557 defaultEntry!557) t!12484) tb!3305))

(declare-fun result!6145 () Bool)

(assert (=> tb!3305 (= result!6145 tp_is_empty!10843)))

(assert (=> b!419416 t!12484))

(declare-fun b_and!17233 () Bool)

(assert (= b_and!17231 (and (=> t!12484 result!6145) b_and!17233)))

(declare-fun m!408475 () Bool)

(assert (=> start!39410 m!408475))

(declare-fun m!408477 () Bool)

(assert (=> start!39410 m!408477))

(declare-fun m!408479 () Bool)

(assert (=> b!419416 m!408479))

(declare-fun m!408481 () Bool)

(assert (=> b!419416 m!408481))

(declare-fun m!408483 () Bool)

(assert (=> b!419416 m!408483))

(declare-fun m!408485 () Bool)

(assert (=> b!419416 m!408485))

(declare-fun m!408487 () Bool)

(assert (=> b!419416 m!408487))

(declare-fun m!408489 () Bool)

(assert (=> b!419416 m!408489))

(assert (=> b!419416 m!408487))

(declare-fun m!408491 () Bool)

(assert (=> b!419416 m!408491))

(declare-fun m!408493 () Bool)

(assert (=> b!419416 m!408493))

(assert (=> b!419416 m!408493))

(declare-fun m!408495 () Bool)

(assert (=> b!419416 m!408495))

(declare-fun m!408497 () Bool)

(assert (=> b!419416 m!408497))

(declare-fun m!408499 () Bool)

(assert (=> b!419416 m!408499))

(declare-fun m!408501 () Bool)

(assert (=> b!419416 m!408501))

(declare-fun m!408503 () Bool)

(assert (=> b!419416 m!408503))

(assert (=> b!419416 m!408479))

(declare-fun m!408505 () Bool)

(assert (=> b!419410 m!408505))

(declare-fun m!408507 () Bool)

(assert (=> b!419412 m!408507))

(declare-fun m!408509 () Bool)

(assert (=> b!419405 m!408509))

(assert (=> b!419405 m!408509))

(declare-fun m!408511 () Bool)

(assert (=> b!419405 m!408511))

(declare-fun m!408513 () Bool)

(assert (=> b!419405 m!408513))

(declare-fun m!408515 () Bool)

(assert (=> bm!29224 m!408515))

(declare-fun m!408517 () Bool)

(assert (=> b!419401 m!408517))

(assert (=> b!419401 m!408503))

(declare-fun m!408519 () Bool)

(assert (=> b!419401 m!408519))

(declare-fun m!408521 () Bool)

(assert (=> mapNonEmpty!17886 m!408521))

(declare-fun m!408523 () Bool)

(assert (=> b!419413 m!408523))

(declare-fun m!408525 () Bool)

(assert (=> bm!29223 m!408525))

(declare-fun m!408527 () Bool)

(assert (=> b!419409 m!408527))

(declare-fun m!408529 () Bool)

(assert (=> b!419418 m!408529))

(declare-fun m!408531 () Bool)

(assert (=> b!419418 m!408531))

(declare-fun m!408533 () Bool)

(assert (=> b!419411 m!408533))

(declare-fun m!408535 () Bool)

(assert (=> b!419408 m!408535))

(declare-fun m!408537 () Bool)

(assert (=> b!419407 m!408537))

(declare-fun m!408539 () Bool)

(assert (=> b!419403 m!408539))

(check-sat (not mapNonEmpty!17886) tp_is_empty!10843 (not start!39410) (not b!419412) (not b!419403) b_and!17233 (not bm!29223) (not b!419411) (not b!419408) (not b!419410) (not b!419418) (not b!419416) (not b!419401) (not b!419407) (not b!419405) (not b_next!9691) (not b!419413) (not b_lambda!8977) (not bm!29224))
(check-sat b_and!17233 (not b_next!9691))
