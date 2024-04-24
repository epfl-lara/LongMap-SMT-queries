; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34194 () Bool)

(assert start!34194)

(declare-fun b_free!7231 () Bool)

(declare-fun b_next!7231 () Bool)

(assert (=> start!34194 (= b_free!7231 (not b_next!7231))))

(declare-fun tp!25227 () Bool)

(declare-fun b_and!14445 () Bool)

(assert (=> start!34194 (= tp!25227 b_and!14445)))

(declare-fun b!341102 () Bool)

(declare-fun e!209210 () Bool)

(declare-fun e!209209 () Bool)

(assert (=> b!341102 (= e!209210 e!209209)))

(declare-fun res!188544 () Bool)

(assert (=> b!341102 (=> (not res!188544) (not e!209209))))

(declare-datatypes ((SeekEntryResult!3235 0))(
  ( (MissingZero!3235 (index!15119 (_ BitVec 32))) (Found!3235 (index!15120 (_ BitVec 32))) (Intermediate!3235 (undefined!4047 Bool) (index!15121 (_ BitVec 32)) (x!33930 (_ BitVec 32))) (Undefined!3235) (MissingVacant!3235 (index!15122 (_ BitVec 32))) )
))
(declare-fun lt!161736 () SeekEntryResult!3235)

(get-info :version)

