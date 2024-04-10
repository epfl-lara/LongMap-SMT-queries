; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16218 () Bool)

(assert start!16218)

(declare-fun b!161768 () Bool)

(declare-fun b_free!3679 () Bool)

(declare-fun b_next!3679 () Bool)

(assert (=> b!161768 (= b_free!3679 (not b_next!3679))))

(declare-fun tp!13606 () Bool)

(declare-fun b_and!10093 () Bool)

(assert (=> b!161768 (= tp!13606 b_and!10093)))

(declare-fun e!105806 () Bool)

(declare-fun e!105807 () Bool)

(declare-datatypes ((V!4289 0))(
  ( (V!4290 (val!1785 Int)) )
))
(declare-datatypes ((ValueCell!1397 0))(
  ( (ValueCellFull!1397 (v!3650 V!4289)) (EmptyCell!1397) )
))
(declare-datatypes ((array!6041 0))(
  ( (array!6042 (arr!2865 (Array (_ BitVec 32) (_ BitVec 64))) (size!3149 (_ BitVec 32))) )
))
(declare-datatypes ((array!6043 0))(
  ( (array!6044 (arr!2866 (Array (_ BitVec 32) ValueCell!1397)) (size!3150 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1702 0))(
  ( (LongMapFixedSize!1703 (defaultEntry!3293 Int) (mask!7895 (_ BitVec 32)) (extraKeys!3034 (_ BitVec 32)) (zeroValue!3136 V!4289) (minValue!3136 V!4289) (_size!900 (_ BitVec 32)) (_keys!5094 array!6041) (_values!3276 array!6043) (_vacant!900 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1702)

(declare-fun tp_is_empty!3481 () Bool)

(declare-fun array_inv!1831 (array!6041) Bool)

(declare-fun array_inv!1832 (array!6043) Bool)

(assert (=> b!161768 (= e!105806 (and tp!13606 tp_is_empty!3481 (array_inv!1831 (_keys!5094 thiss!1248)) (array_inv!1832 (_values!3276 thiss!1248)) e!105807))))

(declare-fun b!161769 () Bool)

(declare-fun e!105805 () Bool)

(declare-fun mapRes!5909 () Bool)

(assert (=> b!161769 (= e!105807 (and e!105805 mapRes!5909))))

(declare-fun condMapEmpty!5909 () Bool)

(declare-fun mapDefault!5909 () ValueCell!1397)

