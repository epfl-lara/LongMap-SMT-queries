; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16656 () Bool)

(assert start!16656)

(declare-fun b!166554 () Bool)

(declare-fun b_free!3961 () Bool)

(declare-fun b_next!3961 () Bool)

(assert (=> b!166554 (= b_free!3961 (not b_next!3961))))

(declare-fun tp!14484 () Bool)

(declare-fun b_and!10375 () Bool)

(assert (=> b!166554 (= tp!14484 b_and!10375)))

(declare-fun b!166551 () Bool)

(declare-datatypes ((Unit!5069 0))(
  ( (Unit!5070) )
))
(declare-fun e!109286 () Unit!5069)

(declare-fun lt!83353 () Unit!5069)

(assert (=> b!166551 (= e!109286 lt!83353)))

(declare-datatypes ((V!4665 0))(
  ( (V!4666 (val!1926 Int)) )
))
(declare-datatypes ((ValueCell!1538 0))(
  ( (ValueCellFull!1538 (v!3791 V!4665)) (EmptyCell!1538) )
))
(declare-datatypes ((array!6623 0))(
  ( (array!6624 (arr!3147 (Array (_ BitVec 32) (_ BitVec 64))) (size!3435 (_ BitVec 32))) )
))
(declare-datatypes ((array!6625 0))(
  ( (array!6626 (arr!3148 (Array (_ BitVec 32) ValueCell!1538)) (size!3436 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1984 0))(
  ( (LongMapFixedSize!1985 (defaultEntry!3434 Int) (mask!8167 (_ BitVec 32)) (extraKeys!3175 (_ BitVec 32)) (zeroValue!3277 V!4665) (minValue!3277 V!4665) (_size!1041 (_ BitVec 32)) (_keys!5259 array!6623) (_values!3417 array!6625) (_vacant!1041 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1984)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!89 (array!6623 array!6625 (_ BitVec 32) (_ BitVec 32) V!4665 V!4665 (_ BitVec 64) Int) Unit!5069)

(assert (=> b!166551 (= lt!83353 (lemmaInListMapThenSeekEntryOrOpenFindsIt!89 (_keys!5259 thiss!1248) (_values!3417 thiss!1248) (mask!8167 thiss!1248) (extraKeys!3175 thiss!1248) (zeroValue!3277 thiss!1248) (minValue!3277 thiss!1248) key!828 (defaultEntry!3434 thiss!1248)))))

(declare-fun res!79162 () Bool)

(declare-datatypes ((SeekEntryResult!459 0))(
  ( (MissingZero!459 (index!4004 (_ BitVec 32))) (Found!459 (index!4005 (_ BitVec 32))) (Intermediate!459 (undefined!1271 Bool) (index!4006 (_ BitVec 32)) (x!18447 (_ BitVec 32))) (Undefined!459) (MissingVacant!459 (index!4007 (_ BitVec 32))) )
))
(declare-fun lt!83351 () SeekEntryResult!459)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166551 (= res!79162 (inRange!0 (index!4005 lt!83351) (mask!8167 thiss!1248)))))

(declare-fun e!109283 () Bool)

(assert (=> b!166551 (=> (not res!79162) (not e!109283))))

(assert (=> b!166551 e!109283))

(declare-fun b!166552 () Bool)

(declare-fun res!79167 () Bool)

(declare-fun e!109285 () Bool)

(assert (=> b!166552 (=> (not res!79167) (not e!109285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6623 (_ BitVec 32)) Bool)

(assert (=> b!166552 (= res!79167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5259 thiss!1248) (mask!8167 thiss!1248)))))

(declare-fun b!166553 () Bool)

(assert (=> b!166553 (= e!109285 false)))

(declare-fun lt!83349 () Bool)

(declare-datatypes ((List!2097 0))(
  ( (Nil!2094) (Cons!2093 (h!2710 (_ BitVec 64)) (t!6899 List!2097)) )
))
(declare-fun arrayNoDuplicates!0 (array!6623 (_ BitVec 32) List!2097) Bool)

(assert (=> b!166553 (= lt!83349 (arrayNoDuplicates!0 (_keys!5259 thiss!1248) #b00000000000000000000000000000000 Nil!2094))))

(declare-fun mapIsEmpty!6363 () Bool)

(declare-fun mapRes!6363 () Bool)

(assert (=> mapIsEmpty!6363 mapRes!6363))

(declare-fun e!109289 () Bool)

(declare-fun tp_is_empty!3763 () Bool)

(declare-fun e!109280 () Bool)

(declare-fun array_inv!2021 (array!6623) Bool)

(declare-fun array_inv!2022 (array!6625) Bool)

(assert (=> b!166554 (= e!109289 (and tp!14484 tp_is_empty!3763 (array_inv!2021 (_keys!5259 thiss!1248)) (array_inv!2022 (_values!3417 thiss!1248)) e!109280))))

(declare-fun b!166555 () Bool)

(declare-fun Unit!5071 () Unit!5069)

(assert (=> b!166555 (= e!109286 Unit!5071)))

(declare-fun lt!83352 () Unit!5069)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!90 (array!6623 array!6625 (_ BitVec 32) (_ BitVec 32) V!4665 V!4665 (_ BitVec 64) Int) Unit!5069)

(assert (=> b!166555 (= lt!83352 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!90 (_keys!5259 thiss!1248) (_values!3417 thiss!1248) (mask!8167 thiss!1248) (extraKeys!3175 thiss!1248) (zeroValue!3277 thiss!1248) (minValue!3277 thiss!1248) key!828 (defaultEntry!3434 thiss!1248)))))

(assert (=> b!166555 false))

(declare-fun b!166556 () Bool)

(declare-fun e!109288 () Bool)

(assert (=> b!166556 (= e!109288 tp_is_empty!3763)))

(declare-fun res!79165 () Bool)

(declare-fun e!109284 () Bool)

(assert (=> start!16656 (=> (not res!79165) (not e!109284))))

(declare-fun valid!871 (LongMapFixedSize!1984) Bool)

(assert (=> start!16656 (= res!79165 (valid!871 thiss!1248))))

(assert (=> start!16656 e!109284))

(assert (=> start!16656 e!109289))

(assert (=> start!16656 true))

(declare-fun b!166557 () Bool)

(assert (=> b!166557 (= e!109283 (= (select (arr!3147 (_keys!5259 thiss!1248)) (index!4005 lt!83351)) key!828))))

(declare-fun b!166558 () Bool)

(declare-fun e!109282 () Bool)

(assert (=> b!166558 (= e!109280 (and e!109282 mapRes!6363))))

(declare-fun condMapEmpty!6363 () Bool)

(declare-fun mapDefault!6363 () ValueCell!1538)

