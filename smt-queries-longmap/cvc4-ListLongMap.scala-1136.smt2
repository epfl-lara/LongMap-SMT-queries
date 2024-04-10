; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23452 () Bool)

(assert start!23452)

(declare-fun b!246405 () Bool)

(declare-fun b_free!6569 () Bool)

(declare-fun b_next!6569 () Bool)

(assert (=> b!246405 (= b_free!6569 (not b_next!6569))))

(declare-fun tp!22945 () Bool)

(declare-fun b_and!13565 () Bool)

(assert (=> b!246405 (= tp!22945 b_and!13565)))

(declare-fun b!246392 () Bool)

(declare-fun e!159854 () Bool)

(declare-datatypes ((SeekEntryResult!1095 0))(
  ( (MissingZero!1095 (index!6550 (_ BitVec 32))) (Found!1095 (index!6551 (_ BitVec 32))) (Intermediate!1095 (undefined!1907 Bool) (index!6552 (_ BitVec 32)) (x!24469 (_ BitVec 32))) (Undefined!1095) (MissingVacant!1095 (index!6553 (_ BitVec 32))) )
))
(declare-fun lt!123395 () SeekEntryResult!1095)

(assert (=> b!246392 (= e!159854 (is-Undefined!1095 lt!123395))))

(declare-fun b!246393 () Bool)

(declare-fun e!159853 () Bool)

(declare-fun tp_is_empty!6431 () Bool)

(assert (=> b!246393 (= e!159853 tp_is_empty!6431)))

(declare-fun b!246395 () Bool)

(declare-fun e!159858 () Bool)

(declare-datatypes ((V!8221 0))(
  ( (V!8222 (val!3260 Int)) )
))
(declare-datatypes ((ValueCell!2872 0))(
  ( (ValueCellFull!2872 (v!5315 V!8221)) (EmptyCell!2872) )
))
(declare-datatypes ((array!12163 0))(
  ( (array!12164 (arr!5772 (Array (_ BitVec 32) ValueCell!2872)) (size!6115 (_ BitVec 32))) )
))
(declare-datatypes ((array!12165 0))(
  ( (array!12166 (arr!5773 (Array (_ BitVec 32) (_ BitVec 64))) (size!6116 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3644 0))(
  ( (LongMapFixedSize!3645 (defaultEntry!4559 Int) (mask!10682 (_ BitVec 32)) (extraKeys!4296 (_ BitVec 32)) (zeroValue!4400 V!8221) (minValue!4400 V!8221) (_size!1871 (_ BitVec 32)) (_keys!6678 array!12165) (_values!4542 array!12163) (_vacant!1871 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3644)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!246395 (= e!159858 (or (not (= (size!6116 (_keys!6678 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10682 thiss!1504)))) (bvsge index!297 #b00000000000000000000000000000000)))))

(declare-fun b!246396 () Bool)

(declare-datatypes ((Unit!7611 0))(
  ( (Unit!7612) )
))
(declare-fun e!159856 () Unit!7611)

(declare-fun Unit!7613 () Unit!7611)

(assert (=> b!246396 (= e!159856 Unit!7613)))

(declare-fun lt!123400 () Unit!7611)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!179 (array!12165 array!12163 (_ BitVec 32) (_ BitVec 32) V!8221 V!8221 (_ BitVec 64) (_ BitVec 32) Int) Unit!7611)

(assert (=> b!246396 (= lt!123400 (lemmaArrayContainsKeyThenInListMap!179 (_keys!6678 thiss!1504) (_values!4542 thiss!1504) (mask!10682 thiss!1504) (extraKeys!4296 thiss!1504) (zeroValue!4400 thiss!1504) (minValue!4400 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4559 thiss!1504)))))

(assert (=> b!246396 false))

(declare-fun b!246397 () Bool)

(declare-fun e!159855 () Bool)

(declare-fun mapRes!10913 () Bool)

(assert (=> b!246397 (= e!159855 (and e!159853 mapRes!10913))))

(declare-fun condMapEmpty!10913 () Bool)

(declare-fun mapDefault!10913 () ValueCell!2872)

