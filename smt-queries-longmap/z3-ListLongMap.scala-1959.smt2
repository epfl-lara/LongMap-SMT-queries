; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34502 () Bool)

(assert start!34502)

(declare-fun b_free!7425 () Bool)

(declare-fun b_next!7425 () Bool)

(assert (=> start!34502 (= b_free!7425 (not b_next!7425))))

(declare-fun tp!25821 () Bool)

(declare-fun b_and!14633 () Bool)

(assert (=> start!34502 (= tp!25821 b_and!14633)))

(declare-fun b!344785 () Bool)

(declare-fun e!211342 () Bool)

(declare-fun e!211344 () Bool)

(declare-fun mapRes!12504 () Bool)

(assert (=> b!344785 (= e!211342 (and e!211344 mapRes!12504))))

(declare-fun condMapEmpty!12504 () Bool)

(declare-datatypes ((V!10813 0))(
  ( (V!10814 (val!3733 Int)) )
))
(declare-datatypes ((ValueCell!3345 0))(
  ( (ValueCellFull!3345 (v!5909 V!10813)) (EmptyCell!3345) )
))
(declare-datatypes ((array!18339 0))(
  ( (array!18340 (arr!8686 (Array (_ BitVec 32) ValueCell!3345)) (size!9038 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18339)

(declare-fun mapDefault!12504 () ValueCell!3345)

(assert (=> b!344785 (= condMapEmpty!12504 (= (arr!8686 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3345)) mapDefault!12504)))))

(declare-fun b!344786 () Bool)

(declare-fun e!211341 () Bool)

(assert (=> b!344786 (= e!211341 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18341 0))(
  ( (array!18342 (arr!8687 (Array (_ BitVec 32) (_ BitVec 64))) (size!9039 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18341)

(declare-datatypes ((SeekEntryResult!3348 0))(
  ( (MissingZero!3348 (index!15571 (_ BitVec 32))) (Found!3348 (index!15572 (_ BitVec 32))) (Intermediate!3348 (undefined!4160 Bool) (index!15573 (_ BitVec 32)) (x!34342 (_ BitVec 32))) (Undefined!3348) (MissingVacant!3348 (index!15574 (_ BitVec 32))) )
))
(declare-fun lt!162712 () SeekEntryResult!3348)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18341 (_ BitVec 32)) SeekEntryResult!3348)

(assert (=> b!344786 (= lt!162712 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344787 () Bool)

(declare-fun res!190721 () Bool)

(assert (=> b!344787 (=> (not res!190721) (not e!211341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18341 (_ BitVec 32)) Bool)

(assert (=> b!344787 (= res!190721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12504 () Bool)

(assert (=> mapIsEmpty!12504 mapRes!12504))

(declare-fun b!344788 () Bool)

(declare-fun res!190717 () Bool)

(assert (=> b!344788 (=> (not res!190717) (not e!211341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344788 (= res!190717 (validKeyInArray!0 k0!1348))))

(declare-fun b!344789 () Bool)

(declare-fun tp_is_empty!7377 () Bool)

(assert (=> b!344789 (= e!211344 tp_is_empty!7377)))

(declare-fun b!344790 () Bool)

(declare-fun res!190718 () Bool)

(assert (=> b!344790 (=> (not res!190718) (not e!211341))))

(declare-fun zeroValue!1467 () V!10813)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10813)

(declare-datatypes ((tuple2!5402 0))(
  ( (tuple2!5403 (_1!2712 (_ BitVec 64)) (_2!2712 V!10813)) )
))
(declare-datatypes ((List!5024 0))(
  ( (Nil!5021) (Cons!5020 (h!5876 tuple2!5402) (t!10140 List!5024)) )
))
(declare-datatypes ((ListLongMap!4315 0))(
  ( (ListLongMap!4316 (toList!2173 List!5024)) )
))
(declare-fun contains!2231 (ListLongMap!4315 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1694 (array!18341 array!18339 (_ BitVec 32) (_ BitVec 32) V!10813 V!10813 (_ BitVec 32) Int) ListLongMap!4315)

(assert (=> b!344790 (= res!190718 (not (contains!2231 (getCurrentListMap!1694 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344791 () Bool)

(declare-fun res!190719 () Bool)

(assert (=> b!344791 (=> (not res!190719) (not e!211341))))

(declare-datatypes ((List!5025 0))(
  ( (Nil!5022) (Cons!5021 (h!5877 (_ BitVec 64)) (t!10141 List!5025)) )
))
(declare-fun arrayNoDuplicates!0 (array!18341 (_ BitVec 32) List!5025) Bool)

(assert (=> b!344791 (= res!190719 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5022))))

(declare-fun res!190720 () Bool)

(assert (=> start!34502 (=> (not res!190720) (not e!211341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34502 (= res!190720 (validMask!0 mask!2385))))

(assert (=> start!34502 e!211341))

(assert (=> start!34502 true))

(assert (=> start!34502 tp_is_empty!7377))

(assert (=> start!34502 tp!25821))

(declare-fun array_inv!6430 (array!18339) Bool)

(assert (=> start!34502 (and (array_inv!6430 _values!1525) e!211342)))

(declare-fun array_inv!6431 (array!18341) Bool)

(assert (=> start!34502 (array_inv!6431 _keys!1895)))

(declare-fun b!344792 () Bool)

(declare-fun e!211343 () Bool)

(assert (=> b!344792 (= e!211343 tp_is_empty!7377)))

(declare-fun b!344793 () Bool)

(declare-fun res!190716 () Bool)

(assert (=> b!344793 (=> (not res!190716) (not e!211341))))

(assert (=> b!344793 (= res!190716 (and (= (size!9038 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9039 _keys!1895) (size!9038 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12504 () Bool)

(declare-fun tp!25820 () Bool)

(assert (=> mapNonEmpty!12504 (= mapRes!12504 (and tp!25820 e!211343))))

(declare-fun mapKey!12504 () (_ BitVec 32))

(declare-fun mapRest!12504 () (Array (_ BitVec 32) ValueCell!3345))

(declare-fun mapValue!12504 () ValueCell!3345)

(assert (=> mapNonEmpty!12504 (= (arr!8686 _values!1525) (store mapRest!12504 mapKey!12504 mapValue!12504))))

(assert (= (and start!34502 res!190720) b!344793))

(assert (= (and b!344793 res!190716) b!344787))

(assert (= (and b!344787 res!190721) b!344791))

(assert (= (and b!344791 res!190719) b!344788))

(assert (= (and b!344788 res!190717) b!344790))

(assert (= (and b!344790 res!190718) b!344786))

(assert (= (and b!344785 condMapEmpty!12504) mapIsEmpty!12504))

(assert (= (and b!344785 (not condMapEmpty!12504)) mapNonEmpty!12504))

(get-info :version)

(assert (= (and mapNonEmpty!12504 ((_ is ValueCellFull!3345) mapValue!12504)) b!344792))

(assert (= (and b!344785 ((_ is ValueCellFull!3345) mapDefault!12504)) b!344789))

(assert (= start!34502 b!344785))

(declare-fun m!346317 () Bool)

(assert (=> b!344791 m!346317))

(declare-fun m!346319 () Bool)

(assert (=> start!34502 m!346319))

(declare-fun m!346321 () Bool)

(assert (=> start!34502 m!346321))

(declare-fun m!346323 () Bool)

(assert (=> start!34502 m!346323))

(declare-fun m!346325 () Bool)

(assert (=> b!344786 m!346325))

(declare-fun m!346327 () Bool)

(assert (=> b!344787 m!346327))

(declare-fun m!346329 () Bool)

(assert (=> b!344788 m!346329))

(declare-fun m!346331 () Bool)

(assert (=> b!344790 m!346331))

(assert (=> b!344790 m!346331))

(declare-fun m!346333 () Bool)

(assert (=> b!344790 m!346333))

(declare-fun m!346335 () Bool)

(assert (=> mapNonEmpty!12504 m!346335))

(check-sat (not start!34502) (not b!344790) b_and!14633 (not b!344791) (not b_next!7425) (not b!344788) tp_is_empty!7377 (not b!344786) (not mapNonEmpty!12504) (not b!344787))
(check-sat b_and!14633 (not b_next!7425))
