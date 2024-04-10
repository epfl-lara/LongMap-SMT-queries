; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18252 () Bool)

(assert start!18252)

(declare-fun b!181384 () Bool)

(declare-fun b_free!4477 () Bool)

(declare-fun b_next!4477 () Bool)

(assert (=> b!181384 (= b_free!4477 (not b_next!4477))))

(declare-fun tp!16179 () Bool)

(declare-fun b_and!11025 () Bool)

(assert (=> b!181384 (= tp!16179 b_and!11025)))

(declare-fun b!181378 () Bool)

(declare-fun e!119464 () Bool)

(declare-fun tp_is_empty!4249 () Bool)

(assert (=> b!181378 (= e!119464 tp_is_empty!4249)))

(declare-fun b!181379 () Bool)

(declare-fun res!85873 () Bool)

(declare-fun e!119461 () Bool)

(assert (=> b!181379 (=> (not res!85873) (not e!119461))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!181379 (= res!85873 (not (= key!828 (bvneg key!828))))))

(declare-fun b!181380 () Bool)

(declare-fun res!85870 () Bool)

(declare-fun e!119463 () Bool)

(assert (=> b!181380 (=> (not res!85870) (not e!119463))))

(declare-datatypes ((V!5313 0))(
  ( (V!5314 (val!2169 Int)) )
))
(declare-datatypes ((ValueCell!1781 0))(
  ( (ValueCellFull!1781 (v!4065 V!5313)) (EmptyCell!1781) )
))
(declare-datatypes ((array!7677 0))(
  ( (array!7678 (arr!3633 (Array (_ BitVec 32) (_ BitVec 64))) (size!3943 (_ BitVec 32))) )
))
(declare-datatypes ((array!7679 0))(
  ( (array!7680 (arr!3634 (Array (_ BitVec 32) ValueCell!1781)) (size!3944 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2470 0))(
  ( (LongMapFixedSize!2471 (defaultEntry!3716 Int) (mask!8737 (_ BitVec 32)) (extraKeys!3453 (_ BitVec 32)) (zeroValue!3557 V!5313) (minValue!3557 V!5313) (_size!1284 (_ BitVec 32)) (_keys!5618 array!7677) (_values!3699 array!7679) (_vacant!1284 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2470)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181380 (= res!85870 (validMask!0 (mask!8737 thiss!1248)))))

(declare-fun b!181381 () Bool)

(assert (=> b!181381 (= e!119463 (and (= (size!3944 (_values!3699 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8737 thiss!1248))) (= (size!3943 (_keys!5618 thiss!1248)) (size!3944 (_values!3699 thiss!1248))) (bvslt (mask!8737 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!181382 () Bool)

(declare-fun e!119458 () Bool)

(declare-fun mapRes!7284 () Bool)

(assert (=> b!181382 (= e!119458 (and e!119464 mapRes!7284))))

(declare-fun condMapEmpty!7284 () Bool)

(declare-fun mapDefault!7284 () ValueCell!1781)
