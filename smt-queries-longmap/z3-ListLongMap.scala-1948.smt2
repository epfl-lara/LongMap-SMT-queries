; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34436 () Bool)

(assert start!34436)

(declare-fun b_free!7359 () Bool)

(declare-fun b_next!7359 () Bool)

(assert (=> start!34436 (= b_free!7359 (not b_next!7359))))

(declare-fun tp!25623 () Bool)

(declare-fun b_and!14567 () Bool)

(assert (=> start!34436 (= tp!25623 b_and!14567)))

(declare-fun b!343894 () Bool)

(declare-fun e!210848 () Bool)

(declare-fun tp_is_empty!7311 () Bool)

(assert (=> b!343894 (= e!210848 tp_is_empty!7311)))

(declare-fun b!343895 () Bool)

(declare-fun e!210847 () Bool)

(declare-fun mapRes!12405 () Bool)

(assert (=> b!343895 (= e!210847 (and e!210848 mapRes!12405))))

(declare-fun condMapEmpty!12405 () Bool)

(declare-datatypes ((V!10725 0))(
  ( (V!10726 (val!3700 Int)) )
))
(declare-datatypes ((ValueCell!3312 0))(
  ( (ValueCellFull!3312 (v!5876 V!10725)) (EmptyCell!3312) )
))
(declare-datatypes ((array!18213 0))(
  ( (array!18214 (arr!8623 (Array (_ BitVec 32) ValueCell!3312)) (size!8975 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18213)

(declare-fun mapDefault!12405 () ValueCell!3312)

(assert (=> b!343895 (= condMapEmpty!12405 (= (arr!8623 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3312)) mapDefault!12405)))))

(declare-fun b!343896 () Bool)

(declare-fun res!190124 () Bool)

(declare-fun e!210845 () Bool)

(assert (=> b!343896 (=> (not res!190124) (not e!210845))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10725)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18215 0))(
  ( (array!18216 (arr!8624 (Array (_ BitVec 32) (_ BitVec 64))) (size!8976 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18215)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10725)

(declare-datatypes ((tuple2!5356 0))(
  ( (tuple2!5357 (_1!2689 (_ BitVec 64)) (_2!2689 V!10725)) )
))
(declare-datatypes ((List!4977 0))(
  ( (Nil!4974) (Cons!4973 (h!5829 tuple2!5356) (t!10093 List!4977)) )
))
(declare-datatypes ((ListLongMap!4269 0))(
  ( (ListLongMap!4270 (toList!2150 List!4977)) )
))
(declare-fun contains!2208 (ListLongMap!4269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1671 (array!18215 array!18213 (_ BitVec 32) (_ BitVec 32) V!10725 V!10725 (_ BitVec 32) Int) ListLongMap!4269)

(assert (=> b!343896 (= res!190124 (not (contains!2208 (getCurrentListMap!1671 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343897 () Bool)

(declare-fun res!190126 () Bool)

(assert (=> b!343897 (=> (not res!190126) (not e!210845))))

(assert (=> b!343897 (= res!190126 (and (= (size!8975 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8976 _keys!1895) (size!8975 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12405 () Bool)

(assert (=> mapIsEmpty!12405 mapRes!12405))

(declare-fun res!190122 () Bool)

(assert (=> start!34436 (=> (not res!190122) (not e!210845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34436 (= res!190122 (validMask!0 mask!2385))))

(assert (=> start!34436 e!210845))

(assert (=> start!34436 true))

(assert (=> start!34436 tp_is_empty!7311))

(assert (=> start!34436 tp!25623))

(declare-fun array_inv!6390 (array!18213) Bool)

(assert (=> start!34436 (and (array_inv!6390 _values!1525) e!210847)))

(declare-fun array_inv!6391 (array!18215) Bool)

(assert (=> start!34436 (array_inv!6391 _keys!1895)))

(declare-fun b!343898 () Bool)

(declare-fun res!190123 () Bool)

(assert (=> b!343898 (=> (not res!190123) (not e!210845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343898 (= res!190123 (validKeyInArray!0 k0!1348))))

(declare-fun b!343899 () Bool)

(declare-fun e!210846 () Bool)

(assert (=> b!343899 (= e!210846 tp_is_empty!7311)))

(declare-fun b!343900 () Bool)

(declare-fun res!190127 () Bool)

(assert (=> b!343900 (=> (not res!190127) (not e!210845))))

(declare-datatypes ((List!4978 0))(
  ( (Nil!4975) (Cons!4974 (h!5830 (_ BitVec 64)) (t!10094 List!4978)) )
))
(declare-fun arrayNoDuplicates!0 (array!18215 (_ BitVec 32) List!4978) Bool)

(assert (=> b!343900 (= res!190127 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4975))))

(declare-fun b!343901 () Bool)

(assert (=> b!343901 (= e!210845 false)))

(declare-datatypes ((SeekEntryResult!3328 0))(
  ( (MissingZero!3328 (index!15491 (_ BitVec 32))) (Found!3328 (index!15492 (_ BitVec 32))) (Intermediate!3328 (undefined!4140 Bool) (index!15493 (_ BitVec 32)) (x!34234 (_ BitVec 32))) (Undefined!3328) (MissingVacant!3328 (index!15494 (_ BitVec 32))) )
))
(declare-fun lt!162613 () SeekEntryResult!3328)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18215 (_ BitVec 32)) SeekEntryResult!3328)

(assert (=> b!343901 (= lt!162613 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12405 () Bool)

(declare-fun tp!25622 () Bool)

(assert (=> mapNonEmpty!12405 (= mapRes!12405 (and tp!25622 e!210846))))

(declare-fun mapValue!12405 () ValueCell!3312)

(declare-fun mapRest!12405 () (Array (_ BitVec 32) ValueCell!3312))

(declare-fun mapKey!12405 () (_ BitVec 32))

(assert (=> mapNonEmpty!12405 (= (arr!8623 _values!1525) (store mapRest!12405 mapKey!12405 mapValue!12405))))

(declare-fun b!343902 () Bool)

(declare-fun res!190125 () Bool)

(assert (=> b!343902 (=> (not res!190125) (not e!210845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18215 (_ BitVec 32)) Bool)

(assert (=> b!343902 (= res!190125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34436 res!190122) b!343897))

(assert (= (and b!343897 res!190126) b!343902))

(assert (= (and b!343902 res!190125) b!343900))

(assert (= (and b!343900 res!190127) b!343898))

(assert (= (and b!343898 res!190123) b!343896))

(assert (= (and b!343896 res!190124) b!343901))

(assert (= (and b!343895 condMapEmpty!12405) mapIsEmpty!12405))

(assert (= (and b!343895 (not condMapEmpty!12405)) mapNonEmpty!12405))

(get-info :version)

(assert (= (and mapNonEmpty!12405 ((_ is ValueCellFull!3312) mapValue!12405)) b!343899))

(assert (= (and b!343895 ((_ is ValueCellFull!3312) mapDefault!12405)) b!343894))

(assert (= start!34436 b!343895))

(declare-fun m!345657 () Bool)

(assert (=> b!343898 m!345657))

(declare-fun m!345659 () Bool)

(assert (=> b!343900 m!345659))

(declare-fun m!345661 () Bool)

(assert (=> b!343902 m!345661))

(declare-fun m!345663 () Bool)

(assert (=> mapNonEmpty!12405 m!345663))

(declare-fun m!345665 () Bool)

(assert (=> b!343901 m!345665))

(declare-fun m!345667 () Bool)

(assert (=> start!34436 m!345667))

(declare-fun m!345669 () Bool)

(assert (=> start!34436 m!345669))

(declare-fun m!345671 () Bool)

(assert (=> start!34436 m!345671))

(declare-fun m!345673 () Bool)

(assert (=> b!343896 m!345673))

(assert (=> b!343896 m!345673))

(declare-fun m!345675 () Bool)

(assert (=> b!343896 m!345675))

(check-sat (not b!343898) (not b!343901) b_and!14567 (not start!34436) tp_is_empty!7311 (not b!343902) (not b!343896) (not mapNonEmpty!12405) (not b!343900) (not b_next!7359))
(check-sat b_and!14567 (not b_next!7359))
