; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16246 () Bool)

(assert start!16246)

(declare-fun b!162093 () Bool)

(declare-fun b_free!3707 () Bool)

(declare-fun b_next!3707 () Bool)

(assert (=> b!162093 (= b_free!3707 (not b_next!3707))))

(declare-fun tp!13691 () Bool)

(declare-fun b_and!10121 () Bool)

(assert (=> b!162093 (= tp!13691 b_and!10121)))

(declare-fun mapIsEmpty!5951 () Bool)

(declare-fun mapRes!5951 () Bool)

(assert (=> mapIsEmpty!5951 mapRes!5951))

(declare-fun b!162092 () Bool)

(declare-fun e!106107 () Bool)

(assert (=> b!162092 (= e!106107 false)))

(declare-datatypes ((SeekEntryResult!370 0))(
  ( (MissingZero!370 (index!3648 (_ BitVec 32))) (Found!370 (index!3649 (_ BitVec 32))) (Intermediate!370 (undefined!1182 Bool) (index!3650 (_ BitVec 32)) (x!17906 (_ BitVec 32))) (Undefined!370) (MissingVacant!370 (index!3651 (_ BitVec 32))) )
))
(declare-fun lt!82371 () SeekEntryResult!370)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4325 0))(
  ( (V!4326 (val!1799 Int)) )
))
(declare-fun v!309 () V!4325)

(declare-datatypes ((ValueCell!1411 0))(
  ( (ValueCellFull!1411 (v!3664 V!4325)) (EmptyCell!1411) )
))
(declare-datatypes ((array!6097 0))(
  ( (array!6098 (arr!2893 (Array (_ BitVec 32) (_ BitVec 64))) (size!3177 (_ BitVec 32))) )
))
(declare-datatypes ((array!6099 0))(
  ( (array!6100 (arr!2894 (Array (_ BitVec 32) ValueCell!1411)) (size!3178 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1730 0))(
  ( (LongMapFixedSize!1731 (defaultEntry!3307 Int) (mask!7917 (_ BitVec 32)) (extraKeys!3048 (_ BitVec 32)) (zeroValue!3150 V!4325) (minValue!3150 V!4325) (_size!914 (_ BitVec 32)) (_keys!5108 array!6097) (_values!3290 array!6099) (_vacant!914 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1730)

(declare-fun lt!82372 () Bool)

(declare-fun valid!786 (LongMapFixedSize!1730) Bool)

(declare-datatypes ((tuple2!2988 0))(
  ( (tuple2!2989 (_1!1505 Bool) (_2!1505 LongMapFixedSize!1730)) )
))
(declare-fun updateHelperNewKey!77 (LongMapFixedSize!1730 (_ BitVec 64) V!4325 (_ BitVec 32)) tuple2!2988)

(assert (=> b!162092 (= lt!82372 (valid!786 (_2!1505 (updateHelperNewKey!77 thiss!1248 key!828 v!309 (index!3651 lt!82371)))))))

(declare-fun tp_is_empty!3509 () Bool)

(declare-fun e!106110 () Bool)

(declare-fun e!106109 () Bool)

(declare-fun array_inv!1849 (array!6097) Bool)

(declare-fun array_inv!1850 (array!6099) Bool)

(assert (=> b!162093 (= e!106109 (and tp!13691 tp_is_empty!3509 (array_inv!1849 (_keys!5108 thiss!1248)) (array_inv!1850 (_values!3290 thiss!1248)) e!106110))))

(declare-fun b!162094 () Bool)

(declare-fun res!76793 () Bool)

(declare-fun e!106113 () Bool)

(assert (=> b!162094 (=> (not res!76793) (not e!106113))))

(assert (=> b!162094 (= res!76793 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162095 () Bool)

(assert (=> b!162095 (= e!106113 e!106107)))

(declare-fun res!76792 () Bool)

(assert (=> b!162095 (=> (not res!76792) (not e!106107))))

(assert (=> b!162095 (= res!76792 (and (not (is-Undefined!370 lt!82371)) (is-MissingVacant!370 lt!82371)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6097 (_ BitVec 32)) SeekEntryResult!370)

(assert (=> b!162095 (= lt!82371 (seekEntryOrOpen!0 key!828 (_keys!5108 thiss!1248) (mask!7917 thiss!1248)))))

(declare-fun b!162096 () Bool)

(declare-fun e!106111 () Bool)

(assert (=> b!162096 (= e!106110 (and e!106111 mapRes!5951))))

(declare-fun condMapEmpty!5951 () Bool)

(declare-fun mapDefault!5951 () ValueCell!1411)

