; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41186 () Bool)

(assert start!41186)

(declare-fun b_free!11055 () Bool)

(declare-fun b_next!11055 () Bool)

(assert (=> start!41186 (= b_free!11055 (not b_next!11055))))

(declare-fun tp!39000 () Bool)

(declare-fun b_and!19349 () Bool)

(assert (=> start!41186 (= tp!39000 b_and!19349)))

(declare-fun mapIsEmpty!20239 () Bool)

(declare-fun mapRes!20239 () Bool)

(assert (=> mapIsEmpty!20239 mapRes!20239))

(declare-fun b!460495 () Bool)

(declare-fun e!268657 () Bool)

(declare-fun e!268650 () Bool)

(assert (=> b!460495 (= e!268657 e!268650)))

(declare-fun res!275327 () Bool)

(assert (=> b!460495 (=> (not res!275327) (not e!268650))))

(declare-datatypes ((array!28585 0))(
  ( (array!28586 (arr!13733 (Array (_ BitVec 32) (_ BitVec 64))) (size!14085 (_ BitVec 32))) )
))
(declare-fun lt!208556 () array!28585)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28585 (_ BitVec 32)) Bool)

(assert (=> b!460495 (= res!275327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208556 mask!1025))))

(declare-fun _keys!709 () array!28585)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460495 (= lt!208556 (array!28586 (store (arr!13733 _keys!709) i!563 k0!794) (size!14085 _keys!709)))))

(declare-fun b!460496 () Bool)

(declare-fun e!268651 () Bool)

(assert (=> b!460496 (= e!268650 e!268651)))

(declare-fun res!275341 () Bool)

(assert (=> b!460496 (=> (not res!275341) (not e!268651))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!460496 (= res!275341 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17629 0))(
  ( (V!17630 (val!6241 Int)) )
))
(declare-fun minValue!515 () V!17629)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17629)

(declare-datatypes ((tuple2!8232 0))(
  ( (tuple2!8233 (_1!4127 (_ BitVec 64)) (_2!4127 V!17629)) )
))
(declare-datatypes ((List!8303 0))(
  ( (Nil!8300) (Cons!8299 (h!9155 tuple2!8232) (t!14237 List!8303)) )
))
(declare-datatypes ((ListLongMap!7145 0))(
  ( (ListLongMap!7146 (toList!3588 List!8303)) )
))
(declare-fun lt!208553 () ListLongMap!7145)

(declare-datatypes ((ValueCell!5853 0))(
  ( (ValueCellFull!5853 (v!8519 V!17629)) (EmptyCell!5853) )
))
(declare-datatypes ((array!28587 0))(
  ( (array!28588 (arr!13734 (Array (_ BitVec 32) ValueCell!5853)) (size!14086 (_ BitVec 32))) )
))
(declare-fun lt!208549 () array!28587)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1768 (array!28585 array!28587 (_ BitVec 32) (_ BitVec 32) V!17629 V!17629 (_ BitVec 32) Int) ListLongMap!7145)

