; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34326 () Bool)

(assert start!34326)

(declare-fun b_free!7315 () Bool)

(declare-fun b_next!7315 () Bool)

(assert (=> start!34326 (= b_free!7315 (not b_next!7315))))

(declare-fun tp!25484 () Bool)

(declare-fun b_and!14493 () Bool)

(assert (=> start!34326 (= tp!25484 b_and!14493)))

(declare-fun b!342636 () Bool)

(declare-fun res!189437 () Bool)

(declare-fun e!210092 () Bool)

(assert (=> b!342636 (=> (not res!189437) (not e!210092))))

(declare-datatypes ((array!18113 0))(
  ( (array!18114 (arr!8575 (Array (_ BitVec 32) (_ BitVec 64))) (size!8928 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18113)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18113 (_ BitVec 32)) Bool)

(assert (=> b!342636 (= res!189437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342637 () Bool)

(declare-fun e!210093 () Bool)

(declare-fun tp_is_empty!7267 () Bool)

(assert (=> b!342637 (= e!210093 tp_is_empty!7267)))

(declare-fun mapIsEmpty!12333 () Bool)

(declare-fun mapRes!12333 () Bool)

(assert (=> mapIsEmpty!12333 mapRes!12333))

(declare-fun b!342638 () Bool)

(declare-fun e!210095 () Bool)

(assert (=> b!342638 (= e!210095 false)))

(declare-datatypes ((Unit!10671 0))(
  ( (Unit!10672) )
))
(declare-fun lt!162042 () Unit!10671)

(declare-fun e!210094 () Unit!10671)

(assert (=> b!342638 (= lt!162042 e!210094)))

(declare-fun c!52781 () Bool)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342638 (= c!52781 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12333 () Bool)

(declare-fun tp!25485 () Bool)

(declare-fun e!210091 () Bool)

(assert (=> mapNonEmpty!12333 (= mapRes!12333 (and tp!25485 e!210091))))

(declare-datatypes ((V!10667 0))(
  ( (V!10668 (val!3678 Int)) )
))
(declare-datatypes ((ValueCell!3290 0))(
  ( (ValueCellFull!3290 (v!5846 V!10667)) (EmptyCell!3290) )
))
(declare-fun mapRest!12333 () (Array (_ BitVec 32) ValueCell!3290))

(declare-datatypes ((array!18115 0))(
  ( (array!18116 (arr!8576 (Array (_ BitVec 32) ValueCell!3290)) (size!8929 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18115)

(declare-fun mapValue!12333 () ValueCell!3290)

(declare-fun mapKey!12333 () (_ BitVec 32))

(assert (=> mapNonEmpty!12333 (= (arr!8576 _values!1525) (store mapRest!12333 mapKey!12333 mapValue!12333))))

(declare-fun b!342640 () Bool)

(declare-fun res!189439 () Bool)

(assert (=> b!342640 (=> (not res!189439) (not e!210092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342640 (= res!189439 (validKeyInArray!0 k0!1348))))

(declare-fun b!342641 () Bool)

(declare-fun e!210096 () Bool)

(assert (=> b!342641 (= e!210096 (and e!210093 mapRes!12333))))

(declare-fun condMapEmpty!12333 () Bool)

(declare-fun mapDefault!12333 () ValueCell!3290)

(assert (=> b!342641 (= condMapEmpty!12333 (= (arr!8576 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3290)) mapDefault!12333)))))

(declare-fun b!342642 () Bool)

(assert (=> b!342642 (= e!210091 tp_is_empty!7267)))

(declare-fun b!342643 () Bool)

(declare-fun res!189440 () Bool)

(assert (=> b!342643 (=> (not res!189440) (not e!210092))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!342643 (= res!189440 (and (= (size!8929 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8928 _keys!1895) (size!8929 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342644 () Bool)

(declare-fun res!189434 () Bool)

(assert (=> b!342644 (=> (not res!189434) (not e!210092))))

(declare-fun zeroValue!1467 () V!10667)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10667)

(declare-datatypes ((tuple2!5278 0))(
  ( (tuple2!5279 (_1!2650 (_ BitVec 64)) (_2!2650 V!10667)) )
))
(declare-datatypes ((List!4899 0))(
  ( (Nil!4896) (Cons!4895 (h!5751 tuple2!5278) (t!10002 List!4899)) )
))
(declare-datatypes ((ListLongMap!4181 0))(
  ( (ListLongMap!4182 (toList!2106 List!4899)) )
))
(declare-fun contains!2173 (ListLongMap!4181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1612 (array!18113 array!18115 (_ BitVec 32) (_ BitVec 32) V!10667 V!10667 (_ BitVec 32) Int) ListLongMap!4181)

(assert (=> b!342644 (= res!189434 (not (contains!2173 (getCurrentListMap!1612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342645 () Bool)

(declare-fun Unit!10673 () Unit!10671)

(assert (=> b!342645 (= e!210094 Unit!10673)))

(declare-fun lt!162041 () Unit!10671)

(declare-fun lemmaArrayContainsKeyThenInListMap!309 (array!18113 array!18115 (_ BitVec 32) (_ BitVec 32) V!10667 V!10667 (_ BitVec 64) (_ BitVec 32) Int) Unit!10671)

(declare-fun arrayScanForKey!0 (array!18113 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342645 (= lt!162041 (lemmaArrayContainsKeyThenInListMap!309 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342645 false))

(declare-fun b!342646 () Bool)

(assert (=> b!342646 (= e!210092 e!210095)))

(declare-fun res!189436 () Bool)

(assert (=> b!342646 (=> (not res!189436) (not e!210095))))

(declare-datatypes ((SeekEntryResult!3304 0))(
  ( (MissingZero!3304 (index!15395 (_ BitVec 32))) (Found!3304 (index!15396 (_ BitVec 32))) (Intermediate!3304 (undefined!4116 Bool) (index!15397 (_ BitVec 32)) (x!34129 (_ BitVec 32))) (Undefined!3304) (MissingVacant!3304 (index!15398 (_ BitVec 32))) )
))
(declare-fun lt!162040 () SeekEntryResult!3304)

(get-info :version)

(assert (=> b!342646 (= res!189436 (and (not ((_ is Found!3304) lt!162040)) (not ((_ is MissingZero!3304) lt!162040)) ((_ is MissingVacant!3304) lt!162040)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18113 (_ BitVec 32)) SeekEntryResult!3304)

(assert (=> b!342646 (= lt!162040 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342647 () Bool)

(declare-fun res!189435 () Bool)

(assert (=> b!342647 (=> (not res!189435) (not e!210092))))

(declare-datatypes ((List!4900 0))(
  ( (Nil!4897) (Cons!4896 (h!5752 (_ BitVec 64)) (t!10003 List!4900)) )
))
(declare-fun arrayNoDuplicates!0 (array!18113 (_ BitVec 32) List!4900) Bool)

(assert (=> b!342647 (= res!189435 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4897))))

(declare-fun res!189438 () Bool)

(assert (=> start!34326 (=> (not res!189438) (not e!210092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34326 (= res!189438 (validMask!0 mask!2385))))

(assert (=> start!34326 e!210092))

(assert (=> start!34326 true))

(assert (=> start!34326 tp_is_empty!7267))

(assert (=> start!34326 tp!25484))

(declare-fun array_inv!6376 (array!18115) Bool)

(assert (=> start!34326 (and (array_inv!6376 _values!1525) e!210096)))

(declare-fun array_inv!6377 (array!18113) Bool)

(assert (=> start!34326 (array_inv!6377 _keys!1895)))

(declare-fun b!342639 () Bool)

(declare-fun Unit!10674 () Unit!10671)

(assert (=> b!342639 (= e!210094 Unit!10674)))

(assert (= (and start!34326 res!189438) b!342643))

(assert (= (and b!342643 res!189440) b!342636))

(assert (= (and b!342636 res!189437) b!342647))

(assert (= (and b!342647 res!189435) b!342640))

(assert (= (and b!342640 res!189439) b!342644))

(assert (= (and b!342644 res!189434) b!342646))

(assert (= (and b!342646 res!189436) b!342638))

(assert (= (and b!342638 c!52781) b!342645))

(assert (= (and b!342638 (not c!52781)) b!342639))

(assert (= (and b!342641 condMapEmpty!12333) mapIsEmpty!12333))

(assert (= (and b!342641 (not condMapEmpty!12333)) mapNonEmpty!12333))

(assert (= (and mapNonEmpty!12333 ((_ is ValueCellFull!3290) mapValue!12333)) b!342642))

(assert (= (and b!342641 ((_ is ValueCellFull!3290) mapDefault!12333)) b!342637))

(assert (= start!34326 b!342641))

(declare-fun m!344205 () Bool)

(assert (=> b!342645 m!344205))

(assert (=> b!342645 m!344205))

(declare-fun m!344207 () Bool)

(assert (=> b!342645 m!344207))

(declare-fun m!344209 () Bool)

(assert (=> b!342638 m!344209))

(declare-fun m!344211 () Bool)

(assert (=> start!34326 m!344211))

(declare-fun m!344213 () Bool)

(assert (=> start!34326 m!344213))

(declare-fun m!344215 () Bool)

(assert (=> start!34326 m!344215))

(declare-fun m!344217 () Bool)

(assert (=> mapNonEmpty!12333 m!344217))

(declare-fun m!344219 () Bool)

(assert (=> b!342640 m!344219))

(declare-fun m!344221 () Bool)

(assert (=> b!342647 m!344221))

(declare-fun m!344223 () Bool)

(assert (=> b!342644 m!344223))

(assert (=> b!342644 m!344223))

(declare-fun m!344225 () Bool)

(assert (=> b!342644 m!344225))

(declare-fun m!344227 () Bool)

(assert (=> b!342636 m!344227))

(declare-fun m!344229 () Bool)

(assert (=> b!342646 m!344229))

(check-sat b_and!14493 (not b!342636) (not b!342647) tp_is_empty!7267 (not b!342646) (not b!342644) (not b_next!7315) (not b!342645) (not start!34326) (not b!342640) (not mapNonEmpty!12333) (not b!342638))
(check-sat b_and!14493 (not b_next!7315))
