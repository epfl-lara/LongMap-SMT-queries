; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34054 () Bool)

(assert start!34054)

(declare-fun b_free!7147 () Bool)

(declare-fun b_next!7147 () Bool)

(assert (=> start!34054 (= b_free!7147 (not b_next!7147))))

(declare-fun tp!24965 () Bool)

(declare-fun b_and!14355 () Bool)

(assert (=> start!34054 (= tp!24965 b_and!14355)))

(declare-fun b!339385 () Bool)

(declare-fun res!187482 () Bool)

(declare-fun e!208226 () Bool)

(assert (=> b!339385 (=> (not res!187482) (not e!208226))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339385 (= res!187482 (validKeyInArray!0 k0!1348))))

(declare-fun res!187484 () Bool)

(assert (=> start!34054 (=> (not res!187484) (not e!208226))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34054 (= res!187484 (validMask!0 mask!2385))))

(assert (=> start!34054 e!208226))

(assert (=> start!34054 true))

(declare-fun tp_is_empty!7099 () Bool)

(assert (=> start!34054 tp_is_empty!7099))

(assert (=> start!34054 tp!24965))

(declare-datatypes ((V!10443 0))(
  ( (V!10444 (val!3594 Int)) )
))
(declare-datatypes ((ValueCell!3206 0))(
  ( (ValueCellFull!3206 (v!5764 V!10443)) (EmptyCell!3206) )
))
(declare-datatypes ((array!17780 0))(
  ( (array!17781 (arr!8413 (Array (_ BitVec 32) ValueCell!3206)) (size!8765 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17780)

(declare-fun e!208220 () Bool)

(declare-fun array_inv!6240 (array!17780) Bool)

(assert (=> start!34054 (and (array_inv!6240 _values!1525) e!208220)))

(declare-datatypes ((array!17782 0))(
  ( (array!17783 (arr!8414 (Array (_ BitVec 32) (_ BitVec 64))) (size!8766 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17782)

(declare-fun array_inv!6241 (array!17782) Bool)

(assert (=> start!34054 (array_inv!6241 _keys!1895)))

(declare-fun b!339386 () Bool)

(declare-datatypes ((Unit!10540 0))(
  ( (Unit!10541) )
))
(declare-fun e!208222 () Unit!10540)

(declare-fun Unit!10542 () Unit!10540)

(assert (=> b!339386 (= e!208222 Unit!10542)))

(declare-fun lt!161226 () Unit!10540)

(declare-fun zeroValue!1467 () V!10443)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10443)

(declare-fun lemmaArrayContainsKeyThenInListMap!293 (array!17782 array!17780 (_ BitVec 32) (_ BitVec 32) V!10443 V!10443 (_ BitVec 64) (_ BitVec 32) Int) Unit!10540)

(declare-fun arrayScanForKey!0 (array!17782 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339386 (= lt!161226 (lemmaArrayContainsKeyThenInListMap!293 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339386 false))

(declare-fun b!339387 () Bool)

(declare-fun e!208223 () Bool)

(assert (=> b!339387 (= e!208223 tp_is_empty!7099)))

(declare-fun b!339388 () Bool)

(declare-fun res!187486 () Bool)

(assert (=> b!339388 (=> (not res!187486) (not e!208226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17782 (_ BitVec 32)) Bool)

(assert (=> b!339388 (= res!187486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12066 () Bool)

(declare-fun mapRes!12066 () Bool)

(declare-fun tp!24966 () Bool)

(declare-fun e!208225 () Bool)

(assert (=> mapNonEmpty!12066 (= mapRes!12066 (and tp!24966 e!208225))))

(declare-fun mapKey!12066 () (_ BitVec 32))

(declare-fun mapValue!12066 () ValueCell!3206)

(declare-fun mapRest!12066 () (Array (_ BitVec 32) ValueCell!3206))

(assert (=> mapNonEmpty!12066 (= (arr!8413 _values!1525) (store mapRest!12066 mapKey!12066 mapValue!12066))))

(declare-fun b!339389 () Bool)

(declare-fun e!208221 () Bool)

(assert (=> b!339389 (= e!208221 false)))

(declare-fun lt!161227 () Unit!10540)

(assert (=> b!339389 (= lt!161227 e!208222)))

(declare-fun c!52535 () Bool)

(declare-fun arrayContainsKey!0 (array!17782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339389 (= c!52535 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!339390 () Bool)

(assert (=> b!339390 (= e!208226 e!208221)))

(declare-fun res!187483 () Bool)

(assert (=> b!339390 (=> (not res!187483) (not e!208221))))

(declare-datatypes ((SeekEntryResult!3210 0))(
  ( (MissingZero!3210 (index!15019 (_ BitVec 32))) (Found!3210 (index!15020 (_ BitVec 32))) (Intermediate!3210 (undefined!4022 Bool) (index!15021 (_ BitVec 32)) (x!33763 (_ BitVec 32))) (Undefined!3210) (MissingVacant!3210 (index!15022 (_ BitVec 32))) )
))
(declare-fun lt!161225 () SeekEntryResult!3210)

(get-info :version)

(assert (=> b!339390 (= res!187483 (and (not ((_ is Found!3210) lt!161225)) ((_ is MissingZero!3210) lt!161225)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17782 (_ BitVec 32)) SeekEntryResult!3210)

(assert (=> b!339390 (= lt!161225 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339391 () Bool)

(assert (=> b!339391 (= e!208225 tp_is_empty!7099)))

(declare-fun mapIsEmpty!12066 () Bool)

(assert (=> mapIsEmpty!12066 mapRes!12066))

(declare-fun b!339392 () Bool)

(declare-fun Unit!10543 () Unit!10540)

(assert (=> b!339392 (= e!208222 Unit!10543)))

(declare-fun b!339393 () Bool)

(declare-fun res!187481 () Bool)

(assert (=> b!339393 (=> (not res!187481) (not e!208226))))

(declare-datatypes ((tuple2!5128 0))(
  ( (tuple2!5129 (_1!2575 (_ BitVec 64)) (_2!2575 V!10443)) )
))
(declare-datatypes ((List!4736 0))(
  ( (Nil!4733) (Cons!4732 (h!5588 tuple2!5128) (t!9830 List!4736)) )
))
(declare-datatypes ((ListLongMap!4043 0))(
  ( (ListLongMap!4044 (toList!2037 List!4736)) )
))
(declare-fun contains!2107 (ListLongMap!4043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1566 (array!17782 array!17780 (_ BitVec 32) (_ BitVec 32) V!10443 V!10443 (_ BitVec 32) Int) ListLongMap!4043)

(assert (=> b!339393 (= res!187481 (not (contains!2107 (getCurrentListMap!1566 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339394 () Bool)

(assert (=> b!339394 (= e!208220 (and e!208223 mapRes!12066))))

(declare-fun condMapEmpty!12066 () Bool)

(declare-fun mapDefault!12066 () ValueCell!3206)

(assert (=> b!339394 (= condMapEmpty!12066 (= (arr!8413 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3206)) mapDefault!12066)))))

(declare-fun b!339395 () Bool)

(declare-fun res!187485 () Bool)

(assert (=> b!339395 (=> (not res!187485) (not e!208226))))

(assert (=> b!339395 (= res!187485 (and (= (size!8765 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8766 _keys!1895) (size!8765 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339396 () Bool)

(declare-fun res!187487 () Bool)

(assert (=> b!339396 (=> (not res!187487) (not e!208226))))

(declare-datatypes ((List!4737 0))(
  ( (Nil!4734) (Cons!4733 (h!5589 (_ BitVec 64)) (t!9831 List!4737)) )
))
(declare-fun arrayNoDuplicates!0 (array!17782 (_ BitVec 32) List!4737) Bool)

(assert (=> b!339396 (= res!187487 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4734))))

(assert (= (and start!34054 res!187484) b!339395))

(assert (= (and b!339395 res!187485) b!339388))

(assert (= (and b!339388 res!187486) b!339396))

(assert (= (and b!339396 res!187487) b!339385))

(assert (= (and b!339385 res!187482) b!339393))

(assert (= (and b!339393 res!187481) b!339390))

(assert (= (and b!339390 res!187483) b!339389))

(assert (= (and b!339389 c!52535) b!339386))

(assert (= (and b!339389 (not c!52535)) b!339392))

(assert (= (and b!339394 condMapEmpty!12066) mapIsEmpty!12066))

(assert (= (and b!339394 (not condMapEmpty!12066)) mapNonEmpty!12066))

(assert (= (and mapNonEmpty!12066 ((_ is ValueCellFull!3206) mapValue!12066)) b!339391))

(assert (= (and b!339394 ((_ is ValueCellFull!3206) mapDefault!12066)) b!339387))

(assert (= start!34054 b!339394))

(declare-fun m!342637 () Bool)

(assert (=> start!34054 m!342637))

(declare-fun m!342639 () Bool)

(assert (=> start!34054 m!342639))

(declare-fun m!342641 () Bool)

(assert (=> start!34054 m!342641))

(declare-fun m!342643 () Bool)

(assert (=> b!339393 m!342643))

(assert (=> b!339393 m!342643))

(declare-fun m!342645 () Bool)

(assert (=> b!339393 m!342645))

(declare-fun m!342647 () Bool)

(assert (=> b!339389 m!342647))

(declare-fun m!342649 () Bool)

(assert (=> b!339385 m!342649))

(declare-fun m!342651 () Bool)

(assert (=> b!339390 m!342651))

(declare-fun m!342653 () Bool)

(assert (=> b!339386 m!342653))

(assert (=> b!339386 m!342653))

(declare-fun m!342655 () Bool)

(assert (=> b!339386 m!342655))

(declare-fun m!342657 () Bool)

(assert (=> b!339396 m!342657))

(declare-fun m!342659 () Bool)

(assert (=> b!339388 m!342659))

(declare-fun m!342661 () Bool)

(assert (=> mapNonEmpty!12066 m!342661))

(check-sat (not b!339388) (not start!34054) (not b!339390) (not b!339393) b_and!14355 (not b!339396) tp_is_empty!7099 (not mapNonEmpty!12066) (not b!339386) (not b_next!7147) (not b!339389) (not b!339385))
(check-sat b_and!14355 (not b_next!7147))
