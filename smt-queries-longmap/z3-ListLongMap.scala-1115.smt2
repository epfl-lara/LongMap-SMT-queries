; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22940 () Bool)

(assert start!22940)

(declare-fun b!239603 () Bool)

(declare-fun b_free!6439 () Bool)

(declare-fun b_next!6439 () Bool)

(assert (=> b!239603 (= b_free!6439 (not b_next!6439))))

(declare-fun tp!22521 () Bool)

(declare-fun b_and!13419 () Bool)

(assert (=> b!239603 (= tp!22521 b_and!13419)))

(declare-fun b!239587 () Bool)

(declare-fun res!117427 () Bool)

(declare-fun e!155562 () Bool)

(assert (=> b!239587 (=> (not res!117427) (not e!155562))))

(declare-datatypes ((V!8049 0))(
  ( (V!8050 (val!3195 Int)) )
))
(declare-datatypes ((ValueCell!2807 0))(
  ( (ValueCellFull!2807 (v!5234 V!8049)) (EmptyCell!2807) )
))
(declare-datatypes ((array!11879 0))(
  ( (array!11880 (arr!5641 (Array (_ BitVec 32) ValueCell!2807)) (size!5982 (_ BitVec 32))) )
))
(declare-datatypes ((array!11881 0))(
  ( (array!11882 (arr!5642 (Array (_ BitVec 32) (_ BitVec 64))) (size!5983 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3514 0))(
  ( (LongMapFixedSize!3515 (defaultEntry!4442 Int) (mask!10490 (_ BitVec 32)) (extraKeys!4179 (_ BitVec 32)) (zeroValue!4283 V!8049) (minValue!4283 V!8049) (_size!1806 (_ BitVec 32)) (_keys!6544 array!11881) (_values!4425 array!11879) (_vacant!1806 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3514)

(declare-datatypes ((SeekEntryResult!1001 0))(
  ( (MissingZero!1001 (index!6174 (_ BitVec 32))) (Found!1001 (index!6175 (_ BitVec 32))) (Intermediate!1001 (undefined!1813 Bool) (index!6176 (_ BitVec 32)) (x!24081 (_ BitVec 32))) (Undefined!1001) (MissingVacant!1001 (index!6177 (_ BitVec 32))) )
))
(declare-fun lt!120869 () SeekEntryResult!1001)

(assert (=> b!239587 (= res!117427 (= (select (arr!5642 (_keys!6544 thiss!1504)) (index!6174 lt!120869)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22262 () Bool)

(declare-fun call!22265 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22262 (= call!22265 (arrayContainsKey!0 (_keys!6544 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239588 () Bool)

(declare-fun e!155553 () Bool)

(declare-fun e!155551 () Bool)

(assert (=> b!239588 (= e!155553 e!155551)))

(declare-fun res!117428 () Bool)

(assert (=> b!239588 (=> (not res!117428) (not e!155551))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239588 (= res!117428 (inRange!0 index!297 (mask!10490 thiss!1504)))))

(declare-datatypes ((Unit!7338 0))(
  ( (Unit!7339) )
))
(declare-fun lt!120872 () Unit!7338)

(declare-fun e!155555 () Unit!7338)

(assert (=> b!239588 (= lt!120872 e!155555)))

(declare-fun c!39942 () Bool)

(declare-datatypes ((tuple2!4634 0))(
  ( (tuple2!4635 (_1!2328 (_ BitVec 64)) (_2!2328 V!8049)) )
))
(declare-datatypes ((List!3514 0))(
  ( (Nil!3511) (Cons!3510 (h!4166 tuple2!4634) (t!8501 List!3514)) )
))
(declare-datatypes ((ListLongMap!3549 0))(
  ( (ListLongMap!3550 (toList!1790 List!3514)) )
))
(declare-fun contains!1692 (ListLongMap!3549 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1322 (array!11881 array!11879 (_ BitVec 32) (_ BitVec 32) V!8049 V!8049 (_ BitVec 32) Int) ListLongMap!3549)

(assert (=> b!239588 (= c!39942 (contains!1692 (getCurrentListMap!1322 (_keys!6544 thiss!1504) (_values!4425 thiss!1504) (mask!10490 thiss!1504) (extraKeys!4179 thiss!1504) (zeroValue!4283 thiss!1504) (minValue!4283 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4442 thiss!1504)) key!932))))

(declare-fun b!239589 () Bool)

(declare-fun e!155558 () Bool)

(assert (=> b!239589 (= e!155558 e!155553)))

(declare-fun res!117426 () Bool)

(assert (=> b!239589 (=> (not res!117426) (not e!155553))))

(assert (=> b!239589 (= res!117426 (or (= lt!120869 (MissingZero!1001 index!297)) (= lt!120869 (MissingVacant!1001 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11881 (_ BitVec 32)) SeekEntryResult!1001)

(assert (=> b!239589 (= lt!120869 (seekEntryOrOpen!0 key!932 (_keys!6544 thiss!1504) (mask!10490 thiss!1504)))))

(declare-fun b!239590 () Bool)

(declare-fun e!155561 () Bool)

(declare-fun e!155556 () Bool)

(assert (=> b!239590 (= e!155561 e!155556)))

(declare-fun res!117424 () Bool)

(declare-fun call!22266 () Bool)

(assert (=> b!239590 (= res!117424 call!22266)))

(assert (=> b!239590 (=> (not res!117424) (not e!155556))))

(declare-fun b!239591 () Bool)

(assert (=> b!239591 (= e!155556 (not call!22265))))

(declare-fun res!117421 () Bool)

(assert (=> start!22940 (=> (not res!117421) (not e!155558))))

(declare-fun valid!1396 (LongMapFixedSize!3514) Bool)

(assert (=> start!22940 (= res!117421 (valid!1396 thiss!1504))))

(assert (=> start!22940 e!155558))

(declare-fun e!155559 () Bool)

(assert (=> start!22940 e!155559))

(assert (=> start!22940 true))

(declare-fun b!239592 () Bool)

(declare-fun res!117422 () Bool)

(assert (=> b!239592 (=> (not res!117422) (not e!155551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239592 (= res!117422 (validMask!0 (mask!10490 thiss!1504)))))

(declare-fun b!239593 () Bool)

(assert (=> b!239593 (= e!155562 (not call!22265))))

(declare-fun c!39940 () Bool)

(declare-fun bm!22263 () Bool)

(assert (=> bm!22263 (= call!22266 (inRange!0 (ite c!39940 (index!6174 lt!120869) (index!6177 lt!120869)) (mask!10490 thiss!1504)))))

(declare-fun b!239594 () Bool)

(get-info :version)

(assert (=> b!239594 (= e!155561 ((_ is Undefined!1001) lt!120869))))

(declare-fun b!239595 () Bool)

(declare-fun res!117425 () Bool)

(assert (=> b!239595 (=> (not res!117425) (not e!155562))))

(assert (=> b!239595 (= res!117425 call!22266)))

(declare-fun e!155560 () Bool)

(assert (=> b!239595 (= e!155560 e!155562)))

(declare-fun mapIsEmpty!10683 () Bool)

(declare-fun mapRes!10683 () Bool)

(assert (=> mapIsEmpty!10683 mapRes!10683))

(declare-fun b!239596 () Bool)

(declare-fun Unit!7340 () Unit!7338)

(assert (=> b!239596 (= e!155555 Unit!7340)))

(declare-fun lt!120871 () Unit!7338)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!332 (array!11881 array!11879 (_ BitVec 32) (_ BitVec 32) V!8049 V!8049 (_ BitVec 64) Int) Unit!7338)

(assert (=> b!239596 (= lt!120871 (lemmaInListMapThenSeekEntryOrOpenFindsIt!332 (_keys!6544 thiss!1504) (_values!4425 thiss!1504) (mask!10490 thiss!1504) (extraKeys!4179 thiss!1504) (zeroValue!4283 thiss!1504) (minValue!4283 thiss!1504) key!932 (defaultEntry!4442 thiss!1504)))))

(assert (=> b!239596 false))

(declare-fun b!239597 () Bool)

(declare-fun e!155550 () Bool)

(declare-fun tp_is_empty!6301 () Bool)

(assert (=> b!239597 (= e!155550 tp_is_empty!6301)))

(declare-fun mapNonEmpty!10683 () Bool)

(declare-fun tp!22520 () Bool)

(declare-fun e!155554 () Bool)

(assert (=> mapNonEmpty!10683 (= mapRes!10683 (and tp!22520 e!155554))))

(declare-fun mapValue!10683 () ValueCell!2807)

(declare-fun mapKey!10683 () (_ BitVec 32))

(declare-fun mapRest!10683 () (Array (_ BitVec 32) ValueCell!2807))

(assert (=> mapNonEmpty!10683 (= (arr!5641 (_values!4425 thiss!1504)) (store mapRest!10683 mapKey!10683 mapValue!10683))))

(declare-fun b!239598 () Bool)

(declare-fun lt!120870 () Unit!7338)

(assert (=> b!239598 (= e!155555 lt!120870)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!324 (array!11881 array!11879 (_ BitVec 32) (_ BitVec 32) V!8049 V!8049 (_ BitVec 64) Int) Unit!7338)

(assert (=> b!239598 (= lt!120870 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!324 (_keys!6544 thiss!1504) (_values!4425 thiss!1504) (mask!10490 thiss!1504) (extraKeys!4179 thiss!1504) (zeroValue!4283 thiss!1504) (minValue!4283 thiss!1504) key!932 (defaultEntry!4442 thiss!1504)))))

(assert (=> b!239598 (= c!39940 ((_ is MissingZero!1001) lt!120869))))

(assert (=> b!239598 e!155560))

(declare-fun b!239599 () Bool)

(declare-fun e!155552 () Bool)

(assert (=> b!239599 (= e!155552 (and e!155550 mapRes!10683))))

(declare-fun condMapEmpty!10683 () Bool)

(declare-fun mapDefault!10683 () ValueCell!2807)

(assert (=> b!239599 (= condMapEmpty!10683 (= (arr!5641 (_values!4425 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2807)) mapDefault!10683)))))

(declare-fun b!239600 () Bool)

(declare-fun c!39941 () Bool)

(assert (=> b!239600 (= c!39941 ((_ is MissingVacant!1001) lt!120869))))

(assert (=> b!239600 (= e!155560 e!155561)))

(declare-fun b!239601 () Bool)

(assert (=> b!239601 (= e!155551 (and (= (size!5982 (_values!4425 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10490 thiss!1504))) (= (size!5983 (_keys!6544 thiss!1504)) (size!5982 (_values!4425 thiss!1504))) (bvsge (mask!10490 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4179 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4179 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!239602 () Bool)

(declare-fun res!117419 () Bool)

(assert (=> b!239602 (=> (not res!117419) (not e!155551))))

(assert (=> b!239602 (= res!117419 (arrayContainsKey!0 (_keys!6544 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3707 (array!11881) Bool)

(declare-fun array_inv!3708 (array!11879) Bool)

(assert (=> b!239603 (= e!155559 (and tp!22521 tp_is_empty!6301 (array_inv!3707 (_keys!6544 thiss!1504)) (array_inv!3708 (_values!4425 thiss!1504)) e!155552))))

(declare-fun b!239604 () Bool)

(declare-fun res!117423 () Bool)

(assert (=> b!239604 (= res!117423 (= (select (arr!5642 (_keys!6544 thiss!1504)) (index!6177 lt!120869)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239604 (=> (not res!117423) (not e!155556))))

(declare-fun b!239605 () Bool)

(assert (=> b!239605 (= e!155554 tp_is_empty!6301)))

(declare-fun b!239606 () Bool)

(declare-fun res!117420 () Bool)

(assert (=> b!239606 (=> (not res!117420) (not e!155558))))

(assert (=> b!239606 (= res!117420 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22940 res!117421) b!239606))

(assert (= (and b!239606 res!117420) b!239589))

(assert (= (and b!239589 res!117426) b!239588))

(assert (= (and b!239588 c!39942) b!239596))

(assert (= (and b!239588 (not c!39942)) b!239598))

(assert (= (and b!239598 c!39940) b!239595))

(assert (= (and b!239598 (not c!39940)) b!239600))

(assert (= (and b!239595 res!117425) b!239587))

(assert (= (and b!239587 res!117427) b!239593))

(assert (= (and b!239600 c!39941) b!239590))

(assert (= (and b!239600 (not c!39941)) b!239594))

(assert (= (and b!239590 res!117424) b!239604))

(assert (= (and b!239604 res!117423) b!239591))

(assert (= (or b!239595 b!239590) bm!22263))

(assert (= (or b!239593 b!239591) bm!22262))

(assert (= (and b!239588 res!117428) b!239602))

(assert (= (and b!239602 res!117419) b!239592))

(assert (= (and b!239592 res!117422) b!239601))

(assert (= (and b!239599 condMapEmpty!10683) mapIsEmpty!10683))

(assert (= (and b!239599 (not condMapEmpty!10683)) mapNonEmpty!10683))

(assert (= (and mapNonEmpty!10683 ((_ is ValueCellFull!2807) mapValue!10683)) b!239605))

(assert (= (and b!239599 ((_ is ValueCellFull!2807) mapDefault!10683)) b!239597))

(assert (= b!239603 b!239599))

(assert (= start!22940 b!239603))

(declare-fun m!259741 () Bool)

(assert (=> b!239602 m!259741))

(declare-fun m!259743 () Bool)

(assert (=> b!239604 m!259743))

(declare-fun m!259745 () Bool)

(assert (=> b!239588 m!259745))

(declare-fun m!259747 () Bool)

(assert (=> b!239588 m!259747))

(assert (=> b!239588 m!259747))

(declare-fun m!259749 () Bool)

(assert (=> b!239588 m!259749))

(declare-fun m!259751 () Bool)

(assert (=> mapNonEmpty!10683 m!259751))

(declare-fun m!259753 () Bool)

(assert (=> b!239598 m!259753))

(declare-fun m!259755 () Bool)

(assert (=> b!239587 m!259755))

(declare-fun m!259757 () Bool)

(assert (=> b!239589 m!259757))

(assert (=> bm!22262 m!259741))

(declare-fun m!259759 () Bool)

(assert (=> start!22940 m!259759))

(declare-fun m!259761 () Bool)

(assert (=> bm!22263 m!259761))

(declare-fun m!259763 () Bool)

(assert (=> b!239603 m!259763))

(declare-fun m!259765 () Bool)

(assert (=> b!239603 m!259765))

(declare-fun m!259767 () Bool)

(assert (=> b!239592 m!259767))

(declare-fun m!259769 () Bool)

(assert (=> b!239596 m!259769))

(check-sat (not b!239596) (not start!22940) b_and!13419 (not b!239588) (not b!239589) (not b_next!6439) (not bm!22263) (not b!239592) tp_is_empty!6301 (not b!239602) (not b!239598) (not mapNonEmpty!10683) (not bm!22262) (not b!239603))
(check-sat b_and!13419 (not b_next!6439))
