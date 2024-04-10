; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75714 () Bool)

(assert start!75714)

(declare-fun b!890200 () Bool)

(declare-fun b_free!15685 () Bool)

(declare-fun b_next!15685 () Bool)

(assert (=> b!890200 (= b_free!15685 (not b_next!15685))))

(declare-fun tp!55024 () Bool)

(declare-fun b_and!25925 () Bool)

(assert (=> b!890200 (= tp!55024 b_and!25925)))

(declare-fun b!890196 () Bool)

(declare-fun e!496420 () Bool)

(declare-fun tp_is_empty!18013 () Bool)

(assert (=> b!890196 (= e!496420 tp_is_empty!18013)))

(declare-fun mapNonEmpty!28574 () Bool)

(declare-fun mapRes!28574 () Bool)

(declare-fun tp!55023 () Bool)

(declare-fun e!496422 () Bool)

(assert (=> mapNonEmpty!28574 (= mapRes!28574 (and tp!55023 e!496422))))

(declare-datatypes ((V!28983 0))(
  ( (V!28984 (val!9057 Int)) )
))
(declare-datatypes ((ValueCell!8525 0))(
  ( (ValueCellFull!8525 (v!11535 V!28983)) (EmptyCell!8525) )
))
(declare-fun mapRest!28574 () (Array (_ BitVec 32) ValueCell!8525))

(declare-fun mapKey!28574 () (_ BitVec 32))

(declare-datatypes ((array!52006 0))(
  ( (array!52007 (arr!25009 (Array (_ BitVec 32) (_ BitVec 64))) (size!25453 (_ BitVec 32))) )
))
(declare-datatypes ((array!52008 0))(
  ( (array!52009 (arr!25010 (Array (_ BitVec 32) ValueCell!8525)) (size!25454 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4066 0))(
  ( (LongMapFixedSize!4067 (defaultEntry!5230 Int) (mask!25699 (_ BitVec 32)) (extraKeys!4924 (_ BitVec 32)) (zeroValue!5028 V!28983) (minValue!5028 V!28983) (_size!2088 (_ BitVec 32)) (_keys!9913 array!52006) (_values!5215 array!52008) (_vacant!2088 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4066)

(declare-fun mapValue!28574 () ValueCell!8525)

(assert (=> mapNonEmpty!28574 (= (arr!25010 (_values!5215 thiss!1181)) (store mapRest!28574 mapKey!28574 mapValue!28574))))

(declare-fun b!890197 () Bool)

(declare-fun res!603179 () Bool)

(declare-fun e!496421 () Bool)

(assert (=> b!890197 (=> (not res!603179) (not e!496421))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890197 (= res!603179 (not (= key!785 (bvneg key!785))))))

(declare-fun res!603177 () Bool)

(assert (=> start!75714 (=> (not res!603177) (not e!496421))))

(declare-fun valid!1578 (LongMapFixedSize!4066) Bool)

(assert (=> start!75714 (= res!603177 (valid!1578 thiss!1181))))

(assert (=> start!75714 e!496421))

(declare-fun e!496424 () Bool)

(assert (=> start!75714 e!496424))

(assert (=> start!75714 true))

(declare-fun b!890198 () Bool)

(declare-fun e!496419 () Bool)

(assert (=> b!890198 (= e!496419 (and e!496420 mapRes!28574))))

(declare-fun condMapEmpty!28574 () Bool)

(declare-fun mapDefault!28574 () ValueCell!8525)

