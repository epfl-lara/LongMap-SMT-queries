; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34680 () Bool)

(assert start!34680)

(declare-fun b_free!7501 () Bool)

(declare-fun b_next!7501 () Bool)

(assert (=> start!34680 (= b_free!7501 (not b_next!7501))))

(declare-fun tp!26066 () Bool)

(declare-fun b_and!14735 () Bool)

(assert (=> start!34680 (= tp!26066 b_and!14735)))

(declare-fun mapNonEmpty!12636 () Bool)

(declare-fun mapRes!12636 () Bool)

(declare-fun tp!26067 () Bool)

(declare-fun e!212433 () Bool)

(assert (=> mapNonEmpty!12636 (= mapRes!12636 (and tp!26067 e!212433))))

(declare-fun mapKey!12636 () (_ BitVec 32))

(declare-datatypes ((V!10915 0))(
  ( (V!10916 (val!3771 Int)) )
))
(declare-datatypes ((ValueCell!3383 0))(
  ( (ValueCellFull!3383 (v!5954 V!10915)) (EmptyCell!3383) )
))
(declare-fun mapValue!12636 () ValueCell!3383)

(declare-fun mapRest!12636 () (Array (_ BitVec 32) ValueCell!3383))

(declare-datatypes ((array!18494 0))(
  ( (array!18495 (arr!8757 (Array (_ BitVec 32) ValueCell!3383)) (size!9109 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18494)

(assert (=> mapNonEmpty!12636 (= (arr!8757 _values!1525) (store mapRest!12636 mapKey!12636 mapValue!12636))))

(declare-fun b!346629 () Bool)

(declare-fun e!212436 () Bool)

(declare-fun e!212434 () Bool)

(assert (=> b!346629 (= e!212436 e!212434)))

(declare-fun res!191777 () Bool)

(assert (=> b!346629 (=> (not res!191777) (not e!212434))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3331 0))(
  ( (MissingZero!3331 (index!15503 (_ BitVec 32))) (Found!3331 (index!15504 (_ BitVec 32))) (Intermediate!3331 (undefined!4143 Bool) (index!15505 (_ BitVec 32)) (x!34486 (_ BitVec 32))) (Undefined!3331) (MissingVacant!3331 (index!15506 (_ BitVec 32))) )
))
(declare-fun lt!163431 () SeekEntryResult!3331)

(declare-datatypes ((array!18496 0))(
  ( (array!18497 (arr!8758 (Array (_ BitVec 32) (_ BitVec 64))) (size!9110 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18496)

(get-info :version)

(assert (=> b!346629 (= res!191777 (and ((_ is Found!3331) lt!163431) (= (select (arr!8758 _keys!1895) (index!15504 lt!163431)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18496 (_ BitVec 32)) SeekEntryResult!3331)

(assert (=> b!346629 (= lt!163431 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346630 () Bool)

(declare-fun res!191781 () Bool)

(assert (=> b!346630 (=> (not res!191781) (not e!212436))))

(declare-datatypes ((List!4981 0))(
  ( (Nil!4978) (Cons!4977 (h!5833 (_ BitVec 64)) (t!10101 List!4981)) )
))
(declare-fun arrayNoDuplicates!0 (array!18496 (_ BitVec 32) List!4981) Bool)

(assert (=> b!346630 (= res!191781 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4978))))

(declare-fun b!346631 () Bool)

(declare-fun res!191783 () Bool)

(assert (=> b!346631 (=> (not res!191783) (not e!212436))))

(declare-fun zeroValue!1467 () V!10915)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10915)

(declare-datatypes ((tuple2!5374 0))(
  ( (tuple2!5375 (_1!2698 (_ BitVec 64)) (_2!2698 V!10915)) )
))
(declare-datatypes ((List!4982 0))(
  ( (Nil!4979) (Cons!4978 (h!5834 tuple2!5374) (t!10102 List!4982)) )
))
(declare-datatypes ((ListLongMap!4289 0))(
  ( (ListLongMap!4290 (toList!2160 List!4982)) )
))
(declare-fun contains!2243 (ListLongMap!4289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1689 (array!18496 array!18494 (_ BitVec 32) (_ BitVec 32) V!10915 V!10915 (_ BitVec 32) Int) ListLongMap!4289)

(assert (=> b!346631 (= res!191783 (not (contains!2243 (getCurrentListMap!1689 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!191779 () Bool)

(assert (=> start!34680 (=> (not res!191779) (not e!212436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34680 (= res!191779 (validMask!0 mask!2385))))

(assert (=> start!34680 e!212436))

(assert (=> start!34680 true))

(declare-fun tp_is_empty!7453 () Bool)

(assert (=> start!34680 tp_is_empty!7453))

(assert (=> start!34680 tp!26066))

(declare-fun e!212438 () Bool)

(declare-fun array_inv!6474 (array!18494) Bool)

(assert (=> start!34680 (and (array_inv!6474 _values!1525) e!212438)))

(declare-fun array_inv!6475 (array!18496) Bool)

(assert (=> start!34680 (array_inv!6475 _keys!1895)))

(declare-fun b!346632 () Bool)

(assert (=> b!346632 (= e!212433 tp_is_empty!7453)))

(declare-fun b!346633 () Bool)

(declare-fun res!191782 () Bool)

(assert (=> b!346633 (=> (not res!191782) (not e!212436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346633 (= res!191782 (validKeyInArray!0 k0!1348))))

(declare-fun b!346634 () Bool)

(assert (=> b!346634 (= e!212434 (not true))))

(declare-fun arrayContainsKey!0 (array!18496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346634 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10727 0))(
  ( (Unit!10728) )
))
(declare-fun lt!163432 () Unit!10727)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18496 (_ BitVec 64) (_ BitVec 32)) Unit!10727)

(assert (=> b!346634 (= lt!163432 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15504 lt!163431)))))

(declare-fun b!346635 () Bool)

(declare-fun res!191780 () Bool)

(assert (=> b!346635 (=> (not res!191780) (not e!212436))))

(assert (=> b!346635 (= res!191780 (and (= (size!9109 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9110 _keys!1895) (size!9109 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346636 () Bool)

(declare-fun e!212435 () Bool)

(assert (=> b!346636 (= e!212435 tp_is_empty!7453)))

(declare-fun b!346637 () Bool)

(declare-fun res!191778 () Bool)

(assert (=> b!346637 (=> (not res!191778) (not e!212436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18496 (_ BitVec 32)) Bool)

(assert (=> b!346637 (= res!191778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346638 () Bool)

(assert (=> b!346638 (= e!212438 (and e!212435 mapRes!12636))))

(declare-fun condMapEmpty!12636 () Bool)

(declare-fun mapDefault!12636 () ValueCell!3383)

(assert (=> b!346638 (= condMapEmpty!12636 (= (arr!8757 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3383)) mapDefault!12636)))))

(declare-fun mapIsEmpty!12636 () Bool)

(assert (=> mapIsEmpty!12636 mapRes!12636))

(declare-fun b!346639 () Bool)

(declare-fun res!191776 () Bool)

(assert (=> b!346639 (=> (not res!191776) (not e!212434))))

(assert (=> b!346639 (= res!191776 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15504 lt!163431)))))

(assert (= (and start!34680 res!191779) b!346635))

(assert (= (and b!346635 res!191780) b!346637))

(assert (= (and b!346637 res!191778) b!346630))

(assert (= (and b!346630 res!191781) b!346633))

(assert (= (and b!346633 res!191782) b!346631))

(assert (= (and b!346631 res!191783) b!346629))

(assert (= (and b!346629 res!191777) b!346639))

(assert (= (and b!346639 res!191776) b!346634))

(assert (= (and b!346638 condMapEmpty!12636) mapIsEmpty!12636))

(assert (= (and b!346638 (not condMapEmpty!12636)) mapNonEmpty!12636))

(assert (= (and mapNonEmpty!12636 ((_ is ValueCellFull!3383) mapValue!12636)) b!346632))

(assert (= (and b!346638 ((_ is ValueCellFull!3383) mapDefault!12636)) b!346636))

(assert (= start!34680 b!346638))

(declare-fun m!347951 () Bool)

(assert (=> mapNonEmpty!12636 m!347951))

(declare-fun m!347953 () Bool)

(assert (=> b!346634 m!347953))

(declare-fun m!347955 () Bool)

(assert (=> b!346634 m!347955))

(declare-fun m!347957 () Bool)

(assert (=> b!346629 m!347957))

(declare-fun m!347959 () Bool)

(assert (=> b!346629 m!347959))

(declare-fun m!347961 () Bool)

(assert (=> b!346639 m!347961))

(declare-fun m!347963 () Bool)

(assert (=> b!346631 m!347963))

(assert (=> b!346631 m!347963))

(declare-fun m!347965 () Bool)

(assert (=> b!346631 m!347965))

(declare-fun m!347967 () Bool)

(assert (=> b!346637 m!347967))

(declare-fun m!347969 () Bool)

(assert (=> start!34680 m!347969))

(declare-fun m!347971 () Bool)

(assert (=> start!34680 m!347971))

(declare-fun m!347973 () Bool)

(assert (=> start!34680 m!347973))

(declare-fun m!347975 () Bool)

(assert (=> b!346633 m!347975))

(declare-fun m!347977 () Bool)

(assert (=> b!346630 m!347977))

(check-sat b_and!14735 (not b!346629) (not b!346633) (not mapNonEmpty!12636) (not b!346639) (not b!346630) (not start!34680) (not b!346637) tp_is_empty!7453 (not b!346631) (not b_next!7501) (not b!346634))
(check-sat b_and!14735 (not b_next!7501))
