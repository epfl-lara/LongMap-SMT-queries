; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34978 () Bool)

(assert start!34978)

(declare-fun b_free!7681 () Bool)

(declare-fun b_next!7681 () Bool)

(assert (=> start!34978 (= b_free!7681 (not b_next!7681))))

(declare-fun tp!26621 () Bool)

(declare-fun b_and!14925 () Bool)

(assert (=> start!34978 (= tp!26621 b_and!14925)))

(declare-fun b!350427 () Bool)

(declare-fun res!194227 () Bool)

(declare-fun e!214650 () Bool)

(assert (=> b!350427 (=> (not res!194227) (not e!214650))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((V!11155 0))(
  ( (V!11156 (val!3861 Int)) )
))
(declare-datatypes ((ValueCell!3473 0))(
  ( (ValueCellFull!3473 (v!6049 V!11155)) (EmptyCell!3473) )
))
(declare-datatypes ((array!18842 0))(
  ( (array!18843 (arr!8926 (Array (_ BitVec 32) ValueCell!3473)) (size!9278 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18842)

(declare-datatypes ((array!18844 0))(
  ( (array!18845 (arr!8927 (Array (_ BitVec 32) (_ BitVec 64))) (size!9279 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18844)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11155)

(declare-fun zeroValue!1467 () V!11155)

(declare-datatypes ((tuple2!5492 0))(
  ( (tuple2!5493 (_1!2757 (_ BitVec 64)) (_2!2757 V!11155)) )
))
(declare-datatypes ((List!5098 0))(
  ( (Nil!5095) (Cons!5094 (h!5950 tuple2!5492) (t!10228 List!5098)) )
))
(declare-datatypes ((ListLongMap!4407 0))(
  ( (ListLongMap!4408 (toList!2219 List!5098)) )
))
(declare-fun contains!2307 (ListLongMap!4407 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1747 (array!18844 array!18842 (_ BitVec 32) (_ BitVec 32) V!11155 V!11155 (_ BitVec 32) Int) ListLongMap!4407)

(assert (=> b!350427 (= res!194227 (not (contains!2307 (getCurrentListMap!1747 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350428 () Bool)

(declare-fun res!194225 () Bool)

(assert (=> b!350428 (=> (not res!194225) (not e!214650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350428 (= res!194225 (validKeyInArray!0 k0!1348))))

(declare-fun res!194229 () Bool)

(assert (=> start!34978 (=> (not res!194229) (not e!214650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34978 (= res!194229 (validMask!0 mask!2385))))

(assert (=> start!34978 e!214650))

(assert (=> start!34978 true))

(declare-fun tp_is_empty!7633 () Bool)

(assert (=> start!34978 tp_is_empty!7633))

(assert (=> start!34978 tp!26621))

(declare-fun e!214652 () Bool)

(declare-fun array_inv!6598 (array!18842) Bool)

(assert (=> start!34978 (and (array_inv!6598 _values!1525) e!214652)))

(declare-fun array_inv!6599 (array!18844) Bool)

(assert (=> start!34978 (array_inv!6599 _keys!1895)))

(declare-fun b!350429 () Bool)

(declare-fun e!214648 () Bool)

(assert (=> b!350429 (= e!214648 tp_is_empty!7633)))

(declare-fun b!350430 () Bool)

(declare-fun mapRes!12921 () Bool)

(assert (=> b!350430 (= e!214652 (and e!214648 mapRes!12921))))

(declare-fun condMapEmpty!12921 () Bool)

(declare-fun mapDefault!12921 () ValueCell!3473)

(assert (=> b!350430 (= condMapEmpty!12921 (= (arr!8926 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3473)) mapDefault!12921)))))

(declare-fun mapIsEmpty!12921 () Bool)

(assert (=> mapIsEmpty!12921 mapRes!12921))

(declare-fun b!350431 () Bool)

(declare-fun res!194223 () Bool)

(declare-fun e!214651 () Bool)

(assert (=> b!350431 (=> (not res!194223) (not e!214651))))

(declare-fun arrayContainsKey!0 (array!18844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350431 (= res!194223 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12921 () Bool)

(declare-fun tp!26622 () Bool)

(declare-fun e!214653 () Bool)

(assert (=> mapNonEmpty!12921 (= mapRes!12921 (and tp!26622 e!214653))))

(declare-fun mapRest!12921 () (Array (_ BitVec 32) ValueCell!3473))

(declare-fun mapKey!12921 () (_ BitVec 32))

(declare-fun mapValue!12921 () ValueCell!3473)

(assert (=> mapNonEmpty!12921 (= (arr!8926 _values!1525) (store mapRest!12921 mapKey!12921 mapValue!12921))))

(declare-fun b!350432 () Bool)

(declare-fun res!194222 () Bool)

(assert (=> b!350432 (=> (not res!194222) (not e!214650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18844 (_ BitVec 32)) Bool)

(assert (=> b!350432 (= res!194222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350433 () Bool)

(assert (=> b!350433 (= e!214653 tp_is_empty!7633)))

(declare-fun b!350434 () Bool)

(declare-fun res!194224 () Bool)

(assert (=> b!350434 (=> (not res!194224) (not e!214650))))

(declare-datatypes ((List!5099 0))(
  ( (Nil!5096) (Cons!5095 (h!5951 (_ BitVec 64)) (t!10229 List!5099)) )
))
(declare-fun arrayNoDuplicates!0 (array!18844 (_ BitVec 32) List!5099) Bool)

(assert (=> b!350434 (= res!194224 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5096))))

(declare-fun b!350435 () Bool)

(assert (=> b!350435 (= e!214651 false)))

(declare-fun lt!164608 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18844 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350435 (= lt!164608 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350436 () Bool)

(declare-fun res!194226 () Bool)

(assert (=> b!350436 (=> (not res!194226) (not e!214650))))

(assert (=> b!350436 (= res!194226 (and (= (size!9278 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9279 _keys!1895) (size!9278 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350437 () Bool)

(assert (=> b!350437 (= e!214650 e!214651)))

(declare-fun res!194228 () Bool)

(assert (=> b!350437 (=> (not res!194228) (not e!214651))))

(declare-datatypes ((SeekEntryResult!3394 0))(
  ( (MissingZero!3394 (index!15755 (_ BitVec 32))) (Found!3394 (index!15756 (_ BitVec 32))) (Intermediate!3394 (undefined!4206 Bool) (index!15757 (_ BitVec 32)) (x!34839 (_ BitVec 32))) (Undefined!3394) (MissingVacant!3394 (index!15758 (_ BitVec 32))) )
))
(declare-fun lt!164607 () SeekEntryResult!3394)

(get-info :version)

(assert (=> b!350437 (= res!194228 (and (not ((_ is Found!3394) lt!164607)) (not ((_ is MissingZero!3394) lt!164607)) ((_ is MissingVacant!3394) lt!164607)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18844 (_ BitVec 32)) SeekEntryResult!3394)

(assert (=> b!350437 (= lt!164607 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34978 res!194229) b!350436))

(assert (= (and b!350436 res!194226) b!350432))

(assert (= (and b!350432 res!194222) b!350434))

(assert (= (and b!350434 res!194224) b!350428))

(assert (= (and b!350428 res!194225) b!350427))

(assert (= (and b!350427 res!194227) b!350437))

(assert (= (and b!350437 res!194228) b!350431))

(assert (= (and b!350431 res!194223) b!350435))

(assert (= (and b!350430 condMapEmpty!12921) mapIsEmpty!12921))

(assert (= (and b!350430 (not condMapEmpty!12921)) mapNonEmpty!12921))

(assert (= (and mapNonEmpty!12921 ((_ is ValueCellFull!3473) mapValue!12921)) b!350433))

(assert (= (and b!350430 ((_ is ValueCellFull!3473) mapDefault!12921)) b!350429))

(assert (= start!34978 b!350430))

(declare-fun m!350889 () Bool)

(assert (=> start!34978 m!350889))

(declare-fun m!350891 () Bool)

(assert (=> start!34978 m!350891))

(declare-fun m!350893 () Bool)

(assert (=> start!34978 m!350893))

(declare-fun m!350895 () Bool)

(assert (=> b!350434 m!350895))

(declare-fun m!350897 () Bool)

(assert (=> b!350432 m!350897))

(declare-fun m!350899 () Bool)

(assert (=> b!350437 m!350899))

(declare-fun m!350901 () Bool)

(assert (=> b!350428 m!350901))

(declare-fun m!350903 () Bool)

(assert (=> b!350427 m!350903))

(assert (=> b!350427 m!350903))

(declare-fun m!350905 () Bool)

(assert (=> b!350427 m!350905))

(declare-fun m!350907 () Bool)

(assert (=> b!350431 m!350907))

(declare-fun m!350909 () Bool)

(assert (=> b!350435 m!350909))

(declare-fun m!350911 () Bool)

(assert (=> mapNonEmpty!12921 m!350911))

(check-sat (not b!350437) (not b_next!7681) (not b!350428) (not b!350432) (not b!350427) b_and!14925 (not start!34978) (not b!350435) (not mapNonEmpty!12921) (not b!350431) tp_is_empty!7633 (not b!350434))
(check-sat b_and!14925 (not b_next!7681))
