; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79888 () Bool)

(assert start!79888)

(declare-fun b!939569 () Bool)

(declare-fun b_free!17785 () Bool)

(declare-fun b_next!17785 () Bool)

(assert (=> b!939569 (= b_free!17785 (not b_next!17785))))

(declare-fun tp!61819 () Bool)

(declare-fun b_and!29197 () Bool)

(assert (=> b!939569 (= tp!61819 b_and!29197)))

(declare-fun b!939566 () Bool)

(declare-fun e!527768 () Bool)

(declare-fun tp_is_empty!20293 () Bool)

(assert (=> b!939566 (= e!527768 tp_is_empty!20293)))

(declare-fun b!939567 () Bool)

(declare-fun e!527769 () Bool)

(assert (=> b!939567 (= e!527769 tp_is_empty!20293)))

(declare-fun b!939568 () Bool)

(declare-fun e!527767 () Bool)

(declare-fun mapRes!32219 () Bool)

(assert (=> b!939568 (= e!527767 (and e!527768 mapRes!32219))))

(declare-fun condMapEmpty!32219 () Bool)

(declare-datatypes ((V!32023 0))(
  ( (V!32024 (val!10197 Int)) )
))
(declare-datatypes ((ValueCell!9665 0))(
  ( (ValueCellFull!9665 (v!12728 V!32023)) (EmptyCell!9665) )
))
(declare-datatypes ((array!56528 0))(
  ( (array!56529 (arr!27202 (Array (_ BitVec 32) ValueCell!9665)) (size!27661 (_ BitVec 32))) )
))
(declare-datatypes ((array!56530 0))(
  ( (array!56531 (arr!27203 (Array (_ BitVec 32) (_ BitVec 64))) (size!27662 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4480 0))(
  ( (LongMapFixedSize!4481 (defaultEntry!5531 Int) (mask!27045 (_ BitVec 32)) (extraKeys!5263 (_ BitVec 32)) (zeroValue!5367 V!32023) (minValue!5367 V!32023) (_size!2295 (_ BitVec 32)) (_keys!10379 array!56530) (_values!5554 array!56528) (_vacant!2295 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4480)

(declare-fun mapDefault!32219 () ValueCell!9665)

