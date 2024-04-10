; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34520 () Bool)

(assert start!34520)

(declare-fun b_free!7443 () Bool)

(declare-fun b_next!7443 () Bool)

(assert (=> start!34520 (= b_free!7443 (not b_next!7443))))

(declare-fun tp!25875 () Bool)

(declare-fun b_and!14651 () Bool)

(assert (=> start!34520 (= tp!25875 b_and!14651)))

(declare-fun mapNonEmpty!12531 () Bool)

(declare-fun mapRes!12531 () Bool)

(declare-fun tp!25874 () Bool)

(declare-fun e!211479 () Bool)

(assert (=> mapNonEmpty!12531 (= mapRes!12531 (and tp!25874 e!211479))))

(declare-datatypes ((V!10837 0))(
  ( (V!10838 (val!3742 Int)) )
))
(declare-datatypes ((ValueCell!3354 0))(
  ( (ValueCellFull!3354 (v!5918 V!10837)) (EmptyCell!3354) )
))
(declare-fun mapValue!12531 () ValueCell!3354)

(declare-fun mapKey!12531 () (_ BitVec 32))

(declare-datatypes ((array!18373 0))(
  ( (array!18374 (arr!8703 (Array (_ BitVec 32) ValueCell!3354)) (size!9055 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18373)

(declare-fun mapRest!12531 () (Array (_ BitVec 32) ValueCell!3354))

(assert (=> mapNonEmpty!12531 (= (arr!8703 _values!1525) (store mapRest!12531 mapKey!12531 mapValue!12531))))

(declare-fun b!345028 () Bool)

(declare-fun res!190881 () Bool)

(declare-fun e!211478 () Bool)

(assert (=> b!345028 (=> (not res!190881) (not e!211478))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345028 (= res!190881 (validKeyInArray!0 k0!1348))))

(declare-fun b!345029 () Bool)

(declare-fun res!190880 () Bool)

(assert (=> b!345029 (=> (not res!190880) (not e!211478))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10837)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18375 0))(
  ( (array!18376 (arr!8704 (Array (_ BitVec 32) (_ BitVec 64))) (size!9056 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18375)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10837)

(declare-datatypes ((tuple2!5410 0))(
  ( (tuple2!5411 (_1!2716 (_ BitVec 64)) (_2!2716 V!10837)) )
))
(declare-datatypes ((List!5033 0))(
  ( (Nil!5030) (Cons!5029 (h!5885 tuple2!5410) (t!10149 List!5033)) )
))
(declare-datatypes ((ListLongMap!4323 0))(
  ( (ListLongMap!4324 (toList!2177 List!5033)) )
))
(declare-fun contains!2235 (ListLongMap!4323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1698 (array!18375 array!18373 (_ BitVec 32) (_ BitVec 32) V!10837 V!10837 (_ BitVec 32) Int) ListLongMap!4323)

(assert (=> b!345029 (= res!190880 (not (contains!2235 (getCurrentListMap!1698 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!190878 () Bool)

(assert (=> start!34520 (=> (not res!190878) (not e!211478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34520 (= res!190878 (validMask!0 mask!2385))))

(assert (=> start!34520 e!211478))

(assert (=> start!34520 true))

(declare-fun tp_is_empty!7395 () Bool)

(assert (=> start!34520 tp_is_empty!7395))

(assert (=> start!34520 tp!25875))

(declare-fun e!211475 () Bool)

(declare-fun array_inv!6442 (array!18373) Bool)

(assert (=> start!34520 (and (array_inv!6442 _values!1525) e!211475)))

(declare-fun array_inv!6443 (array!18375) Bool)

(assert (=> start!34520 (array_inv!6443 _keys!1895)))

(declare-fun b!345030 () Bool)

(assert (=> b!345030 (= e!211479 tp_is_empty!7395)))

(declare-fun b!345031 () Bool)

(assert (=> b!345031 (= e!211478 false)))

(declare-datatypes ((SeekEntryResult!3354 0))(
  ( (MissingZero!3354 (index!15595 (_ BitVec 32))) (Found!3354 (index!15596 (_ BitVec 32))) (Intermediate!3354 (undefined!4166 Bool) (index!15597 (_ BitVec 32)) (x!34372 (_ BitVec 32))) (Undefined!3354) (MissingVacant!3354 (index!15598 (_ BitVec 32))) )
))
(declare-fun lt!162739 () SeekEntryResult!3354)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18375 (_ BitVec 32)) SeekEntryResult!3354)

(assert (=> b!345031 (= lt!162739 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12531 () Bool)

(assert (=> mapIsEmpty!12531 mapRes!12531))

(declare-fun b!345032 () Bool)

(declare-fun e!211476 () Bool)

(assert (=> b!345032 (= e!211476 tp_is_empty!7395)))

(declare-fun b!345033 () Bool)

(declare-fun res!190883 () Bool)

(assert (=> b!345033 (=> (not res!190883) (not e!211478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18375 (_ BitVec 32)) Bool)

(assert (=> b!345033 (= res!190883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345034 () Bool)

(declare-fun res!190882 () Bool)

(assert (=> b!345034 (=> (not res!190882) (not e!211478))))

(assert (=> b!345034 (= res!190882 (and (= (size!9055 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9056 _keys!1895) (size!9055 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345035 () Bool)

(declare-fun res!190879 () Bool)

(assert (=> b!345035 (=> (not res!190879) (not e!211478))))

(declare-datatypes ((List!5034 0))(
  ( (Nil!5031) (Cons!5030 (h!5886 (_ BitVec 64)) (t!10150 List!5034)) )
))
(declare-fun arrayNoDuplicates!0 (array!18375 (_ BitVec 32) List!5034) Bool)

(assert (=> b!345035 (= res!190879 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5031))))

(declare-fun b!345036 () Bool)

(assert (=> b!345036 (= e!211475 (and e!211476 mapRes!12531))))

(declare-fun condMapEmpty!12531 () Bool)

(declare-fun mapDefault!12531 () ValueCell!3354)

(assert (=> b!345036 (= condMapEmpty!12531 (= (arr!8703 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3354)) mapDefault!12531)))))

(assert (= (and start!34520 res!190878) b!345034))

(assert (= (and b!345034 res!190882) b!345033))

(assert (= (and b!345033 res!190883) b!345035))

(assert (= (and b!345035 res!190879) b!345028))

(assert (= (and b!345028 res!190881) b!345029))

(assert (= (and b!345029 res!190880) b!345031))

(assert (= (and b!345036 condMapEmpty!12531) mapIsEmpty!12531))

(assert (= (and b!345036 (not condMapEmpty!12531)) mapNonEmpty!12531))

(get-info :version)

(assert (= (and mapNonEmpty!12531 ((_ is ValueCellFull!3354) mapValue!12531)) b!345030))

(assert (= (and b!345036 ((_ is ValueCellFull!3354) mapDefault!12531)) b!345032))

(assert (= start!34520 b!345036))

(declare-fun m!346497 () Bool)

(assert (=> b!345028 m!346497))

(declare-fun m!346499 () Bool)

(assert (=> start!34520 m!346499))

(declare-fun m!346501 () Bool)

(assert (=> start!34520 m!346501))

(declare-fun m!346503 () Bool)

(assert (=> start!34520 m!346503))

(declare-fun m!346505 () Bool)

(assert (=> b!345033 m!346505))

(declare-fun m!346507 () Bool)

(assert (=> b!345031 m!346507))

(declare-fun m!346509 () Bool)

(assert (=> b!345035 m!346509))

(declare-fun m!346511 () Bool)

(assert (=> b!345029 m!346511))

(assert (=> b!345029 m!346511))

(declare-fun m!346513 () Bool)

(assert (=> b!345029 m!346513))

(declare-fun m!346515 () Bool)

(assert (=> mapNonEmpty!12531 m!346515))

(check-sat b_and!14651 (not b!345035) (not b!345031) tp_is_empty!7395 (not b!345029) (not start!34520) (not b!345033) (not b!345028) (not mapNonEmpty!12531) (not b_next!7443))
(check-sat b_and!14651 (not b_next!7443))
