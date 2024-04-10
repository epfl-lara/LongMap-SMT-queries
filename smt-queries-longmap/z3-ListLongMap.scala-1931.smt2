; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34234 () Bool)

(assert start!34234)

(declare-fun b_free!7257 () Bool)

(declare-fun b_next!7257 () Bool)

(assert (=> start!34234 (= b_free!7257 (not b_next!7257))))

(declare-fun tp!25304 () Bool)

(declare-fun b_and!14457 () Bool)

(assert (=> start!34234 (= tp!25304 b_and!14457)))

(declare-fun b!341589 () Bool)

(declare-fun res!188858 () Bool)

(declare-fun e!209478 () Bool)

(assert (=> b!341589 (=> (not res!188858) (not e!209478))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10589 0))(
  ( (V!10590 (val!3649 Int)) )
))
(declare-datatypes ((ValueCell!3261 0))(
  ( (ValueCellFull!3261 (v!5821 V!10589)) (EmptyCell!3261) )
))
(declare-datatypes ((array!18011 0))(
  ( (array!18012 (arr!8526 (Array (_ BitVec 32) ValueCell!3261)) (size!8878 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18011)

(declare-datatypes ((array!18013 0))(
  ( (array!18014 (arr!8527 (Array (_ BitVec 32) (_ BitVec 64))) (size!8879 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18013)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341589 (= res!188858 (and (= (size!8878 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8879 _keys!1895) (size!8878 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341590 () Bool)

(declare-fun res!188855 () Bool)

(assert (=> b!341590 (=> (not res!188855) (not e!209478))))

(declare-datatypes ((List!4906 0))(
  ( (Nil!4903) (Cons!4902 (h!5758 (_ BitVec 64)) (t!10014 List!4906)) )
))
(declare-fun arrayNoDuplicates!0 (array!18013 (_ BitVec 32) List!4906) Bool)

(assert (=> b!341590 (= res!188855 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4903))))

(declare-fun b!341592 () Bool)

(declare-fun res!188852 () Bool)

(assert (=> b!341592 (=> (not res!188852) (not e!209478))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10589)

(declare-fun minValue!1467 () V!10589)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5288 0))(
  ( (tuple2!5289 (_1!2655 (_ BitVec 64)) (_2!2655 V!10589)) )
))
(declare-datatypes ((List!4907 0))(
  ( (Nil!4904) (Cons!4903 (h!5759 tuple2!5288) (t!10015 List!4907)) )
))
(declare-datatypes ((ListLongMap!4201 0))(
  ( (ListLongMap!4202 (toList!2116 List!4907)) )
))
(declare-fun contains!2170 (ListLongMap!4201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1637 (array!18013 array!18011 (_ BitVec 32) (_ BitVec 32) V!10589 V!10589 (_ BitVec 32) Int) ListLongMap!4201)

(assert (=> b!341592 (= res!188852 (not (contains!2170 (getCurrentListMap!1637 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341593 () Bool)

(declare-fun e!209481 () Bool)

(assert (=> b!341593 (= e!209478 e!209481)))

(declare-fun res!188857 () Bool)

(assert (=> b!341593 (=> (not res!188857) (not e!209481))))

(declare-datatypes ((SeekEntryResult!3292 0))(
  ( (MissingZero!3292 (index!15347 (_ BitVec 32))) (Found!3292 (index!15348 (_ BitVec 32))) (Intermediate!3292 (undefined!4104 Bool) (index!15349 (_ BitVec 32)) (x!34022 (_ BitVec 32))) (Undefined!3292) (MissingVacant!3292 (index!15350 (_ BitVec 32))) )
))
(declare-fun lt!161801 () SeekEntryResult!3292)

(get-info :version)

(assert (=> b!341593 (= res!188857 (and (not ((_ is Found!3292) lt!161801)) (not ((_ is MissingZero!3292) lt!161801)) ((_ is MissingVacant!3292) lt!161801)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18013 (_ BitVec 32)) SeekEntryResult!3292)

(assert (=> b!341593 (= lt!161801 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12240 () Bool)

(declare-fun mapRes!12240 () Bool)

(assert (=> mapIsEmpty!12240 mapRes!12240))

(declare-fun b!341594 () Bool)

(declare-fun res!188854 () Bool)

(assert (=> b!341594 (=> (not res!188854) (not e!209478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18013 (_ BitVec 32)) Bool)

(assert (=> b!341594 (= res!188854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341595 () Bool)

(assert (=> b!341595 (= e!209481 false)))

(declare-datatypes ((Unit!10608 0))(
  ( (Unit!10609) )
))
(declare-fun lt!161802 () Unit!10608)

(declare-fun e!209484 () Unit!10608)

(assert (=> b!341595 (= lt!161802 e!209484)))

(declare-fun c!52689 () Bool)

(declare-fun arrayContainsKey!0 (array!18013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341595 (= c!52689 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341596 () Bool)

(declare-fun res!188853 () Bool)

(assert (=> b!341596 (=> (not res!188853) (not e!209478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341596 (= res!188853 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12240 () Bool)

(declare-fun tp!25305 () Bool)

(declare-fun e!209480 () Bool)

(assert (=> mapNonEmpty!12240 (= mapRes!12240 (and tp!25305 e!209480))))

(declare-fun mapRest!12240 () (Array (_ BitVec 32) ValueCell!3261))

(declare-fun mapKey!12240 () (_ BitVec 32))

(declare-fun mapValue!12240 () ValueCell!3261)

(assert (=> mapNonEmpty!12240 (= (arr!8526 _values!1525) (store mapRest!12240 mapKey!12240 mapValue!12240))))

(declare-fun b!341597 () Bool)

(declare-fun e!209479 () Bool)

(declare-fun tp_is_empty!7209 () Bool)

(assert (=> b!341597 (= e!209479 tp_is_empty!7209)))

(declare-fun b!341598 () Bool)

(declare-fun e!209482 () Bool)

(assert (=> b!341598 (= e!209482 (and e!209479 mapRes!12240))))

(declare-fun condMapEmpty!12240 () Bool)

(declare-fun mapDefault!12240 () ValueCell!3261)

(assert (=> b!341598 (= condMapEmpty!12240 (= (arr!8526 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3261)) mapDefault!12240)))))

(declare-fun b!341591 () Bool)

(declare-fun Unit!10610 () Unit!10608)

(assert (=> b!341591 (= e!209484 Unit!10610)))

(declare-fun res!188856 () Bool)

(assert (=> start!34234 (=> (not res!188856) (not e!209478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34234 (= res!188856 (validMask!0 mask!2385))))

(assert (=> start!34234 e!209478))

(assert (=> start!34234 true))

(assert (=> start!34234 tp_is_empty!7209))

(assert (=> start!34234 tp!25304))

(declare-fun array_inv!6310 (array!18011) Bool)

(assert (=> start!34234 (and (array_inv!6310 _values!1525) e!209482)))

(declare-fun array_inv!6311 (array!18013) Bool)

(assert (=> start!34234 (array_inv!6311 _keys!1895)))

(declare-fun b!341599 () Bool)

(declare-fun Unit!10611 () Unit!10608)

(assert (=> b!341599 (= e!209484 Unit!10611)))

(declare-fun lt!161803 () Unit!10608)

(declare-fun lemmaArrayContainsKeyThenInListMap!290 (array!18013 array!18011 (_ BitVec 32) (_ BitVec 32) V!10589 V!10589 (_ BitVec 64) (_ BitVec 32) Int) Unit!10608)

(declare-fun arrayScanForKey!0 (array!18013 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341599 (= lt!161803 (lemmaArrayContainsKeyThenInListMap!290 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341599 false))

(declare-fun b!341600 () Bool)

(assert (=> b!341600 (= e!209480 tp_is_empty!7209)))

(assert (= (and start!34234 res!188856) b!341589))

(assert (= (and b!341589 res!188858) b!341594))

(assert (= (and b!341594 res!188854) b!341590))

(assert (= (and b!341590 res!188855) b!341596))

(assert (= (and b!341596 res!188853) b!341592))

(assert (= (and b!341592 res!188852) b!341593))

(assert (= (and b!341593 res!188857) b!341595))

(assert (= (and b!341595 c!52689) b!341599))

(assert (= (and b!341595 (not c!52689)) b!341591))

(assert (= (and b!341598 condMapEmpty!12240) mapIsEmpty!12240))

(assert (= (and b!341598 (not condMapEmpty!12240)) mapNonEmpty!12240))

(assert (= (and mapNonEmpty!12240 ((_ is ValueCellFull!3261) mapValue!12240)) b!341600))

(assert (= (and b!341598 ((_ is ValueCellFull!3261) mapDefault!12240)) b!341597))

(assert (= start!34234 b!341598))

(declare-fun m!343977 () Bool)

(assert (=> b!341593 m!343977))

(declare-fun m!343979 () Bool)

(assert (=> b!341594 m!343979))

(declare-fun m!343981 () Bool)

(assert (=> b!341592 m!343981))

(assert (=> b!341592 m!343981))

(declare-fun m!343983 () Bool)

(assert (=> b!341592 m!343983))

(declare-fun m!343985 () Bool)

(assert (=> b!341596 m!343985))

(declare-fun m!343987 () Bool)

(assert (=> b!341590 m!343987))

(declare-fun m!343989 () Bool)

(assert (=> b!341595 m!343989))

(declare-fun m!343991 () Bool)

(assert (=> start!34234 m!343991))

(declare-fun m!343993 () Bool)

(assert (=> start!34234 m!343993))

(declare-fun m!343995 () Bool)

(assert (=> start!34234 m!343995))

(declare-fun m!343997 () Bool)

(assert (=> b!341599 m!343997))

(assert (=> b!341599 m!343997))

(declare-fun m!343999 () Bool)

(assert (=> b!341599 m!343999))

(declare-fun m!344001 () Bool)

(assert (=> mapNonEmpty!12240 m!344001))

(check-sat tp_is_empty!7209 (not b_next!7257) (not mapNonEmpty!12240) (not start!34234) (not b!341599) (not b!341593) (not b!341596) b_and!14457 (not b!341594) (not b!341595) (not b!341592) (not b!341590))
(check-sat b_and!14457 (not b_next!7257))
