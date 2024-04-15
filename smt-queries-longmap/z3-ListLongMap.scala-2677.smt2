; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39866 () Bool)

(assert start!39866)

(declare-fun b_free!10147 () Bool)

(declare-fun b_next!10147 () Bool)

(assert (=> start!39866 (= b_free!10147 (not b_next!10147))))

(declare-fun tp!35969 () Bool)

(declare-fun b_and!17927 () Bool)

(assert (=> start!39866 (= tp!35969 b_and!17927)))

(declare-fun b!431487 () Bool)

(declare-fun e!255296 () Bool)

(declare-fun e!255291 () Bool)

(assert (=> b!431487 (= e!255296 e!255291)))

(declare-fun res!253758 () Bool)

(assert (=> b!431487 (=> res!253758 e!255291)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26425 0))(
  ( (array!26426 (arr!12662 (Array (_ BitVec 32) (_ BitVec 64))) (size!13015 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26425)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!431487 (= res!253758 (= k0!794 (select (arr!12662 _keys!709) from!863)))))

(assert (=> b!431487 (not (= (select (arr!12662 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12716 0))(
  ( (Unit!12717) )
))
(declare-fun lt!197590 () Unit!12716)

(declare-fun e!255289 () Unit!12716)

(assert (=> b!431487 (= lt!197590 e!255289)))

(declare-fun c!55485 () Bool)

(assert (=> b!431487 (= c!55485 (= (select (arr!12662 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16171 0))(
  ( (V!16172 (val!5694 Int)) )
))
(declare-datatypes ((tuple2!7518 0))(
  ( (tuple2!7519 (_1!3770 (_ BitVec 64)) (_2!3770 V!16171)) )
))
(declare-datatypes ((List!7514 0))(
  ( (Nil!7511) (Cons!7510 (h!8366 tuple2!7518) (t!13101 List!7514)) )
))
(declare-datatypes ((ListLongMap!6421 0))(
  ( (ListLongMap!6422 (toList!3226 List!7514)) )
))
(declare-fun lt!197582 () ListLongMap!6421)

(declare-fun lt!197583 () ListLongMap!6421)

(assert (=> b!431487 (= lt!197582 lt!197583)))

(declare-fun lt!197591 () ListLongMap!6421)

(declare-fun lt!197588 () tuple2!7518)

(declare-fun +!1402 (ListLongMap!6421 tuple2!7518) ListLongMap!6421)

(assert (=> b!431487 (= lt!197583 (+!1402 lt!197591 lt!197588))))

(declare-fun lt!197578 () V!16171)

(assert (=> b!431487 (= lt!197588 (tuple2!7519 (select (arr!12662 _keys!709) from!863) lt!197578))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5306 0))(
  ( (ValueCellFull!5306 (v!7935 V!16171)) (EmptyCell!5306) )
))
(declare-datatypes ((array!26427 0))(
  ( (array!26428 (arr!12663 (Array (_ BitVec 32) ValueCell!5306)) (size!13016 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26427)

(declare-fun get!6290 (ValueCell!5306 V!16171) V!16171)

(declare-fun dynLambda!790 (Int (_ BitVec 64)) V!16171)

(assert (=> b!431487 (= lt!197578 (get!6290 (select (arr!12663 _values!549) from!863) (dynLambda!790 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18570 () Bool)

(declare-fun mapRes!18570 () Bool)

(assert (=> mapIsEmpty!18570 mapRes!18570))

(declare-fun b!431488 () Bool)

(declare-fun res!253750 () Bool)

(declare-fun e!255294 () Bool)

(assert (=> b!431488 (=> (not res!253750) (not e!255294))))

(declare-fun arrayContainsKey!0 (array!26425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431488 (= res!253750 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431489 () Bool)

(declare-fun res!253749 () Bool)

(assert (=> b!431489 (=> (not res!253749) (not e!255294))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431489 (= res!253749 (or (= (select (arr!12662 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12662 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431490 () Bool)

(declare-fun e!255290 () Bool)

(declare-fun e!255297 () Bool)

(assert (=> b!431490 (= e!255290 (and e!255297 mapRes!18570))))

(declare-fun condMapEmpty!18570 () Bool)

(declare-fun mapDefault!18570 () ValueCell!5306)

(assert (=> b!431490 (= condMapEmpty!18570 (= (arr!12663 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5306)) mapDefault!18570)))))

(declare-fun res!253761 () Bool)

(assert (=> start!39866 (=> (not res!253761) (not e!255294))))

(assert (=> start!39866 (= res!253761 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13015 _keys!709))))))

(assert (=> start!39866 e!255294))

(declare-fun tp_is_empty!11299 () Bool)

(assert (=> start!39866 tp_is_empty!11299))

(assert (=> start!39866 tp!35969))

(assert (=> start!39866 true))

(declare-fun array_inv!9248 (array!26427) Bool)

(assert (=> start!39866 (and (array_inv!9248 _values!549) e!255290)))

(declare-fun array_inv!9249 (array!26425) Bool)

(assert (=> start!39866 (array_inv!9249 _keys!709)))

(declare-fun b!431491 () Bool)

(declare-fun e!255293 () Bool)

(assert (=> b!431491 (= e!255294 e!255293)))

(declare-fun res!253756 () Bool)

(assert (=> b!431491 (=> (not res!253756) (not e!255293))))

(declare-fun lt!197585 () array!26425)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26425 (_ BitVec 32)) Bool)

(assert (=> b!431491 (= res!253756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197585 mask!1025))))

(assert (=> b!431491 (= lt!197585 (array!26426 (store (arr!12662 _keys!709) i!563 k0!794) (size!13015 _keys!709)))))

(declare-fun b!431492 () Bool)

(declare-fun Unit!12718 () Unit!12716)

(assert (=> b!431492 (= e!255289 Unit!12718)))

(declare-fun b!431493 () Bool)

(declare-fun Unit!12719 () Unit!12716)

(assert (=> b!431493 (= e!255289 Unit!12719)))

(declare-fun lt!197581 () Unit!12716)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26425 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12716)

(assert (=> b!431493 (= lt!197581 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431493 false))

(declare-fun b!431494 () Bool)

(assert (=> b!431494 (= e!255297 tp_is_empty!11299)))

(declare-fun b!431495 () Bool)

(declare-fun res!253757 () Bool)

(assert (=> b!431495 (=> (not res!253757) (not e!255294))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!431495 (= res!253757 (and (= (size!13016 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13015 _keys!709) (size!13016 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431496 () Bool)

(assert (=> b!431496 (= e!255291 true)))

(declare-fun lt!197579 () tuple2!7518)

(declare-fun lt!197580 () ListLongMap!6421)

(assert (=> b!431496 (= lt!197583 (+!1402 (+!1402 lt!197580 lt!197588) lt!197579))))

(declare-fun lt!197586 () Unit!12716)

(declare-fun v!412 () V!16171)

(declare-fun addCommutativeForDiffKeys!363 (ListLongMap!6421 (_ BitVec 64) V!16171 (_ BitVec 64) V!16171) Unit!12716)

(assert (=> b!431496 (= lt!197586 (addCommutativeForDiffKeys!363 lt!197580 k0!794 v!412 (select (arr!12662 _keys!709) from!863) lt!197578))))

(declare-fun b!431497 () Bool)

(declare-fun e!255295 () Bool)

(assert (=> b!431497 (= e!255293 e!255295)))

(declare-fun res!253755 () Bool)

(assert (=> b!431497 (=> (not res!253755) (not e!255295))))

(assert (=> b!431497 (= res!253755 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16171)

(declare-fun zeroValue!515 () V!16171)

(declare-fun lt!197577 () array!26427)

(declare-fun getCurrentListMapNoExtraKeys!1432 (array!26425 array!26427 (_ BitVec 32) (_ BitVec 32) V!16171 V!16171 (_ BitVec 32) Int) ListLongMap!6421)

(assert (=> b!431497 (= lt!197582 (getCurrentListMapNoExtraKeys!1432 lt!197585 lt!197577 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431497 (= lt!197577 (array!26428 (store (arr!12663 _values!549) i!563 (ValueCellFull!5306 v!412)) (size!13016 _values!549)))))

(declare-fun lt!197587 () ListLongMap!6421)

(assert (=> b!431497 (= lt!197587 (getCurrentListMapNoExtraKeys!1432 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431498 () Bool)

(declare-fun res!253748 () Bool)

(assert (=> b!431498 (=> (not res!253748) (not e!255294))))

(assert (=> b!431498 (= res!253748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431499 () Bool)

(declare-fun res!253760 () Bool)

(assert (=> b!431499 (=> (not res!253760) (not e!255293))))

(assert (=> b!431499 (= res!253760 (bvsle from!863 i!563))))

(declare-fun b!431500 () Bool)

(declare-fun res!253747 () Bool)

(assert (=> b!431500 (=> (not res!253747) (not e!255294))))

(declare-datatypes ((List!7515 0))(
  ( (Nil!7512) (Cons!7511 (h!8367 (_ BitVec 64)) (t!13102 List!7515)) )
))
(declare-fun arrayNoDuplicates!0 (array!26425 (_ BitVec 32) List!7515) Bool)

(assert (=> b!431500 (= res!253747 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7512))))

(declare-fun b!431501 () Bool)

(assert (=> b!431501 (= e!255295 (not e!255296))))

(declare-fun res!253753 () Bool)

(assert (=> b!431501 (=> res!253753 e!255296)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431501 (= res!253753 (not (validKeyInArray!0 (select (arr!12662 _keys!709) from!863))))))

(declare-fun lt!197589 () ListLongMap!6421)

(assert (=> b!431501 (= lt!197589 lt!197591)))

(assert (=> b!431501 (= lt!197591 (+!1402 lt!197580 lt!197579))))

(assert (=> b!431501 (= lt!197589 (getCurrentListMapNoExtraKeys!1432 lt!197585 lt!197577 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431501 (= lt!197579 (tuple2!7519 k0!794 v!412))))

(assert (=> b!431501 (= lt!197580 (getCurrentListMapNoExtraKeys!1432 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197584 () Unit!12716)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!561 (array!26425 array!26427 (_ BitVec 32) (_ BitVec 32) V!16171 V!16171 (_ BitVec 32) (_ BitVec 64) V!16171 (_ BitVec 32) Int) Unit!12716)

(assert (=> b!431501 (= lt!197584 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!561 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431502 () Bool)

(declare-fun e!255288 () Bool)

(assert (=> b!431502 (= e!255288 tp_is_empty!11299)))

(declare-fun b!431503 () Bool)

(declare-fun res!253752 () Bool)

(assert (=> b!431503 (=> (not res!253752) (not e!255293))))

(assert (=> b!431503 (= res!253752 (arrayNoDuplicates!0 lt!197585 #b00000000000000000000000000000000 Nil!7512))))

(declare-fun mapNonEmpty!18570 () Bool)

(declare-fun tp!35970 () Bool)

(assert (=> mapNonEmpty!18570 (= mapRes!18570 (and tp!35970 e!255288))))

(declare-fun mapValue!18570 () ValueCell!5306)

(declare-fun mapRest!18570 () (Array (_ BitVec 32) ValueCell!5306))

(declare-fun mapKey!18570 () (_ BitVec 32))

(assert (=> mapNonEmpty!18570 (= (arr!12663 _values!549) (store mapRest!18570 mapKey!18570 mapValue!18570))))

(declare-fun b!431504 () Bool)

(declare-fun res!253759 () Bool)

(assert (=> b!431504 (=> (not res!253759) (not e!255294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431504 (= res!253759 (validMask!0 mask!1025))))

(declare-fun b!431505 () Bool)

(declare-fun res!253751 () Bool)

(assert (=> b!431505 (=> (not res!253751) (not e!255294))))

(assert (=> b!431505 (= res!253751 (validKeyInArray!0 k0!794))))

(declare-fun b!431506 () Bool)

(declare-fun res!253754 () Bool)

(assert (=> b!431506 (=> (not res!253754) (not e!255294))))

(assert (=> b!431506 (= res!253754 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13015 _keys!709))))))

(assert (= (and start!39866 res!253761) b!431504))

(assert (= (and b!431504 res!253759) b!431495))

(assert (= (and b!431495 res!253757) b!431498))

(assert (= (and b!431498 res!253748) b!431500))

(assert (= (and b!431500 res!253747) b!431506))

(assert (= (and b!431506 res!253754) b!431505))

(assert (= (and b!431505 res!253751) b!431489))

(assert (= (and b!431489 res!253749) b!431488))

(assert (= (and b!431488 res!253750) b!431491))

(assert (= (and b!431491 res!253756) b!431503))

(assert (= (and b!431503 res!253752) b!431499))

(assert (= (and b!431499 res!253760) b!431497))

(assert (= (and b!431497 res!253755) b!431501))

(assert (= (and b!431501 (not res!253753)) b!431487))

(assert (= (and b!431487 c!55485) b!431493))

(assert (= (and b!431487 (not c!55485)) b!431492))

(assert (= (and b!431487 (not res!253758)) b!431496))

(assert (= (and b!431490 condMapEmpty!18570) mapIsEmpty!18570))

(assert (= (and b!431490 (not condMapEmpty!18570)) mapNonEmpty!18570))

(get-info :version)

(assert (= (and mapNonEmpty!18570 ((_ is ValueCellFull!5306) mapValue!18570)) b!431502))

(assert (= (and b!431490 ((_ is ValueCellFull!5306) mapDefault!18570)) b!431494))

(assert (= start!39866 b!431490))

(declare-fun b_lambda!9217 () Bool)

(assert (=> (not b_lambda!9217) (not b!431487)))

(declare-fun t!13100 () Bool)

(declare-fun tb!3545 () Bool)

(assert (=> (and start!39866 (= defaultEntry!557 defaultEntry!557) t!13100) tb!3545))

(declare-fun result!6625 () Bool)

(assert (=> tb!3545 (= result!6625 tp_is_empty!11299)))

(assert (=> b!431487 t!13100))

(declare-fun b_and!17929 () Bool)

(assert (= b_and!17927 (and (=> t!13100 result!6625) b_and!17929)))

(declare-fun m!419151 () Bool)

(assert (=> b!431493 m!419151))

(declare-fun m!419153 () Bool)

(assert (=> b!431503 m!419153))

(declare-fun m!419155 () Bool)

(assert (=> b!431501 m!419155))

(declare-fun m!419157 () Bool)

(assert (=> b!431501 m!419157))

(declare-fun m!419159 () Bool)

(assert (=> b!431501 m!419159))

(declare-fun m!419161 () Bool)

(assert (=> b!431501 m!419161))

(declare-fun m!419163 () Bool)

(assert (=> b!431501 m!419163))

(assert (=> b!431501 m!419155))

(declare-fun m!419165 () Bool)

(assert (=> b!431501 m!419165))

(declare-fun m!419167 () Bool)

(assert (=> start!39866 m!419167))

(declare-fun m!419169 () Bool)

(assert (=> start!39866 m!419169))

(assert (=> b!431487 m!419155))

(declare-fun m!419171 () Bool)

(assert (=> b!431487 m!419171))

(declare-fun m!419173 () Bool)

(assert (=> b!431487 m!419173))

(declare-fun m!419175 () Bool)

(assert (=> b!431487 m!419175))

(assert (=> b!431487 m!419175))

(assert (=> b!431487 m!419173))

(declare-fun m!419177 () Bool)

(assert (=> b!431487 m!419177))

(declare-fun m!419179 () Bool)

(assert (=> mapNonEmpty!18570 m!419179))

(declare-fun m!419181 () Bool)

(assert (=> b!431505 m!419181))

(declare-fun m!419183 () Bool)

(assert (=> b!431497 m!419183))

(declare-fun m!419185 () Bool)

(assert (=> b!431497 m!419185))

(declare-fun m!419187 () Bool)

(assert (=> b!431497 m!419187))

(declare-fun m!419189 () Bool)

(assert (=> b!431488 m!419189))

(declare-fun m!419191 () Bool)

(assert (=> b!431500 m!419191))

(declare-fun m!419193 () Bool)

(assert (=> b!431496 m!419193))

(assert (=> b!431496 m!419193))

(declare-fun m!419195 () Bool)

(assert (=> b!431496 m!419195))

(assert (=> b!431496 m!419155))

(assert (=> b!431496 m!419155))

(declare-fun m!419197 () Bool)

(assert (=> b!431496 m!419197))

(declare-fun m!419199 () Bool)

(assert (=> b!431498 m!419199))

(declare-fun m!419201 () Bool)

(assert (=> b!431489 m!419201))

(declare-fun m!419203 () Bool)

(assert (=> b!431504 m!419203))

(declare-fun m!419205 () Bool)

(assert (=> b!431491 m!419205))

(declare-fun m!419207 () Bool)

(assert (=> b!431491 m!419207))

(check-sat (not b!431488) (not b!431487) (not b!431505) (not mapNonEmpty!18570) (not b!431500) (not b_lambda!9217) (not start!39866) (not b!431501) (not b!431493) (not b_next!10147) b_and!17929 tp_is_empty!11299 (not b!431496) (not b!431498) (not b!431497) (not b!431503) (not b!431491) (not b!431504))
(check-sat b_and!17929 (not b_next!10147))