(assert (=> b!341102 (= res!188544 (and (not ((_ is Found!3235) lt!161736)) (not ((_ is MissingZero!3235) lt!161736)) ((_ is MissingVacant!3235) lt!161736)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17952 0))(
  ( (array!17953 (arr!8496 (Array (_ BitVec 32) (_ BitVec 64))) (size!8848 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17952)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17952 (_ BitVec 32)) SeekEntryResult!3235)

(assert (=> b!341102 (= lt!161736 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!188542 () Bool)

(assert (=> start!34194 (=> (not res!188542) (not e!209210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34194 (= res!188542 (validMask!0 mask!2385))))

(assert (=> start!34194 e!209210))

(assert (=> start!34194 true))

(declare-fun tp_is_empty!7183 () Bool)

(assert (=> start!34194 tp_is_empty!7183))

(assert (=> start!34194 tp!25227))

(declare-datatypes ((V!10555 0))(
  ( (V!10556 (val!3636 Int)) )
))
(declare-datatypes ((ValueCell!3248 0))(
  ( (ValueCellFull!3248 (v!5809 V!10555)) (EmptyCell!3248) )
))
(declare-datatypes ((array!17954 0))(
  ( (array!17955 (arr!8497 (Array (_ BitVec 32) ValueCell!3248)) (size!8849 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17954)

(declare-fun e!209206 () Bool)

(declare-fun array_inv!6292 (array!17954) Bool)

(assert (=> start!34194 (and (array_inv!6292 _values!1525) e!209206)))

(declare-fun array_inv!6293 (array!17952) Bool)

(assert (=> start!34194 (array_inv!6293 _keys!1895)))

(declare-fun b!341103 () Bool)

(declare-fun e!209207 () Bool)

(assert (=> b!341103 (= e!209207 tp_is_empty!7183)))

(declare-fun b!341104 () Bool)

(declare-fun e!209205 () Bool)

(assert (=> b!341104 (= e!209205 tp_is_empty!7183)))

(declare-fun b!341105 () Bool)

(assert (=> b!341105 (= e!209209 false)))

(declare-fun lt!161737 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17952 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341105 (= lt!161737 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341106 () Bool)

(declare-fun res!188545 () Bool)

(assert (=> b!341106 (=> (not res!188545) (not e!209210))))

(declare-fun zeroValue!1467 () V!10555)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10555)

(declare-datatypes ((tuple2!5184 0))(
  ( (tuple2!5185 (_1!2603 (_ BitVec 64)) (_2!2603 V!10555)) )
))
(declare-datatypes ((List!4788 0))(
  ( (Nil!4785) (Cons!4784 (h!5640 tuple2!5184) (t!9888 List!4788)) )
))
(declare-datatypes ((ListLongMap!4099 0))(
  ( (ListLongMap!4100 (toList!2065 List!4788)) )
))
(declare-fun contains!2138 (ListLongMap!4099 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1594 (array!17952 array!17954 (_ BitVec 32) (_ BitVec 32) V!10555 V!10555 (_ BitVec 32) Int) ListLongMap!4099)

(assert (=> b!341106 (= res!188545 (not (contains!2138 (getCurrentListMap!1594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341107 () Bool)

(declare-fun res!188543 () Bool)

(assert (=> b!341107 (=> (not res!188543) (not e!209210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17952 (_ BitVec 32)) Bool)

(assert (=> b!341107 (= res!188543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341108 () Bool)

(declare-fun mapRes!12201 () Bool)

(assert (=> b!341108 (= e!209206 (and e!209207 mapRes!12201))))

(declare-fun condMapEmpty!12201 () Bool)

(declare-fun mapDefault!12201 () ValueCell!3248)

(assert (=> b!341108 (= condMapEmpty!12201 (= (arr!8497 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3248)) mapDefault!12201)))))

(declare-fun b!341109 () Bool)

(declare-fun res!188546 () Bool)

(assert (=> b!341109 (=> (not res!188546) (not e!209209))))

(declare-fun arrayContainsKey!0 (array!17952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341109 (= res!188546 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12201 () Bool)

(assert (=> mapIsEmpty!12201 mapRes!12201))

(declare-fun b!341110 () Bool)

(declare-fun res!188548 () Bool)

(assert (=> b!341110 (=> (not res!188548) (not e!209210))))

(assert (=> b!341110 (= res!188548 (and (= (size!8849 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8848 _keys!1895) (size!8849 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341111 () Bool)

(declare-fun res!188547 () Bool)

(assert (=> b!341111 (=> (not res!188547) (not e!209210))))

(declare-datatypes ((List!4789 0))(
  ( (Nil!4786) (Cons!4785 (h!5641 (_ BitVec 64)) (t!9889 List!4789)) )
))
(declare-fun arrayNoDuplicates!0 (array!17952 (_ BitVec 32) List!4789) Bool)

(assert (=> b!341111 (= res!188547 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4786))))

(declare-fun mapNonEmpty!12201 () Bool)

(declare-fun tp!25226 () Bool)

(assert (=> mapNonEmpty!12201 (= mapRes!12201 (and tp!25226 e!209205))))

(declare-fun mapRest!12201 () (Array (_ BitVec 32) ValueCell!3248))

(declare-fun mapValue!12201 () ValueCell!3248)

(declare-fun mapKey!12201 () (_ BitVec 32))

(assert (=> mapNonEmpty!12201 (= (arr!8497 _values!1525) (store mapRest!12201 mapKey!12201 mapValue!12201))))

(declare-fun b!341112 () Bool)

(declare-fun res!188549 () Bool)

(assert (=> b!341112 (=> (not res!188549) (not e!209210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341112 (= res!188549 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34194 res!188542) b!341110))

(assert (= (and b!341110 res!188548) b!341107))

(assert (= (and b!341107 res!188543) b!341111))

(assert (= (and b!341111 res!188547) b!341112))

(assert (= (and b!341112 res!188549) b!341106))

(assert (= (and b!341106 res!188545) b!341102))

(assert (= (and b!341102 res!188544) b!341109))

(assert (= (and b!341109 res!188546) b!341105))

(assert (= (and b!341108 condMapEmpty!12201) mapIsEmpty!12201))

(assert (= (and b!341108 (not condMapEmpty!12201)) mapNonEmpty!12201))

(assert (= (and mapNonEmpty!12201 ((_ is ValueCellFull!3248) mapValue!12201)) b!341104))

(assert (= (and b!341108 ((_ is ValueCellFull!3248) mapDefault!12201)) b!341103))

(assert (= start!34194 b!341108))

(declare-fun m!343887 () Bool)

(assert (=> b!341106 m!343887))

(assert (=> b!341106 m!343887))

(declare-fun m!343889 () Bool)

(assert (=> b!341106 m!343889))

(declare-fun m!343891 () Bool)

(assert (=> b!341112 m!343891))

(declare-fun m!343893 () Bool)

(assert (=> b!341105 m!343893))

(declare-fun m!343895 () Bool)

(assert (=> start!34194 m!343895))

(declare-fun m!343897 () Bool)

(assert (=> start!34194 m!343897))

(declare-fun m!343899 () Bool)

(assert (=> start!34194 m!343899))

(declare-fun m!343901 () Bool)

(assert (=> b!341111 m!343901))

(declare-fun m!343903 () Bool)

(assert (=> mapNonEmpty!12201 m!343903))

(declare-fun m!343905 () Bool)

(assert (=> b!341102 m!343905))

(declare-fun m!343907 () Bool)

(assert (=> b!341107 m!343907))

(declare-fun m!343909 () Bool)

(assert (=> b!341109 m!343909))

(check-sat (not b!341106) (not start!34194) (not b!341102) (not b!341111) (not mapNonEmpty!12201) (not b!341109) (not b!341112) tp_is_empty!7183 (not b!341107) b_and!14445 (not b!341105) (not b_next!7231))
(check-sat b_and!14445 (not b_next!7231))
