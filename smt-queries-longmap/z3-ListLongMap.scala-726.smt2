; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16952 () Bool)

(assert start!16952)

(declare-fun b!170431 () Bool)

(declare-fun b_free!4195 () Bool)

(declare-fun b_next!4195 () Bool)

(assert (=> b!170431 (= b_free!4195 (not b_next!4195))))

(declare-fun tp!15208 () Bool)

(declare-fun b_and!10623 () Bool)

(assert (=> b!170431 (= tp!15208 b_and!10623)))

(declare-fun res!81020 () Bool)

(declare-fun e!112436 () Bool)

(assert (=> start!16952 (=> (not res!81020) (not e!112436))))

(declare-datatypes ((V!4937 0))(
  ( (V!4938 (val!2028 Int)) )
))
(declare-datatypes ((ValueCell!1640 0))(
  ( (ValueCellFull!1640 (v!3894 V!4937)) (EmptyCell!1640) )
))
(declare-datatypes ((array!7029 0))(
  ( (array!7030 (arr!3344 (Array (_ BitVec 32) (_ BitVec 64))) (size!3637 (_ BitVec 32))) )
))
(declare-datatypes ((array!7031 0))(
  ( (array!7032 (arr!3345 (Array (_ BitVec 32) ValueCell!1640)) (size!3638 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2188 0))(
  ( (LongMapFixedSize!2189 (defaultEntry!3536 Int) (mask!8348 (_ BitVec 32)) (extraKeys!3277 (_ BitVec 32)) (zeroValue!3379 V!4937) (minValue!3379 V!4937) (_size!1143 (_ BitVec 32)) (_keys!5366 array!7029) (_values!3519 array!7031) (_vacant!1143 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2188)

(declare-fun valid!953 (LongMapFixedSize!2188) Bool)

(assert (=> start!16952 (= res!81020 (valid!953 thiss!1248))))

(assert (=> start!16952 e!112436))

(declare-fun e!112439 () Bool)

(assert (=> start!16952 e!112439))

(assert (=> start!16952 true))

(declare-fun b!170427 () Bool)

(declare-fun res!81019 () Bool)

(assert (=> b!170427 (=> (not res!81019) (not e!112436))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170427 (= res!81019 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!6737 () Bool)

(declare-fun mapRes!6737 () Bool)

(assert (=> mapIsEmpty!6737 mapRes!6737))

(declare-fun b!170428 () Bool)

(declare-fun e!112437 () Bool)

(declare-fun tp_is_empty!3967 () Bool)

(assert (=> b!170428 (= e!112437 tp_is_empty!3967)))

(declare-fun b!170429 () Bool)

(declare-fun e!112440 () Bool)

(declare-fun e!112438 () Bool)

(assert (=> b!170429 (= e!112440 (and e!112438 mapRes!6737))))

(declare-fun condMapEmpty!6737 () Bool)

(declare-fun mapDefault!6737 () ValueCell!1640)

(assert (=> b!170429 (= condMapEmpty!6737 (= (arr!3345 (_values!3519 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1640)) mapDefault!6737)))))

(declare-fun b!170430 () Bool)

(assert (=> b!170430 (= e!112436 (and (= (size!3638 (_values!3519 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8348 thiss!1248))) (= (size!3637 (_keys!5366 thiss!1248)) (size!3638 (_values!3519 thiss!1248))) (bvsge (mask!8348 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3277 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3277 thiss!1248) #b00000000000000000000000000000011) (bvslt (bvor (extraKeys!3277 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun array_inv!2151 (array!7029) Bool)

(declare-fun array_inv!2152 (array!7031) Bool)

(assert (=> b!170431 (= e!112439 (and tp!15208 tp_is_empty!3967 (array_inv!2151 (_keys!5366 thiss!1248)) (array_inv!2152 (_values!3519 thiss!1248)) e!112440))))

(declare-fun b!170432 () Bool)

(assert (=> b!170432 (= e!112438 tp_is_empty!3967)))

(declare-fun mapNonEmpty!6737 () Bool)

(declare-fun tp!15209 () Bool)

(assert (=> mapNonEmpty!6737 (= mapRes!6737 (and tp!15209 e!112437))))

(declare-fun mapValue!6737 () ValueCell!1640)

(declare-fun mapRest!6737 () (Array (_ BitVec 32) ValueCell!1640))

(declare-fun mapKey!6737 () (_ BitVec 32))

(assert (=> mapNonEmpty!6737 (= (arr!3345 (_values!3519 thiss!1248)) (store mapRest!6737 mapKey!6737 mapValue!6737))))

(declare-fun b!170433 () Bool)

(declare-fun res!81021 () Bool)

(assert (=> b!170433 (=> (not res!81021) (not e!112436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170433 (= res!81021 (validMask!0 (mask!8348 thiss!1248)))))

(assert (= (and start!16952 res!81020) b!170427))

(assert (= (and b!170427 res!81019) b!170433))

(assert (= (and b!170433 res!81021) b!170430))

(assert (= (and b!170429 condMapEmpty!6737) mapIsEmpty!6737))

(assert (= (and b!170429 (not condMapEmpty!6737)) mapNonEmpty!6737))

(get-info :version)

(assert (= (and mapNonEmpty!6737 ((_ is ValueCellFull!1640) mapValue!6737)) b!170428))

(assert (= (and b!170429 ((_ is ValueCellFull!1640) mapDefault!6737)) b!170432))

(assert (= b!170431 b!170429))

(assert (= start!16952 b!170431))

(declare-fun m!199105 () Bool)

(assert (=> start!16952 m!199105))

(declare-fun m!199107 () Bool)

(assert (=> b!170431 m!199107))

(declare-fun m!199109 () Bool)

(assert (=> b!170431 m!199109))

(declare-fun m!199111 () Bool)

(assert (=> mapNonEmpty!6737 m!199111))

(declare-fun m!199113 () Bool)

(assert (=> b!170433 m!199113))

(check-sat (not b_next!4195) (not start!16952) tp_is_empty!3967 (not mapNonEmpty!6737) b_and!10623 (not b!170431) (not b!170433))
(check-sat b_and!10623 (not b_next!4195))
