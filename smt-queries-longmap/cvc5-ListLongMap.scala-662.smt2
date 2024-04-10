; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16354 () Bool)

(assert start!16354)

(declare-fun b!163054 () Bool)

(declare-fun b_free!3781 () Bool)

(declare-fun b_next!3781 () Bool)

(assert (=> b!163054 (= b_free!3781 (not b_next!3781))))

(declare-fun tp!13920 () Bool)

(declare-fun b_and!10195 () Bool)

(assert (=> b!163054 (= tp!13920 b_and!10195)))

(declare-fun b!163047 () Bool)

(declare-fun e!106959 () Bool)

(declare-datatypes ((V!4425 0))(
  ( (V!4426 (val!1836 Int)) )
))
(declare-datatypes ((ValueCell!1448 0))(
  ( (ValueCellFull!1448 (v!3701 V!4425)) (EmptyCell!1448) )
))
(declare-datatypes ((array!6249 0))(
  ( (array!6250 (arr!2967 (Array (_ BitVec 32) (_ BitVec 64))) (size!3252 (_ BitVec 32))) )
))
(declare-datatypes ((array!6251 0))(
  ( (array!6252 (arr!2968 (Array (_ BitVec 32) ValueCell!1448)) (size!3253 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1804 0))(
  ( (LongMapFixedSize!1805 (defaultEntry!3344 Int) (mask!7988 (_ BitVec 32)) (extraKeys!3085 (_ BitVec 32)) (zeroValue!3187 V!4425) (minValue!3187 V!4425) (_size!951 (_ BitVec 32)) (_keys!5150 array!6249) (_values!3327 array!6251) (_vacant!951 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1804)

(assert (=> b!163047 (= e!106959 (and (= (size!3253 (_values!3327 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7988 thiss!1248))) (not (= (size!3252 (_keys!5150 thiss!1248)) (size!3253 (_values!3327 thiss!1248))))))))

(declare-fun b!163048 () Bool)

(declare-fun res!77191 () Bool)

(assert (=> b!163048 (=> (not res!77191) (not e!106959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163048 (= res!77191 (validMask!0 (mask!7988 thiss!1248)))))

(declare-fun mapNonEmpty!6069 () Bool)

(declare-fun mapRes!6069 () Bool)

(declare-fun tp!13919 () Bool)

(declare-fun e!106963 () Bool)

(assert (=> mapNonEmpty!6069 (= mapRes!6069 (and tp!13919 e!106963))))

(declare-fun mapValue!6069 () ValueCell!1448)

(declare-fun mapRest!6069 () (Array (_ BitVec 32) ValueCell!1448))

(declare-fun mapKey!6069 () (_ BitVec 32))

(assert (=> mapNonEmpty!6069 (= (arr!2968 (_values!3327 thiss!1248)) (store mapRest!6069 mapKey!6069 mapValue!6069))))

(declare-fun mapIsEmpty!6069 () Bool)

(assert (=> mapIsEmpty!6069 mapRes!6069))

(declare-fun res!77193 () Bool)

(declare-fun e!106961 () Bool)

(assert (=> start!16354 (=> (not res!77193) (not e!106961))))

(declare-fun valid!810 (LongMapFixedSize!1804) Bool)

(assert (=> start!16354 (= res!77193 (valid!810 thiss!1248))))

(assert (=> start!16354 e!106961))

(declare-fun e!106958 () Bool)

(assert (=> start!16354 e!106958))

(assert (=> start!16354 true))

(declare-fun b!163049 () Bool)

(declare-fun res!77190 () Bool)

(assert (=> b!163049 (=> (not res!77190) (not e!106961))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163049 (= res!77190 (not (= key!828 (bvneg key!828))))))

(declare-fun b!163050 () Bool)

(declare-fun e!106962 () Bool)

(declare-fun tp_is_empty!3583 () Bool)

(assert (=> b!163050 (= e!106962 tp_is_empty!3583)))

(declare-fun b!163051 () Bool)

(assert (=> b!163051 (= e!106963 tp_is_empty!3583)))

(declare-fun b!163052 () Bool)

(assert (=> b!163052 (= e!106961 e!106959)))

(declare-fun res!77192 () Bool)

(assert (=> b!163052 (=> (not res!77192) (not e!106959))))

(declare-datatypes ((SeekEntryResult!394 0))(
  ( (MissingZero!394 (index!3744 (_ BitVec 32))) (Found!394 (index!3745 (_ BitVec 32))) (Intermediate!394 (undefined!1206 Bool) (index!3746 (_ BitVec 32)) (x!18059 (_ BitVec 32))) (Undefined!394) (MissingVacant!394 (index!3747 (_ BitVec 32))) )
))
(declare-fun lt!82603 () SeekEntryResult!394)

(assert (=> b!163052 (= res!77192 (and (not (is-Undefined!394 lt!82603)) (not (is-MissingVacant!394 lt!82603)) (not (is-MissingZero!394 lt!82603)) (is-Found!394 lt!82603)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6249 (_ BitVec 32)) SeekEntryResult!394)

(assert (=> b!163052 (= lt!82603 (seekEntryOrOpen!0 key!828 (_keys!5150 thiss!1248) (mask!7988 thiss!1248)))))

(declare-fun b!163053 () Bool)

(declare-fun e!106964 () Bool)

(assert (=> b!163053 (= e!106964 (and e!106962 mapRes!6069))))

(declare-fun condMapEmpty!6069 () Bool)

(declare-fun mapDefault!6069 () ValueCell!1448)

