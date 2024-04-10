; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39828 () Bool)

(assert start!39828)

(declare-fun b_free!10095 () Bool)

(declare-fun b_next!10095 () Bool)

(assert (=> start!39828 (= b_free!10095 (not b_next!10095))))

(declare-fun tp!35813 () Bool)

(declare-fun b_and!17849 () Bool)

(assert (=> start!39828 (= tp!35813 b_and!17849)))

(declare-fun b!430146 () Bool)

(declare-fun res!252716 () Bool)

(declare-fun e!254687 () Bool)

(assert (=> b!430146 (=> (not res!252716) (not e!254687))))

(declare-datatypes ((array!26329 0))(
  ( (array!26330 (arr!12614 (Array (_ BitVec 32) (_ BitVec 64))) (size!12966 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26329)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430146 (= res!252716 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430147 () Bool)

(declare-fun e!254683 () Bool)

(declare-fun tp_is_empty!11247 () Bool)

(assert (=> b!430147 (= e!254683 tp_is_empty!11247)))

(declare-fun b!430148 () Bool)

(declare-fun res!252717 () Bool)

(assert (=> b!430148 (=> (not res!252717) (not e!254687))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430148 (= res!252717 (or (= (select (arr!12614 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12614 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430149 () Bool)

(declare-fun e!254688 () Bool)

(assert (=> b!430149 (= e!254688 true)))

(declare-datatypes ((V!16101 0))(
  ( (V!16102 (val!5668 Int)) )
))
(declare-datatypes ((tuple2!7464 0))(
  ( (tuple2!7465 (_1!3743 (_ BitVec 64)) (_2!3743 V!16101)) )
))
(declare-fun lt!196641 () tuple2!7464)

(declare-datatypes ((List!7482 0))(
  ( (Nil!7479) (Cons!7478 (h!8334 tuple2!7464) (t!13026 List!7482)) )
))
(declare-datatypes ((ListLongMap!6377 0))(
  ( (ListLongMap!6378 (toList!3204 List!7482)) )
))
(declare-fun lt!196649 () ListLongMap!6377)

(declare-fun lt!196654 () ListLongMap!6377)

(declare-fun lt!196645 () tuple2!7464)

(declare-fun +!1353 (ListLongMap!6377 tuple2!7464) ListLongMap!6377)

(assert (=> b!430149 (= lt!196649 (+!1353 (+!1353 lt!196654 lt!196641) lt!196645))))

(declare-datatypes ((Unit!12651 0))(
  ( (Unit!12652) )
))
(declare-fun lt!196652 () Unit!12651)

(declare-fun lt!196653 () V!16101)

(declare-fun v!412 () V!16101)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!349 (ListLongMap!6377 (_ BitVec 64) V!16101 (_ BitVec 64) V!16101) Unit!12651)

(assert (=> b!430149 (= lt!196652 (addCommutativeForDiffKeys!349 lt!196654 k0!794 v!412 (select (arr!12614 _keys!709) from!863) lt!196653))))

(declare-fun b!430150 () Bool)

(declare-fun res!252718 () Bool)

(assert (=> b!430150 (=> (not res!252718) (not e!254687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430150 (= res!252718 (validKeyInArray!0 k0!794))))

(declare-fun b!430151 () Bool)

(declare-fun res!252713 () Bool)

(declare-fun e!254689 () Bool)

(assert (=> b!430151 (=> (not res!252713) (not e!254689))))

(declare-fun lt!196651 () array!26329)

(declare-datatypes ((List!7483 0))(
  ( (Nil!7480) (Cons!7479 (h!8335 (_ BitVec 64)) (t!13027 List!7483)) )
))
(declare-fun arrayNoDuplicates!0 (array!26329 (_ BitVec 32) List!7483) Bool)

(assert (=> b!430151 (= res!252713 (arrayNoDuplicates!0 lt!196651 #b00000000000000000000000000000000 Nil!7480))))

(declare-fun b!430152 () Bool)

(declare-fun res!252714 () Bool)

(assert (=> b!430152 (=> (not res!252714) (not e!254687))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26329 (_ BitVec 32)) Bool)

(assert (=> b!430152 (= res!252714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430153 () Bool)

(declare-fun e!254690 () Bool)

(assert (=> b!430153 (= e!254689 e!254690)))

(declare-fun res!252706 () Bool)

(assert (=> b!430153 (=> (not res!252706) (not e!254690))))

(assert (=> b!430153 (= res!252706 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16101)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5280 0))(
  ( (ValueCellFull!5280 (v!7915 V!16101)) (EmptyCell!5280) )
))
(declare-datatypes ((array!26331 0))(
  ( (array!26332 (arr!12615 (Array (_ BitVec 32) ValueCell!5280)) (size!12967 (_ BitVec 32))) )
))
(declare-fun lt!196644 () array!26331)

(declare-fun zeroValue!515 () V!16101)

(declare-fun lt!196642 () ListLongMap!6377)

(declare-fun getCurrentListMapNoExtraKeys!1406 (array!26329 array!26331 (_ BitVec 32) (_ BitVec 32) V!16101 V!16101 (_ BitVec 32) Int) ListLongMap!6377)

(assert (=> b!430153 (= lt!196642 (getCurrentListMapNoExtraKeys!1406 lt!196651 lt!196644 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26331)

(assert (=> b!430153 (= lt!196644 (array!26332 (store (arr!12615 _values!549) i!563 (ValueCellFull!5280 v!412)) (size!12967 _values!549)))))

(declare-fun lt!196648 () ListLongMap!6377)

(assert (=> b!430153 (= lt!196648 (getCurrentListMapNoExtraKeys!1406 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430154 () Bool)

(declare-fun e!254686 () Unit!12651)

(declare-fun Unit!12653 () Unit!12651)

(assert (=> b!430154 (= e!254686 Unit!12653)))

(declare-fun res!252709 () Bool)

(assert (=> start!39828 (=> (not res!252709) (not e!254687))))

(assert (=> start!39828 (= res!252709 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12966 _keys!709))))))

(assert (=> start!39828 e!254687))

(assert (=> start!39828 tp_is_empty!11247))

(assert (=> start!39828 tp!35813))

(assert (=> start!39828 true))

(declare-fun e!254691 () Bool)

(declare-fun array_inv!9186 (array!26331) Bool)

(assert (=> start!39828 (and (array_inv!9186 _values!549) e!254691)))

(declare-fun array_inv!9187 (array!26329) Bool)

(assert (=> start!39828 (array_inv!9187 _keys!709)))

(declare-fun b!430155 () Bool)

(declare-fun res!252719 () Bool)

(assert (=> b!430155 (=> (not res!252719) (not e!254687))))

(assert (=> b!430155 (= res!252719 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12966 _keys!709))))))

(declare-fun b!430156 () Bool)

(declare-fun e!254685 () Bool)

(assert (=> b!430156 (= e!254690 (not e!254685))))

(declare-fun res!252710 () Bool)

(assert (=> b!430156 (=> res!252710 e!254685)))

(assert (=> b!430156 (= res!252710 (not (validKeyInArray!0 (select (arr!12614 _keys!709) from!863))))))

(declare-fun lt!196655 () ListLongMap!6377)

(declare-fun lt!196646 () ListLongMap!6377)

(assert (=> b!430156 (= lt!196655 lt!196646)))

(assert (=> b!430156 (= lt!196646 (+!1353 lt!196654 lt!196645))))

(assert (=> b!430156 (= lt!196655 (getCurrentListMapNoExtraKeys!1406 lt!196651 lt!196644 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430156 (= lt!196645 (tuple2!7465 k0!794 v!412))))

(assert (=> b!430156 (= lt!196654 (getCurrentListMapNoExtraKeys!1406 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196643 () Unit!12651)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!542 (array!26329 array!26331 (_ BitVec 32) (_ BitVec 32) V!16101 V!16101 (_ BitVec 32) (_ BitVec 64) V!16101 (_ BitVec 32) Int) Unit!12651)

(assert (=> b!430156 (= lt!196643 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!542 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430157 () Bool)

(assert (=> b!430157 (= e!254687 e!254689)))

(declare-fun res!252707 () Bool)

(assert (=> b!430157 (=> (not res!252707) (not e!254689))))

(assert (=> b!430157 (= res!252707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196651 mask!1025))))

(assert (=> b!430157 (= lt!196651 (array!26330 (store (arr!12614 _keys!709) i!563 k0!794) (size!12966 _keys!709)))))

(declare-fun mapNonEmpty!18492 () Bool)

(declare-fun mapRes!18492 () Bool)

(declare-fun tp!35814 () Bool)

(assert (=> mapNonEmpty!18492 (= mapRes!18492 (and tp!35814 e!254683))))

(declare-fun mapValue!18492 () ValueCell!5280)

(declare-fun mapKey!18492 () (_ BitVec 32))

(declare-fun mapRest!18492 () (Array (_ BitVec 32) ValueCell!5280))

(assert (=> mapNonEmpty!18492 (= (arr!12615 _values!549) (store mapRest!18492 mapKey!18492 mapValue!18492))))

(declare-fun b!430158 () Bool)

(declare-fun res!252715 () Bool)

(assert (=> b!430158 (=> (not res!252715) (not e!254687))))

(assert (=> b!430158 (= res!252715 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7480))))

(declare-fun b!430159 () Bool)

(declare-fun e!254684 () Bool)

(assert (=> b!430159 (= e!254691 (and e!254684 mapRes!18492))))

(declare-fun condMapEmpty!18492 () Bool)

(declare-fun mapDefault!18492 () ValueCell!5280)

(assert (=> b!430159 (= condMapEmpty!18492 (= (arr!12615 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5280)) mapDefault!18492)))))

(declare-fun b!430160 () Bool)

(declare-fun res!252708 () Bool)

(assert (=> b!430160 (=> (not res!252708) (not e!254687))))

(assert (=> b!430160 (= res!252708 (and (= (size!12967 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12966 _keys!709) (size!12967 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430161 () Bool)

(assert (=> b!430161 (= e!254685 e!254688)))

(declare-fun res!252712 () Bool)

(assert (=> b!430161 (=> res!252712 e!254688)))

(assert (=> b!430161 (= res!252712 (= k0!794 (select (arr!12614 _keys!709) from!863)))))

(assert (=> b!430161 (not (= (select (arr!12614 _keys!709) from!863) k0!794))))

(declare-fun lt!196647 () Unit!12651)

(assert (=> b!430161 (= lt!196647 e!254686)))

(declare-fun c!55478 () Bool)

(assert (=> b!430161 (= c!55478 (= (select (arr!12614 _keys!709) from!863) k0!794))))

(assert (=> b!430161 (= lt!196642 lt!196649)))

(assert (=> b!430161 (= lt!196649 (+!1353 lt!196646 lt!196641))))

(assert (=> b!430161 (= lt!196641 (tuple2!7465 (select (arr!12614 _keys!709) from!863) lt!196653))))

(declare-fun get!6259 (ValueCell!5280 V!16101) V!16101)

(declare-fun dynLambda!780 (Int (_ BitVec 64)) V!16101)

(assert (=> b!430161 (= lt!196653 (get!6259 (select (arr!12615 _values!549) from!863) (dynLambda!780 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430162 () Bool)

(declare-fun res!252720 () Bool)

(assert (=> b!430162 (=> (not res!252720) (not e!254689))))

(assert (=> b!430162 (= res!252720 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18492 () Bool)

(assert (=> mapIsEmpty!18492 mapRes!18492))

(declare-fun b!430163 () Bool)

(declare-fun res!252711 () Bool)

(assert (=> b!430163 (=> (not res!252711) (not e!254687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430163 (= res!252711 (validMask!0 mask!1025))))

(declare-fun b!430164 () Bool)

(declare-fun Unit!12654 () Unit!12651)

(assert (=> b!430164 (= e!254686 Unit!12654)))

(declare-fun lt!196650 () Unit!12651)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26329 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12651)

(assert (=> b!430164 (= lt!196650 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430164 false))

(declare-fun b!430165 () Bool)

(assert (=> b!430165 (= e!254684 tp_is_empty!11247)))

(assert (= (and start!39828 res!252709) b!430163))

(assert (= (and b!430163 res!252711) b!430160))

(assert (= (and b!430160 res!252708) b!430152))

(assert (= (and b!430152 res!252714) b!430158))

(assert (= (and b!430158 res!252715) b!430155))

(assert (= (and b!430155 res!252719) b!430150))

(assert (= (and b!430150 res!252718) b!430148))

(assert (= (and b!430148 res!252717) b!430146))

(assert (= (and b!430146 res!252716) b!430157))

(assert (= (and b!430157 res!252707) b!430151))

(assert (= (and b!430151 res!252713) b!430162))

(assert (= (and b!430162 res!252720) b!430153))

(assert (= (and b!430153 res!252706) b!430156))

(assert (= (and b!430156 (not res!252710)) b!430161))

(assert (= (and b!430161 c!55478) b!430164))

(assert (= (and b!430161 (not c!55478)) b!430154))

(assert (= (and b!430161 (not res!252712)) b!430149))

(assert (= (and b!430159 condMapEmpty!18492) mapIsEmpty!18492))

(assert (= (and b!430159 (not condMapEmpty!18492)) mapNonEmpty!18492))

(get-info :version)

(assert (= (and mapNonEmpty!18492 ((_ is ValueCellFull!5280) mapValue!18492)) b!430147))

(assert (= (and b!430159 ((_ is ValueCellFull!5280) mapDefault!18492)) b!430165))

(assert (= start!39828 b!430159))

(declare-fun b_lambda!9183 () Bool)

(assert (=> (not b_lambda!9183) (not b!430161)))

(declare-fun t!13025 () Bool)

(declare-fun tb!3501 () Bool)

(assert (=> (and start!39828 (= defaultEntry!557 defaultEntry!557) t!13025) tb!3501))

(declare-fun result!6529 () Bool)

(assert (=> tb!3501 (= result!6529 tp_is_empty!11247)))

(assert (=> b!430161 t!13025))

(declare-fun b_and!17851 () Bool)

(assert (= b_and!17849 (and (=> t!13025 result!6529) b_and!17851)))

(declare-fun m!418375 () Bool)

(assert (=> b!430148 m!418375))

(declare-fun m!418377 () Bool)

(assert (=> b!430149 m!418377))

(assert (=> b!430149 m!418377))

(declare-fun m!418379 () Bool)

(assert (=> b!430149 m!418379))

(declare-fun m!418381 () Bool)

(assert (=> b!430149 m!418381))

(assert (=> b!430149 m!418381))

(declare-fun m!418383 () Bool)

(assert (=> b!430149 m!418383))

(declare-fun m!418385 () Bool)

(assert (=> b!430157 m!418385))

(declare-fun m!418387 () Bool)

(assert (=> b!430157 m!418387))

(declare-fun m!418389 () Bool)

(assert (=> b!430152 m!418389))

(assert (=> b!430161 m!418381))

(declare-fun m!418391 () Bool)

(assert (=> b!430161 m!418391))

(declare-fun m!418393 () Bool)

(assert (=> b!430161 m!418393))

(declare-fun m!418395 () Bool)

(assert (=> b!430161 m!418395))

(assert (=> b!430161 m!418395))

(assert (=> b!430161 m!418391))

(declare-fun m!418397 () Bool)

(assert (=> b!430161 m!418397))

(declare-fun m!418399 () Bool)

(assert (=> b!430164 m!418399))

(declare-fun m!418401 () Bool)

(assert (=> b!430158 m!418401))

(declare-fun m!418403 () Bool)

(assert (=> b!430153 m!418403))

(declare-fun m!418405 () Bool)

(assert (=> b!430153 m!418405))

(declare-fun m!418407 () Bool)

(assert (=> b!430153 m!418407))

(declare-fun m!418409 () Bool)

(assert (=> b!430146 m!418409))

(declare-fun m!418411 () Bool)

(assert (=> b!430156 m!418411))

(declare-fun m!418413 () Bool)

(assert (=> b!430156 m!418413))

(assert (=> b!430156 m!418381))

(declare-fun m!418415 () Bool)

(assert (=> b!430156 m!418415))

(declare-fun m!418417 () Bool)

(assert (=> b!430156 m!418417))

(assert (=> b!430156 m!418381))

(declare-fun m!418419 () Bool)

(assert (=> b!430156 m!418419))

(declare-fun m!418421 () Bool)

(assert (=> mapNonEmpty!18492 m!418421))

(declare-fun m!418423 () Bool)

(assert (=> start!39828 m!418423))

(declare-fun m!418425 () Bool)

(assert (=> start!39828 m!418425))

(declare-fun m!418427 () Bool)

(assert (=> b!430150 m!418427))

(declare-fun m!418429 () Bool)

(assert (=> b!430163 m!418429))

(declare-fun m!418431 () Bool)

(assert (=> b!430151 m!418431))

(check-sat (not b!430150) (not b!430158) (not b!430164) (not b_lambda!9183) (not b_next!10095) (not mapNonEmpty!18492) (not start!39828) (not b!430161) (not b!430151) b_and!17851 (not b!430149) (not b!430153) (not b!430156) tp_is_empty!11247 (not b!430157) (not b!430163) (not b!430146) (not b!430152))
(check-sat b_and!17851 (not b_next!10095))
