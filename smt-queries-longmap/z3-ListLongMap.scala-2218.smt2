; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36756 () Bool)

(assert start!36756)

(declare-fun b!366803 () Bool)

(declare-fun e!224508 () Bool)

(declare-fun tp_is_empty!8545 () Bool)

(assert (=> b!366803 (= e!224508 tp_is_empty!8545)))

(declare-fun b!366804 () Bool)

(declare-fun res!205315 () Bool)

(declare-fun e!224509 () Bool)

(assert (=> b!366804 (=> (not res!205315) (not e!224509))))

(declare-datatypes ((array!21033 0))(
  ( (array!21034 (arr!9985 (Array (_ BitVec 32) (_ BitVec 64))) (size!10338 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21033)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366804 (= res!205315 (or (= (select (arr!9985 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9985 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366805 () Bool)

(declare-fun res!205316 () Bool)

(assert (=> b!366805 (=> (not res!205316) (not e!224509))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366805 (= res!205316 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366806 () Bool)

(declare-fun res!205320 () Bool)

(assert (=> b!366806 (=> (not res!205320) (not e!224509))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21033 (_ BitVec 32)) Bool)

(assert (=> b!366806 (= res!205320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366807 () Bool)

(declare-fun res!205318 () Bool)

(assert (=> b!366807 (=> (not res!205318) (not e!224509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366807 (= res!205318 (validKeyInArray!0 k0!778))))

(declare-fun b!366808 () Bool)

(declare-fun e!224510 () Bool)

(assert (=> b!366808 (= e!224510 tp_is_empty!8545)))

(declare-fun b!366809 () Bool)

(declare-fun res!205314 () Bool)

(assert (=> b!366809 (=> (not res!205314) (not e!224509))))

(assert (=> b!366809 (= res!205314 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10338 _keys!658))))))

(declare-fun b!366810 () Bool)

(declare-fun res!205319 () Bool)

(assert (=> b!366810 (=> (not res!205319) (not e!224509))))

(declare-datatypes ((List!5524 0))(
  ( (Nil!5521) (Cons!5520 (h!6376 (_ BitVec 64)) (t!10665 List!5524)) )
))
(declare-fun arrayNoDuplicates!0 (array!21033 (_ BitVec 32) List!5524) Bool)

(assert (=> b!366810 (= res!205319 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5521))))

(declare-fun res!205322 () Bool)

(assert (=> start!36756 (=> (not res!205322) (not e!224509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36756 (= res!205322 (validMask!0 mask!970))))

(assert (=> start!36756 e!224509))

(assert (=> start!36756 true))

(declare-datatypes ((V!12499 0))(
  ( (V!12500 (val!4317 Int)) )
))
(declare-datatypes ((ValueCell!3929 0))(
  ( (ValueCellFull!3929 (v!6508 V!12499)) (EmptyCell!3929) )
))
(declare-datatypes ((array!21035 0))(
  ( (array!21036 (arr!9986 (Array (_ BitVec 32) ValueCell!3929)) (size!10339 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21035)

(declare-fun e!224513 () Bool)

(declare-fun array_inv!7400 (array!21035) Bool)

(assert (=> start!36756 (and (array_inv!7400 _values!506) e!224513)))

(declare-fun array_inv!7401 (array!21033) Bool)

(assert (=> start!36756 (array_inv!7401 _keys!658)))

(declare-fun mapIsEmpty!14382 () Bool)

(declare-fun mapRes!14382 () Bool)

(assert (=> mapIsEmpty!14382 mapRes!14382))

(declare-fun b!366811 () Bool)

(declare-fun e!224511 () Bool)

(assert (=> b!366811 (= e!224511 false)))

(declare-fun lt!169088 () Bool)

(declare-fun lt!169089 () array!21033)

(assert (=> b!366811 (= lt!169088 (arrayNoDuplicates!0 lt!169089 #b00000000000000000000000000000000 Nil!5521))))

(declare-fun b!366812 () Bool)

(assert (=> b!366812 (= e!224513 (and e!224510 mapRes!14382))))

(declare-fun condMapEmpty!14382 () Bool)

(declare-fun mapDefault!14382 () ValueCell!3929)

(assert (=> b!366812 (= condMapEmpty!14382 (= (arr!9986 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3929)) mapDefault!14382)))))

(declare-fun mapNonEmpty!14382 () Bool)

(declare-fun tp!28458 () Bool)

(assert (=> mapNonEmpty!14382 (= mapRes!14382 (and tp!28458 e!224508))))

(declare-fun mapValue!14382 () ValueCell!3929)

(declare-fun mapRest!14382 () (Array (_ BitVec 32) ValueCell!3929))

(declare-fun mapKey!14382 () (_ BitVec 32))

(assert (=> mapNonEmpty!14382 (= (arr!9986 _values!506) (store mapRest!14382 mapKey!14382 mapValue!14382))))

(declare-fun b!366813 () Bool)

(declare-fun res!205321 () Bool)

(assert (=> b!366813 (=> (not res!205321) (not e!224509))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366813 (= res!205321 (and (= (size!10339 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10338 _keys!658) (size!10339 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366814 () Bool)

(assert (=> b!366814 (= e!224509 e!224511)))

(declare-fun res!205317 () Bool)

(assert (=> b!366814 (=> (not res!205317) (not e!224511))))

(assert (=> b!366814 (= res!205317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169089 mask!970))))

(assert (=> b!366814 (= lt!169089 (array!21034 (store (arr!9985 _keys!658) i!548 k0!778) (size!10338 _keys!658)))))

(assert (= (and start!36756 res!205322) b!366813))

(assert (= (and b!366813 res!205321) b!366806))

(assert (= (and b!366806 res!205320) b!366810))

(assert (= (and b!366810 res!205319) b!366809))

(assert (= (and b!366809 res!205314) b!366807))

(assert (= (and b!366807 res!205318) b!366804))

(assert (= (and b!366804 res!205315) b!366805))

(assert (= (and b!366805 res!205316) b!366814))

(assert (= (and b!366814 res!205317) b!366811))

(assert (= (and b!366812 condMapEmpty!14382) mapIsEmpty!14382))

(assert (= (and b!366812 (not condMapEmpty!14382)) mapNonEmpty!14382))

(get-info :version)

(assert (= (and mapNonEmpty!14382 ((_ is ValueCellFull!3929) mapValue!14382)) b!366803))

(assert (= (and b!366812 ((_ is ValueCellFull!3929) mapDefault!14382)) b!366808))

(assert (= start!36756 b!366812))

(declare-fun m!363455 () Bool)

(assert (=> b!366804 m!363455))

(declare-fun m!363457 () Bool)

(assert (=> b!366807 m!363457))

(declare-fun m!363459 () Bool)

(assert (=> start!36756 m!363459))

(declare-fun m!363461 () Bool)

(assert (=> start!36756 m!363461))

(declare-fun m!363463 () Bool)

(assert (=> start!36756 m!363463))

(declare-fun m!363465 () Bool)

(assert (=> mapNonEmpty!14382 m!363465))

(declare-fun m!363467 () Bool)

(assert (=> b!366805 m!363467))

(declare-fun m!363469 () Bool)

(assert (=> b!366814 m!363469))

(declare-fun m!363471 () Bool)

(assert (=> b!366814 m!363471))

(declare-fun m!363473 () Bool)

(assert (=> b!366810 m!363473))

(declare-fun m!363475 () Bool)

(assert (=> b!366811 m!363475))

(declare-fun m!363477 () Bool)

(assert (=> b!366806 m!363477))

(check-sat tp_is_empty!8545 (not start!36756) (not mapNonEmpty!14382) (not b!366810) (not b!366806) (not b!366807) (not b!366811) (not b!366805) (not b!366814))
(check-sat)
