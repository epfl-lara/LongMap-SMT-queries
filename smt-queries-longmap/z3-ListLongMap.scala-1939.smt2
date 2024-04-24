; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34314 () Bool)

(assert start!34314)

(declare-fun b_free!7303 () Bool)

(declare-fun b_next!7303 () Bool)

(assert (=> start!34314 (= b_free!7303 (not b_next!7303))))

(declare-fun tp!25448 () Bool)

(declare-fun b_and!14521 () Bool)

(assert (=> start!34314 (= tp!25448 b_and!14521)))

(declare-fun b!342642 () Bool)

(declare-fun res!189437 () Bool)

(declare-fun e!210111 () Bool)

(assert (=> b!342642 (=> (not res!189437) (not e!210111))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10651 0))(
  ( (V!10652 (val!3672 Int)) )
))
(declare-datatypes ((ValueCell!3284 0))(
  ( (ValueCellFull!3284 (v!5847 V!10651)) (EmptyCell!3284) )
))
(declare-datatypes ((array!18096 0))(
  ( (array!18097 (arr!8566 (Array (_ BitVec 32) ValueCell!3284)) (size!8918 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18096)

(declare-datatypes ((array!18098 0))(
  ( (array!18099 (arr!8567 (Array (_ BitVec 32) (_ BitVec 64))) (size!8919 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18098)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!342642 (= res!189437 (and (= (size!8918 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8919 _keys!1895) (size!8918 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12315 () Bool)

(declare-fun mapRes!12315 () Bool)

(assert (=> mapIsEmpty!12315 mapRes!12315))

(declare-fun b!342643 () Bool)

(declare-fun res!189440 () Bool)

(assert (=> b!342643 (=> (not res!189440) (not e!210111))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10651)

(declare-fun zeroValue!1467 () V!10651)

(declare-datatypes ((tuple2!5238 0))(
  ( (tuple2!5239 (_1!2630 (_ BitVec 64)) (_2!2630 V!10651)) )
))
(declare-datatypes ((List!4841 0))(
  ( (Nil!4838) (Cons!4837 (h!5693 tuple2!5238) (t!9945 List!4841)) )
))
(declare-datatypes ((ListLongMap!4153 0))(
  ( (ListLongMap!4154 (toList!2092 List!4841)) )
))
(declare-fun contains!2167 (ListLongMap!4153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1621 (array!18098 array!18096 (_ BitVec 32) (_ BitVec 32) V!10651 V!10651 (_ BitVec 32) Int) ListLongMap!4153)

(assert (=> b!342643 (= res!189440 (not (contains!2167 (getCurrentListMap!1621 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342644 () Bool)

(declare-fun res!189434 () Bool)

(assert (=> b!342644 (=> (not res!189434) (not e!210111))))

(declare-datatypes ((List!4842 0))(
  ( (Nil!4839) (Cons!4838 (h!5694 (_ BitVec 64)) (t!9946 List!4842)) )
))
(declare-fun arrayNoDuplicates!0 (array!18098 (_ BitVec 32) List!4842) Bool)

(assert (=> b!342644 (= res!189434 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4839))))

(declare-fun res!189436 () Bool)

(assert (=> start!34314 (=> (not res!189436) (not e!210111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34314 (= res!189436 (validMask!0 mask!2385))))

(assert (=> start!34314 e!210111))

(assert (=> start!34314 true))

(declare-fun tp_is_empty!7255 () Bool)

(assert (=> start!34314 tp_is_empty!7255))

(assert (=> start!34314 tp!25448))

(declare-fun e!210112 () Bool)

(declare-fun array_inv!6334 (array!18096) Bool)

(assert (=> start!34314 (and (array_inv!6334 _values!1525) e!210112)))

(declare-fun array_inv!6335 (array!18098) Bool)

(assert (=> start!34314 (array_inv!6335 _keys!1895)))

(declare-fun b!342645 () Bool)

(declare-fun e!210108 () Bool)

(assert (=> b!342645 (= e!210111 e!210108)))

(declare-fun res!189438 () Bool)

(assert (=> b!342645 (=> (not res!189438) (not e!210108))))

(declare-datatypes ((SeekEntryResult!3258 0))(
  ( (MissingZero!3258 (index!15211 (_ BitVec 32))) (Found!3258 (index!15212 (_ BitVec 32))) (Intermediate!3258 (undefined!4070 Bool) (index!15213 (_ BitVec 32)) (x!34069 (_ BitVec 32))) (Undefined!3258) (MissingVacant!3258 (index!15214 (_ BitVec 32))) )
))
(declare-fun lt!162241 () SeekEntryResult!3258)

(get-info :version)

(assert (=> b!342645 (= res!189438 (and (not ((_ is Found!3258) lt!162241)) (not ((_ is MissingZero!3258) lt!162241)) ((_ is MissingVacant!3258) lt!162241)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18098 (_ BitVec 32)) SeekEntryResult!3258)

(assert (=> b!342645 (= lt!162241 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342646 () Bool)

(assert (=> b!342646 (= e!210108 false)))

(declare-datatypes ((Unit!10652 0))(
  ( (Unit!10653) )
))
(declare-fun lt!162239 () Unit!10652)

(declare-fun e!210110 () Unit!10652)

(assert (=> b!342646 (= lt!162239 e!210110)))

(declare-fun c!52811 () Bool)

(declare-fun arrayContainsKey!0 (array!18098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342646 (= c!52811 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342647 () Bool)

(declare-fun e!210109 () Bool)

(assert (=> b!342647 (= e!210109 tp_is_empty!7255)))

(declare-fun b!342648 () Bool)

(declare-fun Unit!10654 () Unit!10652)

(assert (=> b!342648 (= e!210110 Unit!10654)))

(declare-fun lt!162240 () Unit!10652)

(declare-fun lemmaArrayContainsKeyThenInListMap!315 (array!18098 array!18096 (_ BitVec 32) (_ BitVec 32) V!10651 V!10651 (_ BitVec 64) (_ BitVec 32) Int) Unit!10652)

(declare-fun arrayScanForKey!0 (array!18098 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342648 (= lt!162240 (lemmaArrayContainsKeyThenInListMap!315 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342648 false))

(declare-fun b!342649 () Bool)

(declare-fun Unit!10655 () Unit!10652)

(assert (=> b!342649 (= e!210110 Unit!10655)))

(declare-fun b!342650 () Bool)

(declare-fun e!210107 () Bool)

(assert (=> b!342650 (= e!210107 tp_is_empty!7255)))

(declare-fun b!342651 () Bool)

(assert (=> b!342651 (= e!210112 (and e!210109 mapRes!12315))))

(declare-fun condMapEmpty!12315 () Bool)

(declare-fun mapDefault!12315 () ValueCell!3284)

(assert (=> b!342651 (= condMapEmpty!12315 (= (arr!8566 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3284)) mapDefault!12315)))))

(declare-fun b!342652 () Bool)

(declare-fun res!189435 () Bool)

(assert (=> b!342652 (=> (not res!189435) (not e!210111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18098 (_ BitVec 32)) Bool)

(assert (=> b!342652 (= res!189435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342653 () Bool)

(declare-fun res!189439 () Bool)

(assert (=> b!342653 (=> (not res!189439) (not e!210111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342653 (= res!189439 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12315 () Bool)

(declare-fun tp!25449 () Bool)

(assert (=> mapNonEmpty!12315 (= mapRes!12315 (and tp!25449 e!210107))))

(declare-fun mapKey!12315 () (_ BitVec 32))

(declare-fun mapValue!12315 () ValueCell!3284)

(declare-fun mapRest!12315 () (Array (_ BitVec 32) ValueCell!3284))

(assert (=> mapNonEmpty!12315 (= (arr!8566 _values!1525) (store mapRest!12315 mapKey!12315 mapValue!12315))))

(assert (= (and start!34314 res!189436) b!342642))

(assert (= (and b!342642 res!189437) b!342652))

(assert (= (and b!342652 res!189435) b!342644))

(assert (= (and b!342644 res!189434) b!342653))

(assert (= (and b!342653 res!189439) b!342643))

(assert (= (and b!342643 res!189440) b!342645))

(assert (= (and b!342645 res!189438) b!342646))

(assert (= (and b!342646 c!52811) b!342648))

(assert (= (and b!342646 (not c!52811)) b!342649))

(assert (= (and b!342651 condMapEmpty!12315) mapIsEmpty!12315))

(assert (= (and b!342651 (not condMapEmpty!12315)) mapNonEmpty!12315))

(assert (= (and mapNonEmpty!12315 ((_ is ValueCellFull!3284) mapValue!12315)) b!342650))

(assert (= (and b!342651 ((_ is ValueCellFull!3284) mapDefault!12315)) b!342647))

(assert (= start!34314 b!342651))

(declare-fun m!345003 () Bool)

(assert (=> b!342645 m!345003))

(declare-fun m!345005 () Bool)

(assert (=> b!342646 m!345005))

(declare-fun m!345007 () Bool)

(assert (=> b!342648 m!345007))

(assert (=> b!342648 m!345007))

(declare-fun m!345009 () Bool)

(assert (=> b!342648 m!345009))

(declare-fun m!345011 () Bool)

(assert (=> b!342643 m!345011))

(assert (=> b!342643 m!345011))

(declare-fun m!345013 () Bool)

(assert (=> b!342643 m!345013))

(declare-fun m!345015 () Bool)

(assert (=> b!342653 m!345015))

(declare-fun m!345017 () Bool)

(assert (=> b!342644 m!345017))

(declare-fun m!345019 () Bool)

(assert (=> b!342652 m!345019))

(declare-fun m!345021 () Bool)

(assert (=> start!34314 m!345021))

(declare-fun m!345023 () Bool)

(assert (=> start!34314 m!345023))

(declare-fun m!345025 () Bool)

(assert (=> start!34314 m!345025))

(declare-fun m!345027 () Bool)

(assert (=> mapNonEmpty!12315 m!345027))

(check-sat (not b!342645) (not b!342646) (not start!34314) (not b!342643) (not b!342652) tp_is_empty!7255 b_and!14521 (not b!342648) (not b!342644) (not b_next!7303) (not mapNonEmpty!12315) (not b!342653))
(check-sat b_and!14521 (not b_next!7303))
