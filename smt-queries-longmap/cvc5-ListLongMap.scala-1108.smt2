; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22874 () Bool)

(assert start!22874)

(declare-fun b!238294 () Bool)

(declare-fun b_free!6397 () Bool)

(declare-fun b_next!6397 () Bool)

(assert (=> b!238294 (= b_free!6397 (not b_next!6397))))

(declare-fun tp!22392 () Bool)

(declare-fun b_and!13361 () Bool)

(assert (=> b!238294 (= tp!22392 b_and!13361)))

(declare-fun b!238290 () Bool)

(declare-fun res!116769 () Bool)

(declare-fun e!154720 () Bool)

(assert (=> b!238290 (=> (not res!116769) (not e!154720))))

(declare-datatypes ((V!7993 0))(
  ( (V!7994 (val!3174 Int)) )
))
(declare-datatypes ((ValueCell!2786 0))(
  ( (ValueCellFull!2786 (v!5211 V!7993)) (EmptyCell!2786) )
))
(declare-datatypes ((array!11795 0))(
  ( (array!11796 (arr!5600 (Array (_ BitVec 32) ValueCell!2786)) (size!5941 (_ BitVec 32))) )
))
(declare-datatypes ((array!11797 0))(
  ( (array!11798 (arr!5601 (Array (_ BitVec 32) (_ BitVec 64))) (size!5942 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3472 0))(
  ( (LongMapFixedSize!3473 (defaultEntry!4420 Int) (mask!10451 (_ BitVec 32)) (extraKeys!4157 (_ BitVec 32)) (zeroValue!4261 V!7993) (minValue!4261 V!7993) (_size!1785 (_ BitVec 32)) (_keys!6520 array!11797) (_values!4403 array!11795) (_vacant!1785 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3472)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4678 0))(
  ( (tuple2!4679 (_1!2350 (_ BitVec 64)) (_2!2350 V!7993)) )
))
(declare-datatypes ((List!3576 0))(
  ( (Nil!3573) (Cons!3572 (h!4228 tuple2!4678) (t!8569 List!3576)) )
))
(declare-datatypes ((ListLongMap!3591 0))(
  ( (ListLongMap!3592 (toList!1811 List!3576)) )
))
(declare-fun contains!1698 (ListLongMap!3591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1339 (array!11797 array!11795 (_ BitVec 32) (_ BitVec 32) V!7993 V!7993 (_ BitVec 32) Int) ListLongMap!3591)

(assert (=> b!238290 (= res!116769 (not (contains!1698 (getCurrentListMap!1339 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)) key!932)))))

(declare-fun mapNonEmpty!10617 () Bool)

(declare-fun mapRes!10617 () Bool)

(declare-fun tp!22391 () Bool)

(declare-fun e!154724 () Bool)

(assert (=> mapNonEmpty!10617 (= mapRes!10617 (and tp!22391 e!154724))))

(declare-fun mapKey!10617 () (_ BitVec 32))

(declare-fun mapValue!10617 () ValueCell!2786)

(declare-fun mapRest!10617 () (Array (_ BitVec 32) ValueCell!2786))

(assert (=> mapNonEmpty!10617 (= (arr!5600 (_values!4403 thiss!1504)) (store mapRest!10617 mapKey!10617 mapValue!10617))))

(declare-fun b!238291 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!238291 (= e!154720 (not (validKeyInArray!0 key!932)))))

(declare-fun b!238292 () Bool)

(declare-fun res!116770 () Bool)

(assert (=> b!238292 (=> (not res!116770) (not e!154720))))

(declare-datatypes ((List!3577 0))(
  ( (Nil!3574) (Cons!3573 (h!4229 (_ BitVec 64)) (t!8570 List!3577)) )
))
(declare-fun arrayNoDuplicates!0 (array!11797 (_ BitVec 32) List!3577) Bool)

(assert (=> b!238292 (= res!116770 (arrayNoDuplicates!0 (_keys!6520 thiss!1504) #b00000000000000000000000000000000 Nil!3574))))

(declare-fun b!238293 () Bool)

(declare-fun res!116765 () Bool)

(declare-fun e!154721 () Bool)

(assert (=> b!238293 (=> (not res!116765) (not e!154721))))

(assert (=> b!238293 (= res!116765 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!6259 () Bool)

(declare-fun e!154722 () Bool)

(declare-fun e!154725 () Bool)

(declare-fun array_inv!3701 (array!11797) Bool)

(declare-fun array_inv!3702 (array!11795) Bool)

(assert (=> b!238294 (= e!154725 (and tp!22392 tp_is_empty!6259 (array_inv!3701 (_keys!6520 thiss!1504)) (array_inv!3702 (_values!4403 thiss!1504)) e!154722))))

(declare-fun res!116766 () Bool)

(assert (=> start!22874 (=> (not res!116766) (not e!154721))))

(declare-fun valid!1371 (LongMapFixedSize!3472) Bool)

(assert (=> start!22874 (= res!116766 (valid!1371 thiss!1504))))

(assert (=> start!22874 e!154721))

(assert (=> start!22874 e!154725))

(assert (=> start!22874 true))

(declare-fun b!238295 () Bool)

(declare-fun res!116771 () Bool)

(assert (=> b!238295 (=> (not res!116771) (not e!154720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238295 (= res!116771 (validMask!0 (mask!10451 thiss!1504)))))

(declare-fun b!238296 () Bool)

(declare-fun res!116764 () Bool)

(assert (=> b!238296 (=> (not res!116764) (not e!154720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11797 (_ BitVec 32)) Bool)

(assert (=> b!238296 (= res!116764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6520 thiss!1504) (mask!10451 thiss!1504)))))

(declare-fun b!238297 () Bool)

(assert (=> b!238297 (= e!154724 tp_is_empty!6259)))

(declare-fun b!238298 () Bool)

(declare-fun e!154719 () Bool)

(assert (=> b!238298 (= e!154719 tp_is_empty!6259)))

(declare-fun b!238299 () Bool)

(assert (=> b!238299 (= e!154721 e!154720)))

(declare-fun res!116768 () Bool)

(assert (=> b!238299 (=> (not res!116768) (not e!154720))))

(declare-datatypes ((SeekEntryResult!1015 0))(
  ( (MissingZero!1015 (index!6230 (_ BitVec 32))) (Found!1015 (index!6231 (_ BitVec 32))) (Intermediate!1015 (undefined!1827 Bool) (index!6232 (_ BitVec 32)) (x!24029 (_ BitVec 32))) (Undefined!1015) (MissingVacant!1015 (index!6233 (_ BitVec 32))) )
))
(declare-fun lt!120501 () SeekEntryResult!1015)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238299 (= res!116768 (or (= lt!120501 (MissingZero!1015 index!297)) (= lt!120501 (MissingVacant!1015 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11797 (_ BitVec 32)) SeekEntryResult!1015)

(assert (=> b!238299 (= lt!120501 (seekEntryOrOpen!0 key!932 (_keys!6520 thiss!1504) (mask!10451 thiss!1504)))))

(declare-fun mapIsEmpty!10617 () Bool)

(assert (=> mapIsEmpty!10617 mapRes!10617))

(declare-fun b!238300 () Bool)

(assert (=> b!238300 (= e!154722 (and e!154719 mapRes!10617))))

(declare-fun condMapEmpty!10617 () Bool)

(declare-fun mapDefault!10617 () ValueCell!2786)

