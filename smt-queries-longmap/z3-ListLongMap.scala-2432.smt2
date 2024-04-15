; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38348 () Bool)

(assert start!38348)

(declare-fun b!395429 () Bool)

(declare-fun res!226757 () Bool)

(declare-fun e!239367 () Bool)

(assert (=> b!395429 (=> (not res!226757) (not e!239367))))

(declare-datatypes ((array!23553 0))(
  ( (array!23554 (arr!11229 (Array (_ BitVec 32) (_ BitVec 64))) (size!11582 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23553)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395429 (= res!226757 (or (= (select (arr!11229 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11229 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395430 () Bool)

(declare-fun e!239365 () Bool)

(declare-fun tp_is_empty!9829 () Bool)

(assert (=> b!395430 (= e!239365 tp_is_empty!9829)))

(declare-fun b!395431 () Bool)

(declare-fun res!226760 () Bool)

(assert (=> b!395431 (=> (not res!226760) (not e!239367))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395431 (= res!226760 (validKeyInArray!0 k0!794))))

(declare-fun b!395432 () Bool)

(declare-fun res!226759 () Bool)

(assert (=> b!395432 (=> (not res!226759) (not e!239367))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23553 (_ BitVec 32)) Bool)

(assert (=> b!395432 (= res!226759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23554 (store (arr!11229 _keys!709) i!563 k0!794) (size!11582 _keys!709)) mask!1025))))

(declare-fun res!226761 () Bool)

(assert (=> start!38348 (=> (not res!226761) (not e!239367))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38348 (= res!226761 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11582 _keys!709))))))

(assert (=> start!38348 e!239367))

(assert (=> start!38348 true))

(declare-datatypes ((V!14211 0))(
  ( (V!14212 (val!4959 Int)) )
))
(declare-datatypes ((ValueCell!4571 0))(
  ( (ValueCellFull!4571 (v!7199 V!14211)) (EmptyCell!4571) )
))
(declare-datatypes ((array!23555 0))(
  ( (array!23556 (arr!11230 (Array (_ BitVec 32) ValueCell!4571)) (size!11583 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23555)

(declare-fun e!239364 () Bool)

(declare-fun array_inv!8244 (array!23555) Bool)

(assert (=> start!38348 (and (array_inv!8244 _values!549) e!239364)))

(declare-fun array_inv!8245 (array!23553) Bool)

(assert (=> start!38348 (array_inv!8245 _keys!709)))

(declare-fun mapNonEmpty!16356 () Bool)

(declare-fun mapRes!16356 () Bool)

(declare-fun tp!32151 () Bool)

(assert (=> mapNonEmpty!16356 (= mapRes!16356 (and tp!32151 e!239365))))

(declare-fun mapKey!16356 () (_ BitVec 32))

(declare-fun mapValue!16356 () ValueCell!4571)

(declare-fun mapRest!16356 () (Array (_ BitVec 32) ValueCell!4571))

(assert (=> mapNonEmpty!16356 (= (arr!11230 _values!549) (store mapRest!16356 mapKey!16356 mapValue!16356))))

(declare-fun b!395433 () Bool)

(declare-fun res!226758 () Bool)

(assert (=> b!395433 (=> (not res!226758) (not e!239367))))

(assert (=> b!395433 (= res!226758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16356 () Bool)

(assert (=> mapIsEmpty!16356 mapRes!16356))

(declare-fun b!395434 () Bool)

(assert (=> b!395434 (= e!239367 (bvsgt #b00000000000000000000000000000000 (size!11582 _keys!709)))))

(declare-fun b!395435 () Bool)

(declare-fun res!226756 () Bool)

(assert (=> b!395435 (=> (not res!226756) (not e!239367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395435 (= res!226756 (validMask!0 mask!1025))))

(declare-fun b!395436 () Bool)

(declare-fun e!239368 () Bool)

(assert (=> b!395436 (= e!239368 tp_is_empty!9829)))

(declare-fun b!395437 () Bool)

(assert (=> b!395437 (= e!239364 (and e!239368 mapRes!16356))))

(declare-fun condMapEmpty!16356 () Bool)

(declare-fun mapDefault!16356 () ValueCell!4571)

(assert (=> b!395437 (= condMapEmpty!16356 (= (arr!11230 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4571)) mapDefault!16356)))))

(declare-fun b!395438 () Bool)

(declare-fun res!226765 () Bool)

(assert (=> b!395438 (=> (not res!226765) (not e!239367))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395438 (= res!226765 (and (= (size!11583 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11582 _keys!709) (size!11583 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395439 () Bool)

(declare-fun res!226764 () Bool)

(assert (=> b!395439 (=> (not res!226764) (not e!239367))))

(declare-datatypes ((List!6477 0))(
  ( (Nil!6474) (Cons!6473 (h!7329 (_ BitVec 64)) (t!11642 List!6477)) )
))
(declare-fun arrayNoDuplicates!0 (array!23553 (_ BitVec 32) List!6477) Bool)

(assert (=> b!395439 (= res!226764 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6474))))

(declare-fun b!395440 () Bool)

(declare-fun res!226762 () Bool)

(assert (=> b!395440 (=> (not res!226762) (not e!239367))))

(declare-fun arrayContainsKey!0 (array!23553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395440 (= res!226762 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!395441 () Bool)

(declare-fun res!226763 () Bool)

(assert (=> b!395441 (=> (not res!226763) (not e!239367))))

(assert (=> b!395441 (= res!226763 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11582 _keys!709))))))

(assert (= (and start!38348 res!226761) b!395435))

(assert (= (and b!395435 res!226756) b!395438))

(assert (= (and b!395438 res!226765) b!395433))

(assert (= (and b!395433 res!226758) b!395439))

(assert (= (and b!395439 res!226764) b!395441))

(assert (= (and b!395441 res!226763) b!395431))

(assert (= (and b!395431 res!226760) b!395429))

(assert (= (and b!395429 res!226757) b!395440))

(assert (= (and b!395440 res!226762) b!395432))

(assert (= (and b!395432 res!226759) b!395434))

(assert (= (and b!395437 condMapEmpty!16356) mapIsEmpty!16356))

(assert (= (and b!395437 (not condMapEmpty!16356)) mapNonEmpty!16356))

(get-info :version)

(assert (= (and mapNonEmpty!16356 ((_ is ValueCellFull!4571) mapValue!16356)) b!395430))

(assert (= (and b!395437 ((_ is ValueCellFull!4571) mapDefault!16356)) b!395436))

(assert (= start!38348 b!395437))

(declare-fun m!390897 () Bool)

(assert (=> start!38348 m!390897))

(declare-fun m!390899 () Bool)

(assert (=> start!38348 m!390899))

(declare-fun m!390901 () Bool)

(assert (=> b!395429 m!390901))

(declare-fun m!390903 () Bool)

(assert (=> b!395431 m!390903))

(declare-fun m!390905 () Bool)

(assert (=> mapNonEmpty!16356 m!390905))

(declare-fun m!390907 () Bool)

(assert (=> b!395439 m!390907))

(declare-fun m!390909 () Bool)

(assert (=> b!395433 m!390909))

(declare-fun m!390911 () Bool)

(assert (=> b!395440 m!390911))

(declare-fun m!390913 () Bool)

(assert (=> b!395432 m!390913))

(declare-fun m!390915 () Bool)

(assert (=> b!395432 m!390915))

(declare-fun m!390917 () Bool)

(assert (=> b!395435 m!390917))

(check-sat tp_is_empty!9829 (not b!395431) (not mapNonEmpty!16356) (not start!38348) (not b!395440) (not b!395432) (not b!395433) (not b!395439) (not b!395435))
(check-sat)
