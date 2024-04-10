; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34684 () Bool)

(assert start!34684)

(declare-fun b_free!7491 () Bool)

(declare-fun b_next!7491 () Bool)

(assert (=> start!34684 (= b_free!7491 (not b_next!7491))))

(declare-fun tp!26036 () Bool)

(declare-fun b_and!14711 () Bool)

(assert (=> start!34684 (= tp!26036 b_and!14711)))

(declare-fun b!346525 () Bool)

(declare-fun e!212382 () Bool)

(declare-fun tp_is_empty!7443 () Bool)

(assert (=> b!346525 (= e!212382 tp_is_empty!7443)))

(declare-fun b!346526 () Bool)

(declare-fun e!212385 () Bool)

(assert (=> b!346526 (= e!212385 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3374 0))(
  ( (MissingZero!3374 (index!15675 (_ BitVec 32))) (Found!3374 (index!15676 (_ BitVec 32))) (Intermediate!3374 (undefined!4186 Bool) (index!15677 (_ BitVec 32)) (x!34516 (_ BitVec 32))) (Undefined!3374) (MissingVacant!3374 (index!15678 (_ BitVec 32))) )
))
(declare-fun lt!163387 () SeekEntryResult!3374)

(declare-datatypes ((array!18479 0))(
  ( (array!18480 (arr!8750 (Array (_ BitVec 32) (_ BitVec 64))) (size!9102 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18479)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18479 (_ BitVec 32)) SeekEntryResult!3374)

(assert (=> b!346526 (= lt!163387 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346527 () Bool)

(declare-fun e!212381 () Bool)

(declare-fun e!212383 () Bool)

(declare-fun mapRes!12621 () Bool)

(assert (=> b!346527 (= e!212381 (and e!212383 mapRes!12621))))

(declare-fun condMapEmpty!12621 () Bool)

(declare-datatypes ((V!10901 0))(
  ( (V!10902 (val!3766 Int)) )
))
(declare-datatypes ((ValueCell!3378 0))(
  ( (ValueCellFull!3378 (v!5948 V!10901)) (EmptyCell!3378) )
))
(declare-datatypes ((array!18481 0))(
  ( (array!18482 (arr!8751 (Array (_ BitVec 32) ValueCell!3378)) (size!9103 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18481)

(declare-fun mapDefault!12621 () ValueCell!3378)

(assert (=> b!346527 (= condMapEmpty!12621 (= (arr!8751 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3378)) mapDefault!12621)))))

(declare-fun res!191670 () Bool)

(assert (=> start!34684 (=> (not res!191670) (not e!212385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34684 (= res!191670 (validMask!0 mask!2385))))

(assert (=> start!34684 e!212385))

(assert (=> start!34684 true))

(assert (=> start!34684 tp_is_empty!7443))

(assert (=> start!34684 tp!26036))

(declare-fun array_inv!6478 (array!18481) Bool)

(assert (=> start!34684 (and (array_inv!6478 _values!1525) e!212381)))

(declare-fun array_inv!6479 (array!18479) Bool)

(assert (=> start!34684 (array_inv!6479 _keys!1895)))

(declare-fun b!346528 () Bool)

(assert (=> b!346528 (= e!212383 tp_is_empty!7443)))

(declare-fun b!346529 () Bool)

(declare-fun res!191668 () Bool)

(assert (=> b!346529 (=> (not res!191668) (not e!212385))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346529 (= res!191668 (and (= (size!9103 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9102 _keys!1895) (size!9103 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346530 () Bool)

(declare-fun res!191667 () Bool)

(assert (=> b!346530 (=> (not res!191667) (not e!212385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18479 (_ BitVec 32)) Bool)

(assert (=> b!346530 (= res!191667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346531 () Bool)

(declare-fun res!191669 () Bool)

(assert (=> b!346531 (=> (not res!191669) (not e!212385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346531 (= res!191669 (validKeyInArray!0 k0!1348))))

(declare-fun b!346532 () Bool)

(declare-fun res!191672 () Bool)

(assert (=> b!346532 (=> (not res!191672) (not e!212385))))

(declare-datatypes ((List!5069 0))(
  ( (Nil!5066) (Cons!5065 (h!5921 (_ BitVec 64)) (t!10197 List!5069)) )
))
(declare-fun arrayNoDuplicates!0 (array!18479 (_ BitVec 32) List!5069) Bool)

(assert (=> b!346532 (= res!191672 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5066))))

(declare-fun mapIsEmpty!12621 () Bool)

(assert (=> mapIsEmpty!12621 mapRes!12621))

(declare-fun mapNonEmpty!12621 () Bool)

(declare-fun tp!26037 () Bool)

(assert (=> mapNonEmpty!12621 (= mapRes!12621 (and tp!26037 e!212382))))

(declare-fun mapRest!12621 () (Array (_ BitVec 32) ValueCell!3378))

(declare-fun mapValue!12621 () ValueCell!3378)

(declare-fun mapKey!12621 () (_ BitVec 32))

(assert (=> mapNonEmpty!12621 (= (arr!8751 _values!1525) (store mapRest!12621 mapKey!12621 mapValue!12621))))

(declare-fun b!346533 () Bool)

(declare-fun res!191671 () Bool)

(assert (=> b!346533 (=> (not res!191671) (not e!212385))))

(declare-fun zeroValue!1467 () V!10901)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10901)

(declare-datatypes ((tuple2!5446 0))(
  ( (tuple2!5447 (_1!2734 (_ BitVec 64)) (_2!2734 V!10901)) )
))
(declare-datatypes ((List!5070 0))(
  ( (Nil!5067) (Cons!5066 (h!5922 tuple2!5446) (t!10198 List!5070)) )
))
(declare-datatypes ((ListLongMap!4359 0))(
  ( (ListLongMap!4360 (toList!2195 List!5070)) )
))
(declare-fun contains!2259 (ListLongMap!4359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1716 (array!18479 array!18481 (_ BitVec 32) (_ BitVec 32) V!10901 V!10901 (_ BitVec 32) Int) ListLongMap!4359)

(assert (=> b!346533 (= res!191671 (not (contains!2259 (getCurrentListMap!1716 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34684 res!191670) b!346529))

(assert (= (and b!346529 res!191668) b!346530))

(assert (= (and b!346530 res!191667) b!346532))

(assert (= (and b!346532 res!191672) b!346531))

(assert (= (and b!346531 res!191669) b!346533))

(assert (= (and b!346533 res!191671) b!346526))

(assert (= (and b!346527 condMapEmpty!12621) mapIsEmpty!12621))

(assert (= (and b!346527 (not condMapEmpty!12621)) mapNonEmpty!12621))

(get-info :version)

(assert (= (and mapNonEmpty!12621 ((_ is ValueCellFull!3378) mapValue!12621)) b!346525))

(assert (= (and b!346527 ((_ is ValueCellFull!3378) mapDefault!12621)) b!346528))

(assert (= start!34684 b!346527))

(declare-fun m!347603 () Bool)

(assert (=> b!346526 m!347603))

(declare-fun m!347605 () Bool)

(assert (=> b!346533 m!347605))

(assert (=> b!346533 m!347605))

(declare-fun m!347607 () Bool)

(assert (=> b!346533 m!347607))

(declare-fun m!347609 () Bool)

(assert (=> mapNonEmpty!12621 m!347609))

(declare-fun m!347611 () Bool)

(assert (=> b!346532 m!347611))

(declare-fun m!347613 () Bool)

(assert (=> start!34684 m!347613))

(declare-fun m!347615 () Bool)

(assert (=> start!34684 m!347615))

(declare-fun m!347617 () Bool)

(assert (=> start!34684 m!347617))

(declare-fun m!347619 () Bool)

(assert (=> b!346531 m!347619))

(declare-fun m!347621 () Bool)

(assert (=> b!346530 m!347621))

(check-sat (not b!346530) b_and!14711 tp_is_empty!7443 (not b!346533) (not mapNonEmpty!12621) (not b_next!7491) (not b!346532) (not start!34684) (not b!346531) (not b!346526))
(check-sat b_and!14711 (not b_next!7491))
