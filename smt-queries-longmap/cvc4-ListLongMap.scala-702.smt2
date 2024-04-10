; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16720 () Bool)

(assert start!16720)

(declare-fun b!167805 () Bool)

(declare-fun b_free!4025 () Bool)

(declare-fun b_next!4025 () Bool)

(assert (=> b!167805 (= b_free!4025 (not b_next!4025))))

(declare-fun tp!14675 () Bool)

(declare-fun b_and!10439 () Bool)

(assert (=> b!167805 (= tp!14675 b_and!10439)))

(declare-fun b!167799 () Bool)

(declare-datatypes ((SeekEntryResult!487 0))(
  ( (MissingZero!487 (index!4116 (_ BitVec 32))) (Found!487 (index!4117 (_ BitVec 32))) (Intermediate!487 (undefined!1299 Bool) (index!4118 (_ BitVec 32)) (x!18555 (_ BitVec 32))) (Undefined!487) (MissingVacant!487 (index!4119 (_ BitVec 32))) )
))
(declare-fun lt!83881 () SeekEntryResult!487)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4749 0))(
  ( (V!4750 (val!1958 Int)) )
))
(declare-datatypes ((ValueCell!1570 0))(
  ( (ValueCellFull!1570 (v!3823 V!4749)) (EmptyCell!1570) )
))
(declare-datatypes ((array!6751 0))(
  ( (array!6752 (arr!3211 (Array (_ BitVec 32) (_ BitVec 64))) (size!3499 (_ BitVec 32))) )
))
(declare-datatypes ((array!6753 0))(
  ( (array!6754 (arr!3212 (Array (_ BitVec 32) ValueCell!1570)) (size!3500 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2048 0))(
  ( (LongMapFixedSize!2049 (defaultEntry!3466 Int) (mask!8219 (_ BitVec 32)) (extraKeys!3207 (_ BitVec 32)) (zeroValue!3309 V!4749) (minValue!3309 V!4749) (_size!1073 (_ BitVec 32)) (_keys!5291 array!6751) (_values!3449 array!6753) (_vacant!1073 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2048)

(declare-fun e!110247 () Bool)

(assert (=> b!167799 (= e!110247 (= (select (arr!3211 (_keys!5291 thiss!1248)) (index!4117 lt!83881)) key!828))))

(declare-fun b!167800 () Bool)

(declare-fun res!79837 () Bool)

(declare-fun e!110240 () Bool)

(assert (=> b!167800 (=> (not res!79837) (not e!110240))))

(assert (=> b!167800 (= res!79837 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167801 () Bool)

(declare-fun res!79835 () Bool)

(declare-fun e!110249 () Bool)

(assert (=> b!167801 (=> res!79835 e!110249)))

(assert (=> b!167801 (= res!79835 (or (not (= (size!3500 (_values!3449 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8219 thiss!1248)))) (not (= (size!3499 (_keys!5291 thiss!1248)) (size!3500 (_values!3449 thiss!1248)))) (bvslt (mask!8219 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3207 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3207 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167802 () Bool)

(declare-fun e!110245 () Bool)

(declare-fun e!110242 () Bool)

(declare-fun mapRes!6459 () Bool)

(assert (=> b!167802 (= e!110245 (and e!110242 mapRes!6459))))

(declare-fun condMapEmpty!6459 () Bool)

(declare-fun mapDefault!6459 () ValueCell!1570)

