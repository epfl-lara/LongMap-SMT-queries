; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21590 () Bool)

(assert start!21590)

(declare-fun b!216377 () Bool)

(declare-fun b_free!5753 () Bool)

(declare-fun b_next!5753 () Bool)

(assert (=> b!216377 (= b_free!5753 (not b_next!5753))))

(declare-fun tp!20391 () Bool)

(declare-fun b_and!12643 () Bool)

(assert (=> b!216377 (= tp!20391 b_and!12643)))

(declare-fun b!216374 () Bool)

(declare-fun res!105807 () Bool)

(declare-fun e!140777 () Bool)

(assert (=> b!216374 (=> (not res!105807) (not e!140777))))

(declare-datatypes ((V!7133 0))(
  ( (V!7134 (val!2852 Int)) )
))
(declare-datatypes ((ValueCell!2464 0))(
  ( (ValueCellFull!2464 (v!4870 V!7133)) (EmptyCell!2464) )
))
(declare-datatypes ((array!10467 0))(
  ( (array!10468 (arr!4956 (Array (_ BitVec 32) ValueCell!2464)) (size!5288 (_ BitVec 32))) )
))
(declare-datatypes ((array!10469 0))(
  ( (array!10470 (arr!4957 (Array (_ BitVec 32) (_ BitVec 64))) (size!5289 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2828 0))(
  ( (LongMapFixedSize!2829 (defaultEntry!4064 Int) (mask!9796 (_ BitVec 32)) (extraKeys!3801 (_ BitVec 32)) (zeroValue!3905 V!7133) (minValue!3905 V!7133) (_size!1463 (_ BitVec 32)) (_keys!6111 array!10469) (_values!4047 array!10467) (_vacant!1463 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2828)

(declare-datatypes ((List!3146 0))(
  ( (Nil!3143) (Cons!3142 (h!3789 (_ BitVec 64)) (t!8101 List!3146)) )
))
(declare-fun arrayNoDuplicates!0 (array!10469 (_ BitVec 32) List!3146) Bool)

(assert (=> b!216374 (= res!105807 (arrayNoDuplicates!0 (_keys!6111 thiss!1504) #b00000000000000000000000000000000 Nil!3143))))

(declare-fun b!216375 () Bool)

(declare-fun e!140776 () Bool)

(assert (=> b!216375 (= e!140776 e!140777)))

(declare-fun res!105810 () Bool)

(assert (=> b!216375 (=> (not res!105810) (not e!140777))))

(declare-datatypes ((SeekEntryResult!744 0))(
  ( (MissingZero!744 (index!5146 (_ BitVec 32))) (Found!744 (index!5147 (_ BitVec 32))) (Intermediate!744 (undefined!1556 Bool) (index!5148 (_ BitVec 32)) (x!22624 (_ BitVec 32))) (Undefined!744) (MissingVacant!744 (index!5149 (_ BitVec 32))) )
))
(declare-fun lt!111147 () SeekEntryResult!744)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216375 (= res!105810 (or (= lt!111147 (MissingZero!744 index!297)) (= lt!111147 (MissingVacant!744 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10469 (_ BitVec 32)) SeekEntryResult!744)

(assert (=> b!216375 (= lt!111147 (seekEntryOrOpen!0 key!932 (_keys!6111 thiss!1504) (mask!9796 thiss!1504)))))

(declare-fun b!216376 () Bool)

(declare-fun e!140781 () Bool)

(declare-fun tp_is_empty!5615 () Bool)

(assert (=> b!216376 (= e!140781 tp_is_empty!5615)))

(declare-fun e!140780 () Bool)

(declare-fun e!140782 () Bool)

(declare-fun array_inv!3279 (array!10469) Bool)

(declare-fun array_inv!3280 (array!10467) Bool)

(assert (=> b!216377 (= e!140782 (and tp!20391 tp_is_empty!5615 (array_inv!3279 (_keys!6111 thiss!1504)) (array_inv!3280 (_values!4047 thiss!1504)) e!140780))))

(declare-fun res!105812 () Bool)

(assert (=> start!21590 (=> (not res!105812) (not e!140776))))

(declare-fun valid!1149 (LongMapFixedSize!2828) Bool)

(assert (=> start!21590 (= res!105812 (valid!1149 thiss!1504))))

(assert (=> start!21590 e!140776))

(assert (=> start!21590 e!140782))

(assert (=> start!21590 true))

(declare-fun b!216378 () Bool)

(declare-fun e!140778 () Bool)

(declare-fun mapRes!9582 () Bool)

(assert (=> b!216378 (= e!140780 (and e!140778 mapRes!9582))))

(declare-fun condMapEmpty!9582 () Bool)

(declare-fun mapDefault!9582 () ValueCell!2464)

