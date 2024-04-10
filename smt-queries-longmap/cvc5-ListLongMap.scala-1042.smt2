; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21934 () Bool)

(assert start!21934)

(declare-fun b!223528 () Bool)

(declare-fun b_free!6001 () Bool)

(declare-fun b_next!6001 () Bool)

(assert (=> b!223528 (= b_free!6001 (not b_next!6001))))

(declare-fun tp!21144 () Bool)

(declare-fun b_and!12899 () Bool)

(assert (=> b!223528 (= tp!21144 b_and!12899)))

(declare-fun b!223509 () Bool)

(declare-fun res!109870 () Bool)

(declare-fun e!145199 () Bool)

(assert (=> b!223509 (=> (not res!109870) (not e!145199))))

(declare-datatypes ((V!7465 0))(
  ( (V!7466 (val!2976 Int)) )
))
(declare-datatypes ((ValueCell!2588 0))(
  ( (ValueCellFull!2588 (v!4996 V!7465)) (EmptyCell!2588) )
))
(declare-datatypes ((array!10969 0))(
  ( (array!10970 (arr!5204 (Array (_ BitVec 32) ValueCell!2588)) (size!5537 (_ BitVec 32))) )
))
(declare-datatypes ((array!10971 0))(
  ( (array!10972 (arr!5205 (Array (_ BitVec 32) (_ BitVec 64))) (size!5538 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3076 0))(
  ( (LongMapFixedSize!3077 (defaultEntry!4197 Int) (mask!10025 (_ BitVec 32)) (extraKeys!3934 (_ BitVec 32)) (zeroValue!4038 V!7465) (minValue!4038 V!7465) (_size!1587 (_ BitVec 32)) (_keys!6251 array!10971) (_values!4180 array!10969) (_vacant!1587 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3076)

(declare-datatypes ((SeekEntryResult!849 0))(
  ( (MissingZero!849 (index!5566 (_ BitVec 32))) (Found!849 (index!5567 (_ BitVec 32))) (Intermediate!849 (undefined!1661 Bool) (index!5568 (_ BitVec 32)) (x!23101 (_ BitVec 32))) (Undefined!849) (MissingVacant!849 (index!5569 (_ BitVec 32))) )
))
(declare-fun lt!112925 () SeekEntryResult!849)

(assert (=> b!223509 (= res!109870 (= (select (arr!5205 (_keys!6251 thiss!1504)) (index!5566 lt!112925)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223510 () Bool)

(declare-fun e!145193 () Bool)

(declare-fun e!145197 () Bool)

(assert (=> b!223510 (= e!145193 e!145197)))

(declare-fun res!109856 () Bool)

(assert (=> b!223510 (=> (not res!109856) (not e!145197))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223510 (= res!109856 (or (= lt!112925 (MissingZero!849 index!297)) (= lt!112925 (MissingVacant!849 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10971 (_ BitVec 32)) SeekEntryResult!849)

(assert (=> b!223510 (= lt!112925 (seekEntryOrOpen!0 key!932 (_keys!6251 thiss!1504) (mask!10025 thiss!1504)))))

(declare-fun b!223511 () Bool)

(declare-fun e!145184 () Bool)

(declare-fun tp_is_empty!5863 () Bool)

(assert (=> b!223511 (= e!145184 tp_is_empty!5863)))

(declare-fun b!223512 () Bool)

(declare-fun res!109861 () Bool)

(assert (=> b!223512 (=> (not res!109861) (not e!145193))))

(assert (=> b!223512 (= res!109861 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223513 () Bool)

(declare-datatypes ((Unit!6717 0))(
  ( (Unit!6718) )
))
(declare-fun e!145191 () Unit!6717)

(declare-fun Unit!6719 () Unit!6717)

(assert (=> b!223513 (= e!145191 Unit!6719)))

(declare-fun lt!112924 () Unit!6717)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!233 (array!10971 array!10969 (_ BitVec 32) (_ BitVec 32) V!7465 V!7465 (_ BitVec 64) Int) Unit!6717)

(assert (=> b!223513 (= lt!112924 (lemmaInListMapThenSeekEntryOrOpenFindsIt!233 (_keys!6251 thiss!1504) (_values!4180 thiss!1504) (mask!10025 thiss!1504) (extraKeys!3934 thiss!1504) (zeroValue!4038 thiss!1504) (minValue!4038 thiss!1504) key!932 (defaultEntry!4197 thiss!1504)))))

(assert (=> b!223513 false))

(declare-fun b!223514 () Bool)

(declare-fun res!109869 () Bool)

(declare-fun e!145183 () Bool)

(assert (=> b!223514 (=> (not res!109869) (not e!145183))))

(declare-datatypes ((List!3322 0))(
  ( (Nil!3319) (Cons!3318 (h!3966 (_ BitVec 64)) (t!8281 List!3322)) )
))
(declare-fun arrayNoDuplicates!0 (array!10971 (_ BitVec 32) List!3322) Bool)

(assert (=> b!223514 (= res!109869 (arrayNoDuplicates!0 (_keys!6251 thiss!1504) #b00000000000000000000000000000000 Nil!3319))))

(declare-fun b!223515 () Bool)

(declare-fun lt!112922 () Unit!6717)

(assert (=> b!223515 (= e!145191 lt!112922)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!244 (array!10971 array!10969 (_ BitVec 32) (_ BitVec 32) V!7465 V!7465 (_ BitVec 64) Int) Unit!6717)

(assert (=> b!223515 (= lt!112922 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!244 (_keys!6251 thiss!1504) (_values!4180 thiss!1504) (mask!10025 thiss!1504) (extraKeys!3934 thiss!1504) (zeroValue!4038 thiss!1504) (minValue!4038 thiss!1504) key!932 (defaultEntry!4197 thiss!1504)))))

(declare-fun c!37102 () Bool)

(assert (=> b!223515 (= c!37102 (is-MissingZero!849 lt!112925))))

(declare-fun e!145198 () Bool)

(assert (=> b!223515 e!145198))

(declare-fun b!223516 () Bool)

(declare-fun res!109853 () Bool)

(assert (=> b!223516 (=> (not res!109853) (not e!145183))))

(declare-fun noDuplicate!78 (List!3322) Bool)

(assert (=> b!223516 (= res!109853 (noDuplicate!78 Nil!3319))))

(declare-fun b!223517 () Bool)

(declare-fun e!145192 () Unit!6717)

(declare-fun Unit!6720 () Unit!6717)

(assert (=> b!223517 (= e!145192 Unit!6720)))

(declare-fun lt!112920 () Unit!6717)

(declare-fun lemmaArrayContainsKeyThenInListMap!72 (array!10971 array!10969 (_ BitVec 32) (_ BitVec 32) V!7465 V!7465 (_ BitVec 64) (_ BitVec 32) Int) Unit!6717)

(assert (=> b!223517 (= lt!112920 (lemmaArrayContainsKeyThenInListMap!72 (_keys!6251 thiss!1504) (_values!4180 thiss!1504) (mask!10025 thiss!1504) (extraKeys!3934 thiss!1504) (zeroValue!4038 thiss!1504) (minValue!4038 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4197 thiss!1504)))))

(assert (=> b!223517 false))

(declare-fun b!223518 () Bool)

(declare-fun e!145185 () Bool)

(assert (=> b!223518 (= e!145185 tp_is_empty!5863)))

(declare-fun b!223519 () Bool)

(declare-fun e!145190 () Bool)

(declare-fun contains!1542 (List!3322 (_ BitVec 64)) Bool)

(assert (=> b!223519 (= e!145190 (contains!1542 Nil!3319 key!932))))

(declare-fun b!223520 () Bool)

(declare-fun e!145196 () Bool)

(declare-fun call!20838 () Bool)

(assert (=> b!223520 (= e!145196 (not call!20838))))

(declare-fun b!223521 () Bool)

(declare-fun res!109862 () Bool)

(assert (=> b!223521 (=> (not res!109862) (not e!145183))))

(declare-fun e!145195 () Bool)

(assert (=> b!223521 (= res!109862 e!145195)))

(declare-fun res!109863 () Bool)

(assert (=> b!223521 (=> res!109863 e!145195)))

(assert (=> b!223521 (= res!109863 e!145190)))

(declare-fun res!109854 () Bool)

(assert (=> b!223521 (=> (not res!109854) (not e!145190))))

(assert (=> b!223521 (= res!109854 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!223522 () Bool)

(declare-fun res!109868 () Bool)

(assert (=> b!223522 (=> (not res!109868) (not e!145183))))

(assert (=> b!223522 (= res!109868 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5538 (_keys!6251 thiss!1504)))))))

(declare-fun b!223523 () Bool)

(declare-fun res!109865 () Bool)

(assert (=> b!223523 (=> (not res!109865) (not e!145183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223523 (= res!109865 (validKeyInArray!0 key!932))))

(declare-fun mapIsEmpty!9964 () Bool)

(declare-fun mapRes!9964 () Bool)

(assert (=> mapIsEmpty!9964 mapRes!9964))

(declare-fun b!223524 () Bool)

(declare-fun res!109851 () Bool)

(assert (=> b!223524 (=> (not res!109851) (not e!145183))))

(assert (=> b!223524 (= res!109851 (not (contains!1542 Nil!3319 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223525 () Bool)

(declare-fun e!145187 () Bool)

(assert (=> b!223525 (= e!145187 e!145196)))

(declare-fun res!109860 () Bool)

(declare-fun call!20837 () Bool)

(assert (=> b!223525 (= res!109860 call!20837)))

(assert (=> b!223525 (=> (not res!109860) (not e!145196))))

(declare-fun res!109867 () Bool)

(assert (=> start!21934 (=> (not res!109867) (not e!145193))))

(declare-fun valid!1239 (LongMapFixedSize!3076) Bool)

(assert (=> start!21934 (= res!109867 (valid!1239 thiss!1504))))

(assert (=> start!21934 e!145193))

(declare-fun e!145194 () Bool)

(assert (=> start!21934 e!145194))

(assert (=> start!21934 true))

(declare-fun b!223526 () Bool)

(declare-fun e!145189 () Bool)

(assert (=> b!223526 (= e!145189 (and e!145185 mapRes!9964))))

(declare-fun condMapEmpty!9964 () Bool)

(declare-fun mapDefault!9964 () ValueCell!2588)

