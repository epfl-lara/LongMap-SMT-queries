; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21848 () Bool)

(assert start!21848)

(declare-fun b!220207 () Bool)

(declare-fun b_free!5915 () Bool)

(declare-fun b_next!5915 () Bool)

(assert (=> b!220207 (= b_free!5915 (not b_next!5915))))

(declare-fun tp!20887 () Bool)

(declare-fun b_and!12813 () Bool)

(assert (=> b!220207 (= tp!20887 b_and!12813)))

(declare-fun call!20579 () Bool)

(declare-datatypes ((V!7349 0))(
  ( (V!7350 (val!2933 Int)) )
))
(declare-datatypes ((ValueCell!2545 0))(
  ( (ValueCellFull!2545 (v!4953 V!7349)) (EmptyCell!2545) )
))
(declare-datatypes ((array!10797 0))(
  ( (array!10798 (arr!5118 (Array (_ BitVec 32) ValueCell!2545)) (size!5451 (_ BitVec 32))) )
))
(declare-datatypes ((array!10799 0))(
  ( (array!10800 (arr!5119 (Array (_ BitVec 32) (_ BitVec 64))) (size!5452 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2990 0))(
  ( (LongMapFixedSize!2991 (defaultEntry!4154 Int) (mask!9952 (_ BitVec 32)) (extraKeys!3891 (_ BitVec 32)) (zeroValue!3995 V!7349) (minValue!3995 V!7349) (_size!1544 (_ BitVec 32)) (_keys!6208 array!10799) (_values!4137 array!10797) (_vacant!1544 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2990)

(declare-datatypes ((SeekEntryResult!808 0))(
  ( (MissingZero!808 (index!5402 (_ BitVec 32))) (Found!808 (index!5403 (_ BitVec 32))) (Intermediate!808 (undefined!1620 Bool) (index!5404 (_ BitVec 32)) (x!22940 (_ BitVec 32))) (Undefined!808) (MissingVacant!808 (index!5405 (_ BitVec 32))) )
))
(declare-fun lt!112123 () SeekEntryResult!808)

(declare-fun bm!20576 () Bool)

(declare-fun c!36651 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20576 (= call!20579 (inRange!0 (ite c!36651 (index!5402 lt!112123) (index!5405 lt!112123)) (mask!9952 thiss!1504)))))

(declare-fun b!220192 () Bool)

(declare-fun e!143190 () Bool)

(declare-fun e!143189 () Bool)

(assert (=> b!220192 (= e!143190 e!143189)))

(declare-fun res!107961 () Bool)

(assert (=> b!220192 (=> (not res!107961) (not e!143189))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220192 (= res!107961 (or (= lt!112123 (MissingZero!808 index!297)) (= lt!112123 (MissingVacant!808 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10799 (_ BitVec 32)) SeekEntryResult!808)

(assert (=> b!220192 (= lt!112123 (seekEntryOrOpen!0 key!932 (_keys!6208 thiss!1504) (mask!9952 thiss!1504)))))

(declare-fun b!220193 () Bool)

(declare-fun res!107958 () Bool)

(declare-fun e!143182 () Bool)

(assert (=> b!220193 (=> (not res!107958) (not e!143182))))

(declare-fun arrayContainsKey!0 (array!10799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220193 (= res!107958 (arrayContainsKey!0 (_keys!6208 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220194 () Bool)

(declare-fun res!107957 () Bool)

(assert (=> b!220194 (=> (not res!107957) (not e!143190))))

(assert (=> b!220194 (= res!107957 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220195 () Bool)

(declare-fun res!107956 () Bool)

(declare-fun e!143180 () Bool)

(assert (=> b!220195 (=> (not res!107956) (not e!143180))))

(assert (=> b!220195 (= res!107956 (= (select (arr!5119 (_keys!6208 thiss!1504)) (index!5402 lt!112123)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20577 () Bool)

(declare-fun call!20580 () Bool)

(assert (=> bm!20577 (= call!20580 (arrayContainsKey!0 (_keys!6208 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220196 () Bool)

(declare-fun e!143183 () Bool)

(declare-fun e!143191 () Bool)

(declare-fun mapRes!9835 () Bool)

(assert (=> b!220196 (= e!143183 (and e!143191 mapRes!9835))))

(declare-fun condMapEmpty!9835 () Bool)

(declare-fun mapDefault!9835 () ValueCell!2545)

