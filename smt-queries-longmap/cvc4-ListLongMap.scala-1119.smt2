; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22964 () Bool)

(assert start!22964)

(declare-fun b!240486 () Bool)

(declare-fun b_free!6467 () Bool)

(declare-fun b_next!6467 () Bool)

(assert (=> b!240486 (= b_free!6467 (not b_next!6467))))

(declare-fun tp!22604 () Bool)

(declare-fun b_and!13433 () Bool)

(assert (=> b!240486 (= tp!22604 b_and!13433)))

(declare-fun b!240466 () Bool)

(declare-fun res!117913 () Bool)

(declare-fun e!156078 () Bool)

(assert (=> b!240466 (=> (not res!117913) (not e!156078))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!240466 (= res!117913 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!240467 () Bool)

(declare-fun c!40054 () Bool)

(declare-datatypes ((SeekEntryResult!1046 0))(
  ( (MissingZero!1046 (index!6354 (_ BitVec 32))) (Found!1046 (index!6355 (_ BitVec 32))) (Intermediate!1046 (undefined!1858 Bool) (index!6356 (_ BitVec 32)) (x!24158 (_ BitVec 32))) (Undefined!1046) (MissingVacant!1046 (index!6357 (_ BitVec 32))) )
))
(declare-fun lt!120981 () SeekEntryResult!1046)

(assert (=> b!240467 (= c!40054 (is-MissingVacant!1046 lt!120981))))

(declare-fun e!156079 () Bool)

(declare-fun e!156081 () Bool)

(assert (=> b!240467 (= e!156079 e!156081)))

(declare-fun b!240468 () Bool)

(declare-fun e!156082 () Bool)

(declare-fun tp_is_empty!6329 () Bool)

(assert (=> b!240468 (= e!156082 tp_is_empty!6329)))

(declare-fun b!240469 () Bool)

(declare-fun e!156073 () Bool)

(declare-datatypes ((V!8085 0))(
  ( (V!8086 (val!3209 Int)) )
))
(declare-datatypes ((ValueCell!2821 0))(
  ( (ValueCellFull!2821 (v!5247 V!8085)) (EmptyCell!2821) )
))
(declare-datatypes ((array!11937 0))(
  ( (array!11938 (arr!5670 (Array (_ BitVec 32) ValueCell!2821)) (size!6011 (_ BitVec 32))) )
))
(declare-datatypes ((array!11939 0))(
  ( (array!11940 (arr!5671 (Array (_ BitVec 32) (_ BitVec 64))) (size!6012 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3542 0))(
  ( (LongMapFixedSize!3543 (defaultEntry!4456 Int) (mask!10512 (_ BitVec 32)) (extraKeys!4193 (_ BitVec 32)) (zeroValue!4297 V!8085) (minValue!4297 V!8085) (_size!1820 (_ BitVec 32)) (_keys!6558 array!11939) (_values!4439 array!11937) (_vacant!1820 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3542)

(assert (=> b!240469 (= e!156073 (bvsge #b00000000000000000000000000000000 (size!6012 (_keys!6558 thiss!1504))))))

(declare-fun b!240470 () Bool)

(declare-fun res!117905 () Bool)

(assert (=> b!240470 (= res!117905 (= (select (arr!5671 (_keys!6558 thiss!1504)) (index!6357 lt!120981)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156077 () Bool)

(assert (=> b!240470 (=> (not res!117905) (not e!156077))))

(declare-fun b!240471 () Bool)

(declare-fun e!156072 () Bool)

(assert (=> b!240471 (= e!156072 tp_is_empty!6329)))

(declare-fun mapNonEmpty!10725 () Bool)

(declare-fun mapRes!10725 () Bool)

(declare-fun tp!22605 () Bool)

(assert (=> mapNonEmpty!10725 (= mapRes!10725 (and tp!22605 e!156082))))

(declare-fun mapKey!10725 () (_ BitVec 32))

(declare-fun mapRest!10725 () (Array (_ BitVec 32) ValueCell!2821))

(declare-fun mapValue!10725 () ValueCell!2821)

(assert (=> mapNonEmpty!10725 (= (arr!5670 (_values!4439 thiss!1504)) (store mapRest!10725 mapKey!10725 mapValue!10725))))

(declare-fun res!117910 () Bool)

(assert (=> start!22964 (=> (not res!117910) (not e!156078))))

(declare-fun valid!1394 (LongMapFixedSize!3542) Bool)

(assert (=> start!22964 (= res!117910 (valid!1394 thiss!1504))))

(assert (=> start!22964 e!156078))

(declare-fun e!156074 () Bool)

(assert (=> start!22964 e!156074))

(assert (=> start!22964 true))

(declare-fun mapIsEmpty!10725 () Bool)

(assert (=> mapIsEmpty!10725 mapRes!10725))

(declare-fun b!240472 () Bool)

(declare-fun res!117912 () Bool)

(assert (=> b!240472 (=> (not res!117912) (not e!156073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11939 (_ BitVec 32)) Bool)

(assert (=> b!240472 (= res!117912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6558 thiss!1504) (mask!10512 thiss!1504)))))

(declare-fun b!240473 () Bool)

(declare-datatypes ((Unit!7397 0))(
  ( (Unit!7398) )
))
(declare-fun e!156080 () Unit!7397)

(declare-fun Unit!7399 () Unit!7397)

(assert (=> b!240473 (= e!156080 Unit!7399)))

(declare-fun lt!120979 () Unit!7397)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!341 (array!11939 array!11937 (_ BitVec 32) (_ BitVec 32) V!8085 V!8085 (_ BitVec 64) Int) Unit!7397)

(assert (=> b!240473 (= lt!120979 (lemmaInListMapThenSeekEntryOrOpenFindsIt!341 (_keys!6558 thiss!1504) (_values!4439 thiss!1504) (mask!10512 thiss!1504) (extraKeys!4193 thiss!1504) (zeroValue!4297 thiss!1504) (minValue!4297 thiss!1504) key!932 (defaultEntry!4456 thiss!1504)))))

(assert (=> b!240473 false))

(declare-fun b!240474 () Bool)

(declare-fun call!22361 () Bool)

(assert (=> b!240474 (= e!156077 (not call!22361))))

(declare-fun b!240475 () Bool)

(assert (=> b!240475 (= e!156081 e!156077)))

(declare-fun res!117908 () Bool)

(declare-fun call!22362 () Bool)

(assert (=> b!240475 (= res!117908 call!22362)))

(assert (=> b!240475 (=> (not res!117908) (not e!156077))))

(declare-fun b!240476 () Bool)

(declare-fun res!117916 () Bool)

(assert (=> b!240476 (=> (not res!117916) (not e!156073))))

(declare-datatypes ((List!3613 0))(
  ( (Nil!3610) (Cons!3609 (h!4265 (_ BitVec 64)) (t!8608 List!3613)) )
))
(declare-fun arrayNoDuplicates!0 (array!11939 (_ BitVec 32) List!3613) Bool)

(assert (=> b!240476 (= res!117916 (arrayNoDuplicates!0 (_keys!6558 thiss!1504) #b00000000000000000000000000000000 Nil!3610))))

(declare-fun b!240477 () Bool)

(declare-fun res!117907 () Bool)

(assert (=> b!240477 (=> (not res!117907) (not e!156073))))

(declare-fun arrayContainsKey!0 (array!11939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240477 (= res!117907 (arrayContainsKey!0 (_keys!6558 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240478 () Bool)

(declare-fun res!117906 () Bool)

(assert (=> b!240478 (=> (not res!117906) (not e!156073))))

(assert (=> b!240478 (= res!117906 (and (= (size!6011 (_values!4439 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10512 thiss!1504))) (= (size!6012 (_keys!6558 thiss!1504)) (size!6011 (_values!4439 thiss!1504))) (bvsge (mask!10512 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4193 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4193 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!240479 () Bool)

(declare-fun lt!120980 () Unit!7397)

(assert (=> b!240479 (= e!156080 lt!120980)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!352 (array!11939 array!11937 (_ BitVec 32) (_ BitVec 32) V!8085 V!8085 (_ BitVec 64) Int) Unit!7397)

(assert (=> b!240479 (= lt!120980 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!352 (_keys!6558 thiss!1504) (_values!4439 thiss!1504) (mask!10512 thiss!1504) (extraKeys!4193 thiss!1504) (zeroValue!4297 thiss!1504) (minValue!4297 thiss!1504) key!932 (defaultEntry!4456 thiss!1504)))))

(declare-fun c!40053 () Bool)

(assert (=> b!240479 (= c!40053 (is-MissingZero!1046 lt!120981))))

(assert (=> b!240479 e!156079))

(declare-fun b!240480 () Bool)

(declare-fun e!156084 () Bool)

(assert (=> b!240480 (= e!156084 (and e!156072 mapRes!10725))))

(declare-fun condMapEmpty!10725 () Bool)

(declare-fun mapDefault!10725 () ValueCell!2821)

