; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38930 () Bool)

(assert start!38930)

(declare-fun mapIsEmpty!17166 () Bool)

(declare-fun mapRes!17166 () Bool)

(assert (=> mapIsEmpty!17166 mapRes!17166))

(declare-fun b!407329 () Bool)

(declare-fun e!244602 () Bool)

(declare-fun e!244597 () Bool)

(assert (=> b!407329 (= e!244602 (and e!244597 mapRes!17166))))

(declare-fun condMapEmpty!17166 () Bool)

(declare-datatypes ((V!14923 0))(
  ( (V!14924 (val!5226 Int)) )
))
(declare-datatypes ((ValueCell!4838 0))(
  ( (ValueCellFull!4838 (v!7467 V!14923)) (EmptyCell!4838) )
))
(declare-datatypes ((array!24597 0))(
  ( (array!24598 (arr!11748 (Array (_ BitVec 32) ValueCell!4838)) (size!12101 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24597)

(declare-fun mapDefault!17166 () ValueCell!4838)

(assert (=> b!407329 (= condMapEmpty!17166 (= (arr!11748 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4838)) mapDefault!17166)))))

(declare-fun res!235545 () Bool)

(declare-fun e!244598 () Bool)

(assert (=> start!38930 (=> (not res!235545) (not e!244598))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24599 0))(
  ( (array!24600 (arr!11749 (Array (_ BitVec 32) (_ BitVec 64))) (size!12102 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24599)

(assert (=> start!38930 (= res!235545 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12102 _keys!709))))))

(assert (=> start!38930 e!244598))

(assert (=> start!38930 true))

(declare-fun array_inv!8618 (array!24597) Bool)

(assert (=> start!38930 (and (array_inv!8618 _values!549) e!244602)))

(declare-fun array_inv!8619 (array!24599) Bool)

(assert (=> start!38930 (array_inv!8619 _keys!709)))

(declare-fun b!407330 () Bool)

(declare-fun e!244601 () Bool)

(declare-fun tp_is_empty!10363 () Bool)

(assert (=> b!407330 (= e!244601 tp_is_empty!10363)))

(declare-fun b!407331 () Bool)

(declare-fun e!244600 () Bool)

(assert (=> b!407331 (= e!244598 e!244600)))

(declare-fun res!235547 () Bool)

(assert (=> b!407331 (=> (not res!235547) (not e!244600))))

(declare-fun lt!188434 () array!24599)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24599 (_ BitVec 32)) Bool)

