; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34972 () Bool)

(assert start!34972)

(declare-fun b_free!7675 () Bool)

(declare-fun b_next!7675 () Bool)

(assert (=> start!34972 (= b_free!7675 (not b_next!7675))))

(declare-fun tp!26604 () Bool)

(declare-fun b_and!14919 () Bool)

(assert (=> start!34972 (= tp!26604 b_and!14919)))

(declare-fun b!350328 () Bool)

(declare-fun e!214597 () Bool)

(assert (=> b!350328 (= e!214597 false)))

(declare-fun lt!164589 () (_ BitVec 32))

(declare-datatypes ((array!18830 0))(
  ( (array!18831 (arr!8920 (Array (_ BitVec 32) (_ BitVec 64))) (size!9272 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18830)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18830 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350328 (= lt!164589 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350329 () Bool)

(declare-fun res!194153 () Bool)

(declare-fun e!214594 () Bool)

(assert (=> b!350329 (=> (not res!194153) (not e!214594))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18830 (_ BitVec 32)) Bool)

(assert (=> b!350329 (= res!194153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12912 () Bool)

(declare-fun mapRes!12912 () Bool)

(assert (=> mapIsEmpty!12912 mapRes!12912))

(declare-fun res!194151 () Bool)

(assert (=> start!34972 (=> (not res!194151) (not e!214594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34972 (= res!194151 (validMask!0 mask!2385))))

(assert (=> start!34972 e!214594))

(assert (=> start!34972 true))

(declare-fun tp_is_empty!7627 () Bool)

(assert (=> start!34972 tp_is_empty!7627))

(assert (=> start!34972 tp!26604))

(declare-datatypes ((V!11147 0))(
  ( (V!11148 (val!3858 Int)) )
))
(declare-datatypes ((ValueCell!3470 0))(
  ( (ValueCellFull!3470 (v!6046 V!11147)) (EmptyCell!3470) )
))
(declare-datatypes ((array!18832 0))(
  ( (array!18833 (arr!8921 (Array (_ BitVec 32) ValueCell!3470)) (size!9273 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18832)

(declare-fun e!214598 () Bool)

(declare-fun array_inv!6592 (array!18832) Bool)

(assert (=> start!34972 (and (array_inv!6592 _values!1525) e!214598)))

(declare-fun array_inv!6593 (array!18830) Bool)

(assert (=> start!34972 (array_inv!6593 _keys!1895)))

(declare-fun b!350330 () Bool)

(declare-fun e!214595 () Bool)

(assert (=> b!350330 (= e!214595 tp_is_empty!7627)))

(declare-fun b!350331 () Bool)

(declare-fun res!194152 () Bool)

(assert (=> b!350331 (=> (not res!194152) (not e!214594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350331 (= res!194152 (validKeyInArray!0 k0!1348))))

(declare-fun b!350332 () Bool)

(declare-fun res!194155 () Bool)

(assert (=> b!350332 (=> (not res!194155) (not e!214597))))

(declare-fun arrayContainsKey!0 (array!18830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350332 (= res!194155 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350333 () Bool)

(assert (=> b!350333 (= e!214598 (and e!214595 mapRes!12912))))

(declare-fun condMapEmpty!12912 () Bool)

(declare-fun mapDefault!12912 () ValueCell!3470)

(assert (=> b!350333 (= condMapEmpty!12912 (= (arr!8921 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3470)) mapDefault!12912)))))

(declare-fun b!350334 () Bool)

(declare-fun res!194156 () Bool)

(assert (=> b!350334 (=> (not res!194156) (not e!214594))))

(declare-fun zeroValue!1467 () V!11147)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11147)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5488 0))(
  ( (tuple2!5489 (_1!2755 (_ BitVec 64)) (_2!2755 V!11147)) )
))
(declare-datatypes ((List!5093 0))(
  ( (Nil!5090) (Cons!5089 (h!5945 tuple2!5488) (t!10223 List!5093)) )
))
(declare-datatypes ((ListLongMap!4403 0))(
  ( (ListLongMap!4404 (toList!2217 List!5093)) )
))
(declare-fun contains!2305 (ListLongMap!4403 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1745 (array!18830 array!18832 (_ BitVec 32) (_ BitVec 32) V!11147 V!11147 (_ BitVec 32) Int) ListLongMap!4403)

(assert (=> b!350334 (= res!194156 (not (contains!2305 (getCurrentListMap!1745 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350335 () Bool)

(declare-fun res!194157 () Bool)

(assert (=> b!350335 (=> (not res!194157) (not e!214594))))

(assert (=> b!350335 (= res!194157 (and (= (size!9273 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9272 _keys!1895) (size!9273 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350336 () Bool)

(assert (=> b!350336 (= e!214594 e!214597)))

(declare-fun res!194150 () Bool)

(assert (=> b!350336 (=> (not res!194150) (not e!214597))))

(declare-datatypes ((SeekEntryResult!3391 0))(
  ( (MissingZero!3391 (index!15743 (_ BitVec 32))) (Found!3391 (index!15744 (_ BitVec 32))) (Intermediate!3391 (undefined!4203 Bool) (index!15745 (_ BitVec 32)) (x!34828 (_ BitVec 32))) (Undefined!3391) (MissingVacant!3391 (index!15746 (_ BitVec 32))) )
))
(declare-fun lt!164590 () SeekEntryResult!3391)

(get-info :version)

(assert (=> b!350336 (= res!194150 (and (not ((_ is Found!3391) lt!164590)) (not ((_ is MissingZero!3391) lt!164590)) ((_ is MissingVacant!3391) lt!164590)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18830 (_ BitVec 32)) SeekEntryResult!3391)

(assert (=> b!350336 (= lt!164590 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12912 () Bool)

(declare-fun tp!26603 () Bool)

(declare-fun e!214599 () Bool)

(assert (=> mapNonEmpty!12912 (= mapRes!12912 (and tp!26603 e!214599))))

(declare-fun mapValue!12912 () ValueCell!3470)

(declare-fun mapKey!12912 () (_ BitVec 32))

(declare-fun mapRest!12912 () (Array (_ BitVec 32) ValueCell!3470))

(assert (=> mapNonEmpty!12912 (= (arr!8921 _values!1525) (store mapRest!12912 mapKey!12912 mapValue!12912))))

(declare-fun b!350337 () Bool)

(assert (=> b!350337 (= e!214599 tp_is_empty!7627)))

(declare-fun b!350338 () Bool)

(declare-fun res!194154 () Bool)

(assert (=> b!350338 (=> (not res!194154) (not e!214594))))

(declare-datatypes ((List!5094 0))(
  ( (Nil!5091) (Cons!5090 (h!5946 (_ BitVec 64)) (t!10224 List!5094)) )
))
(declare-fun arrayNoDuplicates!0 (array!18830 (_ BitVec 32) List!5094) Bool)

(assert (=> b!350338 (= res!194154 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5091))))

(assert (= (and start!34972 res!194151) b!350335))

(assert (= (and b!350335 res!194157) b!350329))

(assert (= (and b!350329 res!194153) b!350338))

(assert (= (and b!350338 res!194154) b!350331))

(assert (= (and b!350331 res!194152) b!350334))

(assert (= (and b!350334 res!194156) b!350336))

(assert (= (and b!350336 res!194150) b!350332))

(assert (= (and b!350332 res!194155) b!350328))

(assert (= (and b!350333 condMapEmpty!12912) mapIsEmpty!12912))

(assert (= (and b!350333 (not condMapEmpty!12912)) mapNonEmpty!12912))

(assert (= (and mapNonEmpty!12912 ((_ is ValueCellFull!3470) mapValue!12912)) b!350337))

(assert (= (and b!350333 ((_ is ValueCellFull!3470) mapDefault!12912)) b!350330))

(assert (= start!34972 b!350333))

(declare-fun m!350817 () Bool)

(assert (=> mapNonEmpty!12912 m!350817))

(declare-fun m!350819 () Bool)

(assert (=> b!350334 m!350819))

(assert (=> b!350334 m!350819))

(declare-fun m!350821 () Bool)

(assert (=> b!350334 m!350821))

(declare-fun m!350823 () Bool)

(assert (=> b!350331 m!350823))

(declare-fun m!350825 () Bool)

(assert (=> b!350338 m!350825))

(declare-fun m!350827 () Bool)

(assert (=> b!350332 m!350827))

(declare-fun m!350829 () Bool)

(assert (=> start!34972 m!350829))

(declare-fun m!350831 () Bool)

(assert (=> start!34972 m!350831))

(declare-fun m!350833 () Bool)

(assert (=> start!34972 m!350833))

(declare-fun m!350835 () Bool)

(assert (=> b!350336 m!350835))

(declare-fun m!350837 () Bool)

(assert (=> b!350329 m!350837))

(declare-fun m!350839 () Bool)

(assert (=> b!350328 m!350839))

(check-sat (not b!350336) (not mapNonEmpty!12912) (not b!350329) (not b!350338) tp_is_empty!7627 (not start!34972) (not b_next!7675) b_and!14919 (not b!350332) (not b!350328) (not b!350334) (not b!350331))
(check-sat b_and!14919 (not b_next!7675))
