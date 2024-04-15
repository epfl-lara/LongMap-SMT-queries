; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34170 () Bool)

(assert start!34170)

(declare-fun b_free!7207 () Bool)

(declare-fun b_next!7207 () Bool)

(assert (=> start!34170 (= b_free!7207 (not b_next!7207))))

(declare-fun tp!25155 () Bool)

(declare-fun b_and!14381 () Bool)

(assert (=> start!34170 (= tp!25155 b_and!14381)))

(declare-fun b!340484 () Bool)

(declare-fun res!188132 () Bool)

(declare-fun e!208850 () Bool)

(assert (=> b!340484 (=> (not res!188132) (not e!208850))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10523 0))(
  ( (V!10524 (val!3624 Int)) )
))
(declare-datatypes ((ValueCell!3236 0))(
  ( (ValueCellFull!3236 (v!5790 V!10523)) (EmptyCell!3236) )
))
(declare-datatypes ((array!17893 0))(
  ( (array!17894 (arr!8467 (Array (_ BitVec 32) ValueCell!3236)) (size!8820 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17893)

(declare-datatypes ((array!17895 0))(
  ( (array!17896 (arr!8468 (Array (_ BitVec 32) (_ BitVec 64))) (size!8821 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17895)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340484 (= res!188132 (and (= (size!8820 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8821 _keys!1895) (size!8820 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340485 () Bool)

(declare-fun e!208849 () Bool)

(declare-fun tp_is_empty!7159 () Bool)

(assert (=> b!340485 (= e!208849 tp_is_empty!7159)))

(declare-fun b!340486 () Bool)

(declare-fun e!208852 () Bool)

(assert (=> b!340486 (= e!208852 false)))

(declare-fun lt!161412 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17895 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340486 (= lt!161412 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340487 () Bool)

(declare-fun e!208848 () Bool)

(declare-fun mapRes!12165 () Bool)

(assert (=> b!340487 (= e!208848 (and e!208849 mapRes!12165))))

(declare-fun condMapEmpty!12165 () Bool)

(declare-fun mapDefault!12165 () ValueCell!3236)

(assert (=> b!340487 (= condMapEmpty!12165 (= (arr!8467 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3236)) mapDefault!12165)))))

(declare-fun b!340488 () Bool)

(declare-fun res!188131 () Bool)

(assert (=> b!340488 (=> (not res!188131) (not e!208850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17895 (_ BitVec 32)) Bool)

(assert (=> b!340488 (= res!188131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340489 () Bool)

(declare-fun res!188130 () Bool)

(assert (=> b!340489 (=> (not res!188130) (not e!208850))))

(declare-datatypes ((List!4821 0))(
  ( (Nil!4818) (Cons!4817 (h!5673 (_ BitVec 64)) (t!9920 List!4821)) )
))
(declare-fun arrayNoDuplicates!0 (array!17895 (_ BitVec 32) List!4821) Bool)

(assert (=> b!340489 (= res!188130 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4818))))

(declare-fun res!188134 () Bool)

(assert (=> start!34170 (=> (not res!188134) (not e!208850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34170 (= res!188134 (validMask!0 mask!2385))))

(assert (=> start!34170 e!208850))

(assert (=> start!34170 true))

(assert (=> start!34170 tp_is_empty!7159))

(assert (=> start!34170 tp!25155))

(declare-fun array_inv!6298 (array!17893) Bool)

(assert (=> start!34170 (and (array_inv!6298 _values!1525) e!208848)))

(declare-fun array_inv!6299 (array!17895) Bool)

(assert (=> start!34170 (array_inv!6299 _keys!1895)))

(declare-fun b!340490 () Bool)

(declare-fun res!188129 () Bool)

(assert (=> b!340490 (=> (not res!188129) (not e!208850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340490 (= res!188129 (validKeyInArray!0 k0!1348))))

(declare-fun b!340491 () Bool)

(assert (=> b!340491 (= e!208850 e!208852)))

(declare-fun res!188135 () Bool)

(assert (=> b!340491 (=> (not res!188135) (not e!208852))))

(declare-datatypes ((SeekEntryResult!3261 0))(
  ( (MissingZero!3261 (index!15223 (_ BitVec 32))) (Found!3261 (index!15224 (_ BitVec 32))) (Intermediate!3261 (undefined!4073 Bool) (index!15225 (_ BitVec 32)) (x!33922 (_ BitVec 32))) (Undefined!3261) (MissingVacant!3261 (index!15226 (_ BitVec 32))) )
))
(declare-fun lt!161411 () SeekEntryResult!3261)

(get-info :version)

(assert (=> b!340491 (= res!188135 (and (not ((_ is Found!3261) lt!161411)) (not ((_ is MissingZero!3261) lt!161411)) ((_ is MissingVacant!3261) lt!161411)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17895 (_ BitVec 32)) SeekEntryResult!3261)

(assert (=> b!340491 (= lt!161411 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12165 () Bool)

(assert (=> mapIsEmpty!12165 mapRes!12165))

(declare-fun b!340492 () Bool)

(declare-fun res!188128 () Bool)

(assert (=> b!340492 (=> (not res!188128) (not e!208852))))

(declare-fun arrayContainsKey!0 (array!17895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340492 (= res!188128 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12165 () Bool)

(declare-fun tp!25154 () Bool)

(declare-fun e!208851 () Bool)

(assert (=> mapNonEmpty!12165 (= mapRes!12165 (and tp!25154 e!208851))))

(declare-fun mapValue!12165 () ValueCell!3236)

(declare-fun mapRest!12165 () (Array (_ BitVec 32) ValueCell!3236))

(declare-fun mapKey!12165 () (_ BitVec 32))

(assert (=> mapNonEmpty!12165 (= (arr!8467 _values!1525) (store mapRest!12165 mapKey!12165 mapValue!12165))))

(declare-fun b!340493 () Bool)

(assert (=> b!340493 (= e!208851 tp_is_empty!7159)))

(declare-fun b!340494 () Bool)

(declare-fun res!188133 () Bool)

(assert (=> b!340494 (=> (not res!188133) (not e!208850))))

(declare-fun zeroValue!1467 () V!10523)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10523)

(declare-datatypes ((tuple2!5198 0))(
  ( (tuple2!5199 (_1!2610 (_ BitVec 64)) (_2!2610 V!10523)) )
))
(declare-datatypes ((List!4822 0))(
  ( (Nil!4819) (Cons!4818 (h!5674 tuple2!5198) (t!9921 List!4822)) )
))
(declare-datatypes ((ListLongMap!4101 0))(
  ( (ListLongMap!4102 (toList!2066 List!4822)) )
))
(declare-fun contains!2131 (ListLongMap!4101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1572 (array!17895 array!17893 (_ BitVec 32) (_ BitVec 32) V!10523 V!10523 (_ BitVec 32) Int) ListLongMap!4101)

(assert (=> b!340494 (= res!188133 (not (contains!2131 (getCurrentListMap!1572 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34170 res!188134) b!340484))

(assert (= (and b!340484 res!188132) b!340488))

(assert (= (and b!340488 res!188131) b!340489))

(assert (= (and b!340489 res!188130) b!340490))

(assert (= (and b!340490 res!188129) b!340494))

(assert (= (and b!340494 res!188133) b!340491))

(assert (= (and b!340491 res!188135) b!340492))

(assert (= (and b!340492 res!188128) b!340486))

(assert (= (and b!340487 condMapEmpty!12165) mapIsEmpty!12165))

(assert (= (and b!340487 (not condMapEmpty!12165)) mapNonEmpty!12165))

(assert (= (and mapNonEmpty!12165 ((_ is ValueCellFull!3236) mapValue!12165)) b!340493))

(assert (= (and b!340487 ((_ is ValueCellFull!3236) mapDefault!12165)) b!340485))

(assert (= start!34170 b!340487))

(declare-fun m!342645 () Bool)

(assert (=> b!340490 m!342645))

(declare-fun m!342647 () Bool)

(assert (=> b!340489 m!342647))

(declare-fun m!342649 () Bool)

(assert (=> b!340488 m!342649))

(declare-fun m!342651 () Bool)

(assert (=> b!340494 m!342651))

(assert (=> b!340494 m!342651))

(declare-fun m!342653 () Bool)

(assert (=> b!340494 m!342653))

(declare-fun m!342655 () Bool)

(assert (=> b!340491 m!342655))

(declare-fun m!342657 () Bool)

(assert (=> mapNonEmpty!12165 m!342657))

(declare-fun m!342659 () Bool)

(assert (=> b!340486 m!342659))

(declare-fun m!342661 () Bool)

(assert (=> b!340492 m!342661))

(declare-fun m!342663 () Bool)

(assert (=> start!34170 m!342663))

(declare-fun m!342665 () Bool)

(assert (=> start!34170 m!342665))

(declare-fun m!342667 () Bool)

(assert (=> start!34170 m!342667))

(check-sat (not b!340486) (not b!340489) (not b!340490) (not b!340492) b_and!14381 (not b!340491) (not b!340494) (not start!34170) tp_is_empty!7159 (not mapNonEmpty!12165) (not b!340488) (not b_next!7207))
(check-sat b_and!14381 (not b_next!7207))
