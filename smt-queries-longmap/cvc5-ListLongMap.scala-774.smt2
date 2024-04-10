; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18272 () Bool)

(assert start!18272)

(declare-fun b!181574 () Bool)

(declare-fun b_free!4483 () Bool)

(declare-fun b_next!4483 () Bool)

(assert (=> b!181574 (= b_free!4483 (not b_next!4483))))

(declare-fun tp!16200 () Bool)

(declare-fun b_and!11033 () Bool)

(assert (=> b!181574 (= tp!16200 b_and!11033)))

(declare-fun mapNonEmpty!7296 () Bool)

(declare-fun mapRes!7296 () Bool)

(declare-fun tp!16199 () Bool)

(declare-fun e!119585 () Bool)

(assert (=> mapNonEmpty!7296 (= mapRes!7296 (and tp!16199 e!119585))))

(declare-fun mapKey!7296 () (_ BitVec 32))

(declare-datatypes ((V!5321 0))(
  ( (V!5322 (val!2172 Int)) )
))
(declare-datatypes ((ValueCell!1784 0))(
  ( (ValueCellFull!1784 (v!4069 V!5321)) (EmptyCell!1784) )
))
(declare-fun mapValue!7296 () ValueCell!1784)

(declare-fun mapRest!7296 () (Array (_ BitVec 32) ValueCell!1784))

(declare-datatypes ((array!7691 0))(
  ( (array!7692 (arr!3639 (Array (_ BitVec 32) (_ BitVec 64))) (size!3949 (_ BitVec 32))) )
))
(declare-datatypes ((array!7693 0))(
  ( (array!7694 (arr!3640 (Array (_ BitVec 32) ValueCell!1784)) (size!3950 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2476 0))(
  ( (LongMapFixedSize!2477 (defaultEntry!3720 Int) (mask!8745 (_ BitVec 32)) (extraKeys!3457 (_ BitVec 32)) (zeroValue!3561 V!5321) (minValue!3561 V!5321) (_size!1287 (_ BitVec 32)) (_keys!5623 array!7691) (_values!3703 array!7693) (_vacant!1287 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2476)

(assert (=> mapNonEmpty!7296 (= (arr!3640 (_values!3703 thiss!1248)) (store mapRest!7296 mapKey!7296 mapValue!7296))))

(declare-fun b!181568 () Bool)

(declare-fun tp_is_empty!4255 () Bool)

(assert (=> b!181568 (= e!119585 tp_is_empty!4255)))

(declare-fun b!181569 () Bool)

(declare-fun e!119584 () Bool)

(assert (=> b!181569 (= e!119584 tp_is_empty!4255)))

(declare-fun b!181570 () Bool)

(declare-fun res!85954 () Bool)

(declare-fun e!119586 () Bool)

(assert (=> b!181570 (=> (not res!85954) (not e!119586))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3388 0))(
  ( (tuple2!3389 (_1!1705 (_ BitVec 64)) (_2!1705 V!5321)) )
))
(declare-datatypes ((List!2309 0))(
  ( (Nil!2306) (Cons!2305 (h!2932 tuple2!3388) (t!7165 List!2309)) )
))
(declare-datatypes ((ListLongMap!2305 0))(
  ( (ListLongMap!2306 (toList!1168 List!2309)) )
))
(declare-fun contains!1248 (ListLongMap!2305 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!816 (array!7691 array!7693 (_ BitVec 32) (_ BitVec 32) V!5321 V!5321 (_ BitVec 32) Int) ListLongMap!2305)

(assert (=> b!181570 (= res!85954 (contains!1248 (getCurrentListMap!816 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)) key!828))))

(declare-fun b!181571 () Bool)

(declare-fun e!119590 () Bool)

(assert (=> b!181571 (= e!119590 (and e!119584 mapRes!7296))))

(declare-fun condMapEmpty!7296 () Bool)

(declare-fun mapDefault!7296 () ValueCell!1784)

