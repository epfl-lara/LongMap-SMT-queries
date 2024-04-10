; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16300 () Bool)

(assert start!16300)

(declare-fun b!162663 () Bool)

(declare-fun b_free!3761 () Bool)

(declare-fun b_next!3761 () Bool)

(assert (=> b!162663 (= b_free!3761 (not b_next!3761))))

(declare-fun tp!13852 () Bool)

(declare-fun b_and!10175 () Bool)

(assert (=> b!162663 (= tp!13852 b_and!10175)))

(declare-fun b!162658 () Bool)

(declare-fun e!106656 () Bool)

(declare-fun e!106659 () Bool)

(declare-fun mapRes!6032 () Bool)

(assert (=> b!162658 (= e!106656 (and e!106659 mapRes!6032))))

(declare-fun condMapEmpty!6032 () Bool)

(declare-datatypes ((V!4397 0))(
  ( (V!4398 (val!1826 Int)) )
))
(declare-datatypes ((ValueCell!1438 0))(
  ( (ValueCellFull!1438 (v!3691 V!4397)) (EmptyCell!1438) )
))
(declare-datatypes ((array!6205 0))(
  ( (array!6206 (arr!2947 (Array (_ BitVec 32) (_ BitVec 64))) (size!3231 (_ BitVec 32))) )
))
(declare-datatypes ((array!6207 0))(
  ( (array!6208 (arr!2948 (Array (_ BitVec 32) ValueCell!1438)) (size!3232 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1784 0))(
  ( (LongMapFixedSize!1785 (defaultEntry!3334 Int) (mask!7962 (_ BitVec 32)) (extraKeys!3075 (_ BitVec 32)) (zeroValue!3177 V!4397) (minValue!3177 V!4397) (_size!941 (_ BitVec 32)) (_keys!5135 array!6205) (_values!3317 array!6207) (_vacant!941 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1784)

(declare-fun mapDefault!6032 () ValueCell!1438)

