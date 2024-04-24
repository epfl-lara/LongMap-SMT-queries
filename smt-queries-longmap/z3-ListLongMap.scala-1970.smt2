; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34668 () Bool)

(assert start!34668)

(declare-fun b_free!7489 () Bool)

(declare-fun b_next!7489 () Bool)

(assert (=> start!34668 (= b_free!7489 (not b_next!7489))))

(declare-fun tp!26031 () Bool)

(declare-fun b_and!14723 () Bool)

(assert (=> start!34668 (= tp!26031 b_and!14723)))

(declare-fun b!346445 () Bool)

(declare-fun e!212335 () Bool)

(declare-fun e!212332 () Bool)

(declare-fun mapRes!12618 () Bool)

(assert (=> b!346445 (= e!212335 (and e!212332 mapRes!12618))))

(declare-fun condMapEmpty!12618 () Bool)

(declare-datatypes ((V!10899 0))(
  ( (V!10900 (val!3765 Int)) )
))
(declare-datatypes ((ValueCell!3377 0))(
  ( (ValueCellFull!3377 (v!5948 V!10899)) (EmptyCell!3377) )
))
(declare-datatypes ((array!18470 0))(
  ( (array!18471 (arr!8745 (Array (_ BitVec 32) ValueCell!3377)) (size!9097 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18470)

(declare-fun mapDefault!12618 () ValueCell!3377)

(assert (=> b!346445 (= condMapEmpty!12618 (= (arr!8745 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3377)) mapDefault!12618)))))

(declare-fun b!346446 () Bool)

(declare-fun tp_is_empty!7441 () Bool)

(assert (=> b!346446 (= e!212332 tp_is_empty!7441)))

(declare-fun res!191651 () Bool)

(declare-fun e!212334 () Bool)

(assert (=> start!34668 (=> (not res!191651) (not e!212334))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34668 (= res!191651 (validMask!0 mask!2385))))

(assert (=> start!34668 e!212334))

(assert (=> start!34668 true))

(assert (=> start!34668 tp_is_empty!7441))

(assert (=> start!34668 tp!26031))

(declare-fun array_inv!6464 (array!18470) Bool)

(assert (=> start!34668 (and (array_inv!6464 _values!1525) e!212335)))

(declare-datatypes ((array!18472 0))(
  ( (array!18473 (arr!8746 (Array (_ BitVec 32) (_ BitVec 64))) (size!9098 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18472)

(declare-fun array_inv!6465 (array!18472) Bool)

(assert (=> start!34668 (array_inv!6465 _keys!1895)))

(declare-fun b!346447 () Bool)

(declare-fun res!191648 () Bool)

(assert (=> b!346447 (=> (not res!191648) (not e!212334))))

(declare-datatypes ((List!4971 0))(
  ( (Nil!4968) (Cons!4967 (h!5823 (_ BitVec 64)) (t!10091 List!4971)) )
))
(declare-fun arrayNoDuplicates!0 (array!18472 (_ BitVec 32) List!4971) Bool)

(assert (=> b!346447 (= res!191648 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4968))))

(declare-fun b!346448 () Bool)

(declare-fun res!191646 () Bool)

(assert (=> b!346448 (=> (not res!191646) (not e!212334))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346448 (= res!191646 (and (= (size!9097 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9098 _keys!1895) (size!9097 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12618 () Bool)

(declare-fun tp!26030 () Bool)

(declare-fun e!212336 () Bool)

(assert (=> mapNonEmpty!12618 (= mapRes!12618 (and tp!26030 e!212336))))

(declare-fun mapRest!12618 () (Array (_ BitVec 32) ValueCell!3377))

(declare-fun mapValue!12618 () ValueCell!3377)

(declare-fun mapKey!12618 () (_ BitVec 32))

(assert (=> mapNonEmpty!12618 (= (arr!8745 _values!1525) (store mapRest!12618 mapKey!12618 mapValue!12618))))

(declare-fun mapIsEmpty!12618 () Bool)

(assert (=> mapIsEmpty!12618 mapRes!12618))

(declare-fun b!346449 () Bool)

(declare-fun res!191650 () Bool)

(assert (=> b!346449 (=> (not res!191650) (not e!212334))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10899)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10899)

(declare-datatypes ((tuple2!5364 0))(
  ( (tuple2!5365 (_1!2693 (_ BitVec 64)) (_2!2693 V!10899)) )
))
(declare-datatypes ((List!4972 0))(
  ( (Nil!4969) (Cons!4968 (h!5824 tuple2!5364) (t!10092 List!4972)) )
))
(declare-datatypes ((ListLongMap!4279 0))(
  ( (ListLongMap!4280 (toList!2155 List!4972)) )
))
(declare-fun contains!2238 (ListLongMap!4279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1684 (array!18472 array!18470 (_ BitVec 32) (_ BitVec 32) V!10899 V!10899 (_ BitVec 32) Int) ListLongMap!4279)

(assert (=> b!346449 (= res!191650 (not (contains!2238 (getCurrentListMap!1684 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346450 () Bool)

(declare-fun res!191649 () Bool)

(assert (=> b!346450 (=> (not res!191649) (not e!212334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18472 (_ BitVec 32)) Bool)

(assert (=> b!346450 (= res!191649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346451 () Bool)

(declare-fun res!191647 () Bool)

(assert (=> b!346451 (=> (not res!191647) (not e!212334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346451 (= res!191647 (validKeyInArray!0 k0!1348))))

(declare-fun b!346452 () Bool)

(assert (=> b!346452 (= e!212336 tp_is_empty!7441)))

(declare-fun b!346453 () Bool)

(assert (=> b!346453 (= e!212334 false)))

(declare-datatypes ((SeekEntryResult!3325 0))(
  ( (MissingZero!3325 (index!15479 (_ BitVec 32))) (Found!3325 (index!15480 (_ BitVec 32))) (Intermediate!3325 (undefined!4137 Bool) (index!15481 (_ BitVec 32)) (x!34464 (_ BitVec 32))) (Undefined!3325) (MissingVacant!3325 (index!15482 (_ BitVec 32))) )
))
(declare-fun lt!163402 () SeekEntryResult!3325)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18472 (_ BitVec 32)) SeekEntryResult!3325)

(assert (=> b!346453 (= lt!163402 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34668 res!191651) b!346448))

(assert (= (and b!346448 res!191646) b!346450))

(assert (= (and b!346450 res!191649) b!346447))

(assert (= (and b!346447 res!191648) b!346451))

(assert (= (and b!346451 res!191647) b!346449))

(assert (= (and b!346449 res!191650) b!346453))

(assert (= (and b!346445 condMapEmpty!12618) mapIsEmpty!12618))

(assert (= (and b!346445 (not condMapEmpty!12618)) mapNonEmpty!12618))

(get-info :version)

(assert (= (and mapNonEmpty!12618 ((_ is ValueCellFull!3377) mapValue!12618)) b!346452))

(assert (= (and b!346445 ((_ is ValueCellFull!3377) mapDefault!12618)) b!346446))

(assert (= start!34668 b!346445))

(declare-fun m!347807 () Bool)

(assert (=> b!346449 m!347807))

(assert (=> b!346449 m!347807))

(declare-fun m!347809 () Bool)

(assert (=> b!346449 m!347809))

(declare-fun m!347811 () Bool)

(assert (=> start!34668 m!347811))

(declare-fun m!347813 () Bool)

(assert (=> start!34668 m!347813))

(declare-fun m!347815 () Bool)

(assert (=> start!34668 m!347815))

(declare-fun m!347817 () Bool)

(assert (=> b!346447 m!347817))

(declare-fun m!347819 () Bool)

(assert (=> b!346453 m!347819))

(declare-fun m!347821 () Bool)

(assert (=> b!346451 m!347821))

(declare-fun m!347823 () Bool)

(assert (=> b!346450 m!347823))

(declare-fun m!347825 () Bool)

(assert (=> mapNonEmpty!12618 m!347825))

(check-sat tp_is_empty!7441 (not b!346453) b_and!14723 (not b_next!7489) (not b!346451) (not b!346449) (not b!346450) (not b!346447) (not mapNonEmpty!12618) (not start!34668))
(check-sat b_and!14723 (not b_next!7489))
