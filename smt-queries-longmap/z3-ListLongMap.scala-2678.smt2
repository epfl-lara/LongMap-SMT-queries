; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39872 () Bool)

(assert start!39872)

(declare-fun b_free!10153 () Bool)

(declare-fun b_next!10153 () Bool)

(assert (=> start!39872 (= b_free!10153 (not b_next!10153))))

(declare-fun tp!35988 () Bool)

(declare-fun b_and!17939 () Bool)

(assert (=> start!39872 (= tp!35988 b_and!17939)))

(declare-fun b!431673 () Bool)

(declare-fun res!253887 () Bool)

(declare-fun e!255378 () Bool)

(assert (=> b!431673 (=> (not res!253887) (not e!255378))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26437 0))(
  ( (array!26438 (arr!12668 (Array (_ BitVec 32) (_ BitVec 64))) (size!13021 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26437)

(assert (=> b!431673 (= res!253887 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13021 _keys!709))))))

(declare-fun b!431674 () Bool)

(declare-fun res!253883 () Bool)

(assert (=> b!431674 (=> (not res!253883) (not e!255378))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16179 0))(
  ( (V!16180 (val!5697 Int)) )
))
(declare-datatypes ((ValueCell!5309 0))(
  ( (ValueCellFull!5309 (v!7938 V!16179)) (EmptyCell!5309) )
))
(declare-datatypes ((array!26439 0))(
  ( (array!26440 (arr!12669 (Array (_ BitVec 32) ValueCell!5309)) (size!13022 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26439)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!431674 (= res!253883 (and (= (size!13022 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13021 _keys!709) (size!13022 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18579 () Bool)

(declare-fun mapRes!18579 () Bool)

(declare-fun tp!35987 () Bool)

(declare-fun e!255387 () Bool)

(assert (=> mapNonEmpty!18579 (= mapRes!18579 (and tp!35987 e!255387))))

(declare-fun mapRest!18579 () (Array (_ BitVec 32) ValueCell!5309))

(declare-fun mapValue!18579 () ValueCell!5309)

(declare-fun mapKey!18579 () (_ BitVec 32))

(assert (=> mapNonEmpty!18579 (= (arr!12669 _values!549) (store mapRest!18579 mapKey!18579 mapValue!18579))))

(declare-fun b!431675 () Bool)

(declare-fun e!255385 () Bool)

(assert (=> b!431675 (= e!255385 true)))

(declare-datatypes ((tuple2!7524 0))(
  ( (tuple2!7525 (_1!3773 (_ BitVec 64)) (_2!3773 V!16179)) )
))
(declare-datatypes ((List!7519 0))(
  ( (Nil!7516) (Cons!7515 (h!8371 tuple2!7524) (t!13112 List!7519)) )
))
(declare-datatypes ((ListLongMap!6427 0))(
  ( (ListLongMap!6428 (toList!3229 List!7519)) )
))
(declare-fun lt!197717 () ListLongMap!6427)

(declare-fun lt!197725 () tuple2!7524)

(declare-fun lt!197718 () tuple2!7524)

(declare-fun lt!197723 () ListLongMap!6427)

(declare-fun +!1405 (ListLongMap!6427 tuple2!7524) ListLongMap!6427)

(assert (=> b!431675 (= lt!197723 (+!1405 (+!1405 lt!197717 lt!197725) lt!197718))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12727 0))(
  ( (Unit!12728) )
))
(declare-fun lt!197720 () Unit!12727)

(declare-fun lt!197713 () V!16179)

(declare-fun v!412 () V!16179)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!365 (ListLongMap!6427 (_ BitVec 64) V!16179 (_ BitVec 64) V!16179) Unit!12727)

(assert (=> b!431675 (= lt!197720 (addCommutativeForDiffKeys!365 lt!197717 k0!794 v!412 (select (arr!12668 _keys!709) from!863) lt!197713))))

(declare-fun b!431676 () Bool)

(declare-fun e!255382 () Unit!12727)

(declare-fun Unit!12729 () Unit!12727)

(assert (=> b!431676 (= e!255382 Unit!12729)))

(declare-fun lt!197719 () Unit!12727)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26437 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12727)

(assert (=> b!431676 (= lt!197719 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431676 false))

(declare-fun b!431677 () Bool)

(declare-fun res!253892 () Bool)

(assert (=> b!431677 (=> (not res!253892) (not e!255378))))

(assert (=> b!431677 (= res!253892 (or (= (select (arr!12668 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12668 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431678 () Bool)

(declare-fun res!253896 () Bool)

(assert (=> b!431678 (=> (not res!253896) (not e!255378))))

(declare-datatypes ((List!7520 0))(
  ( (Nil!7517) (Cons!7516 (h!8372 (_ BitVec 64)) (t!13113 List!7520)) )
))
(declare-fun arrayNoDuplicates!0 (array!26437 (_ BitVec 32) List!7520) Bool)

(assert (=> b!431678 (= res!253896 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7517))))

(declare-fun b!431679 () Bool)

(declare-fun e!255384 () Bool)

(declare-fun e!255379 () Bool)

(assert (=> b!431679 (= e!255384 (not e!255379))))

(declare-fun res!253885 () Bool)

(assert (=> b!431679 (=> res!253885 e!255379)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431679 (= res!253885 (not (validKeyInArray!0 (select (arr!12668 _keys!709) from!863))))))

(declare-fun lt!197716 () ListLongMap!6427)

(declare-fun lt!197712 () ListLongMap!6427)

(assert (=> b!431679 (= lt!197716 lt!197712)))

(assert (=> b!431679 (= lt!197712 (+!1405 lt!197717 lt!197718))))

(declare-fun lt!197715 () array!26439)

(declare-fun minValue!515 () V!16179)

(declare-fun zeroValue!515 () V!16179)

(declare-fun lt!197724 () array!26437)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1435 (array!26437 array!26439 (_ BitVec 32) (_ BitVec 32) V!16179 V!16179 (_ BitVec 32) Int) ListLongMap!6427)

(assert (=> b!431679 (= lt!197716 (getCurrentListMapNoExtraKeys!1435 lt!197724 lt!197715 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431679 (= lt!197718 (tuple2!7525 k0!794 v!412))))

(assert (=> b!431679 (= lt!197717 (getCurrentListMapNoExtraKeys!1435 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197726 () Unit!12727)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!563 (array!26437 array!26439 (_ BitVec 32) (_ BitVec 32) V!16179 V!16179 (_ BitVec 32) (_ BitVec 64) V!16179 (_ BitVec 32) Int) Unit!12727)

(assert (=> b!431679 (= lt!197726 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!563 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431680 () Bool)

(declare-fun e!255380 () Bool)

(assert (=> b!431680 (= e!255380 e!255384)))

(declare-fun res!253891 () Bool)

(assert (=> b!431680 (=> (not res!253891) (not e!255384))))

(assert (=> b!431680 (= res!253891 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!197721 () ListLongMap!6427)

(assert (=> b!431680 (= lt!197721 (getCurrentListMapNoExtraKeys!1435 lt!197724 lt!197715 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431680 (= lt!197715 (array!26440 (store (arr!12669 _values!549) i!563 (ValueCellFull!5309 v!412)) (size!13022 _values!549)))))

(declare-fun lt!197714 () ListLongMap!6427)

(assert (=> b!431680 (= lt!197714 (getCurrentListMapNoExtraKeys!1435 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431681 () Bool)

(declare-fun res!253882 () Bool)

(assert (=> b!431681 (=> (not res!253882) (not e!255378))))

(assert (=> b!431681 (= res!253882 (validKeyInArray!0 k0!794))))

(declare-fun b!431682 () Bool)

(declare-fun tp_is_empty!11305 () Bool)

(assert (=> b!431682 (= e!255387 tp_is_empty!11305)))

(declare-fun b!431683 () Bool)

(declare-fun res!253889 () Bool)

(assert (=> b!431683 (=> (not res!253889) (not e!255380))))

(assert (=> b!431683 (= res!253889 (bvsle from!863 i!563))))

(declare-fun b!431684 () Bool)

(declare-fun res!253894 () Bool)

(assert (=> b!431684 (=> (not res!253894) (not e!255380))))

(assert (=> b!431684 (= res!253894 (arrayNoDuplicates!0 lt!197724 #b00000000000000000000000000000000 Nil!7517))))

(declare-fun res!253886 () Bool)

(assert (=> start!39872 (=> (not res!253886) (not e!255378))))

(assert (=> start!39872 (= res!253886 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13021 _keys!709))))))

(assert (=> start!39872 e!255378))

(assert (=> start!39872 tp_is_empty!11305))

(assert (=> start!39872 tp!35988))

(assert (=> start!39872 true))

(declare-fun e!255383 () Bool)

(declare-fun array_inv!9254 (array!26439) Bool)

(assert (=> start!39872 (and (array_inv!9254 _values!549) e!255383)))

(declare-fun array_inv!9255 (array!26437) Bool)

(assert (=> start!39872 (array_inv!9255 _keys!709)))

(declare-fun mapIsEmpty!18579 () Bool)

(assert (=> mapIsEmpty!18579 mapRes!18579))

(declare-fun b!431685 () Bool)

(declare-fun res!253890 () Bool)

(assert (=> b!431685 (=> (not res!253890) (not e!255378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431685 (= res!253890 (validMask!0 mask!1025))))

(declare-fun b!431686 () Bool)

(declare-fun res!253884 () Bool)

(assert (=> b!431686 (=> (not res!253884) (not e!255378))))

(declare-fun arrayContainsKey!0 (array!26437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431686 (= res!253884 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431687 () Bool)

(assert (=> b!431687 (= e!255379 e!255385)))

(declare-fun res!253895 () Bool)

(assert (=> b!431687 (=> res!253895 e!255385)))

(assert (=> b!431687 (= res!253895 (= k0!794 (select (arr!12668 _keys!709) from!863)))))

(assert (=> b!431687 (not (= (select (arr!12668 _keys!709) from!863) k0!794))))

(declare-fun lt!197722 () Unit!12727)

(assert (=> b!431687 (= lt!197722 e!255382)))

(declare-fun c!55494 () Bool)

(assert (=> b!431687 (= c!55494 (= (select (arr!12668 _keys!709) from!863) k0!794))))

(assert (=> b!431687 (= lt!197721 lt!197723)))

(assert (=> b!431687 (= lt!197723 (+!1405 lt!197712 lt!197725))))

(assert (=> b!431687 (= lt!197725 (tuple2!7525 (select (arr!12668 _keys!709) from!863) lt!197713))))

(declare-fun get!6295 (ValueCell!5309 V!16179) V!16179)

(declare-fun dynLambda!793 (Int (_ BitVec 64)) V!16179)

(assert (=> b!431687 (= lt!197713 (get!6295 (select (arr!12669 _values!549) from!863) (dynLambda!793 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431688 () Bool)

(declare-fun e!255381 () Bool)

(assert (=> b!431688 (= e!255383 (and e!255381 mapRes!18579))))

(declare-fun condMapEmpty!18579 () Bool)

(declare-fun mapDefault!18579 () ValueCell!5309)

(assert (=> b!431688 (= condMapEmpty!18579 (= (arr!12669 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5309)) mapDefault!18579)))))

(declare-fun b!431689 () Bool)

(assert (=> b!431689 (= e!255381 tp_is_empty!11305)))

(declare-fun b!431690 () Bool)

(declare-fun res!253893 () Bool)

(assert (=> b!431690 (=> (not res!253893) (not e!255378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26437 (_ BitVec 32)) Bool)

(assert (=> b!431690 (= res!253893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431691 () Bool)

(assert (=> b!431691 (= e!255378 e!255380)))

(declare-fun res!253888 () Bool)

(assert (=> b!431691 (=> (not res!253888) (not e!255380))))

(assert (=> b!431691 (= res!253888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197724 mask!1025))))

(assert (=> b!431691 (= lt!197724 (array!26438 (store (arr!12668 _keys!709) i!563 k0!794) (size!13021 _keys!709)))))

(declare-fun b!431692 () Bool)

(declare-fun Unit!12730 () Unit!12727)

(assert (=> b!431692 (= e!255382 Unit!12730)))

(assert (= (and start!39872 res!253886) b!431685))

(assert (= (and b!431685 res!253890) b!431674))

(assert (= (and b!431674 res!253883) b!431690))

(assert (= (and b!431690 res!253893) b!431678))

(assert (= (and b!431678 res!253896) b!431673))

(assert (= (and b!431673 res!253887) b!431681))

(assert (= (and b!431681 res!253882) b!431677))

(assert (= (and b!431677 res!253892) b!431686))

(assert (= (and b!431686 res!253884) b!431691))

(assert (= (and b!431691 res!253888) b!431684))

(assert (= (and b!431684 res!253894) b!431683))

(assert (= (and b!431683 res!253889) b!431680))

(assert (= (and b!431680 res!253891) b!431679))

(assert (= (and b!431679 (not res!253885)) b!431687))

(assert (= (and b!431687 c!55494) b!431676))

(assert (= (and b!431687 (not c!55494)) b!431692))

(assert (= (and b!431687 (not res!253895)) b!431675))

(assert (= (and b!431688 condMapEmpty!18579) mapIsEmpty!18579))

(assert (= (and b!431688 (not condMapEmpty!18579)) mapNonEmpty!18579))

(get-info :version)

(assert (= (and mapNonEmpty!18579 ((_ is ValueCellFull!5309) mapValue!18579)) b!431682))

(assert (= (and b!431688 ((_ is ValueCellFull!5309) mapDefault!18579)) b!431689))

(assert (= start!39872 b!431688))

(declare-fun b_lambda!9223 () Bool)

(assert (=> (not b_lambda!9223) (not b!431687)))

(declare-fun t!13111 () Bool)

(declare-fun tb!3551 () Bool)

(assert (=> (and start!39872 (= defaultEntry!557 defaultEntry!557) t!13111) tb!3551))

(declare-fun result!6637 () Bool)

(assert (=> tb!3551 (= result!6637 tp_is_empty!11305)))

(assert (=> b!431687 t!13111))

(declare-fun b_and!17941 () Bool)

(assert (= b_and!17939 (and (=> t!13111 result!6637) b_and!17941)))

(declare-fun m!419325 () Bool)

(assert (=> b!431687 m!419325))

(declare-fun m!419327 () Bool)

(assert (=> b!431687 m!419327))

(declare-fun m!419329 () Bool)

(assert (=> b!431687 m!419329))

(declare-fun m!419331 () Bool)

(assert (=> b!431687 m!419331))

(assert (=> b!431687 m!419329))

(assert (=> b!431687 m!419327))

(declare-fun m!419333 () Bool)

(assert (=> b!431687 m!419333))

(declare-fun m!419335 () Bool)

(assert (=> mapNonEmpty!18579 m!419335))

(declare-fun m!419337 () Bool)

(assert (=> b!431676 m!419337))

(declare-fun m!419339 () Bool)

(assert (=> b!431678 m!419339))

(assert (=> b!431679 m!419325))

(declare-fun m!419341 () Bool)

(assert (=> b!431679 m!419341))

(declare-fun m!419343 () Bool)

(assert (=> b!431679 m!419343))

(declare-fun m!419345 () Bool)

(assert (=> b!431679 m!419345))

(assert (=> b!431679 m!419325))

(declare-fun m!419347 () Bool)

(assert (=> b!431679 m!419347))

(declare-fun m!419349 () Bool)

(assert (=> b!431679 m!419349))

(declare-fun m!419351 () Bool)

(assert (=> b!431690 m!419351))

(declare-fun m!419353 () Bool)

(assert (=> b!431684 m!419353))

(declare-fun m!419355 () Bool)

(assert (=> b!431681 m!419355))

(declare-fun m!419357 () Bool)

(assert (=> b!431675 m!419357))

(assert (=> b!431675 m!419357))

(declare-fun m!419359 () Bool)

(assert (=> b!431675 m!419359))

(assert (=> b!431675 m!419325))

(assert (=> b!431675 m!419325))

(declare-fun m!419361 () Bool)

(assert (=> b!431675 m!419361))

(declare-fun m!419363 () Bool)

(assert (=> b!431685 m!419363))

(declare-fun m!419365 () Bool)

(assert (=> start!39872 m!419365))

(declare-fun m!419367 () Bool)

(assert (=> start!39872 m!419367))

(declare-fun m!419369 () Bool)

(assert (=> b!431686 m!419369))

(declare-fun m!419371 () Bool)

(assert (=> b!431680 m!419371))

(declare-fun m!419373 () Bool)

(assert (=> b!431680 m!419373))

(declare-fun m!419375 () Bool)

(assert (=> b!431680 m!419375))

(declare-fun m!419377 () Bool)

(assert (=> b!431691 m!419377))

(declare-fun m!419379 () Bool)

(assert (=> b!431691 m!419379))

(declare-fun m!419381 () Bool)

(assert (=> b!431677 m!419381))

(check-sat (not b_lambda!9223) (not mapNonEmpty!18579) b_and!17941 (not b!431681) (not b_next!10153) (not b!431690) (not b!431687) (not b!431685) (not b!431679) (not b!431691) tp_is_empty!11305 (not b!431686) (not b!431675) (not start!39872) (not b!431678) (not b!431676) (not b!431680) (not b!431684))
(check-sat b_and!17941 (not b_next!10153))
