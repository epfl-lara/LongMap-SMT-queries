; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38952 () Bool)

(assert start!38952)

(declare-fun res!235794 () Bool)

(declare-fun e!244847 () Bool)

(assert (=> start!38952 (=> (not res!235794) (not e!244847))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24623 0))(
  ( (array!24624 (arr!11761 (Array (_ BitVec 32) (_ BitVec 64))) (size!12113 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24623)

(assert (=> start!38952 (= res!235794 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12113 _keys!709))))))

(assert (=> start!38952 e!244847))

(assert (=> start!38952 true))

(declare-datatypes ((V!14933 0))(
  ( (V!14934 (val!5230 Int)) )
))
(declare-datatypes ((ValueCell!4842 0))(
  ( (ValueCellFull!4842 (v!7477 V!14933)) (EmptyCell!4842) )
))
(declare-datatypes ((array!24625 0))(
  ( (array!24626 (arr!11762 (Array (_ BitVec 32) ValueCell!4842)) (size!12114 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24625)

(declare-fun e!244843 () Bool)

(declare-fun array_inv!8580 (array!24625) Bool)

(assert (=> start!38952 (and (array_inv!8580 _values!549) e!244843)))

(declare-fun array_inv!8581 (array!24623) Bool)

(assert (=> start!38952 (array_inv!8581 _keys!709)))

(declare-fun b!407756 () Bool)

(declare-fun res!235795 () Bool)

(assert (=> b!407756 (=> (not res!235795) (not e!244847))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407756 (= res!235795 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12113 _keys!709))))))

(declare-fun mapNonEmpty!17178 () Bool)

(declare-fun mapRes!17178 () Bool)

(declare-fun tp!33297 () Bool)

(declare-fun e!244848 () Bool)

(assert (=> mapNonEmpty!17178 (= mapRes!17178 (and tp!33297 e!244848))))

(declare-fun mapKey!17178 () (_ BitVec 32))

(declare-fun mapRest!17178 () (Array (_ BitVec 32) ValueCell!4842))

(declare-fun mapValue!17178 () ValueCell!4842)

(assert (=> mapNonEmpty!17178 (= (arr!11762 _values!549) (store mapRest!17178 mapKey!17178 mapValue!17178))))

(declare-fun b!407757 () Bool)

(declare-fun res!235796 () Bool)

(assert (=> b!407757 (=> (not res!235796) (not e!244847))))

(declare-datatypes ((List!6820 0))(
  ( (Nil!6817) (Cons!6816 (h!7672 (_ BitVec 64)) (t!11994 List!6820)) )
))
(declare-fun arrayNoDuplicates!0 (array!24623 (_ BitVec 32) List!6820) Bool)

(assert (=> b!407757 (= res!235796 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6817))))

(declare-fun b!407758 () Bool)

(declare-fun res!235789 () Bool)

(assert (=> b!407758 (=> (not res!235789) (not e!244847))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24623 (_ BitVec 32)) Bool)

