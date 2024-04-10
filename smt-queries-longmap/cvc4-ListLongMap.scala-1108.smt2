; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22878 () Bool)

(assert start!22878)

(declare-fun b!238363 () Bool)

(declare-fun b_free!6401 () Bool)

(declare-fun b_next!6401 () Bool)

(assert (=> b!238363 (= b_free!6401 (not b_next!6401))))

(declare-fun tp!22404 () Bool)

(declare-fun b_and!13365 () Bool)

(assert (=> b!238363 (= tp!22404 b_and!13365)))

(declare-fun b!238362 () Bool)

(declare-fun e!154763 () Bool)

(declare-fun e!154767 () Bool)

(assert (=> b!238362 (= e!154763 e!154767)))

(declare-fun res!116814 () Bool)

(assert (=> b!238362 (=> (not res!116814) (not e!154767))))

(declare-datatypes ((SeekEntryResult!1017 0))(
  ( (MissingZero!1017 (index!6238 (_ BitVec 32))) (Found!1017 (index!6239 (_ BitVec 32))) (Intermediate!1017 (undefined!1829 Bool) (index!6240 (_ BitVec 32)) (x!24031 (_ BitVec 32))) (Undefined!1017) (MissingVacant!1017 (index!6241 (_ BitVec 32))) )
))
(declare-fun lt!120507 () SeekEntryResult!1017)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238362 (= res!116814 (or (= lt!120507 (MissingZero!1017 index!297)) (= lt!120507 (MissingVacant!1017 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7997 0))(
  ( (V!7998 (val!3176 Int)) )
))
(declare-datatypes ((ValueCell!2788 0))(
  ( (ValueCellFull!2788 (v!5213 V!7997)) (EmptyCell!2788) )
))
(declare-datatypes ((array!11803 0))(
  ( (array!11804 (arr!5604 (Array (_ BitVec 32) ValueCell!2788)) (size!5945 (_ BitVec 32))) )
))
(declare-datatypes ((array!11805 0))(
  ( (array!11806 (arr!5605 (Array (_ BitVec 32) (_ BitVec 64))) (size!5946 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3476 0))(
  ( (LongMapFixedSize!3477 (defaultEntry!4422 Int) (mask!10453 (_ BitVec 32)) (extraKeys!4159 (_ BitVec 32)) (zeroValue!4263 V!7997) (minValue!4263 V!7997) (_size!1787 (_ BitVec 32)) (_keys!6522 array!11805) (_values!4405 array!11803) (_vacant!1787 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3476)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11805 (_ BitVec 32)) SeekEntryResult!1017)

(assert (=> b!238362 (= lt!120507 (seekEntryOrOpen!0 key!932 (_keys!6522 thiss!1504) (mask!10453 thiss!1504)))))

(declare-fun e!154761 () Bool)

(declare-fun e!154764 () Bool)

(declare-fun tp_is_empty!6263 () Bool)

(declare-fun array_inv!3705 (array!11805) Bool)

(declare-fun array_inv!3706 (array!11803) Bool)

(assert (=> b!238363 (= e!154761 (and tp!22404 tp_is_empty!6263 (array_inv!3705 (_keys!6522 thiss!1504)) (array_inv!3706 (_values!4405 thiss!1504)) e!154764))))

(declare-fun mapNonEmpty!10623 () Bool)

(declare-fun mapRes!10623 () Bool)

(declare-fun tp!22403 () Bool)

(declare-fun e!154766 () Bool)

(assert (=> mapNonEmpty!10623 (= mapRes!10623 (and tp!22403 e!154766))))

(declare-fun mapRest!10623 () (Array (_ BitVec 32) ValueCell!2788))

(declare-fun mapValue!10623 () ValueCell!2788)

(declare-fun mapKey!10623 () (_ BitVec 32))

(assert (=> mapNonEmpty!10623 (= (arr!5604 (_values!4405 thiss!1504)) (store mapRest!10623 mapKey!10623 mapValue!10623))))

(declare-fun b!238364 () Bool)

(declare-fun res!116816 () Bool)

(assert (=> b!238364 (=> (not res!116816) (not e!154767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238364 (= res!116816 (validMask!0 (mask!10453 thiss!1504)))))

(declare-fun b!238365 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!238365 (= e!154767 (not (validKeyInArray!0 key!932)))))

(declare-fun b!238366 () Bool)

(declare-fun res!116812 () Bool)

(assert (=> b!238366 (=> (not res!116812) (not e!154767))))

(declare-datatypes ((tuple2!4682 0))(
  ( (tuple2!4683 (_1!2352 (_ BitVec 64)) (_2!2352 V!7997)) )
))
(declare-datatypes ((List!3580 0))(
  ( (Nil!3577) (Cons!3576 (h!4232 tuple2!4682) (t!8573 List!3580)) )
))
(declare-datatypes ((ListLongMap!3595 0))(
  ( (ListLongMap!3596 (toList!1813 List!3580)) )
))
(declare-fun contains!1700 (ListLongMap!3595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1341 (array!11805 array!11803 (_ BitVec 32) (_ BitVec 32) V!7997 V!7997 (_ BitVec 32) Int) ListLongMap!3595)

(assert (=> b!238366 (= res!116812 (not (contains!1700 (getCurrentListMap!1341 (_keys!6522 thiss!1504) (_values!4405 thiss!1504) (mask!10453 thiss!1504) (extraKeys!4159 thiss!1504) (zeroValue!4263 thiss!1504) (minValue!4263 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4422 thiss!1504)) key!932)))))

(declare-fun b!238367 () Bool)

(assert (=> b!238367 (= e!154766 tp_is_empty!6263)))

(declare-fun b!238368 () Bool)

(declare-fun res!116813 () Bool)

(assert (=> b!238368 (=> (not res!116813) (not e!154767))))

(assert (=> b!238368 (= res!116813 (and (= (size!5945 (_values!4405 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10453 thiss!1504))) (= (size!5946 (_keys!6522 thiss!1504)) (size!5945 (_values!4405 thiss!1504))) (bvsge (mask!10453 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4159 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4159 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!116818 () Bool)

(assert (=> start!22878 (=> (not res!116818) (not e!154763))))

(declare-fun valid!1373 (LongMapFixedSize!3476) Bool)

(assert (=> start!22878 (= res!116818 (valid!1373 thiss!1504))))

(assert (=> start!22878 e!154763))

(assert (=> start!22878 e!154761))

(assert (=> start!22878 true))

(declare-fun mapIsEmpty!10623 () Bool)

(assert (=> mapIsEmpty!10623 mapRes!10623))

(declare-fun b!238369 () Bool)

(declare-fun e!154765 () Bool)

(assert (=> b!238369 (= e!154764 (and e!154765 mapRes!10623))))

(declare-fun condMapEmpty!10623 () Bool)

(declare-fun mapDefault!10623 () ValueCell!2788)

