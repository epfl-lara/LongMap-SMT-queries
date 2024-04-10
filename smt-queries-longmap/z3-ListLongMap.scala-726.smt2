; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16950 () Bool)

(assert start!16950)

(declare-fun b!170407 () Bool)

(declare-fun b_free!4197 () Bool)

(declare-fun b_next!4197 () Bool)

(assert (=> b!170407 (= b_free!4197 (not b_next!4197))))

(declare-fun tp!15215 () Bool)

(declare-fun b_and!10611 () Bool)

(assert (=> b!170407 (= tp!15215 b_and!10611)))

(declare-fun b!170401 () Bool)

(declare-fun res!81008 () Bool)

(declare-fun e!112429 () Bool)

(assert (=> b!170401 (=> (not res!81008) (not e!112429))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170401 (= res!81008 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170402 () Bool)

(declare-fun e!112434 () Bool)

(declare-fun e!112431 () Bool)

(declare-fun mapRes!6740 () Bool)

(assert (=> b!170402 (= e!112434 (and e!112431 mapRes!6740))))

(declare-fun condMapEmpty!6740 () Bool)

(declare-datatypes ((V!4939 0))(
  ( (V!4940 (val!2029 Int)) )
))
(declare-datatypes ((ValueCell!1641 0))(
  ( (ValueCellFull!1641 (v!3894 V!4939)) (EmptyCell!1641) )
))
(declare-datatypes ((array!7047 0))(
  ( (array!7048 (arr!3353 (Array (_ BitVec 32) (_ BitVec 64))) (size!3646 (_ BitVec 32))) )
))
(declare-datatypes ((array!7049 0))(
  ( (array!7050 (arr!3354 (Array (_ BitVec 32) ValueCell!1641)) (size!3647 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2190 0))(
  ( (LongMapFixedSize!2191 (defaultEntry!3537 Int) (mask!8349 (_ BitVec 32)) (extraKeys!3278 (_ BitVec 32)) (zeroValue!3380 V!4939) (minValue!3380 V!4939) (_size!1144 (_ BitVec 32)) (_keys!5367 array!7047) (_values!3520 array!7049) (_vacant!1144 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2190)

(declare-fun mapDefault!6740 () ValueCell!1641)

(assert (=> b!170402 (= condMapEmpty!6740 (= (arr!3354 (_values!3520 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1641)) mapDefault!6740)))))

(declare-fun b!170403 () Bool)

(declare-fun res!81007 () Bool)

(assert (=> b!170403 (=> (not res!81007) (not e!112429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170403 (= res!81007 (validMask!0 (mask!8349 thiss!1248)))))

(declare-fun res!81009 () Bool)

(assert (=> start!16950 (=> (not res!81009) (not e!112429))))

(declare-fun valid!937 (LongMapFixedSize!2190) Bool)

(assert (=> start!16950 (= res!81009 (valid!937 thiss!1248))))

(assert (=> start!16950 e!112429))

(declare-fun e!112430 () Bool)

(assert (=> start!16950 e!112430))

(assert (=> start!16950 true))

(declare-fun b!170404 () Bool)

(assert (=> b!170404 (= e!112429 (and (= (size!3647 (_values!3520 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8349 thiss!1248))) (= (size!3646 (_keys!5367 thiss!1248)) (size!3647 (_values!3520 thiss!1248))) (bvsge (mask!8349 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3278 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3278 thiss!1248) #b00000000000000000000000000000011) (bvslt (bvor (extraKeys!3278 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6740 () Bool)

(declare-fun tp!15214 () Bool)

(declare-fun e!112433 () Bool)

(assert (=> mapNonEmpty!6740 (= mapRes!6740 (and tp!15214 e!112433))))

(declare-fun mapValue!6740 () ValueCell!1641)

(declare-fun mapRest!6740 () (Array (_ BitVec 32) ValueCell!1641))

(declare-fun mapKey!6740 () (_ BitVec 32))

(assert (=> mapNonEmpty!6740 (= (arr!3354 (_values!3520 thiss!1248)) (store mapRest!6740 mapKey!6740 mapValue!6740))))

(declare-fun b!170405 () Bool)

(declare-fun tp_is_empty!3969 () Bool)

(assert (=> b!170405 (= e!112433 tp_is_empty!3969)))

(declare-fun b!170406 () Bool)

(assert (=> b!170406 (= e!112431 tp_is_empty!3969)))

(declare-fun mapIsEmpty!6740 () Bool)

(assert (=> mapIsEmpty!6740 mapRes!6740))

(declare-fun array_inv!2145 (array!7047) Bool)

(declare-fun array_inv!2146 (array!7049) Bool)

(assert (=> b!170407 (= e!112430 (and tp!15215 tp_is_empty!3969 (array_inv!2145 (_keys!5367 thiss!1248)) (array_inv!2146 (_values!3520 thiss!1248)) e!112434))))

(assert (= (and start!16950 res!81009) b!170401))

(assert (= (and b!170401 res!81008) b!170403))

(assert (= (and b!170403 res!81007) b!170404))

(assert (= (and b!170402 condMapEmpty!6740) mapIsEmpty!6740))

(assert (= (and b!170402 (not condMapEmpty!6740)) mapNonEmpty!6740))

(get-info :version)

(assert (= (and mapNonEmpty!6740 ((_ is ValueCellFull!1641) mapValue!6740)) b!170405))

(assert (= (and b!170402 ((_ is ValueCellFull!1641) mapDefault!6740)) b!170406))

(assert (= b!170407 b!170402))

(assert (= start!16950 b!170407))

(declare-fun m!198933 () Bool)

(assert (=> b!170403 m!198933))

(declare-fun m!198935 () Bool)

(assert (=> start!16950 m!198935))

(declare-fun m!198937 () Bool)

(assert (=> mapNonEmpty!6740 m!198937))

(declare-fun m!198939 () Bool)

(assert (=> b!170407 m!198939))

(declare-fun m!198941 () Bool)

(assert (=> b!170407 m!198941))

(check-sat (not b_next!4197) (not b!170407) (not start!16950) b_and!10611 (not b!170403) tp_is_empty!3969 (not mapNonEmpty!6740))
(check-sat b_and!10611 (not b_next!4197))
