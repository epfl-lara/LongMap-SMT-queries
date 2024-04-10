; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75658 () Bool)

(assert start!75658)

(declare-fun b!889503 () Bool)

(declare-fun b_free!15629 () Bool)

(declare-fun b_next!15629 () Bool)

(assert (=> b!889503 (= b_free!15629 (not b_next!15629))))

(declare-fun tp!54856 () Bool)

(declare-fun b_and!25869 () Bool)

(assert (=> b!889503 (= tp!54856 b_and!25869)))

(declare-fun b!889498 () Bool)

(declare-fun e!495832 () Bool)

(declare-fun tp_is_empty!17957 () Bool)

(assert (=> b!889498 (= e!495832 tp_is_empty!17957)))

(declare-fun b!889499 () Bool)

(declare-fun e!495833 () Bool)

(declare-fun mapRes!28490 () Bool)

(assert (=> b!889499 (= e!495833 (and e!495832 mapRes!28490))))

(declare-fun condMapEmpty!28490 () Bool)

(declare-datatypes ((array!51894 0))(
  ( (array!51895 (arr!24953 (Array (_ BitVec 32) (_ BitVec 64))) (size!25397 (_ BitVec 32))) )
))
(declare-datatypes ((V!28907 0))(
  ( (V!28908 (val!9029 Int)) )
))
(declare-datatypes ((ValueCell!8497 0))(
  ( (ValueCellFull!8497 (v!11507 V!28907)) (EmptyCell!8497) )
))
(declare-datatypes ((array!51896 0))(
  ( (array!51897 (arr!24954 (Array (_ BitVec 32) ValueCell!8497)) (size!25398 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4010 0))(
  ( (LongMapFixedSize!4011 (defaultEntry!5202 Int) (mask!25651 (_ BitVec 32)) (extraKeys!4896 (_ BitVec 32)) (zeroValue!5000 V!28907) (minValue!5000 V!28907) (_size!2060 (_ BitVec 32)) (_keys!9885 array!51894) (_values!5187 array!51896) (_vacant!2060 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4010)

(declare-fun mapDefault!28490 () ValueCell!8497)

