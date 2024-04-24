; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34504 () Bool)

(assert start!34504)

(declare-fun b_free!7441 () Bool)

(declare-fun b_next!7441 () Bool)

(assert (=> start!34504 (= b_free!7441 (not b_next!7441))))

(declare-fun tp!25869 () Bool)

(declare-fun b_and!14663 () Bool)

(assert (=> start!34504 (= tp!25869 b_and!14663)))

(declare-fun b!344948 () Bool)

(declare-fun res!190859 () Bool)

(declare-fun e!211430 () Bool)

(assert (=> b!344948 (=> (not res!190859) (not e!211430))))

(declare-datatypes ((array!18368 0))(
  ( (array!18369 (arr!8700 (Array (_ BitVec 32) (_ BitVec 64))) (size!9052 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18368)

(declare-datatypes ((List!4935 0))(
  ( (Nil!4932) (Cons!4931 (h!5787 (_ BitVec 64)) (t!10043 List!4935)) )
))
(declare-fun arrayNoDuplicates!0 (array!18368 (_ BitVec 32) List!4935) Bool)

(assert (=> b!344948 (= res!190859 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4932))))

(declare-fun b!344950 () Bool)

(declare-fun e!211427 () Bool)

(declare-fun e!211426 () Bool)

(declare-fun mapRes!12528 () Bool)

(assert (=> b!344950 (= e!211427 (and e!211426 mapRes!12528))))

(declare-fun condMapEmpty!12528 () Bool)

(declare-datatypes ((V!10835 0))(
  ( (V!10836 (val!3741 Int)) )
))
(declare-datatypes ((ValueCell!3353 0))(
  ( (ValueCellFull!3353 (v!5918 V!10835)) (EmptyCell!3353) )
))
(declare-datatypes ((array!18370 0))(
  ( (array!18371 (arr!8701 (Array (_ BitVec 32) ValueCell!3353)) (size!9053 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18370)

(declare-fun mapDefault!12528 () ValueCell!3353)

(assert (=> b!344950 (= condMapEmpty!12528 (= (arr!8701 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3353)) mapDefault!12528)))))

(declare-fun b!344951 () Bool)

(declare-fun res!190862 () Bool)

(assert (=> b!344951 (=> (not res!190862) (not e!211430))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun mask!2385 () (_ BitVec 32))

(assert (=> b!344951 (= res!190862 (and (= (size!9053 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9052 _keys!1895) (size!9053 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344952 () Bool)

(declare-fun res!190857 () Bool)

(assert (=> b!344952 (=> (not res!190857) (not e!211430))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10835)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10835)

(declare-datatypes ((tuple2!5330 0))(
  ( (tuple2!5331 (_1!2676 (_ BitVec 64)) (_2!2676 V!10835)) )
))
(declare-datatypes ((List!4936 0))(
  ( (Nil!4933) (Cons!4932 (h!5788 tuple2!5330) (t!10044 List!4936)) )
))
(declare-datatypes ((ListLongMap!4245 0))(
  ( (ListLongMap!4246 (toList!2138 List!4936)) )
))
(declare-fun contains!2215 (ListLongMap!4245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1667 (array!18368 array!18370 (_ BitVec 32) (_ BitVec 32) V!10835 V!10835 (_ BitVec 32) Int) ListLongMap!4245)

(assert (=> b!344952 (= res!190857 (not (contains!2215 (getCurrentListMap!1667 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12528 () Bool)

(assert (=> mapIsEmpty!12528 mapRes!12528))

(declare-fun b!344953 () Bool)

(assert (=> b!344953 (= e!211430 false)))

(declare-datatypes ((SeekEntryResult!3306 0))(
  ( (MissingZero!3306 (index!15403 (_ BitVec 32))) (Found!3306 (index!15404 (_ BitVec 32))) (Intermediate!3306 (undefined!4118 Bool) (index!15405 (_ BitVec 32)) (x!34321 (_ BitVec 32))) (Undefined!3306) (MissingVacant!3306 (index!15406 (_ BitVec 32))) )
))
(declare-fun lt!162754 () SeekEntryResult!3306)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18368 (_ BitVec 32)) SeekEntryResult!3306)

(assert (=> b!344953 (= lt!162754 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344954 () Bool)

(declare-fun e!211428 () Bool)

(declare-fun tp_is_empty!7393 () Bool)

(assert (=> b!344954 (= e!211428 tp_is_empty!7393)))

(declare-fun b!344955 () Bool)

(declare-fun res!190861 () Bool)

(assert (=> b!344955 (=> (not res!190861) (not e!211430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344955 (= res!190861 (validKeyInArray!0 k0!1348))))

(declare-fun res!190860 () Bool)

(assert (=> start!34504 (=> (not res!190860) (not e!211430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34504 (= res!190860 (validMask!0 mask!2385))))

(assert (=> start!34504 e!211430))

(assert (=> start!34504 true))

(assert (=> start!34504 tp_is_empty!7393))

(assert (=> start!34504 tp!25869))

(declare-fun array_inv!6428 (array!18370) Bool)

(assert (=> start!34504 (and (array_inv!6428 _values!1525) e!211427)))

(declare-fun array_inv!6429 (array!18368) Bool)

(assert (=> start!34504 (array_inv!6429 _keys!1895)))

(declare-fun b!344949 () Bool)

(assert (=> b!344949 (= e!211426 tp_is_empty!7393)))

(declare-fun b!344956 () Bool)

(declare-fun res!190858 () Bool)

(assert (=> b!344956 (=> (not res!190858) (not e!211430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18368 (_ BitVec 32)) Bool)

(assert (=> b!344956 (= res!190858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12528 () Bool)

(declare-fun tp!25868 () Bool)

(assert (=> mapNonEmpty!12528 (= mapRes!12528 (and tp!25868 e!211428))))

(declare-fun mapValue!12528 () ValueCell!3353)

(declare-fun mapRest!12528 () (Array (_ BitVec 32) ValueCell!3353))

(declare-fun mapKey!12528 () (_ BitVec 32))

(assert (=> mapNonEmpty!12528 (= (arr!8701 _values!1525) (store mapRest!12528 mapKey!12528 mapValue!12528))))

(assert (= (and start!34504 res!190860) b!344951))

(assert (= (and b!344951 res!190862) b!344956))

(assert (= (and b!344956 res!190858) b!344948))

(assert (= (and b!344948 res!190859) b!344955))

(assert (= (and b!344955 res!190861) b!344952))

(assert (= (and b!344952 res!190857) b!344953))

(assert (= (and b!344950 condMapEmpty!12528) mapIsEmpty!12528))

(assert (= (and b!344950 (not condMapEmpty!12528)) mapNonEmpty!12528))

(get-info :version)

(assert (= (and mapNonEmpty!12528 ((_ is ValueCellFull!3353) mapValue!12528)) b!344954))

(assert (= (and b!344950 ((_ is ValueCellFull!3353) mapDefault!12528)) b!344949))

(assert (= start!34504 b!344950))

(declare-fun m!346701 () Bool)

(assert (=> b!344956 m!346701))

(declare-fun m!346703 () Bool)

(assert (=> b!344948 m!346703))

(declare-fun m!346705 () Bool)

(assert (=> mapNonEmpty!12528 m!346705))

(declare-fun m!346707 () Bool)

(assert (=> start!34504 m!346707))

(declare-fun m!346709 () Bool)

(assert (=> start!34504 m!346709))

(declare-fun m!346711 () Bool)

(assert (=> start!34504 m!346711))

(declare-fun m!346713 () Bool)

(assert (=> b!344953 m!346713))

(declare-fun m!346715 () Bool)

(assert (=> b!344952 m!346715))

(assert (=> b!344952 m!346715))

(declare-fun m!346717 () Bool)

(assert (=> b!344952 m!346717))

(declare-fun m!346719 () Bool)

(assert (=> b!344955 m!346719))

(check-sat (not b!344948) (not start!34504) (not b!344952) (not b!344955) tp_is_empty!7393 (not b_next!7441) (not b!344953) (not b!344956) (not mapNonEmpty!12528) b_and!14663)
(check-sat b_and!14663 (not b_next!7441))
