; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22058 () Bool)

(assert start!22058)

(declare-fun b!228247 () Bool)

(declare-fun b_free!6125 () Bool)

(declare-fun b_next!6125 () Bool)

(assert (=> b!228247 (= b_free!6125 (not b_next!6125))))

(declare-fun tp!21516 () Bool)

(declare-fun b_and!13023 () Bool)

(assert (=> b!228247 (= tp!21516 b_and!13023)))

(declare-fun b!228228 () Bool)

(declare-fun e!148073 () Bool)

(declare-fun e!148068 () Bool)

(assert (=> b!228228 (= e!148073 e!148068)))

(declare-fun res!112340 () Bool)

(assert (=> b!228228 (=> (not res!112340) (not e!148068))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7629 0))(
  ( (V!7630 (val!3038 Int)) )
))
(declare-datatypes ((ValueCell!2650 0))(
  ( (ValueCellFull!2650 (v!5058 V!7629)) (EmptyCell!2650) )
))
(declare-datatypes ((array!11217 0))(
  ( (array!11218 (arr!5328 (Array (_ BitVec 32) ValueCell!2650)) (size!5661 (_ BitVec 32))) )
))
(declare-datatypes ((array!11219 0))(
  ( (array!11220 (arr!5329 (Array (_ BitVec 32) (_ BitVec 64))) (size!5662 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3200 0))(
  ( (LongMapFixedSize!3201 (defaultEntry!4259 Int) (mask!10127 (_ BitVec 32)) (extraKeys!3996 (_ BitVec 32)) (zeroValue!4100 V!7629) (minValue!4100 V!7629) (_size!1649 (_ BitVec 32)) (_keys!6313 array!11219) (_values!4242 array!11217) (_vacant!1649 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3200)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228228 (= res!112340 (inRange!0 index!297 (mask!10127 thiss!1504)))))

(declare-datatypes ((Unit!6937 0))(
  ( (Unit!6938) )
))
(declare-fun lt!114831 () Unit!6937)

(declare-fun e!148079 () Unit!6937)

(assert (=> b!228228 (= lt!114831 e!148079)))

(declare-fun c!37848 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4484 0))(
  ( (tuple2!4485 (_1!2253 (_ BitVec 64)) (_2!2253 V!7629)) )
))
(declare-datatypes ((List!3406 0))(
  ( (Nil!3403) (Cons!3402 (h!4050 tuple2!4484) (t!8365 List!3406)) )
))
(declare-datatypes ((ListLongMap!3397 0))(
  ( (ListLongMap!3398 (toList!1714 List!3406)) )
))
(declare-fun contains!1588 (ListLongMap!3397 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1242 (array!11219 array!11217 (_ BitVec 32) (_ BitVec 32) V!7629 V!7629 (_ BitVec 32) Int) ListLongMap!3397)

(assert (=> b!228228 (= c!37848 (contains!1588 (getCurrentListMap!1242 (_keys!6313 thiss!1504) (_values!4242 thiss!1504) (mask!10127 thiss!1504) (extraKeys!3996 thiss!1504) (zeroValue!4100 thiss!1504) (minValue!4100 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4259 thiss!1504)) key!932))))

(declare-fun b!228229 () Bool)

(declare-fun c!37846 () Bool)

(declare-datatypes ((SeekEntryResult!905 0))(
  ( (MissingZero!905 (index!5790 (_ BitVec 32))) (Found!905 (index!5791 (_ BitVec 32))) (Intermediate!905 (undefined!1717 Bool) (index!5792 (_ BitVec 32)) (x!23317 (_ BitVec 32))) (Undefined!905) (MissingVacant!905 (index!5793 (_ BitVec 32))) )
))
(declare-fun lt!114834 () SeekEntryResult!905)

(assert (=> b!228229 (= c!37846 (is-MissingVacant!905 lt!114834))))

(declare-fun e!148078 () Bool)

(declare-fun e!148072 () Bool)

(assert (=> b!228229 (= e!148078 e!148072)))

(declare-fun b!228230 () Bool)

(declare-fun e!148067 () Unit!6937)

(declare-fun Unit!6939 () Unit!6937)

(assert (=> b!228230 (= e!148067 Unit!6939)))

(declare-fun mapNonEmpty!10150 () Bool)

(declare-fun mapRes!10150 () Bool)

(declare-fun tp!21517 () Bool)

(declare-fun e!148069 () Bool)

(assert (=> mapNonEmpty!10150 (= mapRes!10150 (and tp!21517 e!148069))))

(declare-fun mapValue!10150 () ValueCell!2650)

(declare-fun mapRest!10150 () (Array (_ BitVec 32) ValueCell!2650))

(declare-fun mapKey!10150 () (_ BitVec 32))

(assert (=> mapNonEmpty!10150 (= (arr!5328 (_values!4242 thiss!1504)) (store mapRest!10150 mapKey!10150 mapValue!10150))))

(declare-fun call!21209 () Bool)

(declare-fun c!37847 () Bool)

(declare-fun bm!21206 () Bool)

(assert (=> bm!21206 (= call!21209 (inRange!0 (ite c!37847 (index!5790 lt!114834) (index!5793 lt!114834)) (mask!10127 thiss!1504)))))

(declare-fun mapIsEmpty!10150 () Bool)

(assert (=> mapIsEmpty!10150 mapRes!10150))

(declare-fun b!228231 () Bool)

(declare-fun e!148071 () Bool)

(declare-fun e!148065 () Bool)

(assert (=> b!228231 (= e!148071 (and e!148065 mapRes!10150))))

(declare-fun condMapEmpty!10150 () Bool)

(declare-fun mapDefault!10150 () ValueCell!2650)

