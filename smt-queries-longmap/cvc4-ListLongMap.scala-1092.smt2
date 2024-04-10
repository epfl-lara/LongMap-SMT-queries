; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22352 () Bool)

(assert start!22352)

(declare-fun b!234142 () Bool)

(declare-fun b_free!6305 () Bool)

(declare-fun b_next!6305 () Bool)

(assert (=> b!234142 (= b_free!6305 (not b_next!6305))))

(declare-fun tp!22068 () Bool)

(declare-fun b_and!13217 () Bool)

(assert (=> b!234142 (= tp!22068 b_and!13217)))

(declare-fun b!234136 () Bool)

(declare-fun e!152090 () Bool)

(declare-fun tp_is_empty!6167 () Bool)

(assert (=> b!234136 (= e!152090 tp_is_empty!6167)))

(declare-fun b!234137 () Bool)

(declare-fun e!152086 () Bool)

(declare-datatypes ((V!7869 0))(
  ( (V!7870 (val!3128 Int)) )
))
(declare-datatypes ((ValueCell!2740 0))(
  ( (ValueCellFull!2740 (v!5151 V!7869)) (EmptyCell!2740) )
))
(declare-datatypes ((array!11583 0))(
  ( (array!11584 (arr!5508 (Array (_ BitVec 32) ValueCell!2740)) (size!5843 (_ BitVec 32))) )
))
(declare-datatypes ((array!11585 0))(
  ( (array!11586 (arr!5509 (Array (_ BitVec 32) (_ BitVec 64))) (size!5844 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3380 0))(
  ( (LongMapFixedSize!3381 (defaultEntry!4354 Int) (mask!10296 (_ BitVec 32)) (extraKeys!4091 (_ BitVec 32)) (zeroValue!4195 V!7869) (minValue!4195 V!7869) (_size!1739 (_ BitVec 32)) (_keys!6417 array!11585) (_values!4337 array!11583) (_vacant!1739 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3380)

(assert (=> b!234137 (= e!152086 (and (= (size!5843 (_values!4337 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10296 thiss!1504))) (= (size!5844 (_keys!6417 thiss!1504)) (size!5843 (_values!4337 thiss!1504))) (bvslt (mask!10296 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun res!114871 () Bool)

(declare-fun e!152088 () Bool)

(assert (=> start!22352 (=> (not res!114871) (not e!152088))))

(declare-fun valid!1334 (LongMapFixedSize!3380) Bool)

(assert (=> start!22352 (= res!114871 (valid!1334 thiss!1504))))

(assert (=> start!22352 e!152088))

(declare-fun e!152091 () Bool)

(assert (=> start!22352 e!152091))

(assert (=> start!22352 true))

(declare-fun b!234138 () Bool)

(declare-fun res!114869 () Bool)

(assert (=> b!234138 (=> (not res!114869) (not e!152086))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4612 0))(
  ( (tuple2!4613 (_1!2317 (_ BitVec 64)) (_2!2317 V!7869)) )
))
(declare-datatypes ((List!3522 0))(
  ( (Nil!3519) (Cons!3518 (h!4168 tuple2!4612) (t!8487 List!3522)) )
))
(declare-datatypes ((ListLongMap!3525 0))(
  ( (ListLongMap!3526 (toList!1778 List!3522)) )
))
(declare-fun contains!1650 (ListLongMap!3525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1306 (array!11585 array!11583 (_ BitVec 32) (_ BitVec 32) V!7869 V!7869 (_ BitVec 32) Int) ListLongMap!3525)

(assert (=> b!234138 (= res!114869 (contains!1650 (getCurrentListMap!1306 (_keys!6417 thiss!1504) (_values!4337 thiss!1504) (mask!10296 thiss!1504) (extraKeys!4091 thiss!1504) (zeroValue!4195 thiss!1504) (minValue!4195 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4354 thiss!1504)) key!932))))

(declare-fun b!234139 () Bool)

(declare-fun res!114868 () Bool)

(assert (=> b!234139 (=> (not res!114868) (not e!152086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234139 (= res!114868 (validMask!0 (mask!10296 thiss!1504)))))

(declare-fun mapIsEmpty!10431 () Bool)

(declare-fun mapRes!10431 () Bool)

(assert (=> mapIsEmpty!10431 mapRes!10431))

(declare-fun b!234140 () Bool)

(declare-fun res!114870 () Bool)

(assert (=> b!234140 (=> (not res!114870) (not e!152088))))

(assert (=> b!234140 (= res!114870 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234141 () Bool)

(declare-fun e!152087 () Bool)

(declare-fun e!152085 () Bool)

(assert (=> b!234141 (= e!152087 (and e!152085 mapRes!10431))))

(declare-fun condMapEmpty!10431 () Bool)

(declare-fun mapDefault!10431 () ValueCell!2740)

