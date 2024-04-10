; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38490 () Bool)

(assert start!38490)

(declare-fun b!397451 () Bool)

(declare-fun e!240364 () Bool)

(assert (=> b!397451 (= e!240364 false)))

(declare-fun lt!187306 () Bool)

(declare-datatypes ((array!23731 0))(
  ( (array!23732 (arr!11315 (Array (_ BitVec 32) (_ BitVec 64))) (size!11667 (_ BitVec 32))) )
))
(declare-fun lt!187307 () array!23731)

(declare-datatypes ((List!6549 0))(
  ( (Nil!6546) (Cons!6545 (h!7401 (_ BitVec 64)) (t!11723 List!6549)) )
))
(declare-fun arrayNoDuplicates!0 (array!23731 (_ BitVec 32) List!6549) Bool)

(assert (=> b!397451 (= lt!187306 (arrayNoDuplicates!0 lt!187307 #b00000000000000000000000000000000 Nil!6546))))

(declare-fun b!397452 () Bool)

(declare-fun res!228212 () Bool)

(declare-fun e!240363 () Bool)

(assert (=> b!397452 (=> (not res!228212) (not e!240363))))

(declare-fun _keys!709 () array!23731)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397452 (= res!228212 (or (= (select (arr!11315 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11315 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397453 () Bool)

(declare-fun res!228219 () Bool)

(assert (=> b!397453 (=> (not res!228219) (not e!240363))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14317 0))(
  ( (V!14318 (val!4999 Int)) )
))
(declare-datatypes ((ValueCell!4611 0))(
  ( (ValueCellFull!4611 (v!7246 V!14317)) (EmptyCell!4611) )
))
(declare-datatypes ((array!23733 0))(
  ( (array!23734 (arr!11316 (Array (_ BitVec 32) ValueCell!4611)) (size!11668 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23733)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!397453 (= res!228219 (and (= (size!11668 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11667 _keys!709) (size!11668 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397454 () Bool)

(declare-fun res!228216 () Bool)

(assert (=> b!397454 (=> (not res!228216) (not e!240363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23731 (_ BitVec 32)) Bool)

(assert (=> b!397454 (= res!228216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397455 () Bool)

(declare-fun res!228213 () Bool)

(assert (=> b!397455 (=> (not res!228213) (not e!240363))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397455 (= res!228213 (validKeyInArray!0 k0!794))))

(declare-fun b!397456 () Bool)

(declare-fun e!240366 () Bool)

(declare-fun e!240361 () Bool)

(declare-fun mapRes!16485 () Bool)

(assert (=> b!397456 (= e!240366 (and e!240361 mapRes!16485))))

(declare-fun condMapEmpty!16485 () Bool)

(declare-fun mapDefault!16485 () ValueCell!4611)

(assert (=> b!397456 (= condMapEmpty!16485 (= (arr!11316 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4611)) mapDefault!16485)))))

(declare-fun b!397457 () Bool)

(declare-fun e!240362 () Bool)

(declare-fun tp_is_empty!9909 () Bool)

(assert (=> b!397457 (= e!240362 tp_is_empty!9909)))

(declare-fun mapIsEmpty!16485 () Bool)

(assert (=> mapIsEmpty!16485 mapRes!16485))

(declare-fun mapNonEmpty!16485 () Bool)

(declare-fun tp!32280 () Bool)

(assert (=> mapNonEmpty!16485 (= mapRes!16485 (and tp!32280 e!240362))))

(declare-fun mapRest!16485 () (Array (_ BitVec 32) ValueCell!4611))

(declare-fun mapValue!16485 () ValueCell!4611)

(declare-fun mapKey!16485 () (_ BitVec 32))

(assert (=> mapNonEmpty!16485 (= (arr!11316 _values!549) (store mapRest!16485 mapKey!16485 mapValue!16485))))

(declare-fun b!397458 () Bool)

(assert (=> b!397458 (= e!240363 e!240364)))

(declare-fun res!228218 () Bool)

(assert (=> b!397458 (=> (not res!228218) (not e!240364))))

(assert (=> b!397458 (= res!228218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187307 mask!1025))))

(assert (=> b!397458 (= lt!187307 (array!23732 (store (arr!11315 _keys!709) i!563 k0!794) (size!11667 _keys!709)))))

(declare-fun res!228217 () Bool)

(assert (=> start!38490 (=> (not res!228217) (not e!240363))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38490 (= res!228217 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11667 _keys!709))))))

(assert (=> start!38490 e!240363))

(assert (=> start!38490 true))

(declare-fun array_inv!8294 (array!23733) Bool)

(assert (=> start!38490 (and (array_inv!8294 _values!549) e!240366)))

(declare-fun array_inv!8295 (array!23731) Bool)

(assert (=> start!38490 (array_inv!8295 _keys!709)))

(declare-fun b!397459 () Bool)

(declare-fun res!228211 () Bool)

(assert (=> b!397459 (=> (not res!228211) (not e!240363))))

(declare-fun arrayContainsKey!0 (array!23731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397459 (= res!228211 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397460 () Bool)

(declare-fun res!228215 () Bool)

(assert (=> b!397460 (=> (not res!228215) (not e!240363))))

(assert (=> b!397460 (= res!228215 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6546))))

(declare-fun b!397461 () Bool)

(declare-fun res!228214 () Bool)

(assert (=> b!397461 (=> (not res!228214) (not e!240363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397461 (= res!228214 (validMask!0 mask!1025))))

(declare-fun b!397462 () Bool)

(assert (=> b!397462 (= e!240361 tp_is_empty!9909)))

(declare-fun b!397463 () Bool)

(declare-fun res!228210 () Bool)

(assert (=> b!397463 (=> (not res!228210) (not e!240363))))

(assert (=> b!397463 (= res!228210 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11667 _keys!709))))))

(assert (= (and start!38490 res!228217) b!397461))

(assert (= (and b!397461 res!228214) b!397453))

(assert (= (and b!397453 res!228219) b!397454))

(assert (= (and b!397454 res!228216) b!397460))

(assert (= (and b!397460 res!228215) b!397463))

(assert (= (and b!397463 res!228210) b!397455))

(assert (= (and b!397455 res!228213) b!397452))

(assert (= (and b!397452 res!228212) b!397459))

(assert (= (and b!397459 res!228211) b!397458))

(assert (= (and b!397458 res!228218) b!397451))

(assert (= (and b!397456 condMapEmpty!16485) mapIsEmpty!16485))

(assert (= (and b!397456 (not condMapEmpty!16485)) mapNonEmpty!16485))

(get-info :version)

(assert (= (and mapNonEmpty!16485 ((_ is ValueCellFull!4611) mapValue!16485)) b!397457))

(assert (= (and b!397456 ((_ is ValueCellFull!4611) mapDefault!16485)) b!397462))

(assert (= start!38490 b!397456))

(declare-fun m!392695 () Bool)

(assert (=> b!397460 m!392695))

(declare-fun m!392697 () Bool)

(assert (=> mapNonEmpty!16485 m!392697))

(declare-fun m!392699 () Bool)

(assert (=> b!397455 m!392699))

(declare-fun m!392701 () Bool)

(assert (=> b!397454 m!392701))

(declare-fun m!392703 () Bool)

(assert (=> start!38490 m!392703))

(declare-fun m!392705 () Bool)

(assert (=> start!38490 m!392705))

(declare-fun m!392707 () Bool)

(assert (=> b!397451 m!392707))

(declare-fun m!392709 () Bool)

(assert (=> b!397452 m!392709))

(declare-fun m!392711 () Bool)

(assert (=> b!397458 m!392711))

(declare-fun m!392713 () Bool)

(assert (=> b!397458 m!392713))

(declare-fun m!392715 () Bool)

(assert (=> b!397459 m!392715))

(declare-fun m!392717 () Bool)

(assert (=> b!397461 m!392717))

(check-sat tp_is_empty!9909 (not b!397460) (not b!397459) (not b!397458) (not b!397454) (not b!397451) (not b!397455) (not mapNonEmpty!16485) (not start!38490) (not b!397461))
(check-sat)
