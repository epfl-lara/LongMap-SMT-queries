; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21548 () Bool)

(assert start!21548)

(declare-fun b!216031 () Bool)

(declare-fun b_free!5737 () Bool)

(declare-fun b_next!5737 () Bool)

(assert (=> b!216031 (= b_free!5737 (not b_next!5737))))

(declare-fun tp!20336 () Bool)

(declare-fun b_and!12627 () Bool)

(assert (=> b!216031 (= tp!20336 b_and!12627)))

(declare-fun b!216024 () Bool)

(declare-fun res!105627 () Bool)

(declare-fun e!140548 () Bool)

(assert (=> b!216024 (=> (not res!105627) (not e!140548))))

(declare-datatypes ((V!7113 0))(
  ( (V!7114 (val!2844 Int)) )
))
(declare-datatypes ((ValueCell!2456 0))(
  ( (ValueCellFull!2456 (v!4862 V!7113)) (EmptyCell!2456) )
))
(declare-datatypes ((array!10431 0))(
  ( (array!10432 (arr!4940 (Array (_ BitVec 32) ValueCell!2456)) (size!5272 (_ BitVec 32))) )
))
(declare-datatypes ((array!10433 0))(
  ( (array!10434 (arr!4941 (Array (_ BitVec 32) (_ BitVec 64))) (size!5273 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2812 0))(
  ( (LongMapFixedSize!2813 (defaultEntry!4056 Int) (mask!9778 (_ BitVec 32)) (extraKeys!3793 (_ BitVec 32)) (zeroValue!3897 V!7113) (minValue!3897 V!7113) (_size!1455 (_ BitVec 32)) (_keys!6099 array!10433) (_values!4039 array!10431) (_vacant!1455 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2812)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216024 (= res!105627 (validMask!0 (mask!9778 thiss!1504)))))

(declare-fun res!105624 () Bool)

(declare-fun e!140542 () Bool)

(assert (=> start!21548 (=> (not res!105624) (not e!140542))))

(declare-fun valid!1143 (LongMapFixedSize!2812) Bool)

(assert (=> start!21548 (= res!105624 (valid!1143 thiss!1504))))

(assert (=> start!21548 e!140542))

(declare-fun e!140543 () Bool)

(assert (=> start!21548 e!140543))

(assert (=> start!21548 true))

(declare-fun mapIsEmpty!9552 () Bool)

(declare-fun mapRes!9552 () Bool)

(assert (=> mapIsEmpty!9552 mapRes!9552))

(declare-fun b!216025 () Bool)

(assert (=> b!216025 (= e!140542 e!140548)))

(declare-fun res!105626 () Bool)

(assert (=> b!216025 (=> (not res!105626) (not e!140548))))

(declare-datatypes ((SeekEntryResult!737 0))(
  ( (MissingZero!737 (index!5118 (_ BitVec 32))) (Found!737 (index!5119 (_ BitVec 32))) (Intermediate!737 (undefined!1549 Bool) (index!5120 (_ BitVec 32)) (x!22585 (_ BitVec 32))) (Undefined!737) (MissingVacant!737 (index!5121 (_ BitVec 32))) )
))
(declare-fun lt!111087 () SeekEntryResult!737)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216025 (= res!105626 (or (= lt!111087 (MissingZero!737 index!297)) (= lt!111087 (MissingVacant!737 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10433 (_ BitVec 32)) SeekEntryResult!737)

(assert (=> b!216025 (= lt!111087 (seekEntryOrOpen!0 key!932 (_keys!6099 thiss!1504) (mask!9778 thiss!1504)))))

(declare-fun b!216026 () Bool)

(declare-fun e!140546 () Bool)

(declare-fun tp_is_empty!5599 () Bool)

(assert (=> b!216026 (= e!140546 tp_is_empty!5599)))

(declare-fun mapNonEmpty!9552 () Bool)

(declare-fun tp!20337 () Bool)

(declare-fun e!140544 () Bool)

(assert (=> mapNonEmpty!9552 (= mapRes!9552 (and tp!20337 e!140544))))

(declare-fun mapValue!9552 () ValueCell!2456)

(declare-fun mapKey!9552 () (_ BitVec 32))

(declare-fun mapRest!9552 () (Array (_ BitVec 32) ValueCell!2456))

(assert (=> mapNonEmpty!9552 (= (arr!4940 (_values!4039 thiss!1504)) (store mapRest!9552 mapKey!9552 mapValue!9552))))

(declare-fun b!216027 () Bool)

(declare-fun res!105623 () Bool)

(assert (=> b!216027 (=> (not res!105623) (not e!140548))))

(assert (=> b!216027 (= res!105623 (and (= (size!5272 (_values!4039 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9778 thiss!1504))) (= (size!5273 (_keys!6099 thiss!1504)) (size!5272 (_values!4039 thiss!1504))) (bvsge (mask!9778 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3793 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3793 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216028 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10433 (_ BitVec 32)) Bool)

(assert (=> b!216028 (= e!140548 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6099 thiss!1504) (mask!9778 thiss!1504))))))

(declare-fun b!216029 () Bool)

(declare-fun e!140545 () Bool)

(assert (=> b!216029 (= e!140545 (and e!140546 mapRes!9552))))

(declare-fun condMapEmpty!9552 () Bool)

(declare-fun mapDefault!9552 () ValueCell!2456)

