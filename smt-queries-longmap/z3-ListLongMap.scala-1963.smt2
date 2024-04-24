; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34510 () Bool)

(assert start!34510)

(declare-fun b_free!7447 () Bool)

(declare-fun b_next!7447 () Bool)

(assert (=> start!34510 (= b_free!7447 (not b_next!7447))))

(declare-fun tp!25887 () Bool)

(declare-fun b_and!14669 () Bool)

(assert (=> start!34510 (= tp!25887 b_and!14669)))

(declare-fun b!345029 () Bool)

(declare-fun res!190912 () Bool)

(declare-fun e!211473 () Bool)

(assert (=> b!345029 (=> (not res!190912) (not e!211473))))

(declare-datatypes ((array!18378 0))(
  ( (array!18379 (arr!8705 (Array (_ BitVec 32) (_ BitVec 64))) (size!9057 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18378)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18378 (_ BitVec 32)) Bool)

(assert (=> b!345029 (= res!190912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345030 () Bool)

(declare-fun e!211475 () Bool)

(declare-fun tp_is_empty!7399 () Bool)

(assert (=> b!345030 (= e!211475 tp_is_empty!7399)))

(declare-fun mapIsEmpty!12537 () Bool)

(declare-fun mapRes!12537 () Bool)

(assert (=> mapIsEmpty!12537 mapRes!12537))

(declare-fun b!345031 () Bool)

(declare-fun res!190916 () Bool)

(assert (=> b!345031 (=> (not res!190916) (not e!211473))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10843 0))(
  ( (V!10844 (val!3744 Int)) )
))
(declare-fun zeroValue!1467 () V!10843)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3356 0))(
  ( (ValueCellFull!3356 (v!5921 V!10843)) (EmptyCell!3356) )
))
(declare-datatypes ((array!18380 0))(
  ( (array!18381 (arr!8706 (Array (_ BitVec 32) ValueCell!3356)) (size!9058 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18380)

(declare-fun minValue!1467 () V!10843)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5334 0))(
  ( (tuple2!5335 (_1!2678 (_ BitVec 64)) (_2!2678 V!10843)) )
))
(declare-datatypes ((List!4939 0))(
  ( (Nil!4936) (Cons!4935 (h!5791 tuple2!5334) (t!10047 List!4939)) )
))
(declare-datatypes ((ListLongMap!4249 0))(
  ( (ListLongMap!4250 (toList!2140 List!4939)) )
))
(declare-fun contains!2217 (ListLongMap!4249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1669 (array!18378 array!18380 (_ BitVec 32) (_ BitVec 32) V!10843 V!10843 (_ BitVec 32) Int) ListLongMap!4249)

(assert (=> b!345031 (= res!190916 (not (contains!2217 (getCurrentListMap!1669 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!190911 () Bool)

(assert (=> start!34510 (=> (not res!190911) (not e!211473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34510 (= res!190911 (validMask!0 mask!2385))))

(assert (=> start!34510 e!211473))

(assert (=> start!34510 true))

(assert (=> start!34510 tp_is_empty!7399))

(assert (=> start!34510 tp!25887))

(declare-fun e!211472 () Bool)

(declare-fun array_inv!6432 (array!18380) Bool)

(assert (=> start!34510 (and (array_inv!6432 _values!1525) e!211472)))

(declare-fun array_inv!6433 (array!18378) Bool)

(assert (=> start!34510 (array_inv!6433 _keys!1895)))

(declare-fun b!345032 () Bool)

(declare-fun res!190914 () Bool)

(assert (=> b!345032 (=> (not res!190914) (not e!211473))))

(assert (=> b!345032 (= res!190914 (and (= (size!9058 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9057 _keys!1895) (size!9058 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345033 () Bool)

(assert (=> b!345033 (= e!211473 false)))

(declare-datatypes ((SeekEntryResult!3308 0))(
  ( (MissingZero!3308 (index!15411 (_ BitVec 32))) (Found!3308 (index!15412 (_ BitVec 32))) (Intermediate!3308 (undefined!4120 Bool) (index!15413 (_ BitVec 32)) (x!34331 (_ BitVec 32))) (Undefined!3308) (MissingVacant!3308 (index!15414 (_ BitVec 32))) )
))
(declare-fun lt!162763 () SeekEntryResult!3308)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18378 (_ BitVec 32)) SeekEntryResult!3308)

(assert (=> b!345033 (= lt!162763 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12537 () Bool)

(declare-fun tp!25886 () Bool)

(assert (=> mapNonEmpty!12537 (= mapRes!12537 (and tp!25886 e!211475))))

(declare-fun mapValue!12537 () ValueCell!3356)

(declare-fun mapKey!12537 () (_ BitVec 32))

(declare-fun mapRest!12537 () (Array (_ BitVec 32) ValueCell!3356))

(assert (=> mapNonEmpty!12537 (= (arr!8706 _values!1525) (store mapRest!12537 mapKey!12537 mapValue!12537))))

(declare-fun b!345034 () Bool)

(declare-fun e!211471 () Bool)

(assert (=> b!345034 (= e!211472 (and e!211471 mapRes!12537))))

(declare-fun condMapEmpty!12537 () Bool)

(declare-fun mapDefault!12537 () ValueCell!3356)

(assert (=> b!345034 (= condMapEmpty!12537 (= (arr!8706 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3356)) mapDefault!12537)))))

(declare-fun b!345035 () Bool)

(declare-fun res!190913 () Bool)

(assert (=> b!345035 (=> (not res!190913) (not e!211473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345035 (= res!190913 (validKeyInArray!0 k0!1348))))

(declare-fun b!345036 () Bool)

(assert (=> b!345036 (= e!211471 tp_is_empty!7399)))

(declare-fun b!345037 () Bool)

(declare-fun res!190915 () Bool)

(assert (=> b!345037 (=> (not res!190915) (not e!211473))))

(declare-datatypes ((List!4940 0))(
  ( (Nil!4937) (Cons!4936 (h!5792 (_ BitVec 64)) (t!10048 List!4940)) )
))
(declare-fun arrayNoDuplicates!0 (array!18378 (_ BitVec 32) List!4940) Bool)

(assert (=> b!345037 (= res!190915 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4937))))

(assert (= (and start!34510 res!190911) b!345032))

(assert (= (and b!345032 res!190914) b!345029))

(assert (= (and b!345029 res!190912) b!345037))

(assert (= (and b!345037 res!190915) b!345035))

(assert (= (and b!345035 res!190913) b!345031))

(assert (= (and b!345031 res!190916) b!345033))

(assert (= (and b!345034 condMapEmpty!12537) mapIsEmpty!12537))

(assert (= (and b!345034 (not condMapEmpty!12537)) mapNonEmpty!12537))

(get-info :version)

(assert (= (and mapNonEmpty!12537 ((_ is ValueCellFull!3356) mapValue!12537)) b!345030))

(assert (= (and b!345034 ((_ is ValueCellFull!3356) mapDefault!12537)) b!345036))

(assert (= start!34510 b!345034))

(declare-fun m!346761 () Bool)

(assert (=> start!34510 m!346761))

(declare-fun m!346763 () Bool)

(assert (=> start!34510 m!346763))

(declare-fun m!346765 () Bool)

(assert (=> start!34510 m!346765))

(declare-fun m!346767 () Bool)

(assert (=> b!345031 m!346767))

(assert (=> b!345031 m!346767))

(declare-fun m!346769 () Bool)

(assert (=> b!345031 m!346769))

(declare-fun m!346771 () Bool)

(assert (=> b!345029 m!346771))

(declare-fun m!346773 () Bool)

(assert (=> b!345035 m!346773))

(declare-fun m!346775 () Bool)

(assert (=> b!345037 m!346775))

(declare-fun m!346777 () Bool)

(assert (=> mapNonEmpty!12537 m!346777))

(declare-fun m!346779 () Bool)

(assert (=> b!345033 m!346779))

(check-sat (not b!345031) (not mapNonEmpty!12537) (not b_next!7447) (not b!345035) b_and!14669 (not start!34510) (not b!345037) (not b!345029) (not b!345033) tp_is_empty!7399)
(check-sat b_and!14669 (not b_next!7447))
