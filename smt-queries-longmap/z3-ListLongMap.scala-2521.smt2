; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38946 () Bool)

(assert start!38946)

(declare-fun b!407639 () Bool)

(declare-fun res!235705 () Bool)

(declare-fun e!244793 () Bool)

(assert (=> b!407639 (=> (not res!235705) (not e!244793))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24611 0))(
  ( (array!24612 (arr!11755 (Array (_ BitVec 32) (_ BitVec 64))) (size!12107 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24611)

(assert (=> b!407639 (= res!235705 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12107 _keys!709))))))

(declare-fun b!407640 () Bool)

(declare-fun e!244790 () Bool)

(declare-fun tp_is_empty!10365 () Bool)

(assert (=> b!407640 (= e!244790 tp_is_empty!10365)))

(declare-fun b!407641 () Bool)

(declare-fun e!244791 () Bool)

(declare-fun mapRes!17169 () Bool)

(assert (=> b!407641 (= e!244791 (and e!244790 mapRes!17169))))

(declare-fun condMapEmpty!17169 () Bool)

(declare-datatypes ((V!14925 0))(
  ( (V!14926 (val!5227 Int)) )
))
(declare-datatypes ((ValueCell!4839 0))(
  ( (ValueCellFull!4839 (v!7474 V!14925)) (EmptyCell!4839) )
))
(declare-datatypes ((array!24613 0))(
  ( (array!24614 (arr!11756 (Array (_ BitVec 32) ValueCell!4839)) (size!12108 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24613)

(declare-fun mapDefault!17169 () ValueCell!4839)

(assert (=> b!407641 (= condMapEmpty!17169 (= (arr!11756 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4839)) mapDefault!17169)))))

(declare-fun b!407642 () Bool)

(declare-fun res!235707 () Bool)

(assert (=> b!407642 (=> (not res!235707) (not e!244793))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407642 (= res!235707 (validMask!0 mask!1025))))

(declare-fun b!407643 () Bool)

(declare-fun e!244792 () Bool)

(assert (=> b!407643 (= e!244793 e!244792)))

(declare-fun res!235698 () Bool)

(assert (=> b!407643 (=> (not res!235698) (not e!244792))))

(declare-fun lt!188675 () array!24611)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24611 (_ BitVec 32)) Bool)

