; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39966 () Bool)

(assert start!39966)

(declare-fun b_free!10233 () Bool)

(declare-fun b_next!10233 () Bool)

(assert (=> start!39966 (= b_free!10233 (not b_next!10233))))

(declare-fun tp!36228 () Bool)

(declare-fun b_and!18125 () Bool)

(assert (=> start!39966 (= tp!36228 b_and!18125)))

(declare-fun b!434424 () Bool)

(declare-fun e!256755 () Bool)

(declare-fun e!256752 () Bool)

(assert (=> b!434424 (= e!256755 (not e!256752))))

(declare-fun res!255814 () Bool)

(assert (=> b!434424 (=> res!255814 e!256752)))

(declare-datatypes ((array!26603 0))(
  ( (array!26604 (arr!12751 (Array (_ BitVec 32) (_ BitVec 64))) (size!13103 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26603)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434424 (= res!255814 (not (validKeyInArray!0 (select (arr!12751 _keys!709) from!863))))))

(declare-datatypes ((V!16285 0))(
  ( (V!16286 (val!5737 Int)) )
))
(declare-datatypes ((tuple2!7592 0))(
  ( (tuple2!7593 (_1!3807 (_ BitVec 64)) (_2!3807 V!16285)) )
))
(declare-datatypes ((List!7596 0))(
  ( (Nil!7593) (Cons!7592 (h!8448 tuple2!7592) (t!13278 List!7596)) )
))
(declare-datatypes ((ListLongMap!6505 0))(
  ( (ListLongMap!6506 (toList!3268 List!7596)) )
))
(declare-fun lt!199754 () ListLongMap!6505)

(declare-fun lt!199757 () ListLongMap!6505)

(assert (=> b!434424 (= lt!199754 lt!199757)))

(declare-fun lt!199750 () ListLongMap!6505)

(declare-fun lt!199752 () tuple2!7592)

(declare-fun +!1416 (ListLongMap!6505 tuple2!7592) ListLongMap!6505)

(assert (=> b!434424 (= lt!199757 (+!1416 lt!199750 lt!199752))))

(declare-fun minValue!515 () V!16285)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16285)

(declare-datatypes ((ValueCell!5349 0))(
  ( (ValueCellFull!5349 (v!7984 V!16285)) (EmptyCell!5349) )
))
(declare-datatypes ((array!26605 0))(
  ( (array!26606 (arr!12752 (Array (_ BitVec 32) ValueCell!5349)) (size!13104 (_ BitVec 32))) )
))
(declare-fun lt!199755 () array!26605)

(declare-fun lt!199760 () array!26603)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1461 (array!26603 array!26605 (_ BitVec 32) (_ BitVec 32) V!16285 V!16285 (_ BitVec 32) Int) ListLongMap!6505)

