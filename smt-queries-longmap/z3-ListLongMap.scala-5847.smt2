; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75538 () Bool)

(assert start!75538)

(declare-fun b!888518 () Bool)

(declare-fun b_free!15583 () Bool)

(declare-fun b_next!15583 () Bool)

(assert (=> b!888518 (= b_free!15583 (not b_next!15583))))

(declare-fun tp!54705 () Bool)

(declare-fun b_and!25797 () Bool)

(assert (=> b!888518 (= tp!54705 b_and!25797)))

(declare-fun b!888515 () Bool)

(declare-fun res!602363 () Bool)

(declare-fun e!495123 () Bool)

(assert (=> b!888515 (=> (not res!602363) (not e!495123))))

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((array!51777 0))(
  ( (array!51778 (arr!24899 (Array (_ BitVec 32) (_ BitVec 64))) (size!25343 (_ BitVec 32))) )
))
(declare-datatypes ((V!28847 0))(
  ( (V!28848 (val!9006 Int)) )
))
(declare-datatypes ((ValueCell!8474 0))(
  ( (ValueCellFull!8474 (v!11475 V!28847)) (EmptyCell!8474) )
))
(declare-datatypes ((array!51779 0))(
  ( (array!51780 (arr!24900 (Array (_ BitVec 32) ValueCell!8474)) (size!25344 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3964 0))(
  ( (LongMapFixedSize!3965 (defaultEntry!5179 Int) (mask!25602 (_ BitVec 32)) (extraKeys!4873 (_ BitVec 32)) (zeroValue!4977 V!28847) (minValue!4977 V!28847) (_size!2037 (_ BitVec 32)) (_keys!9855 array!51777) (_values!5164 array!51779) (_vacant!2037 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3964)

(assert (=> b!888515 (= res!602363 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4873 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4873 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888516 () Bool)

(assert (=> b!888516 (= e!495123 false)))

(declare-fun lt!401681 () Bool)

(declare-fun contains!4302 (LongMapFixedSize!3964 (_ BitVec 64)) Bool)

(assert (=> b!888516 (= lt!401681 (contains!4302 thiss!1181 key!785))))

(declare-fun b!888517 () Bool)

(declare-fun e!495125 () Bool)

(declare-fun tp_is_empty!17911 () Bool)

(assert (=> b!888517 (= e!495125 tp_is_empty!17911)))

(declare-fun e!495124 () Bool)

(declare-fun e!495122 () Bool)

(declare-fun array_inv!19636 (array!51777) Bool)

(declare-fun array_inv!19637 (array!51779) Bool)

(assert (=> b!888518 (= e!495122 (and tp!54705 tp_is_empty!17911 (array_inv!19636 (_keys!9855 thiss!1181)) (array_inv!19637 (_values!5164 thiss!1181)) e!495124))))

(declare-fun mapIsEmpty!28407 () Bool)

(declare-fun mapRes!28407 () Bool)

(assert (=> mapIsEmpty!28407 mapRes!28407))

(declare-fun mapNonEmpty!28407 () Bool)

(declare-fun tp!54704 () Bool)

(declare-fun e!495126 () Bool)

(assert (=> mapNonEmpty!28407 (= mapRes!28407 (and tp!54704 e!495126))))

(declare-fun mapRest!28407 () (Array (_ BitVec 32) ValueCell!8474))

(declare-fun mapValue!28407 () ValueCell!8474)

(declare-fun mapKey!28407 () (_ BitVec 32))

(assert (=> mapNonEmpty!28407 (= (arr!24900 (_values!5164 thiss!1181)) (store mapRest!28407 mapKey!28407 mapValue!28407))))

(declare-fun b!888519 () Bool)

(assert (=> b!888519 (= e!495126 tp_is_empty!17911)))

(declare-fun b!888520 () Bool)

(assert (=> b!888520 (= e!495124 (and e!495125 mapRes!28407))))

(declare-fun condMapEmpty!28407 () Bool)

(declare-fun mapDefault!28407 () ValueCell!8474)

(assert (=> b!888520 (= condMapEmpty!28407 (= (arr!24900 (_values!5164 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8474)) mapDefault!28407)))))

(declare-fun res!602364 () Bool)

(assert (=> start!75538 (=> (not res!602364) (not e!495123))))

(declare-fun valid!1552 (LongMapFixedSize!3964) Bool)

(assert (=> start!75538 (= res!602364 (valid!1552 thiss!1181))))

(assert (=> start!75538 e!495123))

(assert (=> start!75538 e!495122))

(assert (=> start!75538 true))

(assert (= (and start!75538 res!602364) b!888515))

(assert (= (and b!888515 res!602363) b!888516))

(assert (= (and b!888520 condMapEmpty!28407) mapIsEmpty!28407))

(assert (= (and b!888520 (not condMapEmpty!28407)) mapNonEmpty!28407))

(get-info :version)

(assert (= (and mapNonEmpty!28407 ((_ is ValueCellFull!8474) mapValue!28407)) b!888519))

(assert (= (and b!888520 ((_ is ValueCellFull!8474) mapDefault!28407)) b!888517))

(assert (= b!888518 b!888520))

(assert (= start!75538 b!888518))

(declare-fun m!827215 () Bool)

(assert (=> b!888516 m!827215))

(declare-fun m!827217 () Bool)

(assert (=> b!888518 m!827217))

(declare-fun m!827219 () Bool)

(assert (=> b!888518 m!827219))

(declare-fun m!827221 () Bool)

(assert (=> mapNonEmpty!28407 m!827221))

(declare-fun m!827223 () Bool)

(assert (=> start!75538 m!827223))

(check-sat (not mapNonEmpty!28407) b_and!25797 (not b_next!15583) tp_is_empty!17911 (not start!75538) (not b!888518) (not b!888516))
(check-sat b_and!25797 (not b_next!15583))
