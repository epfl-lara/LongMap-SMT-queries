; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80442 () Bool)

(assert start!80442)

(declare-fun b!945032 () Bool)

(declare-fun b_free!18085 () Bool)

(declare-fun b_next!18085 () Bool)

(assert (=> b!945032 (= b_free!18085 (not b_next!18085))))

(declare-fun tp!62764 () Bool)

(declare-fun b_and!29503 () Bool)

(assert (=> b!945032 (= tp!62764 b_and!29503)))

(declare-fun b!945028 () Bool)

(declare-fun e!531468 () Bool)

(declare-fun tp_is_empty!20593 () Bool)

(assert (=> b!945028 (= e!531468 tp_is_empty!20593)))

(declare-fun mapIsEmpty!32715 () Bool)

(declare-fun mapRes!32715 () Bool)

(assert (=> mapIsEmpty!32715 mapRes!32715))

(declare-fun res!634811 () Bool)

(declare-fun e!531467 () Bool)

(assert (=> start!80442 (=> (not res!634811) (not e!531467))))

(declare-datatypes ((V!32423 0))(
  ( (V!32424 (val!10347 Int)) )
))
(declare-datatypes ((ValueCell!9815 0))(
  ( (ValueCellFull!9815 (v!12879 V!32423)) (EmptyCell!9815) )
))
(declare-datatypes ((array!57154 0))(
  ( (array!57155 (arr!27502 (Array (_ BitVec 32) ValueCell!9815)) (size!27968 (_ BitVec 32))) )
))
(declare-datatypes ((array!57156 0))(
  ( (array!57157 (arr!27503 (Array (_ BitVec 32) (_ BitVec 64))) (size!27969 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4780 0))(
  ( (LongMapFixedSize!4781 (defaultEntry!5685 Int) (mask!27347 (_ BitVec 32)) (extraKeys!5417 (_ BitVec 32)) (zeroValue!5521 V!32423) (minValue!5521 V!32423) (_size!2445 (_ BitVec 32)) (_keys!10563 array!57156) (_values!5708 array!57154) (_vacant!2445 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4780)

(declare-fun valid!1827 (LongMapFixedSize!4780) Bool)

(assert (=> start!80442 (= res!634811 (valid!1827 thiss!1141))))

(assert (=> start!80442 e!531467))

(declare-fun e!531472 () Bool)

(assert (=> start!80442 e!531472))

(assert (=> start!80442 true))

(declare-fun b!945029 () Bool)

(declare-fun e!531470 () Bool)

(assert (=> b!945029 (= e!531470 (and e!531468 mapRes!32715))))

(declare-fun condMapEmpty!32715 () Bool)

(declare-fun mapDefault!32715 () ValueCell!9815)