(assert (=> b!460496 (= lt!208553 (getCurrentListMapNoExtraKeys!1768 lt!208556 lt!208549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28587)

(declare-fun v!412 () V!17629)

(assert (=> b!460496 (= lt!208549 (array!28588 (store (arr!13734 _values!549) i!563 (ValueCellFull!5853 v!412)) (size!14086 _values!549)))))

(declare-fun lt!208548 () ListLongMap!7145)

(assert (=> b!460496 (= lt!208548 (getCurrentListMapNoExtraKeys!1768 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460497 () Bool)

(declare-fun res!275336 () Bool)

(assert (=> b!460497 (=> (not res!275336) (not e!268657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460497 (= res!275336 (validKeyInArray!0 k0!794))))

(declare-fun b!460498 () Bool)

(declare-fun res!275328 () Bool)

(assert (=> b!460498 (=> (not res!275328) (not e!268657))))

(assert (=> b!460498 (= res!275328 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14085 _keys!709))))))

(declare-fun mapNonEmpty!20239 () Bool)

(declare-fun tp!39001 () Bool)

(declare-fun e!268656 () Bool)

(assert (=> mapNonEmpty!20239 (= mapRes!20239 (and tp!39001 e!268656))))

(declare-fun mapRest!20239 () (Array (_ BitVec 32) ValueCell!5853))

(declare-fun mapValue!20239 () ValueCell!5853)

(declare-fun mapKey!20239 () (_ BitVec 32))

(assert (=> mapNonEmpty!20239 (= (arr!13734 _values!549) (store mapRest!20239 mapKey!20239 mapValue!20239))))

(declare-fun b!460499 () Bool)

(declare-fun e!268653 () Bool)

(assert (=> b!460499 (= e!268653 true)))

(declare-fun lt!208552 () ListLongMap!7145)

(declare-fun lt!208545 () tuple2!8232)

(declare-fun lt!208543 () ListLongMap!7145)

(declare-fun lt!208546 () tuple2!8232)

(declare-fun +!1624 (ListLongMap!7145 tuple2!8232) ListLongMap!7145)

(assert (=> b!460499 (= lt!208543 (+!1624 (+!1624 lt!208552 lt!208546) lt!208545))))

(declare-datatypes ((Unit!13404 0))(
  ( (Unit!13405) )
))
(declare-fun lt!208547 () Unit!13404)

(declare-fun lt!208551 () V!17629)

(declare-fun addCommutativeForDiffKeys!432 (ListLongMap!7145 (_ BitVec 64) V!17629 (_ BitVec 64) V!17629) Unit!13404)

(assert (=> b!460499 (= lt!208547 (addCommutativeForDiffKeys!432 lt!208552 k0!794 v!412 (select (arr!13733 _keys!709) from!863) lt!208551))))

(declare-fun b!460500 () Bool)

(declare-fun e!268659 () Bool)

(assert (=> b!460500 (= e!268651 (not e!268659))))

(declare-fun res!275330 () Bool)

(assert (=> b!460500 (=> res!275330 e!268659)))

(assert (=> b!460500 (= res!275330 (not (validKeyInArray!0 (select (arr!13733 _keys!709) from!863))))))

(declare-fun lt!208542 () ListLongMap!7145)

(declare-fun lt!208555 () ListLongMap!7145)

(assert (=> b!460500 (= lt!208542 lt!208555)))

(assert (=> b!460500 (= lt!208555 (+!1624 lt!208552 lt!208545))))

(assert (=> b!460500 (= lt!208542 (getCurrentListMapNoExtraKeys!1768 lt!208556 lt!208549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!460500 (= lt!208545 (tuple2!8233 k0!794 v!412))))

(assert (=> b!460500 (= lt!208552 (getCurrentListMapNoExtraKeys!1768 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208544 () Unit!13404)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!780 (array!28585 array!28587 (_ BitVec 32) (_ BitVec 32) V!17629 V!17629 (_ BitVec 32) (_ BitVec 64) V!17629 (_ BitVec 32) Int) Unit!13404)

(assert (=> b!460500 (= lt!208544 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!780 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460501 () Bool)

(declare-fun res!275332 () Bool)

(assert (=> b!460501 (=> (not res!275332) (not e!268657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460501 (= res!275332 (validMask!0 mask!1025))))

(declare-fun b!460502 () Bool)

(declare-fun res!275339 () Bool)

(assert (=> b!460502 (=> (not res!275339) (not e!268650))))

(assert (=> b!460502 (= res!275339 (bvsle from!863 i!563))))

(declare-fun b!460503 () Bool)

(declare-fun e!268655 () Unit!13404)

(declare-fun Unit!13406 () Unit!13404)

(assert (=> b!460503 (= e!268655 Unit!13406)))

(declare-fun b!460504 () Bool)

(declare-fun res!275331 () Bool)

(assert (=> b!460504 (=> (not res!275331) (not e!268657))))

(assert (=> b!460504 (= res!275331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460505 () Bool)

(assert (=> b!460505 (= e!268659 e!268653)))

(declare-fun res!275337 () Bool)

(assert (=> b!460505 (=> res!275337 e!268653)))

(assert (=> b!460505 (= res!275337 (= k0!794 (select (arr!13733 _keys!709) from!863)))))

(assert (=> b!460505 (not (= (select (arr!13733 _keys!709) from!863) k0!794))))

(declare-fun lt!208550 () Unit!13404)

(assert (=> b!460505 (= lt!208550 e!268655)))

(declare-fun c!56531 () Bool)

(assert (=> b!460505 (= c!56531 (= (select (arr!13733 _keys!709) from!863) k0!794))))

(assert (=> b!460505 (= lt!208553 lt!208543)))

(assert (=> b!460505 (= lt!208543 (+!1624 lt!208555 lt!208546))))

(assert (=> b!460505 (= lt!208546 (tuple2!8233 (select (arr!13733 _keys!709) from!863) lt!208551))))

(declare-fun get!6780 (ValueCell!5853 V!17629) V!17629)

(declare-fun dynLambda!908 (Int (_ BitVec 64)) V!17629)

(assert (=> b!460505 (= lt!208551 (get!6780 (select (arr!13734 _values!549) from!863) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460506 () Bool)

(declare-fun Unit!13407 () Unit!13404)

(assert (=> b!460506 (= e!268655 Unit!13407)))

(declare-fun lt!208554 () Unit!13404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28585 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13404)

(assert (=> b!460506 (= lt!208554 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460506 false))

(declare-fun b!460507 () Bool)

(declare-fun res!275338 () Bool)

(assert (=> b!460507 (=> (not res!275338) (not e!268650))))

(declare-datatypes ((List!8304 0))(
  ( (Nil!8301) (Cons!8300 (h!9156 (_ BitVec 64)) (t!14238 List!8304)) )
))
(declare-fun arrayNoDuplicates!0 (array!28585 (_ BitVec 32) List!8304) Bool)

(assert (=> b!460507 (= res!275338 (arrayNoDuplicates!0 lt!208556 #b00000000000000000000000000000000 Nil!8301))))

(declare-fun res!275335 () Bool)

(assert (=> start!41186 (=> (not res!275335) (not e!268657))))

(assert (=> start!41186 (= res!275335 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14085 _keys!709))))))

(assert (=> start!41186 e!268657))

(declare-fun tp_is_empty!12393 () Bool)

(assert (=> start!41186 tp_is_empty!12393))

(assert (=> start!41186 tp!39000))

(assert (=> start!41186 true))

(declare-fun e!268658 () Bool)

(declare-fun array_inv!9932 (array!28587) Bool)

(assert (=> start!41186 (and (array_inv!9932 _values!549) e!268658)))

(declare-fun array_inv!9933 (array!28585) Bool)

(assert (=> start!41186 (array_inv!9933 _keys!709)))

(declare-fun b!460508 () Bool)

(declare-fun res!275340 () Bool)

(assert (=> b!460508 (=> (not res!275340) (not e!268657))))

(assert (=> b!460508 (= res!275340 (or (= (select (arr!13733 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13733 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460509 () Bool)

(declare-fun e!268652 () Bool)

(assert (=> b!460509 (= e!268652 tp_is_empty!12393)))

(declare-fun b!460510 () Bool)

(declare-fun res!275329 () Bool)

(assert (=> b!460510 (=> (not res!275329) (not e!268657))))

(assert (=> b!460510 (= res!275329 (and (= (size!14086 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14085 _keys!709) (size!14086 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460511 () Bool)

(declare-fun res!275334 () Bool)

(assert (=> b!460511 (=> (not res!275334) (not e!268657))))

(declare-fun arrayContainsKey!0 (array!28585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460511 (= res!275334 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460512 () Bool)

(assert (=> b!460512 (= e!268656 tp_is_empty!12393)))

(declare-fun b!460513 () Bool)

(declare-fun res!275333 () Bool)

(assert (=> b!460513 (=> (not res!275333) (not e!268657))))

(assert (=> b!460513 (= res!275333 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8301))))

(declare-fun b!460514 () Bool)

(assert (=> b!460514 (= e!268658 (and e!268652 mapRes!20239))))

(declare-fun condMapEmpty!20239 () Bool)

(declare-fun mapDefault!20239 () ValueCell!5853)

(assert (=> b!460514 (= condMapEmpty!20239 (= (arr!13734 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5853)) mapDefault!20239)))))

(assert (= (and start!41186 res!275335) b!460501))

(assert (= (and b!460501 res!275332) b!460510))

(assert (= (and b!460510 res!275329) b!460504))

(assert (= (and b!460504 res!275331) b!460513))

(assert (= (and b!460513 res!275333) b!460498))

(assert (= (and b!460498 res!275328) b!460497))

(assert (= (and b!460497 res!275336) b!460508))

(assert (= (and b!460508 res!275340) b!460511))

(assert (= (and b!460511 res!275334) b!460495))

(assert (= (and b!460495 res!275327) b!460507))

(assert (= (and b!460507 res!275338) b!460502))

(assert (= (and b!460502 res!275339) b!460496))

(assert (= (and b!460496 res!275341) b!460500))

(assert (= (and b!460500 (not res!275330)) b!460505))

(assert (= (and b!460505 c!56531) b!460506))

(assert (= (and b!460505 (not c!56531)) b!460503))

(assert (= (and b!460505 (not res!275337)) b!460499))

(assert (= (and b!460514 condMapEmpty!20239) mapIsEmpty!20239))

(assert (= (and b!460514 (not condMapEmpty!20239)) mapNonEmpty!20239))

(get-info :version)

(assert (= (and mapNonEmpty!20239 ((_ is ValueCellFull!5853) mapValue!20239)) b!460512))

(assert (= (and b!460514 ((_ is ValueCellFull!5853) mapDefault!20239)) b!460509))

(assert (= start!41186 b!460514))

(declare-fun b_lambda!9889 () Bool)

(assert (=> (not b_lambda!9889) (not b!460505)))

(declare-fun t!14236 () Bool)

(declare-fun tb!3891 () Bool)

(assert (=> (and start!41186 (= defaultEntry!557 defaultEntry!557) t!14236) tb!3891))

(declare-fun result!7327 () Bool)

(assert (=> tb!3891 (= result!7327 tp_is_empty!12393)))

(assert (=> b!460505 t!14236))

(declare-fun b_and!19351 () Bool)

(assert (= b_and!19349 (and (=> t!14236 result!7327) b_and!19351)))

(declare-fun m!443683 () Bool)

(assert (=> b!460511 m!443683))

(declare-fun m!443685 () Bool)

(assert (=> b!460508 m!443685))

(declare-fun m!443687 () Bool)

(assert (=> b!460495 m!443687))

(declare-fun m!443689 () Bool)

(assert (=> b!460495 m!443689))

(declare-fun m!443691 () Bool)

(assert (=> b!460499 m!443691))

(assert (=> b!460499 m!443691))

(declare-fun m!443693 () Bool)

(assert (=> b!460499 m!443693))

(declare-fun m!443695 () Bool)

(assert (=> b!460499 m!443695))

(assert (=> b!460499 m!443695))

(declare-fun m!443697 () Bool)

(assert (=> b!460499 m!443697))

(declare-fun m!443699 () Bool)

(assert (=> mapNonEmpty!20239 m!443699))

(declare-fun m!443701 () Bool)

(assert (=> b!460506 m!443701))

(declare-fun m!443703 () Bool)

(assert (=> b!460513 m!443703))

(declare-fun m!443705 () Bool)

(assert (=> b!460496 m!443705))

(declare-fun m!443707 () Bool)

(assert (=> b!460496 m!443707))

(declare-fun m!443709 () Bool)

(assert (=> b!460496 m!443709))

(assert (=> b!460505 m!443695))

(declare-fun m!443711 () Bool)

(assert (=> b!460505 m!443711))

(declare-fun m!443713 () Bool)

(assert (=> b!460505 m!443713))

(declare-fun m!443715 () Bool)

(assert (=> b!460505 m!443715))

(assert (=> b!460505 m!443715))

(assert (=> b!460505 m!443713))

(declare-fun m!443717 () Bool)

(assert (=> b!460505 m!443717))

(declare-fun m!443719 () Bool)

(assert (=> b!460501 m!443719))

(declare-fun m!443721 () Bool)

(assert (=> b!460497 m!443721))

(declare-fun m!443723 () Bool)

(assert (=> start!41186 m!443723))

(declare-fun m!443725 () Bool)

(assert (=> start!41186 m!443725))

(assert (=> b!460500 m!443695))

(declare-fun m!443727 () Bool)

(assert (=> b!460500 m!443727))

(declare-fun m!443729 () Bool)

(assert (=> b!460500 m!443729))

(declare-fun m!443731 () Bool)

(assert (=> b!460500 m!443731))

(assert (=> b!460500 m!443695))

(declare-fun m!443733 () Bool)

(assert (=> b!460500 m!443733))

(declare-fun m!443735 () Bool)

(assert (=> b!460500 m!443735))

(declare-fun m!443737 () Bool)

(assert (=> b!460507 m!443737))

(declare-fun m!443739 () Bool)

(assert (=> b!460504 m!443739))

(check-sat tp_is_empty!12393 (not b!460511) (not b!460501) (not b!460504) (not b!460500) (not b_lambda!9889) (not b!460497) (not b!460507) (not b!460496) (not mapNonEmpty!20239) (not b_next!11055) (not b!460513) b_and!19351 (not b!460505) (not b!460506) (not start!41186) (not b!460495) (not b!460499))
(check-sat b_and!19351 (not b_next!11055))
