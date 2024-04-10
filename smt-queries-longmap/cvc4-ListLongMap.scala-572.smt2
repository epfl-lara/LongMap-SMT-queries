; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15578 () Bool)

(assert start!15578)

(declare-fun b!155031 () Bool)

(declare-fun b_free!3245 () Bool)

(declare-fun b_next!3245 () Bool)

(assert (=> b!155031 (= b_free!3245 (not b_next!3245))))

(declare-fun tp!12259 () Bool)

(declare-fun b_and!9659 () Bool)

(assert (=> b!155031 (= tp!12259 b_and!9659)))

(declare-fun e!101281 () Bool)

(declare-datatypes ((V!3709 0))(
  ( (V!3710 (val!1568 Int)) )
))
(declare-datatypes ((ValueCell!1180 0))(
  ( (ValueCellFull!1180 (v!3433 V!3709)) (EmptyCell!1180) )
))
(declare-datatypes ((array!5147 0))(
  ( (array!5148 (arr!2431 (Array (_ BitVec 32) (_ BitVec 64))) (size!2709 (_ BitVec 32))) )
))
(declare-datatypes ((array!5149 0))(
  ( (array!5150 (arr!2432 (Array (_ BitVec 32) ValueCell!1180)) (size!2710 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1268 0))(
  ( (LongMapFixedSize!1269 (defaultEntry!3076 Int) (mask!7489 (_ BitVec 32)) (extraKeys!2817 (_ BitVec 32)) (zeroValue!2919 V!3709) (minValue!2919 V!3709) (_size!683 (_ BitVec 32)) (_keys!4851 array!5147) (_values!3059 array!5149) (_vacant!683 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1268)

(declare-fun e!101282 () Bool)

(declare-fun tp_is_empty!3047 () Bool)

(declare-fun array_inv!1535 (array!5147) Bool)

(declare-fun array_inv!1536 (array!5149) Bool)

(assert (=> b!155031 (= e!101281 (and tp!12259 tp_is_empty!3047 (array_inv!1535 (_keys!4851 thiss!1248)) (array_inv!1536 (_values!3059 thiss!1248)) e!101282))))

(declare-fun mapIsEmpty!5213 () Bool)

(declare-fun mapRes!5213 () Bool)

(assert (=> mapIsEmpty!5213 mapRes!5213))

(declare-fun b!155032 () Bool)

(declare-fun res!73186 () Bool)

(declare-fun e!101278 () Bool)

(assert (=> b!155032 (=> (not res!73186) (not e!101278))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155032 (= res!73186 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155033 () Bool)

(declare-fun res!73185 () Bool)

(assert (=> b!155033 (=> (not res!73185) (not e!101278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5147 (_ BitVec 32)) Bool)

(assert (=> b!155033 (= res!73185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4851 thiss!1248) (mask!7489 thiss!1248)))))

(declare-fun b!155034 () Bool)

(declare-fun e!101283 () Bool)

(assert (=> b!155034 (= e!101282 (and e!101283 mapRes!5213))))

(declare-fun condMapEmpty!5213 () Bool)

(declare-fun mapDefault!5213 () ValueCell!1180)

