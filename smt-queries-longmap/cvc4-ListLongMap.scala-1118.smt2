; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22958 () Bool)

(assert start!22958)

(declare-fun b!240268 () Bool)

(declare-fun b_free!6461 () Bool)

(declare-fun b_next!6461 () Bool)

(assert (=> b!240268 (= b_free!6461 (not b_next!6461))))

(declare-fun tp!22587 () Bool)

(declare-fun b_and!13427 () Bool)

(assert (=> b!240268 (= tp!22587 b_and!13427)))

(declare-fun bm!22340 () Bool)

(declare-fun call!22344 () Bool)

(declare-datatypes ((V!8077 0))(
  ( (V!8078 (val!3206 Int)) )
))
(declare-datatypes ((ValueCell!2818 0))(
  ( (ValueCellFull!2818 (v!5244 V!8077)) (EmptyCell!2818) )
))
(declare-datatypes ((array!11925 0))(
  ( (array!11926 (arr!5664 (Array (_ BitVec 32) ValueCell!2818)) (size!6005 (_ BitVec 32))) )
))
(declare-datatypes ((array!11927 0))(
  ( (array!11928 (arr!5665 (Array (_ BitVec 32) (_ BitVec 64))) (size!6006 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3536 0))(
  ( (LongMapFixedSize!3537 (defaultEntry!4453 Int) (mask!10507 (_ BitVec 32)) (extraKeys!4190 (_ BitVec 32)) (zeroValue!4294 V!8077) (minValue!4294 V!8077) (_size!1817 (_ BitVec 32)) (_keys!6555 array!11927) (_values!4436 array!11925) (_vacant!1817 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3536)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22340 (= call!22344 (arrayContainsKey!0 (_keys!6555 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240251 () Bool)

(declare-datatypes ((Unit!7388 0))(
  ( (Unit!7389) )
))
(declare-fun e!155966 () Unit!7388)

(declare-fun Unit!7390 () Unit!7388)

(assert (=> b!240251 (= e!155966 Unit!7390)))

(declare-fun lt!120943 () Unit!7388)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!338 (array!11927 array!11925 (_ BitVec 32) (_ BitVec 32) V!8077 V!8077 (_ BitVec 64) Int) Unit!7388)

(assert (=> b!240251 (= lt!120943 (lemmaInListMapThenSeekEntryOrOpenFindsIt!338 (_keys!6555 thiss!1504) (_values!4436 thiss!1504) (mask!10507 thiss!1504) (extraKeys!4190 thiss!1504) (zeroValue!4294 thiss!1504) (minValue!4294 thiss!1504) key!932 (defaultEntry!4453 thiss!1504)))))

(assert (=> b!240251 false))

(declare-fun b!240252 () Bool)

(declare-fun e!155958 () Bool)

(assert (=> b!240252 (= e!155958 (not call!22344))))

(declare-fun b!240253 () Bool)

(declare-fun e!155959 () Bool)

(declare-fun e!155961 () Bool)

(assert (=> b!240253 (= e!155959 e!155961)))

(declare-fun res!117791 () Bool)

(declare-fun call!22343 () Bool)

(assert (=> b!240253 (= res!117791 call!22343)))

(assert (=> b!240253 (=> (not res!117791) (not e!155961))))

(declare-fun b!240254 () Bool)

(declare-fun res!117789 () Bool)

(declare-fun e!155955 () Bool)

(assert (=> b!240254 (=> (not res!117789) (not e!155955))))

(assert (=> b!240254 (= res!117789 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!240255 () Bool)

(declare-fun e!155967 () Bool)

(declare-fun e!155957 () Bool)

(declare-fun mapRes!10716 () Bool)

(assert (=> b!240255 (= e!155967 (and e!155957 mapRes!10716))))

(declare-fun condMapEmpty!10716 () Bool)

(declare-fun mapDefault!10716 () ValueCell!2818)

