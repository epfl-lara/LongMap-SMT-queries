; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16434 () Bool)

(assert start!16434)

(declare-fun b!163615 () Bool)

(declare-fun b_free!3803 () Bool)

(declare-fun b_next!3803 () Bool)

(assert (=> b!163615 (= b_free!3803 (not b_next!3803))))

(declare-fun tp!13996 () Bool)

(declare-fun b_and!10217 () Bool)

(assert (=> b!163615 (= tp!13996 b_and!10217)))

(declare-fun b!163612 () Bool)

(declare-fun e!107358 () Bool)

(declare-fun tp_is_empty!3605 () Bool)

(assert (=> b!163612 (= e!107358 tp_is_empty!3605)))

(declare-fun res!77424 () Bool)

(declare-fun e!107356 () Bool)

(assert (=> start!16434 (=> (not res!77424) (not e!107356))))

(declare-datatypes ((V!4453 0))(
  ( (V!4454 (val!1847 Int)) )
))
(declare-datatypes ((ValueCell!1459 0))(
  ( (ValueCellFull!1459 (v!3712 V!4453)) (EmptyCell!1459) )
))
(declare-datatypes ((array!6299 0))(
  ( (array!6300 (arr!2989 (Array (_ BitVec 32) (_ BitVec 64))) (size!3276 (_ BitVec 32))) )
))
(declare-datatypes ((array!6301 0))(
  ( (array!6302 (arr!2990 (Array (_ BitVec 32) ValueCell!1459)) (size!3277 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1826 0))(
  ( (LongMapFixedSize!1827 (defaultEntry!3355 Int) (mask!8019 (_ BitVec 32)) (extraKeys!3096 (_ BitVec 32)) (zeroValue!3198 V!4453) (minValue!3198 V!4453) (_size!962 (_ BitVec 32)) (_keys!5170 array!6299) (_values!3338 array!6301) (_vacant!962 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1826)

(declare-fun valid!817 (LongMapFixedSize!1826) Bool)

(assert (=> start!16434 (= res!77424 (valid!817 thiss!1248))))

(assert (=> start!16434 e!107356))

(declare-fun e!107355 () Bool)

(assert (=> start!16434 e!107355))

(assert (=> start!16434 true))

(declare-fun b!163613 () Bool)

(declare-fun res!77423 () Bool)

(assert (=> b!163613 (=> (not res!77423) (not e!107356))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163613 (= res!77423 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6113 () Bool)

(declare-fun mapRes!6113 () Bool)

(declare-fun tp!13997 () Bool)

(declare-fun e!107359 () Bool)

(assert (=> mapNonEmpty!6113 (= mapRes!6113 (and tp!13997 e!107359))))

(declare-fun mapKey!6113 () (_ BitVec 32))

(declare-fun mapRest!6113 () (Array (_ BitVec 32) ValueCell!1459))

(declare-fun mapValue!6113 () ValueCell!1459)

(assert (=> mapNonEmpty!6113 (= (arr!2990 (_values!3338 thiss!1248)) (store mapRest!6113 mapKey!6113 mapValue!6113))))

(declare-fun b!163614 () Bool)

(assert (=> b!163614 (= e!107359 tp_is_empty!3605)))

(declare-fun e!107361 () Bool)

(declare-fun array_inv!1913 (array!6299) Bool)

(declare-fun array_inv!1914 (array!6301) Bool)

(assert (=> b!163615 (= e!107355 (and tp!13996 tp_is_empty!3605 (array_inv!1913 (_keys!5170 thiss!1248)) (array_inv!1914 (_values!3338 thiss!1248)) e!107361))))

(declare-fun b!163616 () Bool)

(declare-fun res!77426 () Bool)

(declare-fun e!107360 () Bool)

(assert (=> b!163616 (=> (not res!77426) (not e!107360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163616 (= res!77426 (validMask!0 (mask!8019 thiss!1248)))))

(declare-fun b!163617 () Bool)

(assert (=> b!163617 (= e!107356 e!107360)))

(declare-fun res!77425 () Bool)

(assert (=> b!163617 (=> (not res!77425) (not e!107360))))

(declare-datatypes ((SeekEntryResult!402 0))(
  ( (MissingZero!402 (index!3776 (_ BitVec 32))) (Found!402 (index!3777 (_ BitVec 32))) (Intermediate!402 (undefined!1214 Bool) (index!3778 (_ BitVec 32)) (x!18133 (_ BitVec 32))) (Undefined!402) (MissingVacant!402 (index!3779 (_ BitVec 32))) )
))
(declare-fun lt!82723 () SeekEntryResult!402)

(assert (=> b!163617 (= res!77425 (and (not (is-Undefined!402 lt!82723)) (not (is-MissingVacant!402 lt!82723)) (not (is-MissingZero!402 lt!82723)) (is-Found!402 lt!82723)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6299 (_ BitVec 32)) SeekEntryResult!402)

(assert (=> b!163617 (= lt!82723 (seekEntryOrOpen!0 key!828 (_keys!5170 thiss!1248) (mask!8019 thiss!1248)))))

(declare-fun b!163618 () Bool)

(assert (=> b!163618 (= e!107360 (and (= (size!3277 (_values!3338 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8019 thiss!1248))) (= (size!3276 (_keys!5170 thiss!1248)) (size!3277 (_values!3338 thiss!1248))) (bvsge (mask!8019 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3096 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3096 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!163619 () Bool)

(assert (=> b!163619 (= e!107361 (and e!107358 mapRes!6113))))

(declare-fun condMapEmpty!6113 () Bool)

(declare-fun mapDefault!6113 () ValueCell!1459)

