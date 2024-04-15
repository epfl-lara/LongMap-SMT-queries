; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34978 () Bool)

(assert start!34978)

(declare-fun b_free!7681 () Bool)

(declare-fun b_next!7681 () Bool)

(assert (=> start!34978 (= b_free!7681 (not b_next!7681))))

(declare-fun tp!26621 () Bool)

(declare-fun b_and!14885 () Bool)

(assert (=> start!34978 (= tp!26621 b_and!14885)))

(declare-fun mapNonEmpty!12921 () Bool)

(declare-fun mapRes!12921 () Bool)

(declare-fun tp!26622 () Bool)

(declare-fun e!214510 () Bool)

(assert (=> mapNonEmpty!12921 (= mapRes!12921 (and tp!26622 e!214510))))

(declare-datatypes ((V!11155 0))(
  ( (V!11156 (val!3861 Int)) )
))
(declare-datatypes ((ValueCell!3473 0))(
  ( (ValueCellFull!3473 (v!6042 V!11155)) (EmptyCell!3473) )
))
(declare-fun mapValue!12921 () ValueCell!3473)

(declare-datatypes ((array!18833 0))(
  ( (array!18834 (arr!8922 (Array (_ BitVec 32) ValueCell!3473)) (size!9275 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18833)

(declare-fun mapKey!12921 () (_ BitVec 32))

(declare-fun mapRest!12921 () (Array (_ BitVec 32) ValueCell!3473))

(assert (=> mapNonEmpty!12921 (= (arr!8922 _values!1525) (store mapRest!12921 mapKey!12921 mapValue!12921))))

(declare-fun mapIsEmpty!12921 () Bool)

(assert (=> mapIsEmpty!12921 mapRes!12921))

(declare-fun res!194097 () Bool)

(declare-fun e!214507 () Bool)

(assert (=> start!34978 (=> (not res!194097) (not e!214507))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34978 (= res!194097 (validMask!0 mask!2385))))

(assert (=> start!34978 e!214507))

(assert (=> start!34978 true))

(declare-fun tp_is_empty!7633 () Bool)

(assert (=> start!34978 tp_is_empty!7633))

(assert (=> start!34978 tp!26621))

(declare-fun e!214508 () Bool)

(declare-fun array_inv!6614 (array!18833) Bool)

(assert (=> start!34978 (and (array_inv!6614 _values!1525) e!214508)))

(declare-datatypes ((array!18835 0))(
  ( (array!18836 (arr!8923 (Array (_ BitVec 32) (_ BitVec 64))) (size!9276 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18835)

(declare-fun array_inv!6615 (array!18835) Bool)

(assert (=> start!34978 (array_inv!6615 _keys!1895)))

(declare-fun b!350205 () Bool)

(declare-fun res!194096 () Bool)

(assert (=> b!350205 (=> (not res!194096) (not e!214507))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11155)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11155)

(declare-datatypes ((tuple2!5542 0))(
  ( (tuple2!5543 (_1!2782 (_ BitVec 64)) (_2!2782 V!11155)) )
))
(declare-datatypes ((List!5155 0))(
  ( (Nil!5152) (Cons!5151 (h!6007 tuple2!5542) (t!10284 List!5155)) )
))
(declare-datatypes ((ListLongMap!4445 0))(
  ( (ListLongMap!4446 (toList!2238 List!5155)) )
))
(declare-fun contains!2318 (ListLongMap!4445 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1743 (array!18835 array!18833 (_ BitVec 32) (_ BitVec 32) V!11155 V!11155 (_ BitVec 32) Int) ListLongMap!4445)

(assert (=> b!350205 (= res!194096 (not (contains!2318 (getCurrentListMap!1743 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350206 () Bool)

(declare-fun res!194101 () Bool)

(assert (=> b!350206 (=> (not res!194101) (not e!214507))))

(declare-datatypes ((List!5156 0))(
  ( (Nil!5153) (Cons!5152 (h!6008 (_ BitVec 64)) (t!10285 List!5156)) )
))
(declare-fun arrayNoDuplicates!0 (array!18835 (_ BitVec 32) List!5156) Bool)

(assert (=> b!350206 (= res!194101 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5153))))

(declare-fun b!350207 () Bool)

(declare-fun res!194100 () Bool)

(assert (=> b!350207 (=> (not res!194100) (not e!214507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350207 (= res!194100 (validKeyInArray!0 k0!1348))))

(declare-fun b!350208 () Bool)

(declare-fun res!194102 () Bool)

(assert (=> b!350208 (=> (not res!194102) (not e!214507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18835 (_ BitVec 32)) Bool)

(assert (=> b!350208 (= res!194102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350209 () Bool)

(declare-fun e!214509 () Bool)

(assert (=> b!350209 (= e!214509 tp_is_empty!7633)))

(declare-fun b!350210 () Bool)

(declare-fun res!194098 () Bool)

(assert (=> b!350210 (=> (not res!194098) (not e!214507))))

(assert (=> b!350210 (= res!194098 (and (= (size!9275 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9276 _keys!1895) (size!9275 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350211 () Bool)

(declare-fun e!214511 () Bool)

(assert (=> b!350211 (= e!214507 e!214511)))

(declare-fun res!194099 () Bool)

(assert (=> b!350211 (=> (not res!194099) (not e!214511))))

(declare-datatypes ((SeekEntryResult!3438 0))(
  ( (MissingZero!3438 (index!15931 (_ BitVec 32))) (Found!3438 (index!15932 (_ BitVec 32))) (Intermediate!3438 (undefined!4250 Bool) (index!15933 (_ BitVec 32)) (x!34881 (_ BitVec 32))) (Undefined!3438) (MissingVacant!3438 (index!15934 (_ BitVec 32))) )
))
(declare-fun lt!164355 () SeekEntryResult!3438)

(get-info :version)

(assert (=> b!350211 (= res!194099 (and (not ((_ is Found!3438) lt!164355)) (not ((_ is MissingZero!3438) lt!164355)) ((_ is MissingVacant!3438) lt!164355)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18835 (_ BitVec 32)) SeekEntryResult!3438)

(assert (=> b!350211 (= lt!164355 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350212 () Bool)

(assert (=> b!350212 (= e!214511 false)))

(declare-fun lt!164354 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18835 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350212 (= lt!164354 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350213 () Bool)

(assert (=> b!350213 (= e!214508 (and e!214509 mapRes!12921))))

(declare-fun condMapEmpty!12921 () Bool)

(declare-fun mapDefault!12921 () ValueCell!3473)

(assert (=> b!350213 (= condMapEmpty!12921 (= (arr!8922 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3473)) mapDefault!12921)))))

(declare-fun b!350214 () Bool)

(declare-fun res!194103 () Bool)

(assert (=> b!350214 (=> (not res!194103) (not e!214511))))

(declare-fun arrayContainsKey!0 (array!18835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350214 (= res!194103 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350215 () Bool)

(assert (=> b!350215 (= e!214510 tp_is_empty!7633)))

(assert (= (and start!34978 res!194097) b!350210))

(assert (= (and b!350210 res!194098) b!350208))

(assert (= (and b!350208 res!194102) b!350206))

(assert (= (and b!350206 res!194101) b!350207))

(assert (= (and b!350207 res!194100) b!350205))

(assert (= (and b!350205 res!194096) b!350211))

(assert (= (and b!350211 res!194099) b!350214))

(assert (= (and b!350214 res!194103) b!350212))

(assert (= (and b!350213 condMapEmpty!12921) mapIsEmpty!12921))

(assert (= (and b!350213 (not condMapEmpty!12921)) mapNonEmpty!12921))

(assert (= (and mapNonEmpty!12921 ((_ is ValueCellFull!3473) mapValue!12921)) b!350215))

(assert (= (and b!350213 ((_ is ValueCellFull!3473) mapDefault!12921)) b!350209))

(assert (= start!34978 b!350213))

(declare-fun m!349935 () Bool)

(assert (=> b!350205 m!349935))

(assert (=> b!350205 m!349935))

(declare-fun m!349937 () Bool)

(assert (=> b!350205 m!349937))

(declare-fun m!349939 () Bool)

(assert (=> mapNonEmpty!12921 m!349939))

(declare-fun m!349941 () Bool)

(assert (=> b!350207 m!349941))

(declare-fun m!349943 () Bool)

(assert (=> start!34978 m!349943))

(declare-fun m!349945 () Bool)

(assert (=> start!34978 m!349945))

(declare-fun m!349947 () Bool)

(assert (=> start!34978 m!349947))

(declare-fun m!349949 () Bool)

(assert (=> b!350214 m!349949))

(declare-fun m!349951 () Bool)

(assert (=> b!350208 m!349951))

(declare-fun m!349953 () Bool)

(assert (=> b!350211 m!349953))

(declare-fun m!349955 () Bool)

(assert (=> b!350206 m!349955))

(declare-fun m!349957 () Bool)

(assert (=> b!350212 m!349957))

(check-sat (not b!350208) (not b!350212) (not b!350205) (not mapNonEmpty!12921) b_and!14885 (not b!350207) (not b_next!7681) tp_is_empty!7633 (not b!350214) (not b!350206) (not start!34978) (not b!350211))
(check-sat b_and!14885 (not b_next!7681))
