; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16266 () Bool)

(assert start!16266)

(declare-fun b!162281 () Bool)

(declare-fun b_free!3727 () Bool)

(declare-fun b_next!3727 () Bool)

(assert (=> b!162281 (= b_free!3727 (not b_next!3727))))

(declare-fun tp!13750 () Bool)

(declare-fun b_and!10141 () Bool)

(assert (=> b!162281 (= tp!13750 b_and!10141)))

(declare-fun mapNonEmpty!5981 () Bool)

(declare-fun mapRes!5981 () Bool)

(declare-fun tp!13751 () Bool)

(declare-fun e!106298 () Bool)

(assert (=> mapNonEmpty!5981 (= mapRes!5981 (and tp!13751 e!106298))))

(declare-datatypes ((V!4353 0))(
  ( (V!4354 (val!1809 Int)) )
))
(declare-datatypes ((ValueCell!1421 0))(
  ( (ValueCellFull!1421 (v!3674 V!4353)) (EmptyCell!1421) )
))
(declare-fun mapValue!5981 () ValueCell!1421)

(declare-fun mapRest!5981 () (Array (_ BitVec 32) ValueCell!1421))

(declare-datatypes ((array!6137 0))(
  ( (array!6138 (arr!2913 (Array (_ BitVec 32) (_ BitVec 64))) (size!3197 (_ BitVec 32))) )
))
(declare-datatypes ((array!6139 0))(
  ( (array!6140 (arr!2914 (Array (_ BitVec 32) ValueCell!1421)) (size!3198 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1750 0))(
  ( (LongMapFixedSize!1751 (defaultEntry!3317 Int) (mask!7935 (_ BitVec 32)) (extraKeys!3058 (_ BitVec 32)) (zeroValue!3160 V!4353) (minValue!3160 V!4353) (_size!924 (_ BitVec 32)) (_keys!5118 array!6137) (_values!3300 array!6139) (_vacant!924 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1750)

(declare-fun mapKey!5981 () (_ BitVec 32))

(assert (=> mapNonEmpty!5981 (= (arr!2914 (_values!3300 thiss!1248)) (store mapRest!5981 mapKey!5981 mapValue!5981))))

(declare-fun e!106301 () Bool)

(declare-fun tp_is_empty!3529 () Bool)

(declare-fun e!106300 () Bool)

(declare-fun array_inv!1863 (array!6137) Bool)

(declare-fun array_inv!1864 (array!6139) Bool)

(assert (=> b!162281 (= e!106301 (and tp!13750 tp_is_empty!3529 (array_inv!1863 (_keys!5118 thiss!1248)) (array_inv!1864 (_values!3300 thiss!1248)) e!106300))))

(declare-fun b!162282 () Bool)

(declare-fun e!106302 () Bool)

(declare-datatypes ((SeekEntryResult!378 0))(
  ( (MissingZero!378 (index!3680 (_ BitVec 32))) (Found!378 (index!3681 (_ BitVec 32))) (Intermediate!378 (undefined!1190 Bool) (index!3682 (_ BitVec 32)) (x!17946 (_ BitVec 32))) (Undefined!378) (MissingVacant!378 (index!3683 (_ BitVec 32))) )
))
(declare-fun lt!82411 () SeekEntryResult!378)

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162282 (= e!106302 (and (not (is-Undefined!378 lt!82411)) (not (is-MissingVacant!378 lt!82411)) (is-MissingZero!378 lt!82411) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6137 (_ BitVec 32)) SeekEntryResult!378)

(assert (=> b!162282 (= lt!82411 (seekEntryOrOpen!0 key!828 (_keys!5118 thiss!1248) (mask!7935 thiss!1248)))))

(declare-fun mapIsEmpty!5981 () Bool)

(assert (=> mapIsEmpty!5981 mapRes!5981))

(declare-fun b!162283 () Bool)

(declare-fun e!106299 () Bool)

(assert (=> b!162283 (= e!106300 (and e!106299 mapRes!5981))))

(declare-fun condMapEmpty!5981 () Bool)

(declare-fun mapDefault!5981 () ValueCell!1421)

