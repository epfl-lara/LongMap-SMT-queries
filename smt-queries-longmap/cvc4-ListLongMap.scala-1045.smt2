; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21956 () Bool)

(assert start!21956)

(declare-fun b!224582 () Bool)

(declare-fun b_free!6023 () Bool)

(declare-fun b_next!6023 () Bool)

(assert (=> b!224582 (= b_free!6023 (not b_next!6023))))

(declare-fun tp!21210 () Bool)

(declare-fun b_and!12921 () Bool)

(assert (=> b!224582 (= tp!21210 b_and!12921)))

(declare-fun b!224565 () Bool)

(declare-fun res!110523 () Bool)

(declare-fun e!145785 () Bool)

(assert (=> b!224565 (=> (not res!110523) (not e!145785))))

(declare-datatypes ((List!3338 0))(
  ( (Nil!3335) (Cons!3334 (h!3982 (_ BitVec 64)) (t!8297 List!3338)) )
))
(declare-fun contains!1558 (List!3338 (_ BitVec 64)) Bool)

(assert (=> b!224565 (= res!110523 (not (contains!1558 Nil!3335 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224566 () Bool)

(declare-datatypes ((Unit!6755 0))(
  ( (Unit!6756) )
))
(declare-fun e!145780 () Unit!6755)

(declare-fun Unit!6757 () Unit!6755)

(assert (=> b!224566 (= e!145780 Unit!6757)))

(declare-fun lt!113185 () Unit!6755)

(declare-datatypes ((V!7493 0))(
  ( (V!7494 (val!2987 Int)) )
))
(declare-datatypes ((ValueCell!2599 0))(
  ( (ValueCellFull!2599 (v!5007 V!7493)) (EmptyCell!2599) )
))
(declare-datatypes ((array!11013 0))(
  ( (array!11014 (arr!5226 (Array (_ BitVec 32) ValueCell!2599)) (size!5559 (_ BitVec 32))) )
))
(declare-datatypes ((array!11015 0))(
  ( (array!11016 (arr!5227 (Array (_ BitVec 32) (_ BitVec 64))) (size!5560 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3098 0))(
  ( (LongMapFixedSize!3099 (defaultEntry!4208 Int) (mask!10042 (_ BitVec 32)) (extraKeys!3945 (_ BitVec 32)) (zeroValue!4049 V!7493) (minValue!4049 V!7493) (_size!1598 (_ BitVec 32)) (_keys!6262 array!11015) (_values!4191 array!11013) (_vacant!1598 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3098)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!240 (array!11015 array!11013 (_ BitVec 32) (_ BitVec 32) V!7493 V!7493 (_ BitVec 64) Int) Unit!6755)

(assert (=> b!224566 (= lt!113185 (lemmaInListMapThenSeekEntryOrOpenFindsIt!240 (_keys!6262 thiss!1504) (_values!4191 thiss!1504) (mask!10042 thiss!1504) (extraKeys!3945 thiss!1504) (zeroValue!4049 thiss!1504) (minValue!4049 thiss!1504) key!932 (defaultEntry!4208 thiss!1504)))))

(assert (=> b!224566 false))

(declare-fun b!224567 () Bool)

(declare-fun res!110522 () Bool)

(declare-fun e!145789 () Bool)

(assert (=> b!224567 (=> (not res!110522) (not e!145789))))

(declare-fun call!20904 () Bool)

(assert (=> b!224567 (= res!110522 call!20904)))

(declare-fun e!145786 () Bool)

(assert (=> b!224567 (= e!145786 e!145789)))

(declare-fun b!224568 () Bool)

(declare-fun res!110519 () Bool)

(declare-datatypes ((SeekEntryResult!859 0))(
  ( (MissingZero!859 (index!5606 (_ BitVec 32))) (Found!859 (index!5607 (_ BitVec 32))) (Intermediate!859 (undefined!1671 Bool) (index!5608 (_ BitVec 32)) (x!23135 (_ BitVec 32))) (Undefined!859) (MissingVacant!859 (index!5609 (_ BitVec 32))) )
))
(declare-fun lt!113189 () SeekEntryResult!859)

(assert (=> b!224568 (= res!110519 (= (select (arr!5227 (_keys!6262 thiss!1504)) (index!5609 lt!113189)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!145790 () Bool)

(assert (=> b!224568 (=> (not res!110519) (not e!145790))))

(declare-fun res!110521 () Bool)

(declare-fun e!145788 () Bool)

(assert (=> start!21956 (=> (not res!110521) (not e!145788))))

(declare-fun valid!1249 (LongMapFixedSize!3098) Bool)

(assert (=> start!21956 (= res!110521 (valid!1249 thiss!1504))))

(assert (=> start!21956 e!145788))

(declare-fun e!145792 () Bool)

(assert (=> start!21956 e!145792))

(assert (=> start!21956 true))

(declare-fun b!224569 () Bool)

(declare-fun res!110514 () Bool)

(assert (=> b!224569 (=> (not res!110514) (not e!145785))))

(declare-fun noDuplicate!86 (List!3338) Bool)

(assert (=> b!224569 (= res!110514 (noDuplicate!86 Nil!3335))))

(declare-fun b!224570 () Bool)

(declare-fun e!145779 () Bool)

(assert (=> b!224570 (= e!145779 e!145785)))

(declare-fun res!110515 () Bool)

(assert (=> b!224570 (=> (not res!110515) (not e!145785))))

(assert (=> b!224570 (= res!110515 (and (bvslt (size!5560 (_keys!6262 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5560 (_keys!6262 thiss!1504)))))))

(declare-fun lt!113187 () Unit!6755)

(declare-fun e!145776 () Unit!6755)

(assert (=> b!224570 (= lt!113187 e!145776)))

(declare-fun c!37236 () Bool)

(declare-fun lt!113183 () Bool)

(assert (=> b!224570 (= c!37236 lt!113183)))

(declare-fun arrayContainsKey!0 (array!11015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224570 (= lt!113183 (arrayContainsKey!0 (_keys!6262 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224571 () Bool)

(declare-fun Unit!6758 () Unit!6755)

(assert (=> b!224571 (= e!145776 Unit!6758)))

(declare-fun lt!113188 () Unit!6755)

(declare-fun lemmaArrayContainsKeyThenInListMap!79 (array!11015 array!11013 (_ BitVec 32) (_ BitVec 32) V!7493 V!7493 (_ BitVec 64) (_ BitVec 32) Int) Unit!6755)

(assert (=> b!224571 (= lt!113188 (lemmaArrayContainsKeyThenInListMap!79 (_keys!6262 thiss!1504) (_values!4191 thiss!1504) (mask!10042 thiss!1504) (extraKeys!3945 thiss!1504) (zeroValue!4049 thiss!1504) (minValue!4049 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4208 thiss!1504)))))

(assert (=> b!224571 false))

(declare-fun b!224572 () Bool)

(declare-fun call!20903 () Bool)

(assert (=> b!224572 (= e!145790 (not call!20903))))

(declare-fun b!224573 () Bool)

(declare-fun lt!113184 () Unit!6755)

(assert (=> b!224573 (= e!145780 lt!113184)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!251 (array!11015 array!11013 (_ BitVec 32) (_ BitVec 32) V!7493 V!7493 (_ BitVec 64) Int) Unit!6755)

(assert (=> b!224573 (= lt!113184 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!251 (_keys!6262 thiss!1504) (_values!4191 thiss!1504) (mask!10042 thiss!1504) (extraKeys!3945 thiss!1504) (zeroValue!4049 thiss!1504) (minValue!4049 thiss!1504) key!932 (defaultEntry!4208 thiss!1504)))))

(declare-fun c!37233 () Bool)

(assert (=> b!224573 (= c!37233 (is-MissingZero!859 lt!113189))))

(assert (=> b!224573 e!145786))

(declare-fun b!224574 () Bool)

(declare-fun res!110512 () Bool)

(assert (=> b!224574 (=> (not res!110512) (not e!145789))))

(assert (=> b!224574 (= res!110512 (= (select (arr!5227 (_keys!6262 thiss!1504)) (index!5606 lt!113189)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224575 () Bool)

(declare-fun res!110511 () Bool)

(assert (=> b!224575 (=> (not res!110511) (not e!145788))))

(assert (=> b!224575 (= res!110511 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224576 () Bool)

(declare-fun c!37235 () Bool)

(assert (=> b!224576 (= c!37235 (is-MissingVacant!859 lt!113189))))

(declare-fun e!145781 () Bool)

(assert (=> b!224576 (= e!145786 e!145781)))

(declare-fun b!224577 () Bool)

(declare-fun e!145778 () Bool)

(declare-fun tp_is_empty!5885 () Bool)

(assert (=> b!224577 (= e!145778 tp_is_empty!5885)))

(declare-fun b!224578 () Bool)

(assert (=> b!224578 (= e!145789 (not call!20903))))

(declare-fun bm!20900 () Bool)

(assert (=> bm!20900 (= call!20903 (arrayContainsKey!0 (_keys!6262 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224579 () Bool)

(declare-fun res!110530 () Bool)

(assert (=> b!224579 (=> (not res!110530) (not e!145785))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224579 (= res!110530 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5560 (_keys!6262 thiss!1504)))))))

(declare-fun b!224580 () Bool)

(declare-fun e!145784 () Bool)

(assert (=> b!224580 (= e!145784 (not (contains!1558 Nil!3335 key!932)))))

(declare-fun b!224581 () Bool)

(declare-fun Unit!6759 () Unit!6755)

(assert (=> b!224581 (= e!145776 Unit!6759)))

(declare-fun mapNonEmpty!9997 () Bool)

(declare-fun mapRes!9997 () Bool)

(declare-fun tp!21211 () Bool)

(declare-fun e!145793 () Bool)

(assert (=> mapNonEmpty!9997 (= mapRes!9997 (and tp!21211 e!145793))))

(declare-fun mapKey!9997 () (_ BitVec 32))

(declare-fun mapValue!9997 () ValueCell!2599)

(declare-fun mapRest!9997 () (Array (_ BitVec 32) ValueCell!2599))

(assert (=> mapNonEmpty!9997 (= (arr!5226 (_values!4191 thiss!1504)) (store mapRest!9997 mapKey!9997 mapValue!9997))))

(declare-fun e!145777 () Bool)

(declare-fun array_inv!3459 (array!11015) Bool)

(declare-fun array_inv!3460 (array!11013) Bool)

(assert (=> b!224582 (= e!145792 (and tp!21210 tp_is_empty!5885 (array_inv!3459 (_keys!6262 thiss!1504)) (array_inv!3460 (_values!4191 thiss!1504)) e!145777))))

(declare-fun b!224583 () Bool)

(assert (=> b!224583 (= e!145793 tp_is_empty!5885)))

(declare-fun b!224584 () Bool)

(declare-fun e!145782 () Bool)

(assert (=> b!224584 (= e!145788 e!145782)))

(declare-fun res!110527 () Bool)

(assert (=> b!224584 (=> (not res!110527) (not e!145782))))

(assert (=> b!224584 (= res!110527 (or (= lt!113189 (MissingZero!859 index!297)) (= lt!113189 (MissingVacant!859 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11015 (_ BitVec 32)) SeekEntryResult!859)

(assert (=> b!224584 (= lt!113189 (seekEntryOrOpen!0 key!932 (_keys!6262 thiss!1504) (mask!10042 thiss!1504)))))

(declare-fun b!224585 () Bool)

(assert (=> b!224585 (= e!145781 e!145790)))

(declare-fun res!110518 () Bool)

(assert (=> b!224585 (= res!110518 call!20904)))

(assert (=> b!224585 (=> (not res!110518) (not e!145790))))

(declare-fun b!224586 () Bool)

(declare-fun res!110529 () Bool)

(assert (=> b!224586 (=> (not res!110529) (not e!145785))))

(declare-fun e!145791 () Bool)

(assert (=> b!224586 (= res!110529 e!145791)))

(declare-fun res!110513 () Bool)

(assert (=> b!224586 (=> res!110513 e!145791)))

(declare-fun e!145787 () Bool)

(assert (=> b!224586 (= res!110513 e!145787)))

(declare-fun res!110524 () Bool)

(assert (=> b!224586 (=> (not res!110524) (not e!145787))))

(assert (=> b!224586 (= res!110524 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!224587 () Bool)

(declare-fun res!110526 () Bool)

(assert (=> b!224587 (=> (not res!110526) (not e!145785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224587 (= res!110526 (validKeyInArray!0 key!932))))

(declare-fun b!224588 () Bool)

(declare-fun res!110516 () Bool)

(assert (=> b!224588 (=> (not res!110516) (not e!145785))))

(assert (=> b!224588 (= res!110516 (not (contains!1558 Nil!3335 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224589 () Bool)

(assert (=> b!224589 (= e!145782 e!145779)))

(declare-fun res!110525 () Bool)

(assert (=> b!224589 (=> (not res!110525) (not e!145779))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224589 (= res!110525 (inRange!0 index!297 (mask!10042 thiss!1504)))))

(declare-fun lt!113182 () Unit!6755)

(assert (=> b!224589 (= lt!113182 e!145780)))

(declare-fun c!37234 () Bool)

(declare-datatypes ((tuple2!4426 0))(
  ( (tuple2!4427 (_1!2224 (_ BitVec 64)) (_2!2224 V!7493)) )
))
(declare-datatypes ((List!3339 0))(
  ( (Nil!3336) (Cons!3335 (h!3983 tuple2!4426) (t!8298 List!3339)) )
))
(declare-datatypes ((ListLongMap!3339 0))(
  ( (ListLongMap!3340 (toList!1685 List!3339)) )
))
(declare-fun contains!1559 (ListLongMap!3339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1213 (array!11015 array!11013 (_ BitVec 32) (_ BitVec 32) V!7493 V!7493 (_ BitVec 32) Int) ListLongMap!3339)

(assert (=> b!224589 (= c!37234 (contains!1559 (getCurrentListMap!1213 (_keys!6262 thiss!1504) (_values!4191 thiss!1504) (mask!10042 thiss!1504) (extraKeys!3945 thiss!1504) (zeroValue!4049 thiss!1504) (minValue!4049 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4208 thiss!1504)) key!932))))

(declare-fun b!224590 () Bool)

(assert (=> b!224590 (= e!145777 (and e!145778 mapRes!9997))))

(declare-fun condMapEmpty!9997 () Bool)

(declare-fun mapDefault!9997 () ValueCell!2599)

