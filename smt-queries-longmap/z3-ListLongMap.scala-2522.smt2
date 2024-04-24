; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38936 () Bool)

(assert start!38936)

(declare-fun b!407668 () Bool)

(declare-fun res!235761 () Bool)

(declare-fun e!244795 () Bool)

(assert (=> b!407668 (=> (not res!235761) (not e!244795))))

(declare-datatypes ((array!24616 0))(
  ( (array!24617 (arr!11757 (Array (_ BitVec 32) (_ BitVec 64))) (size!12109 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24616)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407668 (= res!235761 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407669 () Bool)

(declare-fun e!244797 () Bool)

(assert (=> b!407669 (= e!244795 e!244797)))

(declare-fun res!235763 () Bool)

(assert (=> b!407669 (=> (not res!235763) (not e!244797))))

(declare-fun lt!188705 () array!24616)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24616 (_ BitVec 32)) Bool)

(assert (=> b!407669 (= res!235763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188705 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407669 (= lt!188705 (array!24617 (store (arr!11757 _keys!709) i!563 k0!794) (size!12109 _keys!709)))))

(declare-fun b!407670 () Bool)

(declare-fun res!235755 () Bool)

(assert (=> b!407670 (=> (not res!235755) (not e!244795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407670 (= res!235755 (validMask!0 mask!1025))))

(declare-fun b!407671 () Bool)

(declare-fun res!235760 () Bool)

(assert (=> b!407671 (=> (not res!235760) (not e!244795))))

(assert (=> b!407671 (= res!235760 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12109 _keys!709))))))

(declare-fun b!407672 () Bool)

(declare-fun e!244798 () Bool)

(declare-fun e!244794 () Bool)

(declare-fun mapRes!17175 () Bool)

(assert (=> b!407672 (= e!244798 (and e!244794 mapRes!17175))))

(declare-fun condMapEmpty!17175 () Bool)

(declare-datatypes ((V!14931 0))(
  ( (V!14932 (val!5229 Int)) )
))
(declare-datatypes ((ValueCell!4841 0))(
  ( (ValueCellFull!4841 (v!7477 V!14931)) (EmptyCell!4841) )
))
(declare-datatypes ((array!24618 0))(
  ( (array!24619 (arr!11758 (Array (_ BitVec 32) ValueCell!4841)) (size!12110 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24618)

(declare-fun mapDefault!17175 () ValueCell!4841)

(assert (=> b!407672 (= condMapEmpty!17175 (= (arr!11758 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4841)) mapDefault!17175)))))

(declare-fun mapIsEmpty!17175 () Bool)

(assert (=> mapIsEmpty!17175 mapRes!17175))

(declare-fun b!407673 () Bool)

(declare-fun res!235758 () Bool)

(assert (=> b!407673 (=> (not res!235758) (not e!244795))))

(declare-datatypes ((List!6696 0))(
  ( (Nil!6693) (Cons!6692 (h!7548 (_ BitVec 64)) (t!11862 List!6696)) )
))
(declare-fun arrayNoDuplicates!0 (array!24616 (_ BitVec 32) List!6696) Bool)

(assert (=> b!407673 (= res!235758 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6693))))

(declare-fun b!407674 () Bool)

(declare-fun res!235757 () Bool)

(assert (=> b!407674 (=> (not res!235757) (not e!244795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407674 (= res!235757 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17175 () Bool)

(declare-fun tp!33294 () Bool)

(declare-fun e!244793 () Bool)

(assert (=> mapNonEmpty!17175 (= mapRes!17175 (and tp!33294 e!244793))))

(declare-fun mapValue!17175 () ValueCell!4841)

(declare-fun mapKey!17175 () (_ BitVec 32))

(declare-fun mapRest!17175 () (Array (_ BitVec 32) ValueCell!4841))

(assert (=> mapNonEmpty!17175 (= (arr!11758 _values!549) (store mapRest!17175 mapKey!17175 mapValue!17175))))

(declare-fun b!407675 () Bool)

(declare-fun tp_is_empty!10369 () Bool)

(assert (=> b!407675 (= e!244794 tp_is_empty!10369)))

(declare-fun b!407676 () Bool)

(declare-fun res!235764 () Bool)

(assert (=> b!407676 (=> (not res!235764) (not e!244795))))

(assert (=> b!407676 (= res!235764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407677 () Bool)

(assert (=> b!407677 (= e!244793 tp_is_empty!10369)))

(declare-fun res!235762 () Bool)

(assert (=> start!38936 (=> (not res!235762) (not e!244795))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38936 (= res!235762 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12109 _keys!709))))))

(assert (=> start!38936 e!244795))

(assert (=> start!38936 true))

(declare-fun array_inv!8666 (array!24618) Bool)

(assert (=> start!38936 (and (array_inv!8666 _values!549) e!244798)))

(declare-fun array_inv!8667 (array!24616) Bool)

(assert (=> start!38936 (array_inv!8667 _keys!709)))

(declare-fun b!407678 () Bool)

(assert (=> b!407678 (= e!244797 false)))

(declare-fun lt!188706 () Bool)

(assert (=> b!407678 (= lt!188706 (arrayNoDuplicates!0 lt!188705 #b00000000000000000000000000000000 Nil!6693))))

(declare-fun b!407679 () Bool)

(declare-fun res!235756 () Bool)

(assert (=> b!407679 (=> (not res!235756) (not e!244795))))

(assert (=> b!407679 (= res!235756 (or (= (select (arr!11757 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11757 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407680 () Bool)

(declare-fun res!235759 () Bool)

(assert (=> b!407680 (=> (not res!235759) (not e!244795))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407680 (= res!235759 (and (= (size!12110 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12109 _keys!709) (size!12110 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38936 res!235762) b!407670))

(assert (= (and b!407670 res!235755) b!407680))

(assert (= (and b!407680 res!235759) b!407676))

(assert (= (and b!407676 res!235764) b!407673))

(assert (= (and b!407673 res!235758) b!407671))

(assert (= (and b!407671 res!235760) b!407674))

(assert (= (and b!407674 res!235757) b!407679))

(assert (= (and b!407679 res!235756) b!407668))

(assert (= (and b!407668 res!235761) b!407669))

(assert (= (and b!407669 res!235763) b!407678))

(assert (= (and b!407672 condMapEmpty!17175) mapIsEmpty!17175))

(assert (= (and b!407672 (not condMapEmpty!17175)) mapNonEmpty!17175))

(get-info :version)

(assert (= (and mapNonEmpty!17175 ((_ is ValueCellFull!4841) mapValue!17175)) b!407677))

(assert (= (and b!407672 ((_ is ValueCellFull!4841) mapDefault!17175)) b!407675))

(assert (= start!38936 b!407672))

(declare-fun m!399525 () Bool)

(assert (=> b!407673 m!399525))

(declare-fun m!399527 () Bool)

(assert (=> b!407670 m!399527))

(declare-fun m!399529 () Bool)

(assert (=> b!407678 m!399529))

(declare-fun m!399531 () Bool)

(assert (=> b!407668 m!399531))

(declare-fun m!399533 () Bool)

(assert (=> b!407676 m!399533))

(declare-fun m!399535 () Bool)

(assert (=> start!38936 m!399535))

(declare-fun m!399537 () Bool)

(assert (=> start!38936 m!399537))

(declare-fun m!399539 () Bool)

(assert (=> b!407674 m!399539))

(declare-fun m!399541 () Bool)

(assert (=> b!407679 m!399541))

(declare-fun m!399543 () Bool)

(assert (=> b!407669 m!399543))

(declare-fun m!399545 () Bool)

(assert (=> b!407669 m!399545))

(declare-fun m!399547 () Bool)

(assert (=> mapNonEmpty!17175 m!399547))

(check-sat (not b!407670) (not b!407673) (not start!38936) (not b!407669) (not b!407678) (not mapNonEmpty!17175) (not b!407676) (not b!407668) tp_is_empty!10369 (not b!407674))
(check-sat)
