; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89342 () Bool)

(assert start!89342)

(declare-fun b!1024200 () Bool)

(declare-fun b_free!20351 () Bool)

(declare-fun b_next!20351 () Bool)

(assert (=> b!1024200 (= b_free!20351 (not b_next!20351))))

(declare-fun tp!72096 () Bool)

(declare-fun b_and!32597 () Bool)

(assert (=> b!1024200 (= tp!72096 b_and!32597)))

(declare-fun mapNonEmpty!37532 () Bool)

(declare-fun mapRes!37532 () Bool)

(declare-fun tp!72095 () Bool)

(declare-fun e!577274 () Bool)

(assert (=> mapNonEmpty!37532 (= mapRes!37532 (and tp!72095 e!577274))))

(declare-fun mapKey!37532 () (_ BitVec 32))

(declare-datatypes ((V!36967 0))(
  ( (V!36968 (val!12086 Int)) )
))
(declare-datatypes ((ValueCell!11332 0))(
  ( (ValueCellFull!11332 (v!14655 V!36967)) (EmptyCell!11332) )
))
(declare-datatypes ((array!64190 0))(
  ( (array!64191 (arr!30905 (Array (_ BitVec 32) (_ BitVec 64))) (size!31418 (_ BitVec 32))) )
))
(declare-datatypes ((array!64192 0))(
  ( (array!64193 (arr!30906 (Array (_ BitVec 32) ValueCell!11332)) (size!31419 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5258 0))(
  ( (LongMapFixedSize!5259 (defaultEntry!5981 Int) (mask!29624 (_ BitVec 32)) (extraKeys!5713 (_ BitVec 32)) (zeroValue!5817 V!36967) (minValue!5817 V!36967) (_size!2684 (_ BitVec 32)) (_keys!11128 array!64190) (_values!6004 array!64192) (_vacant!2684 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5258)

(declare-fun mapValue!37532 () ValueCell!11332)

(declare-fun mapRest!37532 () (Array (_ BitVec 32) ValueCell!11332))

(assert (=> mapNonEmpty!37532 (= (arr!30906 (_values!6004 thiss!1427)) (store mapRest!37532 mapKey!37532 mapValue!37532))))

(declare-fun b!1024196 () Bool)

(declare-fun res!685760 () Bool)

(declare-fun e!577277 () Bool)

(assert (=> b!1024196 (=> (not res!685760) (not e!577277))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024196 (= res!685760 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37532 () Bool)

(assert (=> mapIsEmpty!37532 mapRes!37532))

(declare-fun b!1024197 () Bool)

(declare-fun res!685761 () Bool)

(assert (=> b!1024197 (=> (not res!685761) (not e!577277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024197 (= res!685761 (validMask!0 (mask!29624 thiss!1427)))))

(declare-fun res!685763 () Bool)

(assert (=> start!89342 (=> (not res!685763) (not e!577277))))

(declare-fun valid!2002 (LongMapFixedSize!5258) Bool)

(assert (=> start!89342 (= res!685763 (valid!2002 thiss!1427))))

(assert (=> start!89342 e!577277))

(declare-fun e!577275 () Bool)

(assert (=> start!89342 e!577275))

(assert (=> start!89342 true))

(declare-fun b!1024198 () Bool)

(declare-fun res!685762 () Bool)

(assert (=> b!1024198 (=> (not res!685762) (not e!577277))))

(assert (=> b!1024198 (= res!685762 (= (size!31418 (_keys!11128 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29624 thiss!1427))))))

(declare-fun b!1024199 () Bool)

(declare-fun tp_is_empty!24071 () Bool)

(assert (=> b!1024199 (= e!577274 tp_is_empty!24071)))

(declare-fun e!577278 () Bool)

(declare-fun array_inv!23943 (array!64190) Bool)

(declare-fun array_inv!23944 (array!64192) Bool)

(assert (=> b!1024200 (= e!577275 (and tp!72096 tp_is_empty!24071 (array_inv!23943 (_keys!11128 thiss!1427)) (array_inv!23944 (_values!6004 thiss!1427)) e!577278))))

(declare-fun b!1024201 () Bool)

(declare-fun e!577279 () Bool)

(assert (=> b!1024201 (= e!577279 tp_is_empty!24071)))

(declare-fun b!1024202 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1024202 (= e!577277 (not (validKeyInArray!0 key!909)))))

(declare-fun b!1024203 () Bool)

(assert (=> b!1024203 (= e!577278 (and e!577279 mapRes!37532))))

(declare-fun condMapEmpty!37532 () Bool)

(declare-fun mapDefault!37532 () ValueCell!11332)

