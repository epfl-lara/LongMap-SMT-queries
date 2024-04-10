; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38802 () Bool)

(assert start!38802)

(declare-fun mapIsEmpty!16953 () Bool)

(declare-fun mapRes!16953 () Bool)

(assert (=> mapIsEmpty!16953 mapRes!16953))

(declare-fun b!404831 () Bool)

(declare-fun res!233540 () Bool)

(declare-fun e!243495 () Bool)

(assert (=> b!404831 (=> (not res!233540) (not e!243495))))

(declare-datatypes ((array!24337 0))(
  ( (array!24338 (arr!11618 (Array (_ BitVec 32) (_ BitVec 64))) (size!11970 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24337)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14733 0))(
  ( (V!14734 (val!5155 Int)) )
))
(declare-datatypes ((ValueCell!4767 0))(
  ( (ValueCellFull!4767 (v!7402 V!14733)) (EmptyCell!4767) )
))
(declare-datatypes ((array!24339 0))(
  ( (array!24340 (arr!11619 (Array (_ BitVec 32) ValueCell!4767)) (size!11971 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24339)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!404831 (= res!233540 (and (= (size!11971 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11970 _keys!709) (size!11971 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404832 () Bool)

(declare-fun e!243498 () Bool)

(assert (=> b!404832 (= e!243495 e!243498)))

(declare-fun res!233541 () Bool)

(assert (=> b!404832 (=> (not res!233541) (not e!243498))))

(declare-fun lt!188243 () array!24337)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24337 (_ BitVec 32)) Bool)

(assert (=> b!404832 (= res!233541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188243 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404832 (= lt!188243 (array!24338 (store (arr!11618 _keys!709) i!563 k0!794) (size!11970 _keys!709)))))

(declare-fun res!233547 () Bool)

(assert (=> start!38802 (=> (not res!233547) (not e!243495))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38802 (= res!233547 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11970 _keys!709))))))

(assert (=> start!38802 e!243495))

(assert (=> start!38802 true))

(declare-fun e!243497 () Bool)

(declare-fun array_inv!8496 (array!24339) Bool)

(assert (=> start!38802 (and (array_inv!8496 _values!549) e!243497)))

(declare-fun array_inv!8497 (array!24337) Bool)

(assert (=> start!38802 (array_inv!8497 _keys!709)))

(declare-fun b!404833 () Bool)

(declare-fun res!233545 () Bool)

(assert (=> b!404833 (=> (not res!233545) (not e!243495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404833 (= res!233545 (validKeyInArray!0 k0!794))))

(declare-fun b!404834 () Bool)

(declare-fun res!233546 () Bool)

(assert (=> b!404834 (=> (not res!233546) (not e!243495))))

(declare-fun arrayContainsKey!0 (array!24337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404834 (= res!233546 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404835 () Bool)

(declare-fun res!233543 () Bool)

(assert (=> b!404835 (=> (not res!233543) (not e!243495))))

(assert (=> b!404835 (= res!233543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404836 () Bool)

(declare-fun e!243493 () Bool)

(declare-fun tp_is_empty!10221 () Bool)

(assert (=> b!404836 (= e!243493 tp_is_empty!10221)))

(declare-fun b!404837 () Bool)

(assert (=> b!404837 (= e!243498 false)))

(declare-fun lt!188242 () Bool)

(declare-datatypes ((List!6762 0))(
  ( (Nil!6759) (Cons!6758 (h!7614 (_ BitVec 64)) (t!11936 List!6762)) )
))
(declare-fun arrayNoDuplicates!0 (array!24337 (_ BitVec 32) List!6762) Bool)

(assert (=> b!404837 (= lt!188242 (arrayNoDuplicates!0 lt!188243 #b00000000000000000000000000000000 Nil!6759))))

(declare-fun b!404838 () Bool)

(declare-fun e!243496 () Bool)

(assert (=> b!404838 (= e!243496 tp_is_empty!10221)))

(declare-fun mapNonEmpty!16953 () Bool)

(declare-fun tp!33072 () Bool)

(assert (=> mapNonEmpty!16953 (= mapRes!16953 (and tp!33072 e!243493))))

(declare-fun mapRest!16953 () (Array (_ BitVec 32) ValueCell!4767))

(declare-fun mapValue!16953 () ValueCell!4767)

(declare-fun mapKey!16953 () (_ BitVec 32))

(assert (=> mapNonEmpty!16953 (= (arr!11619 _values!549) (store mapRest!16953 mapKey!16953 mapValue!16953))))

(declare-fun b!404839 () Bool)

(declare-fun res!233542 () Bool)

(assert (=> b!404839 (=> (not res!233542) (not e!243495))))

(assert (=> b!404839 (= res!233542 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11970 _keys!709))))))

(declare-fun b!404840 () Bool)

(assert (=> b!404840 (= e!243497 (and e!243496 mapRes!16953))))

(declare-fun condMapEmpty!16953 () Bool)

(declare-fun mapDefault!16953 () ValueCell!4767)

(assert (=> b!404840 (= condMapEmpty!16953 (= (arr!11619 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4767)) mapDefault!16953)))))

(declare-fun b!404841 () Bool)

(declare-fun res!233544 () Bool)

(assert (=> b!404841 (=> (not res!233544) (not e!243495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404841 (= res!233544 (validMask!0 mask!1025))))

(declare-fun b!404842 () Bool)

(declare-fun res!233539 () Bool)

(assert (=> b!404842 (=> (not res!233539) (not e!243495))))

(assert (=> b!404842 (= res!233539 (or (= (select (arr!11618 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11618 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404843 () Bool)

(declare-fun res!233538 () Bool)

(assert (=> b!404843 (=> (not res!233538) (not e!243495))))

(assert (=> b!404843 (= res!233538 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6759))))

(assert (= (and start!38802 res!233547) b!404841))

(assert (= (and b!404841 res!233544) b!404831))

(assert (= (and b!404831 res!233540) b!404835))

(assert (= (and b!404835 res!233543) b!404843))

(assert (= (and b!404843 res!233538) b!404839))

(assert (= (and b!404839 res!233542) b!404833))

(assert (= (and b!404833 res!233545) b!404842))

(assert (= (and b!404842 res!233539) b!404834))

(assert (= (and b!404834 res!233546) b!404832))

(assert (= (and b!404832 res!233541) b!404837))

(assert (= (and b!404840 condMapEmpty!16953) mapIsEmpty!16953))

(assert (= (and b!404840 (not condMapEmpty!16953)) mapNonEmpty!16953))

(get-info :version)

(assert (= (and mapNonEmpty!16953 ((_ is ValueCellFull!4767) mapValue!16953)) b!404836))

(assert (= (and b!404840 ((_ is ValueCellFull!4767) mapDefault!16953)) b!404838))

(assert (= start!38802 b!404840))

(declare-fun m!397519 () Bool)

(assert (=> b!404841 m!397519))

(declare-fun m!397521 () Bool)

(assert (=> b!404843 m!397521))

(declare-fun m!397523 () Bool)

(assert (=> b!404834 m!397523))

(declare-fun m!397525 () Bool)

(assert (=> b!404837 m!397525))

(declare-fun m!397527 () Bool)

(assert (=> mapNonEmpty!16953 m!397527))

(declare-fun m!397529 () Bool)

(assert (=> b!404835 m!397529))

(declare-fun m!397531 () Bool)

(assert (=> b!404842 m!397531))

(declare-fun m!397533 () Bool)

(assert (=> b!404833 m!397533))

(declare-fun m!397535 () Bool)

(assert (=> start!38802 m!397535))

(declare-fun m!397537 () Bool)

(assert (=> start!38802 m!397537))

(declare-fun m!397539 () Bool)

(assert (=> b!404832 m!397539))

(declare-fun m!397541 () Bool)

(assert (=> b!404832 m!397541))

(check-sat (not b!404834) (not b!404841) (not b!404837) (not mapNonEmpty!16953) (not b!404843) tp_is_empty!10221 (not b!404832) (not start!38802) (not b!404835) (not b!404833))
(check-sat)
