; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33740 () Bool)

(assert start!33740)

(declare-fun b_free!6975 () Bool)

(declare-fun b_next!6975 () Bool)

(assert (=> start!33740 (= b_free!6975 (not b_next!6975))))

(declare-fun tp!24429 () Bool)

(declare-fun b_and!14155 () Bool)

(assert (=> start!33740 (= tp!24429 b_and!14155)))

(declare-fun b!335592 () Bool)

(declare-fun e!206006 () Bool)

(declare-fun e!206002 () Bool)

(assert (=> b!335592 (= e!206006 e!206002)))

(declare-fun res!185217 () Bool)

(assert (=> b!335592 (=> (not res!185217) (not e!206002))))

(declare-datatypes ((V!10213 0))(
  ( (V!10214 (val!3508 Int)) )
))
(declare-datatypes ((tuple2!5098 0))(
  ( (tuple2!5099 (_1!2560 (_ BitVec 64)) (_2!2560 V!10213)) )
))
(declare-datatypes ((List!4716 0))(
  ( (Nil!4713) (Cons!4712 (h!5568 tuple2!5098) (t!9804 List!4716)) )
))
(declare-datatypes ((ListLongMap!4011 0))(
  ( (ListLongMap!4012 (toList!2021 List!4716)) )
))
(declare-fun lt!159889 () ListLongMap!4011)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun contains!2065 (ListLongMap!4011 (_ BitVec 64)) Bool)

