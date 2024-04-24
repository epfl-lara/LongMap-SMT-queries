; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39440 () Bool)

(assert start!39440)

(declare-fun b_free!9721 () Bool)

(declare-fun b_next!9721 () Bool)

(assert (=> start!39440 (= b_free!9721 (not b_next!9721))))

(declare-fun tp!34691 () Bool)

(declare-fun b_and!17331 () Bool)

(assert (=> start!39440 (= tp!34691 b_and!17331)))

(declare-fun b!420508 () Bool)

(declare-fun res!245329 () Bool)

(declare-fun e!250457 () Bool)

(assert (=> b!420508 (=> (not res!245329) (not e!250457))))

(declare-datatypes ((array!25602 0))(
  ( (array!25603 (arr!12250 (Array (_ BitVec 32) (_ BitVec 64))) (size!12602 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25602)

(declare-datatypes ((List!7071 0))(
  ( (Nil!7068) (Cons!7067 (h!7923 (_ BitVec 64)) (t!12449 List!7071)) )
))
(declare-fun arrayNoDuplicates!0 (array!25602 (_ BitVec 32) List!7071) Bool)

(assert (=> b!420508 (= res!245329 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7068))))

(declare-fun b!420509 () Bool)

(declare-fun res!245327 () Bool)

(assert (=> b!420509 (=> (not res!245327) (not e!250457))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420509 (= res!245327 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12602 _keys!709))))))

(declare-fun b!420510 () Bool)

(declare-fun res!245325 () Bool)

(assert (=> b!420510 (=> (not res!245325) (not e!250457))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420510 (= res!245325 (validMask!0 mask!1025))))

(declare-fun b!420511 () Bool)

(declare-fun e!250452 () Bool)

(assert (=> b!420511 (= e!250457 e!250452)))

(declare-fun res!245321 () Bool)

(assert (=> b!420511 (=> (not res!245321) (not e!250452))))

(declare-fun lt!192991 () array!25602)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25602 (_ BitVec 32)) Bool)

