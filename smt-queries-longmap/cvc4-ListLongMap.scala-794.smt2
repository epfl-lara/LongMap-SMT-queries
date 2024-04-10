; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18976 () Bool)

(assert start!18976)

(declare-fun b!187149 () Bool)

(declare-fun b_free!4607 () Bool)

(declare-fun b_next!4607 () Bool)

(assert (=> b!187149 (= b_free!4607 (not b_next!4607))))

(declare-fun tp!16630 () Bool)

(declare-fun b_and!11223 () Bool)

(assert (=> b!187149 (= tp!16630 b_and!11223)))

(declare-fun b!187144 () Bool)

(declare-datatypes ((Unit!5639 0))(
  ( (Unit!5640) )
))
(declare-fun e!123171 () Unit!5639)

(declare-fun Unit!5641 () Unit!5639)

(assert (=> b!187144 (= e!123171 Unit!5641)))

(declare-fun lt!92557 () Unit!5639)

(declare-datatypes ((V!5485 0))(
  ( (V!5486 (val!2234 Int)) )
))
(declare-datatypes ((ValueCell!1846 0))(
  ( (ValueCellFull!1846 (v!4148 V!5485)) (EmptyCell!1846) )
))
(declare-datatypes ((array!7973 0))(
  ( (array!7974 (arr!3763 (Array (_ BitVec 32) (_ BitVec 64))) (size!4081 (_ BitVec 32))) )
))
(declare-datatypes ((array!7975 0))(
  ( (array!7976 (arr!3764 (Array (_ BitVec 32) ValueCell!1846)) (size!4082 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2600 0))(
  ( (LongMapFixedSize!2601 (defaultEntry!3817 Int) (mask!8957 (_ BitVec 32)) (extraKeys!3554 (_ BitVec 32)) (zeroValue!3658 V!5485) (minValue!3658 V!5485) (_size!1349 (_ BitVec 32)) (_keys!5767 array!7973) (_values!3800 array!7975) (_vacant!1349 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2600)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!152 (array!7973 array!7975 (_ BitVec 32) (_ BitVec 32) V!5485 V!5485 (_ BitVec 64) Int) Unit!5639)

(assert (=> b!187144 (= lt!92557 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!152 (_keys!5767 thiss!1248) (_values!3800 thiss!1248) (mask!8957 thiss!1248) (extraKeys!3554 thiss!1248) (zeroValue!3658 thiss!1248) (minValue!3658 thiss!1248) key!828 (defaultEntry!3817 thiss!1248)))))

(assert (=> b!187144 false))

(declare-fun mapIsEmpty!7541 () Bool)

(declare-fun mapRes!7541 () Bool)

(assert (=> mapIsEmpty!7541 mapRes!7541))

(declare-fun b!187145 () Bool)

(declare-fun res!88502 () Bool)

(declare-fun e!123175 () Bool)

(assert (=> b!187145 (=> (not res!88502) (not e!123175))))

(assert (=> b!187145 (= res!88502 (not (= key!828 (bvneg key!828))))))

(declare-fun b!187146 () Bool)

(declare-fun e!123170 () Bool)

(declare-fun e!123173 () Bool)

(assert (=> b!187146 (= e!123170 (and e!123173 mapRes!7541))))

(declare-fun condMapEmpty!7541 () Bool)

(declare-fun mapDefault!7541 () ValueCell!1846)

