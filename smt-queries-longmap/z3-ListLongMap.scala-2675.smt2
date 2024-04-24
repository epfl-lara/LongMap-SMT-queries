; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39854 () Bool)

(assert start!39854)

(declare-fun b_free!10135 () Bool)

(declare-fun b_next!10135 () Bool)

(assert (=> start!39854 (= b_free!10135 (not b_next!10135))))

(declare-fun tp!35933 () Bool)

(declare-fun b_and!17943 () Bool)

(assert (=> start!39854 (= tp!35933 b_and!17943)))

(declare-fun b!431337 () Bool)

(declare-fun res!253606 () Bool)

(declare-fun e!255257 () Bool)

(assert (=> b!431337 (=> (not res!253606) (not e!255257))))

(declare-datatypes ((array!26414 0))(
  ( (array!26415 (arr!12656 (Array (_ BitVec 32) (_ BitVec 64))) (size!13008 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26414)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26414 (_ BitVec 32)) Bool)

(assert (=> b!431337 (= res!253606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431338 () Bool)

(declare-fun res!253607 () Bool)

(declare-fun e!255253 () Bool)

(assert (=> b!431338 (=> (not res!253607) (not e!255253))))

(declare-fun lt!197570 () array!26414)

(declare-datatypes ((List!7406 0))(
  ( (Nil!7403) (Cons!7402 (h!8258 (_ BitVec 64)) (t!12982 List!7406)) )
))
(declare-fun arrayNoDuplicates!0 (array!26414 (_ BitVec 32) List!7406) Bool)

(assert (=> b!431338 (= res!253607 (arrayNoDuplicates!0 lt!197570 #b00000000000000000000000000000000 Nil!7403))))

(declare-fun b!431339 () Bool)

(declare-fun res!253604 () Bool)

(assert (=> b!431339 (=> (not res!253604) (not e!255257))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16155 0))(
  ( (V!16156 (val!5688 Int)) )
))
(declare-datatypes ((ValueCell!5300 0))(
  ( (ValueCellFull!5300 (v!7936 V!16155)) (EmptyCell!5300) )
))
(declare-datatypes ((array!26416 0))(
  ( (array!26417 (arr!12657 (Array (_ BitVec 32) ValueCell!5300)) (size!13009 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26416)

(assert (=> b!431339 (= res!253604 (and (= (size!13009 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13008 _keys!709) (size!13009 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!253616 () Bool)

(assert (=> start!39854 (=> (not res!253616) (not e!255257))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39854 (= res!253616 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13008 _keys!709))))))

(assert (=> start!39854 e!255257))

(declare-fun tp_is_empty!11287 () Bool)

(assert (=> start!39854 tp_is_empty!11287))

(assert (=> start!39854 tp!35933))

(assert (=> start!39854 true))

(declare-fun e!255255 () Bool)

(declare-fun array_inv!9274 (array!26416) Bool)

(assert (=> start!39854 (and (array_inv!9274 _values!549) e!255255)))

(declare-fun array_inv!9275 (array!26414) Bool)

(assert (=> start!39854 (array_inv!9275 _keys!709)))

(declare-fun b!431340 () Bool)

(declare-fun res!253617 () Bool)

(assert (=> b!431340 (=> (not res!253617) (not e!255257))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431340 (= res!253617 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431341 () Bool)

(declare-fun e!255259 () Bool)

(declare-fun e!255252 () Bool)

(assert (=> b!431341 (= e!255259 (not e!255252))))

(declare-fun res!253610 () Bool)

(assert (=> b!431341 (=> res!253610 e!255252)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431341 (= res!253610 (not (validKeyInArray!0 (select (arr!12656 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7410 0))(
  ( (tuple2!7411 (_1!3716 (_ BitVec 64)) (_2!3716 V!16155)) )
))
(declare-datatypes ((List!7407 0))(
  ( (Nil!7404) (Cons!7403 (h!8259 tuple2!7410) (t!12983 List!7407)) )
))
(declare-datatypes ((ListLongMap!6325 0))(
  ( (ListLongMap!6326 (toList!3178 List!7407)) )
))
(declare-fun lt!197568 () ListLongMap!6325)

(declare-fun lt!197572 () ListLongMap!6325)

(assert (=> b!431341 (= lt!197568 lt!197572)))

(declare-fun lt!197573 () ListLongMap!6325)

(declare-fun lt!197562 () tuple2!7410)

(declare-fun +!1386 (ListLongMap!6325 tuple2!7410) ListLongMap!6325)

(assert (=> b!431341 (= lt!197572 (+!1386 lt!197573 lt!197562))))

(declare-fun minValue!515 () V!16155)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!197565 () array!26416)

(declare-fun zeroValue!515 () V!16155)

(declare-fun getCurrentListMapNoExtraKeys!1421 (array!26414 array!26416 (_ BitVec 32) (_ BitVec 32) V!16155 V!16155 (_ BitVec 32) Int) ListLongMap!6325)

(assert (=> b!431341 (= lt!197568 (getCurrentListMapNoExtraKeys!1421 lt!197570 lt!197565 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16155)

(assert (=> b!431341 (= lt!197562 (tuple2!7411 k0!794 v!412))))

(assert (=> b!431341 (= lt!197573 (getCurrentListMapNoExtraKeys!1421 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12724 0))(
  ( (Unit!12725) )
))
(declare-fun lt!197566 () Unit!12724)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!562 (array!26414 array!26416 (_ BitVec 32) (_ BitVec 32) V!16155 V!16155 (_ BitVec 32) (_ BitVec 64) V!16155 (_ BitVec 32) Int) Unit!12724)

(assert (=> b!431341 (= lt!197566 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!562 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18552 () Bool)

(declare-fun mapRes!18552 () Bool)

(declare-fun tp!35934 () Bool)

(declare-fun e!255256 () Bool)

(assert (=> mapNonEmpty!18552 (= mapRes!18552 (and tp!35934 e!255256))))

(declare-fun mapRest!18552 () (Array (_ BitVec 32) ValueCell!5300))

(declare-fun mapKey!18552 () (_ BitVec 32))

(declare-fun mapValue!18552 () ValueCell!5300)

(assert (=> mapNonEmpty!18552 (= (arr!12657 _values!549) (store mapRest!18552 mapKey!18552 mapValue!18552))))

(declare-fun b!431342 () Bool)

(declare-fun res!253605 () Bool)

(assert (=> b!431342 (=> (not res!253605) (not e!255257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431342 (= res!253605 (validMask!0 mask!1025))))

(declare-fun b!431343 () Bool)

(declare-fun res!253615 () Bool)

(assert (=> b!431343 (=> (not res!253615) (not e!255257))))

(assert (=> b!431343 (= res!253615 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7403))))

(declare-fun b!431344 () Bool)

(assert (=> b!431344 (= e!255256 tp_is_empty!11287)))

(declare-fun b!431345 () Bool)

(declare-fun e!255250 () Bool)

(assert (=> b!431345 (= e!255250 true)))

(declare-fun lt!197564 () ListLongMap!6325)

(declare-fun lt!197560 () tuple2!7410)

(assert (=> b!431345 (= lt!197564 (+!1386 (+!1386 lt!197573 lt!197560) lt!197562))))

(declare-fun lt!197567 () V!16155)

(declare-fun lt!197569 () Unit!12724)

(declare-fun addCommutativeForDiffKeys!365 (ListLongMap!6325 (_ BitVec 64) V!16155 (_ BitVec 64) V!16155) Unit!12724)

(assert (=> b!431345 (= lt!197569 (addCommutativeForDiffKeys!365 lt!197573 k0!794 v!412 (select (arr!12656 _keys!709) from!863) lt!197567))))

(declare-fun b!431346 () Bool)

(assert (=> b!431346 (= e!255257 e!255253)))

(declare-fun res!253612 () Bool)

(assert (=> b!431346 (=> (not res!253612) (not e!255253))))

(assert (=> b!431346 (= res!253612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197570 mask!1025))))

(assert (=> b!431346 (= lt!197570 (array!26415 (store (arr!12656 _keys!709) i!563 k0!794) (size!13008 _keys!709)))))

(declare-fun b!431347 () Bool)

(assert (=> b!431347 (= e!255253 e!255259)))

(declare-fun res!253613 () Bool)

(assert (=> b!431347 (=> (not res!253613) (not e!255259))))

(assert (=> b!431347 (= res!253613 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!197574 () ListLongMap!6325)

(assert (=> b!431347 (= lt!197574 (getCurrentListMapNoExtraKeys!1421 lt!197570 lt!197565 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431347 (= lt!197565 (array!26417 (store (arr!12657 _values!549) i!563 (ValueCellFull!5300 v!412)) (size!13009 _values!549)))))

(declare-fun lt!197571 () ListLongMap!6325)

(assert (=> b!431347 (= lt!197571 (getCurrentListMapNoExtraKeys!1421 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431348 () Bool)

(declare-fun e!255251 () Unit!12724)

(declare-fun Unit!12726 () Unit!12724)

(assert (=> b!431348 (= e!255251 Unit!12726)))

(declare-fun mapIsEmpty!18552 () Bool)

(assert (=> mapIsEmpty!18552 mapRes!18552))

(declare-fun b!431349 () Bool)

(declare-fun res!253603 () Bool)

(assert (=> b!431349 (=> (not res!253603) (not e!255253))))

(assert (=> b!431349 (= res!253603 (bvsle from!863 i!563))))

(declare-fun b!431350 () Bool)

(assert (=> b!431350 (= e!255252 e!255250)))

(declare-fun res!253611 () Bool)

(assert (=> b!431350 (=> res!253611 e!255250)))

(assert (=> b!431350 (= res!253611 (= k0!794 (select (arr!12656 _keys!709) from!863)))))

(assert (=> b!431350 (not (= (select (arr!12656 _keys!709) from!863) k0!794))))

(declare-fun lt!197563 () Unit!12724)

(assert (=> b!431350 (= lt!197563 e!255251)))

(declare-fun c!55515 () Bool)

(assert (=> b!431350 (= c!55515 (= (select (arr!12656 _keys!709) from!863) k0!794))))

(assert (=> b!431350 (= lt!197574 lt!197564)))

(assert (=> b!431350 (= lt!197564 (+!1386 lt!197572 lt!197560))))

(assert (=> b!431350 (= lt!197560 (tuple2!7411 (select (arr!12656 _keys!709) from!863) lt!197567))))

(declare-fun get!6295 (ValueCell!5300 V!16155) V!16155)

(declare-fun dynLambda!796 (Int (_ BitVec 64)) V!16155)

(assert (=> b!431350 (= lt!197567 (get!6295 (select (arr!12657 _values!549) from!863) (dynLambda!796 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431351 () Bool)

(declare-fun res!253609 () Bool)

(assert (=> b!431351 (=> (not res!253609) (not e!255257))))

(assert (=> b!431351 (= res!253609 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13008 _keys!709))))))

(declare-fun b!431352 () Bool)

(declare-fun Unit!12727 () Unit!12724)

(assert (=> b!431352 (= e!255251 Unit!12727)))

(declare-fun lt!197561 () Unit!12724)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26414 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12724)

(assert (=> b!431352 (= lt!197561 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431352 false))

(declare-fun b!431353 () Bool)

(declare-fun res!253614 () Bool)

(assert (=> b!431353 (=> (not res!253614) (not e!255257))))

(assert (=> b!431353 (= res!253614 (or (= (select (arr!12656 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12656 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431354 () Bool)

(declare-fun e!255258 () Bool)

(assert (=> b!431354 (= e!255255 (and e!255258 mapRes!18552))))

(declare-fun condMapEmpty!18552 () Bool)

(declare-fun mapDefault!18552 () ValueCell!5300)

(assert (=> b!431354 (= condMapEmpty!18552 (= (arr!12657 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5300)) mapDefault!18552)))))

(declare-fun b!431355 () Bool)

(assert (=> b!431355 (= e!255258 tp_is_empty!11287)))

(declare-fun b!431356 () Bool)

(declare-fun res!253608 () Bool)

(assert (=> b!431356 (=> (not res!253608) (not e!255257))))

(assert (=> b!431356 (= res!253608 (validKeyInArray!0 k0!794))))

(assert (= (and start!39854 res!253616) b!431342))

(assert (= (and b!431342 res!253605) b!431339))

(assert (= (and b!431339 res!253604) b!431337))

(assert (= (and b!431337 res!253606) b!431343))

(assert (= (and b!431343 res!253615) b!431351))

(assert (= (and b!431351 res!253609) b!431356))

(assert (= (and b!431356 res!253608) b!431353))

(assert (= (and b!431353 res!253614) b!431340))

(assert (= (and b!431340 res!253617) b!431346))

(assert (= (and b!431346 res!253612) b!431338))

(assert (= (and b!431338 res!253607) b!431349))

(assert (= (and b!431349 res!253603) b!431347))

(assert (= (and b!431347 res!253613) b!431341))

(assert (= (and b!431341 (not res!253610)) b!431350))

(assert (= (and b!431350 c!55515) b!431352))

(assert (= (and b!431350 (not c!55515)) b!431348))

(assert (= (and b!431350 (not res!253611)) b!431345))

(assert (= (and b!431354 condMapEmpty!18552) mapIsEmpty!18552))

(assert (= (and b!431354 (not condMapEmpty!18552)) mapNonEmpty!18552))

(get-info :version)

(assert (= (and mapNonEmpty!18552 ((_ is ValueCellFull!5300) mapValue!18552)) b!431344))

(assert (= (and b!431354 ((_ is ValueCellFull!5300) mapDefault!18552)) b!431355))

(assert (= start!39854 b!431354))

(declare-fun b_lambda!9245 () Bool)

(assert (=> (not b_lambda!9245) (not b!431350)))

(declare-fun t!12981 () Bool)

(declare-fun tb!3533 () Bool)

(assert (=> (and start!39854 (= defaultEntry!557 defaultEntry!557) t!12981) tb!3533))

(declare-fun result!6601 () Bool)

(assert (=> tb!3533 (= result!6601 tp_is_empty!11287)))

(assert (=> b!431350 t!12981))

(declare-fun b_and!17945 () Bool)

(assert (= b_and!17943 (and (=> t!12981 result!6601) b_and!17945)))

(declare-fun m!419753 () Bool)

(assert (=> b!431352 m!419753))

(declare-fun m!419755 () Bool)

(assert (=> b!431350 m!419755))

(declare-fun m!419757 () Bool)

(assert (=> b!431350 m!419757))

(declare-fun m!419759 () Bool)

(assert (=> b!431350 m!419759))

(declare-fun m!419761 () Bool)

(assert (=> b!431350 m!419761))

(assert (=> b!431350 m!419761))

(assert (=> b!431350 m!419759))

(declare-fun m!419763 () Bool)

(assert (=> b!431350 m!419763))

(declare-fun m!419765 () Bool)

(assert (=> b!431353 m!419765))

(declare-fun m!419767 () Bool)

(assert (=> start!39854 m!419767))

(declare-fun m!419769 () Bool)

(assert (=> start!39854 m!419769))

(declare-fun m!419771 () Bool)

(assert (=> b!431342 m!419771))

(declare-fun m!419773 () Bool)

(assert (=> b!431337 m!419773))

(assert (=> b!431341 m!419755))

(declare-fun m!419775 () Bool)

(assert (=> b!431341 m!419775))

(declare-fun m!419777 () Bool)

(assert (=> b!431341 m!419777))

(declare-fun m!419779 () Bool)

(assert (=> b!431341 m!419779))

(assert (=> b!431341 m!419755))

(declare-fun m!419781 () Bool)

(assert (=> b!431341 m!419781))

(declare-fun m!419783 () Bool)

(assert (=> b!431341 m!419783))

(declare-fun m!419785 () Bool)

(assert (=> b!431343 m!419785))

(declare-fun m!419787 () Bool)

(assert (=> mapNonEmpty!18552 m!419787))

(declare-fun m!419789 () Bool)

(assert (=> b!431345 m!419789))

(assert (=> b!431345 m!419789))

(declare-fun m!419791 () Bool)

(assert (=> b!431345 m!419791))

(assert (=> b!431345 m!419755))

(assert (=> b!431345 m!419755))

(declare-fun m!419793 () Bool)

(assert (=> b!431345 m!419793))

(declare-fun m!419795 () Bool)

(assert (=> b!431346 m!419795))

(declare-fun m!419797 () Bool)

(assert (=> b!431346 m!419797))

(declare-fun m!419799 () Bool)

(assert (=> b!431340 m!419799))

(declare-fun m!419801 () Bool)

(assert (=> b!431338 m!419801))

(declare-fun m!419803 () Bool)

(assert (=> b!431347 m!419803))

(declare-fun m!419805 () Bool)

(assert (=> b!431347 m!419805))

(declare-fun m!419807 () Bool)

(assert (=> b!431347 m!419807))

(declare-fun m!419809 () Bool)

(assert (=> b!431356 m!419809))

(check-sat (not b!431346) (not b!431356) (not start!39854) (not b!431343) (not b!431341) (not b_next!10135) (not b!431345) (not b_lambda!9245) (not b!431340) b_and!17945 tp_is_empty!11287 (not b!431347) (not b!431350) (not b!431337) (not b!431338) (not b!431342) (not mapNonEmpty!18552) (not b!431352))
(check-sat b_and!17945 (not b_next!10135))
