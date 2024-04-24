; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17230 () Bool)

(assert start!17230)

(declare-fun b!172835 () Bool)

(declare-fun b_free!4273 () Bool)

(declare-fun b_next!4273 () Bool)

(assert (=> b!172835 (= b_free!4273 (not b_next!4273))))

(declare-fun tp!15477 () Bool)

(declare-fun b_and!10727 () Bool)

(assert (=> b!172835 (= tp!15477 b_and!10727)))

(declare-fun mapIsEmpty!6888 () Bool)

(declare-fun mapRes!6888 () Bool)

(assert (=> mapIsEmpty!6888 mapRes!6888))

(declare-fun b!172832 () Bool)

(declare-fun res!82065 () Bool)

(declare-fun e!114099 () Bool)

(assert (=> b!172832 (=> (not res!82065) (not e!114099))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172832 (= res!82065 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172833 () Bool)

(declare-fun e!114103 () Bool)

(declare-fun tp_is_empty!4045 () Bool)

(assert (=> b!172833 (= e!114103 tp_is_empty!4045)))

(declare-fun b!172834 () Bool)

(declare-fun res!82064 () Bool)

(assert (=> b!172834 (=> (not res!82064) (not e!114099))))

(declare-datatypes ((V!5041 0))(
  ( (V!5042 (val!2067 Int)) )
))
(declare-datatypes ((ValueCell!1679 0))(
  ( (ValueCellFull!1679 (v!3936 V!5041)) (EmptyCell!1679) )
))
(declare-datatypes ((array!7203 0))(
  ( (array!7204 (arr!3422 (Array (_ BitVec 32) (_ BitVec 64))) (size!3721 (_ BitVec 32))) )
))
(declare-datatypes ((array!7205 0))(
  ( (array!7206 (arr!3423 (Array (_ BitVec 32) ValueCell!1679)) (size!3722 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2266 0))(
  ( (LongMapFixedSize!2267 (defaultEntry!3579 Int) (mask!8435 (_ BitVec 32)) (extraKeys!3318 (_ BitVec 32)) (zeroValue!3420 V!5041) (minValue!3422 V!5041) (_size!1182 (_ BitVec 32)) (_keys!5418 array!7203) (_values!3562 array!7205) (_vacant!1182 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2266)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172834 (= res!82064 (validMask!0 (mask!8435 thiss!1248)))))

(declare-fun e!114102 () Bool)

(declare-fun e!114101 () Bool)

(declare-fun array_inv!2201 (array!7203) Bool)

(declare-fun array_inv!2202 (array!7205) Bool)

(assert (=> b!172835 (= e!114101 (and tp!15477 tp_is_empty!4045 (array_inv!2201 (_keys!5418 thiss!1248)) (array_inv!2202 (_values!3562 thiss!1248)) e!114102))))

(declare-fun b!172836 () Bool)

(assert (=> b!172836 (= e!114099 (and (= (size!3722 (_values!3562 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8435 thiss!1248))) (= (size!3721 (_keys!5418 thiss!1248)) (size!3722 (_values!3562 thiss!1248))) (bvsge (mask!8435 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3318 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3318 thiss!1248) #b00000000000000000000000000000011) (bvslt (bvor (extraKeys!3318 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!82063 () Bool)

(assert (=> start!17230 (=> (not res!82063) (not e!114099))))

(declare-fun valid!976 (LongMapFixedSize!2266) Bool)

(assert (=> start!17230 (= res!82063 (valid!976 thiss!1248))))

(assert (=> start!17230 e!114099))

(assert (=> start!17230 e!114101))

(assert (=> start!17230 true))

(declare-fun b!172837 () Bool)

(declare-fun e!114100 () Bool)

(assert (=> b!172837 (= e!114100 tp_is_empty!4045)))

(declare-fun mapNonEmpty!6888 () Bool)

(declare-fun tp!15476 () Bool)

(assert (=> mapNonEmpty!6888 (= mapRes!6888 (and tp!15476 e!114103))))

(declare-fun mapRest!6888 () (Array (_ BitVec 32) ValueCell!1679))

(declare-fun mapValue!6888 () ValueCell!1679)

(declare-fun mapKey!6888 () (_ BitVec 32))

(assert (=> mapNonEmpty!6888 (= (arr!3423 (_values!3562 thiss!1248)) (store mapRest!6888 mapKey!6888 mapValue!6888))))

(declare-fun b!172838 () Bool)

(assert (=> b!172838 (= e!114102 (and e!114100 mapRes!6888))))

(declare-fun condMapEmpty!6888 () Bool)

(declare-fun mapDefault!6888 () ValueCell!1679)

(assert (=> b!172838 (= condMapEmpty!6888 (= (arr!3423 (_values!3562 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1679)) mapDefault!6888)))))

(assert (= (and start!17230 res!82063) b!172832))

(assert (= (and b!172832 res!82065) b!172834))

(assert (= (and b!172834 res!82064) b!172836))

(assert (= (and b!172838 condMapEmpty!6888) mapIsEmpty!6888))

(assert (= (and b!172838 (not condMapEmpty!6888)) mapNonEmpty!6888))

(get-info :version)

(assert (= (and mapNonEmpty!6888 ((_ is ValueCellFull!1679) mapValue!6888)) b!172833))

(assert (= (and b!172838 ((_ is ValueCellFull!1679) mapDefault!6888)) b!172837))

(assert (= b!172835 b!172838))

(assert (= start!17230 b!172835))

(declare-fun m!201575 () Bool)

(assert (=> b!172834 m!201575))

(declare-fun m!201577 () Bool)

(assert (=> b!172835 m!201577))

(declare-fun m!201579 () Bool)

(assert (=> b!172835 m!201579))

(declare-fun m!201581 () Bool)

(assert (=> start!17230 m!201581))

(declare-fun m!201583 () Bool)

(assert (=> mapNonEmpty!6888 m!201583))

(check-sat (not b!172835) (not mapNonEmpty!6888) (not b!172834) (not start!17230) tp_is_empty!4045 (not b_next!4273) b_and!10727)
(check-sat b_and!10727 (not b_next!4273))
