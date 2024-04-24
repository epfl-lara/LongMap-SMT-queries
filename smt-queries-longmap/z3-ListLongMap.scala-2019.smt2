; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35176 () Bool)

(assert start!35176)

(declare-fun b_free!7783 () Bool)

(declare-fun b_next!7783 () Bool)

(assert (=> start!35176 (= b_free!7783 (not b_next!7783))))

(declare-fun tp!26940 () Bool)

(declare-fun b_and!15035 () Bool)

(assert (=> start!35176 (= tp!26940 b_and!15035)))

(declare-fun b!352727 () Bool)

(declare-fun e!215989 () Bool)

(declare-fun e!215993 () Bool)

(declare-fun mapRes!13086 () Bool)

(assert (=> b!352727 (= e!215989 (and e!215993 mapRes!13086))))

(declare-fun condMapEmpty!13086 () Bool)

(declare-datatypes ((V!11291 0))(
  ( (V!11292 (val!3912 Int)) )
))
(declare-datatypes ((ValueCell!3524 0))(
  ( (ValueCellFull!3524 (v!6104 V!11291)) (EmptyCell!3524) )
))
(declare-datatypes ((array!19050 0))(
  ( (array!19051 (arr!9026 (Array (_ BitVec 32) ValueCell!3524)) (size!9378 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19050)

(declare-fun mapDefault!13086 () ValueCell!3524)

(assert (=> b!352727 (= condMapEmpty!13086 (= (arr!9026 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3524)) mapDefault!13086)))))

(declare-fun b!352728 () Bool)

(declare-fun res!195622 () Bool)

(declare-fun e!215991 () Bool)

(assert (=> b!352728 (=> (not res!195622) (not e!215991))))

(declare-datatypes ((array!19052 0))(
  ( (array!19053 (arr!9027 (Array (_ BitVec 32) (_ BitVec 64))) (size!9379 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19052)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19052 (_ BitVec 32)) Bool)

(assert (=> b!352728 (= res!195622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352729 () Bool)

(declare-fun tp_is_empty!7735 () Bool)

(assert (=> b!352729 (= e!215993 tp_is_empty!7735)))

(declare-fun b!352730 () Bool)

(declare-fun res!195623 () Bool)

(assert (=> b!352730 (=> (not res!195623) (not e!215991))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!352730 (= res!195623 (and (= (size!9378 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9379 _keys!1895) (size!9378 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!195625 () Bool)

(assert (=> start!35176 (=> (not res!195625) (not e!215991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35176 (= res!195625 (validMask!0 mask!2385))))

(assert (=> start!35176 e!215991))

(assert (=> start!35176 true))

(assert (=> start!35176 tp_is_empty!7735))

(assert (=> start!35176 tp!26940))

(declare-fun array_inv!6670 (array!19050) Bool)

(assert (=> start!35176 (and (array_inv!6670 _values!1525) e!215989)))

(declare-fun array_inv!6671 (array!19052) Bool)

(assert (=> start!35176 (array_inv!6671 _keys!1895)))

(declare-fun b!352731 () Bool)

(declare-fun res!195624 () Bool)

(assert (=> b!352731 (=> (not res!195624) (not e!215991))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352731 (= res!195624 (validKeyInArray!0 k0!1348))))

(declare-fun b!352732 () Bool)

(declare-fun res!195626 () Bool)

(assert (=> b!352732 (=> (not res!195626) (not e!215991))))

(declare-fun zeroValue!1467 () V!11291)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11291)

(declare-datatypes ((tuple2!5556 0))(
  ( (tuple2!5557 (_1!2789 (_ BitVec 64)) (_2!2789 V!11291)) )
))
(declare-datatypes ((List!5162 0))(
  ( (Nil!5159) (Cons!5158 (h!6014 tuple2!5556) (t!10300 List!5162)) )
))
(declare-datatypes ((ListLongMap!4471 0))(
  ( (ListLongMap!4472 (toList!2251 List!5162)) )
))
(declare-fun contains!2343 (ListLongMap!4471 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1779 (array!19052 array!19050 (_ BitVec 32) (_ BitVec 32) V!11291 V!11291 (_ BitVec 32) Int) ListLongMap!4471)

(assert (=> b!352732 (= res!195626 (not (contains!2343 (getCurrentListMap!1779 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352733 () Bool)

(declare-fun res!195621 () Bool)

(assert (=> b!352733 (=> (not res!195621) (not e!215991))))

(declare-datatypes ((List!5163 0))(
  ( (Nil!5160) (Cons!5159 (h!6015 (_ BitVec 64)) (t!10301 List!5163)) )
))
(declare-fun arrayNoDuplicates!0 (array!19052 (_ BitVec 32) List!5163) Bool)

(assert (=> b!352733 (= res!195621 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5160))))

(declare-fun b!352734 () Bool)

(declare-datatypes ((SeekEntryResult!3426 0))(
  ( (MissingZero!3426 (index!15883 (_ BitVec 32))) (Found!3426 (index!15884 (_ BitVec 32))) (Intermediate!3426 (undefined!4238 Bool) (index!15885 (_ BitVec 32)) (x!35047 (_ BitVec 32))) (Undefined!3426) (MissingVacant!3426 (index!15886 (_ BitVec 32))) )
))
(declare-fun lt!165358 () SeekEntryResult!3426)

(get-info :version)

(assert (=> b!352734 (= e!215991 (and (not ((_ is Found!3426) lt!165358)) (not ((_ is MissingZero!3426) lt!165358)) (not ((_ is MissingVacant!3426) lt!165358)) ((_ is Undefined!3426) lt!165358) (not ((_ is Undefined!3426) lt!165358))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19052 (_ BitVec 32)) SeekEntryResult!3426)

(assert (=> b!352734 (= lt!165358 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352735 () Bool)

(declare-fun e!215992 () Bool)

(assert (=> b!352735 (= e!215992 tp_is_empty!7735)))

(declare-fun mapNonEmpty!13086 () Bool)

(declare-fun tp!26939 () Bool)

(assert (=> mapNonEmpty!13086 (= mapRes!13086 (and tp!26939 e!215992))))

(declare-fun mapKey!13086 () (_ BitVec 32))

(declare-fun mapRest!13086 () (Array (_ BitVec 32) ValueCell!3524))

(declare-fun mapValue!13086 () ValueCell!3524)

(assert (=> mapNonEmpty!13086 (= (arr!9026 _values!1525) (store mapRest!13086 mapKey!13086 mapValue!13086))))

(declare-fun mapIsEmpty!13086 () Bool)

(assert (=> mapIsEmpty!13086 mapRes!13086))

(assert (= (and start!35176 res!195625) b!352730))

(assert (= (and b!352730 res!195623) b!352728))

(assert (= (and b!352728 res!195622) b!352733))

(assert (= (and b!352733 res!195621) b!352731))

(assert (= (and b!352731 res!195624) b!352732))

(assert (= (and b!352732 res!195626) b!352734))

(assert (= (and b!352727 condMapEmpty!13086) mapIsEmpty!13086))

(assert (= (and b!352727 (not condMapEmpty!13086)) mapNonEmpty!13086))

(assert (= (and mapNonEmpty!13086 ((_ is ValueCellFull!3524) mapValue!13086)) b!352735))

(assert (= (and b!352727 ((_ is ValueCellFull!3524) mapDefault!13086)) b!352729))

(assert (= start!35176 b!352727))

(declare-fun m!352551 () Bool)

(assert (=> mapNonEmpty!13086 m!352551))

(declare-fun m!352553 () Bool)

(assert (=> b!352733 m!352553))

(declare-fun m!352555 () Bool)

(assert (=> b!352728 m!352555))

(declare-fun m!352557 () Bool)

(assert (=> b!352732 m!352557))

(assert (=> b!352732 m!352557))

(declare-fun m!352559 () Bool)

(assert (=> b!352732 m!352559))

(declare-fun m!352561 () Bool)

(assert (=> b!352731 m!352561))

(declare-fun m!352563 () Bool)

(assert (=> b!352734 m!352563))

(declare-fun m!352565 () Bool)

(assert (=> start!35176 m!352565))

(declare-fun m!352567 () Bool)

(assert (=> start!35176 m!352567))

(declare-fun m!352569 () Bool)

(assert (=> start!35176 m!352569))

(check-sat (not b!352733) (not mapNonEmpty!13086) b_and!15035 (not b!352728) (not b_next!7783) (not b!352734) tp_is_empty!7735 (not b!352732) (not start!35176) (not b!352731))
(check-sat b_and!15035 (not b_next!7783))
