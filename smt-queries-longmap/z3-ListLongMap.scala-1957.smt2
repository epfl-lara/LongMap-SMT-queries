; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34474 () Bool)

(assert start!34474)

(declare-fun b_free!7411 () Bool)

(declare-fun b_next!7411 () Bool)

(assert (=> start!34474 (= b_free!7411 (not b_next!7411))))

(declare-fun tp!25778 () Bool)

(declare-fun b_and!14633 () Bool)

(assert (=> start!34474 (= tp!25778 b_and!14633)))

(declare-fun b!344543 () Bool)

(declare-fun res!190590 () Bool)

(declare-fun e!211205 () Bool)

(assert (=> b!344543 (=> (not res!190590) (not e!211205))))

(declare-datatypes ((array!18308 0))(
  ( (array!18309 (arr!8670 (Array (_ BitVec 32) (_ BitVec 64))) (size!9022 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18308)

(declare-datatypes ((List!4912 0))(
  ( (Nil!4909) (Cons!4908 (h!5764 (_ BitVec 64)) (t!10020 List!4912)) )
))
(declare-fun arrayNoDuplicates!0 (array!18308 (_ BitVec 32) List!4912) Bool)

(assert (=> b!344543 (= res!190590 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4909))))

(declare-fun b!344544 () Bool)

(declare-fun e!211204 () Bool)

(declare-fun tp_is_empty!7363 () Bool)

(assert (=> b!344544 (= e!211204 tp_is_empty!7363)))

(declare-fun mapNonEmpty!12483 () Bool)

(declare-fun mapRes!12483 () Bool)

(declare-fun tp!25779 () Bool)

(declare-fun e!211202 () Bool)

(assert (=> mapNonEmpty!12483 (= mapRes!12483 (and tp!25779 e!211202))))

(declare-datatypes ((V!10795 0))(
  ( (V!10796 (val!3726 Int)) )
))
(declare-datatypes ((ValueCell!3338 0))(
  ( (ValueCellFull!3338 (v!5903 V!10795)) (EmptyCell!3338) )
))
(declare-fun mapValue!12483 () ValueCell!3338)

(declare-fun mapKey!12483 () (_ BitVec 32))

(declare-fun mapRest!12483 () (Array (_ BitVec 32) ValueCell!3338))

(declare-datatypes ((array!18310 0))(
  ( (array!18311 (arr!8671 (Array (_ BitVec 32) ValueCell!3338)) (size!9023 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18310)

(assert (=> mapNonEmpty!12483 (= (arr!8671 _values!1525) (store mapRest!12483 mapKey!12483 mapValue!12483))))

(declare-fun b!344545 () Bool)

(declare-fun e!211201 () Bool)

(assert (=> b!344545 (= e!211201 (and e!211204 mapRes!12483))))

(declare-fun condMapEmpty!12483 () Bool)

(declare-fun mapDefault!12483 () ValueCell!3338)

(assert (=> b!344545 (= condMapEmpty!12483 (= (arr!8671 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3338)) mapDefault!12483)))))

(declare-fun b!344546 () Bool)

(declare-fun res!190587 () Bool)

(assert (=> b!344546 (=> (not res!190587) (not e!211205))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18308 (_ BitVec 32)) Bool)

(assert (=> b!344546 (= res!190587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344547 () Bool)

(assert (=> b!344547 (= e!211205 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3295 0))(
  ( (MissingZero!3295 (index!15359 (_ BitVec 32))) (Found!3295 (index!15360 (_ BitVec 32))) (Intermediate!3295 (undefined!4107 Bool) (index!15361 (_ BitVec 32)) (x!34270 (_ BitVec 32))) (Undefined!3295) (MissingVacant!3295 (index!15362 (_ BitVec 32))) )
))
(declare-fun lt!162709 () SeekEntryResult!3295)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18308 (_ BitVec 32)) SeekEntryResult!3295)

(assert (=> b!344547 (= lt!162709 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344548 () Bool)

(declare-fun res!190592 () Bool)

(assert (=> b!344548 (=> (not res!190592) (not e!211205))))

(declare-fun zeroValue!1467 () V!10795)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10795)

(declare-datatypes ((tuple2!5310 0))(
  ( (tuple2!5311 (_1!2666 (_ BitVec 64)) (_2!2666 V!10795)) )
))
(declare-datatypes ((List!4913 0))(
  ( (Nil!4910) (Cons!4909 (h!5765 tuple2!5310) (t!10021 List!4913)) )
))
(declare-datatypes ((ListLongMap!4225 0))(
  ( (ListLongMap!4226 (toList!2128 List!4913)) )
))
(declare-fun contains!2205 (ListLongMap!4225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1657 (array!18308 array!18310 (_ BitVec 32) (_ BitVec 32) V!10795 V!10795 (_ BitVec 32) Int) ListLongMap!4225)

(assert (=> b!344548 (= res!190592 (not (contains!2205 (getCurrentListMap!1657 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344549 () Bool)

(declare-fun res!190591 () Bool)

(assert (=> b!344549 (=> (not res!190591) (not e!211205))))

(assert (=> b!344549 (= res!190591 (and (= (size!9023 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9022 _keys!1895) (size!9023 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344550 () Bool)

(assert (=> b!344550 (= e!211202 tp_is_empty!7363)))

(declare-fun b!344551 () Bool)

(declare-fun res!190588 () Bool)

(assert (=> b!344551 (=> (not res!190588) (not e!211205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344551 (= res!190588 (validKeyInArray!0 k0!1348))))

(declare-fun res!190589 () Bool)

(assert (=> start!34474 (=> (not res!190589) (not e!211205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34474 (= res!190589 (validMask!0 mask!2385))))

(assert (=> start!34474 e!211205))

(assert (=> start!34474 true))

(assert (=> start!34474 tp_is_empty!7363))

(assert (=> start!34474 tp!25778))

(declare-fun array_inv!6404 (array!18310) Bool)

(assert (=> start!34474 (and (array_inv!6404 _values!1525) e!211201)))

(declare-fun array_inv!6405 (array!18308) Bool)

(assert (=> start!34474 (array_inv!6405 _keys!1895)))

(declare-fun mapIsEmpty!12483 () Bool)

(assert (=> mapIsEmpty!12483 mapRes!12483))

(assert (= (and start!34474 res!190589) b!344549))

(assert (= (and b!344549 res!190591) b!344546))

(assert (= (and b!344546 res!190587) b!344543))

(assert (= (and b!344543 res!190590) b!344551))

(assert (= (and b!344551 res!190588) b!344548))

(assert (= (and b!344548 res!190592) b!344547))

(assert (= (and b!344545 condMapEmpty!12483) mapIsEmpty!12483))

(assert (= (and b!344545 (not condMapEmpty!12483)) mapNonEmpty!12483))

(get-info :version)

(assert (= (and mapNonEmpty!12483 ((_ is ValueCellFull!3338) mapValue!12483)) b!344550))

(assert (= (and b!344545 ((_ is ValueCellFull!3338) mapDefault!12483)) b!344544))

(assert (= start!34474 b!344545))

(declare-fun m!346401 () Bool)

(assert (=> b!344551 m!346401))

(declare-fun m!346403 () Bool)

(assert (=> start!34474 m!346403))

(declare-fun m!346405 () Bool)

(assert (=> start!34474 m!346405))

(declare-fun m!346407 () Bool)

(assert (=> start!34474 m!346407))

(declare-fun m!346409 () Bool)

(assert (=> b!344543 m!346409))

(declare-fun m!346411 () Bool)

(assert (=> b!344547 m!346411))

(declare-fun m!346413 () Bool)

(assert (=> mapNonEmpty!12483 m!346413))

(declare-fun m!346415 () Bool)

(assert (=> b!344548 m!346415))

(assert (=> b!344548 m!346415))

(declare-fun m!346417 () Bool)

(assert (=> b!344548 m!346417))

(declare-fun m!346419 () Bool)

(assert (=> b!344546 m!346419))

(check-sat tp_is_empty!7363 (not b!344548) (not b!344543) (not b_next!7411) (not b!344551) (not start!34474) (not b!344546) (not b!344547) (not mapNonEmpty!12483) b_and!14633)
(check-sat b_and!14633 (not b_next!7411))
