; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17128 () Bool)

(assert start!17128)

(declare-fun b!172218 () Bool)

(declare-fun b_free!4247 () Bool)

(declare-fun b_next!4247 () Bool)

(assert (=> b!172218 (= b_free!4247 (not b_next!4247))))

(declare-fun tp!15379 () Bool)

(declare-fun b_and!10687 () Bool)

(assert (=> b!172218 (= tp!15379 b_and!10687)))

(declare-fun b!172215 () Bool)

(declare-fun res!81772 () Bool)

(declare-fun e!113670 () Bool)

(assert (=> b!172215 (=> (not res!81772) (not e!113670))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172215 (= res!81772 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172216 () Bool)

(declare-fun e!113669 () Bool)

(declare-fun tp_is_empty!4019 () Bool)

(assert (=> b!172216 (= e!113669 tp_is_empty!4019)))

(declare-fun mapIsEmpty!6830 () Bool)

(declare-fun mapRes!6830 () Bool)

(assert (=> mapIsEmpty!6830 mapRes!6830))

(declare-fun b!172217 () Bool)

(declare-fun res!81774 () Bool)

(assert (=> b!172217 (=> (not res!81774) (not e!113670))))

(declare-datatypes ((V!5005 0))(
  ( (V!5006 (val!2054 Int)) )
))
(declare-datatypes ((ValueCell!1666 0))(
  ( (ValueCellFull!1666 (v!3922 V!5005)) (EmptyCell!1666) )
))
(declare-datatypes ((array!7155 0))(
  ( (array!7156 (arr!3403 (Array (_ BitVec 32) (_ BitVec 64))) (size!3698 (_ BitVec 32))) )
))
(declare-datatypes ((array!7157 0))(
  ( (array!7158 (arr!3404 (Array (_ BitVec 32) ValueCell!1666)) (size!3699 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2240 0))(
  ( (LongMapFixedSize!2241 (defaultEntry!3566 Int) (mask!8403 (_ BitVec 32)) (extraKeys!3305 (_ BitVec 32)) (zeroValue!3407 V!5005) (minValue!3409 V!5005) (_size!1169 (_ BitVec 32)) (_keys!5401 array!7155) (_values!3549 array!7157) (_vacant!1169 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2240)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172217 (= res!81774 (validMask!0 (mask!8403 thiss!1248)))))

(declare-fun e!113668 () Bool)

(declare-fun e!113673 () Bool)

(declare-fun array_inv!2179 (array!7155) Bool)

(declare-fun array_inv!2180 (array!7157) Bool)

(assert (=> b!172218 (= e!113673 (and tp!15379 tp_is_empty!4019 (array_inv!2179 (_keys!5401 thiss!1248)) (array_inv!2180 (_values!3549 thiss!1248)) e!113668))))

(declare-fun b!172219 () Bool)

(assert (=> b!172219 (= e!113670 (not (= (size!3699 (_values!3549 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8403 thiss!1248)))))))

(declare-fun b!172220 () Bool)

(declare-fun e!113672 () Bool)

(assert (=> b!172220 (= e!113668 (and e!113672 mapRes!6830))))

(declare-fun condMapEmpty!6830 () Bool)

(declare-fun mapDefault!6830 () ValueCell!1666)

