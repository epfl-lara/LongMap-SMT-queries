; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34152 () Bool)

(assert start!34152)

(declare-fun b_free!7189 () Bool)

(declare-fun b_next!7189 () Bool)

(assert (=> start!34152 (= b_free!7189 (not b_next!7189))))

(declare-fun tp!25101 () Bool)

(declare-fun b_and!14403 () Bool)

(assert (=> start!34152 (= tp!25101 b_and!14403)))

(declare-fun b!340409 () Bool)

(declare-fun res!188043 () Bool)

(declare-fun e!208832 () Bool)

(assert (=> b!340409 (=> (not res!188043) (not e!208832))))

(declare-datatypes ((array!17868 0))(
  ( (array!17869 (arr!8454 (Array (_ BitVec 32) (_ BitVec 64))) (size!8806 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17868)

(declare-datatypes ((List!4763 0))(
  ( (Nil!4760) (Cons!4759 (h!5615 (_ BitVec 64)) (t!9863 List!4763)) )
))
(declare-fun arrayNoDuplicates!0 (array!17868 (_ BitVec 32) List!4763) Bool)

(assert (=> b!340409 (= res!188043 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4760))))

(declare-fun b!340410 () Bool)

(declare-fun res!188038 () Bool)

(assert (=> b!340410 (=> (not res!188038) (not e!208832))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10499 0))(
  ( (V!10500 (val!3615 Int)) )
))
(declare-datatypes ((ValueCell!3227 0))(
  ( (ValueCellFull!3227 (v!5788 V!10499)) (EmptyCell!3227) )
))
(declare-datatypes ((array!17870 0))(
  ( (array!17871 (arr!8455 (Array (_ BitVec 32) ValueCell!3227)) (size!8807 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17870)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340410 (= res!188038 (and (= (size!8807 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8806 _keys!1895) (size!8807 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340411 () Bool)

(declare-fun e!208828 () Bool)

(assert (=> b!340411 (= e!208832 e!208828)))

(declare-fun res!188044 () Bool)

(assert (=> b!340411 (=> (not res!188044) (not e!208828))))

(declare-datatypes ((SeekEntryResult!3221 0))(
  ( (MissingZero!3221 (index!15063 (_ BitVec 32))) (Found!3221 (index!15064 (_ BitVec 32))) (Intermediate!3221 (undefined!4033 Bool) (index!15065 (_ BitVec 32)) (x!33860 (_ BitVec 32))) (Undefined!3221) (MissingVacant!3221 (index!15066 (_ BitVec 32))) )
))
(declare-fun lt!161611 () SeekEntryResult!3221)

(get-info :version)

(assert (=> b!340411 (= res!188044 (and (not ((_ is Found!3221) lt!161611)) (not ((_ is MissingZero!3221) lt!161611)) ((_ is MissingVacant!3221) lt!161611)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17868 (_ BitVec 32)) SeekEntryResult!3221)

(assert (=> b!340411 (= lt!161611 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340412 () Bool)

(declare-fun res!188040 () Bool)

(assert (=> b!340412 (=> (not res!188040) (not e!208828))))

(declare-fun arrayContainsKey!0 (array!17868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340412 (= res!188040 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340413 () Bool)

(declare-fun e!208829 () Bool)

(declare-fun e!208830 () Bool)

(declare-fun mapRes!12138 () Bool)

(assert (=> b!340413 (= e!208829 (and e!208830 mapRes!12138))))

(declare-fun condMapEmpty!12138 () Bool)

(declare-fun mapDefault!12138 () ValueCell!3227)

(assert (=> b!340413 (= condMapEmpty!12138 (= (arr!8455 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3227)) mapDefault!12138)))))

(declare-fun b!340414 () Bool)

(declare-fun res!188042 () Bool)

(assert (=> b!340414 (=> (not res!188042) (not e!208832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340414 (= res!188042 (validKeyInArray!0 k0!1348))))

(declare-fun b!340415 () Bool)

(declare-fun e!208831 () Bool)

(declare-fun tp_is_empty!7141 () Bool)

(assert (=> b!340415 (= e!208831 tp_is_empty!7141)))

(declare-fun mapIsEmpty!12138 () Bool)

(assert (=> mapIsEmpty!12138 mapRes!12138))

(declare-fun b!340416 () Bool)

(assert (=> b!340416 (= e!208830 tp_is_empty!7141)))

(declare-fun b!340417 () Bool)

(declare-fun res!188041 () Bool)

(assert (=> b!340417 (=> (not res!188041) (not e!208832))))

(declare-fun zeroValue!1467 () V!10499)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10499)

(declare-datatypes ((tuple2!5156 0))(
  ( (tuple2!5157 (_1!2589 (_ BitVec 64)) (_2!2589 V!10499)) )
))
(declare-datatypes ((List!4764 0))(
  ( (Nil!4761) (Cons!4760 (h!5616 tuple2!5156) (t!9864 List!4764)) )
))
(declare-datatypes ((ListLongMap!4071 0))(
  ( (ListLongMap!4072 (toList!2051 List!4764)) )
))
(declare-fun contains!2124 (ListLongMap!4071 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1580 (array!17868 array!17870 (_ BitVec 32) (_ BitVec 32) V!10499 V!10499 (_ BitVec 32) Int) ListLongMap!4071)

(assert (=> b!340417 (= res!188041 (not (contains!2124 (getCurrentListMap!1580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!188039 () Bool)

(assert (=> start!34152 (=> (not res!188039) (not e!208832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34152 (= res!188039 (validMask!0 mask!2385))))

(assert (=> start!34152 e!208832))

(assert (=> start!34152 true))

(assert (=> start!34152 tp_is_empty!7141))

(assert (=> start!34152 tp!25101))

(declare-fun array_inv!6266 (array!17870) Bool)

(assert (=> start!34152 (and (array_inv!6266 _values!1525) e!208829)))

(declare-fun array_inv!6267 (array!17868) Bool)

(assert (=> start!34152 (array_inv!6267 _keys!1895)))

(declare-fun mapNonEmpty!12138 () Bool)

(declare-fun tp!25100 () Bool)

(assert (=> mapNonEmpty!12138 (= mapRes!12138 (and tp!25100 e!208831))))

(declare-fun mapRest!12138 () (Array (_ BitVec 32) ValueCell!3227))

(declare-fun mapKey!12138 () (_ BitVec 32))

(declare-fun mapValue!12138 () ValueCell!3227)

(assert (=> mapNonEmpty!12138 (= (arr!8455 _values!1525) (store mapRest!12138 mapKey!12138 mapValue!12138))))

(declare-fun b!340418 () Bool)

(declare-fun res!188045 () Bool)

(assert (=> b!340418 (=> (not res!188045) (not e!208832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17868 (_ BitVec 32)) Bool)

(assert (=> b!340418 (= res!188045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340419 () Bool)

(assert (=> b!340419 (= e!208828 false)))

(declare-fun lt!161610 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17868 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340419 (= lt!161610 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34152 res!188039) b!340410))

(assert (= (and b!340410 res!188038) b!340418))

(assert (= (and b!340418 res!188045) b!340409))

(assert (= (and b!340409 res!188043) b!340414))

(assert (= (and b!340414 res!188042) b!340417))

(assert (= (and b!340417 res!188041) b!340411))

(assert (= (and b!340411 res!188044) b!340412))

(assert (= (and b!340412 res!188040) b!340419))

(assert (= (and b!340413 condMapEmpty!12138) mapIsEmpty!12138))

(assert (= (and b!340413 (not condMapEmpty!12138)) mapNonEmpty!12138))

(assert (= (and mapNonEmpty!12138 ((_ is ValueCellFull!3227) mapValue!12138)) b!340415))

(assert (= (and b!340413 ((_ is ValueCellFull!3227) mapDefault!12138)) b!340416))

(assert (= start!34152 b!340413))

(declare-fun m!343383 () Bool)

(assert (=> b!340412 m!343383))

(declare-fun m!343385 () Bool)

(assert (=> b!340418 m!343385))

(declare-fun m!343387 () Bool)

(assert (=> b!340417 m!343387))

(assert (=> b!340417 m!343387))

(declare-fun m!343389 () Bool)

(assert (=> b!340417 m!343389))

(declare-fun m!343391 () Bool)

(assert (=> mapNonEmpty!12138 m!343391))

(declare-fun m!343393 () Bool)

(assert (=> b!340419 m!343393))

(declare-fun m!343395 () Bool)

(assert (=> b!340414 m!343395))

(declare-fun m!343397 () Bool)

(assert (=> b!340409 m!343397))

(declare-fun m!343399 () Bool)

(assert (=> start!34152 m!343399))

(declare-fun m!343401 () Bool)

(assert (=> start!34152 m!343401))

(declare-fun m!343403 () Bool)

(assert (=> start!34152 m!343403))

(declare-fun m!343405 () Bool)

(assert (=> b!340411 m!343405))

(check-sat tp_is_empty!7141 (not b_next!7189) (not start!34152) (not b!340411) b_and!14403 (not b!340414) (not b!340417) (not mapNonEmpty!12138) (not b!340409) (not b!340418) (not b!340412) (not b!340419))
(check-sat b_and!14403 (not b_next!7189))
