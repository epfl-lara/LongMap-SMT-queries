; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19222 () Bool)

(assert start!19222)

(declare-fun b!189103 () Bool)

(declare-fun b_free!4639 () Bool)

(declare-fun b_next!4639 () Bool)

(assert (=> b!189103 (= b_free!4639 (not b_next!4639))))

(declare-fun tp!16747 () Bool)

(declare-fun b_and!11275 () Bool)

(assert (=> b!189103 (= tp!16747 b_and!11275)))

(declare-fun b!189098 () Bool)

(declare-fun e!124451 () Bool)

(declare-fun e!124446 () Bool)

(assert (=> b!189098 (= e!124451 e!124446)))

(declare-fun res!89400 () Bool)

(assert (=> b!189098 (=> (not res!89400) (not e!124446))))

(declare-datatypes ((SeekEntryResult!659 0))(
  ( (MissingZero!659 (index!4806 (_ BitVec 32))) (Found!659 (index!4807 (_ BitVec 32))) (Intermediate!659 (undefined!1471 Bool) (index!4808 (_ BitVec 32)) (x!20399 (_ BitVec 32))) (Undefined!659) (MissingVacant!659 (index!4809 (_ BitVec 32))) )
))
(declare-fun lt!93605 () SeekEntryResult!659)

