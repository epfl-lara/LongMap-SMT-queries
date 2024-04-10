; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22148 () Bool)

(assert start!22148)

(declare-fun b!231122 () Bool)

(declare-fun b_free!6215 () Bool)

(declare-fun b_next!6215 () Bool)

(assert (=> b!231122 (= b_free!6215 (not b_next!6215))))

(declare-fun tp!21786 () Bool)

(declare-fun b_and!13113 () Bool)

(assert (=> b!231122 (= tp!21786 b_and!13113)))

(declare-fun b!231120 () Bool)

(declare-datatypes ((Unit!7100 0))(
  ( (Unit!7101) )
))
(declare-fun e!150031 () Unit!7100)

(declare-fun lt!116456 () Unit!7100)

(assert (=> b!231120 (= e!150031 lt!116456)))

(declare-datatypes ((V!7749 0))(
  ( (V!7750 (val!3083 Int)) )
))
(declare-datatypes ((ValueCell!2695 0))(
  ( (ValueCellFull!2695 (v!5103 V!7749)) (EmptyCell!2695) )
))
(declare-datatypes ((array!11397 0))(
  ( (array!11398 (arr!5418 (Array (_ BitVec 32) ValueCell!2695)) (size!5751 (_ BitVec 32))) )
))
(declare-datatypes ((array!11399 0))(
  ( (array!11400 (arr!5419 (Array (_ BitVec 32) (_ BitVec 64))) (size!5752 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3290 0))(
  ( (LongMapFixedSize!3291 (defaultEntry!4304 Int) (mask!10202 (_ BitVec 32)) (extraKeys!4041 (_ BitVec 32)) (zeroValue!4145 V!7749) (minValue!4145 V!7749) (_size!1694 (_ BitVec 32)) (_keys!6358 array!11399) (_values!4287 array!11397) (_vacant!1694 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3290)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!315 (array!11399 array!11397 (_ BitVec 32) (_ BitVec 32) V!7749 V!7749 (_ BitVec 64) Int) Unit!7100)

(assert (=> b!231120 (= lt!116456 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!315 (_keys!6358 thiss!1504) (_values!4287 thiss!1504) (mask!10202 thiss!1504) (extraKeys!4041 thiss!1504) (zeroValue!4145 thiss!1504) (minValue!4145 thiss!1504) key!932 (defaultEntry!4304 thiss!1504)))))

(declare-fun c!38386 () Bool)

(declare-datatypes ((SeekEntryResult!947 0))(
  ( (MissingZero!947 (index!5958 (_ BitVec 32))) (Found!947 (index!5959 (_ BitVec 32))) (Intermediate!947 (undefined!1759 Bool) (index!5960 (_ BitVec 32)) (x!23479 (_ BitVec 32))) (Undefined!947) (MissingVacant!947 (index!5961 (_ BitVec 32))) )
))
(declare-fun lt!116443 () SeekEntryResult!947)

(assert (=> b!231120 (= c!38386 (is-MissingZero!947 lt!116443))))

(declare-fun e!150030 () Bool)

(assert (=> b!231120 e!150030))

(declare-fun b!231121 () Bool)

(declare-fun e!150027 () Unit!7100)

(declare-fun Unit!7102 () Unit!7100)

(assert (=> b!231121 (= e!150027 Unit!7102)))

(declare-fun e!150024 () Bool)

(declare-fun e!150022 () Bool)

(declare-fun tp_is_empty!6077 () Bool)

(declare-fun array_inv!3573 (array!11399) Bool)

(declare-fun array_inv!3574 (array!11397) Bool)

(assert (=> b!231122 (= e!150022 (and tp!21786 tp_is_empty!6077 (array_inv!3573 (_keys!6358 thiss!1504)) (array_inv!3574 (_values!4287 thiss!1504)) e!150024))))

(declare-fun b!231123 () Bool)

(declare-fun res!113617 () Bool)

(declare-fun e!150023 () Bool)

(assert (=> b!231123 (=> (not res!113617) (not e!150023))))

(assert (=> b!231123 (= res!113617 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231124 () Bool)

(declare-fun c!38388 () Bool)

(assert (=> b!231124 (= c!38388 (is-MissingVacant!947 lt!116443))))

(declare-fun e!150028 () Bool)

(assert (=> b!231124 (= e!150030 e!150028)))

(declare-fun b!231125 () Bool)

(declare-fun e!150020 () Bool)

(declare-fun mapRes!10285 () Bool)

(assert (=> b!231125 (= e!150024 (and e!150020 mapRes!10285))))

(declare-fun condMapEmpty!10285 () Bool)

(declare-fun mapDefault!10285 () ValueCell!2695)

