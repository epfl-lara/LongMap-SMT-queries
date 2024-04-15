; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16964 () Bool)

(assert start!16964)

(declare-fun b!170361 () Bool)

(declare-fun b_free!4207 () Bool)

(declare-fun b_next!4207 () Bool)

(assert (=> b!170361 (= b_free!4207 (not b_next!4207))))

(declare-fun tp!15244 () Bool)

(declare-fun b_and!10595 () Bool)

(assert (=> b!170361 (= tp!15244 b_and!10595)))

(declare-fun b!170359 () Bool)

(declare-fun e!112419 () Bool)

(declare-fun e!112418 () Bool)

(declare-fun mapRes!6755 () Bool)

(assert (=> b!170359 (= e!112419 (and e!112418 mapRes!6755))))

(declare-fun condMapEmpty!6755 () Bool)

(declare-datatypes ((V!4953 0))(
  ( (V!4954 (val!2034 Int)) )
))
(declare-datatypes ((ValueCell!1646 0))(
  ( (ValueCellFull!1646 (v!3893 V!4953)) (EmptyCell!1646) )
))
(declare-datatypes ((array!7047 0))(
  ( (array!7048 (arr!3352 (Array (_ BitVec 32) (_ BitVec 64))) (size!3646 (_ BitVec 32))) )
))
(declare-datatypes ((array!7049 0))(
  ( (array!7050 (arr!3353 (Array (_ BitVec 32) ValueCell!1646)) (size!3647 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2200 0))(
  ( (LongMapFixedSize!2201 (defaultEntry!3542 Int) (mask!8357 (_ BitVec 32)) (extraKeys!3283 (_ BitVec 32)) (zeroValue!3385 V!4953) (minValue!3385 V!4953) (_size!1149 (_ BitVec 32)) (_keys!5371 array!7047) (_values!3525 array!7049) (_vacant!1149 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2200)

(declare-fun mapDefault!6755 () ValueCell!1646)

(assert (=> b!170359 (= condMapEmpty!6755 (= (arr!3353 (_values!3525 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1646)) mapDefault!6755)))))

(declare-fun mapIsEmpty!6755 () Bool)

(assert (=> mapIsEmpty!6755 mapRes!6755))

(declare-fun mapNonEmpty!6755 () Bool)

(declare-fun tp!15245 () Bool)

(declare-fun e!112420 () Bool)

(assert (=> mapNonEmpty!6755 (= mapRes!6755 (and tp!15245 e!112420))))

(declare-fun mapRest!6755 () (Array (_ BitVec 32) ValueCell!1646))

(declare-fun mapKey!6755 () (_ BitVec 32))

(declare-fun mapValue!6755 () ValueCell!1646)

(assert (=> mapNonEmpty!6755 (= (arr!3353 (_values!3525 thiss!1248)) (store mapRest!6755 mapKey!6755 mapValue!6755))))

(declare-fun res!80959 () Bool)

(declare-fun e!112422 () Bool)

(assert (=> start!16964 (=> (not res!80959) (not e!112422))))

(declare-fun valid!958 (LongMapFixedSize!2200) Bool)

(assert (=> start!16964 (= res!80959 (valid!958 thiss!1248))))

(assert (=> start!16964 e!112422))

(declare-fun e!112423 () Bool)

(assert (=> start!16964 e!112423))

(assert (=> start!16964 true))

(declare-fun b!170360 () Bool)

(declare-fun tp_is_empty!3979 () Bool)

(assert (=> b!170360 (= e!112420 tp_is_empty!3979)))

(declare-fun array_inv!2159 (array!7047) Bool)

(declare-fun array_inv!2160 (array!7049) Bool)

(assert (=> b!170361 (= e!112423 (and tp!15244 tp_is_empty!3979 (array_inv!2159 (_keys!5371 thiss!1248)) (array_inv!2160 (_values!3525 thiss!1248)) e!112419))))

(declare-fun b!170362 () Bool)

(assert (=> b!170362 (= e!112422 (and (= (size!3647 (_values!3525 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8357 thiss!1248))) (= (size!3646 (_keys!5371 thiss!1248)) (size!3647 (_values!3525 thiss!1248))) (bvsge (mask!8357 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3283 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3283 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3283 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3283 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!3283 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3283 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))))

(declare-fun b!170363 () Bool)

(declare-fun res!80957 () Bool)

(assert (=> b!170363 (=> (not res!80957) (not e!112422))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170363 (= res!80957 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170364 () Bool)

(declare-fun res!80958 () Bool)

(assert (=> b!170364 (=> (not res!80958) (not e!112422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170364 (= res!80958 (validMask!0 (mask!8357 thiss!1248)))))

(declare-fun b!170365 () Bool)

(assert (=> b!170365 (= e!112418 tp_is_empty!3979)))

(assert (= (and start!16964 res!80959) b!170363))

(assert (= (and b!170363 res!80957) b!170364))

(assert (= (and b!170364 res!80958) b!170362))

(assert (= (and b!170359 condMapEmpty!6755) mapIsEmpty!6755))

(assert (= (and b!170359 (not condMapEmpty!6755)) mapNonEmpty!6755))

(get-info :version)

(assert (= (and mapNonEmpty!6755 ((_ is ValueCellFull!1646) mapValue!6755)) b!170360))

(assert (= (and b!170359 ((_ is ValueCellFull!1646) mapDefault!6755)) b!170365))

(assert (= b!170361 b!170359))

(assert (= start!16964 b!170361))

(declare-fun m!198363 () Bool)

(assert (=> mapNonEmpty!6755 m!198363))

(declare-fun m!198365 () Bool)

(assert (=> start!16964 m!198365))

(declare-fun m!198367 () Bool)

(assert (=> b!170361 m!198367))

(declare-fun m!198369 () Bool)

(assert (=> b!170361 m!198369))

(declare-fun m!198371 () Bool)

(assert (=> b!170364 m!198371))

(check-sat (not b_next!4207) (not b!170361) (not mapNonEmpty!6755) (not start!16964) (not b!170364) tp_is_empty!3979 b_and!10595)
(check-sat b_and!10595 (not b_next!4207))
