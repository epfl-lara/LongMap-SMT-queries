; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16680 () Bool)

(assert start!16680)

(declare-fun b!167025 () Bool)

(declare-fun b_free!3985 () Bool)

(declare-fun b_next!3985 () Bool)

(assert (=> b!167025 (= b_free!3985 (not b_next!3985))))

(declare-fun tp!14555 () Bool)

(declare-fun b_and!10399 () Bool)

(assert (=> b!167025 (= tp!14555 b_and!10399)))

(declare-fun b!167019 () Bool)

(declare-fun res!79414 () Bool)

(declare-fun e!109644 () Bool)

(assert (=> b!167019 (=> (not res!79414) (not e!109644))))

(declare-datatypes ((V!4697 0))(
  ( (V!4698 (val!1938 Int)) )
))
(declare-datatypes ((ValueCell!1550 0))(
  ( (ValueCellFull!1550 (v!3803 V!4697)) (EmptyCell!1550) )
))
(declare-datatypes ((array!6671 0))(
  ( (array!6672 (arr!3171 (Array (_ BitVec 32) (_ BitVec 64))) (size!3459 (_ BitVec 32))) )
))
(declare-datatypes ((array!6673 0))(
  ( (array!6674 (arr!3172 (Array (_ BitVec 32) ValueCell!1550)) (size!3460 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2008 0))(
  ( (LongMapFixedSize!2009 (defaultEntry!3446 Int) (mask!8187 (_ BitVec 32)) (extraKeys!3187 (_ BitVec 32)) (zeroValue!3289 V!4697) (minValue!3289 V!4697) (_size!1053 (_ BitVec 32)) (_keys!5271 array!6671) (_values!3429 array!6673) (_vacant!1053 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2008)

(assert (=> b!167019 (= res!79414 (and (= (size!3460 (_values!3429 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8187 thiss!1248))) (= (size!3459 (_keys!5271 thiss!1248)) (size!3460 (_values!3429 thiss!1248))) (bvsge (mask!8187 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3187 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3187 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun b!167020 () Bool)

(declare-datatypes ((SeekEntryResult!469 0))(
  ( (MissingZero!469 (index!4044 (_ BitVec 32))) (Found!469 (index!4045 (_ BitVec 32))) (Intermediate!469 (undefined!1281 Bool) (index!4046 (_ BitVec 32)) (x!18489 (_ BitVec 32))) (Undefined!469) (MissingVacant!469 (index!4047 (_ BitVec 32))) )
))
(declare-fun lt!83531 () SeekEntryResult!469)

(declare-fun e!109646 () Bool)

(assert (=> b!167020 (= e!109646 (= (select (arr!3171 (_keys!5271 thiss!1248)) (index!4045 lt!83531)) key!828))))

(declare-fun b!167021 () Bool)

(declare-fun e!109645 () Bool)

(assert (=> b!167021 (= e!109645 e!109644)))

(declare-fun res!79415 () Bool)

(assert (=> b!167021 (=> (not res!79415) (not e!109644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167021 (= res!79415 (validMask!0 (mask!8187 thiss!1248)))))

(declare-datatypes ((Unit!5098 0))(
  ( (Unit!5099) )
))
(declare-fun lt!83533 () Unit!5098)

(declare-fun e!109648 () Unit!5098)

(assert (=> b!167021 (= lt!83533 e!109648)))

(declare-fun c!30259 () Bool)

(declare-datatypes ((tuple2!3126 0))(
  ( (tuple2!3127 (_1!1574 (_ BitVec 64)) (_2!1574 V!4697)) )
))
(declare-datatypes ((List!2113 0))(
  ( (Nil!2110) (Cons!2109 (h!2726 tuple2!3126) (t!6915 List!2113)) )
))
(declare-datatypes ((ListLongMap!2081 0))(
  ( (ListLongMap!2082 (toList!1056 List!2113)) )
))
(declare-fun contains!1098 (ListLongMap!2081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!714 (array!6671 array!6673 (_ BitVec 32) (_ BitVec 32) V!4697 V!4697 (_ BitVec 32) Int) ListLongMap!2081)

(assert (=> b!167021 (= c!30259 (contains!1098 (getCurrentListMap!714 (_keys!5271 thiss!1248) (_values!3429 thiss!1248) (mask!8187 thiss!1248) (extraKeys!3187 thiss!1248) (zeroValue!3289 thiss!1248) (minValue!3289 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3446 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!6399 () Bool)

(declare-fun mapRes!6399 () Bool)

(assert (=> mapIsEmpty!6399 mapRes!6399))

(declare-fun res!79418 () Bool)

(declare-fun e!109647 () Bool)

(assert (=> start!16680 (=> (not res!79418) (not e!109647))))

(declare-fun valid!879 (LongMapFixedSize!2008) Bool)

(assert (=> start!16680 (= res!79418 (valid!879 thiss!1248))))

(assert (=> start!16680 e!109647))

(declare-fun e!109642 () Bool)

(assert (=> start!16680 e!109642))

(assert (=> start!16680 true))

(declare-fun b!167022 () Bool)

(declare-fun lt!83530 () Unit!5098)

(assert (=> b!167022 (= e!109648 lt!83530)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!97 (array!6671 array!6673 (_ BitVec 32) (_ BitVec 32) V!4697 V!4697 (_ BitVec 64) Int) Unit!5098)

(assert (=> b!167022 (= lt!83530 (lemmaInListMapThenSeekEntryOrOpenFindsIt!97 (_keys!5271 thiss!1248) (_values!3429 thiss!1248) (mask!8187 thiss!1248) (extraKeys!3187 thiss!1248) (zeroValue!3289 thiss!1248) (minValue!3289 thiss!1248) key!828 (defaultEntry!3446 thiss!1248)))))

(declare-fun res!79417 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167022 (= res!79417 (inRange!0 (index!4045 lt!83531) (mask!8187 thiss!1248)))))

(assert (=> b!167022 (=> (not res!79417) (not e!109646))))

(assert (=> b!167022 e!109646))

(declare-fun b!167023 () Bool)

(declare-fun res!79413 () Bool)

(assert (=> b!167023 (=> (not res!79413) (not e!109644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6671 (_ BitVec 32)) Bool)

(assert (=> b!167023 (= res!79413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5271 thiss!1248) (mask!8187 thiss!1248)))))

(declare-fun b!167024 () Bool)

(declare-fun Unit!5100 () Unit!5098)

(assert (=> b!167024 (= e!109648 Unit!5100)))

(declare-fun lt!83532 () Unit!5098)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!99 (array!6671 array!6673 (_ BitVec 32) (_ BitVec 32) V!4697 V!4697 (_ BitVec 64) Int) Unit!5098)

(assert (=> b!167024 (= lt!83532 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!99 (_keys!5271 thiss!1248) (_values!3429 thiss!1248) (mask!8187 thiss!1248) (extraKeys!3187 thiss!1248) (zeroValue!3289 thiss!1248) (minValue!3289 thiss!1248) key!828 (defaultEntry!3446 thiss!1248)))))

(assert (=> b!167024 false))

(declare-fun tp_is_empty!3787 () Bool)

(declare-fun e!109643 () Bool)

(declare-fun array_inv!2037 (array!6671) Bool)

(declare-fun array_inv!2038 (array!6673) Bool)

(assert (=> b!167025 (= e!109642 (and tp!14555 tp_is_empty!3787 (array_inv!2037 (_keys!5271 thiss!1248)) (array_inv!2038 (_values!3429 thiss!1248)) e!109643))))

(declare-fun b!167026 () Bool)

(declare-fun e!109649 () Bool)

(assert (=> b!167026 (= e!109643 (and e!109649 mapRes!6399))))

(declare-fun condMapEmpty!6399 () Bool)

(declare-fun mapDefault!6399 () ValueCell!1550)