(assert (=> b!189098 (= res!89400 (and (not (is-Undefined!659 lt!93605)) (not (is-MissingVacant!659 lt!93605)) (not (is-MissingZero!659 lt!93605)) (is-Found!659 lt!93605)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5529 0))(
  ( (V!5530 (val!2250 Int)) )
))
(declare-datatypes ((ValueCell!1862 0))(
  ( (ValueCellFull!1862 (v!4170 V!5529)) (EmptyCell!1862) )
))
(declare-datatypes ((array!8049 0))(
  ( (array!8050 (arr!3795 (Array (_ BitVec 32) (_ BitVec 64))) (size!4115 (_ BitVec 32))) )
))
(declare-datatypes ((array!8051 0))(
  ( (array!8052 (arr!3796 (Array (_ BitVec 32) ValueCell!1862)) (size!4116 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2632 0))(
  ( (LongMapFixedSize!2633 (defaultEntry!3857 Int) (mask!9038 (_ BitVec 32)) (extraKeys!3594 (_ BitVec 32)) (zeroValue!3698 V!5529) (minValue!3698 V!5529) (_size!1365 (_ BitVec 32)) (_keys!5822 array!8049) (_values!3840 array!8051) (_vacant!1365 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2632)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8049 (_ BitVec 32)) SeekEntryResult!659)

(assert (=> b!189098 (= lt!93605 (seekEntryOrOpen!0 key!828 (_keys!5822 thiss!1248) (mask!9038 thiss!1248)))))

(declare-fun b!189099 () Bool)

(declare-datatypes ((Unit!5701 0))(
  ( (Unit!5702) )
))
(declare-fun e!124445 () Unit!5701)

(declare-fun lt!93603 () Unit!5701)

(assert (=> b!189099 (= e!124445 lt!93603)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!160 (array!8049 array!8051 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 64) Int) Unit!5701)

(assert (=> b!189099 (= lt!93603 (lemmaInListMapThenSeekEntryOrOpenFindsIt!160 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) key!828 (defaultEntry!3857 thiss!1248)))))

(declare-fun res!89404 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189099 (= res!89404 (inRange!0 (index!4807 lt!93605) (mask!9038 thiss!1248)))))

(declare-fun e!124447 () Bool)

(assert (=> b!189099 (=> (not res!89404) (not e!124447))))

(assert (=> b!189099 e!124447))

(declare-fun b!189100 () Bool)

(declare-fun e!124444 () Bool)

(assert (=> b!189100 (= e!124446 e!124444)))

(declare-fun res!89401 () Bool)

(assert (=> b!189100 (=> (not res!89401) (not e!124444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189100 (= res!89401 (validMask!0 (mask!9038 thiss!1248)))))

(declare-fun lt!93602 () Unit!5701)

(assert (=> b!189100 (= lt!93602 e!124445)))

(declare-fun c!33989 () Bool)

(declare-datatypes ((tuple2!3502 0))(
  ( (tuple2!3503 (_1!1762 (_ BitVec 64)) (_2!1762 V!5529)) )
))
(declare-datatypes ((List!2401 0))(
  ( (Nil!2398) (Cons!2397 (h!3034 tuple2!3502) (t!7303 List!2401)) )
))
(declare-datatypes ((ListLongMap!2419 0))(
  ( (ListLongMap!2420 (toList!1225 List!2401)) )
))
(declare-fun contains!1331 (ListLongMap!2419 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!873 (array!8049 array!8051 (_ BitVec 32) (_ BitVec 32) V!5529 V!5529 (_ BitVec 32) Int) ListLongMap!2419)

(assert (=> b!189100 (= c!33989 (contains!1331 (getCurrentListMap!873 (_keys!5822 thiss!1248) (_values!3840 thiss!1248) (mask!9038 thiss!1248) (extraKeys!3594 thiss!1248) (zeroValue!3698 thiss!1248) (minValue!3698 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3857 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7609 () Bool)

(declare-fun mapRes!7609 () Bool)

(declare-fun tp!16746 () Bool)

(declare-fun e!124450 () Bool)

(assert (=> mapNonEmpty!7609 (= mapRes!7609 (and tp!16746 e!124450))))

(declare-fun mapValue!7609 () ValueCell!1862)

(declare-fun mapKey!7609 () (_ BitVec 32))

(declare-fun mapRest!7609 () (Array (_ BitVec 32) ValueCell!1862))

(assert (=> mapNonEmpty!7609 (= (arr!3796 (_values!3840 thiss!1248)) (store mapRest!7609 mapKey!7609 mapValue!7609))))

(declare-fun b!189101 () Bool)

(assert (=> b!189101 (= e!124447 (= (select (arr!3795 (_keys!5822 thiss!1248)) (index!4807 lt!93605)) key!828))))

(declare-fun b!189102 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189102 (= e!124444 (not (validKeyInArray!0 key!828)))))

(declare-fun tp_is_empty!4411 () Bool)

(declare-fun e!124448 () Bool)

(declare-fun e!124452 () Bool)

(declare-fun array_inv!2459 (array!8049) Bool)

(declare-fun array_inv!2460 (array!8051) Bool)

(assert (=> b!189103 (= e!124448 (and tp!16747 tp_is_empty!4411 (array_inv!2459 (_keys!5822 thiss!1248)) (array_inv!2460 (_values!3840 thiss!1248)) e!124452))))

(declare-fun b!189104 () Bool)

(declare-fun res!89396 () Bool)

(assert (=> b!189104 (=> (not res!89396) (not e!124444))))

(assert (=> b!189104 (= res!89396 (and (bvsge (index!4807 lt!93605) #b00000000000000000000000000000000) (bvslt (index!4807 lt!93605) (size!4115 (_keys!5822 thiss!1248)))))))

(declare-fun b!189105 () Bool)

(assert (=> b!189105 (= e!124450 tp_is_empty!4411)))

(declare-fun b!189107 () Bool)

(declare-fun e!124443 () Bool)

(assert (=> b!189107 (= e!124443 tp_is_empty!4411)))

(declare-fun b!189108 () Bool)

(declare-fun res!89399 () Bool)

(assert (=> b!189108 (=> (not res!89399) (not e!124444))))

(declare-datatypes ((List!2402 0))(
  ( (Nil!2399) (Cons!2398 (h!3035 (_ BitVec 64)) (t!7304 List!2402)) )
))
(declare-fun arrayNoDuplicates!0 (array!8049 (_ BitVec 32) List!2402) Bool)

(assert (=> b!189108 (= res!89399 (arrayNoDuplicates!0 (_keys!5822 thiss!1248) #b00000000000000000000000000000000 Nil!2399))))

(declare-fun b!189109 () Bool)

(declare-fun res!89398 () Bool)

(assert (=> b!189109 (=> (not res!89398) (not e!124451))))

(assert (=> b!189109 (= res!89398 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189110 () Bool)

(declare-fun res!89397 () Bool)

(assert (=> b!189110 (=> (not res!89397) (not e!124444))))

(assert (=> b!189110 (= res!89397 (and (= (size!4116 (_values!3840 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9038 thiss!1248))) (= (size!4115 (_keys!5822 thiss!1248)) (size!4116 (_values!3840 thiss!1248))) (bvsge (mask!9038 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3594 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3594 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7609 () Bool)

(assert (=> mapIsEmpty!7609 mapRes!7609))

(declare-fun b!189106 () Bool)

(declare-fun res!89403 () Bool)

(assert (=> b!189106 (=> (not res!89403) (not e!124444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8049 (_ BitVec 32)) Bool)

(assert (=> b!189106 (= res!89403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5822 thiss!1248) (mask!9038 thiss!1248)))))

(declare-fun res!89402 () Bool)

(assert (=> start!19222 (=> (not res!89402) (not e!124451))))

(declare-fun valid!1082 (LongMapFixedSize!2632) Bool)

(assert (=> start!19222 (= res!89402 (valid!1082 thiss!1248))))

(assert (=> start!19222 e!124451))

(assert (=> start!19222 e!124448))

(assert (=> start!19222 true))

(declare-fun b!189111 () Bool)

(assert (=> b!189111 (= e!124452 (and e!124443 mapRes!7609))))

(declare-fun condMapEmpty!7609 () Bool)

(declare-fun mapDefault!7609 () ValueCell!1862)