(assert (=> b!407643 (= res!235698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188675 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!407643 (= lt!188675 (array!24612 (store (arr!11755 _keys!709) i!563 k0!794) (size!12107 _keys!709)))))

(declare-fun b!407644 () Bool)

(declare-fun res!235699 () Bool)

(assert (=> b!407644 (=> (not res!235699) (not e!244793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407644 (= res!235699 (validKeyInArray!0 k0!794))))

(declare-fun b!407645 () Bool)

(declare-fun e!244794 () Bool)

(assert (=> b!407645 (= e!244794 tp_is_empty!10365)))

(declare-fun b!407647 () Bool)

(declare-fun res!235704 () Bool)

(assert (=> b!407647 (=> (not res!235704) (not e!244793))))

(declare-fun arrayContainsKey!0 (array!24611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407647 (= res!235704 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407648 () Bool)

(declare-fun res!235706 () Bool)

(assert (=> b!407648 (=> (not res!235706) (not e!244793))))

(assert (=> b!407648 (= res!235706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407649 () Bool)

(declare-fun res!235703 () Bool)

(assert (=> b!407649 (=> (not res!235703) (not e!244793))))

(declare-datatypes ((List!6818 0))(
  ( (Nil!6815) (Cons!6814 (h!7670 (_ BitVec 64)) (t!11992 List!6818)) )
))
(declare-fun arrayNoDuplicates!0 (array!24611 (_ BitVec 32) List!6818) Bool)

(assert (=> b!407649 (= res!235703 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6815))))

(declare-fun mapNonEmpty!17169 () Bool)

(declare-fun tp!33288 () Bool)

(assert (=> mapNonEmpty!17169 (= mapRes!17169 (and tp!33288 e!244794))))

(declare-fun mapRest!17169 () (Array (_ BitVec 32) ValueCell!4839))

(declare-fun mapValue!17169 () ValueCell!4839)

(declare-fun mapKey!17169 () (_ BitVec 32))

(assert (=> mapNonEmpty!17169 (= (arr!11756 _values!549) (store mapRest!17169 mapKey!17169 mapValue!17169))))

(declare-fun b!407650 () Bool)

(declare-fun res!235700 () Bool)

(assert (=> b!407650 (=> (not res!235700) (not e!244793))))

(assert (=> b!407650 (= res!235700 (or (= (select (arr!11755 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11755 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17169 () Bool)

(assert (=> mapIsEmpty!17169 mapRes!17169))

(declare-fun b!407651 () Bool)

(assert (=> b!407651 (= e!244792 false)))

(declare-fun lt!188674 () Bool)

(assert (=> b!407651 (= lt!188674 (arrayNoDuplicates!0 lt!188675 #b00000000000000000000000000000000 Nil!6815))))

(declare-fun res!235702 () Bool)

(assert (=> start!38946 (=> (not res!235702) (not e!244793))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38946 (= res!235702 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12107 _keys!709))))))

(assert (=> start!38946 e!244793))

(assert (=> start!38946 true))

(declare-fun array_inv!8576 (array!24613) Bool)

(assert (=> start!38946 (and (array_inv!8576 _values!549) e!244791)))

(declare-fun array_inv!8577 (array!24611) Bool)

(assert (=> start!38946 (array_inv!8577 _keys!709)))

(declare-fun b!407646 () Bool)

(declare-fun res!235701 () Bool)

(assert (=> b!407646 (=> (not res!235701) (not e!244793))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407646 (= res!235701 (and (= (size!12108 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12107 _keys!709) (size!12108 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38946 res!235702) b!407642))

(assert (= (and b!407642 res!235707) b!407646))

(assert (= (and b!407646 res!235701) b!407648))

(assert (= (and b!407648 res!235706) b!407649))

(assert (= (and b!407649 res!235703) b!407639))

(assert (= (and b!407639 res!235705) b!407644))

(assert (= (and b!407644 res!235699) b!407650))

(assert (= (and b!407650 res!235700) b!407647))

(assert (= (and b!407647 res!235704) b!407643))

(assert (= (and b!407643 res!235698) b!407651))

(assert (= (and b!407641 condMapEmpty!17169) mapIsEmpty!17169))

(assert (= (and b!407641 (not condMapEmpty!17169)) mapNonEmpty!17169))

(get-info :version)

(assert (= (and mapNonEmpty!17169 ((_ is ValueCellFull!4839) mapValue!17169)) b!407645))

(assert (= (and b!407641 ((_ is ValueCellFull!4839) mapDefault!17169)) b!407640))

(assert (= start!38946 b!407641))

(declare-fun m!399247 () Bool)

(assert (=> b!407642 m!399247))

(declare-fun m!399249 () Bool)

(assert (=> start!38946 m!399249))

(declare-fun m!399251 () Bool)

(assert (=> start!38946 m!399251))

(declare-fun m!399253 () Bool)

(assert (=> b!407643 m!399253))

(declare-fun m!399255 () Bool)

(assert (=> b!407643 m!399255))

(declare-fun m!399257 () Bool)

(assert (=> b!407644 m!399257))

(declare-fun m!399259 () Bool)

(assert (=> mapNonEmpty!17169 m!399259))

(declare-fun m!399261 () Bool)

(assert (=> b!407648 m!399261))

(declare-fun m!399263 () Bool)

(assert (=> b!407650 m!399263))

(declare-fun m!399265 () Bool)

(assert (=> b!407651 m!399265))

(declare-fun m!399267 () Bool)

(assert (=> b!407649 m!399267))

(declare-fun m!399269 () Bool)

(assert (=> b!407647 m!399269))

(check-sat (not b!407648) tp_is_empty!10365 (not b!407642) (not b!407644) (not b!407649) (not start!38946) (not b!407651) (not b!407643) (not b!407647) (not mapNonEmpty!17169))
(check-sat)
