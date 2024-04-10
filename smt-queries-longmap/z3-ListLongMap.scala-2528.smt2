; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38988 () Bool)

(assert start!38988)

(declare-fun b!408458 () Bool)

(declare-fun res!236333 () Bool)

(declare-fun e!245169 () Bool)

(assert (=> b!408458 (=> (not res!236333) (not e!245169))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408458 (= res!236333 (validKeyInArray!0 k0!794))))

(declare-fun res!236336 () Bool)

(assert (=> start!38988 (=> (not res!236336) (not e!245169))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24689 0))(
  ( (array!24690 (arr!11794 (Array (_ BitVec 32) (_ BitVec 64))) (size!12146 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24689)

(assert (=> start!38988 (= res!236336 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12146 _keys!709))))))

(assert (=> start!38988 e!245169))

(assert (=> start!38988 true))

(declare-datatypes ((V!14981 0))(
  ( (V!14982 (val!5248 Int)) )
))
(declare-datatypes ((ValueCell!4860 0))(
  ( (ValueCellFull!4860 (v!7495 V!14981)) (EmptyCell!4860) )
))
(declare-datatypes ((array!24691 0))(
  ( (array!24692 (arr!11795 (Array (_ BitVec 32) ValueCell!4860)) (size!12147 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24691)

(declare-fun e!245168 () Bool)

(declare-fun array_inv!8604 (array!24691) Bool)

(assert (=> start!38988 (and (array_inv!8604 _values!549) e!245168)))

(declare-fun array_inv!8605 (array!24689) Bool)

(assert (=> start!38988 (array_inv!8605 _keys!709)))

(declare-fun mapIsEmpty!17232 () Bool)

(declare-fun mapRes!17232 () Bool)

(assert (=> mapIsEmpty!17232 mapRes!17232))

(declare-fun b!408459 () Bool)

(declare-fun res!236329 () Bool)

(assert (=> b!408459 (=> (not res!236329) (not e!245169))))

(declare-datatypes ((List!6834 0))(
  ( (Nil!6831) (Cons!6830 (h!7686 (_ BitVec 64)) (t!12008 List!6834)) )
))
(declare-fun arrayNoDuplicates!0 (array!24689 (_ BitVec 32) List!6834) Bool)

(assert (=> b!408459 (= res!236329 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6831))))

(declare-fun b!408460 () Bool)

(declare-fun e!245170 () Bool)

(assert (=> b!408460 (= e!245169 e!245170)))

(declare-fun res!236332 () Bool)

(assert (=> b!408460 (=> (not res!236332) (not e!245170))))

(declare-fun lt!188801 () array!24689)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24689 (_ BitVec 32)) Bool)

(assert (=> b!408460 (= res!236332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188801 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408460 (= lt!188801 (array!24690 (store (arr!11794 _keys!709) i!563 k0!794) (size!12146 _keys!709)))))

(declare-fun b!408461 () Bool)

(assert (=> b!408461 (= e!245170 false)))

(declare-fun lt!188800 () Bool)

(assert (=> b!408461 (= lt!188800 (arrayNoDuplicates!0 lt!188801 #b00000000000000000000000000000000 Nil!6831))))

(declare-fun b!408462 () Bool)

(declare-fun e!245171 () Bool)

(declare-fun tp_is_empty!10407 () Bool)

(assert (=> b!408462 (= e!245171 tp_is_empty!10407)))

(declare-fun b!408463 () Bool)

(declare-fun res!236328 () Bool)

(assert (=> b!408463 (=> (not res!236328) (not e!245169))))

(declare-fun arrayContainsKey!0 (array!24689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408463 (= res!236328 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408464 () Bool)

(declare-fun res!236331 () Bool)

(assert (=> b!408464 (=> (not res!236331) (not e!245169))))

(assert (=> b!408464 (= res!236331 (or (= (select (arr!11794 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11794 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408465 () Bool)

(declare-fun res!236334 () Bool)

(assert (=> b!408465 (=> (not res!236334) (not e!245169))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408465 (= res!236334 (and (= (size!12147 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12146 _keys!709) (size!12147 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408466 () Bool)

(declare-fun e!245172 () Bool)

(assert (=> b!408466 (= e!245172 tp_is_empty!10407)))

(declare-fun b!408467 () Bool)

(declare-fun res!236335 () Bool)

(assert (=> b!408467 (=> (not res!236335) (not e!245169))))

(assert (=> b!408467 (= res!236335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17232 () Bool)

(declare-fun tp!33351 () Bool)

(assert (=> mapNonEmpty!17232 (= mapRes!17232 (and tp!33351 e!245172))))

(declare-fun mapKey!17232 () (_ BitVec 32))

(declare-fun mapValue!17232 () ValueCell!4860)

(declare-fun mapRest!17232 () (Array (_ BitVec 32) ValueCell!4860))

(assert (=> mapNonEmpty!17232 (= (arr!11795 _values!549) (store mapRest!17232 mapKey!17232 mapValue!17232))))

(declare-fun b!408468 () Bool)

(assert (=> b!408468 (= e!245168 (and e!245171 mapRes!17232))))

(declare-fun condMapEmpty!17232 () Bool)

(declare-fun mapDefault!17232 () ValueCell!4860)

(assert (=> b!408468 (= condMapEmpty!17232 (= (arr!11795 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4860)) mapDefault!17232)))))

(declare-fun b!408469 () Bool)

(declare-fun res!236330 () Bool)

(assert (=> b!408469 (=> (not res!236330) (not e!245169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408469 (= res!236330 (validMask!0 mask!1025))))

(declare-fun b!408470 () Bool)

(declare-fun res!236337 () Bool)

(assert (=> b!408470 (=> (not res!236337) (not e!245169))))

(assert (=> b!408470 (= res!236337 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12146 _keys!709))))))

(assert (= (and start!38988 res!236336) b!408469))

(assert (= (and b!408469 res!236330) b!408465))

(assert (= (and b!408465 res!236334) b!408467))

(assert (= (and b!408467 res!236335) b!408459))

(assert (= (and b!408459 res!236329) b!408470))

(assert (= (and b!408470 res!236337) b!408458))

(assert (= (and b!408458 res!236333) b!408464))

(assert (= (and b!408464 res!236331) b!408463))

(assert (= (and b!408463 res!236328) b!408460))

(assert (= (and b!408460 res!236332) b!408461))

(assert (= (and b!408468 condMapEmpty!17232) mapIsEmpty!17232))

(assert (= (and b!408468 (not condMapEmpty!17232)) mapNonEmpty!17232))

(get-info :version)

(assert (= (and mapNonEmpty!17232 ((_ is ValueCellFull!4860) mapValue!17232)) b!408466))

(assert (= (and b!408468 ((_ is ValueCellFull!4860) mapDefault!17232)) b!408462))

(assert (= start!38988 b!408468))

(declare-fun m!399751 () Bool)

(assert (=> mapNonEmpty!17232 m!399751))

(declare-fun m!399753 () Bool)

(assert (=> b!408460 m!399753))

(declare-fun m!399755 () Bool)

(assert (=> b!408460 m!399755))

(declare-fun m!399757 () Bool)

(assert (=> b!408467 m!399757))

(declare-fun m!399759 () Bool)

(assert (=> b!408464 m!399759))

(declare-fun m!399761 () Bool)

(assert (=> b!408469 m!399761))

(declare-fun m!399763 () Bool)

(assert (=> b!408461 m!399763))

(declare-fun m!399765 () Bool)

(assert (=> b!408463 m!399765))

(declare-fun m!399767 () Bool)

(assert (=> start!38988 m!399767))

(declare-fun m!399769 () Bool)

(assert (=> start!38988 m!399769))

(declare-fun m!399771 () Bool)

(assert (=> b!408458 m!399771))

(declare-fun m!399773 () Bool)

(assert (=> b!408459 m!399773))

(check-sat (not b!408463) tp_is_empty!10407 (not b!408469) (not mapNonEmpty!17232) (not b!408459) (not b!408458) (not b!408467) (not b!408460) (not b!408461) (not start!38988))
(check-sat)
