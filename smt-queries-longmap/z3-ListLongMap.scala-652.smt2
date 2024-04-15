; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16264 () Bool)

(assert start!16264)

(declare-fun b!162083 () Bool)

(declare-fun b_free!3721 () Bool)

(declare-fun b_next!3721 () Bool)

(assert (=> b!162083 (= b_free!3721 (not b_next!3721))))

(declare-fun tp!13732 () Bool)

(declare-fun b_and!10109 () Bool)

(assert (=> b!162083 (= tp!13732 b_and!10109)))

(declare-fun b!162080 () Bool)

(declare-fun e!106142 () Bool)

(declare-datatypes ((SeekEntryResult!384 0))(
  ( (MissingZero!384 (index!3704 (_ BitVec 32))) (Found!384 (index!3705 (_ BitVec 32))) (Intermediate!384 (undefined!1196 Bool) (index!3706 (_ BitVec 32)) (x!17943 (_ BitVec 32))) (Undefined!384) (MissingVacant!384 (index!3707 (_ BitVec 32))) )
))
(declare-fun lt!82221 () SeekEntryResult!384)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!162080 (= e!106142 (and (not ((_ is Undefined!384) lt!82221)) (not ((_ is MissingVacant!384) lt!82221)) ((_ is MissingZero!384) lt!82221) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!4345 0))(
  ( (V!4346 (val!1806 Int)) )
))
(declare-datatypes ((ValueCell!1418 0))(
  ( (ValueCellFull!1418 (v!3665 V!4345)) (EmptyCell!1418) )
))
(declare-datatypes ((array!6105 0))(
  ( (array!6106 (arr!2896 (Array (_ BitVec 32) (_ BitVec 64))) (size!3181 (_ BitVec 32))) )
))
(declare-datatypes ((array!6107 0))(
  ( (array!6108 (arr!2897 (Array (_ BitVec 32) ValueCell!1418)) (size!3182 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1744 0))(
  ( (LongMapFixedSize!1745 (defaultEntry!3314 Int) (mask!7929 (_ BitVec 32)) (extraKeys!3055 (_ BitVec 32)) (zeroValue!3157 V!4345) (minValue!3157 V!4345) (_size!921 (_ BitVec 32)) (_keys!5114 array!6105) (_values!3297 array!6107) (_vacant!921 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1744)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6105 (_ BitVec 32)) SeekEntryResult!384)

(assert (=> b!162080 (= lt!82221 (seekEntryOrOpen!0 key!828 (_keys!5114 thiss!1248) (mask!7929 thiss!1248)))))

(declare-fun mapIsEmpty!5972 () Bool)

(declare-fun mapRes!5972 () Bool)

(assert (=> mapIsEmpty!5972 mapRes!5972))

(declare-fun res!76748 () Bool)

(assert (=> start!16264 (=> (not res!76748) (not e!106142))))

(declare-fun valid!791 (LongMapFixedSize!1744) Bool)

(assert (=> start!16264 (= res!76748 (valid!791 thiss!1248))))

(assert (=> start!16264 e!106142))

(declare-fun e!106146 () Bool)

(assert (=> start!16264 e!106146))

(assert (=> start!16264 true))

(declare-fun mapNonEmpty!5972 () Bool)

(declare-fun tp!13733 () Bool)

(declare-fun e!106145 () Bool)

(assert (=> mapNonEmpty!5972 (= mapRes!5972 (and tp!13733 e!106145))))

(declare-fun mapRest!5972 () (Array (_ BitVec 32) ValueCell!1418))

(declare-fun mapKey!5972 () (_ BitVec 32))

(declare-fun mapValue!5972 () ValueCell!1418)

(assert (=> mapNonEmpty!5972 (= (arr!2897 (_values!3297 thiss!1248)) (store mapRest!5972 mapKey!5972 mapValue!5972))))

(declare-fun b!162081 () Bool)

(declare-fun e!106144 () Bool)

(declare-fun tp_is_empty!3523 () Bool)

(assert (=> b!162081 (= e!106144 tp_is_empty!3523)))

(declare-fun b!162082 () Bool)

(declare-fun res!76749 () Bool)

(assert (=> b!162082 (=> (not res!76749) (not e!106142))))

(assert (=> b!162082 (= res!76749 (not (= key!828 (bvneg key!828))))))

(declare-fun e!106143 () Bool)

(declare-fun array_inv!1871 (array!6105) Bool)

(declare-fun array_inv!1872 (array!6107) Bool)

(assert (=> b!162083 (= e!106146 (and tp!13732 tp_is_empty!3523 (array_inv!1871 (_keys!5114 thiss!1248)) (array_inv!1872 (_values!3297 thiss!1248)) e!106143))))

(declare-fun b!162084 () Bool)

(assert (=> b!162084 (= e!106143 (and e!106144 mapRes!5972))))

(declare-fun condMapEmpty!5972 () Bool)

(declare-fun mapDefault!5972 () ValueCell!1418)

(assert (=> b!162084 (= condMapEmpty!5972 (= (arr!2897 (_values!3297 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1418)) mapDefault!5972)))))

(declare-fun b!162085 () Bool)

(assert (=> b!162085 (= e!106145 tp_is_empty!3523)))

(assert (= (and start!16264 res!76748) b!162082))

(assert (= (and b!162082 res!76749) b!162080))

(assert (= (and b!162084 condMapEmpty!5972) mapIsEmpty!5972))

(assert (= (and b!162084 (not condMapEmpty!5972)) mapNonEmpty!5972))

(assert (= (and mapNonEmpty!5972 ((_ is ValueCellFull!1418) mapValue!5972)) b!162085))

(assert (= (and b!162084 ((_ is ValueCellFull!1418) mapDefault!5972)) b!162081))

(assert (= b!162083 b!162084))

(assert (= start!16264 b!162083))

(declare-fun m!192811 () Bool)

(assert (=> b!162080 m!192811))

(declare-fun m!192813 () Bool)

(assert (=> start!16264 m!192813))

(declare-fun m!192815 () Bool)

(assert (=> mapNonEmpty!5972 m!192815))

(declare-fun m!192817 () Bool)

(assert (=> b!162083 m!192817))

(declare-fun m!192819 () Bool)

(assert (=> b!162083 m!192819))

(check-sat (not mapNonEmpty!5972) (not b_next!3721) (not b!162083) tp_is_empty!3523 (not start!16264) (not b!162080) b_and!10109)
(check-sat b_and!10109 (not b_next!3721))