(assert (=> b!434424 (= lt!199754 (getCurrentListMapNoExtraKeys!1461 lt!199760 lt!199755 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16285)

(assert (=> b!434424 (= lt!199752 (tuple2!7593 k0!794 v!412))))

(declare-fun _values!549 () array!26605)

(assert (=> b!434424 (= lt!199750 (getCurrentListMapNoExtraKeys!1461 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12883 0))(
  ( (Unit!12884) )
))
(declare-fun lt!199747 () Unit!12883)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!592 (array!26603 array!26605 (_ BitVec 32) (_ BitVec 32) V!16285 V!16285 (_ BitVec 32) (_ BitVec 64) V!16285 (_ BitVec 32) Int) Unit!12883)

(assert (=> b!434424 (= lt!199747 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!592 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434425 () Bool)

(declare-fun e!256757 () Bool)

(declare-fun e!256756 () Bool)

(declare-fun mapRes!18699 () Bool)

(assert (=> b!434425 (= e!256757 (and e!256756 mapRes!18699))))

(declare-fun condMapEmpty!18699 () Bool)

(declare-fun mapDefault!18699 () ValueCell!5349)

(assert (=> b!434425 (= condMapEmpty!18699 (= (arr!12752 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5349)) mapDefault!18699)))))

(declare-fun b!434426 () Bool)

(declare-fun res!255815 () Bool)

(declare-fun e!256760 () Bool)

(assert (=> b!434426 (=> (not res!255815) (not e!256760))))

(declare-datatypes ((List!7597 0))(
  ( (Nil!7594) (Cons!7593 (h!8449 (_ BitVec 64)) (t!13279 List!7597)) )
))
(declare-fun arrayNoDuplicates!0 (array!26603 (_ BitVec 32) List!7597) Bool)

(assert (=> b!434426 (= res!255815 (arrayNoDuplicates!0 lt!199760 #b00000000000000000000000000000000 Nil!7594))))

(declare-fun b!434427 () Bool)

(declare-fun res!255817 () Bool)

(assert (=> b!434427 (=> (not res!255817) (not e!256760))))

(assert (=> b!434427 (= res!255817 (bvsle from!863 i!563))))

(declare-fun b!434428 () Bool)

(declare-fun res!255825 () Bool)

(declare-fun e!256754 () Bool)

(assert (=> b!434428 (=> (not res!255825) (not e!256754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26603 (_ BitVec 32)) Bool)

(assert (=> b!434428 (= res!255825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434429 () Bool)

(declare-fun res!255824 () Bool)

(assert (=> b!434429 (=> (not res!255824) (not e!256754))))

(declare-fun arrayContainsKey!0 (array!26603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434429 (= res!255824 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434430 () Bool)

(declare-fun res!255811 () Bool)

(assert (=> b!434430 (=> (not res!255811) (not e!256754))))

(assert (=> b!434430 (= res!255811 (and (= (size!13104 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13103 _keys!709) (size!13104 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!255818 () Bool)

(assert (=> start!39966 (=> (not res!255818) (not e!256754))))

(assert (=> start!39966 (= res!255818 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13103 _keys!709))))))

(assert (=> start!39966 e!256754))

(declare-fun tp_is_empty!11385 () Bool)

(assert (=> start!39966 tp_is_empty!11385))

(assert (=> start!39966 tp!36228))

(assert (=> start!39966 true))

(declare-fun array_inv!9276 (array!26605) Bool)

(assert (=> start!39966 (and (array_inv!9276 _values!549) e!256757)))

(declare-fun array_inv!9277 (array!26603) Bool)

(assert (=> start!39966 (array_inv!9277 _keys!709)))

(declare-fun b!434431 () Bool)

(declare-fun e!256758 () Bool)

(assert (=> b!434431 (= e!256758 true)))

(declare-fun lt!199751 () ListLongMap!6505)

(declare-fun lt!199753 () tuple2!7592)

(assert (=> b!434431 (= lt!199751 (+!1416 (+!1416 lt!199750 lt!199753) lt!199752))))

(declare-fun lt!199759 () V!16285)

(declare-fun lt!199758 () Unit!12883)

(declare-fun addCommutativeForDiffKeys!401 (ListLongMap!6505 (_ BitVec 64) V!16285 (_ BitVec 64) V!16285) Unit!12883)

(assert (=> b!434431 (= lt!199758 (addCommutativeForDiffKeys!401 lt!199750 k0!794 v!412 (select (arr!12751 _keys!709) from!863) lt!199759))))

(declare-fun b!434432 () Bool)

(declare-fun res!255816 () Bool)

(assert (=> b!434432 (=> (not res!255816) (not e!256754))))

(assert (=> b!434432 (= res!255816 (validKeyInArray!0 k0!794))))

(declare-fun b!434433 () Bool)

(assert (=> b!434433 (= e!256760 e!256755)))

(declare-fun res!255823 () Bool)

(assert (=> b!434433 (=> (not res!255823) (not e!256755))))

(assert (=> b!434433 (= res!255823 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!199746 () ListLongMap!6505)

(assert (=> b!434433 (= lt!199746 (getCurrentListMapNoExtraKeys!1461 lt!199760 lt!199755 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434433 (= lt!199755 (array!26606 (store (arr!12752 _values!549) i!563 (ValueCellFull!5349 v!412)) (size!13104 _values!549)))))

(declare-fun lt!199749 () ListLongMap!6505)

(assert (=> b!434433 (= lt!199749 (getCurrentListMapNoExtraKeys!1461 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434434 () Bool)

(declare-fun e!256761 () Unit!12883)

(declare-fun Unit!12885 () Unit!12883)

(assert (=> b!434434 (= e!256761 Unit!12885)))

(declare-fun b!434435 () Bool)

(declare-fun res!255821 () Bool)

(assert (=> b!434435 (=> (not res!255821) (not e!256754))))

(assert (=> b!434435 (= res!255821 (or (= (select (arr!12751 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12751 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434436 () Bool)

(declare-fun Unit!12886 () Unit!12883)

(assert (=> b!434436 (= e!256761 Unit!12886)))

(declare-fun lt!199756 () Unit!12883)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26603 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12883)

(assert (=> b!434436 (= lt!199756 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434436 false))

(declare-fun b!434437 () Bool)

(assert (=> b!434437 (= e!256754 e!256760)))

(declare-fun res!255819 () Bool)

(assert (=> b!434437 (=> (not res!255819) (not e!256760))))

(assert (=> b!434437 (= res!255819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199760 mask!1025))))

(assert (=> b!434437 (= lt!199760 (array!26604 (store (arr!12751 _keys!709) i!563 k0!794) (size!13103 _keys!709)))))

(declare-fun b!434438 () Bool)

(assert (=> b!434438 (= e!256756 tp_is_empty!11385)))

(declare-fun b!434439 () Bool)

(declare-fun res!255812 () Bool)

(assert (=> b!434439 (=> (not res!255812) (not e!256754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434439 (= res!255812 (validMask!0 mask!1025))))

(declare-fun b!434440 () Bool)

(assert (=> b!434440 (= e!256752 e!256758)))

(declare-fun res!255813 () Bool)

(assert (=> b!434440 (=> res!255813 e!256758)))

(assert (=> b!434440 (= res!255813 (= k0!794 (select (arr!12751 _keys!709) from!863)))))

(assert (=> b!434440 (not (= (select (arr!12751 _keys!709) from!863) k0!794))))

(declare-fun lt!199748 () Unit!12883)

(assert (=> b!434440 (= lt!199748 e!256761)))

(declare-fun c!55685 () Bool)

(assert (=> b!434440 (= c!55685 (= (select (arr!12751 _keys!709) from!863) k0!794))))

(assert (=> b!434440 (= lt!199746 lt!199751)))

(assert (=> b!434440 (= lt!199751 (+!1416 lt!199757 lt!199753))))

(assert (=> b!434440 (= lt!199753 (tuple2!7593 (select (arr!12751 _keys!709) from!863) lt!199759))))

(declare-fun get!6351 (ValueCell!5349 V!16285) V!16285)

(declare-fun dynLambda!826 (Int (_ BitVec 64)) V!16285)

(assert (=> b!434440 (= lt!199759 (get!6351 (select (arr!12752 _values!549) from!863) (dynLambda!826 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434441 () Bool)

(declare-fun e!256759 () Bool)

(assert (=> b!434441 (= e!256759 tp_is_empty!11385)))

(declare-fun b!434442 () Bool)

(declare-fun res!255820 () Bool)

(assert (=> b!434442 (=> (not res!255820) (not e!256754))))

(assert (=> b!434442 (= res!255820 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7594))))

(declare-fun b!434443 () Bool)

(declare-fun res!255822 () Bool)

(assert (=> b!434443 (=> (not res!255822) (not e!256754))))

(assert (=> b!434443 (= res!255822 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13103 _keys!709))))))

(declare-fun mapNonEmpty!18699 () Bool)

(declare-fun tp!36227 () Bool)

(assert (=> mapNonEmpty!18699 (= mapRes!18699 (and tp!36227 e!256759))))

(declare-fun mapValue!18699 () ValueCell!5349)

(declare-fun mapKey!18699 () (_ BitVec 32))

(declare-fun mapRest!18699 () (Array (_ BitVec 32) ValueCell!5349))

(assert (=> mapNonEmpty!18699 (= (arr!12752 _values!549) (store mapRest!18699 mapKey!18699 mapValue!18699))))

(declare-fun mapIsEmpty!18699 () Bool)

(assert (=> mapIsEmpty!18699 mapRes!18699))

(assert (= (and start!39966 res!255818) b!434439))

(assert (= (and b!434439 res!255812) b!434430))

(assert (= (and b!434430 res!255811) b!434428))

(assert (= (and b!434428 res!255825) b!434442))

(assert (= (and b!434442 res!255820) b!434443))

(assert (= (and b!434443 res!255822) b!434432))

(assert (= (and b!434432 res!255816) b!434435))

(assert (= (and b!434435 res!255821) b!434429))

(assert (= (and b!434429 res!255824) b!434437))

(assert (= (and b!434437 res!255819) b!434426))

(assert (= (and b!434426 res!255815) b!434427))

(assert (= (and b!434427 res!255817) b!434433))

(assert (= (and b!434433 res!255823) b!434424))

(assert (= (and b!434424 (not res!255814)) b!434440))

(assert (= (and b!434440 c!55685) b!434436))

(assert (= (and b!434440 (not c!55685)) b!434434))

(assert (= (and b!434440 (not res!255813)) b!434431))

(assert (= (and b!434425 condMapEmpty!18699) mapIsEmpty!18699))

(assert (= (and b!434425 (not condMapEmpty!18699)) mapNonEmpty!18699))

(get-info :version)

(assert (= (and mapNonEmpty!18699 ((_ is ValueCellFull!5349) mapValue!18699)) b!434441))

(assert (= (and b!434425 ((_ is ValueCellFull!5349) mapDefault!18699)) b!434438))

(assert (= start!39966 b!434425))

(declare-fun b_lambda!9321 () Bool)

(assert (=> (not b_lambda!9321) (not b!434440)))

(declare-fun t!13277 () Bool)

(declare-fun tb!3639 () Bool)

(assert (=> (and start!39966 (= defaultEntry!557 defaultEntry!557) t!13277) tb!3639))

(declare-fun result!6805 () Bool)

(assert (=> tb!3639 (= result!6805 tp_is_empty!11385)))

(assert (=> b!434440 t!13277))

(declare-fun b_and!18127 () Bool)

(assert (= b_and!18125 (and (=> t!13277 result!6805) b_and!18127)))

(declare-fun m!422377 () Bool)

(assert (=> b!434426 m!422377))

(declare-fun m!422379 () Bool)

(assert (=> b!434431 m!422379))

(assert (=> b!434431 m!422379))

(declare-fun m!422381 () Bool)

(assert (=> b!434431 m!422381))

(declare-fun m!422383 () Bool)

(assert (=> b!434431 m!422383))

(assert (=> b!434431 m!422383))

(declare-fun m!422385 () Bool)

(assert (=> b!434431 m!422385))

(declare-fun m!422387 () Bool)

(assert (=> b!434437 m!422387))

(declare-fun m!422389 () Bool)

(assert (=> b!434437 m!422389))

(assert (=> b!434424 m!422383))

(declare-fun m!422391 () Bool)

(assert (=> b!434424 m!422391))

(declare-fun m!422393 () Bool)

(assert (=> b!434424 m!422393))

(declare-fun m!422395 () Bool)

(assert (=> b!434424 m!422395))

(assert (=> b!434424 m!422383))

(declare-fun m!422397 () Bool)

(assert (=> b!434424 m!422397))

(declare-fun m!422399 () Bool)

(assert (=> b!434424 m!422399))

(declare-fun m!422401 () Bool)

(assert (=> b!434439 m!422401))

(declare-fun m!422403 () Bool)

(assert (=> b!434433 m!422403))

(declare-fun m!422405 () Bool)

(assert (=> b!434433 m!422405))

(declare-fun m!422407 () Bool)

(assert (=> b!434433 m!422407))

(declare-fun m!422409 () Bool)

(assert (=> start!39966 m!422409))

(declare-fun m!422411 () Bool)

(assert (=> start!39966 m!422411))

(declare-fun m!422413 () Bool)

(assert (=> b!434428 m!422413))

(declare-fun m!422415 () Bool)

(assert (=> mapNonEmpty!18699 m!422415))

(declare-fun m!422417 () Bool)

(assert (=> b!434435 m!422417))

(declare-fun m!422419 () Bool)

(assert (=> b!434442 m!422419))

(declare-fun m!422421 () Bool)

(assert (=> b!434429 m!422421))

(declare-fun m!422423 () Bool)

(assert (=> b!434432 m!422423))

(declare-fun m!422425 () Bool)

(assert (=> b!434436 m!422425))

(assert (=> b!434440 m!422383))

(declare-fun m!422427 () Bool)

(assert (=> b!434440 m!422427))

(declare-fun m!422429 () Bool)

(assert (=> b!434440 m!422429))

(declare-fun m!422431 () Bool)

(assert (=> b!434440 m!422431))

(assert (=> b!434440 m!422431))

(assert (=> b!434440 m!422427))

(declare-fun m!422433 () Bool)

(assert (=> b!434440 m!422433))

(check-sat (not b!434432) (not b!434437) (not mapNonEmpty!18699) (not b_lambda!9321) (not b!434429) tp_is_empty!11385 (not start!39966) (not b!434433) (not b!434440) (not b!434439) b_and!18127 (not b!434436) (not b!434442) (not b!434428) (not b!434424) (not b!434431) (not b_next!10233) (not b!434426))
(check-sat b_and!18127 (not b_next!10233))
