; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16964 () Bool)

(assert start!16964)

(declare-fun b!170556 () Bool)

(declare-fun b_free!4207 () Bool)

(declare-fun b_next!4207 () Bool)

(assert (=> b!170556 (= b_free!4207 (not b_next!4207))))

(declare-fun tp!15244 () Bool)

(declare-fun b_and!10635 () Bool)

(assert (=> b!170556 (= tp!15244 b_and!10635)))

(declare-fun b!170553 () Bool)

(declare-fun res!81075 () Bool)

(declare-fun e!112545 () Bool)

(assert (=> b!170553 (=> (not res!81075) (not e!112545))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170553 (= res!81075 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170554 () Bool)

(declare-fun res!81073 () Bool)

(assert (=> b!170554 (=> (not res!81073) (not e!112545))))

(declare-datatypes ((V!4953 0))(
  ( (V!4954 (val!2034 Int)) )
))
(declare-datatypes ((ValueCell!1646 0))(
  ( (ValueCellFull!1646 (v!3900 V!4953)) (EmptyCell!1646) )
))
(declare-datatypes ((array!7053 0))(
  ( (array!7054 (arr!3356 (Array (_ BitVec 32) (_ BitVec 64))) (size!3649 (_ BitVec 32))) )
))
(declare-datatypes ((array!7055 0))(
  ( (array!7056 (arr!3357 (Array (_ BitVec 32) ValueCell!1646)) (size!3650 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2200 0))(
  ( (LongMapFixedSize!2201 (defaultEntry!3542 Int) (mask!8358 (_ BitVec 32)) (extraKeys!3283 (_ BitVec 32)) (zeroValue!3385 V!4953) (minValue!3385 V!4953) (_size!1149 (_ BitVec 32)) (_keys!5372 array!7053) (_values!3525 array!7055) (_vacant!1149 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2200)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170554 (= res!81073 (validMask!0 (mask!8358 thiss!1248)))))

(declare-fun b!170555 () Bool)

(declare-fun e!112543 () Bool)

(declare-fun tp_is_empty!3979 () Bool)

(assert (=> b!170555 (= e!112543 tp_is_empty!3979)))

(declare-fun mapNonEmpty!6755 () Bool)

(declare-fun mapRes!6755 () Bool)

(declare-fun tp!15245 () Bool)

(assert (=> mapNonEmpty!6755 (= mapRes!6755 (and tp!15245 e!112543))))

(declare-fun mapValue!6755 () ValueCell!1646)

(declare-fun mapRest!6755 () (Array (_ BitVec 32) ValueCell!1646))

(declare-fun mapKey!6755 () (_ BitVec 32))

(assert (=> mapNonEmpty!6755 (= (arr!3357 (_values!3525 thiss!1248)) (store mapRest!6755 mapKey!6755 mapValue!6755))))

(declare-fun e!112548 () Bool)

(declare-fun e!112546 () Bool)

(declare-fun array_inv!2157 (array!7053) Bool)

(declare-fun array_inv!2158 (array!7055) Bool)

(assert (=> b!170556 (= e!112548 (and tp!15244 tp_is_empty!3979 (array_inv!2157 (_keys!5372 thiss!1248)) (array_inv!2158 (_values!3525 thiss!1248)) e!112546))))

(declare-fun res!81074 () Bool)

(assert (=> start!16964 (=> (not res!81074) (not e!112545))))

(declare-fun valid!955 (LongMapFixedSize!2200) Bool)

(assert (=> start!16964 (= res!81074 (valid!955 thiss!1248))))

(assert (=> start!16964 e!112545))

(assert (=> start!16964 e!112548))

(assert (=> start!16964 true))

(declare-fun b!170557 () Bool)

(declare-fun e!112547 () Bool)

(assert (=> b!170557 (= e!112546 (and e!112547 mapRes!6755))))

(declare-fun condMapEmpty!6755 () Bool)

(declare-fun mapDefault!6755 () ValueCell!1646)

(assert (=> b!170557 (= condMapEmpty!6755 (= (arr!3357 (_values!3525 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1646)) mapDefault!6755)))))

(declare-fun b!170558 () Bool)

(assert (=> b!170558 (= e!112545 (and (= (size!3650 (_values!3525 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8358 thiss!1248))) (= (size!3649 (_keys!5372 thiss!1248)) (size!3650 (_values!3525 thiss!1248))) (bvsge (mask!8358 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3283 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3283 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3283 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3283 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!3283 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3283 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))))

(declare-fun mapIsEmpty!6755 () Bool)

(assert (=> mapIsEmpty!6755 mapRes!6755))

(declare-fun b!170559 () Bool)

(assert (=> b!170559 (= e!112547 tp_is_empty!3979)))

(assert (= (and start!16964 res!81074) b!170553))

(assert (= (and b!170553 res!81075) b!170554))

(assert (= (and b!170554 res!81073) b!170558))

(assert (= (and b!170557 condMapEmpty!6755) mapIsEmpty!6755))

(assert (= (and b!170557 (not condMapEmpty!6755)) mapNonEmpty!6755))

(get-info :version)

(assert (= (and mapNonEmpty!6755 ((_ is ValueCellFull!1646) mapValue!6755)) b!170555))

(assert (= (and b!170557 ((_ is ValueCellFull!1646) mapDefault!6755)) b!170559))

(assert (= b!170556 b!170557))

(assert (= start!16964 b!170556))

(declare-fun m!199165 () Bool)

(assert (=> b!170554 m!199165))

(declare-fun m!199167 () Bool)

(assert (=> mapNonEmpty!6755 m!199167))

(declare-fun m!199169 () Bool)

(assert (=> b!170556 m!199169))

(declare-fun m!199171 () Bool)

(assert (=> b!170556 m!199171))

(declare-fun m!199173 () Bool)

(assert (=> start!16964 m!199173))

(check-sat (not b!170554) tp_is_empty!3979 b_and!10635 (not b!170556) (not mapNonEmpty!6755) (not b_next!4207) (not start!16964))
(check-sat b_and!10635 (not b_next!4207))
