; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33972 () Bool)

(assert start!33972)

(declare-fun b_free!7117 () Bool)

(declare-fun b_next!7117 () Bool)

(assert (=> start!33972 (= b_free!7117 (not b_next!7117))))

(declare-fun tp!24870 () Bool)

(declare-fun b_and!14321 () Bool)

(assert (=> start!33972 (= tp!24870 b_and!14321)))

(declare-fun mapIsEmpty!12015 () Bool)

(declare-fun mapRes!12015 () Bool)

(assert (=> mapIsEmpty!12015 mapRes!12015))

(declare-fun b!338532 () Bool)

(declare-fun e!207711 () Bool)

(declare-fun tp_is_empty!7069 () Bool)

(assert (=> b!338532 (= e!207711 tp_is_empty!7069)))

(declare-fun b!338533 () Bool)

(declare-fun res!187033 () Bool)

(declare-fun e!207709 () Bool)

(assert (=> b!338533 (=> (not res!187033) (not e!207709))))

(declare-datatypes ((array!17716 0))(
  ( (array!17717 (arr!8383 (Array (_ BitVec 32) (_ BitVec 64))) (size!8735 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17716)

(declare-datatypes ((List!4716 0))(
  ( (Nil!4713) (Cons!4712 (h!5568 (_ BitVec 64)) (t!9806 List!4716)) )
))
(declare-fun arrayNoDuplicates!0 (array!17716 (_ BitVec 32) List!4716) Bool)

(assert (=> b!338533 (= res!187033 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4713))))

(declare-fun b!338534 () Bool)

(declare-datatypes ((Unit!10486 0))(
  ( (Unit!10487) )
))
(declare-fun e!207713 () Unit!10486)

(declare-fun Unit!10488 () Unit!10486)

(assert (=> b!338534 (= e!207713 Unit!10488)))

(declare-fun b!338535 () Bool)

(declare-fun Unit!10489 () Unit!10486)

(assert (=> b!338535 (= e!207713 Unit!10489)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((V!10403 0))(
  ( (V!10404 (val!3579 Int)) )
))
(declare-datatypes ((ValueCell!3191 0))(
  ( (ValueCellFull!3191 (v!5747 V!10403)) (EmptyCell!3191) )
))
(declare-datatypes ((array!17718 0))(
  ( (array!17719 (arr!8384 (Array (_ BitVec 32) ValueCell!3191)) (size!8736 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17718)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10403)

(declare-fun lt!160868 () Unit!10486)

(declare-fun zeroValue!1467 () V!10403)

(declare-fun lemmaArrayContainsKeyThenInListMap!281 (array!17716 array!17718 (_ BitVec 32) (_ BitVec 32) V!10403 V!10403 (_ BitVec 64) (_ BitVec 32) Int) Unit!10486)

(declare-fun arrayScanForKey!0 (array!17716 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338535 (= lt!160868 (lemmaArrayContainsKeyThenInListMap!281 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338535 false))

(declare-fun b!338536 () Bool)

(declare-fun res!187030 () Bool)

(assert (=> b!338536 (=> (not res!187030) (not e!207709))))

(assert (=> b!338536 (= res!187030 (and (= (size!8736 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8735 _keys!1895) (size!8736 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338537 () Bool)

(declare-fun e!207710 () Bool)

(assert (=> b!338537 (= e!207710 (and e!207711 mapRes!12015))))

(declare-fun condMapEmpty!12015 () Bool)

(declare-fun mapDefault!12015 () ValueCell!3191)

(assert (=> b!338537 (= condMapEmpty!12015 (= (arr!8384 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3191)) mapDefault!12015)))))

(declare-fun b!338538 () Bool)

(declare-fun e!207707 () Bool)

(assert (=> b!338538 (= e!207709 e!207707)))

(declare-fun res!187029 () Bool)

(assert (=> b!338538 (=> (not res!187029) (not e!207707))))

(declare-datatypes ((SeekEntryResult!3196 0))(
  ( (MissingZero!3196 (index!14963 (_ BitVec 32))) (Found!3196 (index!14964 (_ BitVec 32))) (Intermediate!3196 (undefined!4008 Bool) (index!14965 (_ BitVec 32)) (x!33689 (_ BitVec 32))) (Undefined!3196) (MissingVacant!3196 (index!14966 (_ BitVec 32))) )
))
(declare-fun lt!160870 () SeekEntryResult!3196)

(get-info :version)

(assert (=> b!338538 (= res!187029 (and (not ((_ is Found!3196) lt!160870)) ((_ is MissingZero!3196) lt!160870)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17716 (_ BitVec 32)) SeekEntryResult!3196)

(assert (=> b!338538 (= lt!160870 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338539 () Bool)

(declare-fun res!187028 () Bool)

(assert (=> b!338539 (=> (not res!187028) (not e!207709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338539 (= res!187028 (validKeyInArray!0 k0!1348))))

(declare-fun b!338540 () Bool)

(assert (=> b!338540 (= e!207707 false)))

(declare-fun lt!160869 () Unit!10486)

(assert (=> b!338540 (= lt!160869 e!207713)))

(declare-fun c!52412 () Bool)

(declare-fun arrayContainsKey!0 (array!17716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338540 (= c!52412 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12015 () Bool)

(declare-fun tp!24869 () Bool)

(declare-fun e!207712 () Bool)

(assert (=> mapNonEmpty!12015 (= mapRes!12015 (and tp!24869 e!207712))))

(declare-fun mapKey!12015 () (_ BitVec 32))

(declare-fun mapValue!12015 () ValueCell!3191)

(declare-fun mapRest!12015 () (Array (_ BitVec 32) ValueCell!3191))

(assert (=> mapNonEmpty!12015 (= (arr!8384 _values!1525) (store mapRest!12015 mapKey!12015 mapValue!12015))))

(declare-fun b!338541 () Bool)

(declare-fun res!187031 () Bool)

(assert (=> b!338541 (=> (not res!187031) (not e!207709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17716 (_ BitVec 32)) Bool)

(assert (=> b!338541 (= res!187031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338542 () Bool)

(declare-fun res!187032 () Bool)

(assert (=> b!338542 (=> (not res!187032) (not e!207709))))

(declare-datatypes ((tuple2!5108 0))(
  ( (tuple2!5109 (_1!2565 (_ BitVec 64)) (_2!2565 V!10403)) )
))
(declare-datatypes ((List!4717 0))(
  ( (Nil!4714) (Cons!4713 (h!5569 tuple2!5108) (t!9807 List!4717)) )
))
(declare-datatypes ((ListLongMap!4023 0))(
  ( (ListLongMap!4024 (toList!2027 List!4717)) )
))
(declare-fun contains!2095 (ListLongMap!4023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1556 (array!17716 array!17718 (_ BitVec 32) (_ BitVec 32) V!10403 V!10403 (_ BitVec 32) Int) ListLongMap!4023)

(assert (=> b!338542 (= res!187032 (not (contains!2095 (getCurrentListMap!1556 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338531 () Bool)

(assert (=> b!338531 (= e!207712 tp_is_empty!7069)))

(declare-fun res!187034 () Bool)

(assert (=> start!33972 (=> (not res!187034) (not e!207709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33972 (= res!187034 (validMask!0 mask!2385))))

(assert (=> start!33972 e!207709))

(assert (=> start!33972 true))

(assert (=> start!33972 tp_is_empty!7069))

(assert (=> start!33972 tp!24870))

(declare-fun array_inv!6222 (array!17718) Bool)

(assert (=> start!33972 (and (array_inv!6222 _values!1525) e!207710)))

(declare-fun array_inv!6223 (array!17716) Bool)

(assert (=> start!33972 (array_inv!6223 _keys!1895)))

(assert (= (and start!33972 res!187034) b!338536))

(assert (= (and b!338536 res!187030) b!338541))

(assert (= (and b!338541 res!187031) b!338533))

(assert (= (and b!338533 res!187033) b!338539))

(assert (= (and b!338539 res!187028) b!338542))

(assert (= (and b!338542 res!187032) b!338538))

(assert (= (and b!338538 res!187029) b!338540))

(assert (= (and b!338540 c!52412) b!338535))

(assert (= (and b!338540 (not c!52412)) b!338534))

(assert (= (and b!338537 condMapEmpty!12015) mapIsEmpty!12015))

(assert (= (and b!338537 (not condMapEmpty!12015)) mapNonEmpty!12015))

(assert (= (and mapNonEmpty!12015 ((_ is ValueCellFull!3191) mapValue!12015)) b!338531))

(assert (= (and b!338537 ((_ is ValueCellFull!3191) mapDefault!12015)) b!338532))

(assert (= start!33972 b!338537))

(declare-fun m!342019 () Bool)

(assert (=> b!338541 m!342019))

(declare-fun m!342021 () Bool)

(assert (=> b!338538 m!342021))

(declare-fun m!342023 () Bool)

(assert (=> b!338535 m!342023))

(assert (=> b!338535 m!342023))

(declare-fun m!342025 () Bool)

(assert (=> b!338535 m!342025))

(declare-fun m!342027 () Bool)

(assert (=> start!33972 m!342027))

(declare-fun m!342029 () Bool)

(assert (=> start!33972 m!342029))

(declare-fun m!342031 () Bool)

(assert (=> start!33972 m!342031))

(declare-fun m!342033 () Bool)

(assert (=> b!338533 m!342033))

(declare-fun m!342035 () Bool)

(assert (=> b!338539 m!342035))

(declare-fun m!342037 () Bool)

(assert (=> b!338540 m!342037))

(declare-fun m!342039 () Bool)

(assert (=> mapNonEmpty!12015 m!342039))

(declare-fun m!342041 () Bool)

(assert (=> b!338542 m!342041))

(assert (=> b!338542 m!342041))

(declare-fun m!342043 () Bool)

(assert (=> b!338542 m!342043))

(check-sat tp_is_empty!7069 (not b!338541) (not b!338535) b_and!14321 (not b!338533) (not start!33972) (not b!338538) (not b!338540) (not b_next!7117) (not b!338542) (not b!338539) (not mapNonEmpty!12015))
(check-sat b_and!14321 (not b_next!7117))
