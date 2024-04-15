; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39860 () Bool)

(assert start!39860)

(declare-fun b_free!10141 () Bool)

(declare-fun b_next!10141 () Bool)

(assert (=> start!39860 (= b_free!10141 (not b_next!10141))))

(declare-fun tp!35952 () Bool)

(declare-fun b_and!17915 () Bool)

(assert (=> start!39860 (= tp!35952 b_and!17915)))

(declare-fun b!431301 () Bool)

(declare-fun e!255198 () Bool)

(assert (=> b!431301 (= e!255198 true)))

(declare-datatypes ((V!16163 0))(
  ( (V!16164 (val!5691 Int)) )
))
(declare-datatypes ((tuple2!7514 0))(
  ( (tuple2!7515 (_1!3768 (_ BitVec 64)) (_2!3768 V!16163)) )
))
(declare-datatypes ((List!7510 0))(
  ( (Nil!7507) (Cons!7506 (h!8362 tuple2!7514) (t!13091 List!7510)) )
))
(declare-datatypes ((ListLongMap!6417 0))(
  ( (ListLongMap!6418 (toList!3224 List!7510)) )
))
(declare-fun lt!197451 () ListLongMap!6417)

(declare-fun lt!197456 () tuple2!7514)

(declare-fun lt!197442 () tuple2!7514)

(declare-fun lt!197447 () ListLongMap!6417)

(declare-fun +!1400 (ListLongMap!6417 tuple2!7514) ListLongMap!6417)

(assert (=> b!431301 (= lt!197451 (+!1400 (+!1400 lt!197447 lt!197456) lt!197442))))

(declare-datatypes ((Unit!12710 0))(
  ( (Unit!12711) )
))
(declare-fun lt!197444 () Unit!12710)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!197450 () V!16163)

