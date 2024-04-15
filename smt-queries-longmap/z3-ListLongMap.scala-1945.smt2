; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34402 () Bool)

(assert start!34402)

(declare-fun b_free!7339 () Bool)

(declare-fun b_next!7339 () Bool)

(assert (=> start!34402 (= b_free!7339 (not b_next!7339))))

(declare-fun tp!25562 () Bool)

(declare-fun b_and!14521 () Bool)

(assert (=> start!34402 (= tp!25562 b_and!14521)))

(declare-fun b!343349 () Bool)

(declare-fun e!210519 () Bool)

(assert (=> b!343349 (= e!210519 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18165 0))(
  ( (array!18166 (arr!8599 (Array (_ BitVec 32) (_ BitVec 64))) (size!8952 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18165)

(declare-datatypes ((SeekEntryResult!3313 0))(
  ( (MissingZero!3313 (index!15431 (_ BitVec 32))) (Found!3313 (index!15432 (_ BitVec 32))) (Intermediate!3313 (undefined!4125 Bool) (index!15433 (_ BitVec 32)) (x!34190 (_ BitVec 32))) (Undefined!3313) (MissingVacant!3313 (index!15434 (_ BitVec 32))) )
))
(declare-fun lt!162348 () SeekEntryResult!3313)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18165 (_ BitVec 32)) SeekEntryResult!3313)

(assert (=> b!343349 (= lt!162348 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343350 () Bool)

(declare-fun res!189817 () Bool)

(assert (=> b!343350 (=> (not res!189817) (not e!210519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343350 (= res!189817 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12375 () Bool)

(declare-fun mapRes!12375 () Bool)

(declare-fun tp!25563 () Bool)

(declare-fun e!210520 () Bool)

(assert (=> mapNonEmpty!12375 (= mapRes!12375 (and tp!25563 e!210520))))

(declare-datatypes ((V!10699 0))(
  ( (V!10700 (val!3690 Int)) )
))
(declare-datatypes ((ValueCell!3302 0))(
  ( (ValueCellFull!3302 (v!5860 V!10699)) (EmptyCell!3302) )
))
(declare-fun mapRest!12375 () (Array (_ BitVec 32) ValueCell!3302))

(declare-datatypes ((array!18167 0))(
  ( (array!18168 (arr!8600 (Array (_ BitVec 32) ValueCell!3302)) (size!8953 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18167)

(declare-fun mapValue!12375 () ValueCell!3302)

(declare-fun mapKey!12375 () (_ BitVec 32))

(assert (=> mapNonEmpty!12375 (= (arr!8600 _values!1525) (store mapRest!12375 mapKey!12375 mapValue!12375))))

(declare-fun b!343351 () Bool)

(declare-fun res!189815 () Bool)

(assert (=> b!343351 (=> (not res!189815) (not e!210519))))

(declare-datatypes ((List!4917 0))(
  ( (Nil!4914) (Cons!4913 (h!5769 (_ BitVec 64)) (t!10024 List!4917)) )
))
(declare-fun arrayNoDuplicates!0 (array!18165 (_ BitVec 32) List!4917) Bool)

(assert (=> b!343351 (= res!189815 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4914))))

(declare-fun b!343352 () Bool)

(declare-fun e!210522 () Bool)

(declare-fun e!210521 () Bool)

(assert (=> b!343352 (= e!210522 (and e!210521 mapRes!12375))))

(declare-fun condMapEmpty!12375 () Bool)

(declare-fun mapDefault!12375 () ValueCell!3302)

(assert (=> b!343352 (= condMapEmpty!12375 (= (arr!8600 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3302)) mapDefault!12375)))))

(declare-fun b!343353 () Bool)

(declare-fun res!189813 () Bool)

(assert (=> b!343353 (=> (not res!189813) (not e!210519))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343353 (= res!189813 (and (= (size!8953 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8952 _keys!1895) (size!8953 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!189814 () Bool)

(assert (=> start!34402 (=> (not res!189814) (not e!210519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34402 (= res!189814 (validMask!0 mask!2385))))

(assert (=> start!34402 e!210519))

(assert (=> start!34402 true))

(declare-fun tp_is_empty!7291 () Bool)

(assert (=> start!34402 tp_is_empty!7291))

(assert (=> start!34402 tp!25562))

(declare-fun array_inv!6390 (array!18167) Bool)

(assert (=> start!34402 (and (array_inv!6390 _values!1525) e!210522)))

(declare-fun array_inv!6391 (array!18165) Bool)

(assert (=> start!34402 (array_inv!6391 _keys!1895)))

(declare-fun b!343354 () Bool)

(assert (=> b!343354 (= e!210520 tp_is_empty!7291)))

(declare-fun mapIsEmpty!12375 () Bool)

(assert (=> mapIsEmpty!12375 mapRes!12375))

(declare-fun b!343355 () Bool)

(declare-fun res!189816 () Bool)

(assert (=> b!343355 (=> (not res!189816) (not e!210519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18165 (_ BitVec 32)) Bool)

(assert (=> b!343355 (= res!189816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343356 () Bool)

(assert (=> b!343356 (= e!210521 tp_is_empty!7291)))

(declare-fun b!343357 () Bool)

(declare-fun res!189818 () Bool)

(assert (=> b!343357 (=> (not res!189818) (not e!210519))))

(declare-fun zeroValue!1467 () V!10699)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10699)

(declare-datatypes ((tuple2!5294 0))(
  ( (tuple2!5295 (_1!2658 (_ BitVec 64)) (_2!2658 V!10699)) )
))
(declare-datatypes ((List!4918 0))(
  ( (Nil!4915) (Cons!4914 (h!5770 tuple2!5294) (t!10025 List!4918)) )
))
(declare-datatypes ((ListLongMap!4197 0))(
  ( (ListLongMap!4198 (toList!2114 List!4918)) )
))
(declare-fun contains!2183 (ListLongMap!4197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1620 (array!18165 array!18167 (_ BitVec 32) (_ BitVec 32) V!10699 V!10699 (_ BitVec 32) Int) ListLongMap!4197)

(assert (=> b!343357 (= res!189818 (not (contains!2183 (getCurrentListMap!1620 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34402 res!189814) b!343353))

(assert (= (and b!343353 res!189813) b!343355))

(assert (= (and b!343355 res!189816) b!343351))

(assert (= (and b!343351 res!189815) b!343350))

(assert (= (and b!343350 res!189817) b!343357))

(assert (= (and b!343357 res!189818) b!343349))

(assert (= (and b!343352 condMapEmpty!12375) mapIsEmpty!12375))

(assert (= (and b!343352 (not condMapEmpty!12375)) mapNonEmpty!12375))

(get-info :version)

(assert (= (and mapNonEmpty!12375 ((_ is ValueCellFull!3302) mapValue!12375)) b!343354))

(assert (= (and b!343352 ((_ is ValueCellFull!3302) mapDefault!12375)) b!343356))

(assert (= start!34402 b!343352))

(declare-fun m!344727 () Bool)

(assert (=> b!343357 m!344727))

(assert (=> b!343357 m!344727))

(declare-fun m!344729 () Bool)

(assert (=> b!343357 m!344729))

(declare-fun m!344731 () Bool)

(assert (=> mapNonEmpty!12375 m!344731))

(declare-fun m!344733 () Bool)

(assert (=> b!343350 m!344733))

(declare-fun m!344735 () Bool)

(assert (=> b!343351 m!344735))

(declare-fun m!344737 () Bool)

(assert (=> b!343349 m!344737))

(declare-fun m!344739 () Bool)

(assert (=> b!343355 m!344739))

(declare-fun m!344741 () Bool)

(assert (=> start!34402 m!344741))

(declare-fun m!344743 () Bool)

(assert (=> start!34402 m!344743))

(declare-fun m!344745 () Bool)

(assert (=> start!34402 m!344745))

(check-sat tp_is_empty!7291 (not start!34402) (not b!343357) (not b!343351) (not b!343350) (not b!343355) (not b_next!7339) b_and!14521 (not mapNonEmpty!12375) (not b!343349))
(check-sat b_and!14521 (not b_next!7339))
