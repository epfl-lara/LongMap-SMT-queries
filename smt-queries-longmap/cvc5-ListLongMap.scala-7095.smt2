; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90016 () Bool)

(assert start!90016)

(declare-fun b!1030747 () Bool)

(declare-fun b_free!20623 () Bool)

(declare-fun b_next!20623 () Bool)

(assert (=> b!1030747 (= b_free!20623 (not b_next!20623))))

(declare-fun tp!72940 () Bool)

(declare-fun b_and!33013 () Bool)

(assert (=> b!1030747 (= tp!72940 b_and!33013)))

(declare-fun res!689235 () Bool)

(declare-fun e!582090 () Bool)

(assert (=> start!90016 (=> (not res!689235) (not e!582090))))

(declare-datatypes ((V!37331 0))(
  ( (V!37332 (val!12222 Int)) )
))
(declare-datatypes ((ValueCell!11468 0))(
  ( (ValueCellFull!11468 (v!14799 V!37331)) (EmptyCell!11468) )
))
(declare-datatypes ((array!64750 0))(
  ( (array!64751 (arr!31177 (Array (_ BitVec 32) (_ BitVec 64))) (size!31694 (_ BitVec 32))) )
))
(declare-datatypes ((array!64752 0))(
  ( (array!64753 (arr!31178 (Array (_ BitVec 32) ValueCell!11468)) (size!31695 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5530 0))(
  ( (LongMapFixedSize!5531 (defaultEntry!6139 Int) (mask!29923 (_ BitVec 32)) (extraKeys!5871 (_ BitVec 32)) (zeroValue!5975 V!37331) (minValue!5975 V!37331) (_size!2820 (_ BitVec 32)) (_keys!11312 array!64750) (_values!6162 array!64752) (_vacant!2820 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5530)

(declare-fun valid!2093 (LongMapFixedSize!5530) Bool)

(assert (=> start!90016 (= res!689235 (valid!2093 thiss!1427))))

(assert (=> start!90016 e!582090))

(declare-fun e!582092 () Bool)

(assert (=> start!90016 e!582092))

(assert (=> start!90016 true))

(declare-fun tp_is_empty!24343 () Bool)

(declare-fun e!582093 () Bool)

(declare-fun array_inv!24133 (array!64750) Bool)

(declare-fun array_inv!24134 (array!64752) Bool)

(assert (=> b!1030747 (= e!582092 (and tp!72940 tp_is_empty!24343 (array_inv!24133 (_keys!11312 thiss!1427)) (array_inv!24134 (_values!6162 thiss!1427)) e!582093))))

(declare-fun b!1030748 () Bool)

(declare-fun e!582087 () Bool)

(assert (=> b!1030748 (= e!582090 e!582087)))

(declare-fun res!689232 () Bool)

(assert (=> b!1030748 (=> (not res!689232) (not e!582087))))

(declare-datatypes ((SeekEntryResult!9692 0))(
  ( (MissingZero!9692 (index!41139 (_ BitVec 32))) (Found!9692 (index!41140 (_ BitVec 32))) (Intermediate!9692 (undefined!10504 Bool) (index!41141 (_ BitVec 32)) (x!91744 (_ BitVec 32))) (Undefined!9692) (MissingVacant!9692 (index!41142 (_ BitVec 32))) )
))
(declare-fun lt!454779 () SeekEntryResult!9692)

(assert (=> b!1030748 (= res!689232 (is-Found!9692 lt!454779))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64750 (_ BitVec 32)) SeekEntryResult!9692)

(assert (=> b!1030748 (= lt!454779 (seekEntry!0 key!909 (_keys!11312 thiss!1427) (mask!29923 thiss!1427)))))

(declare-fun b!1030749 () Bool)

(declare-fun res!689237 () Bool)

(declare-fun e!582088 () Bool)

(assert (=> b!1030749 (=> res!689237 e!582088)))

(declare-datatypes ((Unit!33669 0))(
  ( (Unit!33670) )
))
(declare-datatypes ((tuple2!15596 0))(
  ( (tuple2!15597 (_1!7809 Unit!33669) (_2!7809 LongMapFixedSize!5530)) )
))
(declare-fun lt!454780 () tuple2!15596)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030749 (= res!689237 (not (validMask!0 (mask!29923 (_2!7809 lt!454780)))))))

(declare-fun b!1030750 () Bool)

(declare-fun e!582086 () Bool)

(declare-fun mapRes!37968 () Bool)

(assert (=> b!1030750 (= e!582093 (and e!582086 mapRes!37968))))

(declare-fun condMapEmpty!37968 () Bool)

(declare-fun mapDefault!37968 () ValueCell!11468)

