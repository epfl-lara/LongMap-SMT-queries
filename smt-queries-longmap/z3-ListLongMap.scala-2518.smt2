; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38928 () Bool)

(assert start!38928)

(declare-fun b!407288 () Bool)

(declare-fun e!244628 () Bool)

(declare-fun e!244631 () Bool)

(assert (=> b!407288 (= e!244628 e!244631)))

(declare-fun res!235428 () Bool)

(assert (=> b!407288 (=> (not res!235428) (not e!244631))))

(declare-datatypes ((array!24577 0))(
  ( (array!24578 (arr!11738 (Array (_ BitVec 32) (_ BitVec 64))) (size!12090 (_ BitVec 32))) )
))
(declare-fun lt!188620 () array!24577)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24577 (_ BitVec 32)) Bool)

(assert (=> b!407288 (= res!235428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188620 mask!1025))))

(declare-fun _keys!709 () array!24577)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407288 (= lt!188620 (array!24578 (store (arr!11738 _keys!709) i!563 k0!794) (size!12090 _keys!709)))))

(declare-fun b!407289 () Bool)

(declare-fun res!235430 () Bool)

(assert (=> b!407289 (=> (not res!235430) (not e!244628))))

(declare-fun arrayContainsKey!0 (array!24577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407289 (= res!235430 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407290 () Bool)

(declare-fun e!244627 () Bool)

(declare-fun tp_is_empty!10347 () Bool)

(assert (=> b!407290 (= e!244627 tp_is_empty!10347)))

(declare-fun b!407291 () Bool)

(assert (=> b!407291 (= e!244631 false)))

(declare-fun lt!188621 () Bool)

(declare-datatypes ((List!6811 0))(
  ( (Nil!6808) (Cons!6807 (h!7663 (_ BitVec 64)) (t!11985 List!6811)) )
))
(declare-fun arrayNoDuplicates!0 (array!24577 (_ BitVec 32) List!6811) Bool)

(assert (=> b!407291 (= lt!188621 (arrayNoDuplicates!0 lt!188620 #b00000000000000000000000000000000 Nil!6808))))

(declare-fun b!407292 () Bool)

(declare-fun res!235431 () Bool)

(assert (=> b!407292 (=> (not res!235431) (not e!244628))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14901 0))(
  ( (V!14902 (val!5218 Int)) )
))
(declare-datatypes ((ValueCell!4830 0))(
  ( (ValueCellFull!4830 (v!7465 V!14901)) (EmptyCell!4830) )
))
(declare-datatypes ((array!24579 0))(
  ( (array!24580 (arr!11739 (Array (_ BitVec 32) ValueCell!4830)) (size!12091 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24579)

(assert (=> b!407292 (= res!235431 (and (= (size!12091 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12090 _keys!709) (size!12091 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17142 () Bool)

(declare-fun mapRes!17142 () Bool)

(declare-fun tp!33261 () Bool)

(assert (=> mapNonEmpty!17142 (= mapRes!17142 (and tp!33261 e!244627))))

(declare-fun mapRest!17142 () (Array (_ BitVec 32) ValueCell!4830))

(declare-fun mapKey!17142 () (_ BitVec 32))

(declare-fun mapValue!17142 () ValueCell!4830)

(assert (=> mapNonEmpty!17142 (= (arr!11739 _values!549) (store mapRest!17142 mapKey!17142 mapValue!17142))))

(declare-fun res!235433 () Bool)

(assert (=> start!38928 (=> (not res!235433) (not e!244628))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38928 (= res!235433 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12090 _keys!709))))))

(assert (=> start!38928 e!244628))

(assert (=> start!38928 true))

(declare-fun e!244629 () Bool)

(declare-fun array_inv!8564 (array!24579) Bool)

(assert (=> start!38928 (and (array_inv!8564 _values!549) e!244629)))

(declare-fun array_inv!8565 (array!24577) Bool)

(assert (=> start!38928 (array_inv!8565 _keys!709)))

(declare-fun b!407293 () Bool)

(declare-fun res!235432 () Bool)

(assert (=> b!407293 (=> (not res!235432) (not e!244628))))

(assert (=> b!407293 (= res!235432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17142 () Bool)

(assert (=> mapIsEmpty!17142 mapRes!17142))

(declare-fun b!407294 () Bool)

(declare-fun res!235434 () Bool)

(assert (=> b!407294 (=> (not res!235434) (not e!244628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407294 (= res!235434 (validKeyInArray!0 k0!794))))

(declare-fun b!407295 () Bool)

(declare-fun res!235436 () Bool)

(assert (=> b!407295 (=> (not res!235436) (not e!244628))))

(assert (=> b!407295 (= res!235436 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6808))))

(declare-fun b!407296 () Bool)

(declare-fun res!235437 () Bool)

(assert (=> b!407296 (=> (not res!235437) (not e!244628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407296 (= res!235437 (validMask!0 mask!1025))))

(declare-fun b!407297 () Bool)

(declare-fun res!235435 () Bool)

(assert (=> b!407297 (=> (not res!235435) (not e!244628))))

(assert (=> b!407297 (= res!235435 (or (= (select (arr!11738 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11738 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407298 () Bool)

(declare-fun e!244630 () Bool)

(assert (=> b!407298 (= e!244629 (and e!244630 mapRes!17142))))

(declare-fun condMapEmpty!17142 () Bool)

(declare-fun mapDefault!17142 () ValueCell!4830)

(assert (=> b!407298 (= condMapEmpty!17142 (= (arr!11739 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4830)) mapDefault!17142)))))

(declare-fun b!407299 () Bool)

(assert (=> b!407299 (= e!244630 tp_is_empty!10347)))

(declare-fun b!407300 () Bool)

(declare-fun res!235429 () Bool)

(assert (=> b!407300 (=> (not res!235429) (not e!244628))))

(assert (=> b!407300 (= res!235429 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12090 _keys!709))))))

(assert (= (and start!38928 res!235433) b!407296))

(assert (= (and b!407296 res!235437) b!407292))

(assert (= (and b!407292 res!235431) b!407293))

(assert (= (and b!407293 res!235432) b!407295))

(assert (= (and b!407295 res!235436) b!407300))

(assert (= (and b!407300 res!235429) b!407294))

(assert (= (and b!407294 res!235434) b!407297))

(assert (= (and b!407297 res!235435) b!407289))

(assert (= (and b!407289 res!235430) b!407288))

(assert (= (and b!407288 res!235428) b!407291))

(assert (= (and b!407298 condMapEmpty!17142) mapIsEmpty!17142))

(assert (= (and b!407298 (not condMapEmpty!17142)) mapNonEmpty!17142))

(get-info :version)

(assert (= (and mapNonEmpty!17142 ((_ is ValueCellFull!4830) mapValue!17142)) b!407290))

(assert (= (and b!407298 ((_ is ValueCellFull!4830) mapDefault!17142)) b!407299))

(assert (= start!38928 b!407298))

(declare-fun m!399031 () Bool)

(assert (=> b!407288 m!399031))

(declare-fun m!399033 () Bool)

(assert (=> b!407288 m!399033))

(declare-fun m!399035 () Bool)

(assert (=> b!407291 m!399035))

(declare-fun m!399037 () Bool)

(assert (=> mapNonEmpty!17142 m!399037))

(declare-fun m!399039 () Bool)

(assert (=> b!407297 m!399039))

(declare-fun m!399041 () Bool)

(assert (=> b!407295 m!399041))

(declare-fun m!399043 () Bool)

(assert (=> start!38928 m!399043))

(declare-fun m!399045 () Bool)

(assert (=> start!38928 m!399045))

(declare-fun m!399047 () Bool)

(assert (=> b!407296 m!399047))

(declare-fun m!399049 () Bool)

(assert (=> b!407289 m!399049))

(declare-fun m!399051 () Bool)

(assert (=> b!407294 m!399051))

(declare-fun m!399053 () Bool)

(assert (=> b!407293 m!399053))

(check-sat (not b!407294) (not b!407291) (not b!407289) (not b!407288) (not b!407296) tp_is_empty!10347 (not start!38928) (not b!407293) (not b!407295) (not mapNonEmpty!17142))
(check-sat)
