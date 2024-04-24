; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33598 () Bool)

(assert start!33598)

(declare-fun b_free!6847 () Bool)

(declare-fun b_next!6847 () Bool)

(assert (=> start!33598 (= b_free!6847 (not b_next!6847))))

(declare-fun tp!24045 () Bool)

(declare-fun b_and!14041 () Bool)

(assert (=> start!33598 (= tp!24045 b_and!14041)))

(declare-fun b!333477 () Bool)

(declare-fun res!183725 () Bool)

(declare-fun e!204763 () Bool)

(assert (=> b!333477 (=> (not res!183725) (not e!204763))))

(declare-datatypes ((array!17192 0))(
  ( (array!17193 (arr!8126 (Array (_ BitVec 32) (_ BitVec 64))) (size!8478 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17192)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17192 (_ BitVec 32)) Bool)

(assert (=> b!333477 (= res!183725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333478 () Bool)

(declare-fun e!204764 () Bool)

(declare-fun e!204765 () Bool)

(declare-fun mapRes!11595 () Bool)

(assert (=> b!333478 (= e!204764 (and e!204765 mapRes!11595))))

(declare-fun condMapEmpty!11595 () Bool)

(declare-datatypes ((V!10043 0))(
  ( (V!10044 (val!3444 Int)) )
))
(declare-datatypes ((ValueCell!3056 0))(
  ( (ValueCellFull!3056 (v!5607 V!10043)) (EmptyCell!3056) )
))
(declare-datatypes ((array!17194 0))(
  ( (array!17195 (arr!8127 (Array (_ BitVec 32) ValueCell!3056)) (size!8479 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17194)

(declare-fun mapDefault!11595 () ValueCell!3056)

(assert (=> b!333478 (= condMapEmpty!11595 (= (arr!8127 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3056)) mapDefault!11595)))))

(declare-fun b!333479 () Bool)

(assert (=> b!333479 (= e!204763 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3105 0))(
  ( (MissingZero!3105 (index!14599 (_ BitVec 32))) (Found!3105 (index!14600 (_ BitVec 32))) (Intermediate!3105 (undefined!3917 Bool) (index!14601 (_ BitVec 32)) (x!33188 (_ BitVec 32))) (Undefined!3105) (MissingVacant!3105 (index!14602 (_ BitVec 32))) )
))
(declare-fun lt!159391 () SeekEntryResult!3105)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17192 (_ BitVec 32)) SeekEntryResult!3105)

(assert (=> b!333479 (= lt!159391 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11595 () Bool)

(assert (=> mapIsEmpty!11595 mapRes!11595))

(declare-fun b!333480 () Bool)

(declare-fun res!183724 () Bool)

(assert (=> b!333480 (=> (not res!183724) (not e!204763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333480 (= res!183724 (validKeyInArray!0 k0!1348))))

(declare-fun b!333482 () Bool)

(declare-fun res!183723 () Bool)

(assert (=> b!333482 (=> (not res!183723) (not e!204763))))

(declare-fun zeroValue!1467 () V!10043)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10043)

(declare-datatypes ((tuple2!4928 0))(
  ( (tuple2!4929 (_1!2475 (_ BitVec 64)) (_2!2475 V!10043)) )
))
(declare-datatypes ((List!4542 0))(
  ( (Nil!4539) (Cons!4538 (h!5394 tuple2!4928) (t!9622 List!4542)) )
))
(declare-datatypes ((ListLongMap!3843 0))(
  ( (ListLongMap!3844 (toList!1937 List!4542)) )
))
(declare-fun contains!2000 (ListLongMap!3843 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1469 (array!17192 array!17194 (_ BitVec 32) (_ BitVec 32) V!10043 V!10043 (_ BitVec 32) Int) ListLongMap!3843)

(assert (=> b!333482 (= res!183723 (not (contains!2000 (getCurrentListMap!1469 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333483 () Bool)

(declare-fun tp_is_empty!6799 () Bool)

(assert (=> b!333483 (= e!204765 tp_is_empty!6799)))

(declare-fun b!333484 () Bool)

(declare-fun res!183726 () Bool)

(assert (=> b!333484 (=> (not res!183726) (not e!204763))))

(declare-datatypes ((List!4543 0))(
  ( (Nil!4540) (Cons!4539 (h!5395 (_ BitVec 64)) (t!9623 List!4543)) )
))
(declare-fun arrayNoDuplicates!0 (array!17192 (_ BitVec 32) List!4543) Bool)

(assert (=> b!333484 (= res!183726 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4540))))

(declare-fun mapNonEmpty!11595 () Bool)

(declare-fun tp!24044 () Bool)

(declare-fun e!204767 () Bool)

(assert (=> mapNonEmpty!11595 (= mapRes!11595 (and tp!24044 e!204767))))

(declare-fun mapValue!11595 () ValueCell!3056)

(declare-fun mapKey!11595 () (_ BitVec 32))

(declare-fun mapRest!11595 () (Array (_ BitVec 32) ValueCell!3056))

(assert (=> mapNonEmpty!11595 (= (arr!8127 _values!1525) (store mapRest!11595 mapKey!11595 mapValue!11595))))

(declare-fun b!333485 () Bool)

(declare-fun res!183728 () Bool)

(assert (=> b!333485 (=> (not res!183728) (not e!204763))))

(assert (=> b!333485 (= res!183728 (and (= (size!8479 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8478 _keys!1895) (size!8479 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333481 () Bool)

(assert (=> b!333481 (= e!204767 tp_is_empty!6799)))

(declare-fun res!183727 () Bool)

(assert (=> start!33598 (=> (not res!183727) (not e!204763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33598 (= res!183727 (validMask!0 mask!2385))))

(assert (=> start!33598 e!204763))

(assert (=> start!33598 true))

(assert (=> start!33598 tp_is_empty!6799))

(assert (=> start!33598 tp!24045))

(declare-fun array_inv!6048 (array!17194) Bool)

(assert (=> start!33598 (and (array_inv!6048 _values!1525) e!204764)))

(declare-fun array_inv!6049 (array!17192) Bool)

(assert (=> start!33598 (array_inv!6049 _keys!1895)))

(assert (= (and start!33598 res!183727) b!333485))

(assert (= (and b!333485 res!183728) b!333477))

(assert (= (and b!333477 res!183725) b!333484))

(assert (= (and b!333484 res!183726) b!333480))

(assert (= (and b!333480 res!183724) b!333482))

(assert (= (and b!333482 res!183723) b!333479))

(assert (= (and b!333478 condMapEmpty!11595) mapIsEmpty!11595))

(assert (= (and b!333478 (not condMapEmpty!11595)) mapNonEmpty!11595))

(get-info :version)

(assert (= (and mapNonEmpty!11595 ((_ is ValueCellFull!3056) mapValue!11595)) b!333481))

(assert (= (and b!333478 ((_ is ValueCellFull!3056) mapDefault!11595)) b!333483))

(assert (= start!33598 b!333478))

(declare-fun m!337985 () Bool)

(assert (=> mapNonEmpty!11595 m!337985))

(declare-fun m!337987 () Bool)

(assert (=> start!33598 m!337987))

(declare-fun m!337989 () Bool)

(assert (=> start!33598 m!337989))

(declare-fun m!337991 () Bool)

(assert (=> start!33598 m!337991))

(declare-fun m!337993 () Bool)

(assert (=> b!333479 m!337993))

(declare-fun m!337995 () Bool)

(assert (=> b!333477 m!337995))

(declare-fun m!337997 () Bool)

(assert (=> b!333482 m!337997))

(assert (=> b!333482 m!337997))

(declare-fun m!337999 () Bool)

(assert (=> b!333482 m!337999))

(declare-fun m!338001 () Bool)

(assert (=> b!333484 m!338001))

(declare-fun m!338003 () Bool)

(assert (=> b!333480 m!338003))

(check-sat (not start!33598) tp_is_empty!6799 (not b!333477) (not b!333479) (not b!333482) (not mapNonEmpty!11595) (not b!333480) (not b!333484) b_and!14041 (not b_next!6847))
(check-sat b_and!14041 (not b_next!6847))
