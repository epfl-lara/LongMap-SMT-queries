; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34152 () Bool)

(assert start!34152)

(declare-fun b_free!7189 () Bool)

(declare-fun b_next!7189 () Bool)

(assert (=> start!34152 (= b_free!7189 (not b_next!7189))))

(declare-fun tp!25100 () Bool)

(declare-fun b_and!14363 () Bool)

(assert (=> start!34152 (= tp!25100 b_and!14363)))

(declare-fun b!340187 () Bool)

(declare-fun res!187915 () Bool)

(declare-fun e!208686 () Bool)

(assert (=> b!340187 (=> (not res!187915) (not e!208686))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10499 0))(
  ( (V!10500 (val!3615 Int)) )
))
(declare-fun zeroValue!1467 () V!10499)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3227 0))(
  ( (ValueCellFull!3227 (v!5781 V!10499)) (EmptyCell!3227) )
))
(declare-datatypes ((array!17859 0))(
  ( (array!17860 (arr!8450 (Array (_ BitVec 32) ValueCell!3227)) (size!8803 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17859)

(declare-datatypes ((array!17861 0))(
  ( (array!17862 (arr!8451 (Array (_ BitVec 32) (_ BitVec 64))) (size!8804 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17861)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10499)

(declare-datatypes ((tuple2!5186 0))(
  ( (tuple2!5187 (_1!2604 (_ BitVec 64)) (_2!2604 V!10499)) )
))
(declare-datatypes ((List!4811 0))(
  ( (Nil!4808) (Cons!4807 (h!5663 tuple2!5186) (t!9910 List!4811)) )
))
(declare-datatypes ((ListLongMap!4089 0))(
  ( (ListLongMap!4090 (toList!2060 List!4811)) )
))
(declare-fun contains!2125 (ListLongMap!4089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1566 (array!17861 array!17859 (_ BitVec 32) (_ BitVec 32) V!10499 V!10499 (_ BitVec 32) Int) ListLongMap!4089)

(assert (=> b!340187 (= res!187915 (not (contains!2125 (getCurrentListMap!1566 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340188 () Bool)

(declare-fun res!187913 () Bool)

(assert (=> b!340188 (=> (not res!187913) (not e!208686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340188 (= res!187913 (validKeyInArray!0 k0!1348))))

(declare-fun b!340189 () Bool)

(declare-fun res!187914 () Bool)

(assert (=> b!340189 (=> (not res!187914) (not e!208686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17861 (_ BitVec 32)) Bool)

(assert (=> b!340189 (= res!187914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12138 () Bool)

(declare-fun mapRes!12138 () Bool)

(assert (=> mapIsEmpty!12138 mapRes!12138))

(declare-fun b!340190 () Bool)

(declare-fun res!187912 () Bool)

(assert (=> b!340190 (=> (not res!187912) (not e!208686))))

(declare-datatypes ((List!4812 0))(
  ( (Nil!4809) (Cons!4808 (h!5664 (_ BitVec 64)) (t!9911 List!4812)) )
))
(declare-fun arrayNoDuplicates!0 (array!17861 (_ BitVec 32) List!4812) Bool)

(assert (=> b!340190 (= res!187912 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4809))))

(declare-fun res!187917 () Bool)

(assert (=> start!34152 (=> (not res!187917) (not e!208686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34152 (= res!187917 (validMask!0 mask!2385))))

(assert (=> start!34152 e!208686))

(assert (=> start!34152 true))

(declare-fun tp_is_empty!7141 () Bool)

(assert (=> start!34152 tp_is_empty!7141))

(assert (=> start!34152 tp!25100))

(declare-fun e!208690 () Bool)

(declare-fun array_inv!6290 (array!17859) Bool)

(assert (=> start!34152 (and (array_inv!6290 _values!1525) e!208690)))

(declare-fun array_inv!6291 (array!17861) Bool)

(assert (=> start!34152 (array_inv!6291 _keys!1895)))

(declare-fun b!340191 () Bool)

(declare-fun e!208685 () Bool)

(assert (=> b!340191 (= e!208685 tp_is_empty!7141)))

(declare-fun b!340192 () Bool)

(declare-fun e!208688 () Bool)

(assert (=> b!340192 (= e!208688 false)))

(declare-fun lt!161357 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17861 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340192 (= lt!161357 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340193 () Bool)

(assert (=> b!340193 (= e!208690 (and e!208685 mapRes!12138))))

(declare-fun condMapEmpty!12138 () Bool)

(declare-fun mapDefault!12138 () ValueCell!3227)

(assert (=> b!340193 (= condMapEmpty!12138 (= (arr!8450 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3227)) mapDefault!12138)))))

(declare-fun b!340194 () Bool)

(declare-fun e!208689 () Bool)

(assert (=> b!340194 (= e!208689 tp_is_empty!7141)))

(declare-fun b!340195 () Bool)

(declare-fun res!187919 () Bool)

(assert (=> b!340195 (=> (not res!187919) (not e!208686))))

(assert (=> b!340195 (= res!187919 (and (= (size!8803 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8804 _keys!1895) (size!8803 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340196 () Bool)

(declare-fun res!187918 () Bool)

(assert (=> b!340196 (=> (not res!187918) (not e!208688))))

(declare-fun arrayContainsKey!0 (array!17861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340196 (= res!187918 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340197 () Bool)

(assert (=> b!340197 (= e!208686 e!208688)))

(declare-fun res!187916 () Bool)

(assert (=> b!340197 (=> (not res!187916) (not e!208688))))

(declare-datatypes ((SeekEntryResult!3256 0))(
  ( (MissingZero!3256 (index!15203 (_ BitVec 32))) (Found!3256 (index!15204 (_ BitVec 32))) (Intermediate!3256 (undefined!4068 Bool) (index!15205 (_ BitVec 32)) (x!33893 (_ BitVec 32))) (Undefined!3256) (MissingVacant!3256 (index!15206 (_ BitVec 32))) )
))
(declare-fun lt!161358 () SeekEntryResult!3256)

(get-info :version)

(assert (=> b!340197 (= res!187916 (and (not ((_ is Found!3256) lt!161358)) (not ((_ is MissingZero!3256) lt!161358)) ((_ is MissingVacant!3256) lt!161358)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17861 (_ BitVec 32)) SeekEntryResult!3256)

(assert (=> b!340197 (= lt!161358 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12138 () Bool)

(declare-fun tp!25101 () Bool)

(assert (=> mapNonEmpty!12138 (= mapRes!12138 (and tp!25101 e!208689))))

(declare-fun mapRest!12138 () (Array (_ BitVec 32) ValueCell!3227))

(declare-fun mapKey!12138 () (_ BitVec 32))

(declare-fun mapValue!12138 () ValueCell!3227)

(assert (=> mapNonEmpty!12138 (= (arr!8450 _values!1525) (store mapRest!12138 mapKey!12138 mapValue!12138))))

(assert (= (and start!34152 res!187917) b!340195))

(assert (= (and b!340195 res!187919) b!340189))

(assert (= (and b!340189 res!187914) b!340190))

(assert (= (and b!340190 res!187912) b!340188))

(assert (= (and b!340188 res!187913) b!340187))

(assert (= (and b!340187 res!187915) b!340197))

(assert (= (and b!340197 res!187916) b!340196))

(assert (= (and b!340196 res!187918) b!340192))

(assert (= (and b!340193 condMapEmpty!12138) mapIsEmpty!12138))

(assert (= (and b!340193 (not condMapEmpty!12138)) mapNonEmpty!12138))

(assert (= (and mapNonEmpty!12138 ((_ is ValueCellFull!3227) mapValue!12138)) b!340194))

(assert (= (and b!340193 ((_ is ValueCellFull!3227) mapDefault!12138)) b!340191))

(assert (= start!34152 b!340193))

(declare-fun m!342429 () Bool)

(assert (=> start!34152 m!342429))

(declare-fun m!342431 () Bool)

(assert (=> start!34152 m!342431))

(declare-fun m!342433 () Bool)

(assert (=> start!34152 m!342433))

(declare-fun m!342435 () Bool)

(assert (=> b!340189 m!342435))

(declare-fun m!342437 () Bool)

(assert (=> b!340197 m!342437))

(declare-fun m!342439 () Bool)

(assert (=> b!340196 m!342439))

(declare-fun m!342441 () Bool)

(assert (=> b!340192 m!342441))

(declare-fun m!342443 () Bool)

(assert (=> b!340190 m!342443))

(declare-fun m!342445 () Bool)

(assert (=> b!340188 m!342445))

(declare-fun m!342447 () Bool)

(assert (=> mapNonEmpty!12138 m!342447))

(declare-fun m!342449 () Bool)

(assert (=> b!340187 m!342449))

(assert (=> b!340187 m!342449))

(declare-fun m!342451 () Bool)

(assert (=> b!340187 m!342451))

(check-sat (not b!340189) tp_is_empty!7141 b_and!14363 (not b!340188) (not b_next!7189) (not mapNonEmpty!12138) (not b!340187) (not b!340192) (not start!34152) (not b!340190) (not b!340197) (not b!340196))
(check-sat b_and!14363 (not b_next!7189))
