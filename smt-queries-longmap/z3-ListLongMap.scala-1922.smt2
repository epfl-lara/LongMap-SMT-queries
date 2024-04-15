; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34164 () Bool)

(assert start!34164)

(declare-fun b_free!7201 () Bool)

(declare-fun b_next!7201 () Bool)

(assert (=> start!34164 (= b_free!7201 (not b_next!7201))))

(declare-fun tp!25136 () Bool)

(declare-fun b_and!14375 () Bool)

(assert (=> start!34164 (= tp!25136 b_and!14375)))

(declare-fun b!340385 () Bool)

(declare-fun res!188058 () Bool)

(declare-fun e!208796 () Bool)

(assert (=> b!340385 (=> (not res!188058) (not e!208796))))

(declare-datatypes ((array!17881 0))(
  ( (array!17882 (arr!8461 (Array (_ BitVec 32) (_ BitVec 64))) (size!8814 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17881)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17881 (_ BitVec 32)) Bool)

(assert (=> b!340385 (= res!188058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340386 () Bool)

(declare-fun res!188061 () Bool)

(assert (=> b!340386 (=> (not res!188061) (not e!208796))))

(declare-datatypes ((V!10515 0))(
  ( (V!10516 (val!3621 Int)) )
))
(declare-datatypes ((ValueCell!3233 0))(
  ( (ValueCellFull!3233 (v!5787 V!10515)) (EmptyCell!3233) )
))
(declare-datatypes ((array!17883 0))(
  ( (array!17884 (arr!8462 (Array (_ BitVec 32) ValueCell!3233)) (size!8815 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17883)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340386 (= res!188061 (and (= (size!8815 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8814 _keys!1895) (size!8815 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!188059 () Bool)

(assert (=> start!34164 (=> (not res!188059) (not e!208796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34164 (= res!188059 (validMask!0 mask!2385))))

(assert (=> start!34164 e!208796))

(assert (=> start!34164 true))

(declare-fun tp_is_empty!7153 () Bool)

(assert (=> start!34164 tp_is_empty!7153))

(assert (=> start!34164 tp!25136))

(declare-fun e!208797 () Bool)

(declare-fun array_inv!6296 (array!17883) Bool)

(assert (=> start!34164 (and (array_inv!6296 _values!1525) e!208797)))

(declare-fun array_inv!6297 (array!17881) Bool)

(assert (=> start!34164 (array_inv!6297 _keys!1895)))

(declare-fun b!340387 () Bool)

(declare-fun res!188062 () Bool)

(assert (=> b!340387 (=> (not res!188062) (not e!208796))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10515)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10515)

(declare-datatypes ((tuple2!5192 0))(
  ( (tuple2!5193 (_1!2607 (_ BitVec 64)) (_2!2607 V!10515)) )
))
(declare-datatypes ((List!4816 0))(
  ( (Nil!4813) (Cons!4812 (h!5668 tuple2!5192) (t!9915 List!4816)) )
))
(declare-datatypes ((ListLongMap!4095 0))(
  ( (ListLongMap!4096 (toList!2063 List!4816)) )
))
(declare-fun contains!2128 (ListLongMap!4095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1569 (array!17881 array!17883 (_ BitVec 32) (_ BitVec 32) V!10515 V!10515 (_ BitVec 32) Int) ListLongMap!4095)

(assert (=> b!340387 (= res!188062 (not (contains!2128 (getCurrentListMap!1569 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340388 () Bool)

(declare-fun res!188063 () Bool)

(assert (=> b!340388 (=> (not res!188063) (not e!208796))))

(declare-datatypes ((List!4817 0))(
  ( (Nil!4814) (Cons!4813 (h!5669 (_ BitVec 64)) (t!9916 List!4817)) )
))
(declare-fun arrayNoDuplicates!0 (array!17881 (_ BitVec 32) List!4817) Bool)

(assert (=> b!340388 (= res!188063 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4814))))

(declare-fun b!340389 () Bool)

(declare-fun res!188057 () Bool)

(declare-fun e!208794 () Bool)

(assert (=> b!340389 (=> (not res!188057) (not e!208794))))

(declare-fun arrayContainsKey!0 (array!17881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340389 (= res!188057 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12156 () Bool)

(declare-fun mapRes!12156 () Bool)

(assert (=> mapIsEmpty!12156 mapRes!12156))

(declare-fun b!340390 () Bool)

(assert (=> b!340390 (= e!208796 e!208794)))

(declare-fun res!188056 () Bool)

(assert (=> b!340390 (=> (not res!188056) (not e!208794))))

(declare-datatypes ((SeekEntryResult!3258 0))(
  ( (MissingZero!3258 (index!15211 (_ BitVec 32))) (Found!3258 (index!15212 (_ BitVec 32))) (Intermediate!3258 (undefined!4070 Bool) (index!15213 (_ BitVec 32)) (x!33911 (_ BitVec 32))) (Undefined!3258) (MissingVacant!3258 (index!15214 (_ BitVec 32))) )
))
(declare-fun lt!161394 () SeekEntryResult!3258)

(get-info :version)

(assert (=> b!340390 (= res!188056 (and (not ((_ is Found!3258) lt!161394)) (not ((_ is MissingZero!3258) lt!161394)) ((_ is MissingVacant!3258) lt!161394)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17881 (_ BitVec 32)) SeekEntryResult!3258)

(assert (=> b!340390 (= lt!161394 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340391 () Bool)

(declare-fun res!188060 () Bool)

(assert (=> b!340391 (=> (not res!188060) (not e!208796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340391 (= res!188060 (validKeyInArray!0 k0!1348))))

(declare-fun b!340392 () Bool)

(declare-fun e!208798 () Bool)

(assert (=> b!340392 (= e!208798 tp_is_empty!7153)))

(declare-fun b!340393 () Bool)

(assert (=> b!340393 (= e!208797 (and e!208798 mapRes!12156))))

(declare-fun condMapEmpty!12156 () Bool)

(declare-fun mapDefault!12156 () ValueCell!3233)

(assert (=> b!340393 (= condMapEmpty!12156 (= (arr!8462 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3233)) mapDefault!12156)))))

(declare-fun mapNonEmpty!12156 () Bool)

(declare-fun tp!25137 () Bool)

(declare-fun e!208793 () Bool)

(assert (=> mapNonEmpty!12156 (= mapRes!12156 (and tp!25137 e!208793))))

(declare-fun mapKey!12156 () (_ BitVec 32))

(declare-fun mapRest!12156 () (Array (_ BitVec 32) ValueCell!3233))

(declare-fun mapValue!12156 () ValueCell!3233)

(assert (=> mapNonEmpty!12156 (= (arr!8462 _values!1525) (store mapRest!12156 mapKey!12156 mapValue!12156))))

(declare-fun b!340394 () Bool)

(assert (=> b!340394 (= e!208793 tp_is_empty!7153)))

(declare-fun b!340395 () Bool)

(assert (=> b!340395 (= e!208794 false)))

(declare-fun lt!161393 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17881 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340395 (= lt!161393 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34164 res!188059) b!340386))

(assert (= (and b!340386 res!188061) b!340385))

(assert (= (and b!340385 res!188058) b!340388))

(assert (= (and b!340388 res!188063) b!340391))

(assert (= (and b!340391 res!188060) b!340387))

(assert (= (and b!340387 res!188062) b!340390))

(assert (= (and b!340390 res!188056) b!340389))

(assert (= (and b!340389 res!188057) b!340395))

(assert (= (and b!340393 condMapEmpty!12156) mapIsEmpty!12156))

(assert (= (and b!340393 (not condMapEmpty!12156)) mapNonEmpty!12156))

(assert (= (and mapNonEmpty!12156 ((_ is ValueCellFull!3233) mapValue!12156)) b!340394))

(assert (= (and b!340393 ((_ is ValueCellFull!3233) mapDefault!12156)) b!340392))

(assert (= start!34164 b!340393))

(declare-fun m!342573 () Bool)

(assert (=> b!340389 m!342573))

(declare-fun m!342575 () Bool)

(assert (=> b!340388 m!342575))

(declare-fun m!342577 () Bool)

(assert (=> mapNonEmpty!12156 m!342577))

(declare-fun m!342579 () Bool)

(assert (=> b!340390 m!342579))

(declare-fun m!342581 () Bool)

(assert (=> b!340391 m!342581))

(declare-fun m!342583 () Bool)

(assert (=> b!340385 m!342583))

(declare-fun m!342585 () Bool)

(assert (=> start!34164 m!342585))

(declare-fun m!342587 () Bool)

(assert (=> start!34164 m!342587))

(declare-fun m!342589 () Bool)

(assert (=> start!34164 m!342589))

(declare-fun m!342591 () Bool)

(assert (=> b!340387 m!342591))

(assert (=> b!340387 m!342591))

(declare-fun m!342593 () Bool)

(assert (=> b!340387 m!342593))

(declare-fun m!342595 () Bool)

(assert (=> b!340395 m!342595))

(check-sat (not b!340395) (not b!340387) (not b!340388) (not b!340385) (not mapNonEmpty!12156) (not b!340390) b_and!14375 (not b!340389) (not b_next!7201) tp_is_empty!7153 (not b!340391) (not start!34164))
(check-sat b_and!14375 (not b_next!7201))
