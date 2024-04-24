; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34218 () Bool)

(assert start!34218)

(declare-fun b_free!7255 () Bool)

(declare-fun b_next!7255 () Bool)

(assert (=> start!34218 (= b_free!7255 (not b_next!7255))))

(declare-fun tp!25298 () Bool)

(declare-fun b_and!14469 () Bool)

(assert (=> start!34218 (= tp!25298 b_and!14469)))

(declare-fun res!188832 () Bool)

(declare-fun e!209429 () Bool)

(assert (=> start!34218 (=> (not res!188832) (not e!209429))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34218 (= res!188832 (validMask!0 mask!2385))))

(assert (=> start!34218 e!209429))

(assert (=> start!34218 true))

(declare-fun tp_is_empty!7207 () Bool)

(assert (=> start!34218 tp_is_empty!7207))

(assert (=> start!34218 tp!25298))

(declare-datatypes ((V!10587 0))(
  ( (V!10588 (val!3648 Int)) )
))
(declare-datatypes ((ValueCell!3260 0))(
  ( (ValueCellFull!3260 (v!5821 V!10587)) (EmptyCell!3260) )
))
(declare-datatypes ((array!18000 0))(
  ( (array!18001 (arr!8520 (Array (_ BitVec 32) ValueCell!3260)) (size!8872 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18000)

(declare-fun e!209424 () Bool)

(declare-fun array_inv!6304 (array!18000) Bool)

(assert (=> start!34218 (and (array_inv!6304 _values!1525) e!209424)))

(declare-datatypes ((array!18002 0))(
  ( (array!18003 (arr!8521 (Array (_ BitVec 32) (_ BitVec 64))) (size!8873 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18002)

(declare-fun array_inv!6305 (array!18002) Bool)

(assert (=> start!34218 (array_inv!6305 _keys!1895)))

(declare-fun b!341500 () Bool)

(declare-fun res!188829 () Bool)

(assert (=> b!341500 (=> (not res!188829) (not e!209429))))

(declare-datatypes ((List!4806 0))(
  ( (Nil!4803) (Cons!4802 (h!5658 (_ BitVec 64)) (t!9906 List!4806)) )
))
(declare-fun arrayNoDuplicates!0 (array!18002 (_ BitVec 32) List!4806) Bool)

(assert (=> b!341500 (= res!188829 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4803))))

(declare-fun b!341501 () Bool)

(declare-datatypes ((Unit!10572 0))(
  ( (Unit!10573) )
))
(declare-fun e!209428 () Unit!10572)

(declare-fun Unit!10574 () Unit!10572)

(assert (=> b!341501 (= e!209428 Unit!10574)))

(declare-fun b!341502 () Bool)

(declare-fun res!188830 () Bool)

(assert (=> b!341502 (=> (not res!188830) (not e!209429))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341502 (= res!188830 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12237 () Bool)

(declare-fun mapRes!12237 () Bool)

(assert (=> mapIsEmpty!12237 mapRes!12237))

(declare-fun b!341503 () Bool)

(declare-fun e!209423 () Bool)

(assert (=> b!341503 (= e!209423 false)))

(declare-fun lt!161810 () Unit!10572)

(assert (=> b!341503 (= lt!161810 e!209428)))

(declare-fun c!52661 () Bool)

(declare-fun arrayContainsKey!0 (array!18002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341503 (= c!52661 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341504 () Bool)

(declare-fun e!209427 () Bool)

(assert (=> b!341504 (= e!209427 tp_is_empty!7207)))

(declare-fun b!341505 () Bool)

(declare-fun res!188833 () Bool)

(assert (=> b!341505 (=> (not res!188833) (not e!209429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18002 (_ BitVec 32)) Bool)

(assert (=> b!341505 (= res!188833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341506 () Bool)

(declare-fun e!209426 () Bool)

(assert (=> b!341506 (= e!209426 tp_is_empty!7207)))

(declare-fun b!341507 () Bool)

(assert (=> b!341507 (= e!209424 (and e!209427 mapRes!12237))))

(declare-fun condMapEmpty!12237 () Bool)

(declare-fun mapDefault!12237 () ValueCell!3260)

(assert (=> b!341507 (= condMapEmpty!12237 (= (arr!8520 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3260)) mapDefault!12237)))))

(declare-fun b!341508 () Bool)

(declare-fun res!188831 () Bool)

(assert (=> b!341508 (=> (not res!188831) (not e!209429))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341508 (= res!188831 (and (= (size!8872 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8873 _keys!1895) (size!8872 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341509 () Bool)

(assert (=> b!341509 (= e!209429 e!209423)))

(declare-fun res!188834 () Bool)

(assert (=> b!341509 (=> (not res!188834) (not e!209423))))

(declare-datatypes ((SeekEntryResult!3244 0))(
  ( (MissingZero!3244 (index!15155 (_ BitVec 32))) (Found!3244 (index!15156 (_ BitVec 32))) (Intermediate!3244 (undefined!4056 Bool) (index!15157 (_ BitVec 32)) (x!33971 (_ BitVec 32))) (Undefined!3244) (MissingVacant!3244 (index!15158 (_ BitVec 32))) )
))
(declare-fun lt!161812 () SeekEntryResult!3244)

(get-info :version)

(assert (=> b!341509 (= res!188834 (and (not ((_ is Found!3244) lt!161812)) (not ((_ is MissingZero!3244) lt!161812)) ((_ is MissingVacant!3244) lt!161812)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18002 (_ BitVec 32)) SeekEntryResult!3244)

(assert (=> b!341509 (= lt!161812 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341510 () Bool)

(declare-fun res!188828 () Bool)

(assert (=> b!341510 (=> (not res!188828) (not e!209429))))

(declare-fun zeroValue!1467 () V!10587)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10587)

(declare-datatypes ((tuple2!5202 0))(
  ( (tuple2!5203 (_1!2612 (_ BitVec 64)) (_2!2612 V!10587)) )
))
(declare-datatypes ((List!4807 0))(
  ( (Nil!4804) (Cons!4803 (h!5659 tuple2!5202) (t!9907 List!4807)) )
))
(declare-datatypes ((ListLongMap!4117 0))(
  ( (ListLongMap!4118 (toList!2074 List!4807)) )
))
(declare-fun contains!2147 (ListLongMap!4117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1603 (array!18002 array!18000 (_ BitVec 32) (_ BitVec 32) V!10587 V!10587 (_ BitVec 32) Int) ListLongMap!4117)

(assert (=> b!341510 (= res!188828 (not (contains!2147 (getCurrentListMap!1603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12237 () Bool)

(declare-fun tp!25299 () Bool)

(assert (=> mapNonEmpty!12237 (= mapRes!12237 (and tp!25299 e!209426))))

(declare-fun mapValue!12237 () ValueCell!3260)

(declare-fun mapKey!12237 () (_ BitVec 32))

(declare-fun mapRest!12237 () (Array (_ BitVec 32) ValueCell!3260))

(assert (=> mapNonEmpty!12237 (= (arr!8520 _values!1525) (store mapRest!12237 mapKey!12237 mapValue!12237))))

(declare-fun b!341511 () Bool)

(declare-fun Unit!10575 () Unit!10572)

(assert (=> b!341511 (= e!209428 Unit!10575)))

(declare-fun lt!161811 () Unit!10572)

(declare-fun lemmaArrayContainsKeyThenInListMap!296 (array!18002 array!18000 (_ BitVec 32) (_ BitVec 32) V!10587 V!10587 (_ BitVec 64) (_ BitVec 32) Int) Unit!10572)

(declare-fun arrayScanForKey!0 (array!18002 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341511 (= lt!161811 (lemmaArrayContainsKeyThenInListMap!296 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341511 false))

(assert (= (and start!34218 res!188832) b!341508))

(assert (= (and b!341508 res!188831) b!341505))

(assert (= (and b!341505 res!188833) b!341500))

(assert (= (and b!341500 res!188829) b!341502))

(assert (= (and b!341502 res!188830) b!341510))

(assert (= (and b!341510 res!188828) b!341509))

(assert (= (and b!341509 res!188834) b!341503))

(assert (= (and b!341503 c!52661) b!341511))

(assert (= (and b!341503 (not c!52661)) b!341501))

(assert (= (and b!341507 condMapEmpty!12237) mapIsEmpty!12237))

(assert (= (and b!341507 (not condMapEmpty!12237)) mapNonEmpty!12237))

(assert (= (and mapNonEmpty!12237 ((_ is ValueCellFull!3260) mapValue!12237)) b!341506))

(assert (= (and b!341507 ((_ is ValueCellFull!3260) mapDefault!12237)) b!341504))

(assert (= start!34218 b!341507))

(declare-fun m!344175 () Bool)

(assert (=> mapNonEmpty!12237 m!344175))

(declare-fun m!344177 () Bool)

(assert (=> b!341502 m!344177))

(declare-fun m!344179 () Bool)

(assert (=> start!34218 m!344179))

(declare-fun m!344181 () Bool)

(assert (=> start!34218 m!344181))

(declare-fun m!344183 () Bool)

(assert (=> start!34218 m!344183))

(declare-fun m!344185 () Bool)

(assert (=> b!341509 m!344185))

(declare-fun m!344187 () Bool)

(assert (=> b!341500 m!344187))

(declare-fun m!344189 () Bool)

(assert (=> b!341510 m!344189))

(assert (=> b!341510 m!344189))

(declare-fun m!344191 () Bool)

(assert (=> b!341510 m!344191))

(declare-fun m!344193 () Bool)

(assert (=> b!341503 m!344193))

(declare-fun m!344195 () Bool)

(assert (=> b!341511 m!344195))

(assert (=> b!341511 m!344195))

(declare-fun m!344197 () Bool)

(assert (=> b!341511 m!344197))

(declare-fun m!344199 () Bool)

(assert (=> b!341505 m!344199))

(check-sat (not b!341500) (not b!341502) tp_is_empty!7207 (not b!341503) (not b!341511) (not b!341505) (not mapNonEmpty!12237) (not b!341509) (not start!34218) b_and!14469 (not b!341510) (not b_next!7255))
(check-sat b_and!14469 (not b_next!7255))
