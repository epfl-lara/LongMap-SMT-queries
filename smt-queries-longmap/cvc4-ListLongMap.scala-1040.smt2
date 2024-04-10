; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21926 () Bool)

(assert start!21926)

(declare-fun b!223133 () Bool)

(declare-fun b_free!5993 () Bool)

(declare-fun b_next!5993 () Bool)

(assert (=> b!223133 (= b_free!5993 (not b_next!5993))))

(declare-fun tp!21120 () Bool)

(declare-fun b_and!12891 () Bool)

(assert (=> b!223133 (= tp!21120 b_and!12891)))

(declare-fun b!223124 () Bool)

(declare-fun res!109628 () Bool)

(declare-fun e!144980 () Bool)

(assert (=> b!223124 (=> (not res!109628) (not e!144980))))

(declare-datatypes ((V!7453 0))(
  ( (V!7454 (val!2972 Int)) )
))
(declare-datatypes ((ValueCell!2584 0))(
  ( (ValueCellFull!2584 (v!4992 V!7453)) (EmptyCell!2584) )
))
(declare-datatypes ((array!10953 0))(
  ( (array!10954 (arr!5196 (Array (_ BitVec 32) ValueCell!2584)) (size!5529 (_ BitVec 32))) )
))
(declare-datatypes ((array!10955 0))(
  ( (array!10956 (arr!5197 (Array (_ BitVec 32) (_ BitVec 64))) (size!5530 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3068 0))(
  ( (LongMapFixedSize!3069 (defaultEntry!4193 Int) (mask!10017 (_ BitVec 32)) (extraKeys!3930 (_ BitVec 32)) (zeroValue!4034 V!7453) (minValue!4034 V!7453) (_size!1583 (_ BitVec 32)) (_keys!6247 array!10955) (_values!4176 array!10953) (_vacant!1583 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3068)

(declare-datatypes ((SeekEntryResult!845 0))(
  ( (MissingZero!845 (index!5550 (_ BitVec 32))) (Found!845 (index!5551 (_ BitVec 32))) (Intermediate!845 (undefined!1657 Bool) (index!5552 (_ BitVec 32)) (x!23081 (_ BitVec 32))) (Undefined!845) (MissingVacant!845 (index!5553 (_ BitVec 32))) )
))
(declare-fun lt!112828 () SeekEntryResult!845)

(assert (=> b!223124 (= res!109628 (= (select (arr!5197 (_keys!6247 thiss!1504)) (index!5550 lt!112828)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223125 () Bool)

(declare-fun res!109627 () Bool)

(declare-fun e!144966 () Bool)

(assert (=> b!223125 (=> (not res!109627) (not e!144966))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!223125 (= res!109627 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223126 () Bool)

(declare-fun res!109615 () Bool)

(declare-fun e!144972 () Bool)

(assert (=> b!223126 (=> res!109615 e!144972)))

(declare-datatypes ((List!3316 0))(
  ( (Nil!3313) (Cons!3312 (h!3960 (_ BitVec 64)) (t!8275 List!3316)) )
))
(declare-fun contains!1536 (List!3316 (_ BitVec 64)) Bool)

(assert (=> b!223126 (= res!109615 (contains!1536 Nil!3313 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223127 () Bool)

(declare-datatypes ((Unit!6700 0))(
  ( (Unit!6701) )
))
(declare-fun e!144979 () Unit!6700)

(declare-fun Unit!6702 () Unit!6700)

(assert (=> b!223127 (= e!144979 Unit!6702)))

(declare-fun lt!112824 () Unit!6700)

(declare-fun lemmaArrayContainsKeyThenInListMap!68 (array!10955 array!10953 (_ BitVec 32) (_ BitVec 32) V!7453 V!7453 (_ BitVec 64) (_ BitVec 32) Int) Unit!6700)

(assert (=> b!223127 (= lt!112824 (lemmaArrayContainsKeyThenInListMap!68 (_keys!6247 thiss!1504) (_values!4176 thiss!1504) (mask!10017 thiss!1504) (extraKeys!3930 thiss!1504) (zeroValue!4034 thiss!1504) (minValue!4034 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4193 thiss!1504)))))

(assert (=> b!223127 false))

(declare-fun b!223128 () Bool)

(declare-fun res!109617 () Bool)

(assert (=> b!223128 (=> res!109617 e!144972)))

(assert (=> b!223128 (= res!109617 (not (contains!1536 Nil!3313 key!932)))))

(declare-fun b!223129 () Bool)

(declare-fun e!144967 () Bool)

(declare-fun e!144978 () Bool)

(declare-fun mapRes!9952 () Bool)

(assert (=> b!223129 (= e!144967 (and e!144978 mapRes!9952))))

(declare-fun condMapEmpty!9952 () Bool)

(declare-fun mapDefault!9952 () ValueCell!2584)

