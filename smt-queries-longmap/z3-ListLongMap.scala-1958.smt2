; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34496 () Bool)

(assert start!34496)

(declare-fun b_free!7419 () Bool)

(declare-fun b_next!7419 () Bool)

(assert (=> start!34496 (= b_free!7419 (not b_next!7419))))

(declare-fun tp!25802 () Bool)

(declare-fun b_and!14627 () Bool)

(assert (=> start!34496 (= tp!25802 b_and!14627)))

(declare-fun b!344704 () Bool)

(declare-fun e!211299 () Bool)

(declare-fun e!211297 () Bool)

(declare-fun mapRes!12495 () Bool)

(assert (=> b!344704 (= e!211299 (and e!211297 mapRes!12495))))

(declare-fun condMapEmpty!12495 () Bool)

(declare-datatypes ((V!10805 0))(
  ( (V!10806 (val!3730 Int)) )
))
(declare-datatypes ((ValueCell!3342 0))(
  ( (ValueCellFull!3342 (v!5906 V!10805)) (EmptyCell!3342) )
))
(declare-datatypes ((array!18329 0))(
  ( (array!18330 (arr!8681 (Array (_ BitVec 32) ValueCell!3342)) (size!9033 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18329)

(declare-fun mapDefault!12495 () ValueCell!3342)

(assert (=> b!344704 (= condMapEmpty!12495 (= (arr!8681 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3342)) mapDefault!12495)))))

(declare-fun mapIsEmpty!12495 () Bool)

(assert (=> mapIsEmpty!12495 mapRes!12495))

(declare-fun b!344705 () Bool)

(declare-fun res!190664 () Bool)

(declare-fun e!211295 () Bool)

(assert (=> b!344705 (=> (not res!190664) (not e!211295))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18331 0))(
  ( (array!18332 (arr!8682 (Array (_ BitVec 32) (_ BitVec 64))) (size!9034 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18331)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344705 (= res!190664 (and (= (size!9033 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9034 _keys!1895) (size!9033 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344706 () Bool)

(declare-fun res!190666 () Bool)

(assert (=> b!344706 (=> (not res!190666) (not e!211295))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344706 (= res!190666 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12495 () Bool)

(declare-fun tp!25803 () Bool)

(declare-fun e!211298 () Bool)

(assert (=> mapNonEmpty!12495 (= mapRes!12495 (and tp!25803 e!211298))))

(declare-fun mapRest!12495 () (Array (_ BitVec 32) ValueCell!3342))

(declare-fun mapKey!12495 () (_ BitVec 32))

(declare-fun mapValue!12495 () ValueCell!3342)

(assert (=> mapNonEmpty!12495 (= (arr!8681 _values!1525) (store mapRest!12495 mapKey!12495 mapValue!12495))))

(declare-fun b!344707 () Bool)

(declare-fun res!190663 () Bool)

(assert (=> b!344707 (=> (not res!190663) (not e!211295))))

(declare-fun zeroValue!1467 () V!10805)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10805)

(declare-datatypes ((tuple2!5400 0))(
  ( (tuple2!5401 (_1!2711 (_ BitVec 64)) (_2!2711 V!10805)) )
))
(declare-datatypes ((List!5022 0))(
  ( (Nil!5019) (Cons!5018 (h!5874 tuple2!5400) (t!10138 List!5022)) )
))
(declare-datatypes ((ListLongMap!4313 0))(
  ( (ListLongMap!4314 (toList!2172 List!5022)) )
))
(declare-fun contains!2230 (ListLongMap!4313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1693 (array!18331 array!18329 (_ BitVec 32) (_ BitVec 32) V!10805 V!10805 (_ BitVec 32) Int) ListLongMap!4313)

(assert (=> b!344707 (= res!190663 (not (contains!2230 (getCurrentListMap!1693 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344708 () Bool)

(declare-fun tp_is_empty!7371 () Bool)

(assert (=> b!344708 (= e!211297 tp_is_empty!7371)))

(declare-fun b!344709 () Bool)

(assert (=> b!344709 (= e!211298 tp_is_empty!7371)))

(declare-fun b!344710 () Bool)

(declare-fun res!190662 () Bool)

(assert (=> b!344710 (=> (not res!190662) (not e!211295))))

(declare-datatypes ((List!5023 0))(
  ( (Nil!5020) (Cons!5019 (h!5875 (_ BitVec 64)) (t!10139 List!5023)) )
))
(declare-fun arrayNoDuplicates!0 (array!18331 (_ BitVec 32) List!5023) Bool)

(assert (=> b!344710 (= res!190662 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5020))))

(declare-fun res!190665 () Bool)

(assert (=> start!34496 (=> (not res!190665) (not e!211295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34496 (= res!190665 (validMask!0 mask!2385))))

(assert (=> start!34496 e!211295))

(assert (=> start!34496 true))

(assert (=> start!34496 tp_is_empty!7371))

(assert (=> start!34496 tp!25802))

(declare-fun array_inv!6428 (array!18329) Bool)

(assert (=> start!34496 (and (array_inv!6428 _values!1525) e!211299)))

(declare-fun array_inv!6429 (array!18331) Bool)

(assert (=> start!34496 (array_inv!6429 _keys!1895)))

(declare-fun b!344711 () Bool)

(declare-fun res!190667 () Bool)

(assert (=> b!344711 (=> (not res!190667) (not e!211295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18331 (_ BitVec 32)) Bool)

(assert (=> b!344711 (= res!190667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344712 () Bool)

(assert (=> b!344712 (= e!211295 false)))

(declare-datatypes ((SeekEntryResult!3346 0))(
  ( (MissingZero!3346 (index!15563 (_ BitVec 32))) (Found!3346 (index!15564 (_ BitVec 32))) (Intermediate!3346 (undefined!4158 Bool) (index!15565 (_ BitVec 32)) (x!34332 (_ BitVec 32))) (Undefined!3346) (MissingVacant!3346 (index!15566 (_ BitVec 32))) )
))
(declare-fun lt!162703 () SeekEntryResult!3346)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18331 (_ BitVec 32)) SeekEntryResult!3346)

(assert (=> b!344712 (= lt!162703 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34496 res!190665) b!344705))

(assert (= (and b!344705 res!190664) b!344711))

(assert (= (and b!344711 res!190667) b!344710))

(assert (= (and b!344710 res!190662) b!344706))

(assert (= (and b!344706 res!190666) b!344707))

(assert (= (and b!344707 res!190663) b!344712))

(assert (= (and b!344704 condMapEmpty!12495) mapIsEmpty!12495))

(assert (= (and b!344704 (not condMapEmpty!12495)) mapNonEmpty!12495))

(get-info :version)

(assert (= (and mapNonEmpty!12495 ((_ is ValueCellFull!3342) mapValue!12495)) b!344709))

(assert (= (and b!344704 ((_ is ValueCellFull!3342) mapDefault!12495)) b!344708))

(assert (= start!34496 b!344704))

(declare-fun m!346257 () Bool)

(assert (=> mapNonEmpty!12495 m!346257))

(declare-fun m!346259 () Bool)

(assert (=> b!344706 m!346259))

(declare-fun m!346261 () Bool)

(assert (=> b!344707 m!346261))

(assert (=> b!344707 m!346261))

(declare-fun m!346263 () Bool)

(assert (=> b!344707 m!346263))

(declare-fun m!346265 () Bool)

(assert (=> b!344711 m!346265))

(declare-fun m!346267 () Bool)

(assert (=> b!344710 m!346267))

(declare-fun m!346269 () Bool)

(assert (=> b!344712 m!346269))

(declare-fun m!346271 () Bool)

(assert (=> start!34496 m!346271))

(declare-fun m!346273 () Bool)

(assert (=> start!34496 m!346273))

(declare-fun m!346275 () Bool)

(assert (=> start!34496 m!346275))

(check-sat (not b_next!7419) b_and!14627 (not b!344712) (not b!344710) (not b!344711) (not b!344706) (not start!34496) (not mapNonEmpty!12495) tp_is_empty!7371 (not b!344707))
(check-sat b_and!14627 (not b_next!7419))
