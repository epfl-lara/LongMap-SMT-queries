; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39870 () Bool)

(assert start!39870)

(declare-fun b_free!10137 () Bool)

(declare-fun b_next!10137 () Bool)

(assert (=> start!39870 (= b_free!10137 (not b_next!10137))))

(declare-fun tp!35939 () Bool)

(declare-fun b_and!17933 () Bool)

(assert (=> start!39870 (= tp!35939 b_and!17933)))

(declare-fun b!431448 () Bool)

(declare-fun res!253653 () Bool)

(declare-fun e!255317 () Bool)

(assert (=> b!431448 (=> (not res!253653) (not e!255317))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431448 (= res!253653 (bvsle from!863 i!563))))

(declare-fun b!431449 () Bool)

(declare-fun res!253657 () Bool)

(declare-fun e!255312 () Bool)

(assert (=> b!431449 (=> (not res!253657) (not e!255312))))

(declare-datatypes ((array!26413 0))(
  ( (array!26414 (arr!12656 (Array (_ BitVec 32) (_ BitVec 64))) (size!13008 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26413)

(assert (=> b!431449 (= res!253657 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13008 _keys!709))))))

(declare-fun b!431450 () Bool)

(declare-fun res!253651 () Bool)

(assert (=> b!431450 (=> (not res!253651) (not e!255312))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16157 0))(
  ( (V!16158 (val!5689 Int)) )
))
(declare-datatypes ((ValueCell!5301 0))(
  ( (ValueCellFull!5301 (v!7936 V!16157)) (EmptyCell!5301) )
))
(declare-datatypes ((array!26415 0))(
  ( (array!26416 (arr!12657 (Array (_ BitVec 32) ValueCell!5301)) (size!13009 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26415)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!431450 (= res!253651 (and (= (size!13009 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13008 _keys!709) (size!13009 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431451 () Bool)

(declare-fun e!255316 () Bool)

(declare-fun e!255320 () Bool)

(assert (=> b!431451 (= e!255316 (not e!255320))))

(declare-fun res!253654 () Bool)

(assert (=> b!431451 (=> res!253654 e!255320)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431451 (= res!253654 (not (validKeyInArray!0 (select (arr!12656 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7502 0))(
  ( (tuple2!7503 (_1!3762 (_ BitVec 64)) (_2!3762 V!16157)) )
))
(declare-datatypes ((List!7517 0))(
  ( (Nil!7514) (Cons!7513 (h!8369 tuple2!7502) (t!13103 List!7517)) )
))
(declare-datatypes ((ListLongMap!6415 0))(
  ( (ListLongMap!6416 (toList!3223 List!7517)) )
))
(declare-fun lt!197598 () ListLongMap!6415)

(declare-fun lt!197595 () ListLongMap!6415)

(assert (=> b!431451 (= lt!197598 lt!197595)))

(declare-fun lt!197597 () ListLongMap!6415)

(declare-fun lt!197594 () tuple2!7502)

(declare-fun +!1371 (ListLongMap!6415 tuple2!7502) ListLongMap!6415)

(assert (=> b!431451 (= lt!197595 (+!1371 lt!197597 lt!197594))))

(declare-fun lt!197596 () array!26413)

(declare-fun minValue!515 () V!16157)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16157)

(declare-fun lt!197586 () array!26415)

(declare-fun getCurrentListMapNoExtraKeys!1421 (array!26413 array!26415 (_ BitVec 32) (_ BitVec 32) V!16157 V!16157 (_ BitVec 32) Int) ListLongMap!6415)

(assert (=> b!431451 (= lt!197598 (getCurrentListMapNoExtraKeys!1421 lt!197596 lt!197586 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16157)

(assert (=> b!431451 (= lt!197594 (tuple2!7503 k0!794 v!412))))

(assert (=> b!431451 (= lt!197597 (getCurrentListMapNoExtraKeys!1421 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12717 0))(
  ( (Unit!12718) )
))
(declare-fun lt!197588 () Unit!12717)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!556 (array!26413 array!26415 (_ BitVec 32) (_ BitVec 32) V!16157 V!16157 (_ BitVec 32) (_ BitVec 64) V!16157 (_ BitVec 32) Int) Unit!12717)

(assert (=> b!431451 (= lt!197588 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!556 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431452 () Bool)

(declare-fun e!255315 () Unit!12717)

(declare-fun Unit!12719 () Unit!12717)

(assert (=> b!431452 (= e!255315 Unit!12719)))

(declare-fun lt!197599 () Unit!12717)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12717)

(assert (=> b!431452 (= lt!197599 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431452 false))

(declare-fun b!431453 () Bool)

(declare-fun res!253652 () Bool)

(assert (=> b!431453 (=> (not res!253652) (not e!255312))))

(declare-fun arrayContainsKey!0 (array!26413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431453 (= res!253652 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18555 () Bool)

(declare-fun mapRes!18555 () Bool)

(declare-fun tp!35940 () Bool)

(declare-fun e!255319 () Bool)

(assert (=> mapNonEmpty!18555 (= mapRes!18555 (and tp!35940 e!255319))))

(declare-fun mapRest!18555 () (Array (_ BitVec 32) ValueCell!5301))

(declare-fun mapValue!18555 () ValueCell!5301)

(declare-fun mapKey!18555 () (_ BitVec 32))

(assert (=> mapNonEmpty!18555 (= (arr!12657 _values!549) (store mapRest!18555 mapKey!18555 mapValue!18555))))

(declare-fun b!431454 () Bool)

(declare-fun res!253656 () Bool)

(assert (=> b!431454 (=> (not res!253656) (not e!255312))))

(declare-datatypes ((List!7518 0))(
  ( (Nil!7515) (Cons!7514 (h!8370 (_ BitVec 64)) (t!13104 List!7518)) )
))
(declare-fun arrayNoDuplicates!0 (array!26413 (_ BitVec 32) List!7518) Bool)

(assert (=> b!431454 (= res!253656 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7515))))

(declare-fun mapIsEmpty!18555 () Bool)

(assert (=> mapIsEmpty!18555 mapRes!18555))

(declare-fun res!253664 () Bool)

(assert (=> start!39870 (=> (not res!253664) (not e!255312))))

(assert (=> start!39870 (= res!253664 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13008 _keys!709))))))

(assert (=> start!39870 e!255312))

(declare-fun tp_is_empty!11289 () Bool)

(assert (=> start!39870 tp_is_empty!11289))

(assert (=> start!39870 tp!35939))

(assert (=> start!39870 true))

(declare-fun e!255321 () Bool)

(declare-fun array_inv!9210 (array!26415) Bool)

(assert (=> start!39870 (and (array_inv!9210 _values!549) e!255321)))

(declare-fun array_inv!9211 (array!26413) Bool)

(assert (=> start!39870 (array_inv!9211 _keys!709)))

(declare-fun b!431455 () Bool)

(declare-fun res!253663 () Bool)

(assert (=> b!431455 (=> (not res!253663) (not e!255312))))

(assert (=> b!431455 (= res!253663 (validKeyInArray!0 k0!794))))

(declare-fun b!431456 () Bool)

(declare-fun e!255318 () Bool)

(assert (=> b!431456 (= e!255318 true)))

(declare-fun lt!197591 () ListLongMap!6415)

(declare-fun lt!197589 () tuple2!7502)

(assert (=> b!431456 (= lt!197591 (+!1371 (+!1371 lt!197597 lt!197589) lt!197594))))

(declare-fun lt!197600 () Unit!12717)

(declare-fun lt!197587 () V!16157)

(declare-fun addCommutativeForDiffKeys!364 (ListLongMap!6415 (_ BitVec 64) V!16157 (_ BitVec 64) V!16157) Unit!12717)

(assert (=> b!431456 (= lt!197600 (addCommutativeForDiffKeys!364 lt!197597 k0!794 v!412 (select (arr!12656 _keys!709) from!863) lt!197587))))

(declare-fun b!431457 () Bool)

(declare-fun e!255313 () Bool)

(assert (=> b!431457 (= e!255313 tp_is_empty!11289)))

(declare-fun b!431458 () Bool)

(assert (=> b!431458 (= e!255312 e!255317)))

(declare-fun res!253665 () Bool)

(assert (=> b!431458 (=> (not res!253665) (not e!255317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26413 (_ BitVec 32)) Bool)

(assert (=> b!431458 (= res!253665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197596 mask!1025))))

(assert (=> b!431458 (= lt!197596 (array!26414 (store (arr!12656 _keys!709) i!563 k0!794) (size!13008 _keys!709)))))

(declare-fun b!431459 () Bool)

(assert (=> b!431459 (= e!255320 e!255318)))

(declare-fun res!253655 () Bool)

(assert (=> b!431459 (=> res!253655 e!255318)))

(assert (=> b!431459 (= res!253655 (= k0!794 (select (arr!12656 _keys!709) from!863)))))

(assert (=> b!431459 (not (= (select (arr!12656 _keys!709) from!863) k0!794))))

(declare-fun lt!197592 () Unit!12717)

(assert (=> b!431459 (= lt!197592 e!255315)))

(declare-fun c!55541 () Bool)

(assert (=> b!431459 (= c!55541 (= (select (arr!12656 _keys!709) from!863) k0!794))))

(declare-fun lt!197590 () ListLongMap!6415)

(assert (=> b!431459 (= lt!197590 lt!197591)))

(assert (=> b!431459 (= lt!197591 (+!1371 lt!197595 lt!197589))))

(assert (=> b!431459 (= lt!197589 (tuple2!7503 (select (arr!12656 _keys!709) from!863) lt!197587))))

(declare-fun get!6285 (ValueCell!5301 V!16157) V!16157)

(declare-fun dynLambda!792 (Int (_ BitVec 64)) V!16157)

(assert (=> b!431459 (= lt!197587 (get!6285 (select (arr!12657 _values!549) from!863) (dynLambda!792 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431460 () Bool)

(declare-fun Unit!12720 () Unit!12717)

(assert (=> b!431460 (= e!255315 Unit!12720)))

(declare-fun b!431461 () Bool)

(assert (=> b!431461 (= e!255321 (and e!255313 mapRes!18555))))

(declare-fun condMapEmpty!18555 () Bool)

(declare-fun mapDefault!18555 () ValueCell!5301)

(assert (=> b!431461 (= condMapEmpty!18555 (= (arr!12657 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5301)) mapDefault!18555)))))

(declare-fun b!431462 () Bool)

(declare-fun res!253662 () Bool)

(assert (=> b!431462 (=> (not res!253662) (not e!255317))))

(assert (=> b!431462 (= res!253662 (arrayNoDuplicates!0 lt!197596 #b00000000000000000000000000000000 Nil!7515))))

(declare-fun b!431463 () Bool)

(declare-fun res!253661 () Bool)

(assert (=> b!431463 (=> (not res!253661) (not e!255312))))

(assert (=> b!431463 (= res!253661 (or (= (select (arr!12656 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12656 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431464 () Bool)

(declare-fun res!253658 () Bool)

(assert (=> b!431464 (=> (not res!253658) (not e!255312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431464 (= res!253658 (validMask!0 mask!1025))))

(declare-fun b!431465 () Bool)

(assert (=> b!431465 (= e!255319 tp_is_empty!11289)))

(declare-fun b!431466 () Bool)

(assert (=> b!431466 (= e!255317 e!255316)))

(declare-fun res!253659 () Bool)

(assert (=> b!431466 (=> (not res!253659) (not e!255316))))

(assert (=> b!431466 (= res!253659 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!431466 (= lt!197590 (getCurrentListMapNoExtraKeys!1421 lt!197596 lt!197586 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431466 (= lt!197586 (array!26416 (store (arr!12657 _values!549) i!563 (ValueCellFull!5301 v!412)) (size!13009 _values!549)))))

(declare-fun lt!197593 () ListLongMap!6415)

(assert (=> b!431466 (= lt!197593 (getCurrentListMapNoExtraKeys!1421 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431467 () Bool)

(declare-fun res!253660 () Bool)

(assert (=> b!431467 (=> (not res!253660) (not e!255312))))

(assert (=> b!431467 (= res!253660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39870 res!253664) b!431464))

(assert (= (and b!431464 res!253658) b!431450))

(assert (= (and b!431450 res!253651) b!431467))

(assert (= (and b!431467 res!253660) b!431454))

(assert (= (and b!431454 res!253656) b!431449))

(assert (= (and b!431449 res!253657) b!431455))

(assert (= (and b!431455 res!253663) b!431463))

(assert (= (and b!431463 res!253661) b!431453))

(assert (= (and b!431453 res!253652) b!431458))

(assert (= (and b!431458 res!253665) b!431462))

(assert (= (and b!431462 res!253662) b!431448))

(assert (= (and b!431448 res!253653) b!431466))

(assert (= (and b!431466 res!253659) b!431451))

(assert (= (and b!431451 (not res!253654)) b!431459))

(assert (= (and b!431459 c!55541) b!431452))

(assert (= (and b!431459 (not c!55541)) b!431460))

(assert (= (and b!431459 (not res!253655)) b!431456))

(assert (= (and b!431461 condMapEmpty!18555) mapIsEmpty!18555))

(assert (= (and b!431461 (not condMapEmpty!18555)) mapNonEmpty!18555))

(get-info :version)

(assert (= (and mapNonEmpty!18555 ((_ is ValueCellFull!5301) mapValue!18555)) b!431465))

(assert (= (and b!431461 ((_ is ValueCellFull!5301) mapDefault!18555)) b!431457))

(assert (= start!39870 b!431461))

(declare-fun b_lambda!9225 () Bool)

(assert (=> (not b_lambda!9225) (not b!431459)))

(declare-fun t!13102 () Bool)

(declare-fun tb!3543 () Bool)

(assert (=> (and start!39870 (= defaultEntry!557 defaultEntry!557) t!13102) tb!3543))

(declare-fun result!6613 () Bool)

(assert (=> tb!3543 (= result!6613 tp_is_empty!11289)))

(assert (=> b!431459 t!13102))

(declare-fun b_and!17935 () Bool)

(assert (= b_and!17933 (and (=> t!13102 result!6613) b_and!17935)))

(declare-fun m!419593 () Bool)

(assert (=> b!431459 m!419593))

(declare-fun m!419595 () Bool)

(assert (=> b!431459 m!419595))

(assert (=> b!431459 m!419595))

(declare-fun m!419597 () Bool)

(assert (=> b!431459 m!419597))

(declare-fun m!419599 () Bool)

(assert (=> b!431459 m!419599))

(declare-fun m!419601 () Bool)

(assert (=> b!431459 m!419601))

(assert (=> b!431459 m!419597))

(declare-fun m!419603 () Bool)

(assert (=> b!431464 m!419603))

(declare-fun m!419605 () Bool)

(assert (=> b!431452 m!419605))

(declare-fun m!419607 () Bool)

(assert (=> b!431467 m!419607))

(declare-fun m!419609 () Bool)

(assert (=> b!431455 m!419609))

(declare-fun m!419611 () Bool)

(assert (=> b!431463 m!419611))

(declare-fun m!419613 () Bool)

(assert (=> b!431454 m!419613))

(assert (=> b!431451 m!419593))

(declare-fun m!419615 () Bool)

(assert (=> b!431451 m!419615))

(declare-fun m!419617 () Bool)

(assert (=> b!431451 m!419617))

(declare-fun m!419619 () Bool)

(assert (=> b!431451 m!419619))

(assert (=> b!431451 m!419593))

(declare-fun m!419621 () Bool)

(assert (=> b!431451 m!419621))

(declare-fun m!419623 () Bool)

(assert (=> b!431451 m!419623))

(declare-fun m!419625 () Bool)

(assert (=> mapNonEmpty!18555 m!419625))

(declare-fun m!419627 () Bool)

(assert (=> b!431466 m!419627))

(declare-fun m!419629 () Bool)

(assert (=> b!431466 m!419629))

(declare-fun m!419631 () Bool)

(assert (=> b!431466 m!419631))

(declare-fun m!419633 () Bool)

(assert (=> b!431453 m!419633))

(declare-fun m!419635 () Bool)

(assert (=> b!431458 m!419635))

(declare-fun m!419637 () Bool)

(assert (=> b!431458 m!419637))

(declare-fun m!419639 () Bool)

(assert (=> b!431462 m!419639))

(declare-fun m!419641 () Bool)

(assert (=> start!39870 m!419641))

(declare-fun m!419643 () Bool)

(assert (=> start!39870 m!419643))

(declare-fun m!419645 () Bool)

(assert (=> b!431456 m!419645))

(assert (=> b!431456 m!419645))

(declare-fun m!419647 () Bool)

(assert (=> b!431456 m!419647))

(assert (=> b!431456 m!419593))

(assert (=> b!431456 m!419593))

(declare-fun m!419649 () Bool)

(assert (=> b!431456 m!419649))

(check-sat (not b!431456) (not b!431452) (not b!431451) (not b!431467) (not b_lambda!9225) (not start!39870) (not b!431458) (not b!431453) (not b!431454) (not mapNonEmpty!18555) b_and!17935 (not b!431455) (not b!431462) (not b!431464) (not b_next!10137) tp_is_empty!11289 (not b!431466) (not b!431459))
(check-sat b_and!17935 (not b_next!10137))
