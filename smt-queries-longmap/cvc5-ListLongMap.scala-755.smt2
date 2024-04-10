; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17696 () Bool)

(assert start!17696)

(declare-fun b!176932 () Bool)

(declare-fun b_free!4369 () Bool)

(declare-fun b_next!4369 () Bool)

(assert (=> b!176932 (= b_free!4369 (not b_next!4369))))

(declare-fun tp!15803 () Bool)

(declare-fun b_and!10867 () Bool)

(assert (=> b!176932 (= tp!15803 b_and!10867)))

(declare-fun mapIsEmpty!7071 () Bool)

(declare-fun mapRes!7071 () Bool)

(assert (=> mapIsEmpty!7071 mapRes!7071))

(declare-fun mapNonEmpty!7071 () Bool)

(declare-fun tp!15804 () Bool)

(declare-fun e!116687 () Bool)

(assert (=> mapNonEmpty!7071 (= mapRes!7071 (and tp!15804 e!116687))))

(declare-datatypes ((V!5169 0))(
  ( (V!5170 (val!2115 Int)) )
))
(declare-datatypes ((ValueCell!1727 0))(
  ( (ValueCellFull!1727 (v!3994 V!5169)) (EmptyCell!1727) )
))
(declare-fun mapValue!7071 () ValueCell!1727)

(declare-fun mapRest!7071 () (Array (_ BitVec 32) ValueCell!1727))

(declare-datatypes ((array!7431 0))(
  ( (array!7432 (arr!3525 (Array (_ BitVec 32) (_ BitVec 64))) (size!3829 (_ BitVec 32))) )
))
(declare-datatypes ((array!7433 0))(
  ( (array!7434 (arr!3526 (Array (_ BitVec 32) ValueCell!1727)) (size!3830 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2362 0))(
  ( (LongMapFixedSize!2363 (defaultEntry!3643 Int) (mask!8572 (_ BitVec 32)) (extraKeys!3380 (_ BitVec 32)) (zeroValue!3484 V!5169) (minValue!3484 V!5169) (_size!1230 (_ BitVec 32)) (_keys!5508 array!7431) (_values!3626 array!7433) (_vacant!1230 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2362)

(declare-fun mapKey!7071 () (_ BitVec 32))

(assert (=> mapNonEmpty!7071 (= (arr!3526 (_values!3626 thiss!1248)) (store mapRest!7071 mapKey!7071 mapValue!7071))))

(declare-fun b!176925 () Bool)

(declare-fun res!83863 () Bool)

(declare-fun e!116689 () Bool)

(assert (=> b!176925 (=> (not res!83863) (not e!116689))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!561 0))(
  ( (MissingZero!561 (index!4412 (_ BitVec 32))) (Found!561 (index!4413 (_ BitVec 32))) (Intermediate!561 (undefined!1373 Bool) (index!4414 (_ BitVec 32)) (x!19415 (_ BitVec 32))) (Undefined!561) (MissingVacant!561 (index!4415 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7431 (_ BitVec 32)) SeekEntryResult!561)

(assert (=> b!176925 (= res!83863 (is-Undefined!561 (seekEntryOrOpen!0 key!828 (_keys!5508 thiss!1248) (mask!8572 thiss!1248))))))

(declare-fun b!176926 () Bool)

(declare-fun tp_is_empty!4141 () Bool)

(assert (=> b!176926 (= e!116687 tp_is_empty!4141)))

(declare-fun b!176927 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176927 (= e!116689 (not (validKeyInArray!0 key!828)))))

(declare-fun b!176928 () Bool)

(declare-fun e!116686 () Bool)

(assert (=> b!176928 (= e!116686 tp_is_empty!4141)))

(declare-fun b!176929 () Bool)

(declare-fun res!83860 () Bool)

(assert (=> b!176929 (=> (not res!83860) (not e!116689))))

(assert (=> b!176929 (= res!83860 (and (= (size!3830 (_values!3626 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8572 thiss!1248))) (= (size!3829 (_keys!5508 thiss!1248)) (size!3830 (_values!3626 thiss!1248))) (bvsge (mask!8572 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3380 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3380 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!176930 () Bool)

(declare-fun res!83866 () Bool)

(assert (=> b!176930 (=> (not res!83866) (not e!116689))))

(assert (=> b!176930 (= res!83866 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176931 () Bool)

(declare-fun res!83864 () Bool)

(assert (=> b!176931 (=> (not res!83864) (not e!116689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176931 (= res!83864 (validMask!0 (mask!8572 thiss!1248)))))

(declare-fun b!176924 () Bool)

(declare-fun e!116685 () Bool)

(assert (=> b!176924 (= e!116685 (and e!116686 mapRes!7071))))

(declare-fun condMapEmpty!7071 () Bool)

(declare-fun mapDefault!7071 () ValueCell!1727)

