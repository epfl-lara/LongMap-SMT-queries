; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34780 () Bool)

(assert start!34780)

(declare-fun b_free!7579 () Bool)

(declare-fun b_next!7579 () Bool)

(assert (=> start!34780 (= b_free!7579 (not b_next!7579))))

(declare-fun tp!26303 () Bool)

(declare-fun b_and!14775 () Bool)

(assert (=> start!34780 (= tp!26303 b_and!14775)))

(declare-fun b!347838 () Bool)

(declare-fun res!192649 () Bool)

(declare-fun e!213128 () Bool)

(assert (=> b!347838 (=> (not res!192649) (not e!213128))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11019 0))(
  ( (V!11020 (val!3810 Int)) )
))
(declare-fun zeroValue!1467 () V!11019)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3422 0))(
  ( (ValueCellFull!3422 (v!5987 V!11019)) (EmptyCell!3422) )
))
(declare-datatypes ((array!18633 0))(
  ( (array!18634 (arr!8826 (Array (_ BitVec 32) ValueCell!3422)) (size!9179 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18633)

(declare-datatypes ((array!18635 0))(
  ( (array!18636 (arr!8827 (Array (_ BitVec 32) (_ BitVec 64))) (size!9180 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18635)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11019)

(declare-datatypes ((tuple2!5468 0))(
  ( (tuple2!5469 (_1!2745 (_ BitVec 64)) (_2!2745 V!11019)) )
))
(declare-datatypes ((List!5085 0))(
  ( (Nil!5082) (Cons!5081 (h!5937 tuple2!5468) (t!10206 List!5085)) )
))
(declare-datatypes ((ListLongMap!4371 0))(
  ( (ListLongMap!4372 (toList!2201 List!5085)) )
))
(declare-fun contains!2277 (ListLongMap!4371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1706 (array!18635 array!18633 (_ BitVec 32) (_ BitVec 32) V!11019 V!11019 (_ BitVec 32) Int) ListLongMap!4371)

(assert (=> b!347838 (= res!192649 (not (contains!2277 (getCurrentListMap!1706 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!347839 () Bool)

(declare-fun res!192651 () Bool)

(assert (=> b!347839 (=> (not res!192651) (not e!213128))))

(assert (=> b!347839 (= res!192651 (and (= (size!9179 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9180 _keys!1895) (size!9179 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347840 () Bool)

(declare-fun e!213127 () Bool)

(assert (=> b!347840 (= e!213128 e!213127)))

(declare-fun res!192648 () Bool)

(assert (=> b!347840 (=> (not res!192648) (not e!213127))))

(declare-datatypes ((SeekEntryResult!3401 0))(
  ( (MissingZero!3401 (index!15783 (_ BitVec 32))) (Found!3401 (index!15784 (_ BitVec 32))) (Intermediate!3401 (undefined!4213 Bool) (index!15785 (_ BitVec 32)) (x!34668 (_ BitVec 32))) (Undefined!3401) (MissingVacant!3401 (index!15786 (_ BitVec 32))) )
))
(declare-fun lt!163584 () SeekEntryResult!3401)

(get-info :version)

(assert (=> b!347840 (= res!192648 (and (not ((_ is Found!3401) lt!163584)) ((_ is MissingZero!3401) lt!163584)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18635 (_ BitVec 32)) SeekEntryResult!3401)

(assert (=> b!347840 (= lt!163584 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!192654 () Bool)

(assert (=> start!34780 (=> (not res!192654) (not e!213128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34780 (= res!192654 (validMask!0 mask!2385))))

(assert (=> start!34780 e!213128))

(assert (=> start!34780 true))

(declare-fun tp_is_empty!7531 () Bool)

(assert (=> start!34780 tp_is_empty!7531))

(assert (=> start!34780 tp!26303))

(declare-fun e!213132 () Bool)

(declare-fun array_inv!6552 (array!18633) Bool)

(assert (=> start!34780 (and (array_inv!6552 _values!1525) e!213132)))

(declare-fun array_inv!6553 (array!18635) Bool)

(assert (=> start!34780 (array_inv!6553 _keys!1895)))

(declare-fun b!347841 () Bool)

(declare-fun e!213131 () Bool)

(assert (=> b!347841 (= e!213131 tp_is_empty!7531)))

(declare-fun b!347842 () Bool)

(assert (=> b!347842 (= e!213127 false)))

(declare-fun lt!163583 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18635 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!347842 (= lt!163583 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!347843 () Bool)

(declare-fun e!213130 () Bool)

(assert (=> b!347843 (= e!213130 tp_is_empty!7531)))

(declare-fun b!347844 () Bool)

(declare-fun mapRes!12756 () Bool)

(assert (=> b!347844 (= e!213132 (and e!213130 mapRes!12756))))

(declare-fun condMapEmpty!12756 () Bool)

(declare-fun mapDefault!12756 () ValueCell!3422)

(assert (=> b!347844 (= condMapEmpty!12756 (= (arr!8826 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3422)) mapDefault!12756)))))

(declare-fun b!347845 () Bool)

(declare-fun res!192650 () Bool)

(assert (=> b!347845 (=> (not res!192650) (not e!213127))))

(declare-fun arrayContainsKey!0 (array!18635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347845 (= res!192650 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!347846 () Bool)

(declare-fun res!192655 () Bool)

(assert (=> b!347846 (=> (not res!192655) (not e!213128))))

(declare-datatypes ((List!5086 0))(
  ( (Nil!5083) (Cons!5082 (h!5938 (_ BitVec 64)) (t!10207 List!5086)) )
))
(declare-fun arrayNoDuplicates!0 (array!18635 (_ BitVec 32) List!5086) Bool)

(assert (=> b!347846 (= res!192655 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5083))))

(declare-fun b!347847 () Bool)

(declare-fun res!192653 () Bool)

(assert (=> b!347847 (=> (not res!192653) (not e!213128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18635 (_ BitVec 32)) Bool)

(assert (=> b!347847 (= res!192653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12756 () Bool)

(assert (=> mapIsEmpty!12756 mapRes!12756))

(declare-fun b!347848 () Bool)

(declare-fun res!192652 () Bool)

(assert (=> b!347848 (=> (not res!192652) (not e!213128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347848 (= res!192652 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12756 () Bool)

(declare-fun tp!26304 () Bool)

(assert (=> mapNonEmpty!12756 (= mapRes!12756 (and tp!26304 e!213131))))

(declare-fun mapKey!12756 () (_ BitVec 32))

(declare-fun mapRest!12756 () (Array (_ BitVec 32) ValueCell!3422))

(declare-fun mapValue!12756 () ValueCell!3422)

(assert (=> mapNonEmpty!12756 (= (arr!8826 _values!1525) (store mapRest!12756 mapKey!12756 mapValue!12756))))

(assert (= (and start!34780 res!192654) b!347839))

(assert (= (and b!347839 res!192651) b!347847))

(assert (= (and b!347847 res!192653) b!347846))

(assert (= (and b!347846 res!192655) b!347848))

(assert (= (and b!347848 res!192652) b!347838))

(assert (= (and b!347838 res!192649) b!347840))

(assert (= (and b!347840 res!192648) b!347845))

(assert (= (and b!347845 res!192650) b!347842))

(assert (= (and b!347844 condMapEmpty!12756) mapIsEmpty!12756))

(assert (= (and b!347844 (not condMapEmpty!12756)) mapNonEmpty!12756))

(assert (= (and mapNonEmpty!12756 ((_ is ValueCellFull!3422) mapValue!12756)) b!347841))

(assert (= (and b!347844 ((_ is ValueCellFull!3422) mapDefault!12756)) b!347843))

(assert (= start!34780 b!347844))

(declare-fun m!348243 () Bool)

(assert (=> b!347846 m!348243))

(declare-fun m!348245 () Bool)

(assert (=> b!347840 m!348245))

(declare-fun m!348247 () Bool)

(assert (=> b!347845 m!348247))

(declare-fun m!348249 () Bool)

(assert (=> b!347847 m!348249))

(declare-fun m!348251 () Bool)

(assert (=> b!347848 m!348251))

(declare-fun m!348253 () Bool)

(assert (=> b!347838 m!348253))

(assert (=> b!347838 m!348253))

(declare-fun m!348255 () Bool)

(assert (=> b!347838 m!348255))

(declare-fun m!348257 () Bool)

(assert (=> b!347842 m!348257))

(declare-fun m!348259 () Bool)

(assert (=> mapNonEmpty!12756 m!348259))

(declare-fun m!348261 () Bool)

(assert (=> start!34780 m!348261))

(declare-fun m!348263 () Bool)

(assert (=> start!34780 m!348263))

(declare-fun m!348265 () Bool)

(assert (=> start!34780 m!348265))

(check-sat (not b!347845) (not b!347840) (not b!347842) (not b_next!7579) b_and!14775 (not b!347848) (not mapNonEmpty!12756) (not start!34780) (not b!347846) tp_is_empty!7531 (not b!347838) (not b!347847))
(check-sat b_and!14775 (not b_next!7579))
