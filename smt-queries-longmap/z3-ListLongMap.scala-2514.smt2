; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38888 () Bool)

(assert start!38888)

(declare-fun b!406732 () Bool)

(declare-fun res!235035 () Bool)

(declare-fun e!244365 () Bool)

(assert (=> b!406732 (=> (not res!235035) (not e!244365))))

(declare-datatypes ((array!24520 0))(
  ( (array!24521 (arr!11709 (Array (_ BitVec 32) (_ BitVec 64))) (size!12061 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24520)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!14867 0))(
  ( (V!14868 (val!5205 Int)) )
))
(declare-datatypes ((ValueCell!4817 0))(
  ( (ValueCellFull!4817 (v!7453 V!14867)) (EmptyCell!4817) )
))
(declare-datatypes ((array!24522 0))(
  ( (array!24523 (arr!11710 (Array (_ BitVec 32) ValueCell!4817)) (size!12062 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24522)

(assert (=> b!406732 (= res!235035 (and (= (size!12062 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12061 _keys!709) (size!12062 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406733 () Bool)

(declare-fun res!235039 () Bool)

(assert (=> b!406733 (=> (not res!235039) (not e!244365))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406733 (= res!235039 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406734 () Bool)

(declare-fun res!235042 () Bool)

(assert (=> b!406734 (=> (not res!235042) (not e!244365))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406734 (= res!235042 (or (= (select (arr!11709 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11709 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406735 () Bool)

(declare-fun e!244364 () Bool)

(declare-fun tp_is_empty!10321 () Bool)

(assert (=> b!406735 (= e!244364 tp_is_empty!10321)))

(declare-fun mapIsEmpty!17103 () Bool)

(declare-fun mapRes!17103 () Bool)

(assert (=> mapIsEmpty!17103 mapRes!17103))

(declare-fun b!406736 () Bool)

(declare-fun res!235036 () Bool)

(assert (=> b!406736 (=> (not res!235036) (not e!244365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24520 (_ BitVec 32)) Bool)

(assert (=> b!406736 (= res!235036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406737 () Bool)

(declare-fun e!244363 () Bool)

(assert (=> b!406737 (= e!244363 tp_is_empty!10321)))

(declare-fun mapNonEmpty!17103 () Bool)

(declare-fun tp!33222 () Bool)

(assert (=> mapNonEmpty!17103 (= mapRes!17103 (and tp!33222 e!244363))))

(declare-fun mapKey!17103 () (_ BitVec 32))

(declare-fun mapRest!17103 () (Array (_ BitVec 32) ValueCell!4817))

(declare-fun mapValue!17103 () ValueCell!4817)

(assert (=> mapNonEmpty!17103 (= (arr!11710 _values!549) (store mapRest!17103 mapKey!17103 mapValue!17103))))

(declare-fun b!406739 () Bool)

(declare-fun e!244366 () Bool)

(assert (=> b!406739 (= e!244366 (and e!244364 mapRes!17103))))

(declare-fun condMapEmpty!17103 () Bool)

(declare-fun mapDefault!17103 () ValueCell!4817)

(assert (=> b!406739 (= condMapEmpty!17103 (= (arr!11710 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4817)) mapDefault!17103)))))

(declare-fun b!406740 () Bool)

(declare-fun e!244361 () Bool)

(assert (=> b!406740 (= e!244365 e!244361)))

(declare-fun res!235037 () Bool)

(assert (=> b!406740 (=> (not res!235037) (not e!244361))))

(declare-fun lt!188562 () array!24520)

(assert (=> b!406740 (= res!235037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188562 mask!1025))))

(assert (=> b!406740 (= lt!188562 (array!24521 (store (arr!11709 _keys!709) i!563 k0!794) (size!12061 _keys!709)))))

(declare-fun b!406741 () Bool)

(declare-fun res!235043 () Bool)

(assert (=> b!406741 (=> (not res!235043) (not e!244365))))

(assert (=> b!406741 (= res!235043 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12061 _keys!709))))))

(declare-fun b!406742 () Bool)

(declare-fun res!235041 () Bool)

(assert (=> b!406742 (=> (not res!235041) (not e!244365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406742 (= res!235041 (validMask!0 mask!1025))))

(declare-fun res!235038 () Bool)

(assert (=> start!38888 (=> (not res!235038) (not e!244365))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38888 (= res!235038 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12061 _keys!709))))))

(assert (=> start!38888 e!244365))

(assert (=> start!38888 true))

(declare-fun array_inv!8638 (array!24522) Bool)

(assert (=> start!38888 (and (array_inv!8638 _values!549) e!244366)))

(declare-fun array_inv!8639 (array!24520) Bool)

(assert (=> start!38888 (array_inv!8639 _keys!709)))

(declare-fun b!406738 () Bool)

(declare-fun res!235040 () Bool)

(assert (=> b!406738 (=> (not res!235040) (not e!244365))))

(declare-datatypes ((List!6676 0))(
  ( (Nil!6673) (Cons!6672 (h!7528 (_ BitVec 64)) (t!11842 List!6676)) )
))
(declare-fun arrayNoDuplicates!0 (array!24520 (_ BitVec 32) List!6676) Bool)

(assert (=> b!406738 (= res!235040 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6673))))

(declare-fun b!406743 () Bool)

(assert (=> b!406743 (= e!244361 false)))

(declare-fun lt!188561 () Bool)

(assert (=> b!406743 (= lt!188561 (arrayNoDuplicates!0 lt!188562 #b00000000000000000000000000000000 Nil!6673))))

(declare-fun b!406744 () Bool)

(declare-fun res!235044 () Bool)

(assert (=> b!406744 (=> (not res!235044) (not e!244365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406744 (= res!235044 (validKeyInArray!0 k0!794))))

(assert (= (and start!38888 res!235038) b!406742))

(assert (= (and b!406742 res!235041) b!406732))

(assert (= (and b!406732 res!235035) b!406736))

(assert (= (and b!406736 res!235036) b!406738))

(assert (= (and b!406738 res!235040) b!406741))

(assert (= (and b!406741 res!235043) b!406744))

(assert (= (and b!406744 res!235044) b!406734))

(assert (= (and b!406734 res!235042) b!406733))

(assert (= (and b!406733 res!235039) b!406740))

(assert (= (and b!406740 res!235037) b!406743))

(assert (= (and b!406739 condMapEmpty!17103) mapIsEmpty!17103))

(assert (= (and b!406739 (not condMapEmpty!17103)) mapNonEmpty!17103))

(get-info :version)

(assert (= (and mapNonEmpty!17103 ((_ is ValueCellFull!4817) mapValue!17103)) b!406737))

(assert (= (and b!406739 ((_ is ValueCellFull!4817) mapDefault!17103)) b!406735))

(assert (= start!38888 b!406739))

(declare-fun m!398949 () Bool)

(assert (=> b!406744 m!398949))

(declare-fun m!398951 () Bool)

(assert (=> b!406742 m!398951))

(declare-fun m!398953 () Bool)

(assert (=> b!406740 m!398953))

(declare-fun m!398955 () Bool)

(assert (=> b!406740 m!398955))

(declare-fun m!398957 () Bool)

(assert (=> b!406738 m!398957))

(declare-fun m!398959 () Bool)

(assert (=> mapNonEmpty!17103 m!398959))

(declare-fun m!398961 () Bool)

(assert (=> b!406736 m!398961))

(declare-fun m!398963 () Bool)

(assert (=> b!406734 m!398963))

(declare-fun m!398965 () Bool)

(assert (=> b!406743 m!398965))

(declare-fun m!398967 () Bool)

(assert (=> start!38888 m!398967))

(declare-fun m!398969 () Bool)

(assert (=> start!38888 m!398969))

(declare-fun m!398971 () Bool)

(assert (=> b!406733 m!398971))

(check-sat (not b!406738) (not b!406744) (not mapNonEmpty!17103) tp_is_empty!10321 (not b!406743) (not b!406742) (not b!406740) (not start!38888) (not b!406736) (not b!406733))
(check-sat)
