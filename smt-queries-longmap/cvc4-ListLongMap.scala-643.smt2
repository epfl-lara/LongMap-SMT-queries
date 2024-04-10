; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16210 () Bool)

(assert start!16210)

(declare-fun b!161698 () Bool)

(declare-fun b_free!3671 () Bool)

(declare-fun b_next!3671 () Bool)

(assert (=> b!161698 (= b_free!3671 (not b_next!3671))))

(declare-fun tp!13582 () Bool)

(declare-fun b_and!10085 () Bool)

(assert (=> b!161698 (= tp!13582 b_and!10085)))

(declare-fun mapNonEmpty!5897 () Bool)

(declare-fun mapRes!5897 () Bool)

(declare-fun tp!13583 () Bool)

(declare-fun e!105731 () Bool)

(assert (=> mapNonEmpty!5897 (= mapRes!5897 (and tp!13583 e!105731))))

(declare-fun mapKey!5897 () (_ BitVec 32))

(declare-datatypes ((V!4277 0))(
  ( (V!4278 (val!1781 Int)) )
))
(declare-datatypes ((ValueCell!1393 0))(
  ( (ValueCellFull!1393 (v!3646 V!4277)) (EmptyCell!1393) )
))
(declare-fun mapRest!5897 () (Array (_ BitVec 32) ValueCell!1393))

(declare-fun mapValue!5897 () ValueCell!1393)

(declare-datatypes ((array!6025 0))(
  ( (array!6026 (arr!2857 (Array (_ BitVec 32) (_ BitVec 64))) (size!3141 (_ BitVec 32))) )
))
(declare-datatypes ((array!6027 0))(
  ( (array!6028 (arr!2858 (Array (_ BitVec 32) ValueCell!1393)) (size!3142 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1694 0))(
  ( (LongMapFixedSize!1695 (defaultEntry!3289 Int) (mask!7887 (_ BitVec 32)) (extraKeys!3030 (_ BitVec 32)) (zeroValue!3132 V!4277) (minValue!3132 V!4277) (_size!896 (_ BitVec 32)) (_keys!5090 array!6025) (_values!3272 array!6027) (_vacant!896 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1694)

(assert (=> mapNonEmpty!5897 (= (arr!2858 (_values!3272 thiss!1248)) (store mapRest!5897 mapKey!5897 mapValue!5897))))

(declare-fun mapIsEmpty!5897 () Bool)

(assert (=> mapIsEmpty!5897 mapRes!5897))

(declare-fun b!161696 () Bool)

(declare-fun res!76613 () Bool)

(declare-fun e!105734 () Bool)

(assert (=> b!161696 (=> (not res!76613) (not e!105734))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161696 (= res!76613 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161697 () Bool)

(declare-fun tp_is_empty!3473 () Bool)

(assert (=> b!161697 (= e!105731 tp_is_empty!3473)))

(declare-fun e!105730 () Bool)

(declare-fun e!105733 () Bool)

(declare-fun array_inv!1825 (array!6025) Bool)

(declare-fun array_inv!1826 (array!6027) Bool)

(assert (=> b!161698 (= e!105730 (and tp!13582 tp_is_empty!3473 (array_inv!1825 (_keys!5090 thiss!1248)) (array_inv!1826 (_values!3272 thiss!1248)) e!105733))))

(declare-fun b!161699 () Bool)

(declare-datatypes ((SeekEntryResult!360 0))(
  ( (MissingZero!360 (index!3608 (_ BitVec 32))) (Found!360 (index!3609 (_ BitVec 32))) (Intermediate!360 (undefined!1172 Bool) (index!3610 (_ BitVec 32)) (x!17848 (_ BitVec 32))) (Undefined!360) (MissingVacant!360 (index!3611 (_ BitVec 32))) )
))
(declare-fun lt!82264 () SeekEntryResult!360)

(assert (=> b!161699 (= e!105734 (and (not (is-Undefined!360 lt!82264)) (is-MissingVacant!360 lt!82264) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6025 (_ BitVec 32)) SeekEntryResult!360)

(assert (=> b!161699 (= lt!82264 (seekEntryOrOpen!0 key!828 (_keys!5090 thiss!1248) (mask!7887 thiss!1248)))))

(declare-fun res!76612 () Bool)

(assert (=> start!16210 (=> (not res!76612) (not e!105734))))

(declare-fun valid!774 (LongMapFixedSize!1694) Bool)

(assert (=> start!16210 (= res!76612 (valid!774 thiss!1248))))

(assert (=> start!16210 e!105734))

(assert (=> start!16210 e!105730))

(assert (=> start!16210 true))

(declare-fun b!161700 () Bool)

(declare-fun e!105732 () Bool)

(assert (=> b!161700 (= e!105733 (and e!105732 mapRes!5897))))

(declare-fun condMapEmpty!5897 () Bool)

(declare-fun mapDefault!5897 () ValueCell!1393)

