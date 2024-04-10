; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15588 () Bool)

(assert start!15588)

(declare-fun b!155173 () Bool)

(declare-fun b_free!3255 () Bool)

(declare-fun b_next!3255 () Bool)

(assert (=> b!155173 (= b_free!3255 (not b_next!3255))))

(declare-fun tp!12289 () Bool)

(declare-fun b_and!9669 () Bool)

(assert (=> b!155173 (= tp!12289 b_and!9669)))

(declare-fun b!155166 () Bool)

(declare-fun e!101371 () Bool)

(declare-fun tp_is_empty!3057 () Bool)

(assert (=> b!155166 (= e!101371 tp_is_empty!3057)))

(declare-fun b!155167 () Bool)

(declare-fun e!101369 () Bool)

(assert (=> b!155167 (= e!101369 false)))

(declare-fun lt!81334 () Bool)

(declare-datatypes ((V!3723 0))(
  ( (V!3724 (val!1573 Int)) )
))
(declare-datatypes ((ValueCell!1185 0))(
  ( (ValueCellFull!1185 (v!3438 V!3723)) (EmptyCell!1185) )
))
(declare-datatypes ((array!5167 0))(
  ( (array!5168 (arr!2441 (Array (_ BitVec 32) (_ BitVec 64))) (size!2719 (_ BitVec 32))) )
))
(declare-datatypes ((array!5169 0))(
  ( (array!5170 (arr!2442 (Array (_ BitVec 32) ValueCell!1185)) (size!2720 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1278 0))(
  ( (LongMapFixedSize!1279 (defaultEntry!3081 Int) (mask!7498 (_ BitVec 32)) (extraKeys!2822 (_ BitVec 32)) (zeroValue!2924 V!3723) (minValue!2924 V!3723) (_size!688 (_ BitVec 32)) (_keys!4856 array!5167) (_values!3064 array!5169) (_vacant!688 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1278)

(declare-datatypes ((List!1817 0))(
  ( (Nil!1814) (Cons!1813 (h!2422 (_ BitVec 64)) (t!6619 List!1817)) )
))
(declare-fun arrayNoDuplicates!0 (array!5167 (_ BitVec 32) List!1817) Bool)

(assert (=> b!155167 (= lt!81334 (arrayNoDuplicates!0 (_keys!4856 thiss!1248) #b00000000000000000000000000000000 Nil!1814))))

(declare-fun mapNonEmpty!5228 () Bool)

(declare-fun mapRes!5228 () Bool)

(declare-fun tp!12290 () Bool)

(assert (=> mapNonEmpty!5228 (= mapRes!5228 (and tp!12290 e!101371))))

(declare-fun mapKey!5228 () (_ BitVec 32))

(declare-fun mapRest!5228 () (Array (_ BitVec 32) ValueCell!1185))

(declare-fun mapValue!5228 () ValueCell!1185)

(assert (=> mapNonEmpty!5228 (= (arr!2442 (_values!3064 thiss!1248)) (store mapRest!5228 mapKey!5228 mapValue!5228))))

(declare-fun b!155168 () Bool)

(declare-fun res!73264 () Bool)

(assert (=> b!155168 (=> (not res!73264) (not e!101369))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155168 (= res!73264 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5228 () Bool)

(assert (=> mapIsEmpty!5228 mapRes!5228))

(declare-fun b!155169 () Bool)

(declare-fun res!73263 () Bool)

(assert (=> b!155169 (=> (not res!73263) (not e!101369))))

(assert (=> b!155169 (= res!73263 (and (= (size!2720 (_values!3064 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7498 thiss!1248))) (= (size!2719 (_keys!4856 thiss!1248)) (size!2720 (_values!3064 thiss!1248))) (bvsge (mask!7498 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2822 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2822 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2822 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2822 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2822 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2822 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2822 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!73260 () Bool)

(assert (=> start!15588 (=> (not res!73260) (not e!101369))))

(declare-fun valid!629 (LongMapFixedSize!1278) Bool)

(assert (=> start!15588 (= res!73260 (valid!629 thiss!1248))))

(assert (=> start!15588 e!101369))

(declare-fun e!101370 () Bool)

(assert (=> start!15588 e!101370))

(assert (=> start!15588 true))

(declare-fun b!155170 () Bool)

(declare-fun e!101372 () Bool)

(declare-fun e!101368 () Bool)

(assert (=> b!155170 (= e!101372 (and e!101368 mapRes!5228))))

(declare-fun condMapEmpty!5228 () Bool)

(declare-fun mapDefault!5228 () ValueCell!1185)

(assert (=> b!155170 (= condMapEmpty!5228 (= (arr!2442 (_values!3064 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1185)) mapDefault!5228)))))

(declare-fun b!155171 () Bool)

(declare-fun res!73262 () Bool)

(assert (=> b!155171 (=> (not res!73262) (not e!101369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5167 (_ BitVec 32)) Bool)

(assert (=> b!155171 (= res!73262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4856 thiss!1248) (mask!7498 thiss!1248)))))

(declare-fun b!155172 () Bool)

(declare-fun res!73261 () Bool)

(assert (=> b!155172 (=> (not res!73261) (not e!101369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155172 (= res!73261 (validMask!0 (mask!7498 thiss!1248)))))

(declare-fun array_inv!1545 (array!5167) Bool)

(declare-fun array_inv!1546 (array!5169) Bool)

(assert (=> b!155173 (= e!101370 (and tp!12289 tp_is_empty!3057 (array_inv!1545 (_keys!4856 thiss!1248)) (array_inv!1546 (_values!3064 thiss!1248)) e!101372))))

(declare-fun b!155174 () Bool)

(assert (=> b!155174 (= e!101368 tp_is_empty!3057)))

(assert (= (and start!15588 res!73260) b!155168))

(assert (= (and b!155168 res!73264) b!155172))

(assert (= (and b!155172 res!73261) b!155169))

(assert (= (and b!155169 res!73263) b!155171))

(assert (= (and b!155171 res!73262) b!155167))

(assert (= (and b!155170 condMapEmpty!5228) mapIsEmpty!5228))

(assert (= (and b!155170 (not condMapEmpty!5228)) mapNonEmpty!5228))

(get-info :version)

(assert (= (and mapNonEmpty!5228 ((_ is ValueCellFull!1185) mapValue!5228)) b!155166))

(assert (= (and b!155170 ((_ is ValueCellFull!1185) mapDefault!5228)) b!155174))

(assert (= b!155173 b!155170))

(assert (= start!15588 b!155173))

(declare-fun m!189197 () Bool)

(assert (=> mapNonEmpty!5228 m!189197))

(declare-fun m!189199 () Bool)

(assert (=> b!155167 m!189199))

(declare-fun m!189201 () Bool)

(assert (=> b!155171 m!189201))

(declare-fun m!189203 () Bool)

(assert (=> b!155173 m!189203))

(declare-fun m!189205 () Bool)

(assert (=> b!155173 m!189205))

(declare-fun m!189207 () Bool)

(assert (=> b!155172 m!189207))

(declare-fun m!189209 () Bool)

(assert (=> start!15588 m!189209))

(check-sat (not b!155171) (not mapNonEmpty!5228) (not b_next!3255) (not b!155167) tp_is_empty!3057 b_and!9669 (not b!155172) (not start!15588) (not b!155173))
(check-sat b_and!9669 (not b_next!3255))