(assert (=> b!420511 (= res!245321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192991 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!420511 (= lt!192991 (array!25603 (store (arr!12250 _keys!709) i!563 k0!794) (size!12602 _keys!709)))))

(declare-fun b!420512 () Bool)

(declare-fun res!245332 () Bool)

(assert (=> b!420512 (=> (not res!245332) (not e!250457))))

(assert (=> b!420512 (= res!245332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-datatypes ((V!15603 0))(
  ( (V!15604 (val!5481 Int)) )
))
(declare-fun minValue!515 () V!15603)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5093 0))(
  ( (ValueCellFull!5093 (v!7729 V!15603)) (EmptyCell!5093) )
))
(declare-datatypes ((array!25604 0))(
  ( (array!25605 (arr!12251 (Array (_ BitVec 32) ValueCell!5093)) (size!12603 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25604)

(declare-fun zeroValue!515 () V!15603)

(declare-fun bm!29325 () Bool)

(declare-datatypes ((tuple2!7064 0))(
  ( (tuple2!7065 (_1!3543 (_ BitVec 64)) (_2!3543 V!15603)) )
))
(declare-datatypes ((List!7072 0))(
  ( (Nil!7069) (Cons!7068 (h!7924 tuple2!7064) (t!12450 List!7072)) )
))
(declare-datatypes ((ListLongMap!5979 0))(
  ( (ListLongMap!5980 (toList!3005 List!7072)) )
))
(declare-fun call!29328 () ListLongMap!5979)

(declare-fun c!55272 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!192993 () array!25604)

(declare-fun getCurrentListMapNoExtraKeys!1251 (array!25602 array!25604 (_ BitVec 32) (_ BitVec 32) V!15603 V!15603 (_ BitVec 32) Int) ListLongMap!5979)

(assert (=> bm!29325 (= call!29328 (getCurrentListMapNoExtraKeys!1251 (ite c!55272 lt!192991 _keys!709) (ite c!55272 lt!192993 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17931 () Bool)

(declare-fun mapRes!17931 () Bool)

(assert (=> mapIsEmpty!17931 mapRes!17931))

(declare-fun b!420513 () Bool)

(declare-fun res!245328 () Bool)

(assert (=> b!420513 (=> (not res!245328) (not e!250452))))

(assert (=> b!420513 (= res!245328 (arrayNoDuplicates!0 lt!192991 #b00000000000000000000000000000000 Nil!7068))))

(declare-fun b!420514 () Bool)

(declare-fun res!245324 () Bool)

(assert (=> b!420514 (=> (not res!245324) (not e!250457))))

(declare-fun arrayContainsKey!0 (array!25602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420514 (= res!245324 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!420515 () Bool)

(declare-fun e!250459 () Bool)

(declare-fun e!250456 () Bool)

(assert (=> b!420515 (= e!250459 (not e!250456))))

(declare-fun res!245331 () Bool)

(assert (=> b!420515 (=> res!245331 e!250456)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420515 (= res!245331 (validKeyInArray!0 (select (arr!12250 _keys!709) from!863)))))

(declare-fun e!250458 () Bool)

(assert (=> b!420515 e!250458))

(assert (=> b!420515 (= c!55272 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12411 0))(
  ( (Unit!12412) )
))
(declare-fun lt!192992 () Unit!12411)

(declare-fun v!412 () V!15603)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!457 (array!25602 array!25604 (_ BitVec 32) (_ BitVec 32) V!15603 V!15603 (_ BitVec 32) (_ BitVec 64) V!15603 (_ BitVec 32) Int) Unit!12411)

(assert (=> b!420515 (= lt!192992 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!457 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420516 () Bool)

(declare-fun call!29329 () ListLongMap!5979)

(declare-fun +!1269 (ListLongMap!5979 tuple2!7064) ListLongMap!5979)

(assert (=> b!420516 (= e!250458 (= call!29328 (+!1269 call!29329 (tuple2!7065 k0!794 v!412))))))

(declare-fun b!420517 () Bool)

(declare-fun e!250455 () Bool)

(declare-fun e!250451 () Bool)

(assert (=> b!420517 (= e!250455 (and e!250451 mapRes!17931))))

(declare-fun condMapEmpty!17931 () Bool)

(declare-fun mapDefault!17931 () ValueCell!5093)

(assert (=> b!420517 (= condMapEmpty!17931 (= (arr!12251 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5093)) mapDefault!17931)))))

(declare-fun mapNonEmpty!17931 () Bool)

(declare-fun tp!34692 () Bool)

(declare-fun e!250453 () Bool)

(assert (=> mapNonEmpty!17931 (= mapRes!17931 (and tp!34692 e!250453))))

(declare-fun mapValue!17931 () ValueCell!5093)

(declare-fun mapRest!17931 () (Array (_ BitVec 32) ValueCell!5093))

(declare-fun mapKey!17931 () (_ BitVec 32))

(assert (=> mapNonEmpty!17931 (= (arr!12251 _values!549) (store mapRest!17931 mapKey!17931 mapValue!17931))))

(declare-fun b!420519 () Bool)

(assert (=> b!420519 (= e!250452 e!250459)))

(declare-fun res!245322 () Bool)

(assert (=> b!420519 (=> (not res!245322) (not e!250459))))

(assert (=> b!420519 (= res!245322 (= from!863 i!563))))

(declare-fun lt!192996 () ListLongMap!5979)

(assert (=> b!420519 (= lt!192996 (getCurrentListMapNoExtraKeys!1251 lt!192991 lt!192993 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420519 (= lt!192993 (array!25605 (store (arr!12251 _values!549) i!563 (ValueCellFull!5093 v!412)) (size!12603 _values!549)))))

(declare-fun lt!192995 () ListLongMap!5979)

(assert (=> b!420519 (= lt!192995 (getCurrentListMapNoExtraKeys!1251 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420520 () Bool)

(declare-fun res!245333 () Bool)

(assert (=> b!420520 (=> (not res!245333) (not e!250457))))

(assert (=> b!420520 (= res!245333 (or (= (select (arr!12250 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12250 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29326 () Bool)

(assert (=> bm!29326 (= call!29329 (getCurrentListMapNoExtraKeys!1251 (ite c!55272 _keys!709 lt!192991) (ite c!55272 _values!549 lt!192993) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420521 () Bool)

(declare-fun tp_is_empty!10873 () Bool)

(assert (=> b!420521 (= e!250451 tp_is_empty!10873)))

(declare-fun b!420522 () Bool)

(declare-fun res!245323 () Bool)

(assert (=> b!420522 (=> (not res!245323) (not e!250457))))

(assert (=> b!420522 (= res!245323 (and (= (size!12603 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12602 _keys!709) (size!12603 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420523 () Bool)

(declare-fun res!245330 () Bool)

(assert (=> b!420523 (=> (not res!245330) (not e!250452))))

(assert (=> b!420523 (= res!245330 (bvsle from!863 i!563))))

(declare-fun b!420524 () Bool)

(declare-fun res!245326 () Bool)

(assert (=> b!420524 (=> (not res!245326) (not e!250457))))

(assert (=> b!420524 (= res!245326 (validKeyInArray!0 k0!794))))

(declare-fun b!420525 () Bool)

(assert (=> b!420525 (= e!250458 (= call!29329 call!29328))))

(declare-fun b!420526 () Bool)

(assert (=> b!420526 (= e!250453 tp_is_empty!10873)))

(declare-fun b!420518 () Bool)

(assert (=> b!420518 (= e!250456 true)))

(declare-fun lt!192990 () tuple2!7064)

(declare-fun lt!192997 () V!15603)

(declare-fun lt!192998 () ListLongMap!5979)

(assert (=> b!420518 (= (+!1269 lt!192998 lt!192990) (+!1269 (+!1269 lt!192998 (tuple2!7065 k0!794 lt!192997)) lt!192990))))

(declare-fun lt!192989 () V!15603)

(assert (=> b!420518 (= lt!192990 (tuple2!7065 k0!794 lt!192989))))

(declare-fun lt!192994 () Unit!12411)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!59 (ListLongMap!5979 (_ BitVec 64) V!15603 V!15603) Unit!12411)

(assert (=> b!420518 (= lt!192994 (addSameAsAddTwiceSameKeyDiffValues!59 lt!192998 k0!794 lt!192997 lt!192989))))

(declare-fun lt!192999 () V!15603)

(declare-fun get!6087 (ValueCell!5093 V!15603) V!15603)

(assert (=> b!420518 (= lt!192997 (get!6087 (select (arr!12251 _values!549) from!863) lt!192999))))

(assert (=> b!420518 (= lt!192996 (+!1269 lt!192998 (tuple2!7065 (select (arr!12250 lt!192991) from!863) lt!192989)))))

(assert (=> b!420518 (= lt!192989 (get!6087 (select (store (arr!12251 _values!549) i!563 (ValueCellFull!5093 v!412)) from!863) lt!192999))))

(declare-fun dynLambda!726 (Int (_ BitVec 64)) V!15603)

(assert (=> b!420518 (= lt!192999 (dynLambda!726 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420518 (= lt!192998 (getCurrentListMapNoExtraKeys!1251 lt!192991 lt!192993 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!245334 () Bool)

(assert (=> start!39440 (=> (not res!245334) (not e!250457))))

(assert (=> start!39440 (= res!245334 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12602 _keys!709))))))

(assert (=> start!39440 e!250457))

(assert (=> start!39440 tp_is_empty!10873))

(assert (=> start!39440 tp!34691))

(assert (=> start!39440 true))

(declare-fun array_inv!9006 (array!25604) Bool)

(assert (=> start!39440 (and (array_inv!9006 _values!549) e!250455)))

(declare-fun array_inv!9007 (array!25602) Bool)

(assert (=> start!39440 (array_inv!9007 _keys!709)))

(assert (= (and start!39440 res!245334) b!420510))

(assert (= (and b!420510 res!245325) b!420522))

(assert (= (and b!420522 res!245323) b!420512))

(assert (= (and b!420512 res!245332) b!420508))

(assert (= (and b!420508 res!245329) b!420509))

(assert (= (and b!420509 res!245327) b!420524))

(assert (= (and b!420524 res!245326) b!420520))

(assert (= (and b!420520 res!245333) b!420514))

(assert (= (and b!420514 res!245324) b!420511))

(assert (= (and b!420511 res!245321) b!420513))

(assert (= (and b!420513 res!245328) b!420523))

(assert (= (and b!420523 res!245330) b!420519))

(assert (= (and b!420519 res!245322) b!420515))

(assert (= (and b!420515 c!55272) b!420516))

(assert (= (and b!420515 (not c!55272)) b!420525))

(assert (= (or b!420516 b!420525) bm!29325))

(assert (= (or b!420516 b!420525) bm!29326))

(assert (= (and b!420515 (not res!245331)) b!420518))

(assert (= (and b!420517 condMapEmpty!17931) mapIsEmpty!17931))

(assert (= (and b!420517 (not condMapEmpty!17931)) mapNonEmpty!17931))

(get-info :version)

(assert (= (and mapNonEmpty!17931 ((_ is ValueCellFull!5093) mapValue!17931)) b!420526))

(assert (= (and b!420517 ((_ is ValueCellFull!5093) mapDefault!17931)) b!420521))

(assert (= start!39440 b!420517))

(declare-fun b_lambda!9047 () Bool)

(assert (=> (not b_lambda!9047) (not b!420518)))

(declare-fun t!12448 () Bool)

(declare-fun tb!3335 () Bool)

(assert (=> (and start!39440 (= defaultEntry!557 defaultEntry!557) t!12448) tb!3335))

(declare-fun result!6205 () Bool)

(assert (=> tb!3335 (= result!6205 tp_is_empty!10873)))

(assert (=> b!420518 t!12448))

(declare-fun b_and!17333 () Bool)

(assert (= b_and!17331 (and (=> t!12448 result!6205) b_and!17333)))

(declare-fun m!410413 () Bool)

(assert (=> b!420513 m!410413))

(declare-fun m!410415 () Bool)

(assert (=> b!420508 m!410415))

(declare-fun m!410417 () Bool)

(assert (=> b!420511 m!410417))

(declare-fun m!410419 () Bool)

(assert (=> b!420511 m!410419))

(declare-fun m!410421 () Bool)

(assert (=> b!420515 m!410421))

(assert (=> b!420515 m!410421))

(declare-fun m!410423 () Bool)

(assert (=> b!420515 m!410423))

(declare-fun m!410425 () Bool)

(assert (=> b!420515 m!410425))

(declare-fun m!410427 () Bool)

(assert (=> bm!29326 m!410427))

(declare-fun m!410429 () Bool)

(assert (=> bm!29325 m!410429))

(declare-fun m!410431 () Bool)

(assert (=> start!39440 m!410431))

(declare-fun m!410433 () Bool)

(assert (=> start!39440 m!410433))

(declare-fun m!410435 () Bool)

(assert (=> b!420512 m!410435))

(declare-fun m!410437 () Bool)

(assert (=> b!420524 m!410437))

(declare-fun m!410439 () Bool)

(assert (=> b!420520 m!410439))

(declare-fun m!410441 () Bool)

(assert (=> b!420519 m!410441))

(declare-fun m!410443 () Bool)

(assert (=> b!420519 m!410443))

(declare-fun m!410445 () Bool)

(assert (=> b!420519 m!410445))

(declare-fun m!410447 () Bool)

(assert (=> b!420510 m!410447))

(declare-fun m!410449 () Bool)

(assert (=> b!420518 m!410449))

(declare-fun m!410451 () Bool)

(assert (=> b!420518 m!410451))

(declare-fun m!410453 () Bool)

(assert (=> b!420518 m!410453))

(declare-fun m!410455 () Bool)

(assert (=> b!420518 m!410455))

(assert (=> b!420518 m!410443))

(declare-fun m!410457 () Bool)

(assert (=> b!420518 m!410457))

(declare-fun m!410459 () Bool)

(assert (=> b!420518 m!410459))

(declare-fun m!410461 () Bool)

(assert (=> b!420518 m!410461))

(declare-fun m!410463 () Bool)

(assert (=> b!420518 m!410463))

(assert (=> b!420518 m!410457))

(assert (=> b!420518 m!410451))

(declare-fun m!410465 () Bool)

(assert (=> b!420518 m!410465))

(assert (=> b!420518 m!410461))

(declare-fun m!410467 () Bool)

(assert (=> b!420518 m!410467))

(declare-fun m!410469 () Bool)

(assert (=> b!420518 m!410469))

(declare-fun m!410471 () Bool)

(assert (=> b!420518 m!410471))

(declare-fun m!410473 () Bool)

(assert (=> b!420516 m!410473))

(declare-fun m!410475 () Bool)

(assert (=> b!420514 m!410475))

(declare-fun m!410477 () Bool)

(assert (=> mapNonEmpty!17931 m!410477))

(check-sat tp_is_empty!10873 (not b!420511) (not start!39440) (not b!420515) (not mapNonEmpty!17931) (not b!420513) (not b!420514) (not b!420508) (not bm!29326) (not bm!29325) (not b!420524) (not b!420518) (not b!420516) (not b!420510) b_and!17333 (not b_lambda!9047) (not b!420512) (not b!420519) (not b_next!9721))
(check-sat b_and!17333 (not b_next!9721))
