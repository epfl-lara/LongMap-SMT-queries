; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25122 () Bool)

(assert start!25122)

(declare-fun b!261615 () Bool)

(declare-fun b_free!6769 () Bool)

(declare-fun b_next!6769 () Bool)

(assert (=> b!261615 (= b_free!6769 (not b_next!6769))))

(declare-fun tp!23638 () Bool)

(declare-fun b_and!13903 () Bool)

(assert (=> b!261615 (= tp!23638 b_and!13903)))

(declare-fun b!261604 () Bool)

(declare-fun e!169514 () Bool)

(declare-fun tp_is_empty!6631 () Bool)

(assert (=> b!261604 (= e!169514 tp_is_empty!6631)))

(declare-fun b!261605 () Bool)

(declare-fun res!127824 () Bool)

(declare-datatypes ((V!8489 0))(
  ( (V!8490 (val!3360 Int)) )
))
(declare-datatypes ((ValueCell!2972 0))(
  ( (ValueCellFull!2972 (v!5485 V!8489)) (EmptyCell!2972) )
))
(declare-datatypes ((array!12619 0))(
  ( (array!12620 (arr!5972 (Array (_ BitVec 32) ValueCell!2972)) (size!6323 (_ BitVec 32))) )
))
(declare-datatypes ((array!12621 0))(
  ( (array!12622 (arr!5973 (Array (_ BitVec 32) (_ BitVec 64))) (size!6324 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3844 0))(
  ( (LongMapFixedSize!3845 (defaultEntry!4820 Int) (mask!11168 (_ BitVec 32)) (extraKeys!4557 (_ BitVec 32)) (zeroValue!4661 V!8489) (minValue!4661 V!8489) (_size!1971 (_ BitVec 32)) (_keys!7008 array!12621) (_values!4803 array!12619) (_vacant!1971 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3844)

(declare-datatypes ((SeekEntryResult!1187 0))(
  ( (MissingZero!1187 (index!6918 (_ BitVec 32))) (Found!1187 (index!6919 (_ BitVec 32))) (Intermediate!1187 (undefined!1999 Bool) (index!6920 (_ BitVec 32)) (x!25177 (_ BitVec 32))) (Undefined!1187) (MissingVacant!1187 (index!6921 (_ BitVec 32))) )
))
(declare-fun lt!132096 () SeekEntryResult!1187)

(assert (=> b!261605 (= res!127824 (= (select (arr!5973 (_keys!7008 thiss!1504)) (index!6921 lt!132096)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169520 () Bool)

(assert (=> b!261605 (=> (not res!127824) (not e!169520))))

(declare-fun b!261606 () Bool)

(declare-fun e!169517 () Bool)

(assert (=> b!261606 (= e!169517 tp_is_empty!6631)))

(declare-fun b!261607 () Bool)

(declare-datatypes ((Unit!8130 0))(
  ( (Unit!8131) )
))
(declare-fun e!169511 () Unit!8130)

(declare-fun Unit!8132 () Unit!8130)

(assert (=> b!261607 (= e!169511 Unit!8132)))

(declare-fun lt!132091 () Unit!8130)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!253 (array!12621 array!12619 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 64) (_ BitVec 32) Int) Unit!8130)

(assert (=> b!261607 (= lt!132091 (lemmaArrayContainsKeyThenInListMap!253 (_keys!7008 thiss!1504) (_values!4803 thiss!1504) (mask!11168 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4820 thiss!1504)))))

(assert (=> b!261607 false))

(declare-fun res!127823 () Bool)

(declare-fun e!169521 () Bool)

(assert (=> start!25122 (=> (not res!127823) (not e!169521))))

(declare-fun valid!1499 (LongMapFixedSize!3844) Bool)

(assert (=> start!25122 (= res!127823 (valid!1499 thiss!1504))))

(assert (=> start!25122 e!169521))

(declare-fun e!169510 () Bool)

(assert (=> start!25122 e!169510))

(assert (=> start!25122 true))

(assert (=> start!25122 tp_is_empty!6631))

(declare-fun b!261608 () Bool)

(declare-fun e!169508 () Bool)

(assert (=> b!261608 (= e!169508 (is-Undefined!1187 lt!132096))))

(declare-fun c!44550 () Bool)

(declare-fun bm!24976 () Bool)

(declare-fun call!24979 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24976 (= call!24979 (inRange!0 (ite c!44550 (index!6918 lt!132096) (index!6921 lt!132096)) (mask!11168 thiss!1504)))))

(declare-fun b!261609 () Bool)

(declare-fun res!127825 () Bool)

(assert (=> b!261609 (=> (not res!127825) (not e!169521))))

(assert (=> b!261609 (= res!127825 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261610 () Bool)

(declare-fun res!127822 () Bool)

(declare-fun e!169516 () Bool)

(assert (=> b!261610 (=> (not res!127822) (not e!169516))))

(assert (=> b!261610 (= res!127822 call!24979)))

(declare-fun e!169509 () Bool)

(assert (=> b!261610 (= e!169509 e!169516)))

(declare-fun b!261611 () Bool)

(declare-fun res!127820 () Bool)

(assert (=> b!261611 (=> (not res!127820) (not e!169516))))

(assert (=> b!261611 (= res!127820 (= (select (arr!5973 (_keys!7008 thiss!1504)) (index!6918 lt!132096)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261612 () Bool)

(declare-fun e!169512 () Unit!8130)

(declare-fun Unit!8133 () Unit!8130)

(assert (=> b!261612 (= e!169512 Unit!8133)))

(declare-fun lt!132101 () Unit!8130)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!445 (array!12621 array!12619 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 64) Int) Unit!8130)

(assert (=> b!261612 (= lt!132101 (lemmaInListMapThenSeekEntryOrOpenFindsIt!445 (_keys!7008 thiss!1504) (_values!4803 thiss!1504) (mask!11168 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) key!932 (defaultEntry!4820 thiss!1504)))))

(assert (=> b!261612 false))

(declare-fun b!261613 () Bool)

(declare-fun call!24980 () Bool)

(assert (=> b!261613 (= e!169520 (not call!24980))))

(declare-fun b!261614 () Bool)

(declare-fun e!169518 () Bool)

(assert (=> b!261614 (= e!169521 e!169518)))

(declare-fun res!127818 () Bool)

(assert (=> b!261614 (=> (not res!127818) (not e!169518))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!261614 (= res!127818 (or (= lt!132096 (MissingZero!1187 index!297)) (= lt!132096 (MissingVacant!1187 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12621 (_ BitVec 32)) SeekEntryResult!1187)

(assert (=> b!261614 (= lt!132096 (seekEntryOrOpen!0 key!932 (_keys!7008 thiss!1504) (mask!11168 thiss!1504)))))

(declare-fun e!169515 () Bool)

(declare-fun array_inv!3945 (array!12621) Bool)

(declare-fun array_inv!3946 (array!12619) Bool)

(assert (=> b!261615 (= e!169510 (and tp!23638 tp_is_empty!6631 (array_inv!3945 (_keys!7008 thiss!1504)) (array_inv!3946 (_values!4803 thiss!1504)) e!169515))))

(declare-fun b!261616 () Bool)

(declare-fun e!169519 () Bool)

(assert (=> b!261616 (= e!169518 e!169519)))

(declare-fun res!127819 () Bool)

(assert (=> b!261616 (=> (not res!127819) (not e!169519))))

(assert (=> b!261616 (= res!127819 (inRange!0 index!297 (mask!11168 thiss!1504)))))

(declare-fun lt!132097 () Unit!8130)

(assert (=> b!261616 (= lt!132097 e!169512)))

(declare-fun c!44549 () Bool)

(declare-datatypes ((tuple2!4956 0))(
  ( (tuple2!4957 (_1!2489 (_ BitVec 64)) (_2!2489 V!8489)) )
))
(declare-datatypes ((List!3833 0))(
  ( (Nil!3830) (Cons!3829 (h!4495 tuple2!4956) (t!8906 List!3833)) )
))
(declare-datatypes ((ListLongMap!3869 0))(
  ( (ListLongMap!3870 (toList!1950 List!3833)) )
))
(declare-fun lt!132092 () ListLongMap!3869)

(declare-fun contains!1898 (ListLongMap!3869 (_ BitVec 64)) Bool)

(assert (=> b!261616 (= c!44549 (contains!1898 lt!132092 key!932))))

(declare-fun getCurrentListMap!1478 (array!12621 array!12619 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 32) Int) ListLongMap!3869)

(assert (=> b!261616 (= lt!132092 (getCurrentListMap!1478 (_keys!7008 thiss!1504) (_values!4803 thiss!1504) (mask!11168 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4820 thiss!1504)))))

(declare-fun b!261617 () Bool)

(declare-fun mapRes!11305 () Bool)

(assert (=> b!261617 (= e!169515 (and e!169517 mapRes!11305))))

(declare-fun condMapEmpty!11305 () Bool)

(declare-fun mapDefault!11305 () ValueCell!2972)

