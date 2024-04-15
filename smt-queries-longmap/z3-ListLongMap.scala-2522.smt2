; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38936 () Bool)

(assert start!38936)

(declare-fun b!407446 () Bool)

(declare-fun res!235631 () Bool)

(declare-fun e!244655 () Bool)

(assert (=> b!407446 (=> (not res!235631) (not e!244655))))

(declare-datatypes ((array!24609 0))(
  ( (array!24610 (arr!11754 (Array (_ BitVec 32) (_ BitVec 64))) (size!12107 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24609)

(declare-datatypes ((List!6792 0))(
  ( (Nil!6789) (Cons!6788 (h!7644 (_ BitVec 64)) (t!11957 List!6792)) )
))
(declare-fun arrayNoDuplicates!0 (array!24609 (_ BitVec 32) List!6792) Bool)

(assert (=> b!407446 (= res!235631 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6789))))

(declare-fun b!407447 () Bool)

(declare-fun e!244652 () Bool)

(assert (=> b!407447 (= e!244655 e!244652)))

(declare-fun res!235632 () Bool)

(assert (=> b!407447 (=> (not res!235632) (not e!244652))))

(declare-fun lt!188452 () array!24609)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24609 (_ BitVec 32)) Bool)

(assert (=> b!407447 (= res!235632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188452 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407447 (= lt!188452 (array!24610 (store (arr!11754 _keys!709) i!563 k0!794) (size!12107 _keys!709)))))

(declare-fun b!407448 () Bool)

(declare-fun res!235638 () Bool)

(assert (=> b!407448 (=> (not res!235638) (not e!244655))))

(assert (=> b!407448 (= res!235638 (or (= (select (arr!11754 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11754 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407449 () Bool)

(declare-fun res!235635 () Bool)

(assert (=> b!407449 (=> (not res!235635) (not e!244655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407449 (= res!235635 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17175 () Bool)

(declare-fun mapRes!17175 () Bool)

(assert (=> mapIsEmpty!17175 mapRes!17175))

(declare-fun b!407450 () Bool)

(declare-fun res!235633 () Bool)

(assert (=> b!407450 (=> (not res!235633) (not e!244655))))

(assert (=> b!407450 (= res!235633 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12107 _keys!709))))))

(declare-fun b!407451 () Bool)

(assert (=> b!407451 (= e!244652 false)))

(declare-fun lt!188453 () Bool)

(assert (=> b!407451 (= lt!188453 (arrayNoDuplicates!0 lt!188452 #b00000000000000000000000000000000 Nil!6789))))

(declare-fun b!407452 () Bool)

(declare-fun res!235629 () Bool)

(assert (=> b!407452 (=> (not res!235629) (not e!244655))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14931 0))(
  ( (V!14932 (val!5229 Int)) )
))
(declare-datatypes ((ValueCell!4841 0))(
  ( (ValueCellFull!4841 (v!7470 V!14931)) (EmptyCell!4841) )
))
(declare-datatypes ((array!24611 0))(
  ( (array!24612 (arr!11755 (Array (_ BitVec 32) ValueCell!4841)) (size!12108 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24611)

(assert (=> b!407452 (= res!235629 (and (= (size!12108 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12107 _keys!709) (size!12108 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407453 () Bool)

(declare-fun e!244656 () Bool)

(declare-fun e!244654 () Bool)

(assert (=> b!407453 (= e!244656 (and e!244654 mapRes!17175))))

(declare-fun condMapEmpty!17175 () Bool)

(declare-fun mapDefault!17175 () ValueCell!4841)

(assert (=> b!407453 (= condMapEmpty!17175 (= (arr!11755 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4841)) mapDefault!17175)))))

(declare-fun b!407454 () Bool)

(declare-fun e!244651 () Bool)

(declare-fun tp_is_empty!10369 () Bool)

(assert (=> b!407454 (= e!244651 tp_is_empty!10369)))

(declare-fun b!407455 () Bool)

(declare-fun res!235630 () Bool)

(assert (=> b!407455 (=> (not res!235630) (not e!244655))))

(assert (=> b!407455 (= res!235630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!235637 () Bool)

(assert (=> start!38936 (=> (not res!235637) (not e!244655))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38936 (= res!235637 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12107 _keys!709))))))

(assert (=> start!38936 e!244655))

(assert (=> start!38936 true))

(declare-fun array_inv!8622 (array!24611) Bool)

(assert (=> start!38936 (and (array_inv!8622 _values!549) e!244656)))

(declare-fun array_inv!8623 (array!24609) Bool)

(assert (=> start!38936 (array_inv!8623 _keys!709)))

(declare-fun mapNonEmpty!17175 () Bool)

(declare-fun tp!33294 () Bool)

(assert (=> mapNonEmpty!17175 (= mapRes!17175 (and tp!33294 e!244651))))

(declare-fun mapValue!17175 () ValueCell!4841)

(declare-fun mapKey!17175 () (_ BitVec 32))

(declare-fun mapRest!17175 () (Array (_ BitVec 32) ValueCell!4841))

(assert (=> mapNonEmpty!17175 (= (arr!11755 _values!549) (store mapRest!17175 mapKey!17175 mapValue!17175))))

(declare-fun b!407456 () Bool)

(declare-fun res!235634 () Bool)

(assert (=> b!407456 (=> (not res!235634) (not e!244655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407456 (= res!235634 (validKeyInArray!0 k0!794))))

(declare-fun b!407457 () Bool)

(assert (=> b!407457 (= e!244654 tp_is_empty!10369)))

(declare-fun b!407458 () Bool)

(declare-fun res!235636 () Bool)

(assert (=> b!407458 (=> (not res!235636) (not e!244655))))

(declare-fun arrayContainsKey!0 (array!24609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407458 (= res!235636 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38936 res!235637) b!407449))

(assert (= (and b!407449 res!235635) b!407452))

(assert (= (and b!407452 res!235629) b!407455))

(assert (= (and b!407455 res!235630) b!407446))

(assert (= (and b!407446 res!235631) b!407450))

(assert (= (and b!407450 res!235633) b!407456))

(assert (= (and b!407456 res!235634) b!407448))

(assert (= (and b!407448 res!235638) b!407458))

(assert (= (and b!407458 res!235636) b!407447))

(assert (= (and b!407447 res!235632) b!407451))

(assert (= (and b!407453 condMapEmpty!17175) mapIsEmpty!17175))

(assert (= (and b!407453 (not condMapEmpty!17175)) mapNonEmpty!17175))

(get-info :version)

(assert (= (and mapNonEmpty!17175 ((_ is ValueCellFull!4841) mapValue!17175)) b!407454))

(assert (= (and b!407453 ((_ is ValueCellFull!4841) mapDefault!17175)) b!407457))

(assert (= start!38936 b!407453))

(declare-fun m!398571 () Bool)

(assert (=> b!407449 m!398571))

(declare-fun m!398573 () Bool)

(assert (=> mapNonEmpty!17175 m!398573))

(declare-fun m!398575 () Bool)

(assert (=> b!407458 m!398575))

(declare-fun m!398577 () Bool)

(assert (=> b!407456 m!398577))

(declare-fun m!398579 () Bool)

(assert (=> b!407451 m!398579))

(declare-fun m!398581 () Bool)

(assert (=> b!407448 m!398581))

(declare-fun m!398583 () Bool)

(assert (=> start!38936 m!398583))

(declare-fun m!398585 () Bool)

(assert (=> start!38936 m!398585))

(declare-fun m!398587 () Bool)

(assert (=> b!407447 m!398587))

(declare-fun m!398589 () Bool)

(assert (=> b!407447 m!398589))

(declare-fun m!398591 () Bool)

(assert (=> b!407446 m!398591))

(declare-fun m!398593 () Bool)

(assert (=> b!407455 m!398593))

(check-sat (not b!407447) (not b!407446) (not b!407455) (not b!407458) (not start!38936) (not b!407451) (not b!407456) tp_is_empty!10369 (not b!407449) (not mapNonEmpty!17175))
(check-sat)
