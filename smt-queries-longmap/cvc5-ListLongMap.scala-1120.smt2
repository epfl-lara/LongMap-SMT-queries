; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22966 () Bool)

(assert start!22966)

(declare-fun b!240540 () Bool)

(declare-fun b_free!6469 () Bool)

(declare-fun b_next!6469 () Bool)

(assert (=> b!240540 (= b_free!6469 (not b_next!6469))))

(declare-fun tp!22611 () Bool)

(declare-fun b_and!13435 () Bool)

(assert (=> b!240540 (= tp!22611 b_and!13435)))

(declare-fun b!240534 () Bool)

(declare-fun res!117943 () Bool)

(declare-datatypes ((V!8089 0))(
  ( (V!8090 (val!3210 Int)) )
))
(declare-datatypes ((ValueCell!2822 0))(
  ( (ValueCellFull!2822 (v!5248 V!8089)) (EmptyCell!2822) )
))
(declare-datatypes ((array!11941 0))(
  ( (array!11942 (arr!5672 (Array (_ BitVec 32) ValueCell!2822)) (size!6013 (_ BitVec 32))) )
))
(declare-datatypes ((array!11943 0))(
  ( (array!11944 (arr!5673 (Array (_ BitVec 32) (_ BitVec 64))) (size!6014 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3544 0))(
  ( (LongMapFixedSize!3545 (defaultEntry!4457 Int) (mask!10515 (_ BitVec 32)) (extraKeys!4194 (_ BitVec 32)) (zeroValue!4298 V!8089) (minValue!4298 V!8089) (_size!1821 (_ BitVec 32)) (_keys!6559 array!11943) (_values!4440 array!11941) (_vacant!1821 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3544)

(declare-datatypes ((SeekEntryResult!1047 0))(
  ( (MissingZero!1047 (index!6358 (_ BitVec 32))) (Found!1047 (index!6359 (_ BitVec 32))) (Intermediate!1047 (undefined!1859 Bool) (index!6360 (_ BitVec 32)) (x!24167 (_ BitVec 32))) (Undefined!1047) (MissingVacant!1047 (index!6361 (_ BitVec 32))) )
))
(declare-fun lt!120996 () SeekEntryResult!1047)

(assert (=> b!240534 (= res!117943 (= (select (arr!5673 (_keys!6559 thiss!1504)) (index!6361 lt!120996)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156118 () Bool)

(assert (=> b!240534 (=> (not res!117943) (not e!156118))))

(declare-fun b!240535 () Bool)

(declare-datatypes ((Unit!7400 0))(
  ( (Unit!7401) )
))
(declare-fun e!156115 () Unit!7400)

(declare-fun lt!120993 () Unit!7400)

(assert (=> b!240535 (= e!156115 lt!120993)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!353 (array!11943 array!11941 (_ BitVec 32) (_ BitVec 32) V!8089 V!8089 (_ BitVec 64) Int) Unit!7400)

(assert (=> b!240535 (= lt!120993 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!353 (_keys!6559 thiss!1504) (_values!4440 thiss!1504) (mask!10515 thiss!1504) (extraKeys!4194 thiss!1504) (zeroValue!4298 thiss!1504) (minValue!4298 thiss!1504) key!932 (defaultEntry!4457 thiss!1504)))))

(declare-fun c!40062 () Bool)

(assert (=> b!240535 (= c!40062 (is-MissingZero!1047 lt!120996))))

(declare-fun e!156112 () Bool)

(assert (=> b!240535 e!156112))

(declare-fun b!240536 () Bool)

(declare-fun e!156123 () Bool)

(declare-fun e!156114 () Bool)

(declare-fun mapRes!10728 () Bool)

(assert (=> b!240536 (= e!156123 (and e!156114 mapRes!10728))))

(declare-fun condMapEmpty!10728 () Bool)

(declare-fun mapDefault!10728 () ValueCell!2822)

