; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21336 () Bool)

(assert start!21336)

(declare-fun b!214620 () Bool)

(declare-fun b_free!5683 () Bool)

(declare-fun b_next!5683 () Bool)

(assert (=> b!214620 (= b_free!5683 (not b_next!5683))))

(declare-fun tp!20142 () Bool)

(declare-fun b_and!12587 () Bool)

(assert (=> b!214620 (= tp!20142 b_and!12587)))

(declare-fun res!105053 () Bool)

(declare-fun e!139582 () Bool)

(assert (=> start!21336 (=> (not res!105053) (not e!139582))))

(declare-datatypes ((V!7041 0))(
  ( (V!7042 (val!2817 Int)) )
))
(declare-datatypes ((ValueCell!2429 0))(
  ( (ValueCellFull!2429 (v!4836 V!7041)) (EmptyCell!2429) )
))
(declare-datatypes ((array!10303 0))(
  ( (array!10304 (arr!4885 (Array (_ BitVec 32) ValueCell!2429)) (size!5212 (_ BitVec 32))) )
))
(declare-datatypes ((array!10305 0))(
  ( (array!10306 (arr!4886 (Array (_ BitVec 32) (_ BitVec 64))) (size!5213 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2758 0))(
  ( (LongMapFixedSize!2759 (defaultEntry!4029 Int) (mask!9695 (_ BitVec 32)) (extraKeys!3766 (_ BitVec 32)) (zeroValue!3870 V!7041) (minValue!3870 V!7041) (_size!1428 (_ BitVec 32)) (_keys!6048 array!10305) (_values!4012 array!10303) (_vacant!1428 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2758)

(declare-fun valid!1148 (LongMapFixedSize!2758) Bool)

(assert (=> start!21336 (= res!105053 (valid!1148 thiss!1504))))

(assert (=> start!21336 e!139582))

(declare-fun e!139583 () Bool)

(assert (=> start!21336 e!139583))

(assert (=> start!21336 true))

(declare-fun b!214616 () Bool)

(declare-fun res!105054 () Bool)

(assert (=> b!214616 (=> (not res!105054) (not e!139582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214616 (= res!105054 (validMask!0 (mask!9695 thiss!1504)))))

(declare-fun b!214617 () Bool)

(declare-fun e!139584 () Bool)

(declare-fun tp_is_empty!5545 () Bool)

(assert (=> b!214617 (= e!139584 tp_is_empty!5545)))

(declare-fun b!214618 () Bool)

(declare-fun e!139587 () Bool)

(assert (=> b!214618 (= e!139587 tp_is_empty!5545)))

(declare-fun mapIsEmpty!9439 () Bool)

(declare-fun mapRes!9439 () Bool)

(assert (=> mapIsEmpty!9439 mapRes!9439))

(declare-fun b!214619 () Bool)

(declare-fun res!105055 () Bool)

(assert (=> b!214619 (=> (not res!105055) (not e!139582))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!709 0))(
  ( (MissingZero!709 (index!5006 (_ BitVec 32))) (Found!709 (index!5007 (_ BitVec 32))) (Intermediate!709 (undefined!1521 Bool) (index!5008 (_ BitVec 32)) (x!22368 (_ BitVec 32))) (Undefined!709) (MissingVacant!709 (index!5009 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10305 (_ BitVec 32)) SeekEntryResult!709)

(assert (=> b!214619 (= res!105055 (not (= (seekEntryOrOpen!0 key!932 (_keys!6048 thiss!1504) (mask!9695 thiss!1504)) (MissingZero!709 index!297))))))

(declare-fun e!139586 () Bool)

(declare-fun array_inv!3211 (array!10305) Bool)

(declare-fun array_inv!3212 (array!10303) Bool)

(assert (=> b!214620 (= e!139583 (and tp!20142 tp_is_empty!5545 (array_inv!3211 (_keys!6048 thiss!1504)) (array_inv!3212 (_values!4012 thiss!1504)) e!139586))))

(declare-fun b!214621 () Bool)

(assert (=> b!214621 (= e!139586 (and e!139584 mapRes!9439))))

(declare-fun condMapEmpty!9439 () Bool)

(declare-fun mapDefault!9439 () ValueCell!2429)

(assert (=> b!214621 (= condMapEmpty!9439 (= (arr!4885 (_values!4012 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2429)) mapDefault!9439)))))

(declare-fun b!214622 () Bool)

(declare-fun res!105052 () Bool)

(assert (=> b!214622 (=> (not res!105052) (not e!139582))))

(assert (=> b!214622 (= res!105052 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214623 () Bool)

(assert (=> b!214623 (= e!139582 (bvslt (mask!9695 thiss!1504) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9439 () Bool)

(declare-fun tp!20143 () Bool)

(assert (=> mapNonEmpty!9439 (= mapRes!9439 (and tp!20143 e!139587))))

(declare-fun mapKey!9439 () (_ BitVec 32))

(declare-fun mapValue!9439 () ValueCell!2429)

(declare-fun mapRest!9439 () (Array (_ BitVec 32) ValueCell!2429))

(assert (=> mapNonEmpty!9439 (= (arr!4885 (_values!4012 thiss!1504)) (store mapRest!9439 mapKey!9439 mapValue!9439))))

(assert (= (and start!21336 res!105053) b!214622))

(assert (= (and b!214622 res!105052) b!214619))

(assert (= (and b!214619 res!105055) b!214616))

(assert (= (and b!214616 res!105054) b!214623))

(assert (= (and b!214621 condMapEmpty!9439) mapIsEmpty!9439))

(assert (= (and b!214621 (not condMapEmpty!9439)) mapNonEmpty!9439))

(get-info :version)

(assert (= (and mapNonEmpty!9439 ((_ is ValueCellFull!2429) mapValue!9439)) b!214618))

(assert (= (and b!214621 ((_ is ValueCellFull!2429) mapDefault!9439)) b!214617))

(assert (= b!214620 b!214621))

(assert (= start!21336 b!214620))

(declare-fun m!242371 () Bool)

(assert (=> b!214619 m!242371))

(declare-fun m!242373 () Bool)

(assert (=> mapNonEmpty!9439 m!242373))

(declare-fun m!242375 () Bool)

(assert (=> b!214616 m!242375))

(declare-fun m!242377 () Bool)

(assert (=> start!21336 m!242377))

(declare-fun m!242379 () Bool)

(assert (=> b!214620 m!242379))

(declare-fun m!242381 () Bool)

(assert (=> b!214620 m!242381))

(check-sat (not b!214616) (not b!214619) tp_is_empty!5545 (not start!21336) (not mapNonEmpty!9439) (not b_next!5683) b_and!12587 (not b!214620))
(check-sat b_and!12587 (not b_next!5683))
(get-model)

(declare-fun d!58405 () Bool)

(assert (=> d!58405 (= (array_inv!3211 (_keys!6048 thiss!1504)) (bvsge (size!5213 (_keys!6048 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214620 d!58405))

(declare-fun d!58407 () Bool)

(assert (=> d!58407 (= (array_inv!3212 (_values!4012 thiss!1504)) (bvsge (size!5212 (_values!4012 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214620 d!58407))

(declare-fun b!214684 () Bool)

(declare-fun e!139631 () SeekEntryResult!709)

(declare-fun e!139632 () SeekEntryResult!709)

(assert (=> b!214684 (= e!139631 e!139632)))

(declare-fun lt!110867 () (_ BitVec 64))

(declare-fun lt!110866 () SeekEntryResult!709)

(assert (=> b!214684 (= lt!110867 (select (arr!4886 (_keys!6048 thiss!1504)) (index!5008 lt!110866)))))

(declare-fun c!36076 () Bool)

(assert (=> b!214684 (= c!36076 (= lt!110867 key!932))))

(declare-fun b!214685 () Bool)

(declare-fun e!139630 () SeekEntryResult!709)

(assert (=> b!214685 (= e!139630 (MissingZero!709 (index!5008 lt!110866)))))

(declare-fun b!214686 () Bool)

(assert (=> b!214686 (= e!139632 (Found!709 (index!5008 lt!110866)))))

(declare-fun d!58409 () Bool)

(declare-fun lt!110865 () SeekEntryResult!709)

(assert (=> d!58409 (and (or ((_ is Undefined!709) lt!110865) (not ((_ is Found!709) lt!110865)) (and (bvsge (index!5007 lt!110865) #b00000000000000000000000000000000) (bvslt (index!5007 lt!110865) (size!5213 (_keys!6048 thiss!1504))))) (or ((_ is Undefined!709) lt!110865) ((_ is Found!709) lt!110865) (not ((_ is MissingZero!709) lt!110865)) (and (bvsge (index!5006 lt!110865) #b00000000000000000000000000000000) (bvslt (index!5006 lt!110865) (size!5213 (_keys!6048 thiss!1504))))) (or ((_ is Undefined!709) lt!110865) ((_ is Found!709) lt!110865) ((_ is MissingZero!709) lt!110865) (not ((_ is MissingVacant!709) lt!110865)) (and (bvsge (index!5009 lt!110865) #b00000000000000000000000000000000) (bvslt (index!5009 lt!110865) (size!5213 (_keys!6048 thiss!1504))))) (or ((_ is Undefined!709) lt!110865) (ite ((_ is Found!709) lt!110865) (= (select (arr!4886 (_keys!6048 thiss!1504)) (index!5007 lt!110865)) key!932) (ite ((_ is MissingZero!709) lt!110865) (= (select (arr!4886 (_keys!6048 thiss!1504)) (index!5006 lt!110865)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!709) lt!110865) (= (select (arr!4886 (_keys!6048 thiss!1504)) (index!5009 lt!110865)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58409 (= lt!110865 e!139631)))

(declare-fun c!36077 () Bool)

(assert (=> d!58409 (= c!36077 (and ((_ is Intermediate!709) lt!110866) (undefined!1521 lt!110866)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10305 (_ BitVec 32)) SeekEntryResult!709)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58409 (= lt!110866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9695 thiss!1504)) key!932 (_keys!6048 thiss!1504) (mask!9695 thiss!1504)))))

(assert (=> d!58409 (validMask!0 (mask!9695 thiss!1504))))

(assert (=> d!58409 (= (seekEntryOrOpen!0 key!932 (_keys!6048 thiss!1504) (mask!9695 thiss!1504)) lt!110865)))

(declare-fun b!214687 () Bool)

(declare-fun c!36078 () Bool)

(assert (=> b!214687 (= c!36078 (= lt!110867 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!214687 (= e!139632 e!139630)))

(declare-fun b!214688 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10305 (_ BitVec 32)) SeekEntryResult!709)

(assert (=> b!214688 (= e!139630 (seekKeyOrZeroReturnVacant!0 (x!22368 lt!110866) (index!5008 lt!110866) (index!5008 lt!110866) key!932 (_keys!6048 thiss!1504) (mask!9695 thiss!1504)))))

(declare-fun b!214689 () Bool)

(assert (=> b!214689 (= e!139631 Undefined!709)))

(assert (= (and d!58409 c!36077) b!214689))

(assert (= (and d!58409 (not c!36077)) b!214684))

(assert (= (and b!214684 c!36076) b!214686))

(assert (= (and b!214684 (not c!36076)) b!214687))

(assert (= (and b!214687 c!36078) b!214685))

(assert (= (and b!214687 (not c!36078)) b!214688))

(declare-fun m!242407 () Bool)

(assert (=> b!214684 m!242407))

(assert (=> d!58409 m!242375))

(declare-fun m!242409 () Bool)

(assert (=> d!58409 m!242409))

(declare-fun m!242411 () Bool)

(assert (=> d!58409 m!242411))

(declare-fun m!242413 () Bool)

(assert (=> d!58409 m!242413))

(declare-fun m!242415 () Bool)

(assert (=> d!58409 m!242415))

(assert (=> d!58409 m!242415))

(declare-fun m!242417 () Bool)

(assert (=> d!58409 m!242417))

(declare-fun m!242419 () Bool)

(assert (=> b!214688 m!242419))

(assert (=> b!214619 d!58409))

(declare-fun d!58411 () Bool)

(declare-fun res!105086 () Bool)

(declare-fun e!139635 () Bool)

(assert (=> d!58411 (=> (not res!105086) (not e!139635))))

(declare-fun simpleValid!212 (LongMapFixedSize!2758) Bool)

(assert (=> d!58411 (= res!105086 (simpleValid!212 thiss!1504))))

(assert (=> d!58411 (= (valid!1148 thiss!1504) e!139635)))

(declare-fun b!214696 () Bool)

(declare-fun res!105087 () Bool)

(assert (=> b!214696 (=> (not res!105087) (not e!139635))))

(declare-fun arrayCountValidKeys!0 (array!10305 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214696 (= res!105087 (= (arrayCountValidKeys!0 (_keys!6048 thiss!1504) #b00000000000000000000000000000000 (size!5213 (_keys!6048 thiss!1504))) (_size!1428 thiss!1504)))))

(declare-fun b!214697 () Bool)

(declare-fun res!105088 () Bool)

(assert (=> b!214697 (=> (not res!105088) (not e!139635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10305 (_ BitVec 32)) Bool)

(assert (=> b!214697 (= res!105088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6048 thiss!1504) (mask!9695 thiss!1504)))))

(declare-fun b!214698 () Bool)

(declare-datatypes ((List!3066 0))(
  ( (Nil!3063) (Cons!3062 (h!3704 (_ BitVec 64)) (t!8013 List!3066)) )
))
(declare-fun arrayNoDuplicates!0 (array!10305 (_ BitVec 32) List!3066) Bool)

(assert (=> b!214698 (= e!139635 (arrayNoDuplicates!0 (_keys!6048 thiss!1504) #b00000000000000000000000000000000 Nil!3063))))

(assert (= (and d!58411 res!105086) b!214696))

(assert (= (and b!214696 res!105087) b!214697))

(assert (= (and b!214697 res!105088) b!214698))

(declare-fun m!242421 () Bool)

(assert (=> d!58411 m!242421))

(declare-fun m!242423 () Bool)

(assert (=> b!214696 m!242423))

(declare-fun m!242425 () Bool)

(assert (=> b!214697 m!242425))

(declare-fun m!242427 () Bool)

(assert (=> b!214698 m!242427))

(assert (=> start!21336 d!58411))

(declare-fun d!58413 () Bool)

(assert (=> d!58413 (= (validMask!0 (mask!9695 thiss!1504)) (and (or (= (mask!9695 thiss!1504) #b00000000000000000000000000000111) (= (mask!9695 thiss!1504) #b00000000000000000000000000001111) (= (mask!9695 thiss!1504) #b00000000000000000000000000011111) (= (mask!9695 thiss!1504) #b00000000000000000000000000111111) (= (mask!9695 thiss!1504) #b00000000000000000000000001111111) (= (mask!9695 thiss!1504) #b00000000000000000000000011111111) (= (mask!9695 thiss!1504) #b00000000000000000000000111111111) (= (mask!9695 thiss!1504) #b00000000000000000000001111111111) (= (mask!9695 thiss!1504) #b00000000000000000000011111111111) (= (mask!9695 thiss!1504) #b00000000000000000000111111111111) (= (mask!9695 thiss!1504) #b00000000000000000001111111111111) (= (mask!9695 thiss!1504) #b00000000000000000011111111111111) (= (mask!9695 thiss!1504) #b00000000000000000111111111111111) (= (mask!9695 thiss!1504) #b00000000000000001111111111111111) (= (mask!9695 thiss!1504) #b00000000000000011111111111111111) (= (mask!9695 thiss!1504) #b00000000000000111111111111111111) (= (mask!9695 thiss!1504) #b00000000000001111111111111111111) (= (mask!9695 thiss!1504) #b00000000000011111111111111111111) (= (mask!9695 thiss!1504) #b00000000000111111111111111111111) (= (mask!9695 thiss!1504) #b00000000001111111111111111111111) (= (mask!9695 thiss!1504) #b00000000011111111111111111111111) (= (mask!9695 thiss!1504) #b00000000111111111111111111111111) (= (mask!9695 thiss!1504) #b00000001111111111111111111111111) (= (mask!9695 thiss!1504) #b00000011111111111111111111111111) (= (mask!9695 thiss!1504) #b00000111111111111111111111111111) (= (mask!9695 thiss!1504) #b00001111111111111111111111111111) (= (mask!9695 thiss!1504) #b00011111111111111111111111111111) (= (mask!9695 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9695 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214616 d!58413))

(declare-fun b!214705 () Bool)

(declare-fun e!139640 () Bool)

(assert (=> b!214705 (= e!139640 tp_is_empty!5545)))

(declare-fun b!214706 () Bool)

(declare-fun e!139641 () Bool)

(assert (=> b!214706 (= e!139641 tp_is_empty!5545)))

(declare-fun mapIsEmpty!9448 () Bool)

(declare-fun mapRes!9448 () Bool)

(assert (=> mapIsEmpty!9448 mapRes!9448))

(declare-fun condMapEmpty!9448 () Bool)

(declare-fun mapDefault!9448 () ValueCell!2429)

(assert (=> mapNonEmpty!9439 (= condMapEmpty!9448 (= mapRest!9439 ((as const (Array (_ BitVec 32) ValueCell!2429)) mapDefault!9448)))))

(assert (=> mapNonEmpty!9439 (= tp!20143 (and e!139641 mapRes!9448))))

(declare-fun mapNonEmpty!9448 () Bool)

(declare-fun tp!20158 () Bool)

(assert (=> mapNonEmpty!9448 (= mapRes!9448 (and tp!20158 e!139640))))

(declare-fun mapValue!9448 () ValueCell!2429)

(declare-fun mapKey!9448 () (_ BitVec 32))

(declare-fun mapRest!9448 () (Array (_ BitVec 32) ValueCell!2429))

(assert (=> mapNonEmpty!9448 (= mapRest!9439 (store mapRest!9448 mapKey!9448 mapValue!9448))))

(assert (= (and mapNonEmpty!9439 condMapEmpty!9448) mapIsEmpty!9448))

(assert (= (and mapNonEmpty!9439 (not condMapEmpty!9448)) mapNonEmpty!9448))

(assert (= (and mapNonEmpty!9448 ((_ is ValueCellFull!2429) mapValue!9448)) b!214705))

(assert (= (and mapNonEmpty!9439 ((_ is ValueCellFull!2429) mapDefault!9448)) b!214706))

(declare-fun m!242429 () Bool)

(assert (=> mapNonEmpty!9448 m!242429))

(check-sat (not b!214696) (not b!214698) (not mapNonEmpty!9448) (not b_next!5683) (not d!58411) (not b!214688) b_and!12587 tp_is_empty!5545 (not d!58409) (not b!214697))
(check-sat b_and!12587 (not b_next!5683))
