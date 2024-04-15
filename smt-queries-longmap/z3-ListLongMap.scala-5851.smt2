; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75608 () Bool)

(assert start!75608)

(declare-fun b!888957 () Bool)

(declare-fun b_free!15607 () Bool)

(declare-fun b_next!15607 () Bool)

(assert (=> b!888957 (= b_free!15607 (not b_next!15607))))

(declare-fun tp!54787 () Bool)

(declare-fun b_and!25821 () Bool)

(assert (=> b!888957 (= tp!54787 b_and!25821)))

(declare-fun mapNonEmpty!28454 () Bool)

(declare-fun mapRes!28454 () Bool)

(declare-fun tp!54788 () Bool)

(declare-fun e!495453 () Bool)

(assert (=> mapNonEmpty!28454 (= mapRes!28454 (and tp!54788 e!495453))))

(declare-datatypes ((V!28879 0))(
  ( (V!28880 (val!9018 Int)) )
))
(declare-datatypes ((ValueCell!8486 0))(
  ( (ValueCellFull!8486 (v!11490 V!28879)) (EmptyCell!8486) )
))
(declare-fun mapRest!28454 () (Array (_ BitVec 32) ValueCell!8486))

(declare-fun mapValue!28454 () ValueCell!8486)

(declare-fun mapKey!28454 () (_ BitVec 32))

