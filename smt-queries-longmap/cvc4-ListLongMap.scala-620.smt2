; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16072 () Bool)

(assert start!16072)

(declare-fun b!159604 () Bool)

(declare-fun b_free!3533 () Bool)

(declare-fun b_next!3533 () Bool)

(assert (=> b!159604 (= b_free!3533 (not b_next!3533))))

(declare-fun tp!13168 () Bool)

(declare-fun b_and!9947 () Bool)

(assert (=> b!159604 (= tp!13168 b_and!9947)))

(declare-fun res!75431 () Bool)

(declare-fun e!104446 () Bool)

(assert (=> start!16072 (=> (not res!75431) (not e!104446))))

(declare-datatypes ((V!4093 0))(
  ( (V!4094 (val!1712 Int)) )
))
(declare-datatypes ((ValueCell!1324 0))(
  ( (ValueCellFull!1324 (v!3577 V!4093)) (EmptyCell!1324) )
))
(declare-datatypes ((array!5749 0))(
  ( (array!5750 (arr!2719 (Array (_ BitVec 32) (_ BitVec 64))) (size!3003 (_ BitVec 32))) )
))
(declare-datatypes ((array!5751 0))(
  ( (array!5752 (arr!2720 (Array (_ BitVec 32) ValueCell!1324)) (size!3004 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1556 0))(
  ( (LongMapFixedSize!1557 (defaultEntry!3220 Int) (mask!7772 (_ BitVec 32)) (extraKeys!2961 (_ BitVec 32)) (zeroValue!3063 V!4093) (minValue!3063 V!4093) (_size!827 (_ BitVec 32)) (_keys!5021 array!5749) (_values!3203 array!5751) (_vacant!827 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1556)

(declare-fun valid!726 (LongMapFixedSize!1556) Bool)

(assert (=> start!16072 (= res!75431 (valid!726 thiss!1248))))

(assert (=> start!16072 e!104446))

(declare-fun e!104448 () Bool)

(assert (=> start!16072 e!104448))

(assert (=> start!16072 true))

(declare-fun b!159594 () Bool)

(declare-fun res!75428 () Bool)

(assert (=> b!159594 (=> (not res!75428) (not e!104446))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159594 (= res!75428 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159595 () Bool)

(declare-fun e!104443 () Bool)

(declare-fun e!104447 () Bool)

(declare-fun mapRes!5690 () Bool)

(assert (=> b!159595 (= e!104443 (and e!104447 mapRes!5690))))

(declare-fun condMapEmpty!5690 () Bool)

(declare-fun mapDefault!5690 () ValueCell!1324)

