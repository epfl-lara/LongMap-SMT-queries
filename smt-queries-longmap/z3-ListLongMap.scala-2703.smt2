; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40022 () Bool)

(assert start!40022)

(declare-fun b_free!10303 () Bool)

(declare-fun b_next!10303 () Bool)

(assert (=> start!40022 (= b_free!10303 (not b_next!10303))))

(declare-fun tp!36438 () Bool)

(declare-fun b_and!18239 () Bool)

(assert (=> start!40022 (= tp!36438 b_and!18239)))

(declare-fun b!436323 () Bool)

(declare-fun e!257634 () Bool)

(declare-fun e!257631 () Bool)

(assert (=> b!436323 (= e!257634 e!257631)))

(declare-fun res!257261 () Bool)

(assert (=> b!436323 (=> res!257261 e!257631)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26733 0))(
  ( (array!26734 (arr!12816 (Array (_ BitVec 32) (_ BitVec 64))) (size!13169 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26733)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!436323 (= res!257261 (= k0!794 (select (arr!12816 _keys!709) from!863)))))

(assert (=> b!436323 (not (= (select (arr!12816 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12957 0))(
  ( (Unit!12958) )
))
(declare-fun lt!201094 () Unit!12957)

(declare-fun e!257629 () Unit!12957)

(assert (=> b!436323 (= lt!201094 e!257629)))

(declare-fun c!55719 () Bool)

(assert (=> b!436323 (= c!55719 (= (select (arr!12816 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16379 0))(
  ( (V!16380 (val!5772 Int)) )
))
(declare-datatypes ((tuple2!7662 0))(
  ( (tuple2!7663 (_1!3842 (_ BitVec 64)) (_2!3842 V!16379)) )
))
(declare-datatypes ((List!7649 0))(
  ( (Nil!7646) (Cons!7645 (h!8501 tuple2!7662) (t!13392 List!7649)) )
))
(declare-datatypes ((ListLongMap!6565 0))(
  ( (ListLongMap!6566 (toList!3298 List!7649)) )
))
(declare-fun lt!201091 () ListLongMap!6565)

(declare-fun lt!201099 () ListLongMap!6565)

(assert (=> b!436323 (= lt!201091 lt!201099)))

(declare-fun lt!201100 () ListLongMap!6565)

(declare-fun lt!201095 () tuple2!7662)

(declare-fun +!1472 (ListLongMap!6565 tuple2!7662) ListLongMap!6565)

(assert (=> b!436323 (= lt!201099 (+!1472 lt!201100 lt!201095))))

(declare-fun lt!201089 () V!16379)

(assert (=> b!436323 (= lt!201095 (tuple2!7663 (select (arr!12816 _keys!709) from!863) lt!201089))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5384 0))(
  ( (ValueCellFull!5384 (v!8013 V!16379)) (EmptyCell!5384) )
))
(declare-datatypes ((array!26735 0))(
  ( (array!26736 (arr!12817 (Array (_ BitVec 32) ValueCell!5384)) (size!13170 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26735)

(declare-fun get!6397 (ValueCell!5384 V!16379) V!16379)

(declare-fun dynLambda!845 (Int (_ BitVec 64)) V!16379)

(assert (=> b!436323 (= lt!201089 (get!6397 (select (arr!12817 _values!549) from!863) (dynLambda!845 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18804 () Bool)

(declare-fun mapRes!18804 () Bool)

(declare-fun tp!36437 () Bool)

(declare-fun e!257630 () Bool)

(assert (=> mapNonEmpty!18804 (= mapRes!18804 (and tp!36437 e!257630))))

(declare-fun mapValue!18804 () ValueCell!5384)

(declare-fun mapRest!18804 () (Array (_ BitVec 32) ValueCell!5384))

(declare-fun mapKey!18804 () (_ BitVec 32))

(assert (=> mapNonEmpty!18804 (= (arr!12817 _values!549) (store mapRest!18804 mapKey!18804 mapValue!18804))))

(declare-fun res!257268 () Bool)

(declare-fun e!257628 () Bool)

(assert (=> start!40022 (=> (not res!257268) (not e!257628))))

(assert (=> start!40022 (= res!257268 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13169 _keys!709))))))

(assert (=> start!40022 e!257628))

(declare-fun tp_is_empty!11455 () Bool)

(assert (=> start!40022 tp_is_empty!11455))

(assert (=> start!40022 tp!36438))

(assert (=> start!40022 true))

(declare-fun e!257635 () Bool)

(declare-fun array_inv!9362 (array!26735) Bool)

(assert (=> start!40022 (and (array_inv!9362 _values!549) e!257635)))

(declare-fun array_inv!9363 (array!26733) Bool)

(assert (=> start!40022 (array_inv!9363 _keys!709)))

(declare-fun b!436324 () Bool)

(declare-fun res!257257 () Bool)

(assert (=> b!436324 (=> (not res!257257) (not e!257628))))

(declare-fun arrayContainsKey!0 (array!26733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436324 (= res!257257 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18804 () Bool)

(assert (=> mapIsEmpty!18804 mapRes!18804))

(declare-fun b!436325 () Bool)

(declare-fun res!257259 () Bool)

(declare-fun e!257632 () Bool)

(assert (=> b!436325 (=> (not res!257259) (not e!257632))))

(declare-fun lt!201088 () array!26733)

(declare-datatypes ((List!7650 0))(
  ( (Nil!7647) (Cons!7646 (h!8502 (_ BitVec 64)) (t!13393 List!7650)) )
))
(declare-fun arrayNoDuplicates!0 (array!26733 (_ BitVec 32) List!7650) Bool)

(assert (=> b!436325 (= res!257259 (arrayNoDuplicates!0 lt!201088 #b00000000000000000000000000000000 Nil!7647))))

(declare-fun b!436326 () Bool)

(declare-fun res!257265 () Bool)

(assert (=> b!436326 (=> (not res!257265) (not e!257628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436326 (= res!257265 (validKeyInArray!0 k0!794))))

(declare-fun b!436327 () Bool)

(declare-fun e!257637 () Bool)

(assert (=> b!436327 (= e!257635 (and e!257637 mapRes!18804))))

(declare-fun condMapEmpty!18804 () Bool)

(declare-fun mapDefault!18804 () ValueCell!5384)

(assert (=> b!436327 (= condMapEmpty!18804 (= (arr!12817 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5384)) mapDefault!18804)))))

(declare-fun b!436328 () Bool)

(assert (=> b!436328 (= e!257630 tp_is_empty!11455)))

(declare-fun b!436329 () Bool)

(declare-fun res!257266 () Bool)

(assert (=> b!436329 (=> (not res!257266) (not e!257628))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436329 (= res!257266 (or (= (select (arr!12816 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12816 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436330 () Bool)

(declare-fun res!257270 () Bool)

(assert (=> b!436330 (=> (not res!257270) (not e!257632))))

(assert (=> b!436330 (= res!257270 (bvsle from!863 i!563))))

(declare-fun b!436331 () Bool)

(declare-fun e!257636 () Bool)

(assert (=> b!436331 (= e!257632 e!257636)))

(declare-fun res!257269 () Bool)

(assert (=> b!436331 (=> (not res!257269) (not e!257636))))

(assert (=> b!436331 (= res!257269 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16379)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16379)

(declare-fun lt!201101 () array!26735)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1497 (array!26733 array!26735 (_ BitVec 32) (_ BitVec 32) V!16379 V!16379 (_ BitVec 32) Int) ListLongMap!6565)

(assert (=> b!436331 (= lt!201091 (getCurrentListMapNoExtraKeys!1497 lt!201088 lt!201101 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16379)

(assert (=> b!436331 (= lt!201101 (array!26736 (store (arr!12817 _values!549) i!563 (ValueCellFull!5384 v!412)) (size!13170 _values!549)))))

(declare-fun lt!201090 () ListLongMap!6565)

(assert (=> b!436331 (= lt!201090 (getCurrentListMapNoExtraKeys!1497 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436332 () Bool)

(declare-fun Unit!12959 () Unit!12957)

(assert (=> b!436332 (= e!257629 Unit!12959)))

(declare-fun lt!201093 () Unit!12957)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26733 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12957)

(assert (=> b!436332 (= lt!201093 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436332 false))

(declare-fun b!436333 () Bool)

(assert (=> b!436333 (= e!257637 tp_is_empty!11455)))

(declare-fun b!436334 () Bool)

(assert (=> b!436334 (= e!257628 e!257632)))

(declare-fun res!257264 () Bool)

(assert (=> b!436334 (=> (not res!257264) (not e!257632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26733 (_ BitVec 32)) Bool)

(assert (=> b!436334 (= res!257264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201088 mask!1025))))

(assert (=> b!436334 (= lt!201088 (array!26734 (store (arr!12816 _keys!709) i!563 k0!794) (size!13169 _keys!709)))))

(declare-fun b!436335 () Bool)

(assert (=> b!436335 (= e!257631 true)))

(declare-fun lt!201098 () ListLongMap!6565)

(declare-fun lt!201096 () tuple2!7662)

(assert (=> b!436335 (= lt!201099 (+!1472 (+!1472 lt!201098 lt!201095) lt!201096))))

(declare-fun lt!201092 () Unit!12957)

(declare-fun addCommutativeForDiffKeys!421 (ListLongMap!6565 (_ BitVec 64) V!16379 (_ BitVec 64) V!16379) Unit!12957)

(assert (=> b!436335 (= lt!201092 (addCommutativeForDiffKeys!421 lt!201098 k0!794 v!412 (select (arr!12816 _keys!709) from!863) lt!201089))))

(declare-fun b!436336 () Bool)

(declare-fun res!257260 () Bool)

(assert (=> b!436336 (=> (not res!257260) (not e!257628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436336 (= res!257260 (validMask!0 mask!1025))))

(declare-fun b!436337 () Bool)

(declare-fun res!257267 () Bool)

(assert (=> b!436337 (=> (not res!257267) (not e!257628))))

(assert (=> b!436337 (= res!257267 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7647))))

(declare-fun b!436338 () Bool)

(declare-fun res!257263 () Bool)

(assert (=> b!436338 (=> (not res!257263) (not e!257628))))

(assert (=> b!436338 (= res!257263 (and (= (size!13170 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13169 _keys!709) (size!13170 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436339 () Bool)

(declare-fun res!257258 () Bool)

(assert (=> b!436339 (=> (not res!257258) (not e!257628))))

(assert (=> b!436339 (= res!257258 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13169 _keys!709))))))

(declare-fun b!436340 () Bool)

(declare-fun Unit!12960 () Unit!12957)

(assert (=> b!436340 (= e!257629 Unit!12960)))

(declare-fun b!436341 () Bool)

(assert (=> b!436341 (= e!257636 (not e!257634))))

(declare-fun res!257271 () Bool)

(assert (=> b!436341 (=> res!257271 e!257634)))

(assert (=> b!436341 (= res!257271 (not (validKeyInArray!0 (select (arr!12816 _keys!709) from!863))))))

(declare-fun lt!201087 () ListLongMap!6565)

(assert (=> b!436341 (= lt!201087 lt!201100)))

(assert (=> b!436341 (= lt!201100 (+!1472 lt!201098 lt!201096))))

(assert (=> b!436341 (= lt!201087 (getCurrentListMapNoExtraKeys!1497 lt!201088 lt!201101 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!436341 (= lt!201096 (tuple2!7663 k0!794 v!412))))

(assert (=> b!436341 (= lt!201098 (getCurrentListMapNoExtraKeys!1497 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!201097 () Unit!12957)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!611 (array!26733 array!26735 (_ BitVec 32) (_ BitVec 32) V!16379 V!16379 (_ BitVec 32) (_ BitVec 64) V!16379 (_ BitVec 32) Int) Unit!12957)

(assert (=> b!436341 (= lt!201097 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!611 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436342 () Bool)

(declare-fun res!257262 () Bool)

(assert (=> b!436342 (=> (not res!257262) (not e!257628))))

(assert (=> b!436342 (= res!257262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40022 res!257268) b!436336))

(assert (= (and b!436336 res!257260) b!436338))

(assert (= (and b!436338 res!257263) b!436342))

(assert (= (and b!436342 res!257262) b!436337))

(assert (= (and b!436337 res!257267) b!436339))

(assert (= (and b!436339 res!257258) b!436326))

(assert (= (and b!436326 res!257265) b!436329))

(assert (= (and b!436329 res!257266) b!436324))

(assert (= (and b!436324 res!257257) b!436334))

(assert (= (and b!436334 res!257264) b!436325))

(assert (= (and b!436325 res!257259) b!436330))

(assert (= (and b!436330 res!257270) b!436331))

(assert (= (and b!436331 res!257269) b!436341))

(assert (= (and b!436341 (not res!257271)) b!436323))

(assert (= (and b!436323 c!55719) b!436332))

(assert (= (and b!436323 (not c!55719)) b!436340))

(assert (= (and b!436323 (not res!257261)) b!436335))

(assert (= (and b!436327 condMapEmpty!18804) mapIsEmpty!18804))

(assert (= (and b!436327 (not condMapEmpty!18804)) mapNonEmpty!18804))

(get-info :version)

(assert (= (and mapNonEmpty!18804 ((_ is ValueCellFull!5384) mapValue!18804)) b!436328))

(assert (= (and b!436327 ((_ is ValueCellFull!5384) mapDefault!18804)) b!436333))

(assert (= start!40022 b!436327))

(declare-fun b_lambda!9373 () Bool)

(assert (=> (not b_lambda!9373) (not b!436323)))

(declare-fun t!13391 () Bool)

(declare-fun tb!3701 () Bool)

(assert (=> (and start!40022 (= defaultEntry!557 defaultEntry!557) t!13391) tb!3701))

(declare-fun result!6937 () Bool)

(assert (=> tb!3701 (= result!6937 tp_is_empty!11455)))

(assert (=> b!436323 t!13391))

(declare-fun b_and!18241 () Bool)

(assert (= b_and!18239 (and (=> t!13391 result!6937) b_and!18241)))

(declare-fun m!423675 () Bool)

(assert (=> b!436336 m!423675))

(declare-fun m!423677 () Bool)

(assert (=> mapNonEmpty!18804 m!423677))

(declare-fun m!423679 () Bool)

(assert (=> b!436341 m!423679))

(declare-fun m!423681 () Bool)

(assert (=> b!436341 m!423681))

(declare-fun m!423683 () Bool)

(assert (=> b!436341 m!423683))

(declare-fun m!423685 () Bool)

(assert (=> b!436341 m!423685))

(assert (=> b!436341 m!423679))

(declare-fun m!423687 () Bool)

(assert (=> b!436341 m!423687))

(declare-fun m!423689 () Bool)

(assert (=> b!436341 m!423689))

(declare-fun m!423691 () Bool)

(assert (=> b!436325 m!423691))

(declare-fun m!423693 () Bool)

(assert (=> b!436324 m!423693))

(declare-fun m!423695 () Bool)

(assert (=> b!436332 m!423695))

(declare-fun m!423697 () Bool)

(assert (=> b!436337 m!423697))

(declare-fun m!423699 () Bool)

(assert (=> b!436342 m!423699))

(declare-fun m!423701 () Bool)

(assert (=> b!436335 m!423701))

(assert (=> b!436335 m!423701))

(declare-fun m!423703 () Bool)

(assert (=> b!436335 m!423703))

(assert (=> b!436335 m!423679))

(assert (=> b!436335 m!423679))

(declare-fun m!423705 () Bool)

(assert (=> b!436335 m!423705))

(declare-fun m!423707 () Bool)

(assert (=> b!436334 m!423707))

(declare-fun m!423709 () Bool)

(assert (=> b!436334 m!423709))

(declare-fun m!423711 () Bool)

(assert (=> b!436329 m!423711))

(declare-fun m!423713 () Bool)

(assert (=> b!436326 m!423713))

(declare-fun m!423715 () Bool)

(assert (=> b!436331 m!423715))

(declare-fun m!423717 () Bool)

(assert (=> b!436331 m!423717))

(declare-fun m!423719 () Bool)

(assert (=> b!436331 m!423719))

(assert (=> b!436323 m!423679))

(declare-fun m!423721 () Bool)

(assert (=> b!436323 m!423721))

(declare-fun m!423723 () Bool)

(assert (=> b!436323 m!423723))

(declare-fun m!423725 () Bool)

(assert (=> b!436323 m!423725))

(assert (=> b!436323 m!423725))

(assert (=> b!436323 m!423723))

(declare-fun m!423727 () Bool)

(assert (=> b!436323 m!423727))

(declare-fun m!423729 () Bool)

(assert (=> start!40022 m!423729))

(declare-fun m!423731 () Bool)

(assert (=> start!40022 m!423731))

(check-sat tp_is_empty!11455 (not b!436335) (not b!436337) (not b!436342) (not b!436325) (not b!436326) (not b_next!10303) (not b!436341) (not b_lambda!9373) (not start!40022) (not b!436323) b_and!18241 (not b!436336) (not b!436334) (not b!436331) (not b!436332) (not mapNonEmpty!18804) (not b!436324))
(check-sat b_and!18241 (not b_next!10303))
