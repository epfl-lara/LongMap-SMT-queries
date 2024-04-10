; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16654 () Bool)

(assert start!16654)

(declare-fun b!166517 () Bool)

(declare-fun b_free!3959 () Bool)

(declare-fun b_next!3959 () Bool)

(assert (=> b!166517 (= b_free!3959 (not b_next!3959))))

(declare-fun tp!14478 () Bool)

(declare-fun b_and!10373 () Bool)

(assert (=> b!166517 (= tp!14478 b_and!10373)))

(declare-fun b!166512 () Bool)

(declare-fun e!109252 () Bool)

(declare-fun e!109253 () Bool)

(assert (=> b!166512 (= e!109252 e!109253)))

(declare-fun res!79143 () Bool)

(assert (=> b!166512 (=> (not res!79143) (not e!109253))))

(declare-datatypes ((V!4661 0))(
  ( (V!4662 (val!1925 Int)) )
))
(declare-datatypes ((ValueCell!1537 0))(
  ( (ValueCellFull!1537 (v!3790 V!4661)) (EmptyCell!1537) )
))
(declare-datatypes ((array!6619 0))(
  ( (array!6620 (arr!3145 (Array (_ BitVec 32) (_ BitVec 64))) (size!3433 (_ BitVec 32))) )
))
(declare-datatypes ((array!6621 0))(
  ( (array!6622 (arr!3146 (Array (_ BitVec 32) ValueCell!1537)) (size!3434 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1982 0))(
  ( (LongMapFixedSize!1983 (defaultEntry!3433 Int) (mask!8164 (_ BitVec 32)) (extraKeys!3174 (_ BitVec 32)) (zeroValue!3276 V!4661) (minValue!3276 V!4661) (_size!1040 (_ BitVec 32)) (_keys!5258 array!6619) (_values!3416 array!6621) (_vacant!1040 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1982)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166512 (= res!79143 (validMask!0 (mask!8164 thiss!1248)))))

(declare-datatypes ((Unit!5066 0))(
  ( (Unit!5067) )
))
(declare-fun lt!83337 () Unit!5066)

(declare-fun e!109254 () Unit!5066)

(assert (=> b!166512 (= lt!83337 e!109254)))

(declare-fun c!30220 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3108 0))(
  ( (tuple2!3109 (_1!1565 (_ BitVec 64)) (_2!1565 V!4661)) )
))
(declare-datatypes ((List!2095 0))(
  ( (Nil!2092) (Cons!2091 (h!2708 tuple2!3108) (t!6897 List!2095)) )
))
(declare-datatypes ((ListLongMap!2063 0))(
  ( (ListLongMap!2064 (toList!1047 List!2095)) )
))
(declare-fun contains!1089 (ListLongMap!2063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!705 (array!6619 array!6621 (_ BitVec 32) (_ BitVec 32) V!4661 V!4661 (_ BitVec 32) Int) ListLongMap!2063)

(assert (=> b!166512 (= c!30220 (contains!1089 (getCurrentListMap!705 (_keys!5258 thiss!1248) (_values!3416 thiss!1248) (mask!8164 thiss!1248) (extraKeys!3174 thiss!1248) (zeroValue!3276 thiss!1248) (minValue!3276 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3433 thiss!1248)) key!828))))

(declare-fun b!166513 () Bool)

(declare-fun Unit!5068 () Unit!5066)

(assert (=> b!166513 (= e!109254 Unit!5068)))

(declare-fun lt!83334 () Unit!5066)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!89 (array!6619 array!6621 (_ BitVec 32) (_ BitVec 32) V!4661 V!4661 (_ BitVec 64) Int) Unit!5066)

(assert (=> b!166513 (= lt!83334 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!89 (_keys!5258 thiss!1248) (_values!3416 thiss!1248) (mask!8164 thiss!1248) (extraKeys!3174 thiss!1248) (zeroValue!3276 thiss!1248) (minValue!3276 thiss!1248) key!828 (defaultEntry!3433 thiss!1248)))))

(assert (=> b!166513 false))

(declare-fun b!166514 () Bool)

(declare-fun e!109258 () Bool)

(declare-fun tp_is_empty!3761 () Bool)

(assert (=> b!166514 (= e!109258 tp_is_empty!3761)))

(declare-fun e!109259 () Bool)

(declare-fun b!166515 () Bool)

(declare-datatypes ((SeekEntryResult!458 0))(
  ( (MissingZero!458 (index!4000 (_ BitVec 32))) (Found!458 (index!4001 (_ BitVec 32))) (Intermediate!458 (undefined!1270 Bool) (index!4002 (_ BitVec 32)) (x!18438 (_ BitVec 32))) (Undefined!458) (MissingVacant!458 (index!4003 (_ BitVec 32))) )
))
(declare-fun lt!83336 () SeekEntryResult!458)

(assert (=> b!166515 (= e!109259 (= (select (arr!3145 (_keys!5258 thiss!1248)) (index!4001 lt!83336)) key!828))))

(declare-fun b!166516 () Bool)

(assert (=> b!166516 (= e!109253 false)))

(declare-fun lt!83338 () Bool)

(declare-datatypes ((List!2096 0))(
  ( (Nil!2093) (Cons!2092 (h!2709 (_ BitVec 64)) (t!6898 List!2096)) )
))
(declare-fun arrayNoDuplicates!0 (array!6619 (_ BitVec 32) List!2096) Bool)

(assert (=> b!166516 (= lt!83338 (arrayNoDuplicates!0 (_keys!5258 thiss!1248) #b00000000000000000000000000000000 Nil!2093))))

(declare-fun e!109257 () Bool)

(declare-fun e!109250 () Bool)

(declare-fun array_inv!2019 (array!6619) Bool)

(declare-fun array_inv!2020 (array!6621) Bool)

(assert (=> b!166517 (= e!109250 (and tp!14478 tp_is_empty!3761 (array_inv!2019 (_keys!5258 thiss!1248)) (array_inv!2020 (_values!3416 thiss!1248)) e!109257))))

(declare-fun b!166518 () Bool)

(declare-fun e!109251 () Bool)

(assert (=> b!166518 (= e!109251 tp_is_empty!3761)))

(declare-fun b!166519 () Bool)

(declare-fun res!79141 () Bool)

(declare-fun e!109255 () Bool)

(assert (=> b!166519 (=> (not res!79141) (not e!109255))))

(assert (=> b!166519 (= res!79141 (not (= key!828 (bvneg key!828))))))

(declare-fun res!79145 () Bool)

(assert (=> start!16654 (=> (not res!79145) (not e!109255))))

(declare-fun valid!870 (LongMapFixedSize!1982) Bool)

(assert (=> start!16654 (= res!79145 (valid!870 thiss!1248))))

(assert (=> start!16654 e!109255))

(assert (=> start!16654 e!109250))

(assert (=> start!16654 true))

(declare-fun b!166520 () Bool)

(assert (=> b!166520 (= e!109255 e!109252)))

(declare-fun res!79142 () Bool)

(assert (=> b!166520 (=> (not res!79142) (not e!109252))))

(assert (=> b!166520 (= res!79142 (and (not (is-Undefined!458 lt!83336)) (not (is-MissingVacant!458 lt!83336)) (not (is-MissingZero!458 lt!83336)) (is-Found!458 lt!83336)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6619 (_ BitVec 32)) SeekEntryResult!458)

(assert (=> b!166520 (= lt!83336 (seekEntryOrOpen!0 key!828 (_keys!5258 thiss!1248) (mask!8164 thiss!1248)))))

(declare-fun mapNonEmpty!6360 () Bool)

(declare-fun mapRes!6360 () Bool)

(declare-fun tp!14477 () Bool)

(assert (=> mapNonEmpty!6360 (= mapRes!6360 (and tp!14477 e!109258))))

(declare-fun mapValue!6360 () ValueCell!1537)

(declare-fun mapKey!6360 () (_ BitVec 32))

(declare-fun mapRest!6360 () (Array (_ BitVec 32) ValueCell!1537))

(assert (=> mapNonEmpty!6360 (= (arr!3146 (_values!3416 thiss!1248)) (store mapRest!6360 mapKey!6360 mapValue!6360))))

(declare-fun b!166521 () Bool)

(declare-fun res!79146 () Bool)

(assert (=> b!166521 (=> (not res!79146) (not e!109253))))

(assert (=> b!166521 (= res!79146 (and (= (size!3434 (_values!3416 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8164 thiss!1248))) (= (size!3433 (_keys!5258 thiss!1248)) (size!3434 (_values!3416 thiss!1248))) (bvsge (mask!8164 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3174 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3174 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166522 () Bool)

(assert (=> b!166522 (= e!109257 (and e!109251 mapRes!6360))))

(declare-fun condMapEmpty!6360 () Bool)

(declare-fun mapDefault!6360 () ValueCell!1537)

