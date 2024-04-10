; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18384 () Bool)

(assert start!18384)

(declare-fun b!182343 () Bool)

(declare-fun b_free!4495 () Bool)

(declare-fun b_next!4495 () Bool)

(assert (=> b!182343 (= b_free!4495 (not b_next!4495))))

(declare-fun tp!16244 () Bool)

(declare-fun b_and!11057 () Bool)

(assert (=> b!182343 (= tp!16244 b_and!11057)))

(declare-fun b!182342 () Bool)

(declare-fun e!120072 () Bool)

(declare-fun tp_is_empty!4267 () Bool)

(assert (=> b!182342 (= e!120072 tp_is_empty!4267)))

(declare-fun e!120068 () Bool)

(declare-datatypes ((V!5337 0))(
  ( (V!5338 (val!2178 Int)) )
))
(declare-datatypes ((ValueCell!1790 0))(
  ( (ValueCellFull!1790 (v!4077 V!5337)) (EmptyCell!1790) )
))
(declare-datatypes ((array!7719 0))(
  ( (array!7720 (arr!3651 (Array (_ BitVec 32) (_ BitVec 64))) (size!3963 (_ BitVec 32))) )
))
(declare-datatypes ((array!7721 0))(
  ( (array!7722 (arr!3652 (Array (_ BitVec 32) ValueCell!1790)) (size!3964 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2488 0))(
  ( (LongMapFixedSize!2489 (defaultEntry!3730 Int) (mask!8771 (_ BitVec 32)) (extraKeys!3467 (_ BitVec 32)) (zeroValue!3571 V!5337) (minValue!3571 V!5337) (_size!1293 (_ BitVec 32)) (_keys!5641 array!7719) (_values!3713 array!7721) (_vacant!1293 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2488)

(declare-fun e!120071 () Bool)

(declare-fun array_inv!2353 (array!7719) Bool)

(declare-fun array_inv!2354 (array!7721) Bool)

(assert (=> b!182343 (= e!120071 (and tp!16244 tp_is_empty!4267 (array_inv!2353 (_keys!5641 thiss!1248)) (array_inv!2354 (_values!3713 thiss!1248)) e!120068))))

(declare-fun b!182344 () Bool)

(declare-fun res!86295 () Bool)

(declare-fun e!120070 () Bool)

(assert (=> b!182344 (=> (not res!86295) (not e!120070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182344 (= res!86295 (validMask!0 (mask!8771 thiss!1248)))))

(declare-fun b!182345 () Bool)

(declare-fun res!86293 () Bool)

(declare-fun e!120074 () Bool)

(assert (=> b!182345 (=> (not res!86293) (not e!120074))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!182345 (= res!86293 (not (= key!828 (bvneg key!828))))))

(declare-fun b!182346 () Bool)

(declare-fun e!120073 () Bool)

(assert (=> b!182346 (= e!120073 tp_is_empty!4267)))

(declare-fun b!182347 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7719 (_ BitVec 32)) Bool)

(assert (=> b!182347 (= e!120070 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5641 thiss!1248) (mask!8771 thiss!1248))))))

(declare-fun b!182348 () Bool)

(assert (=> b!182348 (= e!120074 e!120070)))

(declare-fun res!86291 () Bool)

(assert (=> b!182348 (=> (not res!86291) (not e!120070))))

(declare-datatypes ((SeekEntryResult!604 0))(
  ( (MissingZero!604 (index!4586 (_ BitVec 32))) (Found!604 (index!4587 (_ BitVec 32))) (Intermediate!604 (undefined!1416 Bool) (index!4588 (_ BitVec 32)) (x!19878 (_ BitVec 32))) (Undefined!604) (MissingVacant!604 (index!4589 (_ BitVec 32))) )
))
(declare-fun lt!90190 () SeekEntryResult!604)

(assert (=> b!182348 (= res!86291 (and (not (is-Undefined!604 lt!90190)) (not (is-MissingVacant!604 lt!90190)) (not (is-MissingZero!604 lt!90190)) (is-Found!604 lt!90190)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7719 (_ BitVec 32)) SeekEntryResult!604)

(assert (=> b!182348 (= lt!90190 (seekEntryOrOpen!0 key!828 (_keys!5641 thiss!1248) (mask!8771 thiss!1248)))))

(declare-fun mapIsEmpty!7322 () Bool)

(declare-fun mapRes!7322 () Bool)

(assert (=> mapIsEmpty!7322 mapRes!7322))

(declare-fun b!182349 () Bool)

(declare-fun res!86292 () Bool)

(assert (=> b!182349 (=> (not res!86292) (not e!120070))))

(assert (=> b!182349 (= res!86292 (and (= (size!3964 (_values!3713 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8771 thiss!1248))) (= (size!3963 (_keys!5641 thiss!1248)) (size!3964 (_values!3713 thiss!1248))) (bvsge (mask!8771 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3467 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3467 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!86294 () Bool)

(assert (=> start!18384 (=> (not res!86294) (not e!120074))))

(declare-fun valid!1030 (LongMapFixedSize!2488) Bool)

(assert (=> start!18384 (= res!86294 (valid!1030 thiss!1248))))

(assert (=> start!18384 e!120074))

(assert (=> start!18384 e!120071))

(assert (=> start!18384 true))

(declare-fun b!182350 () Bool)

(assert (=> b!182350 (= e!120068 (and e!120072 mapRes!7322))))

(declare-fun condMapEmpty!7322 () Bool)

(declare-fun mapDefault!7322 () ValueCell!1790)

