; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21904 () Bool)

(assert start!21904)

(declare-fun b!222175 () Bool)

(declare-fun b_free!5971 () Bool)

(declare-fun b_next!5971 () Bool)

(assert (=> b!222175 (= b_free!5971 (not b_next!5971))))

(declare-fun tp!21055 () Bool)

(declare-fun b_and!12869 () Bool)

(assert (=> b!222175 (= tp!21055 b_and!12869)))

(declare-fun b!222160 () Bool)

(declare-datatypes ((Unit!6653 0))(
  ( (Unit!6654) )
))
(declare-fun e!144383 () Unit!6653)

(declare-fun Unit!6655 () Unit!6653)

(assert (=> b!222160 (= e!144383 Unit!6655)))

(declare-fun lt!112584 () Unit!6653)

(declare-datatypes ((V!7425 0))(
  ( (V!7426 (val!2961 Int)) )
))
(declare-datatypes ((ValueCell!2573 0))(
  ( (ValueCellFull!2573 (v!4981 V!7425)) (EmptyCell!2573) )
))
(declare-datatypes ((array!10909 0))(
  ( (array!10910 (arr!5174 (Array (_ BitVec 32) ValueCell!2573)) (size!5507 (_ BitVec 32))) )
))
(declare-datatypes ((array!10911 0))(
  ( (array!10912 (arr!5175 (Array (_ BitVec 32) (_ BitVec 64))) (size!5508 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3046 0))(
  ( (LongMapFixedSize!3047 (defaultEntry!4182 Int) (mask!10000 (_ BitVec 32)) (extraKeys!3919 (_ BitVec 32)) (zeroValue!4023 V!7425) (minValue!4023 V!7425) (_size!1572 (_ BitVec 32)) (_keys!6236 array!10911) (_values!4165 array!10909) (_vacant!1572 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3046)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!58 (array!10911 array!10909 (_ BitVec 32) (_ BitVec 32) V!7425 V!7425 (_ BitVec 64) (_ BitVec 32) Int) Unit!6653)

(assert (=> b!222160 (= lt!112584 (lemmaArrayContainsKeyThenInListMap!58 (_keys!6236 thiss!1504) (_values!4165 thiss!1504) (mask!10000 thiss!1504) (extraKeys!3919 thiss!1504) (zeroValue!4023 thiss!1504) (minValue!4023 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4182 thiss!1504)))))

(assert (=> b!222160 false))

(declare-fun b!222162 () Bool)

(declare-fun e!144377 () Bool)

(declare-fun e!144372 () Bool)

(assert (=> b!222162 (= e!144377 e!144372)))

(declare-fun res!109056 () Bool)

(declare-fun call!20748 () Bool)

(assert (=> b!222162 (= res!109056 call!20748)))

(assert (=> b!222162 (=> (not res!109056) (not e!144372))))

(declare-fun b!222163 () Bool)

(declare-fun call!20747 () Bool)

(assert (=> b!222163 (= e!144372 (not call!20747))))

(declare-fun bm!20744 () Bool)

(declare-fun c!36923 () Bool)

(declare-datatypes ((SeekEntryResult!834 0))(
  ( (MissingZero!834 (index!5506 (_ BitVec 32))) (Found!834 (index!5507 (_ BitVec 32))) (Intermediate!834 (undefined!1646 Bool) (index!5508 (_ BitVec 32)) (x!23046 (_ BitVec 32))) (Undefined!834) (MissingVacant!834 (index!5509 (_ BitVec 32))) )
))
(declare-fun lt!112586 () SeekEntryResult!834)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20744 (= call!20748 (inRange!0 (ite c!36923 (index!5506 lt!112586) (index!5509 lt!112586)) (mask!10000 thiss!1504)))))

(declare-fun b!222164 () Bool)

(assert (=> b!222164 (= e!144377 (is-Undefined!834 lt!112586))))

(declare-fun b!222165 () Bool)

(declare-fun e!144389 () Bool)

(declare-datatypes ((List!3300 0))(
  ( (Nil!3297) (Cons!3296 (h!3944 (_ BitVec 64)) (t!8259 List!3300)) )
))
(declare-fun contains!1520 (List!3300 (_ BitVec 64)) Bool)

(assert (=> b!222165 (= e!144389 (not (contains!1520 Nil!3297 key!932)))))

(declare-fun b!222166 () Bool)

(declare-fun e!144375 () Bool)

(declare-fun tp_is_empty!5833 () Bool)

(assert (=> b!222166 (= e!144375 tp_is_empty!5833)))

(declare-fun b!222167 () Bool)

(declare-fun e!144374 () Bool)

(declare-fun mapRes!9919 () Bool)

(assert (=> b!222167 (= e!144374 (and e!144375 mapRes!9919))))

(declare-fun condMapEmpty!9919 () Bool)

(declare-fun mapDefault!9919 () ValueCell!2573)

