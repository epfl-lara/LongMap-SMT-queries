; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38940 () Bool)

(assert start!38940)

(declare-fun b!407523 () Bool)

(declare-fun res!235610 () Bool)

(declare-fun e!244740 () Bool)

(assert (=> b!407523 (=> (not res!235610) (not e!244740))))

(declare-datatypes ((array!24599 0))(
  ( (array!24600 (arr!11749 (Array (_ BitVec 32) (_ BitVec 64))) (size!12101 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24599)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407523 (= res!235610 (or (= (select (arr!11749 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11749 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407524 () Bool)

(declare-fun res!235614 () Bool)

(assert (=> b!407524 (=> (not res!235614) (not e!244740))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407524 (= res!235614 (validMask!0 mask!1025))))

(declare-fun b!407525 () Bool)

(declare-fun res!235612 () Bool)

(assert (=> b!407525 (=> (not res!235612) (not e!244740))))

(assert (=> b!407525 (= res!235612 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12101 _keys!709))))))

(declare-fun b!407526 () Bool)

(declare-fun e!244735 () Bool)

(declare-fun e!244736 () Bool)

(declare-fun mapRes!17160 () Bool)

(assert (=> b!407526 (= e!244735 (and e!244736 mapRes!17160))))

(declare-fun condMapEmpty!17160 () Bool)

(declare-datatypes ((V!14917 0))(
  ( (V!14918 (val!5224 Int)) )
))
(declare-datatypes ((ValueCell!4836 0))(
  ( (ValueCellFull!4836 (v!7471 V!14917)) (EmptyCell!4836) )
))
(declare-datatypes ((array!24601 0))(
  ( (array!24602 (arr!11750 (Array (_ BitVec 32) ValueCell!4836)) (size!12102 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24601)

(declare-fun mapDefault!17160 () ValueCell!4836)

(assert (=> b!407526 (= condMapEmpty!17160 (= (arr!11750 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4836)) mapDefault!17160)))))

(declare-fun b!407527 () Bool)

(declare-fun res!235615 () Bool)

(assert (=> b!407527 (=> (not res!235615) (not e!244740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24599 (_ BitVec 32)) Bool)

(assert (=> b!407527 (= res!235615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407528 () Bool)

(declare-fun tp_is_empty!10359 () Bool)

(assert (=> b!407528 (= e!244736 tp_is_empty!10359)))

(declare-fun mapNonEmpty!17160 () Bool)

(declare-fun tp!33279 () Bool)

(declare-fun e!244738 () Bool)

(assert (=> mapNonEmpty!17160 (= mapRes!17160 (and tp!33279 e!244738))))

(declare-fun mapRest!17160 () (Array (_ BitVec 32) ValueCell!4836))

(declare-fun mapValue!17160 () ValueCell!4836)

(declare-fun mapKey!17160 () (_ BitVec 32))

(assert (=> mapNonEmpty!17160 (= (arr!11750 _values!549) (store mapRest!17160 mapKey!17160 mapValue!17160))))

(declare-fun b!407529 () Bool)

(declare-fun res!235617 () Bool)

(assert (=> b!407529 (=> (not res!235617) (not e!244740))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407529 (= res!235617 (and (= (size!12102 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12101 _keys!709) (size!12102 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407530 () Bool)

(declare-fun e!244737 () Bool)

(assert (=> b!407530 (= e!244740 e!244737)))

(declare-fun res!235616 () Bool)

(assert (=> b!407530 (=> (not res!235616) (not e!244737))))

(declare-fun lt!188656 () array!24599)

(assert (=> b!407530 (= res!235616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188656 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!407530 (= lt!188656 (array!24600 (store (arr!11749 _keys!709) i!563 k0!794) (size!12101 _keys!709)))))

(declare-fun b!407531 () Bool)

(declare-fun res!235613 () Bool)

(assert (=> b!407531 (=> (not res!235613) (not e!244740))))

(declare-fun arrayContainsKey!0 (array!24599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407531 (= res!235613 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407522 () Bool)

(declare-fun res!235611 () Bool)

(assert (=> b!407522 (=> (not res!235611) (not e!244740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407522 (= res!235611 (validKeyInArray!0 k0!794))))

(declare-fun res!235609 () Bool)

(assert (=> start!38940 (=> (not res!235609) (not e!244740))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38940 (= res!235609 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12101 _keys!709))))))

(assert (=> start!38940 e!244740))

(assert (=> start!38940 true))

(declare-fun array_inv!8572 (array!24601) Bool)

(assert (=> start!38940 (and (array_inv!8572 _values!549) e!244735)))

(declare-fun array_inv!8573 (array!24599) Bool)

(assert (=> start!38940 (array_inv!8573 _keys!709)))

(declare-fun b!407532 () Bool)

(assert (=> b!407532 (= e!244737 false)))

(declare-fun lt!188657 () Bool)

(declare-datatypes ((List!6815 0))(
  ( (Nil!6812) (Cons!6811 (h!7667 (_ BitVec 64)) (t!11989 List!6815)) )
))
(declare-fun arrayNoDuplicates!0 (array!24599 (_ BitVec 32) List!6815) Bool)

(assert (=> b!407532 (= lt!188657 (arrayNoDuplicates!0 lt!188656 #b00000000000000000000000000000000 Nil!6812))))

(declare-fun mapIsEmpty!17160 () Bool)

(assert (=> mapIsEmpty!17160 mapRes!17160))

(declare-fun b!407533 () Bool)

(declare-fun res!235608 () Bool)

(assert (=> b!407533 (=> (not res!235608) (not e!244740))))

(assert (=> b!407533 (= res!235608 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6812))))

(declare-fun b!407534 () Bool)

(assert (=> b!407534 (= e!244738 tp_is_empty!10359)))

(assert (= (and start!38940 res!235609) b!407524))

(assert (= (and b!407524 res!235614) b!407529))

(assert (= (and b!407529 res!235617) b!407527))

(assert (= (and b!407527 res!235615) b!407533))

(assert (= (and b!407533 res!235608) b!407525))

(assert (= (and b!407525 res!235612) b!407522))

(assert (= (and b!407522 res!235611) b!407523))

(assert (= (and b!407523 res!235610) b!407531))

(assert (= (and b!407531 res!235613) b!407530))

(assert (= (and b!407530 res!235616) b!407532))

(assert (= (and b!407526 condMapEmpty!17160) mapIsEmpty!17160))

(assert (= (and b!407526 (not condMapEmpty!17160)) mapNonEmpty!17160))

(get-info :version)

(assert (= (and mapNonEmpty!17160 ((_ is ValueCellFull!4836) mapValue!17160)) b!407534))

(assert (= (and b!407526 ((_ is ValueCellFull!4836) mapDefault!17160)) b!407528))

(assert (= start!38940 b!407526))

(declare-fun m!399175 () Bool)

(assert (=> start!38940 m!399175))

(declare-fun m!399177 () Bool)

(assert (=> start!38940 m!399177))

(declare-fun m!399179 () Bool)

(assert (=> b!407524 m!399179))

(declare-fun m!399181 () Bool)

(assert (=> b!407533 m!399181))

(declare-fun m!399183 () Bool)

(assert (=> b!407523 m!399183))

(declare-fun m!399185 () Bool)

(assert (=> mapNonEmpty!17160 m!399185))

(declare-fun m!399187 () Bool)

(assert (=> b!407527 m!399187))

(declare-fun m!399189 () Bool)

(assert (=> b!407532 m!399189))

(declare-fun m!399191 () Bool)

(assert (=> b!407522 m!399191))

(declare-fun m!399193 () Bool)

(assert (=> b!407531 m!399193))

(declare-fun m!399195 () Bool)

(assert (=> b!407530 m!399195))

(declare-fun m!399197 () Bool)

(assert (=> b!407530 m!399197))

(check-sat (not b!407524) (not mapNonEmpty!17160) tp_is_empty!10359 (not b!407533) (not b!407531) (not start!38940) (not b!407522) (not b!407527) (not b!407532) (not b!407530))
(check-sat)
