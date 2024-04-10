; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16278 () Bool)

(assert start!16278)

(declare-fun b!162394 () Bool)

(declare-fun b_free!3739 () Bool)

(declare-fun b_next!3739 () Bool)

(assert (=> b!162394 (= b_free!3739 (not b_next!3739))))

(declare-fun tp!13786 () Bool)

(declare-fun b_and!10153 () Bool)

(assert (=> b!162394 (= tp!13786 b_and!10153)))

(declare-fun b!162391 () Bool)

(declare-fun res!76899 () Bool)

(declare-fun e!106410 () Bool)

(assert (=> b!162391 (=> (not res!76899) (not e!106410))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162391 (= res!76899 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5999 () Bool)

(declare-fun mapRes!5999 () Bool)

(assert (=> mapIsEmpty!5999 mapRes!5999))

(declare-fun res!76901 () Bool)

(assert (=> start!16278 (=> (not res!76901) (not e!106410))))

(declare-datatypes ((V!4369 0))(
  ( (V!4370 (val!1815 Int)) )
))
(declare-datatypes ((ValueCell!1427 0))(
  ( (ValueCellFull!1427 (v!3680 V!4369)) (EmptyCell!1427) )
))
(declare-datatypes ((array!6161 0))(
  ( (array!6162 (arr!2925 (Array (_ BitVec 32) (_ BitVec 64))) (size!3209 (_ BitVec 32))) )
))
(declare-datatypes ((array!6163 0))(
  ( (array!6164 (arr!2926 (Array (_ BitVec 32) ValueCell!1427)) (size!3210 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1762 0))(
  ( (LongMapFixedSize!1763 (defaultEntry!3323 Int) (mask!7945 (_ BitVec 32)) (extraKeys!3064 (_ BitVec 32)) (zeroValue!3166 V!4369) (minValue!3166 V!4369) (_size!930 (_ BitVec 32)) (_keys!5124 array!6161) (_values!3306 array!6163) (_vacant!930 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1762)

(declare-fun valid!797 (LongMapFixedSize!1762) Bool)

(assert (=> start!16278 (= res!76901 (valid!797 thiss!1248))))

(assert (=> start!16278 e!106410))

(declare-fun e!106407 () Bool)

(assert (=> start!16278 e!106407))

(assert (=> start!16278 true))

(declare-fun tp_is_empty!3541 () Bool)

(assert (=> start!16278 tp_is_empty!3541))

(declare-fun mapNonEmpty!5999 () Bool)

(declare-fun tp!13787 () Bool)

(declare-fun e!106412 () Bool)

(assert (=> mapNonEmpty!5999 (= mapRes!5999 (and tp!13787 e!106412))))

(declare-fun mapRest!5999 () (Array (_ BitVec 32) ValueCell!1427))

(declare-fun mapValue!5999 () ValueCell!1427)

(declare-fun mapKey!5999 () (_ BitVec 32))

(assert (=> mapNonEmpty!5999 (= (arr!2926 (_values!3306 thiss!1248)) (store mapRest!5999 mapKey!5999 mapValue!5999))))

(declare-fun b!162392 () Bool)

(declare-fun e!106411 () Bool)

(declare-fun e!106408 () Bool)

(assert (=> b!162392 (= e!106411 (and e!106408 mapRes!5999))))

(declare-fun condMapEmpty!5999 () Bool)

(declare-fun mapDefault!5999 () ValueCell!1427)