(assert (=> b!335592 (= res!185217 (not (contains!2065 lt!159889 k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10213)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3120 0))(
  ( (ValueCellFull!3120 (v!5670 V!10213)) (EmptyCell!3120) )
))
(declare-datatypes ((array!17447 0))(
  ( (array!17448 (arr!8254 (Array (_ BitVec 32) ValueCell!3120)) (size!8606 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17447)

(declare-datatypes ((array!17449 0))(
  ( (array!17450 (arr!8255 (Array (_ BitVec 32) (_ BitVec 64))) (size!8607 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17449)

(declare-fun minValue!1467 () V!10213)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun getCurrentListMap!1544 (array!17449 array!17447 (_ BitVec 32) (_ BitVec 32) V!10213 V!10213 (_ BitVec 32) Int) ListLongMap!4011)

(assert (=> b!335592 (= lt!159889 (getCurrentListMap!1544 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335593 () Bool)

(declare-fun res!185216 () Bool)

(assert (=> b!335593 (=> (not res!185216) (not e!206006))))

(assert (=> b!335593 (= res!185216 (and (= (size!8606 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8607 _keys!1895) (size!8606 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335594 () Bool)

(declare-fun res!185212 () Bool)

(assert (=> b!335594 (=> (not res!185212) (not e!206006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335594 (= res!185212 (validKeyInArray!0 k0!1348))))

(declare-fun b!335595 () Bool)

(declare-fun e!206003 () Bool)

(assert (=> b!335595 (= e!206003 (not true))))

(declare-datatypes ((SeekEntryResult!3192 0))(
  ( (MissingZero!3192 (index!14947 (_ BitVec 32))) (Found!3192 (index!14948 (_ BitVec 32))) (Intermediate!3192 (undefined!4004 Bool) (index!14949 (_ BitVec 32)) (x!33446 (_ BitVec 32))) (Undefined!3192) (MissingVacant!3192 (index!14950 (_ BitVec 32))) )
))
(declare-fun lt!159888 () SeekEntryResult!3192)

(assert (=> b!335595 (contains!2065 lt!159889 (select (arr!8255 _keys!1895) (index!14948 lt!159888)))))

(declare-datatypes ((Unit!10447 0))(
  ( (Unit!10448) )
))
(declare-fun lt!159887 () Unit!10447)

(declare-fun lemmaValidKeyInArrayIsInListMap!170 (array!17449 array!17447 (_ BitVec 32) (_ BitVec 32) V!10213 V!10213 (_ BitVec 32) Int) Unit!10447)

(assert (=> b!335595 (= lt!159887 (lemmaValidKeyInArrayIsInListMap!170 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14948 lt!159888) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335595 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159886 () Unit!10447)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17449 (_ BitVec 64) (_ BitVec 32)) Unit!10447)

(assert (=> b!335595 (= lt!159886 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14948 lt!159888)))))

(declare-fun b!335596 () Bool)

(declare-fun res!185214 () Bool)

(assert (=> b!335596 (=> (not res!185214) (not e!206003))))

(assert (=> b!335596 (= res!185214 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14948 lt!159888)))))

(declare-fun b!335598 () Bool)

(assert (=> b!335598 (= e!206002 e!206003)))

(declare-fun res!185219 () Bool)

(assert (=> b!335598 (=> (not res!185219) (not e!206003))))

(get-info :version)

(assert (=> b!335598 (= res!185219 (and ((_ is Found!3192) lt!159888) (= (select (arr!8255 _keys!1895) (index!14948 lt!159888)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17449 (_ BitVec 32)) SeekEntryResult!3192)

(assert (=> b!335598 (= lt!159888 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11787 () Bool)

(declare-fun mapRes!11787 () Bool)

(declare-fun tp!24428 () Bool)

(declare-fun e!206001 () Bool)

(assert (=> mapNonEmpty!11787 (= mapRes!11787 (and tp!24428 e!206001))))

(declare-fun mapRest!11787 () (Array (_ BitVec 32) ValueCell!3120))

(declare-fun mapValue!11787 () ValueCell!3120)

(declare-fun mapKey!11787 () (_ BitVec 32))

(assert (=> mapNonEmpty!11787 (= (arr!8254 _values!1525) (store mapRest!11787 mapKey!11787 mapValue!11787))))

(declare-fun b!335599 () Bool)

(declare-fun e!206005 () Bool)

(declare-fun tp_is_empty!6927 () Bool)

(assert (=> b!335599 (= e!206005 tp_is_empty!6927)))

(declare-fun mapIsEmpty!11787 () Bool)

(assert (=> mapIsEmpty!11787 mapRes!11787))

(declare-fun b!335600 () Bool)

(declare-fun res!185215 () Bool)

(assert (=> b!335600 (=> (not res!185215) (not e!206006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17449 (_ BitVec 32)) Bool)

(assert (=> b!335600 (= res!185215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335601 () Bool)

(declare-fun res!185213 () Bool)

(assert (=> b!335601 (=> (not res!185213) (not e!206006))))

(declare-datatypes ((List!4717 0))(
  ( (Nil!4714) (Cons!4713 (h!5569 (_ BitVec 64)) (t!9805 List!4717)) )
))
(declare-fun arrayNoDuplicates!0 (array!17449 (_ BitVec 32) List!4717) Bool)

(assert (=> b!335601 (= res!185213 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4714))))

(declare-fun b!335602 () Bool)

(assert (=> b!335602 (= e!206001 tp_is_empty!6927)))

(declare-fun res!185218 () Bool)

(assert (=> start!33740 (=> (not res!185218) (not e!206006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33740 (= res!185218 (validMask!0 mask!2385))))

(assert (=> start!33740 e!206006))

(assert (=> start!33740 true))

(assert (=> start!33740 tp_is_empty!6927))

(assert (=> start!33740 tp!24429))

(declare-fun e!206004 () Bool)

(declare-fun array_inv!6130 (array!17447) Bool)

(assert (=> start!33740 (and (array_inv!6130 _values!1525) e!206004)))

(declare-fun array_inv!6131 (array!17449) Bool)

(assert (=> start!33740 (array_inv!6131 _keys!1895)))

(declare-fun b!335597 () Bool)

(assert (=> b!335597 (= e!206004 (and e!206005 mapRes!11787))))

(declare-fun condMapEmpty!11787 () Bool)

(declare-fun mapDefault!11787 () ValueCell!3120)

(assert (=> b!335597 (= condMapEmpty!11787 (= (arr!8254 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3120)) mapDefault!11787)))))

(assert (= (and start!33740 res!185218) b!335593))

(assert (= (and b!335593 res!185216) b!335600))

(assert (= (and b!335600 res!185215) b!335601))

(assert (= (and b!335601 res!185213) b!335594))

(assert (= (and b!335594 res!185212) b!335592))

(assert (= (and b!335592 res!185217) b!335598))

(assert (= (and b!335598 res!185219) b!335596))

(assert (= (and b!335596 res!185214) b!335595))

(assert (= (and b!335597 condMapEmpty!11787) mapIsEmpty!11787))

(assert (= (and b!335597 (not condMapEmpty!11787)) mapNonEmpty!11787))

(assert (= (and mapNonEmpty!11787 ((_ is ValueCellFull!3120) mapValue!11787)) b!335602))

(assert (= (and b!335597 ((_ is ValueCellFull!3120) mapDefault!11787)) b!335599))

(assert (= start!33740 b!335597))

(declare-fun m!339581 () Bool)

(assert (=> mapNonEmpty!11787 m!339581))

(declare-fun m!339583 () Bool)

(assert (=> b!335598 m!339583))

(declare-fun m!339585 () Bool)

(assert (=> b!335598 m!339585))

(declare-fun m!339587 () Bool)

(assert (=> b!335596 m!339587))

(declare-fun m!339589 () Bool)

(assert (=> b!335601 m!339589))

(declare-fun m!339591 () Bool)

(assert (=> b!335595 m!339591))

(assert (=> b!335595 m!339583))

(declare-fun m!339593 () Bool)

(assert (=> b!335595 m!339593))

(assert (=> b!335595 m!339583))

(declare-fun m!339595 () Bool)

(assert (=> b!335595 m!339595))

(declare-fun m!339597 () Bool)

(assert (=> b!335595 m!339597))

(declare-fun m!339599 () Bool)

(assert (=> b!335592 m!339599))

(declare-fun m!339601 () Bool)

(assert (=> b!335592 m!339601))

(declare-fun m!339603 () Bool)

(assert (=> b!335594 m!339603))

(declare-fun m!339605 () Bool)

(assert (=> start!33740 m!339605))

(declare-fun m!339607 () Bool)

(assert (=> start!33740 m!339607))

(declare-fun m!339609 () Bool)

(assert (=> start!33740 m!339609))

(declare-fun m!339611 () Bool)

(assert (=> b!335600 m!339611))

(check-sat (not start!33740) (not b!335592) (not b!335598) tp_is_empty!6927 (not b!335596) b_and!14155 (not b!335594) (not b!335601) (not b_next!6975) (not mapNonEmpty!11787) (not b!335595) (not b!335600))
(check-sat b_and!14155 (not b_next!6975))
