; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16114 () Bool)

(assert start!16114)

(declare-fun b!160290 () Bool)

(declare-fun b_free!3575 () Bool)

(declare-fun b_next!3575 () Bool)

(assert (=> b!160290 (= b_free!3575 (not b_next!3575))))

(declare-fun tp!13295 () Bool)

(declare-fun b_and!9989 () Bool)

(assert (=> b!160290 (= tp!13295 b_and!9989)))

(declare-fun b!160287 () Bool)

(declare-fun res!75871 () Bool)

(declare-fun e!104823 () Bool)

(assert (=> b!160287 (=> (not res!75871) (not e!104823))))

(declare-datatypes ((V!4149 0))(
  ( (V!4150 (val!1733 Int)) )
))
(declare-datatypes ((ValueCell!1345 0))(
  ( (ValueCellFull!1345 (v!3598 V!4149)) (EmptyCell!1345) )
))
(declare-datatypes ((array!5833 0))(
  ( (array!5834 (arr!2761 (Array (_ BitVec 32) (_ BitVec 64))) (size!3045 (_ BitVec 32))) )
))
(declare-datatypes ((array!5835 0))(
  ( (array!5836 (arr!2762 (Array (_ BitVec 32) ValueCell!1345)) (size!3046 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1598 0))(
  ( (LongMapFixedSize!1599 (defaultEntry!3241 Int) (mask!7807 (_ BitVec 32)) (extraKeys!2982 (_ BitVec 32)) (zeroValue!3084 V!4149) (minValue!3084 V!4149) (_size!848 (_ BitVec 32)) (_keys!5042 array!5833) (_values!3224 array!5835) (_vacant!848 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1598)

(assert (=> b!160287 (= res!75871 (and (= (size!3046 (_values!3224 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7807 thiss!1248))) (= (size!3045 (_keys!5042 thiss!1248)) (size!3046 (_values!3224 thiss!1248))) (bvsge (mask!7807 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2982 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2982 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!5753 () Bool)

(declare-fun mapRes!5753 () Bool)

(declare-fun tp!13294 () Bool)

(declare-fun e!104822 () Bool)

(assert (=> mapNonEmpty!5753 (= mapRes!5753 (and tp!13294 e!104822))))

(declare-fun mapKey!5753 () (_ BitVec 32))

(declare-fun mapValue!5753 () ValueCell!1345)

(declare-fun mapRest!5753 () (Array (_ BitVec 32) ValueCell!1345))

(assert (=> mapNonEmpty!5753 (= (arr!2762 (_values!3224 thiss!1248)) (store mapRest!5753 mapKey!5753 mapValue!5753))))

(declare-fun res!75872 () Bool)

(assert (=> start!16114 (=> (not res!75872) (not e!104823))))

(declare-fun valid!741 (LongMapFixedSize!1598) Bool)

(assert (=> start!16114 (= res!75872 (valid!741 thiss!1248))))

(assert (=> start!16114 e!104823))

(declare-fun e!104826 () Bool)

(assert (=> start!16114 e!104826))

(assert (=> start!16114 true))

(declare-fun mapIsEmpty!5753 () Bool)

(assert (=> mapIsEmpty!5753 mapRes!5753))

(declare-fun b!160288 () Bool)

(declare-fun res!75873 () Bool)

(assert (=> b!160288 (=> (not res!75873) (not e!104823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160288 (= res!75873 (validMask!0 (mask!7807 thiss!1248)))))

(declare-fun b!160289 () Bool)

(declare-fun res!75870 () Bool)

(assert (=> b!160289 (=> (not res!75870) (not e!104823))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160289 (= res!75870 (not (= key!828 (bvneg key!828))))))

(declare-fun tp_is_empty!3377 () Bool)

(declare-fun e!104824 () Bool)

(declare-fun array_inv!1759 (array!5833) Bool)

(declare-fun array_inv!1760 (array!5835) Bool)

(assert (=> b!160290 (= e!104826 (and tp!13295 tp_is_empty!3377 (array_inv!1759 (_keys!5042 thiss!1248)) (array_inv!1760 (_values!3224 thiss!1248)) e!104824))))

(declare-fun b!160291 () Bool)

(assert (=> b!160291 (= e!104822 tp_is_empty!3377)))

(declare-fun b!160292 () Bool)

(assert (=> b!160292 (= e!104823 false)))

(declare-fun lt!82075 () Bool)

(declare-datatypes ((List!1937 0))(
  ( (Nil!1934) (Cons!1933 (h!2546 (_ BitVec 64)) (t!6739 List!1937)) )
))
(declare-fun arrayNoDuplicates!0 (array!5833 (_ BitVec 32) List!1937) Bool)

(assert (=> b!160292 (= lt!82075 (arrayNoDuplicates!0 (_keys!5042 thiss!1248) #b00000000000000000000000000000000 Nil!1934))))

(declare-fun b!160293 () Bool)

(declare-fun res!75875 () Bool)

(assert (=> b!160293 (=> (not res!75875) (not e!104823))))

(declare-datatypes ((SeekEntryResult!327 0))(
  ( (MissingZero!327 (index!3476 (_ BitVec 32))) (Found!327 (index!3477 (_ BitVec 32))) (Intermediate!327 (undefined!1139 Bool) (index!3478 (_ BitVec 32)) (x!17687 (_ BitVec 32))) (Undefined!327) (MissingVacant!327 (index!3479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5833 (_ BitVec 32)) SeekEntryResult!327)

(assert (=> b!160293 (= res!75875 (is-Undefined!327 (seekEntryOrOpen!0 key!828 (_keys!5042 thiss!1248) (mask!7807 thiss!1248))))))

(declare-fun b!160294 () Bool)

(declare-fun res!75869 () Bool)

(assert (=> b!160294 (=> (not res!75869) (not e!104823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5833 (_ BitVec 32)) Bool)

(assert (=> b!160294 (= res!75869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5042 thiss!1248) (mask!7807 thiss!1248)))))

(declare-fun b!160295 () Bool)

(declare-fun e!104825 () Bool)

(assert (=> b!160295 (= e!104824 (and e!104825 mapRes!5753))))

(declare-fun condMapEmpty!5753 () Bool)

(declare-fun mapDefault!5753 () ValueCell!1345)

