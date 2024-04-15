; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16246 () Bool)

(assert start!16246)

(declare-fun b!161903 () Bool)

(declare-fun b_free!3703 () Bool)

(declare-fun b_next!3703 () Bool)

(assert (=> b!161903 (= b_free!3703 (not b_next!3703))))

(declare-fun tp!13678 () Bool)

(declare-fun b_and!10091 () Bool)

(assert (=> b!161903 (= tp!13678 b_and!10091)))

(declare-fun b!161902 () Bool)

(declare-fun e!105966 () Bool)

(assert (=> b!161902 (= e!105966 false)))

(declare-fun lt!82179 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4321 0))(
  ( (V!4322 (val!1797 Int)) )
))
(declare-fun v!309 () V!4321)

(declare-datatypes ((SeekEntryResult!378 0))(
  ( (MissingZero!378 (index!3680 (_ BitVec 32))) (Found!378 (index!3681 (_ BitVec 32))) (Intermediate!378 (undefined!1190 Bool) (index!3682 (_ BitVec 32)) (x!17913 (_ BitVec 32))) (Undefined!378) (MissingVacant!378 (index!3683 (_ BitVec 32))) )
))
(declare-fun lt!82178 () SeekEntryResult!378)

(declare-datatypes ((ValueCell!1409 0))(
  ( (ValueCellFull!1409 (v!3656 V!4321)) (EmptyCell!1409) )
))
(declare-datatypes ((array!6069 0))(
  ( (array!6070 (arr!2878 (Array (_ BitVec 32) (_ BitVec 64))) (size!3163 (_ BitVec 32))) )
))
(declare-datatypes ((array!6071 0))(
  ( (array!6072 (arr!2879 (Array (_ BitVec 32) ValueCell!1409)) (size!3164 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1726 0))(
  ( (LongMapFixedSize!1727 (defaultEntry!3305 Int) (mask!7914 (_ BitVec 32)) (extraKeys!3046 (_ BitVec 32)) (zeroValue!3148 V!4321) (minValue!3148 V!4321) (_size!912 (_ BitVec 32)) (_keys!5105 array!6069) (_values!3288 array!6071) (_vacant!912 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1726)

(declare-fun valid!785 (LongMapFixedSize!1726) Bool)

(declare-datatypes ((tuple2!2962 0))(
  ( (tuple2!2963 (_1!1492 Bool) (_2!1492 LongMapFixedSize!1726)) )
))
(declare-fun updateHelperNewKey!77 (LongMapFixedSize!1726 (_ BitVec 64) V!4321 (_ BitVec 32)) tuple2!2962)

(assert (=> b!161902 (= lt!82179 (valid!785 (_2!1492 (updateHelperNewKey!77 thiss!1248 key!828 v!309 (index!3683 lt!82178)))))))

(declare-fun mapNonEmpty!5945 () Bool)

(declare-fun mapRes!5945 () Bool)

(declare-fun tp!13679 () Bool)

(declare-fun e!105967 () Bool)

(assert (=> mapNonEmpty!5945 (= mapRes!5945 (and tp!13679 e!105967))))

(declare-fun mapValue!5945 () ValueCell!1409)

(declare-fun mapKey!5945 () (_ BitVec 32))

(declare-fun mapRest!5945 () (Array (_ BitVec 32) ValueCell!1409))

(assert (=> mapNonEmpty!5945 (= (arr!2879 (_values!3288 thiss!1248)) (store mapRest!5945 mapKey!5945 mapValue!5945))))

(declare-fun res!76678 () Bool)

(declare-fun e!105970 () Bool)

(assert (=> start!16246 (=> (not res!76678) (not e!105970))))

(assert (=> start!16246 (= res!76678 (valid!785 thiss!1248))))

(assert (=> start!16246 e!105970))

(declare-fun e!105964 () Bool)

(assert (=> start!16246 e!105964))

(assert (=> start!16246 true))

(declare-fun tp_is_empty!3505 () Bool)

(assert (=> start!16246 tp_is_empty!3505))

(declare-fun e!105968 () Bool)

(declare-fun array_inv!1861 (array!6069) Bool)

(declare-fun array_inv!1862 (array!6071) Bool)

(assert (=> b!161903 (= e!105964 (and tp!13678 tp_is_empty!3505 (array_inv!1861 (_keys!5105 thiss!1248)) (array_inv!1862 (_values!3288 thiss!1248)) e!105968))))

(declare-fun b!161904 () Bool)

(declare-fun e!105969 () Bool)

(assert (=> b!161904 (= e!105969 tp_is_empty!3505)))

(declare-fun b!161905 () Bool)

(assert (=> b!161905 (= e!105967 tp_is_empty!3505)))

(declare-fun b!161906 () Bool)

(assert (=> b!161906 (= e!105970 e!105966)))

(declare-fun res!76680 () Bool)

(assert (=> b!161906 (=> (not res!76680) (not e!105966))))

(get-info :version)

(assert (=> b!161906 (= res!76680 (and (not ((_ is Undefined!378) lt!82178)) ((_ is MissingVacant!378) lt!82178)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6069 (_ BitVec 32)) SeekEntryResult!378)

(assert (=> b!161906 (= lt!82178 (seekEntryOrOpen!0 key!828 (_keys!5105 thiss!1248) (mask!7914 thiss!1248)))))

(declare-fun mapIsEmpty!5945 () Bool)

(assert (=> mapIsEmpty!5945 mapRes!5945))

(declare-fun b!161907 () Bool)

(declare-fun res!76679 () Bool)

(assert (=> b!161907 (=> (not res!76679) (not e!105970))))

(assert (=> b!161907 (= res!76679 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161908 () Bool)

(assert (=> b!161908 (= e!105968 (and e!105969 mapRes!5945))))

(declare-fun condMapEmpty!5945 () Bool)

(declare-fun mapDefault!5945 () ValueCell!1409)

(assert (=> b!161908 (= condMapEmpty!5945 (= (arr!2879 (_values!3288 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1409)) mapDefault!5945)))))

(assert (= (and start!16246 res!76678) b!161907))

(assert (= (and b!161907 res!76679) b!161906))

(assert (= (and b!161906 res!76680) b!161902))

(assert (= (and b!161908 condMapEmpty!5945) mapIsEmpty!5945))

(assert (= (and b!161908 (not condMapEmpty!5945)) mapNonEmpty!5945))

(assert (= (and mapNonEmpty!5945 ((_ is ValueCellFull!1409) mapValue!5945)) b!161905))

(assert (= (and b!161908 ((_ is ValueCellFull!1409) mapDefault!5945)) b!161904))

(assert (= b!161903 b!161908))

(assert (= start!16246 b!161903))

(declare-fun m!192697 () Bool)

(assert (=> b!161903 m!192697))

(declare-fun m!192699 () Bool)

(assert (=> b!161903 m!192699))

(declare-fun m!192701 () Bool)

(assert (=> mapNonEmpty!5945 m!192701))

(declare-fun m!192703 () Bool)

(assert (=> start!16246 m!192703))

(declare-fun m!192705 () Bool)

(assert (=> b!161906 m!192705))

(declare-fun m!192707 () Bool)

(assert (=> b!161902 m!192707))

(declare-fun m!192709 () Bool)

(assert (=> b!161902 m!192709))

(check-sat (not b_next!3703) b_and!10091 (not b!161902) tp_is_empty!3505 (not start!16246) (not b!161903) (not mapNonEmpty!5945) (not b!161906))
(check-sat b_and!10091 (not b_next!3703))
