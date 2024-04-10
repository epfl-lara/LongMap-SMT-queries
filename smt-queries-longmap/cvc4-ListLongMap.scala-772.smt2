; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18200 () Bool)

(assert start!18200)

(declare-fun b!181054 () Bool)

(declare-fun b_free!4475 () Bool)

(declare-fun b_next!4475 () Bool)

(assert (=> b!181054 (= b_free!4475 (not b_next!4475))))

(declare-fun tp!16168 () Bool)

(declare-fun b_and!11017 () Bool)

(assert (=> b!181054 (= tp!16168 b_and!11017)))

(declare-fun b!181046 () Bool)

(declare-fun res!85736 () Bool)

(declare-fun e!119263 () Bool)

(assert (=> b!181046 (=> (not res!85736) (not e!119263))))

(declare-datatypes ((V!5309 0))(
  ( (V!5310 (val!2168 Int)) )
))
(declare-datatypes ((ValueCell!1780 0))(
  ( (ValueCellFull!1780 (v!4063 V!5309)) (EmptyCell!1780) )
))
(declare-datatypes ((array!7671 0))(
  ( (array!7672 (arr!3631 (Array (_ BitVec 32) (_ BitVec 64))) (size!3940 (_ BitVec 32))) )
))
(declare-datatypes ((array!7673 0))(
  ( (array!7674 (arr!3632 (Array (_ BitVec 32) ValueCell!1780)) (size!3941 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2468 0))(
  ( (LongMapFixedSize!2469 (defaultEntry!3713 Int) (mask!8726 (_ BitVec 32)) (extraKeys!3450 (_ BitVec 32)) (zeroValue!3554 V!5309) (minValue!3554 V!5309) (_size!1283 (_ BitVec 32)) (_keys!5611 array!7671) (_values!3696 array!7673) (_vacant!1283 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2468)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3382 0))(
  ( (tuple2!3383 (_1!1702 (_ BitVec 64)) (_2!1702 V!5309)) )
))
(declare-datatypes ((List!2304 0))(
  ( (Nil!2301) (Cons!2300 (h!2926 tuple2!3382) (t!7156 List!2304)) )
))
(declare-datatypes ((ListLongMap!2299 0))(
  ( (ListLongMap!2300 (toList!1165 List!2304)) )
))
(declare-fun contains!1243 (ListLongMap!2299 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!813 (array!7671 array!7673 (_ BitVec 32) (_ BitVec 32) V!5309 V!5309 (_ BitVec 32) Int) ListLongMap!2299)

(assert (=> b!181046 (= res!85736 (contains!1243 (getCurrentListMap!813 (_keys!5611 thiss!1248) (_values!3696 thiss!1248) (mask!8726 thiss!1248) (extraKeys!3450 thiss!1248) (zeroValue!3554 thiss!1248) (minValue!3554 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3713 thiss!1248)) key!828))))

(declare-fun b!181047 () Bool)

(declare-fun res!85734 () Bool)

(assert (=> b!181047 (=> (not res!85734) (not e!119263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181047 (= res!85734 (validMask!0 (mask!8726 thiss!1248)))))

(declare-fun b!181048 () Bool)

(declare-fun e!119260 () Bool)

(assert (=> b!181048 (= e!119260 e!119263)))

(declare-fun res!85735 () Bool)

(assert (=> b!181048 (=> (not res!85735) (not e!119263))))

(declare-datatypes ((SeekEntryResult!599 0))(
  ( (MissingZero!599 (index!4566 (_ BitVec 32))) (Found!599 (index!4567 (_ BitVec 32))) (Intermediate!599 (undefined!1411 Bool) (index!4568 (_ BitVec 32)) (x!19777 (_ BitVec 32))) (Undefined!599) (MissingVacant!599 (index!4569 (_ BitVec 32))) )
))
(declare-fun lt!89482 () SeekEntryResult!599)

(assert (=> b!181048 (= res!85735 (and (not (is-Undefined!599 lt!89482)) (not (is-MissingVacant!599 lt!89482)) (not (is-MissingZero!599 lt!89482)) (is-Found!599 lt!89482)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7671 (_ BitVec 32)) SeekEntryResult!599)

(assert (=> b!181048 (= lt!89482 (seekEntryOrOpen!0 key!828 (_keys!5611 thiss!1248) (mask!8726 thiss!1248)))))

(declare-fun b!181049 () Bool)

(declare-fun e!119259 () Bool)

(declare-fun e!119261 () Bool)

(declare-fun mapRes!7277 () Bool)

(assert (=> b!181049 (= e!119259 (and e!119261 mapRes!7277))))

(declare-fun condMapEmpty!7277 () Bool)

(declare-fun mapDefault!7277 () ValueCell!1780)

