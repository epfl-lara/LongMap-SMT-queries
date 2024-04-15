; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21382 () Bool)

(assert start!21382)

(declare-fun b!214740 () Bool)

(declare-fun b_free!5695 () Bool)

(declare-fun b_next!5695 () Bool)

(assert (=> b!214740 (= b_free!5695 (not b_next!5695))))

(declare-fun tp!20185 () Bool)

(declare-fun b_and!12559 () Bool)

(assert (=> b!214740 (= tp!20185 b_and!12559)))

(declare-fun b!214736 () Bool)

(declare-fun e!139659 () Bool)

(declare-fun e!139657 () Bool)

(declare-fun mapRes!9464 () Bool)

(assert (=> b!214736 (= e!139659 (and e!139657 mapRes!9464))))

(declare-fun condMapEmpty!9464 () Bool)

(declare-datatypes ((V!7057 0))(
  ( (V!7058 (val!2823 Int)) )
))
(declare-datatypes ((ValueCell!2435 0))(
  ( (ValueCellFull!2435 (v!4835 V!7057)) (EmptyCell!2435) )
))
(declare-datatypes ((array!10325 0))(
  ( (array!10326 (arr!4893 (Array (_ BitVec 32) ValueCell!2435)) (size!5222 (_ BitVec 32))) )
))
(declare-datatypes ((array!10327 0))(
  ( (array!10328 (arr!4894 (Array (_ BitVec 32) (_ BitVec 64))) (size!5223 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2770 0))(
  ( (LongMapFixedSize!2771 (defaultEntry!4035 Int) (mask!9712 (_ BitVec 32)) (extraKeys!3772 (_ BitVec 32)) (zeroValue!3876 V!7057) (minValue!3876 V!7057) (_size!1434 (_ BitVec 32)) (_keys!6058 array!10327) (_values!4018 array!10325) (_vacant!1434 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2770)

(declare-fun mapDefault!9464 () ValueCell!2435)

(assert (=> b!214736 (= condMapEmpty!9464 (= (arr!4893 (_values!4018 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2435)) mapDefault!9464)))))

(declare-fun b!214737 () Bool)

(declare-fun res!105068 () Bool)

(declare-fun e!139662 () Bool)

(assert (=> b!214737 (=> (not res!105068) (not e!139662))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!722 0))(
  ( (MissingZero!722 (index!5058 (_ BitVec 32))) (Found!722 (index!5059 (_ BitVec 32))) (Intermediate!722 (undefined!1534 Bool) (index!5060 (_ BitVec 32)) (x!22421 (_ BitVec 32))) (Undefined!722) (MissingVacant!722 (index!5061 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10327 (_ BitVec 32)) SeekEntryResult!722)

(assert (=> b!214737 (= res!105068 (not (= (seekEntryOrOpen!0 key!932 (_keys!6058 thiss!1504) (mask!9712 thiss!1504)) (MissingZero!722 index!297))))))

(declare-fun b!214738 () Bool)

(declare-fun tp_is_empty!5557 () Bool)

(assert (=> b!214738 (= e!139657 tp_is_empty!5557)))

(declare-fun b!214739 () Bool)

(declare-fun res!105065 () Bool)

(assert (=> b!214739 (=> (not res!105065) (not e!139662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214739 (= res!105065 (validMask!0 (mask!9712 thiss!1504)))))

(declare-fun e!139660 () Bool)

(declare-fun array_inv!3215 (array!10327) Bool)

(declare-fun array_inv!3216 (array!10325) Bool)

(assert (=> b!214740 (= e!139660 (and tp!20185 tp_is_empty!5557 (array_inv!3215 (_keys!6058 thiss!1504)) (array_inv!3216 (_values!4018 thiss!1504)) e!139659))))

(declare-fun mapNonEmpty!9464 () Bool)

(declare-fun tp!20186 () Bool)

(declare-fun e!139661 () Bool)

(assert (=> mapNonEmpty!9464 (= mapRes!9464 (and tp!20186 e!139661))))

(declare-fun mapValue!9464 () ValueCell!2435)

(declare-fun mapKey!9464 () (_ BitVec 32))

(declare-fun mapRest!9464 () (Array (_ BitVec 32) ValueCell!2435))

(assert (=> mapNonEmpty!9464 (= (arr!4893 (_values!4018 thiss!1504)) (store mapRest!9464 mapKey!9464 mapValue!9464))))

(declare-fun res!105067 () Bool)

(assert (=> start!21382 (=> (not res!105067) (not e!139662))))

(declare-fun valid!1150 (LongMapFixedSize!2770) Bool)

(assert (=> start!21382 (= res!105067 (valid!1150 thiss!1504))))

(assert (=> start!21382 e!139662))

(assert (=> start!21382 e!139660))

(assert (=> start!21382 true))

(declare-fun b!214741 () Bool)

(declare-fun res!105069 () Bool)

(assert (=> b!214741 (=> (not res!105069) (not e!139662))))

(assert (=> b!214741 (= res!105069 (and (bvsge (mask!9712 thiss!1504) #b00000000000000000000000000000000) (= (size!5223 (_keys!6058 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9712 thiss!1504)))))))

(declare-fun b!214742 () Bool)

(declare-fun res!105066 () Bool)

(assert (=> b!214742 (=> (not res!105066) (not e!139662))))

(assert (=> b!214742 (= res!105066 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214743 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214743 (= e!139662 (not (validKeyInArray!0 key!932)))))

(declare-fun b!214744 () Bool)

(assert (=> b!214744 (= e!139661 tp_is_empty!5557)))

(declare-fun mapIsEmpty!9464 () Bool)

(assert (=> mapIsEmpty!9464 mapRes!9464))

(assert (= (and start!21382 res!105067) b!214742))

(assert (= (and b!214742 res!105066) b!214737))

(assert (= (and b!214737 res!105068) b!214739))

(assert (= (and b!214739 res!105065) b!214741))

(assert (= (and b!214741 res!105069) b!214743))

(assert (= (and b!214736 condMapEmpty!9464) mapIsEmpty!9464))

(assert (= (and b!214736 (not condMapEmpty!9464)) mapNonEmpty!9464))

(get-info :version)

(assert (= (and mapNonEmpty!9464 ((_ is ValueCellFull!2435) mapValue!9464)) b!214744))

(assert (= (and b!214736 ((_ is ValueCellFull!2435) mapDefault!9464)) b!214738))

(assert (= b!214740 b!214736))

(assert (= start!21382 b!214740))

(declare-fun m!241731 () Bool)

(assert (=> mapNonEmpty!9464 m!241731))

(declare-fun m!241733 () Bool)

(assert (=> b!214743 m!241733))

(declare-fun m!241735 () Bool)

(assert (=> b!214737 m!241735))

(declare-fun m!241737 () Bool)

(assert (=> b!214739 m!241737))

(declare-fun m!241739 () Bool)

(assert (=> start!21382 m!241739))

(declare-fun m!241741 () Bool)

(assert (=> b!214740 m!241741))

(declare-fun m!241743 () Bool)

(assert (=> b!214740 m!241743))

(check-sat (not mapNonEmpty!9464) (not start!21382) (not b!214740) b_and!12559 tp_is_empty!5557 (not b!214739) (not b_next!5695) (not b!214743) (not b!214737))
(check-sat b_and!12559 (not b_next!5695))
(get-model)

(declare-fun d!58221 () Bool)

(assert (=> d!58221 (= (array_inv!3215 (_keys!6058 thiss!1504)) (bvsge (size!5223 (_keys!6058 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214740 d!58221))

(declare-fun d!58223 () Bool)

(assert (=> d!58223 (= (array_inv!3216 (_values!4018 thiss!1504)) (bvsge (size!5222 (_values!4018 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214740 d!58223))

(declare-fun d!58225 () Bool)

(declare-fun res!105106 () Bool)

(declare-fun e!139701 () Bool)

(assert (=> d!58225 (=> (not res!105106) (not e!139701))))

(declare-fun simpleValid!214 (LongMapFixedSize!2770) Bool)

(assert (=> d!58225 (= res!105106 (simpleValid!214 thiss!1504))))

(assert (=> d!58225 (= (valid!1150 thiss!1504) e!139701)))

(declare-fun b!214805 () Bool)

(declare-fun res!105107 () Bool)

(assert (=> b!214805 (=> (not res!105107) (not e!139701))))

(declare-fun arrayCountValidKeys!0 (array!10327 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214805 (= res!105107 (= (arrayCountValidKeys!0 (_keys!6058 thiss!1504) #b00000000000000000000000000000000 (size!5223 (_keys!6058 thiss!1504))) (_size!1434 thiss!1504)))))

(declare-fun b!214806 () Bool)

(declare-fun res!105108 () Bool)

(assert (=> b!214806 (=> (not res!105108) (not e!139701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10327 (_ BitVec 32)) Bool)

(assert (=> b!214806 (= res!105108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6058 thiss!1504) (mask!9712 thiss!1504)))))

(declare-fun b!214807 () Bool)

(declare-datatypes ((List!3120 0))(
  ( (Nil!3117) (Cons!3116 (h!3759 (_ BitVec 64)) (t!8066 List!3120)) )
))
(declare-fun arrayNoDuplicates!0 (array!10327 (_ BitVec 32) List!3120) Bool)

(assert (=> b!214807 (= e!139701 (arrayNoDuplicates!0 (_keys!6058 thiss!1504) #b00000000000000000000000000000000 Nil!3117))))

(assert (= (and d!58225 res!105106) b!214805))

(assert (= (and b!214805 res!105107) b!214806))

(assert (= (and b!214806 res!105108) b!214807))

(declare-fun m!241773 () Bool)

(assert (=> d!58225 m!241773))

(declare-fun m!241775 () Bool)

(assert (=> b!214805 m!241775))

(declare-fun m!241777 () Bool)

(assert (=> b!214806 m!241777))

(declare-fun m!241779 () Bool)

(assert (=> b!214807 m!241779))

(assert (=> start!21382 d!58225))

(declare-fun d!58227 () Bool)

(assert (=> d!58227 (= (validMask!0 (mask!9712 thiss!1504)) (and (or (= (mask!9712 thiss!1504) #b00000000000000000000000000000111) (= (mask!9712 thiss!1504) #b00000000000000000000000000001111) (= (mask!9712 thiss!1504) #b00000000000000000000000000011111) (= (mask!9712 thiss!1504) #b00000000000000000000000000111111) (= (mask!9712 thiss!1504) #b00000000000000000000000001111111) (= (mask!9712 thiss!1504) #b00000000000000000000000011111111) (= (mask!9712 thiss!1504) #b00000000000000000000000111111111) (= (mask!9712 thiss!1504) #b00000000000000000000001111111111) (= (mask!9712 thiss!1504) #b00000000000000000000011111111111) (= (mask!9712 thiss!1504) #b00000000000000000000111111111111) (= (mask!9712 thiss!1504) #b00000000000000000001111111111111) (= (mask!9712 thiss!1504) #b00000000000000000011111111111111) (= (mask!9712 thiss!1504) #b00000000000000000111111111111111) (= (mask!9712 thiss!1504) #b00000000000000001111111111111111) (= (mask!9712 thiss!1504) #b00000000000000011111111111111111) (= (mask!9712 thiss!1504) #b00000000000000111111111111111111) (= (mask!9712 thiss!1504) #b00000000000001111111111111111111) (= (mask!9712 thiss!1504) #b00000000000011111111111111111111) (= (mask!9712 thiss!1504) #b00000000000111111111111111111111) (= (mask!9712 thiss!1504) #b00000000001111111111111111111111) (= (mask!9712 thiss!1504) #b00000000011111111111111111111111) (= (mask!9712 thiss!1504) #b00000000111111111111111111111111) (= (mask!9712 thiss!1504) #b00000001111111111111111111111111) (= (mask!9712 thiss!1504) #b00000011111111111111111111111111) (= (mask!9712 thiss!1504) #b00000111111111111111111111111111) (= (mask!9712 thiss!1504) #b00001111111111111111111111111111) (= (mask!9712 thiss!1504) #b00011111111111111111111111111111) (= (mask!9712 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9712 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214739 d!58227))

(declare-fun d!58229 () Bool)

(assert (=> d!58229 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!214743 d!58229))

(declare-fun b!214821 () Bool)

(declare-fun e!139708 () SeekEntryResult!722)

(declare-fun lt!110675 () SeekEntryResult!722)

(assert (=> b!214821 (= e!139708 (Found!722 (index!5060 lt!110675)))))

(declare-fun b!214822 () Bool)

(declare-fun e!139710 () SeekEntryResult!722)

(assert (=> b!214822 (= e!139710 e!139708)))

(declare-fun lt!110674 () (_ BitVec 64))

(assert (=> b!214822 (= lt!110674 (select (arr!4894 (_keys!6058 thiss!1504)) (index!5060 lt!110675)))))

(declare-fun c!36087 () Bool)

(assert (=> b!214822 (= c!36087 (= lt!110674 key!932))))

(declare-fun b!214823 () Bool)

(declare-fun e!139709 () SeekEntryResult!722)

(assert (=> b!214823 (= e!139709 (MissingZero!722 (index!5060 lt!110675)))))

(declare-fun b!214824 () Bool)

(assert (=> b!214824 (= e!139710 Undefined!722)))

(declare-fun b!214825 () Bool)

(declare-fun c!36085 () Bool)

(assert (=> b!214825 (= c!36085 (= lt!110674 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!214825 (= e!139708 e!139709)))

(declare-fun b!214820 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10327 (_ BitVec 32)) SeekEntryResult!722)

(assert (=> b!214820 (= e!139709 (seekKeyOrZeroReturnVacant!0 (x!22421 lt!110675) (index!5060 lt!110675) (index!5060 lt!110675) key!932 (_keys!6058 thiss!1504) (mask!9712 thiss!1504)))))

(declare-fun d!58231 () Bool)

(declare-fun lt!110673 () SeekEntryResult!722)

(assert (=> d!58231 (and (or ((_ is Undefined!722) lt!110673) (not ((_ is Found!722) lt!110673)) (and (bvsge (index!5059 lt!110673) #b00000000000000000000000000000000) (bvslt (index!5059 lt!110673) (size!5223 (_keys!6058 thiss!1504))))) (or ((_ is Undefined!722) lt!110673) ((_ is Found!722) lt!110673) (not ((_ is MissingZero!722) lt!110673)) (and (bvsge (index!5058 lt!110673) #b00000000000000000000000000000000) (bvslt (index!5058 lt!110673) (size!5223 (_keys!6058 thiss!1504))))) (or ((_ is Undefined!722) lt!110673) ((_ is Found!722) lt!110673) ((_ is MissingZero!722) lt!110673) (not ((_ is MissingVacant!722) lt!110673)) (and (bvsge (index!5061 lt!110673) #b00000000000000000000000000000000) (bvslt (index!5061 lt!110673) (size!5223 (_keys!6058 thiss!1504))))) (or ((_ is Undefined!722) lt!110673) (ite ((_ is Found!722) lt!110673) (= (select (arr!4894 (_keys!6058 thiss!1504)) (index!5059 lt!110673)) key!932) (ite ((_ is MissingZero!722) lt!110673) (= (select (arr!4894 (_keys!6058 thiss!1504)) (index!5058 lt!110673)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!722) lt!110673) (= (select (arr!4894 (_keys!6058 thiss!1504)) (index!5061 lt!110673)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58231 (= lt!110673 e!139710)))

(declare-fun c!36086 () Bool)

(assert (=> d!58231 (= c!36086 (and ((_ is Intermediate!722) lt!110675) (undefined!1534 lt!110675)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10327 (_ BitVec 32)) SeekEntryResult!722)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58231 (= lt!110675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9712 thiss!1504)) key!932 (_keys!6058 thiss!1504) (mask!9712 thiss!1504)))))

(assert (=> d!58231 (validMask!0 (mask!9712 thiss!1504))))

(assert (=> d!58231 (= (seekEntryOrOpen!0 key!932 (_keys!6058 thiss!1504) (mask!9712 thiss!1504)) lt!110673)))

(assert (= (and d!58231 c!36086) b!214824))

(assert (= (and d!58231 (not c!36086)) b!214822))

(assert (= (and b!214822 c!36087) b!214821))

(assert (= (and b!214822 (not c!36087)) b!214825))

(assert (= (and b!214825 c!36085) b!214823))

(assert (= (and b!214825 (not c!36085)) b!214820))

(declare-fun m!241781 () Bool)

(assert (=> b!214822 m!241781))

(declare-fun m!241783 () Bool)

(assert (=> b!214820 m!241783))

(declare-fun m!241785 () Bool)

(assert (=> d!58231 m!241785))

(assert (=> d!58231 m!241737))

(declare-fun m!241787 () Bool)

(assert (=> d!58231 m!241787))

(declare-fun m!241789 () Bool)

(assert (=> d!58231 m!241789))

(declare-fun m!241791 () Bool)

(assert (=> d!58231 m!241791))

(assert (=> d!58231 m!241791))

(declare-fun m!241793 () Bool)

(assert (=> d!58231 m!241793))

(assert (=> b!214737 d!58231))

(declare-fun b!214833 () Bool)

(declare-fun e!139716 () Bool)

(assert (=> b!214833 (= e!139716 tp_is_empty!5557)))

(declare-fun condMapEmpty!9473 () Bool)

(declare-fun mapDefault!9473 () ValueCell!2435)

(assert (=> mapNonEmpty!9464 (= condMapEmpty!9473 (= mapRest!9464 ((as const (Array (_ BitVec 32) ValueCell!2435)) mapDefault!9473)))))

(declare-fun mapRes!9473 () Bool)

(assert (=> mapNonEmpty!9464 (= tp!20186 (and e!139716 mapRes!9473))))

(declare-fun mapNonEmpty!9473 () Bool)

(declare-fun tp!20201 () Bool)

(declare-fun e!139715 () Bool)

(assert (=> mapNonEmpty!9473 (= mapRes!9473 (and tp!20201 e!139715))))

(declare-fun mapRest!9473 () (Array (_ BitVec 32) ValueCell!2435))

(declare-fun mapValue!9473 () ValueCell!2435)

(declare-fun mapKey!9473 () (_ BitVec 32))

(assert (=> mapNonEmpty!9473 (= mapRest!9464 (store mapRest!9473 mapKey!9473 mapValue!9473))))

(declare-fun mapIsEmpty!9473 () Bool)

(assert (=> mapIsEmpty!9473 mapRes!9473))

(declare-fun b!214832 () Bool)

(assert (=> b!214832 (= e!139715 tp_is_empty!5557)))

(assert (= (and mapNonEmpty!9464 condMapEmpty!9473) mapIsEmpty!9473))

(assert (= (and mapNonEmpty!9464 (not condMapEmpty!9473)) mapNonEmpty!9473))

(assert (= (and mapNonEmpty!9473 ((_ is ValueCellFull!2435) mapValue!9473)) b!214832))

(assert (= (and mapNonEmpty!9464 ((_ is ValueCellFull!2435) mapDefault!9473)) b!214833))

(declare-fun m!241795 () Bool)

(assert (=> mapNonEmpty!9473 m!241795))

(check-sat (not b!214807) (not b!214805) b_and!12559 tp_is_empty!5557 (not b!214806) (not mapNonEmpty!9473) (not d!58225) (not b_next!5695) (not b!214820) (not d!58231))
(check-sat b_and!12559 (not b_next!5695))
