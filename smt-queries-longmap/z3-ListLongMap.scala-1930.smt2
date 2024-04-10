; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34228 () Bool)

(assert start!34228)

(declare-fun b_free!7251 () Bool)

(declare-fun b_next!7251 () Bool)

(assert (=> start!34228 (= b_free!7251 (not b_next!7251))))

(declare-fun tp!25286 () Bool)

(declare-fun b_and!14451 () Bool)

(assert (=> start!34228 (= tp!25286 b_and!14451)))

(declare-fun b!341485 () Bool)

(declare-fun res!188789 () Bool)

(declare-fun e!209419 () Bool)

(assert (=> b!341485 (=> (not res!188789) (not e!209419))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341485 (= res!188789 (validKeyInArray!0 k0!1348))))

(declare-fun b!341486 () Bool)

(declare-fun res!188787 () Bool)

(assert (=> b!341486 (=> (not res!188787) (not e!209419))))

(declare-datatypes ((array!17999 0))(
  ( (array!18000 (arr!8520 (Array (_ BitVec 32) (_ BitVec 64))) (size!8872 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17999)

(declare-datatypes ((List!4902 0))(
  ( (Nil!4899) (Cons!4898 (h!5754 (_ BitVec 64)) (t!10010 List!4902)) )
))
(declare-fun arrayNoDuplicates!0 (array!17999 (_ BitVec 32) List!4902) Bool)

(assert (=> b!341486 (= res!188787 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4899))))

(declare-fun b!341487 () Bool)

(declare-fun e!209424 () Bool)

(assert (=> b!341487 (= e!209419 e!209424)))

(declare-fun res!188792 () Bool)

(assert (=> b!341487 (=> (not res!188792) (not e!209424))))

(declare-datatypes ((SeekEntryResult!3290 0))(
  ( (MissingZero!3290 (index!15339 (_ BitVec 32))) (Found!3290 (index!15340 (_ BitVec 32))) (Intermediate!3290 (undefined!4102 Bool) (index!15341 (_ BitVec 32)) (x!34012 (_ BitVec 32))) (Undefined!3290) (MissingVacant!3290 (index!15342 (_ BitVec 32))) )
))
(declare-fun lt!161779 () SeekEntryResult!3290)

(get-info :version)

(assert (=> b!341487 (= res!188792 (and (not ((_ is Found!3290) lt!161779)) (not ((_ is MissingZero!3290) lt!161779)) ((_ is MissingVacant!3290) lt!161779)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17999 (_ BitVec 32)) SeekEntryResult!3290)

(assert (=> b!341487 (= lt!161779 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12231 () Bool)

(declare-fun mapRes!12231 () Bool)

(assert (=> mapIsEmpty!12231 mapRes!12231))

(declare-fun res!188785 () Bool)

(assert (=> start!34228 (=> (not res!188785) (not e!209419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34228 (= res!188785 (validMask!0 mask!2385))))

(assert (=> start!34228 e!209419))

(assert (=> start!34228 true))

(declare-fun tp_is_empty!7203 () Bool)

(assert (=> start!34228 tp_is_empty!7203))

(assert (=> start!34228 tp!25286))

(declare-datatypes ((V!10581 0))(
  ( (V!10582 (val!3646 Int)) )
))
(declare-datatypes ((ValueCell!3258 0))(
  ( (ValueCellFull!3258 (v!5818 V!10581)) (EmptyCell!3258) )
))
(declare-datatypes ((array!18001 0))(
  ( (array!18002 (arr!8521 (Array (_ BitVec 32) ValueCell!3258)) (size!8873 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18001)

(declare-fun e!209422 () Bool)

(declare-fun array_inv!6308 (array!18001) Bool)

(assert (=> start!34228 (and (array_inv!6308 _values!1525) e!209422)))

(declare-fun array_inv!6309 (array!17999) Bool)

(assert (=> start!34228 (array_inv!6309 _keys!1895)))

(declare-fun b!341488 () Bool)

(declare-fun res!188786 () Bool)

(assert (=> b!341488 (=> (not res!188786) (not e!209419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17999 (_ BitVec 32)) Bool)

(assert (=> b!341488 (= res!188786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341489 () Bool)

(declare-fun res!188788 () Bool)

(assert (=> b!341489 (=> (not res!188788) (not e!209424))))

(declare-fun arrayContainsKey!0 (array!17999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341489 (= res!188788 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341490 () Bool)

(declare-fun e!209423 () Bool)

(assert (=> b!341490 (= e!209422 (and e!209423 mapRes!12231))))

(declare-fun condMapEmpty!12231 () Bool)

(declare-fun mapDefault!12231 () ValueCell!3258)

(assert (=> b!341490 (= condMapEmpty!12231 (= (arr!8521 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3258)) mapDefault!12231)))))

(declare-fun b!341491 () Bool)

(declare-fun e!209421 () Bool)

(assert (=> b!341491 (= e!209421 tp_is_empty!7203)))

(declare-fun b!341492 () Bool)

(assert (=> b!341492 (= e!209424 false)))

(declare-fun lt!161778 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17999 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341492 (= lt!161778 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341493 () Bool)

(declare-fun res!188791 () Bool)

(assert (=> b!341493 (=> (not res!188791) (not e!209419))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341493 (= res!188791 (and (= (size!8873 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8872 _keys!1895) (size!8873 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12231 () Bool)

(declare-fun tp!25287 () Bool)

(assert (=> mapNonEmpty!12231 (= mapRes!12231 (and tp!25287 e!209421))))

(declare-fun mapRest!12231 () (Array (_ BitVec 32) ValueCell!3258))

(declare-fun mapValue!12231 () ValueCell!3258)

(declare-fun mapKey!12231 () (_ BitVec 32))

(assert (=> mapNonEmpty!12231 (= (arr!8521 _values!1525) (store mapRest!12231 mapKey!12231 mapValue!12231))))

(declare-fun b!341494 () Bool)

(assert (=> b!341494 (= e!209423 tp_is_empty!7203)))

(declare-fun b!341495 () Bool)

(declare-fun res!188790 () Bool)

(assert (=> b!341495 (=> (not res!188790) (not e!209419))))

(declare-fun zeroValue!1467 () V!10581)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10581)

(declare-datatypes ((tuple2!5284 0))(
  ( (tuple2!5285 (_1!2653 (_ BitVec 64)) (_2!2653 V!10581)) )
))
(declare-datatypes ((List!4903 0))(
  ( (Nil!4900) (Cons!4899 (h!5755 tuple2!5284) (t!10011 List!4903)) )
))
(declare-datatypes ((ListLongMap!4197 0))(
  ( (ListLongMap!4198 (toList!2114 List!4903)) )
))
(declare-fun contains!2168 (ListLongMap!4197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1635 (array!17999 array!18001 (_ BitVec 32) (_ BitVec 32) V!10581 V!10581 (_ BitVec 32) Int) ListLongMap!4197)

(assert (=> b!341495 (= res!188790 (not (contains!2168 (getCurrentListMap!1635 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34228 res!188785) b!341493))

(assert (= (and b!341493 res!188791) b!341488))

(assert (= (and b!341488 res!188786) b!341486))

(assert (= (and b!341486 res!188787) b!341485))

(assert (= (and b!341485 res!188789) b!341495))

(assert (= (and b!341495 res!188790) b!341487))

(assert (= (and b!341487 res!188792) b!341489))

(assert (= (and b!341489 res!188788) b!341492))

(assert (= (and b!341490 condMapEmpty!12231) mapIsEmpty!12231))

(assert (= (and b!341490 (not condMapEmpty!12231)) mapNonEmpty!12231))

(assert (= (and mapNonEmpty!12231 ((_ is ValueCellFull!3258) mapValue!12231)) b!341491))

(assert (= (and b!341490 ((_ is ValueCellFull!3258) mapDefault!12231)) b!341494))

(assert (= start!34228 b!341490))

(declare-fun m!343903 () Bool)

(assert (=> b!341488 m!343903))

(declare-fun m!343905 () Bool)

(assert (=> b!341485 m!343905))

(declare-fun m!343907 () Bool)

(assert (=> mapNonEmpty!12231 m!343907))

(declare-fun m!343909 () Bool)

(assert (=> b!341489 m!343909))

(declare-fun m!343911 () Bool)

(assert (=> b!341487 m!343911))

(declare-fun m!343913 () Bool)

(assert (=> b!341486 m!343913))

(declare-fun m!343915 () Bool)

(assert (=> b!341492 m!343915))

(declare-fun m!343917 () Bool)

(assert (=> start!34228 m!343917))

(declare-fun m!343919 () Bool)

(assert (=> start!34228 m!343919))

(declare-fun m!343921 () Bool)

(assert (=> start!34228 m!343921))

(declare-fun m!343923 () Bool)

(assert (=> b!341495 m!343923))

(assert (=> b!341495 m!343923))

(declare-fun m!343925 () Bool)

(assert (=> b!341495 m!343925))

(check-sat (not mapNonEmpty!12231) (not b_next!7251) tp_is_empty!7203 (not b!341487) (not b!341492) (not b!341488) (not b!341485) (not b!341495) b_and!14451 (not start!34228) (not b!341489) (not b!341486))
(check-sat b_and!14451 (not b_next!7251))
