; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16084 () Bool)

(assert start!16084)

(declare-fun b!159586 () Bool)

(declare-fun b_free!3541 () Bool)

(declare-fun b_next!3541 () Bool)

(assert (=> b!159586 (= b_free!3541 (not b_next!3541))))

(declare-fun tp!13192 () Bool)

(declare-fun b_and!9929 () Bool)

(assert (=> b!159586 (= tp!13192 b_and!9929)))

(declare-fun b!159579 () Bool)

(declare-fun e!104419 () Bool)

(declare-fun e!104418 () Bool)

(declare-fun mapRes!5702 () Bool)

(assert (=> b!159579 (= e!104419 (and e!104418 mapRes!5702))))

(declare-fun condMapEmpty!5702 () Bool)

(declare-datatypes ((V!4105 0))(
  ( (V!4106 (val!1716 Int)) )
))
(declare-datatypes ((ValueCell!1328 0))(
  ( (ValueCellFull!1328 (v!3575 V!4105)) (EmptyCell!1328) )
))
(declare-datatypes ((array!5745 0))(
  ( (array!5746 (arr!2716 (Array (_ BitVec 32) (_ BitVec 64))) (size!3001 (_ BitVec 32))) )
))
(declare-datatypes ((array!5747 0))(
  ( (array!5748 (arr!2717 (Array (_ BitVec 32) ValueCell!1328)) (size!3002 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1564 0))(
  ( (LongMapFixedSize!1565 (defaultEntry!3224 Int) (mask!7779 (_ BitVec 32)) (extraKeys!2965 (_ BitVec 32)) (zeroValue!3067 V!4105) (minValue!3067 V!4105) (_size!831 (_ BitVec 32)) (_keys!5024 array!5745) (_values!3207 array!5747) (_vacant!831 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1564)

(declare-fun mapDefault!5702 () ValueCell!1328)

(assert (=> b!159579 (= condMapEmpty!5702 (= (arr!2717 (_values!3207 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1328)) mapDefault!5702)))))

(declare-fun b!159580 () Bool)

(declare-fun res!75420 () Bool)

(declare-fun e!104416 () Bool)

(assert (=> b!159580 (=> (not res!75420) (not e!104416))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!322 0))(
  ( (MissingZero!322 (index!3456 (_ BitVec 32))) (Found!322 (index!3457 (_ BitVec 32))) (Intermediate!322 (undefined!1134 Bool) (index!3458 (_ BitVec 32)) (x!17641 (_ BitVec 32))) (Undefined!322) (MissingVacant!322 (index!3459 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5745 (_ BitVec 32)) SeekEntryResult!322)

(assert (=> b!159580 (= res!75420 ((_ is Undefined!322) (seekEntryOrOpen!0 key!828 (_keys!5024 thiss!1248) (mask!7779 thiss!1248))))))

(declare-fun b!159581 () Bool)

(declare-fun res!75418 () Bool)

(assert (=> b!159581 (=> (not res!75418) (not e!104416))))

(assert (=> b!159581 (= res!75418 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159582 () Bool)

(assert (=> b!159582 (= e!104416 false)))

(declare-fun lt!81843 () Bool)

(declare-datatypes ((List!1913 0))(
  ( (Nil!1910) (Cons!1909 (h!2522 (_ BitVec 64)) (t!6706 List!1913)) )
))
(declare-fun arrayNoDuplicates!0 (array!5745 (_ BitVec 32) List!1913) Bool)

(assert (=> b!159582 (= lt!81843 (arrayNoDuplicates!0 (_keys!5024 thiss!1248) #b00000000000000000000000000000000 Nil!1910))))

(declare-fun mapIsEmpty!5702 () Bool)

(assert (=> mapIsEmpty!5702 mapRes!5702))

(declare-fun res!75417 () Bool)

(assert (=> start!16084 (=> (not res!75417) (not e!104416))))

(declare-fun valid!733 (LongMapFixedSize!1564) Bool)

(assert (=> start!16084 (= res!75417 (valid!733 thiss!1248))))

(assert (=> start!16084 e!104416))

(declare-fun e!104415 () Bool)

(assert (=> start!16084 e!104415))

(assert (=> start!16084 true))

(declare-fun b!159583 () Bool)

(declare-fun e!104417 () Bool)

(declare-fun tp_is_empty!3343 () Bool)

(assert (=> b!159583 (= e!104417 tp_is_empty!3343)))

(declare-fun b!159584 () Bool)

(declare-fun res!75419 () Bool)

(assert (=> b!159584 (=> (not res!75419) (not e!104416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5745 (_ BitVec 32)) Bool)

(assert (=> b!159584 (= res!75419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5024 thiss!1248) (mask!7779 thiss!1248)))))

(declare-fun b!159585 () Bool)

(declare-fun res!75422 () Bool)

(assert (=> b!159585 (=> (not res!75422) (not e!104416))))

(assert (=> b!159585 (= res!75422 (and (= (size!3002 (_values!3207 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7779 thiss!1248))) (= (size!3001 (_keys!5024 thiss!1248)) (size!3002 (_values!3207 thiss!1248))) (bvsge (mask!7779 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2965 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2965 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!5702 () Bool)

(declare-fun tp!13193 () Bool)

(assert (=> mapNonEmpty!5702 (= mapRes!5702 (and tp!13193 e!104417))))

(declare-fun mapRest!5702 () (Array (_ BitVec 32) ValueCell!1328))

(declare-fun mapKey!5702 () (_ BitVec 32))

(declare-fun mapValue!5702 () ValueCell!1328)

(assert (=> mapNonEmpty!5702 (= (arr!2717 (_values!3207 thiss!1248)) (store mapRest!5702 mapKey!5702 mapValue!5702))))

(declare-fun array_inv!1741 (array!5745) Bool)

(declare-fun array_inv!1742 (array!5747) Bool)

(assert (=> b!159586 (= e!104415 (and tp!13192 tp_is_empty!3343 (array_inv!1741 (_keys!5024 thiss!1248)) (array_inv!1742 (_values!3207 thiss!1248)) e!104419))))

(declare-fun b!159587 () Bool)

(declare-fun res!75423 () Bool)

(assert (=> b!159587 (=> (not res!75423) (not e!104416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159587 (= res!75423 (validMask!0 (mask!7779 thiss!1248)))))

(declare-fun b!159588 () Bool)

(declare-fun res!75421 () Bool)

(assert (=> b!159588 (=> (not res!75421) (not e!104416))))

(declare-datatypes ((tuple2!2862 0))(
  ( (tuple2!2863 (_1!1442 (_ BitVec 64)) (_2!1442 V!4105)) )
))
(declare-datatypes ((List!1914 0))(
  ( (Nil!1911) (Cons!1910 (h!2523 tuple2!2862) (t!6707 List!1914)) )
))
(declare-datatypes ((ListLongMap!1849 0))(
  ( (ListLongMap!1850 (toList!940 List!1914)) )
))
(declare-fun contains!979 (ListLongMap!1849 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!590 (array!5745 array!5747 (_ BitVec 32) (_ BitVec 32) V!4105 V!4105 (_ BitVec 32) Int) ListLongMap!1849)

(assert (=> b!159588 (= res!75421 (contains!979 (getCurrentListMap!590 (_keys!5024 thiss!1248) (_values!3207 thiss!1248) (mask!7779 thiss!1248) (extraKeys!2965 thiss!1248) (zeroValue!3067 thiss!1248) (minValue!3067 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3224 thiss!1248)) key!828))))

(declare-fun b!159589 () Bool)

(assert (=> b!159589 (= e!104418 tp_is_empty!3343)))

(assert (= (and start!16084 res!75417) b!159581))

(assert (= (and b!159581 res!75418) b!159580))

(assert (= (and b!159580 res!75420) b!159588))

(assert (= (and b!159588 res!75421) b!159587))

(assert (= (and b!159587 res!75423) b!159585))

(assert (= (and b!159585 res!75422) b!159584))

(assert (= (and b!159584 res!75419) b!159582))

(assert (= (and b!159579 condMapEmpty!5702) mapIsEmpty!5702))

(assert (= (and b!159579 (not condMapEmpty!5702)) mapNonEmpty!5702))

(assert (= (and mapNonEmpty!5702 ((_ is ValueCellFull!1328) mapValue!5702)) b!159583))

(assert (= (and b!159579 ((_ is ValueCellFull!1328) mapDefault!5702)) b!159589))

(assert (= b!159586 b!159579))

(assert (= start!16084 b!159586))

(declare-fun m!191257 () Bool)

(assert (=> start!16084 m!191257))

(declare-fun m!191259 () Bool)

(assert (=> b!159580 m!191259))

(declare-fun m!191261 () Bool)

(assert (=> mapNonEmpty!5702 m!191261))

(declare-fun m!191263 () Bool)

(assert (=> b!159586 m!191263))

(declare-fun m!191265 () Bool)

(assert (=> b!159586 m!191265))

(declare-fun m!191267 () Bool)

(assert (=> b!159587 m!191267))

(declare-fun m!191269 () Bool)

(assert (=> b!159584 m!191269))

(declare-fun m!191271 () Bool)

(assert (=> b!159582 m!191271))

(declare-fun m!191273 () Bool)

(assert (=> b!159588 m!191273))

(assert (=> b!159588 m!191273))

(declare-fun m!191275 () Bool)

(assert (=> b!159588 m!191275))

(check-sat tp_is_empty!3343 (not b!159588) (not b!159587) b_and!9929 (not b!159580) (not mapNonEmpty!5702) (not start!16084) (not b!159582) (not b!159586) (not b!159584) (not b_next!3541))
(check-sat b_and!9929 (not b_next!3541))
