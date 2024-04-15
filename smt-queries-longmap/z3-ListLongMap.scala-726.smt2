; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16952 () Bool)

(assert start!16952)

(declare-fun b!170233 () Bool)

(declare-fun b_free!4195 () Bool)

(declare-fun b_next!4195 () Bool)

(assert (=> b!170233 (= b_free!4195 (not b_next!4195))))

(declare-fun tp!15209 () Bool)

(declare-fun b_and!10583 () Bool)

(assert (=> b!170233 (= tp!15209 b_and!10583)))

(declare-fun e!112313 () Bool)

(declare-datatypes ((V!4937 0))(
  ( (V!4938 (val!2028 Int)) )
))
(declare-datatypes ((ValueCell!1640 0))(
  ( (ValueCellFull!1640 (v!3887 V!4937)) (EmptyCell!1640) )
))
(declare-datatypes ((array!7023 0))(
  ( (array!7024 (arr!3340 (Array (_ BitVec 32) (_ BitVec 64))) (size!3634 (_ BitVec 32))) )
))
(declare-datatypes ((array!7025 0))(
  ( (array!7026 (arr!3341 (Array (_ BitVec 32) ValueCell!1640)) (size!3635 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2188 0))(
  ( (LongMapFixedSize!2189 (defaultEntry!3536 Int) (mask!8347 (_ BitVec 32)) (extraKeys!3277 (_ BitVec 32)) (zeroValue!3379 V!4937) (minValue!3379 V!4937) (_size!1143 (_ BitVec 32)) (_keys!5365 array!7023) (_values!3519 array!7025) (_vacant!1143 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2188)

(declare-fun tp_is_empty!3967 () Bool)

(declare-fun e!112315 () Bool)

(declare-fun array_inv!2149 (array!7023) Bool)

(declare-fun array_inv!2150 (array!7025) Bool)

(assert (=> b!170233 (= e!112315 (and tp!15209 tp_is_empty!3967 (array_inv!2149 (_keys!5365 thiss!1248)) (array_inv!2150 (_values!3519 thiss!1248)) e!112313))))

(declare-fun b!170234 () Bool)

(declare-fun res!80905 () Bool)

(declare-fun e!112311 () Bool)

(assert (=> b!170234 (=> (not res!80905) (not e!112311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170234 (= res!80905 (validMask!0 (mask!8347 thiss!1248)))))

(declare-fun b!170235 () Bool)

(declare-fun e!112314 () Bool)

(assert (=> b!170235 (= e!112314 tp_is_empty!3967)))

(declare-fun b!170236 () Bool)

(declare-fun res!80904 () Bool)

(assert (=> b!170236 (=> (not res!80904) (not e!112311))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170236 (= res!80904 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!80903 () Bool)

(assert (=> start!16952 (=> (not res!80903) (not e!112311))))

(declare-fun valid!955 (LongMapFixedSize!2188) Bool)

(assert (=> start!16952 (= res!80903 (valid!955 thiss!1248))))

(assert (=> start!16952 e!112311))

(assert (=> start!16952 e!112315))

(assert (=> start!16952 true))

(declare-fun mapNonEmpty!6737 () Bool)

(declare-fun mapRes!6737 () Bool)

(declare-fun tp!15208 () Bool)

(assert (=> mapNonEmpty!6737 (= mapRes!6737 (and tp!15208 e!112314))))

(declare-fun mapRest!6737 () (Array (_ BitVec 32) ValueCell!1640))

(declare-fun mapValue!6737 () ValueCell!1640)

(declare-fun mapKey!6737 () (_ BitVec 32))

(assert (=> mapNonEmpty!6737 (= (arr!3341 (_values!3519 thiss!1248)) (store mapRest!6737 mapKey!6737 mapValue!6737))))

(declare-fun b!170237 () Bool)

(assert (=> b!170237 (= e!112311 (and (= (size!3635 (_values!3519 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8347 thiss!1248))) (= (size!3634 (_keys!5365 thiss!1248)) (size!3635 (_values!3519 thiss!1248))) (bvsge (mask!8347 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3277 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3277 thiss!1248) #b00000000000000000000000000000011) (bvslt (bvor (extraKeys!3277 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!6737 () Bool)

(assert (=> mapIsEmpty!6737 mapRes!6737))

(declare-fun b!170238 () Bool)

(declare-fun e!112310 () Bool)

(assert (=> b!170238 (= e!112313 (and e!112310 mapRes!6737))))

(declare-fun condMapEmpty!6737 () Bool)

(declare-fun mapDefault!6737 () ValueCell!1640)

(assert (=> b!170238 (= condMapEmpty!6737 (= (arr!3341 (_values!3519 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1640)) mapDefault!6737)))))

(declare-fun b!170239 () Bool)

(assert (=> b!170239 (= e!112310 tp_is_empty!3967)))

(assert (= (and start!16952 res!80903) b!170236))

(assert (= (and b!170236 res!80904) b!170234))

(assert (= (and b!170234 res!80905) b!170237))

(assert (= (and b!170238 condMapEmpty!6737) mapIsEmpty!6737))

(assert (= (and b!170238 (not condMapEmpty!6737)) mapNonEmpty!6737))

(get-info :version)

(assert (= (and mapNonEmpty!6737 ((_ is ValueCellFull!1640) mapValue!6737)) b!170235))

(assert (= (and b!170238 ((_ is ValueCellFull!1640) mapDefault!6737)) b!170239))

(assert (= b!170233 b!170238))

(assert (= start!16952 b!170233))

(declare-fun m!198303 () Bool)

(assert (=> b!170233 m!198303))

(declare-fun m!198305 () Bool)

(assert (=> b!170233 m!198305))

(declare-fun m!198307 () Bool)

(assert (=> b!170234 m!198307))

(declare-fun m!198309 () Bool)

(assert (=> start!16952 m!198309))

(declare-fun m!198311 () Bool)

(assert (=> mapNonEmpty!6737 m!198311))

(check-sat (not mapNonEmpty!6737) (not b!170233) (not start!16952) (not b!170234) (not b_next!4195) b_and!10583 tp_is_empty!3967)
(check-sat b_and!10583 (not b_next!4195))
