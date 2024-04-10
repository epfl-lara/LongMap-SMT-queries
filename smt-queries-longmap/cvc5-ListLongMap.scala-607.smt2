; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15824 () Bool)

(assert start!15824)

(declare-fun b!157674 () Bool)

(declare-fun b_free!3451 () Bool)

(declare-fun b_next!3451 () Bool)

(assert (=> b!157674 (= b_free!3451 (not b_next!3451))))

(declare-fun tp!12889 () Bool)

(declare-fun b_and!9865 () Bool)

(assert (=> b!157674 (= tp!12889 b_and!9865)))

(declare-fun b!157670 () Bool)

(declare-fun res!74513 () Bool)

(declare-fun e!103261 () Bool)

(assert (=> b!157670 (=> (not res!74513) (not e!103261))))

(declare-datatypes ((V!3985 0))(
  ( (V!3986 (val!1671 Int)) )
))
(declare-datatypes ((ValueCell!1283 0))(
  ( (ValueCellFull!1283 (v!3536 V!3985)) (EmptyCell!1283) )
))
(declare-datatypes ((array!5565 0))(
  ( (array!5566 (arr!2637 (Array (_ BitVec 32) (_ BitVec 64))) (size!2917 (_ BitVec 32))) )
))
(declare-datatypes ((array!5567 0))(
  ( (array!5568 (arr!2638 (Array (_ BitVec 32) ValueCell!1283)) (size!2918 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1474 0))(
  ( (LongMapFixedSize!1475 (defaultEntry!3179 Int) (mask!7667 (_ BitVec 32)) (extraKeys!2920 (_ BitVec 32)) (zeroValue!3022 V!3985) (minValue!3022 V!3985) (_size!786 (_ BitVec 32)) (_keys!4956 array!5565) (_values!3162 array!5567) (_vacant!786 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1474)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157670 (= res!74513 (validMask!0 (mask!7667 thiss!1248)))))

(declare-fun b!157671 () Bool)

(declare-fun e!103262 () Bool)

(declare-fun tp_is_empty!3253 () Bool)

(assert (=> b!157671 (= e!103262 tp_is_empty!3253)))

(declare-fun b!157673 () Bool)

(declare-fun res!74515 () Bool)

(assert (=> b!157673 (=> (not res!74515) (not e!103261))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157673 (= res!74515 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5533 () Bool)

(declare-fun mapRes!5533 () Bool)

(assert (=> mapIsEmpty!5533 mapRes!5533))

(declare-fun e!103259 () Bool)

(declare-fun e!103263 () Bool)

(declare-fun array_inv!1675 (array!5565) Bool)

(declare-fun array_inv!1676 (array!5567) Bool)

(assert (=> b!157674 (= e!103259 (and tp!12889 tp_is_empty!3253 (array_inv!1675 (_keys!4956 thiss!1248)) (array_inv!1676 (_values!3162 thiss!1248)) e!103263))))

(declare-fun mapNonEmpty!5533 () Bool)

(declare-fun tp!12888 () Bool)

(declare-fun e!103264 () Bool)

(assert (=> mapNonEmpty!5533 (= mapRes!5533 (and tp!12888 e!103264))))

(declare-fun mapValue!5533 () ValueCell!1283)

(declare-fun mapRest!5533 () (Array (_ BitVec 32) ValueCell!1283))

(declare-fun mapKey!5533 () (_ BitVec 32))

(assert (=> mapNonEmpty!5533 (= (arr!2638 (_values!3162 thiss!1248)) (store mapRest!5533 mapKey!5533 mapValue!5533))))

(declare-fun b!157675 () Bool)

(declare-fun res!74514 () Bool)

(assert (=> b!157675 (=> (not res!74514) (not e!103261))))

(assert (=> b!157675 (= res!74514 (and (bvsge (mask!7667 thiss!1248) #b00000000000000000000000000000000) (= (size!2917 (_keys!4956 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7667 thiss!1248)))))))

(declare-fun b!157672 () Bool)

(assert (=> b!157672 (= e!103264 tp_is_empty!3253)))

(declare-fun res!74512 () Bool)

(assert (=> start!15824 (=> (not res!74512) (not e!103261))))

(declare-fun valid!699 (LongMapFixedSize!1474) Bool)

(assert (=> start!15824 (= res!74512 (valid!699 thiss!1248))))

(assert (=> start!15824 e!103261))

(assert (=> start!15824 e!103259))

(assert (=> start!15824 true))

(declare-fun b!157676 () Bool)

(assert (=> b!157676 (= e!103263 (and e!103262 mapRes!5533))))

(declare-fun condMapEmpty!5533 () Bool)

(declare-fun mapDefault!5533 () ValueCell!1283)