(declare-datatypes ((array!26413 0))(
  ( (array!26414 (arr!12656 (Array (_ BitVec 32) (_ BitVec 64))) (size!13009 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26413)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun v!412 () V!16163)

(declare-fun addCommutativeForDiffKeys!361 (ListLongMap!6417 (_ BitVec 64) V!16163 (_ BitVec 64) V!16163) Unit!12710)

(assert (=> b!431301 (= lt!197444 (addCommutativeForDiffKeys!361 lt!197447 k0!794 v!412 (select (arr!12656 _keys!709) from!863) lt!197450))))

(declare-fun b!431302 () Bool)

(declare-fun res!253616 () Bool)

(declare-fun e!255201 () Bool)

(assert (=> b!431302 (=> (not res!253616) (not e!255201))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431302 (= res!253616 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18561 () Bool)

(declare-fun mapRes!18561 () Bool)

(assert (=> mapIsEmpty!18561 mapRes!18561))

(declare-fun b!431303 () Bool)

(declare-fun res!253615 () Bool)

(declare-fun e!255202 () Bool)

(assert (=> b!431303 (=> (not res!253615) (not e!255202))))

(assert (=> b!431303 (= res!253615 (or (= (select (arr!12656 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12656 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431304 () Bool)

(declare-fun e!255203 () Bool)

(assert (=> b!431304 (= e!255203 e!255198)))

(declare-fun res!253622 () Bool)

(assert (=> b!431304 (=> res!253622 e!255198)))

(assert (=> b!431304 (= res!253622 (= k0!794 (select (arr!12656 _keys!709) from!863)))))

(assert (=> b!431304 (not (= (select (arr!12656 _keys!709) from!863) k0!794))))

(declare-fun lt!197443 () Unit!12710)

(declare-fun e!255206 () Unit!12710)

(assert (=> b!431304 (= lt!197443 e!255206)))

(declare-fun c!55476 () Bool)

(assert (=> b!431304 (= c!55476 (= (select (arr!12656 _keys!709) from!863) k0!794))))

(declare-fun lt!197455 () ListLongMap!6417)

(assert (=> b!431304 (= lt!197455 lt!197451)))

(declare-fun lt!197453 () ListLongMap!6417)

(assert (=> b!431304 (= lt!197451 (+!1400 lt!197453 lt!197456))))

(assert (=> b!431304 (= lt!197456 (tuple2!7515 (select (arr!12656 _keys!709) from!863) lt!197450))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5303 0))(
  ( (ValueCellFull!5303 (v!7932 V!16163)) (EmptyCell!5303) )
))
(declare-datatypes ((array!26415 0))(
  ( (array!26416 (arr!12657 (Array (_ BitVec 32) ValueCell!5303)) (size!13010 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26415)

(declare-fun get!6287 (ValueCell!5303 V!16163) V!16163)

(declare-fun dynLambda!789 (Int (_ BitVec 64)) V!16163)

(assert (=> b!431304 (= lt!197450 (get!6287 (select (arr!12657 _values!549) from!863) (dynLambda!789 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431305 () Bool)

(declare-fun res!253617 () Bool)

(assert (=> b!431305 (=> (not res!253617) (not e!255202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431305 (= res!253617 (validKeyInArray!0 k0!794))))

(declare-fun b!431306 () Bool)

(declare-fun res!253620 () Bool)

(assert (=> b!431306 (=> (not res!253620) (not e!255202))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!431306 (= res!253620 (and (= (size!13010 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13009 _keys!709) (size!13010 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431307 () Bool)

(declare-fun res!253623 () Bool)

(assert (=> b!431307 (=> (not res!253623) (not e!255202))))

(assert (=> b!431307 (= res!253623 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13009 _keys!709))))))

(declare-fun mapNonEmpty!18561 () Bool)

(declare-fun tp!35951 () Bool)

(declare-fun e!255204 () Bool)

(assert (=> mapNonEmpty!18561 (= mapRes!18561 (and tp!35951 e!255204))))

(declare-fun mapRest!18561 () (Array (_ BitVec 32) ValueCell!5303))

(declare-fun mapValue!18561 () ValueCell!5303)

(declare-fun mapKey!18561 () (_ BitVec 32))

(assert (=> mapNonEmpty!18561 (= (arr!12657 _values!549) (store mapRest!18561 mapKey!18561 mapValue!18561))))

(declare-fun b!431308 () Bool)

(declare-fun res!253614 () Bool)

(assert (=> b!431308 (=> (not res!253614) (not e!255202))))

(declare-datatypes ((List!7511 0))(
  ( (Nil!7508) (Cons!7507 (h!8363 (_ BitVec 64)) (t!13092 List!7511)) )
))
(declare-fun arrayNoDuplicates!0 (array!26413 (_ BitVec 32) List!7511) Bool)

(assert (=> b!431308 (= res!253614 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7508))))

(declare-fun b!431309 () Bool)

(declare-fun e!255200 () Bool)

(assert (=> b!431309 (= e!255201 e!255200)))

(declare-fun res!253624 () Bool)

(assert (=> b!431309 (=> (not res!253624) (not e!255200))))

(assert (=> b!431309 (= res!253624 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!197448 () array!26413)

(declare-fun zeroValue!515 () V!16163)

(declare-fun minValue!515 () V!16163)

(declare-fun lt!197452 () array!26415)

(declare-fun getCurrentListMapNoExtraKeys!1430 (array!26413 array!26415 (_ BitVec 32) (_ BitVec 32) V!16163 V!16163 (_ BitVec 32) Int) ListLongMap!6417)

(assert (=> b!431309 (= lt!197455 (getCurrentListMapNoExtraKeys!1430 lt!197448 lt!197452 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431309 (= lt!197452 (array!26416 (store (arr!12657 _values!549) i!563 (ValueCellFull!5303 v!412)) (size!13010 _values!549)))))

(declare-fun lt!197445 () ListLongMap!6417)

(assert (=> b!431309 (= lt!197445 (getCurrentListMapNoExtraKeys!1430 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431310 () Bool)

(assert (=> b!431310 (= e!255202 e!255201)))

(declare-fun res!253618 () Bool)

(assert (=> b!431310 (=> (not res!253618) (not e!255201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26413 (_ BitVec 32)) Bool)

(assert (=> b!431310 (= res!253618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197448 mask!1025))))

(assert (=> b!431310 (= lt!197448 (array!26414 (store (arr!12656 _keys!709) i!563 k0!794) (size!13009 _keys!709)))))

(declare-fun b!431311 () Bool)

(declare-fun Unit!12712 () Unit!12710)

(assert (=> b!431311 (= e!255206 Unit!12712)))

(declare-fun b!431312 () Bool)

(declare-fun res!253621 () Bool)

(assert (=> b!431312 (=> (not res!253621) (not e!255202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431312 (= res!253621 (validMask!0 mask!1025))))

(declare-fun b!431313 () Bool)

(declare-fun res!253619 () Bool)

(assert (=> b!431313 (=> (not res!253619) (not e!255201))))

(assert (=> b!431313 (= res!253619 (arrayNoDuplicates!0 lt!197448 #b00000000000000000000000000000000 Nil!7508))))

(declare-fun b!431314 () Bool)

(declare-fun e!255205 () Bool)

(declare-fun e!255199 () Bool)

(assert (=> b!431314 (= e!255205 (and e!255199 mapRes!18561))))

(declare-fun condMapEmpty!18561 () Bool)

(declare-fun mapDefault!18561 () ValueCell!5303)

(assert (=> b!431314 (= condMapEmpty!18561 (= (arr!12657 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5303)) mapDefault!18561)))))

(declare-fun b!431315 () Bool)

(declare-fun tp_is_empty!11293 () Bool)

(assert (=> b!431315 (= e!255204 tp_is_empty!11293)))

(declare-fun b!431316 () Bool)

(assert (=> b!431316 (= e!255199 tp_is_empty!11293)))

(declare-fun b!431317 () Bool)

(assert (=> b!431317 (= e!255200 (not e!255203))))

(declare-fun res!253613 () Bool)

(assert (=> b!431317 (=> res!253613 e!255203)))

(assert (=> b!431317 (= res!253613 (not (validKeyInArray!0 (select (arr!12656 _keys!709) from!863))))))

(declare-fun lt!197454 () ListLongMap!6417)

(assert (=> b!431317 (= lt!197454 lt!197453)))

(assert (=> b!431317 (= lt!197453 (+!1400 lt!197447 lt!197442))))

(assert (=> b!431317 (= lt!197454 (getCurrentListMapNoExtraKeys!1430 lt!197448 lt!197452 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431317 (= lt!197442 (tuple2!7515 k0!794 v!412))))

(assert (=> b!431317 (= lt!197447 (getCurrentListMapNoExtraKeys!1430 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197446 () Unit!12710)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!560 (array!26413 array!26415 (_ BitVec 32) (_ BitVec 32) V!16163 V!16163 (_ BitVec 32) (_ BitVec 64) V!16163 (_ BitVec 32) Int) Unit!12710)

(assert (=> b!431317 (= lt!197446 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!560 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431318 () Bool)

(declare-fun res!253626 () Bool)

(assert (=> b!431318 (=> (not res!253626) (not e!255202))))

(declare-fun arrayContainsKey!0 (array!26413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431318 (= res!253626 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431319 () Bool)

(declare-fun Unit!12713 () Unit!12710)

(assert (=> b!431319 (= e!255206 Unit!12713)))

(declare-fun lt!197449 () Unit!12710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12710)

(assert (=> b!431319 (= lt!197449 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431319 false))

(declare-fun b!431320 () Bool)

(declare-fun res!253612 () Bool)

(assert (=> b!431320 (=> (not res!253612) (not e!255202))))

(assert (=> b!431320 (= res!253612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!253625 () Bool)

(assert (=> start!39860 (=> (not res!253625) (not e!255202))))

(assert (=> start!39860 (= res!253625 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13009 _keys!709))))))

(assert (=> start!39860 e!255202))

(assert (=> start!39860 tp_is_empty!11293))

(assert (=> start!39860 tp!35952))

(assert (=> start!39860 true))

(declare-fun array_inv!9246 (array!26415) Bool)

(assert (=> start!39860 (and (array_inv!9246 _values!549) e!255205)))

(declare-fun array_inv!9247 (array!26413) Bool)

(assert (=> start!39860 (array_inv!9247 _keys!709)))

(assert (= (and start!39860 res!253625) b!431312))

(assert (= (and b!431312 res!253621) b!431306))

(assert (= (and b!431306 res!253620) b!431320))

(assert (= (and b!431320 res!253612) b!431308))

(assert (= (and b!431308 res!253614) b!431307))

(assert (= (and b!431307 res!253623) b!431305))

(assert (= (and b!431305 res!253617) b!431303))

(assert (= (and b!431303 res!253615) b!431318))

(assert (= (and b!431318 res!253626) b!431310))

(assert (= (and b!431310 res!253618) b!431313))

(assert (= (and b!431313 res!253619) b!431302))

(assert (= (and b!431302 res!253616) b!431309))

(assert (= (and b!431309 res!253624) b!431317))

(assert (= (and b!431317 (not res!253613)) b!431304))

(assert (= (and b!431304 c!55476) b!431319))

(assert (= (and b!431304 (not c!55476)) b!431311))

(assert (= (and b!431304 (not res!253622)) b!431301))

(assert (= (and b!431314 condMapEmpty!18561) mapIsEmpty!18561))

(assert (= (and b!431314 (not condMapEmpty!18561)) mapNonEmpty!18561))

(get-info :version)

(assert (= (and mapNonEmpty!18561 ((_ is ValueCellFull!5303) mapValue!18561)) b!431315))

(assert (= (and b!431314 ((_ is ValueCellFull!5303) mapDefault!18561)) b!431316))

(assert (= start!39860 b!431314))

(declare-fun b_lambda!9211 () Bool)

(assert (=> (not b_lambda!9211) (not b!431304)))

(declare-fun t!13090 () Bool)

(declare-fun tb!3539 () Bool)

(assert (=> (and start!39860 (= defaultEntry!557 defaultEntry!557) t!13090) tb!3539))

(declare-fun result!6613 () Bool)

(assert (=> tb!3539 (= result!6613 tp_is_empty!11293)))

(assert (=> b!431304 t!13090))

(declare-fun b_and!17917 () Bool)

(assert (= b_and!17915 (and (=> t!13090 result!6613) b_and!17917)))

(declare-fun m!418977 () Bool)

(assert (=> b!431309 m!418977))

(declare-fun m!418979 () Bool)

(assert (=> b!431309 m!418979))

(declare-fun m!418981 () Bool)

(assert (=> b!431309 m!418981))

(declare-fun m!418983 () Bool)

(assert (=> b!431303 m!418983))

(declare-fun m!418985 () Bool)

(assert (=> b!431313 m!418985))

(declare-fun m!418987 () Bool)

(assert (=> b!431301 m!418987))

(assert (=> b!431301 m!418987))

(declare-fun m!418989 () Bool)

(assert (=> b!431301 m!418989))

(declare-fun m!418991 () Bool)

(assert (=> b!431301 m!418991))

(assert (=> b!431301 m!418991))

(declare-fun m!418993 () Bool)

(assert (=> b!431301 m!418993))

(declare-fun m!418995 () Bool)

(assert (=> b!431305 m!418995))

(assert (=> b!431304 m!418991))

(declare-fun m!418997 () Bool)

(assert (=> b!431304 m!418997))

(declare-fun m!418999 () Bool)

(assert (=> b!431304 m!418999))

(declare-fun m!419001 () Bool)

(assert (=> b!431304 m!419001))

(assert (=> b!431304 m!419001))

(assert (=> b!431304 m!418999))

(declare-fun m!419003 () Bool)

(assert (=> b!431304 m!419003))

(declare-fun m!419005 () Bool)

(assert (=> b!431320 m!419005))

(declare-fun m!419007 () Bool)

(assert (=> start!39860 m!419007))

(declare-fun m!419009 () Bool)

(assert (=> start!39860 m!419009))

(declare-fun m!419011 () Bool)

(assert (=> b!431319 m!419011))

(declare-fun m!419013 () Bool)

(assert (=> b!431312 m!419013))

(declare-fun m!419015 () Bool)

(assert (=> mapNonEmpty!18561 m!419015))

(declare-fun m!419017 () Bool)

(assert (=> b!431308 m!419017))

(declare-fun m!419019 () Bool)

(assert (=> b!431318 m!419019))

(declare-fun m!419021 () Bool)

(assert (=> b!431310 m!419021))

(declare-fun m!419023 () Bool)

(assert (=> b!431310 m!419023))

(assert (=> b!431317 m!418991))

(declare-fun m!419025 () Bool)

(assert (=> b!431317 m!419025))

(declare-fun m!419027 () Bool)

(assert (=> b!431317 m!419027))

(assert (=> b!431317 m!418991))

(declare-fun m!419029 () Bool)

(assert (=> b!431317 m!419029))

(declare-fun m!419031 () Bool)

(assert (=> b!431317 m!419031))

(declare-fun m!419033 () Bool)

(assert (=> b!431317 m!419033))

(check-sat (not b!431319) (not b!431320) (not b!431304) (not b_next!10141) tp_is_empty!11293 (not mapNonEmpty!18561) (not b!431313) (not b_lambda!9211) (not b!431317) (not b!431310) (not b!431301) (not start!39860) (not b!431305) (not b!431309) (not b!431312) (not b!431318) (not b!431308) b_and!17917)
(check-sat b_and!17917 (not b_next!10141))
