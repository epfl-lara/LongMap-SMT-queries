; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35176 () Bool)

(assert start!35176)

(declare-fun b_free!7783 () Bool)

(declare-fun b_next!7783 () Bool)

(assert (=> start!35176 (= b_free!7783 (not b_next!7783))))

(declare-fun tp!26939 () Bool)

(declare-fun b_and!14995 () Bool)

(assert (=> start!35176 (= tp!26939 b_and!14995)))

(declare-fun mapIsEmpty!13086 () Bool)

(declare-fun mapRes!13086 () Bool)

(assert (=> mapIsEmpty!13086 mapRes!13086))

(declare-fun res!195500 () Bool)

(declare-fun e!215850 () Bool)

(assert (=> start!35176 (=> (not res!195500) (not e!215850))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35176 (= res!195500 (validMask!0 mask!2385))))

(assert (=> start!35176 e!215850))

(assert (=> start!35176 true))

(declare-fun tp_is_empty!7735 () Bool)

(assert (=> start!35176 tp_is_empty!7735))

(assert (=> start!35176 tp!26939))

(declare-datatypes ((V!11291 0))(
  ( (V!11292 (val!3912 Int)) )
))
(declare-datatypes ((ValueCell!3524 0))(
  ( (ValueCellFull!3524 (v!6097 V!11291)) (EmptyCell!3524) )
))
(declare-datatypes ((array!19039 0))(
  ( (array!19040 (arr!9021 (Array (_ BitVec 32) ValueCell!3524)) (size!9374 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19039)

(declare-fun e!215848 () Bool)

(declare-fun array_inv!6680 (array!19039) Bool)

(assert (=> start!35176 (and (array_inv!6680 _values!1525) e!215848)))

(declare-datatypes ((array!19041 0))(
  ( (array!19042 (arr!9022 (Array (_ BitVec 32) (_ BitVec 64))) (size!9375 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19041)

(declare-fun array_inv!6681 (array!19041) Bool)

(assert (=> start!35176 (array_inv!6681 _keys!1895)))

(declare-fun b!352505 () Bool)

(declare-fun res!195496 () Bool)

(assert (=> b!352505 (=> (not res!195496) (not e!215850))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11291)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11291)

(declare-datatypes ((tuple2!5616 0))(
  ( (tuple2!5617 (_1!2819 (_ BitVec 64)) (_2!2819 V!11291)) )
))
(declare-datatypes ((List!5231 0))(
  ( (Nil!5228) (Cons!5227 (h!6083 tuple2!5616) (t!10368 List!5231)) )
))
(declare-datatypes ((ListLongMap!4519 0))(
  ( (ListLongMap!4520 (toList!2275 List!5231)) )
))
(declare-fun contains!2359 (ListLongMap!4519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1780 (array!19041 array!19039 (_ BitVec 32) (_ BitVec 32) V!11291 V!11291 (_ BitVec 32) Int) ListLongMap!4519)

(assert (=> b!352505 (= res!195496 (not (contains!2359 (getCurrentListMap!1780 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352506 () Bool)

(declare-fun res!195499 () Bool)

(assert (=> b!352506 (=> (not res!195499) (not e!215850))))

(assert (=> b!352506 (= res!195499 (and (= (size!9374 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9375 _keys!1895) (size!9374 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13086 () Bool)

(declare-fun tp!26940 () Bool)

(declare-fun e!215849 () Bool)

(assert (=> mapNonEmpty!13086 (= mapRes!13086 (and tp!26940 e!215849))))

(declare-fun mapRest!13086 () (Array (_ BitVec 32) ValueCell!3524))

(declare-fun mapValue!13086 () ValueCell!3524)

(declare-fun mapKey!13086 () (_ BitVec 32))

(assert (=> mapNonEmpty!13086 (= (arr!9021 _values!1525) (store mapRest!13086 mapKey!13086 mapValue!13086))))

(declare-fun b!352507 () Bool)

(declare-datatypes ((SeekEntryResult!3472 0))(
  ( (MissingZero!3472 (index!16067 (_ BitVec 32))) (Found!3472 (index!16068 (_ BitVec 32))) (Intermediate!3472 (undefined!4284 Bool) (index!16069 (_ BitVec 32)) (x!35091 (_ BitVec 32))) (Undefined!3472) (MissingVacant!3472 (index!16070 (_ BitVec 32))) )
))
(declare-fun lt!165105 () SeekEntryResult!3472)

(get-info :version)

(assert (=> b!352507 (= e!215850 (and (not ((_ is Found!3472) lt!165105)) (not ((_ is MissingZero!3472) lt!165105)) (not ((_ is MissingVacant!3472) lt!165105)) ((_ is Undefined!3472) lt!165105) (not ((_ is Undefined!3472) lt!165105))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19041 (_ BitVec 32)) SeekEntryResult!3472)

(assert (=> b!352507 (= lt!165105 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352508 () Bool)

(declare-fun e!215847 () Bool)

(assert (=> b!352508 (= e!215848 (and e!215847 mapRes!13086))))

(declare-fun condMapEmpty!13086 () Bool)

(declare-fun mapDefault!13086 () ValueCell!3524)

(assert (=> b!352508 (= condMapEmpty!13086 (= (arr!9021 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3524)) mapDefault!13086)))))

(declare-fun b!352509 () Bool)

(assert (=> b!352509 (= e!215849 tp_is_empty!7735)))

(declare-fun b!352510 () Bool)

(declare-fun res!195498 () Bool)

(assert (=> b!352510 (=> (not res!195498) (not e!215850))))

(declare-datatypes ((List!5232 0))(
  ( (Nil!5229) (Cons!5228 (h!6084 (_ BitVec 64)) (t!10369 List!5232)) )
))
(declare-fun arrayNoDuplicates!0 (array!19041 (_ BitVec 32) List!5232) Bool)

(assert (=> b!352510 (= res!195498 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5229))))

(declare-fun b!352511 () Bool)

(declare-fun res!195497 () Bool)

(assert (=> b!352511 (=> (not res!195497) (not e!215850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19041 (_ BitVec 32)) Bool)

(assert (=> b!352511 (= res!195497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352512 () Bool)

(assert (=> b!352512 (= e!215847 tp_is_empty!7735)))

(declare-fun b!352513 () Bool)

(declare-fun res!195495 () Bool)

(assert (=> b!352513 (=> (not res!195495) (not e!215850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352513 (= res!195495 (validKeyInArray!0 k0!1348))))

(assert (= (and start!35176 res!195500) b!352506))

(assert (= (and b!352506 res!195499) b!352511))

(assert (= (and b!352511 res!195497) b!352510))

(assert (= (and b!352510 res!195498) b!352513))

(assert (= (and b!352513 res!195495) b!352505))

(assert (= (and b!352505 res!195496) b!352507))

(assert (= (and b!352508 condMapEmpty!13086) mapIsEmpty!13086))

(assert (= (and b!352508 (not condMapEmpty!13086)) mapNonEmpty!13086))

(assert (= (and mapNonEmpty!13086 ((_ is ValueCellFull!3524) mapValue!13086)) b!352509))

(assert (= (and b!352508 ((_ is ValueCellFull!3524) mapDefault!13086)) b!352512))

(assert (= start!35176 b!352508))

(declare-fun m!351597 () Bool)

(assert (=> b!352510 m!351597))

(declare-fun m!351599 () Bool)

(assert (=> b!352513 m!351599))

(declare-fun m!351601 () Bool)

(assert (=> b!352511 m!351601))

(declare-fun m!351603 () Bool)

(assert (=> start!35176 m!351603))

(declare-fun m!351605 () Bool)

(assert (=> start!35176 m!351605))

(declare-fun m!351607 () Bool)

(assert (=> start!35176 m!351607))

(declare-fun m!351609 () Bool)

(assert (=> mapNonEmpty!13086 m!351609))

(declare-fun m!351611 () Bool)

(assert (=> b!352505 m!351611))

(assert (=> b!352505 m!351611))

(declare-fun m!351613 () Bool)

(assert (=> b!352505 m!351613))

(declare-fun m!351615 () Bool)

(assert (=> b!352507 m!351615))

(check-sat (not b_next!7783) (not b!352511) (not b!352513) (not mapNonEmpty!13086) (not b!352507) (not b!352505) b_and!14995 tp_is_empty!7735 (not start!35176) (not b!352510))
(check-sat b_and!14995 (not b_next!7783))
