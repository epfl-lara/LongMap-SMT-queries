; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23182 () Bool)

(assert start!23182)

(declare-fun b!243256 () Bool)

(declare-fun b_free!6521 () Bool)

(declare-fun b_next!6521 () Bool)

(assert (=> b!243256 (= b_free!6521 (not b_next!6521))))

(declare-fun tp!22783 () Bool)

(declare-fun b_and!13501 () Bool)

(assert (=> b!243256 (= tp!22783 b_and!13501)))

(declare-fun b!243251 () Bool)

(declare-datatypes ((Unit!7508 0))(
  ( (Unit!7509) )
))
(declare-fun e!157866 () Unit!7508)

(declare-fun Unit!7510 () Unit!7508)

(assert (=> b!243251 (= e!157866 Unit!7510)))

(declare-fun lt!122088 () Unit!7508)

(declare-datatypes ((V!8157 0))(
  ( (V!8158 (val!3236 Int)) )
))
(declare-datatypes ((ValueCell!2848 0))(
  ( (ValueCellFull!2848 (v!5281 V!8157)) (EmptyCell!2848) )
))
(declare-datatypes ((array!12055 0))(
  ( (array!12056 (arr!5724 (Array (_ BitVec 32) ValueCell!2848)) (size!6066 (_ BitVec 32))) )
))
(declare-datatypes ((array!12057 0))(
  ( (array!12058 (arr!5725 (Array (_ BitVec 32) (_ BitVec 64))) (size!6067 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3596 0))(
  ( (LongMapFixedSize!3597 (defaultEntry!4507 Int) (mask!10596 (_ BitVec 32)) (extraKeys!4244 (_ BitVec 32)) (zeroValue!4348 V!8157) (minValue!4348 V!8157) (_size!1847 (_ BitVec 32)) (_keys!6617 array!12057) (_values!4490 array!12055) (_vacant!1847 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3596)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!165 (array!12057 array!12055 (_ BitVec 32) (_ BitVec 32) V!8157 V!8157 (_ BitVec 64) (_ BitVec 32) Int) Unit!7508)

(assert (=> b!243251 (= lt!122088 (lemmaArrayContainsKeyThenInListMap!165 (_keys!6617 thiss!1504) (_values!4490 thiss!1504) (mask!10596 thiss!1504) (extraKeys!4244 thiss!1504) (zeroValue!4348 thiss!1504) (minValue!4348 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4507 thiss!1504)))))

(assert (=> b!243251 false))

(declare-fun b!243252 () Bool)

(declare-fun e!157875 () Bool)

(declare-fun call!22677 () Bool)

(assert (=> b!243252 (= e!157875 (not call!22677))))

(declare-fun b!243253 () Bool)

(declare-fun e!157865 () Bool)

(declare-datatypes ((List!3645 0))(
  ( (Nil!3642) (Cons!3641 (h!4298 (_ BitVec 64)) (t!8650 List!3645)) )
))
(declare-fun contains!1753 (List!3645 (_ BitVec 64)) Bool)

(assert (=> b!243253 (= e!157865 (not (contains!1753 Nil!3642 key!932)))))

(declare-fun b!243254 () Bool)

(declare-fun res!119228 () Bool)

(declare-fun e!157877 () Bool)

(assert (=> b!243254 (=> (not res!119228) (not e!157877))))

(declare-fun noDuplicate!95 (List!3645) Bool)

(assert (=> b!243254 (= res!119228 (noDuplicate!95 Nil!3642))))

(declare-fun b!243255 () Bool)

(declare-fun res!119230 () Bool)

(assert (=> b!243255 (=> (not res!119230) (not e!157877))))

(declare-fun e!157862 () Bool)

(assert (=> b!243255 (= res!119230 e!157862)))

(declare-fun res!119223 () Bool)

(assert (=> b!243255 (=> res!119223 e!157862)))

(declare-fun e!157863 () Bool)

(assert (=> b!243255 (= res!119223 e!157863)))

(declare-fun res!119232 () Bool)

(assert (=> b!243255 (=> (not res!119232) (not e!157863))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!243255 (= res!119232 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun tp_is_empty!6383 () Bool)

(declare-fun e!157864 () Bool)

(declare-fun e!157872 () Bool)

(declare-fun array_inv!3787 (array!12057) Bool)

(declare-fun array_inv!3788 (array!12055) Bool)

(assert (=> b!243256 (= e!157864 (and tp!22783 tp_is_empty!6383 (array_inv!3787 (_keys!6617 thiss!1504)) (array_inv!3788 (_values!4490 thiss!1504)) e!157872))))

(declare-fun b!243257 () Bool)

(declare-fun e!157874 () Bool)

(assert (=> b!243257 (= e!157874 tp_is_empty!6383)))

(declare-fun b!243258 () Bool)

(declare-fun e!157879 () Bool)

(declare-fun e!157876 () Bool)

(assert (=> b!243258 (= e!157879 e!157876)))

(declare-fun res!119220 () Bool)

(declare-fun call!22676 () Bool)

(assert (=> b!243258 (= res!119220 call!22676)))

(assert (=> b!243258 (=> (not res!119220) (not e!157876))))

(declare-fun b!243259 () Bool)

(declare-fun e!157868 () Bool)

(assert (=> b!243259 (= e!157868 tp_is_empty!6383)))

(declare-fun b!243260 () Bool)

(declare-fun res!119225 () Bool)

(declare-datatypes ((SeekEntryResult!1071 0))(
  ( (MissingZero!1071 (index!6454 (_ BitVec 32))) (Found!1071 (index!6455 (_ BitVec 32))) (Intermediate!1071 (undefined!1883 Bool) (index!6456 (_ BitVec 32)) (x!24313 (_ BitVec 32))) (Undefined!1071) (MissingVacant!1071 (index!6457 (_ BitVec 32))) )
))
(declare-fun lt!122090 () SeekEntryResult!1071)

(assert (=> b!243260 (= res!119225 (= (select (arr!5725 (_keys!6617 thiss!1504)) (index!6457 lt!122090)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243260 (=> (not res!119225) (not e!157876))))

(declare-fun b!243261 () Bool)

(assert (=> b!243261 (= e!157879 (is-Undefined!1071 lt!122090))))

(declare-fun b!243262 () Bool)

(assert (=> b!243262 (= e!157876 (not call!22677))))

(declare-fun b!243263 () Bool)

(declare-fun mapRes!10822 () Bool)

(assert (=> b!243263 (= e!157872 (and e!157874 mapRes!10822))))

(declare-fun condMapEmpty!10822 () Bool)

(declare-fun mapDefault!10822 () ValueCell!2848)

