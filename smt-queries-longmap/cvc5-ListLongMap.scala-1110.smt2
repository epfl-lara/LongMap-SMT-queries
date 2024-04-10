; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22906 () Bool)

(assert start!22906)

(declare-fun b!238652 () Bool)

(declare-fun b_free!6409 () Bool)

(declare-fun b_next!6409 () Bool)

(assert (=> b!238652 (= b_free!6409 (not b_next!6409))))

(declare-fun tp!22431 () Bool)

(declare-fun b_and!13375 () Bool)

(assert (=> b!238652 (= tp!22431 b_and!13375)))

(declare-fun mapNonEmpty!10638 () Bool)

(declare-fun mapRes!10638 () Bool)

(declare-fun tp!22430 () Bool)

(declare-fun e!154943 () Bool)

(assert (=> mapNonEmpty!10638 (= mapRes!10638 (and tp!22430 e!154943))))

(declare-datatypes ((V!8009 0))(
  ( (V!8010 (val!3180 Int)) )
))
(declare-datatypes ((ValueCell!2792 0))(
  ( (ValueCellFull!2792 (v!5218 V!8009)) (EmptyCell!2792) )
))
(declare-fun mapRest!10638 () (Array (_ BitVec 32) ValueCell!2792))

(declare-fun mapKey!10638 () (_ BitVec 32))

(declare-datatypes ((array!11821 0))(
  ( (array!11822 (arr!5612 (Array (_ BitVec 32) ValueCell!2792)) (size!5953 (_ BitVec 32))) )
))
(declare-datatypes ((array!11823 0))(
  ( (array!11824 (arr!5613 (Array (_ BitVec 32) (_ BitVec 64))) (size!5954 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3484 0))(
  ( (LongMapFixedSize!3485 (defaultEntry!4427 Int) (mask!10465 (_ BitVec 32)) (extraKeys!4164 (_ BitVec 32)) (zeroValue!4268 V!8009) (minValue!4268 V!8009) (_size!1791 (_ BitVec 32)) (_keys!6529 array!11823) (_values!4410 array!11821) (_vacant!1791 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3484)

(declare-fun mapValue!10638 () ValueCell!2792)

(assert (=> mapNonEmpty!10638 (= (arr!5612 (_values!4410 thiss!1504)) (store mapRest!10638 mapKey!10638 mapValue!10638))))

(declare-fun b!238647 () Bool)

(declare-fun e!154942 () Bool)

(declare-datatypes ((SeekEntryResult!1020 0))(
  ( (MissingZero!1020 (index!6250 (_ BitVec 32))) (Found!1020 (index!6251 (_ BitVec 32))) (Intermediate!1020 (undefined!1832 Bool) (index!6252 (_ BitVec 32)) (x!24060 (_ BitVec 32))) (Undefined!1020) (MissingVacant!1020 (index!6253 (_ BitVec 32))) )
))
(declare-fun lt!120632 () SeekEntryResult!1020)

(assert (=> b!238647 (= e!154942 (is-Undefined!1020 lt!120632))))

(declare-fun b!238648 () Bool)

(declare-fun res!116962 () Bool)

(declare-fun e!154948 () Bool)

(assert (=> b!238648 (=> (not res!116962) (not e!154948))))

(declare-fun call!22188 () Bool)

(assert (=> b!238648 (= res!116962 call!22188)))

(declare-fun e!154952 () Bool)

(assert (=> b!238648 (= e!154952 e!154948)))

(declare-fun b!238649 () Bool)

(declare-fun res!116955 () Bool)

(declare-fun e!154947 () Bool)

(assert (=> b!238649 (=> (not res!116955) (not e!154947))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!238649 (= res!116955 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10638 () Bool)

(assert (=> mapIsEmpty!10638 mapRes!10638))

(declare-fun b!238650 () Bool)

(declare-fun tp_is_empty!6271 () Bool)

(assert (=> b!238650 (= e!154943 tp_is_empty!6271)))

(declare-fun b!238651 () Bool)

(declare-fun e!154951 () Bool)

(assert (=> b!238651 (= e!154942 e!154951)))

(declare-fun res!116960 () Bool)

(assert (=> b!238651 (= res!116960 call!22188)))

(assert (=> b!238651 (=> (not res!116960) (not e!154951))))

(declare-fun e!154949 () Bool)

(declare-fun e!154950 () Bool)

(declare-fun array_inv!3711 (array!11823) Bool)

(declare-fun array_inv!3712 (array!11821) Bool)

(assert (=> b!238652 (= e!154949 (and tp!22431 tp_is_empty!6271 (array_inv!3711 (_keys!6529 thiss!1504)) (array_inv!3712 (_values!4410 thiss!1504)) e!154950))))

(declare-fun bm!22184 () Bool)

(declare-fun c!39794 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22184 (= call!22188 (inRange!0 (ite c!39794 (index!6250 lt!120632) (index!6253 lt!120632)) (mask!10465 thiss!1504)))))

(declare-fun b!238653 () Bool)

(declare-fun call!22187 () Bool)

(assert (=> b!238653 (= e!154948 (not call!22187))))

(declare-fun b!238654 () Bool)

(declare-datatypes ((Unit!7320 0))(
  ( (Unit!7321) )
))
(declare-fun e!154941 () Unit!7320)

(declare-fun lt!120630 () Unit!7320)

(assert (=> b!238654 (= e!154941 lt!120630)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!333 (array!11823 array!11821 (_ BitVec 32) (_ BitVec 32) V!8009 V!8009 (_ BitVec 64) Int) Unit!7320)

(assert (=> b!238654 (= lt!120630 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!333 (_keys!6529 thiss!1504) (_values!4410 thiss!1504) (mask!10465 thiss!1504) (extraKeys!4164 thiss!1504) (zeroValue!4268 thiss!1504) (minValue!4268 thiss!1504) key!932 (defaultEntry!4427 thiss!1504)))))

(assert (=> b!238654 (= c!39794 (is-MissingZero!1020 lt!120632))))

(assert (=> b!238654 e!154952))

(declare-fun b!238655 () Bool)

(declare-fun e!154946 () Bool)

(assert (=> b!238655 (= e!154950 (and e!154946 mapRes!10638))))

(declare-fun condMapEmpty!10638 () Bool)

(declare-fun mapDefault!10638 () ValueCell!2792)

