; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89376 () Bool)

(assert start!89376)

(declare-fun b!1024567 () Bool)

(declare-fun b_free!20375 () Bool)

(declare-fun b_next!20375 () Bool)

(assert (=> b!1024567 (= b_free!20375 (not b_next!20375))))

(declare-fun tp!72170 () Bool)

(declare-fun b_and!32621 () Bool)

(assert (=> b!1024567 (= tp!72170 b_and!32621)))

(declare-fun b!1024561 () Bool)

(declare-fun e!577555 () Bool)

(declare-fun tp_is_empty!24095 () Bool)

(assert (=> b!1024561 (= e!577555 tp_is_empty!24095)))

(declare-fun b!1024562 () Bool)

(declare-fun e!577552 () Bool)

(declare-fun e!577551 () Bool)

(assert (=> b!1024562 (= e!577552 (not e!577551))))

(declare-fun res!685978 () Bool)

(assert (=> b!1024562 (=> res!685978 e!577551)))

(declare-datatypes ((V!36999 0))(
  ( (V!37000 (val!12098 Int)) )
))
(declare-datatypes ((ValueCell!11344 0))(
  ( (ValueCellFull!11344 (v!14667 V!36999)) (EmptyCell!11344) )
))
(declare-datatypes ((array!64240 0))(
  ( (array!64241 (arr!30929 (Array (_ BitVec 32) (_ BitVec 64))) (size!31442 (_ BitVec 32))) )
))
(declare-datatypes ((array!64242 0))(
  ( (array!64243 (arr!30930 (Array (_ BitVec 32) ValueCell!11344)) (size!31443 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5282 0))(
  ( (LongMapFixedSize!5283 (defaultEntry!5993 Int) (mask!29645 (_ BitVec 32)) (extraKeys!5725 (_ BitVec 32)) (zeroValue!5829 V!36999) (minValue!5829 V!36999) (_size!2696 (_ BitVec 32)) (_keys!11140 array!64240) (_values!6016 array!64242) (_vacant!2696 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5282)

(assert (=> b!1024562 (= res!685978 (or (bvsge (size!31442 (_keys!11140 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31442 (_keys!11140 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9598 0))(
  ( (MissingZero!9598 (index!40763 (_ BitVec 32))) (Found!9598 (index!40764 (_ BitVec 32))) (Intermediate!9598 (undefined!10410 Bool) (index!40765 (_ BitVec 32)) (x!91092 (_ BitVec 32))) (Undefined!9598) (MissingVacant!9598 (index!40766 (_ BitVec 32))) )
))
(declare-fun lt!450650 () SeekEntryResult!9598)

(declare-fun arrayCountValidKeys!0 (array!64240 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024562 (= (arrayCountValidKeys!0 (array!64241 (store (arr!30929 (_keys!11140 thiss!1427)) (index!40764 lt!450650) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31442 (_keys!11140 thiss!1427))) #b00000000000000000000000000000000 (size!31442 (_keys!11140 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11140 thiss!1427) #b00000000000000000000000000000000 (size!31442 (_keys!11140 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33355 0))(
  ( (Unit!33356) )
))
(declare-fun lt!450649 () Unit!33355)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64240 (_ BitVec 32) (_ BitVec 64)) Unit!33355)

(assert (=> b!1024562 (= lt!450649 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11140 thiss!1427) (index!40764 lt!450650) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024563 () Bool)

(declare-fun res!685979 () Bool)

(declare-fun e!577553 () Bool)

(assert (=> b!1024563 (=> (not res!685979) (not e!577553))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024563 (= res!685979 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024564 () Bool)

(declare-fun e!577557 () Bool)

(declare-fun mapRes!37571 () Bool)

(assert (=> b!1024564 (= e!577557 (and e!577555 mapRes!37571))))

(declare-fun condMapEmpty!37571 () Bool)

(declare-fun mapDefault!37571 () ValueCell!11344)