(assert (=> b!407758 (= res!235789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407759 () Bool)

(declare-fun res!235792 () Bool)

(assert (=> b!407759 (=> (not res!235792) (not e!244847))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407759 (= res!235792 (and (= (size!12114 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12113 _keys!709) (size!12114 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407760 () Bool)

(declare-fun tp_is_empty!10371 () Bool)

(assert (=> b!407760 (= e!244848 tp_is_empty!10371)))

(declare-fun b!407761 () Bool)

(declare-fun e!244844 () Bool)

(assert (=> b!407761 (= e!244847 e!244844)))

(declare-fun res!235790 () Bool)

(assert (=> b!407761 (=> (not res!235790) (not e!244844))))

(declare-fun lt!188693 () array!24623)

(assert (=> b!407761 (= res!235790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188693 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!407761 (= lt!188693 (array!24624 (store (arr!11761 _keys!709) i!563 k0!794) (size!12113 _keys!709)))))

(declare-fun b!407762 () Bool)

(assert (=> b!407762 (= e!244844 false)))

(declare-fun lt!188692 () Bool)

(assert (=> b!407762 (= lt!188692 (arrayNoDuplicates!0 lt!188693 #b00000000000000000000000000000000 Nil!6817))))

(declare-fun b!407763 () Bool)

(declare-fun res!235788 () Bool)

(assert (=> b!407763 (=> (not res!235788) (not e!244847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407763 (= res!235788 (validMask!0 mask!1025))))

(declare-fun b!407764 () Bool)

(declare-fun res!235793 () Bool)

(assert (=> b!407764 (=> (not res!235793) (not e!244847))))

(declare-fun arrayContainsKey!0 (array!24623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407764 (= res!235793 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407765 () Bool)

(declare-fun e!244846 () Bool)

(assert (=> b!407765 (= e!244843 (and e!244846 mapRes!17178))))

(declare-fun condMapEmpty!17178 () Bool)

(declare-fun mapDefault!17178 () ValueCell!4842)

(assert (=> b!407765 (= condMapEmpty!17178 (= (arr!11762 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4842)) mapDefault!17178)))))

(declare-fun b!407766 () Bool)

(assert (=> b!407766 (= e!244846 tp_is_empty!10371)))

(declare-fun b!407767 () Bool)

(declare-fun res!235797 () Bool)

(assert (=> b!407767 (=> (not res!235797) (not e!244847))))

(assert (=> b!407767 (= res!235797 (or (= (select (arr!11761 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11761 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17178 () Bool)

(assert (=> mapIsEmpty!17178 mapRes!17178))

(declare-fun b!407768 () Bool)

(declare-fun res!235791 () Bool)

(assert (=> b!407768 (=> (not res!235791) (not e!244847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407768 (= res!235791 (validKeyInArray!0 k0!794))))

(assert (= (and start!38952 res!235794) b!407763))

(assert (= (and b!407763 res!235788) b!407759))

(assert (= (and b!407759 res!235792) b!407758))

(assert (= (and b!407758 res!235789) b!407757))

(assert (= (and b!407757 res!235796) b!407756))

(assert (= (and b!407756 res!235795) b!407768))

(assert (= (and b!407768 res!235791) b!407767))

(assert (= (and b!407767 res!235797) b!407764))

(assert (= (and b!407764 res!235793) b!407761))

(assert (= (and b!407761 res!235790) b!407762))

(assert (= (and b!407765 condMapEmpty!17178) mapIsEmpty!17178))

(assert (= (and b!407765 (not condMapEmpty!17178)) mapNonEmpty!17178))

(get-info :version)

(assert (= (and mapNonEmpty!17178 ((_ is ValueCellFull!4842) mapValue!17178)) b!407760))

(assert (= (and b!407765 ((_ is ValueCellFull!4842) mapDefault!17178)) b!407766))

(assert (= start!38952 b!407765))

(declare-fun m!399319 () Bool)

(assert (=> b!407757 m!399319))

(declare-fun m!399321 () Bool)

(assert (=> b!407764 m!399321))

(declare-fun m!399323 () Bool)

(assert (=> b!407767 m!399323))

(declare-fun m!399325 () Bool)

(assert (=> b!407768 m!399325))

(declare-fun m!399327 () Bool)

(assert (=> mapNonEmpty!17178 m!399327))

(declare-fun m!399329 () Bool)

(assert (=> b!407761 m!399329))

(declare-fun m!399331 () Bool)

(assert (=> b!407761 m!399331))

(declare-fun m!399333 () Bool)

(assert (=> b!407762 m!399333))

(declare-fun m!399335 () Bool)

(assert (=> b!407763 m!399335))

(declare-fun m!399337 () Bool)

(assert (=> start!38952 m!399337))

(declare-fun m!399339 () Bool)

(assert (=> start!38952 m!399339))

(declare-fun m!399341 () Bool)

(assert (=> b!407758 m!399341))

(check-sat (not mapNonEmpty!17178) (not start!38952) (not b!407758) (not b!407757) (not b!407763) (not b!407761) (not b!407764) (not b!407768) (not b!407762) tp_is_empty!10371)
(check-sat)
