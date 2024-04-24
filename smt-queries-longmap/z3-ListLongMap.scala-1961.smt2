; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34498 () Bool)

(assert start!34498)

(declare-fun b_free!7435 () Bool)

(declare-fun b_next!7435 () Bool)

(assert (=> start!34498 (= b_free!7435 (not b_next!7435))))

(declare-fun tp!25851 () Bool)

(declare-fun b_and!14657 () Bool)

(assert (=> start!34498 (= tp!25851 b_and!14657)))

(declare-fun res!190805 () Bool)

(declare-fun e!211385 () Bool)

(assert (=> start!34498 (=> (not res!190805) (not e!211385))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34498 (= res!190805 (validMask!0 mask!2385))))

(assert (=> start!34498 e!211385))

(assert (=> start!34498 true))

(declare-fun tp_is_empty!7387 () Bool)

(assert (=> start!34498 tp_is_empty!7387))

(assert (=> start!34498 tp!25851))

(declare-datatypes ((V!10827 0))(
  ( (V!10828 (val!3738 Int)) )
))
(declare-datatypes ((ValueCell!3350 0))(
  ( (ValueCellFull!3350 (v!5915 V!10827)) (EmptyCell!3350) )
))
(declare-datatypes ((array!18356 0))(
  ( (array!18357 (arr!8694 (Array (_ BitVec 32) ValueCell!3350)) (size!9046 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18356)

(declare-fun e!211383 () Bool)

(declare-fun array_inv!6422 (array!18356) Bool)

(assert (=> start!34498 (and (array_inv!6422 _values!1525) e!211383)))

(declare-datatypes ((array!18358 0))(
  ( (array!18359 (arr!8695 (Array (_ BitVec 32) (_ BitVec 64))) (size!9047 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18358)

(declare-fun array_inv!6423 (array!18358) Bool)

(assert (=> start!34498 (array_inv!6423 _keys!1895)))

(declare-fun b!344867 () Bool)

(declare-fun res!190804 () Bool)

(assert (=> b!344867 (=> (not res!190804) (not e!211385))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344867 (= res!190804 (and (= (size!9046 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9047 _keys!1895) (size!9046 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344868 () Bool)

(declare-fun e!211382 () Bool)

(assert (=> b!344868 (= e!211382 tp_is_empty!7387)))

(declare-fun b!344869 () Bool)

(declare-fun mapRes!12519 () Bool)

(assert (=> b!344869 (= e!211383 (and e!211382 mapRes!12519))))

(declare-fun condMapEmpty!12519 () Bool)

(declare-fun mapDefault!12519 () ValueCell!3350)

(assert (=> b!344869 (= condMapEmpty!12519 (= (arr!8694 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3350)) mapDefault!12519)))))

(declare-fun b!344870 () Bool)

(declare-fun res!190808 () Bool)

(assert (=> b!344870 (=> (not res!190808) (not e!211385))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10827)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10827)

(declare-datatypes ((tuple2!5326 0))(
  ( (tuple2!5327 (_1!2674 (_ BitVec 64)) (_2!2674 V!10827)) )
))
(declare-datatypes ((List!4931 0))(
  ( (Nil!4928) (Cons!4927 (h!5783 tuple2!5326) (t!10039 List!4931)) )
))
(declare-datatypes ((ListLongMap!4241 0))(
  ( (ListLongMap!4242 (toList!2136 List!4931)) )
))
(declare-fun contains!2213 (ListLongMap!4241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1665 (array!18358 array!18356 (_ BitVec 32) (_ BitVec 32) V!10827 V!10827 (_ BitVec 32) Int) ListLongMap!4241)

(assert (=> b!344870 (= res!190808 (not (contains!2213 (getCurrentListMap!1665 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344871 () Bool)

(declare-fun e!211384 () Bool)

(assert (=> b!344871 (= e!211384 tp_is_empty!7387)))

(declare-fun mapIsEmpty!12519 () Bool)

(assert (=> mapIsEmpty!12519 mapRes!12519))

(declare-fun mapNonEmpty!12519 () Bool)

(declare-fun tp!25850 () Bool)

(assert (=> mapNonEmpty!12519 (= mapRes!12519 (and tp!25850 e!211384))))

(declare-fun mapKey!12519 () (_ BitVec 32))

(declare-fun mapRest!12519 () (Array (_ BitVec 32) ValueCell!3350))

(declare-fun mapValue!12519 () ValueCell!3350)

(assert (=> mapNonEmpty!12519 (= (arr!8694 _values!1525) (store mapRest!12519 mapKey!12519 mapValue!12519))))

(declare-fun b!344872 () Bool)

(declare-fun res!190803 () Bool)

(assert (=> b!344872 (=> (not res!190803) (not e!211385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344872 (= res!190803 (validKeyInArray!0 k0!1348))))

(declare-fun b!344873 () Bool)

(declare-fun res!190807 () Bool)

(assert (=> b!344873 (=> (not res!190807) (not e!211385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18358 (_ BitVec 32)) Bool)

(assert (=> b!344873 (= res!190807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344874 () Bool)

(assert (=> b!344874 (= e!211385 false)))

(declare-datatypes ((SeekEntryResult!3304 0))(
  ( (MissingZero!3304 (index!15395 (_ BitVec 32))) (Found!3304 (index!15396 (_ BitVec 32))) (Intermediate!3304 (undefined!4116 Bool) (index!15397 (_ BitVec 32)) (x!34311 (_ BitVec 32))) (Undefined!3304) (MissingVacant!3304 (index!15398 (_ BitVec 32))) )
))
(declare-fun lt!162745 () SeekEntryResult!3304)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18358 (_ BitVec 32)) SeekEntryResult!3304)

(assert (=> b!344874 (= lt!162745 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344875 () Bool)

(declare-fun res!190806 () Bool)

(assert (=> b!344875 (=> (not res!190806) (not e!211385))))

(declare-datatypes ((List!4932 0))(
  ( (Nil!4929) (Cons!4928 (h!5784 (_ BitVec 64)) (t!10040 List!4932)) )
))
(declare-fun arrayNoDuplicates!0 (array!18358 (_ BitVec 32) List!4932) Bool)

(assert (=> b!344875 (= res!190806 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4929))))

(assert (= (and start!34498 res!190805) b!344867))

(assert (= (and b!344867 res!190804) b!344873))

(assert (= (and b!344873 res!190807) b!344875))

(assert (= (and b!344875 res!190806) b!344872))

(assert (= (and b!344872 res!190803) b!344870))

(assert (= (and b!344870 res!190808) b!344874))

(assert (= (and b!344869 condMapEmpty!12519) mapIsEmpty!12519))

(assert (= (and b!344869 (not condMapEmpty!12519)) mapNonEmpty!12519))

(get-info :version)

(assert (= (and mapNonEmpty!12519 ((_ is ValueCellFull!3350) mapValue!12519)) b!344871))

(assert (= (and b!344869 ((_ is ValueCellFull!3350) mapDefault!12519)) b!344868))

(assert (= start!34498 b!344869))

(declare-fun m!346641 () Bool)

(assert (=> start!34498 m!346641))

(declare-fun m!346643 () Bool)

(assert (=> start!34498 m!346643))

(declare-fun m!346645 () Bool)

(assert (=> start!34498 m!346645))

(declare-fun m!346647 () Bool)

(assert (=> b!344873 m!346647))

(declare-fun m!346649 () Bool)

(assert (=> mapNonEmpty!12519 m!346649))

(declare-fun m!346651 () Bool)

(assert (=> b!344875 m!346651))

(declare-fun m!346653 () Bool)

(assert (=> b!344874 m!346653))

(declare-fun m!346655 () Bool)

(assert (=> b!344870 m!346655))

(assert (=> b!344870 m!346655))

(declare-fun m!346657 () Bool)

(assert (=> b!344870 m!346657))

(declare-fun m!346659 () Bool)

(assert (=> b!344872 m!346659))

(check-sat tp_is_empty!7387 b_and!14657 (not start!34498) (not b!344872) (not b!344875) (not mapNonEmpty!12519) (not b!344873) (not b_next!7435) (not b!344874) (not b!344870))
(check-sat b_and!14657 (not b_next!7435))
