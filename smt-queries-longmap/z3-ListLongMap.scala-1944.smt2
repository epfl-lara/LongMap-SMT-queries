; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34396 () Bool)

(assert start!34396)

(declare-fun b_free!7333 () Bool)

(declare-fun b_next!7333 () Bool)

(assert (=> start!34396 (= b_free!7333 (not b_next!7333))))

(declare-fun tp!25545 () Bool)

(declare-fun b_and!14515 () Bool)

(assert (=> start!34396 (= tp!25545 b_and!14515)))

(declare-fun b!343268 () Bool)

(declare-fun res!189764 () Bool)

(declare-fun e!210474 () Bool)

(assert (=> b!343268 (=> (not res!189764) (not e!210474))))

(declare-datatypes ((array!18153 0))(
  ( (array!18154 (arr!8593 (Array (_ BitVec 32) (_ BitVec 64))) (size!8946 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18153)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18153 (_ BitVec 32)) Bool)

(assert (=> b!343268 (= res!189764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343269 () Bool)

(declare-fun res!189761 () Bool)

(assert (=> b!343269 (=> (not res!189761) (not e!210474))))

(declare-datatypes ((List!4914 0))(
  ( (Nil!4911) (Cons!4910 (h!5766 (_ BitVec 64)) (t!10021 List!4914)) )
))
(declare-fun arrayNoDuplicates!0 (array!18153 (_ BitVec 32) List!4914) Bool)

(assert (=> b!343269 (= res!189761 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4911))))

(declare-fun res!189760 () Bool)

(assert (=> start!34396 (=> (not res!189760) (not e!210474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34396 (= res!189760 (validMask!0 mask!2385))))

(assert (=> start!34396 e!210474))

(assert (=> start!34396 true))

(declare-fun tp_is_empty!7285 () Bool)

(assert (=> start!34396 tp_is_empty!7285))

(assert (=> start!34396 tp!25545))

(declare-datatypes ((V!10691 0))(
  ( (V!10692 (val!3687 Int)) )
))
(declare-datatypes ((ValueCell!3299 0))(
  ( (ValueCellFull!3299 (v!5857 V!10691)) (EmptyCell!3299) )
))
(declare-datatypes ((array!18155 0))(
  ( (array!18156 (arr!8594 (Array (_ BitVec 32) ValueCell!3299)) (size!8947 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18155)

(declare-fun e!210475 () Bool)

(declare-fun array_inv!6388 (array!18155) Bool)

(assert (=> start!34396 (and (array_inv!6388 _values!1525) e!210475)))

(declare-fun array_inv!6389 (array!18153) Bool)

(assert (=> start!34396 (array_inv!6389 _keys!1895)))

(declare-fun b!343270 () Bool)

(assert (=> b!343270 (= e!210474 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3311 0))(
  ( (MissingZero!3311 (index!15423 (_ BitVec 32))) (Found!3311 (index!15424 (_ BitVec 32))) (Intermediate!3311 (undefined!4123 Bool) (index!15425 (_ BitVec 32)) (x!34180 (_ BitVec 32))) (Undefined!3311) (MissingVacant!3311 (index!15426 (_ BitVec 32))) )
))
(declare-fun lt!162339 () SeekEntryResult!3311)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18153 (_ BitVec 32)) SeekEntryResult!3311)

(assert (=> b!343270 (= lt!162339 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343271 () Bool)

(declare-fun res!189762 () Bool)

(assert (=> b!343271 (=> (not res!189762) (not e!210474))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10691)

(declare-fun zeroValue!1467 () V!10691)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5292 0))(
  ( (tuple2!5293 (_1!2657 (_ BitVec 64)) (_2!2657 V!10691)) )
))
(declare-datatypes ((List!4915 0))(
  ( (Nil!4912) (Cons!4911 (h!5767 tuple2!5292) (t!10022 List!4915)) )
))
(declare-datatypes ((ListLongMap!4195 0))(
  ( (ListLongMap!4196 (toList!2113 List!4915)) )
))
(declare-fun contains!2182 (ListLongMap!4195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1619 (array!18153 array!18155 (_ BitVec 32) (_ BitVec 32) V!10691 V!10691 (_ BitVec 32) Int) ListLongMap!4195)

(assert (=> b!343271 (= res!189762 (not (contains!2182 (getCurrentListMap!1619 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343272 () Bool)

(declare-fun e!210476 () Bool)

(assert (=> b!343272 (= e!210476 tp_is_empty!7285)))

(declare-fun b!343273 () Bool)

(declare-fun mapRes!12366 () Bool)

(assert (=> b!343273 (= e!210475 (and e!210476 mapRes!12366))))

(declare-fun condMapEmpty!12366 () Bool)

(declare-fun mapDefault!12366 () ValueCell!3299)

(assert (=> b!343273 (= condMapEmpty!12366 (= (arr!8594 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3299)) mapDefault!12366)))))

(declare-fun b!343274 () Bool)

(declare-fun res!189763 () Bool)

(assert (=> b!343274 (=> (not res!189763) (not e!210474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343274 (= res!189763 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12366 () Bool)

(assert (=> mapIsEmpty!12366 mapRes!12366))

(declare-fun b!343275 () Bool)

(declare-fun e!210477 () Bool)

(assert (=> b!343275 (= e!210477 tp_is_empty!7285)))

(declare-fun mapNonEmpty!12366 () Bool)

(declare-fun tp!25544 () Bool)

(assert (=> mapNonEmpty!12366 (= mapRes!12366 (and tp!25544 e!210477))))

(declare-fun mapKey!12366 () (_ BitVec 32))

(declare-fun mapValue!12366 () ValueCell!3299)

(declare-fun mapRest!12366 () (Array (_ BitVec 32) ValueCell!3299))

(assert (=> mapNonEmpty!12366 (= (arr!8594 _values!1525) (store mapRest!12366 mapKey!12366 mapValue!12366))))

(declare-fun b!343276 () Bool)

(declare-fun res!189759 () Bool)

(assert (=> b!343276 (=> (not res!189759) (not e!210474))))

(assert (=> b!343276 (= res!189759 (and (= (size!8947 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8946 _keys!1895) (size!8947 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34396 res!189760) b!343276))

(assert (= (and b!343276 res!189759) b!343268))

(assert (= (and b!343268 res!189764) b!343269))

(assert (= (and b!343269 res!189761) b!343274))

(assert (= (and b!343274 res!189763) b!343271))

(assert (= (and b!343271 res!189762) b!343270))

(assert (= (and b!343273 condMapEmpty!12366) mapIsEmpty!12366))

(assert (= (and b!343273 (not condMapEmpty!12366)) mapNonEmpty!12366))

(get-info :version)

(assert (= (and mapNonEmpty!12366 ((_ is ValueCellFull!3299) mapValue!12366)) b!343275))

(assert (= (and b!343273 ((_ is ValueCellFull!3299) mapDefault!12366)) b!343272))

(assert (= start!34396 b!343273))

(declare-fun m!344667 () Bool)

(assert (=> b!343269 m!344667))

(declare-fun m!344669 () Bool)

(assert (=> b!343274 m!344669))

(declare-fun m!344671 () Bool)

(assert (=> mapNonEmpty!12366 m!344671))

(declare-fun m!344673 () Bool)

(assert (=> start!34396 m!344673))

(declare-fun m!344675 () Bool)

(assert (=> start!34396 m!344675))

(declare-fun m!344677 () Bool)

(assert (=> start!34396 m!344677))

(declare-fun m!344679 () Bool)

(assert (=> b!343270 m!344679))

(declare-fun m!344681 () Bool)

(assert (=> b!343271 m!344681))

(assert (=> b!343271 m!344681))

(declare-fun m!344683 () Bool)

(assert (=> b!343271 m!344683))

(declare-fun m!344685 () Bool)

(assert (=> b!343268 m!344685))

(check-sat (not b_next!7333) b_and!14515 (not b!343270) tp_is_empty!7285 (not b!343268) (not start!34396) (not b!343269) (not b!343271) (not b!343274) (not mapNonEmpty!12366))
(check-sat b_and!14515 (not b_next!7333))
