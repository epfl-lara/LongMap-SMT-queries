; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16958 () Bool)

(assert start!16958)

(declare-fun b!170494 () Bool)

(declare-fun b_free!4201 () Bool)

(declare-fun b_next!4201 () Bool)

(assert (=> b!170494 (= b_free!4201 (not b_next!4201))))

(declare-fun tp!15226 () Bool)

(declare-fun b_and!10629 () Bool)

(assert (=> b!170494 (= tp!15226 b_and!10629)))

(declare-fun b!170490 () Bool)

(declare-fun e!112493 () Bool)

(declare-fun tp_is_empty!3973 () Bool)

(assert (=> b!170490 (= e!112493 tp_is_empty!3973)))

(declare-fun b!170491 () Bool)

(declare-fun e!112490 () Bool)

(assert (=> b!170491 (= e!112490 tp_is_empty!3973)))

(declare-fun b!170493 () Bool)

(declare-fun res!81047 () Bool)

(declare-fun e!112489 () Bool)

(assert (=> b!170493 (=> (not res!81047) (not e!112489))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170493 (= res!81047 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6746 () Bool)

(declare-fun mapRes!6746 () Bool)

(declare-fun tp!15227 () Bool)

(assert (=> mapNonEmpty!6746 (= mapRes!6746 (and tp!15227 e!112490))))

(declare-datatypes ((V!4945 0))(
  ( (V!4946 (val!2031 Int)) )
))
(declare-datatypes ((ValueCell!1643 0))(
  ( (ValueCellFull!1643 (v!3897 V!4945)) (EmptyCell!1643) )
))
(declare-fun mapRest!6746 () (Array (_ BitVec 32) ValueCell!1643))

(declare-fun mapValue!6746 () ValueCell!1643)

(declare-datatypes ((array!7041 0))(
  ( (array!7042 (arr!3350 (Array (_ BitVec 32) (_ BitVec 64))) (size!3643 (_ BitVec 32))) )
))
(declare-datatypes ((array!7043 0))(
  ( (array!7044 (arr!3351 (Array (_ BitVec 32) ValueCell!1643)) (size!3644 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2194 0))(
  ( (LongMapFixedSize!2195 (defaultEntry!3539 Int) (mask!8353 (_ BitVec 32)) (extraKeys!3280 (_ BitVec 32)) (zeroValue!3382 V!4945) (minValue!3382 V!4945) (_size!1146 (_ BitVec 32)) (_keys!5369 array!7041) (_values!3522 array!7043) (_vacant!1146 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2194)

(declare-fun mapKey!6746 () (_ BitVec 32))

(assert (=> mapNonEmpty!6746 (= (arr!3351 (_values!3522 thiss!1248)) (store mapRest!6746 mapKey!6746 mapValue!6746))))

(declare-fun mapIsEmpty!6746 () Bool)

(assert (=> mapIsEmpty!6746 mapRes!6746))

(declare-fun e!112491 () Bool)

(declare-fun e!112494 () Bool)

(declare-fun array_inv!2155 (array!7041) Bool)

(declare-fun array_inv!2156 (array!7043) Bool)

(assert (=> b!170494 (= e!112491 (and tp!15226 tp_is_empty!3973 (array_inv!2155 (_keys!5369 thiss!1248)) (array_inv!2156 (_values!3522 thiss!1248)) e!112494))))

(declare-fun b!170495 () Bool)

(declare-fun res!81048 () Bool)

(assert (=> b!170495 (=> (not res!81048) (not e!112489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170495 (= res!81048 (validMask!0 (mask!8353 thiss!1248)))))

(declare-fun b!170496 () Bool)

(assert (=> b!170496 (= e!112489 (and (= (size!3644 (_values!3522 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8353 thiss!1248))) (= (size!3643 (_keys!5369 thiss!1248)) (size!3644 (_values!3522 thiss!1248))) (bvsge (mask!8353 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3280 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3280 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3280 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt (bvor (extraKeys!3280 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011)))))

(declare-fun b!170492 () Bool)

(assert (=> b!170492 (= e!112494 (and e!112493 mapRes!6746))))

(declare-fun condMapEmpty!6746 () Bool)

(declare-fun mapDefault!6746 () ValueCell!1643)

(assert (=> b!170492 (= condMapEmpty!6746 (= (arr!3351 (_values!3522 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1643)) mapDefault!6746)))))

(declare-fun res!81046 () Bool)

(assert (=> start!16958 (=> (not res!81046) (not e!112489))))

(declare-fun valid!954 (LongMapFixedSize!2194) Bool)

(assert (=> start!16958 (= res!81046 (valid!954 thiss!1248))))

(assert (=> start!16958 e!112489))

(assert (=> start!16958 e!112491))

(assert (=> start!16958 true))

(assert (= (and start!16958 res!81046) b!170493))

(assert (= (and b!170493 res!81047) b!170495))

(assert (= (and b!170495 res!81048) b!170496))

(assert (= (and b!170492 condMapEmpty!6746) mapIsEmpty!6746))

(assert (= (and b!170492 (not condMapEmpty!6746)) mapNonEmpty!6746))

(get-info :version)

(assert (= (and mapNonEmpty!6746 ((_ is ValueCellFull!1643) mapValue!6746)) b!170491))

(assert (= (and b!170492 ((_ is ValueCellFull!1643) mapDefault!6746)) b!170490))

(assert (= b!170494 b!170492))

(assert (= start!16958 b!170494))

(declare-fun m!199135 () Bool)

(assert (=> mapNonEmpty!6746 m!199135))

(declare-fun m!199137 () Bool)

(assert (=> b!170494 m!199137))

(declare-fun m!199139 () Bool)

(assert (=> b!170494 m!199139))

(declare-fun m!199141 () Bool)

(assert (=> b!170495 m!199141))

(declare-fun m!199143 () Bool)

(assert (=> start!16958 m!199143))

(check-sat tp_is_empty!3973 (not b!170495) b_and!10629 (not b_next!4201) (not start!16958) (not mapNonEmpty!6746) (not b!170494))
(check-sat b_and!10629 (not b_next!4201))