(declare-datatypes ((array!51831 0))(
  ( (array!51832 (arr!24923 (Array (_ BitVec 32) (_ BitVec 64))) (size!25369 (_ BitVec 32))) )
))
(declare-datatypes ((array!51833 0))(
  ( (array!51834 (arr!24924 (Array (_ BitVec 32) ValueCell!8486)) (size!25370 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3988 0))(
  ( (LongMapFixedSize!3989 (defaultEntry!5191 Int) (mask!25626 (_ BitVec 32)) (extraKeys!4885 (_ BitVec 32)) (zeroValue!4989 V!28879) (minValue!4989 V!28879) (_size!2049 (_ BitVec 32)) (_keys!9869 array!51831) (_values!5176 array!51833) (_vacant!2049 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3988)

(assert (=> mapNonEmpty!28454 (= (arr!24924 (_values!5176 thiss!1181)) (store mapRest!28454 mapKey!28454 mapValue!28454))))

(declare-fun res!602541 () Bool)

(declare-fun e!495452 () Bool)

(assert (=> start!75608 (=> (not res!602541) (not e!495452))))

(declare-fun valid!1561 (LongMapFixedSize!3988) Bool)

(assert (=> start!75608 (= res!602541 (valid!1561 thiss!1181))))

(assert (=> start!75608 e!495452))

(declare-fun e!495454 () Bool)

(assert (=> start!75608 e!495454))

(assert (=> start!75608 true))

(declare-fun b!888952 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!888952 (= e!495452 (not (validKeyInArray!0 key!785)))))

(declare-fun b!888953 () Bool)

(declare-fun tp_is_empty!17935 () Bool)

(assert (=> b!888953 (= e!495453 tp_is_empty!17935)))

(declare-fun b!888954 () Bool)

(declare-fun res!602538 () Bool)

(assert (=> b!888954 (=> (not res!602538) (not e!495452))))

(assert (=> b!888954 (= res!602538 (not (= key!785 (bvneg key!785))))))

(declare-fun b!888955 () Bool)

(declare-fun res!602539 () Bool)

(assert (=> b!888955 (=> (not res!602539) (not e!495452))))

(assert (=> b!888955 (= res!602539 (= (size!25369 (_keys!9869 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25626 thiss!1181))))))

(declare-fun mapIsEmpty!28454 () Bool)

(assert (=> mapIsEmpty!28454 mapRes!28454))

(declare-fun b!888956 () Bool)

(declare-fun e!495451 () Bool)

(assert (=> b!888956 (= e!495451 tp_is_empty!17935)))

(declare-fun e!495450 () Bool)

(declare-fun array_inv!19654 (array!51831) Bool)

(declare-fun array_inv!19655 (array!51833) Bool)

(assert (=> b!888957 (= e!495454 (and tp!54787 tp_is_empty!17935 (array_inv!19654 (_keys!9869 thiss!1181)) (array_inv!19655 (_values!5176 thiss!1181)) e!495450))))

(declare-fun b!888958 () Bool)

(assert (=> b!888958 (= e!495450 (and e!495451 mapRes!28454))))

(declare-fun condMapEmpty!28454 () Bool)

(declare-fun mapDefault!28454 () ValueCell!8486)

(assert (=> b!888958 (= condMapEmpty!28454 (= (arr!24924 (_values!5176 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8486)) mapDefault!28454)))))

(declare-fun b!888959 () Bool)

(declare-fun res!602540 () Bool)

(assert (=> b!888959 (=> (not res!602540) (not e!495452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!888959 (= res!602540 (validMask!0 (mask!25626 thiss!1181)))))

(assert (= (and start!75608 res!602541) b!888954))

(assert (= (and b!888954 res!602538) b!888959))

(assert (= (and b!888959 res!602540) b!888955))

(assert (= (and b!888955 res!602539) b!888952))

(assert (= (and b!888958 condMapEmpty!28454) mapIsEmpty!28454))

(assert (= (and b!888958 (not condMapEmpty!28454)) mapNonEmpty!28454))

(get-info :version)

(assert (= (and mapNonEmpty!28454 ((_ is ValueCellFull!8486) mapValue!28454)) b!888953))

(assert (= (and b!888958 ((_ is ValueCellFull!8486) mapDefault!28454)) b!888956))

(assert (= b!888957 b!888958))

(assert (= start!75608 b!888957))

(declare-fun m!827457 () Bool)

(assert (=> b!888957 m!827457))

(declare-fun m!827459 () Bool)

(assert (=> b!888957 m!827459))

(declare-fun m!827461 () Bool)

(assert (=> b!888959 m!827461))

(declare-fun m!827463 () Bool)

(assert (=> start!75608 m!827463))

(declare-fun m!827465 () Bool)

(assert (=> b!888952 m!827465))

(declare-fun m!827467 () Bool)

(assert (=> mapNonEmpty!28454 m!827467))

(check-sat b_and!25821 (not b!888959) (not start!75608) (not b!888957) (not b_next!15607) (not b!888952) tp_is_empty!17935 (not mapNonEmpty!28454))
(check-sat b_and!25821 (not b_next!15607))
(get-model)

(declare-fun d!109957 () Bool)

(declare-fun res!602572 () Bool)

(declare-fun e!495494 () Bool)

(assert (=> d!109957 (=> (not res!602572) (not e!495494))))

(declare-fun simpleValid!294 (LongMapFixedSize!3988) Bool)

(assert (=> d!109957 (= res!602572 (simpleValid!294 thiss!1181))))

(assert (=> d!109957 (= (valid!1561 thiss!1181) e!495494)))

(declare-fun b!889014 () Bool)

(declare-fun res!602573 () Bool)

(assert (=> b!889014 (=> (not res!602573) (not e!495494))))

(declare-fun arrayCountValidKeys!0 (array!51831 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!889014 (= res!602573 (= (arrayCountValidKeys!0 (_keys!9869 thiss!1181) #b00000000000000000000000000000000 (size!25369 (_keys!9869 thiss!1181))) (_size!2049 thiss!1181)))))

(declare-fun b!889015 () Bool)

(declare-fun res!602574 () Bool)

(assert (=> b!889015 (=> (not res!602574) (not e!495494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51831 (_ BitVec 32)) Bool)

(assert (=> b!889015 (= res!602574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9869 thiss!1181) (mask!25626 thiss!1181)))))

(declare-fun b!889016 () Bool)

(declare-datatypes ((List!17707 0))(
  ( (Nil!17704) (Cons!17703 (h!18834 (_ BitVec 64)) (t!24997 List!17707)) )
))
(declare-fun arrayNoDuplicates!0 (array!51831 (_ BitVec 32) List!17707) Bool)

(assert (=> b!889016 (= e!495494 (arrayNoDuplicates!0 (_keys!9869 thiss!1181) #b00000000000000000000000000000000 Nil!17704))))

(assert (= (and d!109957 res!602572) b!889014))

(assert (= (and b!889014 res!602573) b!889015))

(assert (= (and b!889015 res!602574) b!889016))

(declare-fun m!827493 () Bool)

(assert (=> d!109957 m!827493))

(declare-fun m!827495 () Bool)

(assert (=> b!889014 m!827495))

(declare-fun m!827497 () Bool)

(assert (=> b!889015 m!827497))

(declare-fun m!827499 () Bool)

(assert (=> b!889016 m!827499))

(assert (=> start!75608 d!109957))

(declare-fun d!109959 () Bool)

(assert (=> d!109959 (= (validMask!0 (mask!25626 thiss!1181)) (and (or (= (mask!25626 thiss!1181) #b00000000000000000000000000000111) (= (mask!25626 thiss!1181) #b00000000000000000000000000001111) (= (mask!25626 thiss!1181) #b00000000000000000000000000011111) (= (mask!25626 thiss!1181) #b00000000000000000000000000111111) (= (mask!25626 thiss!1181) #b00000000000000000000000001111111) (= (mask!25626 thiss!1181) #b00000000000000000000000011111111) (= (mask!25626 thiss!1181) #b00000000000000000000000111111111) (= (mask!25626 thiss!1181) #b00000000000000000000001111111111) (= (mask!25626 thiss!1181) #b00000000000000000000011111111111) (= (mask!25626 thiss!1181) #b00000000000000000000111111111111) (= (mask!25626 thiss!1181) #b00000000000000000001111111111111) (= (mask!25626 thiss!1181) #b00000000000000000011111111111111) (= (mask!25626 thiss!1181) #b00000000000000000111111111111111) (= (mask!25626 thiss!1181) #b00000000000000001111111111111111) (= (mask!25626 thiss!1181) #b00000000000000011111111111111111) (= (mask!25626 thiss!1181) #b00000000000000111111111111111111) (= (mask!25626 thiss!1181) #b00000000000001111111111111111111) (= (mask!25626 thiss!1181) #b00000000000011111111111111111111) (= (mask!25626 thiss!1181) #b00000000000111111111111111111111) (= (mask!25626 thiss!1181) #b00000000001111111111111111111111) (= (mask!25626 thiss!1181) #b00000000011111111111111111111111) (= (mask!25626 thiss!1181) #b00000000111111111111111111111111) (= (mask!25626 thiss!1181) #b00000001111111111111111111111111) (= (mask!25626 thiss!1181) #b00000011111111111111111111111111) (= (mask!25626 thiss!1181) #b00000111111111111111111111111111) (= (mask!25626 thiss!1181) #b00001111111111111111111111111111) (= (mask!25626 thiss!1181) #b00011111111111111111111111111111) (= (mask!25626 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25626 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!888959 d!109959))

(declare-fun d!109961 () Bool)

(assert (=> d!109961 (= (validKeyInArray!0 key!785) (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!888952 d!109961))

(declare-fun d!109963 () Bool)

(assert (=> d!109963 (= (array_inv!19654 (_keys!9869 thiss!1181)) (bvsge (size!25369 (_keys!9869 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888957 d!109963))

(declare-fun d!109965 () Bool)

(assert (=> d!109965 (= (array_inv!19655 (_values!5176 thiss!1181)) (bvsge (size!25370 (_values!5176 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888957 d!109965))

(declare-fun mapNonEmpty!28463 () Bool)

(declare-fun mapRes!28463 () Bool)

(declare-fun tp!54803 () Bool)

(declare-fun e!495499 () Bool)

(assert (=> mapNonEmpty!28463 (= mapRes!28463 (and tp!54803 e!495499))))

(declare-fun mapValue!28463 () ValueCell!8486)

(declare-fun mapRest!28463 () (Array (_ BitVec 32) ValueCell!8486))

(declare-fun mapKey!28463 () (_ BitVec 32))

(assert (=> mapNonEmpty!28463 (= mapRest!28454 (store mapRest!28463 mapKey!28463 mapValue!28463))))

(declare-fun mapIsEmpty!28463 () Bool)

(assert (=> mapIsEmpty!28463 mapRes!28463))

(declare-fun condMapEmpty!28463 () Bool)

(declare-fun mapDefault!28463 () ValueCell!8486)

(assert (=> mapNonEmpty!28454 (= condMapEmpty!28463 (= mapRest!28454 ((as const (Array (_ BitVec 32) ValueCell!8486)) mapDefault!28463)))))

(declare-fun e!495500 () Bool)

(assert (=> mapNonEmpty!28454 (= tp!54788 (and e!495500 mapRes!28463))))

(declare-fun b!889023 () Bool)

(assert (=> b!889023 (= e!495499 tp_is_empty!17935)))

(declare-fun b!889024 () Bool)

(assert (=> b!889024 (= e!495500 tp_is_empty!17935)))

(assert (= (and mapNonEmpty!28454 condMapEmpty!28463) mapIsEmpty!28463))

(assert (= (and mapNonEmpty!28454 (not condMapEmpty!28463)) mapNonEmpty!28463))

(assert (= (and mapNonEmpty!28463 ((_ is ValueCellFull!8486) mapValue!28463)) b!889023))

(assert (= (and mapNonEmpty!28454 ((_ is ValueCellFull!8486) mapDefault!28463)) b!889024))

(declare-fun m!827501 () Bool)

(assert (=> mapNonEmpty!28463 m!827501))

(check-sat (not d!109957) (not b_next!15607) (not b!889016) tp_is_empty!17935 (not mapNonEmpty!28463) (not b!889014) (not b!889015) b_and!25821)
(check-sat b_and!25821 (not b_next!15607))
