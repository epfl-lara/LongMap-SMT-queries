; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21652 () Bool)

(assert start!21652)

(declare-fun b!217233 () Bool)

(declare-fun b_free!5801 () Bool)

(declare-fun b_next!5801 () Bool)

(assert (=> b!217233 (= b_free!5801 (not b_next!5801))))

(declare-fun tp!20538 () Bool)

(declare-fun b_and!12691 () Bool)

(assert (=> b!217233 (= tp!20538 b_and!12691)))

(declare-fun b!217228 () Bool)

(declare-fun e!141324 () Bool)

(declare-fun tp_is_empty!5663 () Bool)

(assert (=> b!217228 (= e!141324 tp_is_empty!5663)))

(declare-fun b!217229 () Bool)

(declare-fun res!106340 () Bool)

(declare-fun e!141319 () Bool)

(assert (=> b!217229 (=> (not res!106340) (not e!141319))))

(declare-datatypes ((V!7197 0))(
  ( (V!7198 (val!2876 Int)) )
))
(declare-datatypes ((ValueCell!2488 0))(
  ( (ValueCellFull!2488 (v!4894 V!7197)) (EmptyCell!2488) )
))
(declare-datatypes ((array!10565 0))(
  ( (array!10566 (arr!5004 (Array (_ BitVec 32) ValueCell!2488)) (size!5336 (_ BitVec 32))) )
))
(declare-datatypes ((array!10567 0))(
  ( (array!10568 (arr!5005 (Array (_ BitVec 32) (_ BitVec 64))) (size!5337 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2876 0))(
  ( (LongMapFixedSize!2877 (defaultEntry!4088 Int) (mask!9839 (_ BitVec 32)) (extraKeys!3825 (_ BitVec 32)) (zeroValue!3929 V!7197) (minValue!3929 V!7197) (_size!1487 (_ BitVec 32)) (_keys!6137 array!10567) (_values!4071 array!10565) (_vacant!1487 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2876)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4280 0))(
  ( (tuple2!4281 (_1!2151 (_ BitVec 64)) (_2!2151 V!7197)) )
))
(declare-datatypes ((List!3183 0))(
  ( (Nil!3180) (Cons!3179 (h!3826 tuple2!4280) (t!8138 List!3183)) )
))
(declare-datatypes ((ListLongMap!3193 0))(
  ( (ListLongMap!3194 (toList!1612 List!3183)) )
))
(declare-fun contains!1453 (ListLongMap!3193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1140 (array!10567 array!10565 (_ BitVec 32) (_ BitVec 32) V!7197 V!7197 (_ BitVec 32) Int) ListLongMap!3193)

(assert (=> b!217229 (= res!106340 (contains!1453 (getCurrentListMap!1140 (_keys!6137 thiss!1504) (_values!4071 thiss!1504) (mask!9839 thiss!1504) (extraKeys!3825 thiss!1504) (zeroValue!3929 thiss!1504) (minValue!3929 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4088 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!9657 () Bool)

(declare-fun mapRes!9657 () Bool)

(assert (=> mapIsEmpty!9657 mapRes!9657))

(declare-fun b!217230 () Bool)

(declare-fun e!141320 () Bool)

(assert (=> b!217230 (= e!141320 e!141319)))

(declare-fun res!106335 () Bool)

(assert (=> b!217230 (=> (not res!106335) (not e!141319))))

(declare-datatypes ((SeekEntryResult!764 0))(
  ( (MissingZero!764 (index!5226 (_ BitVec 32))) (Found!764 (index!5227 (_ BitVec 32))) (Intermediate!764 (undefined!1576 Bool) (index!5228 (_ BitVec 32)) (x!22716 (_ BitVec 32))) (Undefined!764) (MissingVacant!764 (index!5229 (_ BitVec 32))) )
))
(declare-fun lt!111309 () SeekEntryResult!764)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217230 (= res!106335 (or (= lt!111309 (MissingZero!764 index!297)) (= lt!111309 (MissingVacant!764 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10567 (_ BitVec 32)) SeekEntryResult!764)

(assert (=> b!217230 (= lt!111309 (seekEntryOrOpen!0 key!932 (_keys!6137 thiss!1504) (mask!9839 thiss!1504)))))

(declare-fun b!217231 () Bool)

(declare-fun res!106338 () Bool)

(assert (=> b!217231 (=> (not res!106338) (not e!141319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217231 (= res!106338 (validMask!0 (mask!9839 thiss!1504)))))

(declare-fun b!217232 () Bool)

(declare-fun e!141323 () Bool)

(assert (=> b!217232 (= e!141323 tp_is_empty!5663)))

(declare-fun e!141322 () Bool)

(declare-fun e!141321 () Bool)

(declare-fun array_inv!3315 (array!10567) Bool)

(declare-fun array_inv!3316 (array!10565) Bool)

(assert (=> b!217233 (= e!141321 (and tp!20538 tp_is_empty!5663 (array_inv!3315 (_keys!6137 thiss!1504)) (array_inv!3316 (_values!4071 thiss!1504)) e!141322))))

(declare-fun b!217234 () Bool)

(declare-fun res!106339 () Bool)

(assert (=> b!217234 (=> (not res!106339) (not e!141319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10567 (_ BitVec 32)) Bool)

(assert (=> b!217234 (= res!106339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6137 thiss!1504) (mask!9839 thiss!1504)))))

(declare-fun res!106336 () Bool)

(assert (=> start!21652 (=> (not res!106336) (not e!141320))))

(declare-fun valid!1169 (LongMapFixedSize!2876) Bool)

(assert (=> start!21652 (= res!106336 (valid!1169 thiss!1504))))

(assert (=> start!21652 e!141320))

(assert (=> start!21652 e!141321))

(assert (=> start!21652 true))

(declare-fun b!217235 () Bool)

(assert (=> b!217235 (= e!141322 (and e!141324 mapRes!9657))))

(declare-fun condMapEmpty!9657 () Bool)

(declare-fun mapDefault!9657 () ValueCell!2488)

