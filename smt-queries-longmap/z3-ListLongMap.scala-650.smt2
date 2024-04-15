; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16252 () Bool)

(assert start!16252)

(declare-fun b!161970 () Bool)

(declare-fun b_free!3709 () Bool)

(declare-fun b_next!3709 () Bool)

(assert (=> b!161970 (= b_free!3709 (not b_next!3709))))

(declare-fun tp!13697 () Bool)

(declare-fun b_and!10097 () Bool)

(assert (=> b!161970 (= tp!13697 b_and!10097)))

(declare-fun mapNonEmpty!5954 () Bool)

(declare-fun mapRes!5954 () Bool)

(declare-fun tp!13696 () Bool)

(declare-fun e!106030 () Bool)

(assert (=> mapNonEmpty!5954 (= mapRes!5954 (and tp!13696 e!106030))))

(declare-fun mapKey!5954 () (_ BitVec 32))

(declare-datatypes ((V!4329 0))(
  ( (V!4330 (val!1800 Int)) )
))
(declare-datatypes ((ValueCell!1412 0))(
  ( (ValueCellFull!1412 (v!3659 V!4329)) (EmptyCell!1412) )
))
(declare-fun mapRest!5954 () (Array (_ BitVec 32) ValueCell!1412))

(declare-fun mapValue!5954 () ValueCell!1412)

(declare-datatypes ((array!6081 0))(
  ( (array!6082 (arr!2884 (Array (_ BitVec 32) (_ BitVec 64))) (size!3169 (_ BitVec 32))) )
))
(declare-datatypes ((array!6083 0))(
  ( (array!6084 (arr!2885 (Array (_ BitVec 32) ValueCell!1412)) (size!3170 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1732 0))(
  ( (LongMapFixedSize!1733 (defaultEntry!3308 Int) (mask!7919 (_ BitVec 32)) (extraKeys!3049 (_ BitVec 32)) (zeroValue!3151 V!4329) (minValue!3151 V!4329) (_size!915 (_ BitVec 32)) (_keys!5108 array!6081) (_values!3291 array!6083) (_vacant!915 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1732)

(assert (=> mapNonEmpty!5954 (= (arr!2885 (_values!3291 thiss!1248)) (store mapRest!5954 mapKey!5954 mapValue!5954))))

(declare-fun b!161965 () Bool)

(declare-fun e!106029 () Bool)

(declare-fun e!106033 () Bool)

(assert (=> b!161965 (= e!106029 (and e!106033 mapRes!5954))))

(declare-fun condMapEmpty!5954 () Bool)

(declare-fun mapDefault!5954 () ValueCell!1412)

(assert (=> b!161965 (= condMapEmpty!5954 (= (arr!2885 (_values!3291 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1412)) mapDefault!5954)))))

(declare-fun b!161966 () Bool)

(declare-fun e!106032 () Bool)

(declare-fun e!106028 () Bool)

(assert (=> b!161966 (= e!106032 e!106028)))

(declare-fun res!76707 () Bool)

(assert (=> b!161966 (=> (not res!76707) (not e!106028))))

(declare-datatypes ((SeekEntryResult!380 0))(
  ( (MissingZero!380 (index!3688 (_ BitVec 32))) (Found!380 (index!3689 (_ BitVec 32))) (Intermediate!380 (undefined!1192 Bool) (index!3690 (_ BitVec 32)) (x!17923 (_ BitVec 32))) (Undefined!380) (MissingVacant!380 (index!3691 (_ BitVec 32))) )
))
(declare-fun lt!82196 () SeekEntryResult!380)

(get-info :version)

(assert (=> b!161966 (= res!76707 (and (not ((_ is Undefined!380) lt!82196)) ((_ is MissingVacant!380) lt!82196)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6081 (_ BitVec 32)) SeekEntryResult!380)

(assert (=> b!161966 (= lt!82196 (seekEntryOrOpen!0 key!828 (_keys!5108 thiss!1248) (mask!7919 thiss!1248)))))

(declare-fun b!161967 () Bool)

(assert (=> b!161967 (= e!106028 false)))

(declare-fun lt!82197 () Bool)

(declare-fun v!309 () V!4329)

(declare-fun valid!787 (LongMapFixedSize!1732) Bool)

(declare-datatypes ((tuple2!2966 0))(
  ( (tuple2!2967 (_1!1494 Bool) (_2!1494 LongMapFixedSize!1732)) )
))
(declare-fun updateHelperNewKey!79 (LongMapFixedSize!1732 (_ BitVec 64) V!4329 (_ BitVec 32)) tuple2!2966)

(assert (=> b!161967 (= lt!82197 (valid!787 (_2!1494 (updateHelperNewKey!79 thiss!1248 key!828 v!309 (index!3691 lt!82196)))))))

(declare-fun b!161968 () Bool)

(declare-fun tp_is_empty!3511 () Bool)

(assert (=> b!161968 (= e!106030 tp_is_empty!3511)))

(declare-fun res!76705 () Bool)

(assert (=> start!16252 (=> (not res!76705) (not e!106032))))

(assert (=> start!16252 (= res!76705 (valid!787 thiss!1248))))

(assert (=> start!16252 e!106032))

(declare-fun e!106031 () Bool)

(assert (=> start!16252 e!106031))

(assert (=> start!16252 true))

(assert (=> start!16252 tp_is_empty!3511))

(declare-fun b!161969 () Bool)

(assert (=> b!161969 (= e!106033 tp_is_empty!3511)))

(declare-fun array_inv!1863 (array!6081) Bool)

(declare-fun array_inv!1864 (array!6083) Bool)

(assert (=> b!161970 (= e!106031 (and tp!13697 tp_is_empty!3511 (array_inv!1863 (_keys!5108 thiss!1248)) (array_inv!1864 (_values!3291 thiss!1248)) e!106029))))

(declare-fun mapIsEmpty!5954 () Bool)

(assert (=> mapIsEmpty!5954 mapRes!5954))

(declare-fun b!161971 () Bool)

(declare-fun res!76706 () Bool)

(assert (=> b!161971 (=> (not res!76706) (not e!106032))))

(assert (=> b!161971 (= res!76706 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16252 res!76705) b!161971))

(assert (= (and b!161971 res!76706) b!161966))

(assert (= (and b!161966 res!76707) b!161967))

(assert (= (and b!161965 condMapEmpty!5954) mapIsEmpty!5954))

(assert (= (and b!161965 (not condMapEmpty!5954)) mapNonEmpty!5954))

(assert (= (and mapNonEmpty!5954 ((_ is ValueCellFull!1412) mapValue!5954)) b!161968))

(assert (= (and b!161965 ((_ is ValueCellFull!1412) mapDefault!5954)) b!161969))

(assert (= b!161970 b!161965))

(assert (= start!16252 b!161970))

(declare-fun m!192739 () Bool)

(assert (=> start!16252 m!192739))

(declare-fun m!192741 () Bool)

(assert (=> mapNonEmpty!5954 m!192741))

(declare-fun m!192743 () Bool)

(assert (=> b!161967 m!192743))

(declare-fun m!192745 () Bool)

(assert (=> b!161967 m!192745))

(declare-fun m!192747 () Bool)

(assert (=> b!161966 m!192747))

(declare-fun m!192749 () Bool)

(assert (=> b!161970 m!192749))

(declare-fun m!192751 () Bool)

(assert (=> b!161970 m!192751))

(check-sat (not start!16252) b_and!10097 (not mapNonEmpty!5954) (not b!161966) tp_is_empty!3511 (not b!161967) (not b!161970) (not b_next!3709))
(check-sat b_and!10097 (not b_next!3709))