(assert (=> b!407331 (= res!235547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188434 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407331 (= lt!188434 (array!24600 (store (arr!11749 _keys!709) i!563 k0!794) (size!12102 _keys!709)))))

(declare-fun b!407332 () Bool)

(declare-fun res!235541 () Bool)

(assert (=> b!407332 (=> (not res!235541) (not e!244598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407332 (= res!235541 (validMask!0 mask!1025))))

(declare-fun b!407333 () Bool)

(declare-fun res!235539 () Bool)

(assert (=> b!407333 (=> (not res!235539) (not e!244598))))

(declare-datatypes ((List!6790 0))(
  ( (Nil!6787) (Cons!6786 (h!7642 (_ BitVec 64)) (t!11955 List!6790)) )
))
(declare-fun arrayNoDuplicates!0 (array!24599 (_ BitVec 32) List!6790) Bool)

(assert (=> b!407333 (= res!235539 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6787))))

(declare-fun b!407334 () Bool)

(declare-fun res!235543 () Bool)

(assert (=> b!407334 (=> (not res!235543) (not e!244598))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407334 (= res!235543 (and (= (size!12101 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12102 _keys!709) (size!12101 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407335 () Bool)

(assert (=> b!407335 (= e!244597 tp_is_empty!10363)))

(declare-fun b!407336 () Bool)

(assert (=> b!407336 (= e!244600 false)))

(declare-fun lt!188435 () Bool)

(assert (=> b!407336 (= lt!188435 (arrayNoDuplicates!0 lt!188434 #b00000000000000000000000000000000 Nil!6787))))

(declare-fun b!407337 () Bool)

(declare-fun res!235540 () Bool)

(assert (=> b!407337 (=> (not res!235540) (not e!244598))))

(assert (=> b!407337 (= res!235540 (or (= (select (arr!11749 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11749 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17166 () Bool)

(declare-fun tp!33285 () Bool)

(assert (=> mapNonEmpty!17166 (= mapRes!17166 (and tp!33285 e!244601))))

(declare-fun mapValue!17166 () ValueCell!4838)

(declare-fun mapRest!17166 () (Array (_ BitVec 32) ValueCell!4838))

(declare-fun mapKey!17166 () (_ BitVec 32))

(assert (=> mapNonEmpty!17166 (= (arr!11748 _values!549) (store mapRest!17166 mapKey!17166 mapValue!17166))))

(declare-fun b!407338 () Bool)

(declare-fun res!235548 () Bool)

(assert (=> b!407338 (=> (not res!235548) (not e!244598))))

(declare-fun arrayContainsKey!0 (array!24599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407338 (= res!235548 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407339 () Bool)

(declare-fun res!235544 () Bool)

(assert (=> b!407339 (=> (not res!235544) (not e!244598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407339 (= res!235544 (validKeyInArray!0 k0!794))))

(declare-fun b!407340 () Bool)

(declare-fun res!235542 () Bool)

(assert (=> b!407340 (=> (not res!235542) (not e!244598))))

(assert (=> b!407340 (= res!235542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407341 () Bool)

(declare-fun res!235546 () Bool)

(assert (=> b!407341 (=> (not res!235546) (not e!244598))))

(assert (=> b!407341 (= res!235546 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12102 _keys!709))))))

(assert (= (and start!38930 res!235545) b!407332))

(assert (= (and b!407332 res!235541) b!407334))

(assert (= (and b!407334 res!235543) b!407340))

(assert (= (and b!407340 res!235542) b!407333))

(assert (= (and b!407333 res!235539) b!407341))

(assert (= (and b!407341 res!235546) b!407339))

(assert (= (and b!407339 res!235544) b!407337))

(assert (= (and b!407337 res!235540) b!407338))

(assert (= (and b!407338 res!235548) b!407331))

(assert (= (and b!407331 res!235547) b!407336))

(assert (= (and b!407329 condMapEmpty!17166) mapIsEmpty!17166))

(assert (= (and b!407329 (not condMapEmpty!17166)) mapNonEmpty!17166))

(get-info :version)

(assert (= (and mapNonEmpty!17166 ((_ is ValueCellFull!4838) mapValue!17166)) b!407330))

(assert (= (and b!407329 ((_ is ValueCellFull!4838) mapDefault!17166)) b!407335))

(assert (= start!38930 b!407329))

(declare-fun m!398499 () Bool)

(assert (=> b!407331 m!398499))

(declare-fun m!398501 () Bool)

(assert (=> b!407331 m!398501))

(declare-fun m!398503 () Bool)

(assert (=> mapNonEmpty!17166 m!398503))

(declare-fun m!398505 () Bool)

(assert (=> b!407333 m!398505))

(declare-fun m!398507 () Bool)

(assert (=> b!407337 m!398507))

(declare-fun m!398509 () Bool)

(assert (=> b!407332 m!398509))

(declare-fun m!398511 () Bool)

(assert (=> b!407340 m!398511))

(declare-fun m!398513 () Bool)

(assert (=> b!407336 m!398513))

(declare-fun m!398515 () Bool)

(assert (=> b!407339 m!398515))

(declare-fun m!398517 () Bool)

(assert (=> start!38930 m!398517))

(declare-fun m!398519 () Bool)

(assert (=> start!38930 m!398519))

(declare-fun m!398521 () Bool)

(assert (=> b!407338 m!398521))

(check-sat (not b!407331) (not b!407333) (not b!407339) (not b!407340) (not b!407338) (not mapNonEmpty!17166) (not b!407336) (not b!407332) (not start!38930) tp_is_empty!10363)
(check-sat)
