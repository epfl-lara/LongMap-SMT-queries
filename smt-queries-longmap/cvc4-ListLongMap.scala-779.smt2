; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18440 () Bool)

(assert start!18440)

(declare-fun b!182970 () Bool)

(declare-fun b_free!4517 () Bool)

(declare-fun b_next!4517 () Bool)

(assert (=> b!182970 (= b_free!4517 (not b_next!4517))))

(declare-fun tp!16316 () Bool)

(declare-fun b_and!11083 () Bool)

(assert (=> b!182970 (= tp!16316 b_and!11083)))

(declare-fun b!182963 () Bool)

(declare-fun res!86621 () Bool)

(declare-fun e!120459 () Bool)

(assert (=> b!182963 (=> (not res!86621) (not e!120459))))

(declare-datatypes ((V!5365 0))(
  ( (V!5366 (val!2189 Int)) )
))
(declare-datatypes ((ValueCell!1801 0))(
  ( (ValueCellFull!1801 (v!4090 V!5365)) (EmptyCell!1801) )
))
(declare-datatypes ((array!7767 0))(
  ( (array!7768 (arr!3673 (Array (_ BitVec 32) (_ BitVec 64))) (size!3985 (_ BitVec 32))) )
))
(declare-datatypes ((array!7769 0))(
  ( (array!7770 (arr!3674 (Array (_ BitVec 32) ValueCell!1801)) (size!3986 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2510 0))(
  ( (LongMapFixedSize!2511 (defaultEntry!3743 Int) (mask!8796 (_ BitVec 32)) (extraKeys!3480 (_ BitVec 32)) (zeroValue!3584 V!5365) (minValue!3584 V!5365) (_size!1304 (_ BitVec 32)) (_keys!5658 array!7767) (_values!3726 array!7769) (_vacant!1304 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2510)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3412 0))(
  ( (tuple2!3413 (_1!1717 (_ BitVec 64)) (_2!1717 V!5365)) )
))
(declare-datatypes ((List!2331 0))(
  ( (Nil!2328) (Cons!2327 (h!2956 tuple2!3412) (t!7195 List!2331)) )
))
(declare-datatypes ((ListLongMap!2329 0))(
  ( (ListLongMap!2330 (toList!1180 List!2331)) )
))
(declare-fun contains!1265 (ListLongMap!2329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!828 (array!7767 array!7769 (_ BitVec 32) (_ BitVec 32) V!5365 V!5365 (_ BitVec 32) Int) ListLongMap!2329)

(assert (=> b!182963 (= res!86621 (contains!1265 (getCurrentListMap!828 (_keys!5658 thiss!1248) (_values!3726 thiss!1248) (mask!8796 thiss!1248) (extraKeys!3480 thiss!1248) (zeroValue!3584 thiss!1248) (minValue!3584 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3743 thiss!1248)) key!828))))

(declare-fun b!182964 () Bool)

(declare-fun res!86624 () Bool)

(assert (=> b!182964 (=> (not res!86624) (not e!120459))))

(assert (=> b!182964 (= res!86624 (and (= (size!3986 (_values!3726 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8796 thiss!1248))) (= (size!3985 (_keys!5658 thiss!1248)) (size!3986 (_values!3726 thiss!1248))) (bvsge (mask!8796 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3480 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3480 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!182965 () Bool)

(declare-fun res!86623 () Bool)

(assert (=> b!182965 (=> (not res!86623) (not e!120459))))

(declare-datatypes ((List!2332 0))(
  ( (Nil!2329) (Cons!2328 (h!2957 (_ BitVec 64)) (t!7196 List!2332)) )
))
(declare-fun arrayNoDuplicates!0 (array!7767 (_ BitVec 32) List!2332) Bool)

(assert (=> b!182965 (= res!86623 (arrayNoDuplicates!0 (_keys!5658 thiss!1248) #b00000000000000000000000000000000 Nil!2329))))

(declare-fun b!182966 () Bool)

(declare-fun res!86627 () Bool)

(assert (=> b!182966 (=> (not res!86627) (not e!120459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7767 (_ BitVec 32)) Bool)

(assert (=> b!182966 (= res!86627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5658 thiss!1248) (mask!8796 thiss!1248)))))

(declare-fun b!182967 () Bool)

(declare-fun e!120461 () Bool)

(declare-fun tp_is_empty!4289 () Bool)

(assert (=> b!182967 (= e!120461 tp_is_empty!4289)))

(declare-fun res!86622 () Bool)

(declare-fun e!120457 () Bool)

(assert (=> start!18440 (=> (not res!86622) (not e!120457))))

(declare-fun valid!1040 (LongMapFixedSize!2510) Bool)

(assert (=> start!18440 (= res!86622 (valid!1040 thiss!1248))))

(assert (=> start!18440 e!120457))

(declare-fun e!120460 () Bool)

(assert (=> start!18440 e!120460))

(assert (=> start!18440 true))

(declare-fun b!182968 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182968 (= e!120459 (not (validKeyInArray!0 key!828)))))

(declare-fun b!182969 () Bool)

(assert (=> b!182969 (= e!120457 e!120459)))

(declare-fun res!86628 () Bool)

(assert (=> b!182969 (=> (not res!86628) (not e!120459))))

(declare-datatypes ((SeekEntryResult!615 0))(
  ( (MissingZero!615 (index!4630 (_ BitVec 32))) (Found!615 (index!4631 (_ BitVec 32))) (Intermediate!615 (undefined!1427 Bool) (index!4632 (_ BitVec 32)) (x!19933 (_ BitVec 32))) (Undefined!615) (MissingVacant!615 (index!4633 (_ BitVec 32))) )
))
(declare-fun lt!90424 () SeekEntryResult!615)

(assert (=> b!182969 (= res!86628 (and (not (is-Undefined!615 lt!90424)) (not (is-MissingVacant!615 lt!90424)) (not (is-MissingZero!615 lt!90424)) (is-Found!615 lt!90424)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7767 (_ BitVec 32)) SeekEntryResult!615)

(assert (=> b!182969 (= lt!90424 (seekEntryOrOpen!0 key!828 (_keys!5658 thiss!1248) (mask!8796 thiss!1248)))))

(declare-fun e!120458 () Bool)

(declare-fun array_inv!2375 (array!7767) Bool)

(declare-fun array_inv!2376 (array!7769) Bool)

(assert (=> b!182970 (= e!120460 (and tp!16316 tp_is_empty!4289 (array_inv!2375 (_keys!5658 thiss!1248)) (array_inv!2376 (_values!3726 thiss!1248)) e!120458))))

(declare-fun mapNonEmpty!7361 () Bool)

(declare-fun mapRes!7361 () Bool)

(declare-fun tp!16315 () Bool)

(declare-fun e!120455 () Bool)

(assert (=> mapNonEmpty!7361 (= mapRes!7361 (and tp!16315 e!120455))))

(declare-fun mapKey!7361 () (_ BitVec 32))

(declare-fun mapRest!7361 () (Array (_ BitVec 32) ValueCell!1801))

(declare-fun mapValue!7361 () ValueCell!1801)

(assert (=> mapNonEmpty!7361 (= (arr!3674 (_values!3726 thiss!1248)) (store mapRest!7361 mapKey!7361 mapValue!7361))))

(declare-fun mapIsEmpty!7361 () Bool)

(assert (=> mapIsEmpty!7361 mapRes!7361))

(declare-fun b!182971 () Bool)

(assert (=> b!182971 (= e!120458 (and e!120461 mapRes!7361))))

(declare-fun condMapEmpty!7361 () Bool)

(declare-fun mapDefault!7361 () ValueCell!1801)

