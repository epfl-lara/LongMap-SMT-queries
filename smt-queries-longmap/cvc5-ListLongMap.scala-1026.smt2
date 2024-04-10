; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21838 () Bool)

(assert start!21838)

(declare-fun b!219868 () Bool)

(declare-fun b_free!5905 () Bool)

(declare-fun b_next!5905 () Bool)

(assert (=> b!219868 (= b_free!5905 (not b_next!5905))))

(declare-fun tp!20857 () Bool)

(declare-fun b_and!12803 () Bool)

(assert (=> b!219868 (= tp!20857 b_and!12803)))

(declare-fun b!219862 () Bool)

(declare-fun e!142993 () Bool)

(assert (=> b!219862 (= e!142993 false)))

(declare-fun lt!112048 () Bool)

(declare-datatypes ((V!7337 0))(
  ( (V!7338 (val!2928 Int)) )
))
(declare-datatypes ((ValueCell!2540 0))(
  ( (ValueCellFull!2540 (v!4948 V!7337)) (EmptyCell!2540) )
))
(declare-datatypes ((array!10777 0))(
  ( (array!10778 (arr!5108 (Array (_ BitVec 32) ValueCell!2540)) (size!5441 (_ BitVec 32))) )
))
(declare-datatypes ((array!10779 0))(
  ( (array!10780 (arr!5109 (Array (_ BitVec 32) (_ BitVec 64))) (size!5442 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2980 0))(
  ( (LongMapFixedSize!2981 (defaultEntry!4149 Int) (mask!9945 (_ BitVec 32)) (extraKeys!3886 (_ BitVec 32)) (zeroValue!3990 V!7337) (minValue!3990 V!7337) (_size!1539 (_ BitVec 32)) (_keys!6203 array!10779) (_values!4132 array!10777) (_vacant!1539 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2980)

(declare-datatypes ((List!3250 0))(
  ( (Nil!3247) (Cons!3246 (h!3894 (_ BitVec 64)) (t!8209 List!3250)) )
))
(declare-fun arrayNoDuplicates!0 (array!10779 (_ BitVec 32) List!3250) Bool)

(assert (=> b!219862 (= lt!112048 (arrayNoDuplicates!0 (_keys!6203 thiss!1504) #b00000000000000000000000000000000 Nil!3247))))

(declare-fun b!219863 () Bool)

(declare-fun e!142986 () Bool)

(declare-fun tp_is_empty!5767 () Bool)

(assert (=> b!219863 (= e!142986 tp_is_empty!5767)))

(declare-fun b!219864 () Bool)

(declare-fun e!142990 () Bool)

(assert (=> b!219864 (= e!142990 e!142993)))

(declare-fun res!107782 () Bool)

(assert (=> b!219864 (=> (not res!107782) (not e!142993))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219864 (= res!107782 (inRange!0 index!297 (mask!9945 thiss!1504)))))

(declare-datatypes ((Unit!6558 0))(
  ( (Unit!6559) )
))
(declare-fun lt!112049 () Unit!6558)

(declare-fun e!142987 () Unit!6558)

(assert (=> b!219864 (= lt!112049 e!142987)))

(declare-fun c!36605 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4348 0))(
  ( (tuple2!4349 (_1!2185 (_ BitVec 64)) (_2!2185 V!7337)) )
))
(declare-datatypes ((List!3251 0))(
  ( (Nil!3248) (Cons!3247 (h!3895 tuple2!4348) (t!8210 List!3251)) )
))
(declare-datatypes ((ListLongMap!3261 0))(
  ( (ListLongMap!3262 (toList!1646 List!3251)) )
))
(declare-fun contains!1489 (ListLongMap!3261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1174 (array!10779 array!10777 (_ BitVec 32) (_ BitVec 32) V!7337 V!7337 (_ BitVec 32) Int) ListLongMap!3261)

(assert (=> b!219864 (= c!36605 (contains!1489 (getCurrentListMap!1174 (_keys!6203 thiss!1504) (_values!4132 thiss!1504) (mask!9945 thiss!1504) (extraKeys!3886 thiss!1504) (zeroValue!3990 thiss!1504) (minValue!3990 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4149 thiss!1504)) key!932))))

(declare-fun bm!20546 () Bool)

(declare-fun call!20550 () Bool)

(declare-fun arrayContainsKey!0 (array!10779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20546 (= call!20550 (arrayContainsKey!0 (_keys!6203 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219865 () Bool)

(declare-fun res!107775 () Bool)

(declare-fun e!142985 () Bool)

(assert (=> b!219865 (=> (not res!107775) (not e!142985))))

(declare-datatypes ((SeekEntryResult!803 0))(
  ( (MissingZero!803 (index!5382 (_ BitVec 32))) (Found!803 (index!5383 (_ BitVec 32))) (Intermediate!803 (undefined!1615 Bool) (index!5384 (_ BitVec 32)) (x!22927 (_ BitVec 32))) (Undefined!803) (MissingVacant!803 (index!5385 (_ BitVec 32))) )
))
(declare-fun lt!112050 () SeekEntryResult!803)

(assert (=> b!219865 (= res!107775 (= (select (arr!5109 (_keys!6203 thiss!1504)) (index!5382 lt!112050)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219866 () Bool)

(declare-fun e!142996 () Bool)

(declare-fun mapRes!9820 () Bool)

(assert (=> b!219866 (= e!142996 (and e!142986 mapRes!9820))))

(declare-fun condMapEmpty!9820 () Bool)

(declare-fun mapDefault!9820 () ValueCell!2540)

