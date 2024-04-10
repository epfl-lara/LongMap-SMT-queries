; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17690 () Bool)

(assert start!17690)

(declare-fun b!176831 () Bool)

(declare-fun b_free!4363 () Bool)

(declare-fun b_next!4363 () Bool)

(assert (=> b!176831 (= b_free!4363 (not b_next!4363))))

(declare-fun tp!15786 () Bool)

(declare-fun b_and!10861 () Bool)

(assert (=> b!176831 (= tp!15786 b_and!10861)))

(declare-fun b!176823 () Bool)

(declare-fun res!83799 () Bool)

(declare-fun e!116631 () Bool)

(assert (=> b!176823 (=> (not res!83799) (not e!116631))))

(declare-datatypes ((V!5161 0))(
  ( (V!5162 (val!2112 Int)) )
))
(declare-datatypes ((ValueCell!1724 0))(
  ( (ValueCellFull!1724 (v!3991 V!5161)) (EmptyCell!1724) )
))
(declare-datatypes ((array!7419 0))(
  ( (array!7420 (arr!3519 (Array (_ BitVec 32) (_ BitVec 64))) (size!3823 (_ BitVec 32))) )
))
(declare-datatypes ((array!7421 0))(
  ( (array!7422 (arr!3520 (Array (_ BitVec 32) ValueCell!1724)) (size!3824 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2356 0))(
  ( (LongMapFixedSize!2357 (defaultEntry!3640 Int) (mask!8567 (_ BitVec 32)) (extraKeys!3377 (_ BitVec 32)) (zeroValue!3481 V!5161) (minValue!3481 V!5161) (_size!1227 (_ BitVec 32)) (_keys!5505 array!7419) (_values!3623 array!7421) (_vacant!1227 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2356)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3288 0))(
  ( (tuple2!3289 (_1!1655 (_ BitVec 64)) (_2!1655 V!5161)) )
))
(declare-datatypes ((List!2241 0))(
  ( (Nil!2238) (Cons!2237 (h!2858 tuple2!3288) (t!7069 List!2241)) )
))
(declare-datatypes ((ListLongMap!2215 0))(
  ( (ListLongMap!2216 (toList!1123 List!2241)) )
))
(declare-fun contains!1188 (ListLongMap!2215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!775 (array!7419 array!7421 (_ BitVec 32) (_ BitVec 32) V!5161 V!5161 (_ BitVec 32) Int) ListLongMap!2215)

(assert (=> b!176823 (= res!83799 (contains!1188 (getCurrentListMap!775 (_keys!5505 thiss!1248) (_values!3623 thiss!1248) (mask!8567 thiss!1248) (extraKeys!3377 thiss!1248) (zeroValue!3481 thiss!1248) (minValue!3481 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3640 thiss!1248)) key!828))))

(declare-fun b!176824 () Bool)

(declare-fun res!83797 () Bool)

(assert (=> b!176824 (=> (not res!83797) (not e!116631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176824 (= res!83797 (validMask!0 (mask!8567 thiss!1248)))))

(declare-fun b!176825 () Bool)

(declare-fun res!83800 () Bool)

(assert (=> b!176825 (=> (not res!83800) (not e!116631))))

(declare-datatypes ((SeekEntryResult!558 0))(
  ( (MissingZero!558 (index!4400 (_ BitVec 32))) (Found!558 (index!4401 (_ BitVec 32))) (Intermediate!558 (undefined!1370 Bool) (index!4402 (_ BitVec 32)) (x!19404 (_ BitVec 32))) (Undefined!558) (MissingVacant!558 (index!4403 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7419 (_ BitVec 32)) SeekEntryResult!558)

(assert (=> b!176825 (= res!83800 (is-Undefined!558 (seekEntryOrOpen!0 key!828 (_keys!5505 thiss!1248) (mask!8567 thiss!1248))))))

(declare-fun b!176826 () Bool)

(declare-fun e!116635 () Bool)

(declare-fun e!116636 () Bool)

(declare-fun mapRes!7062 () Bool)

(assert (=> b!176826 (= e!116635 (and e!116636 mapRes!7062))))

(declare-fun condMapEmpty!7062 () Bool)

(declare-fun mapDefault!7062 () ValueCell!1724)

