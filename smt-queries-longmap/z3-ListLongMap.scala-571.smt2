; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15572 () Bool)

(assert start!15572)

(declare-fun b!154947 () Bool)

(declare-fun b_free!3235 () Bool)

(declare-fun b_next!3235 () Bool)

(assert (=> b!154947 (= b_free!3235 (not b_next!3235))))

(declare-fun tp!12229 () Bool)

(declare-fun b_and!9663 () Bool)

(assert (=> b!154947 (= tp!12229 b_and!9663)))

(declare-fun b!154943 () Bool)

(declare-fun res!73135 () Bool)

(declare-fun e!101214 () Bool)

(assert (=> b!154943 (=> (not res!73135) (not e!101214))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!154943 (= res!73135 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154944 () Bool)

(declare-fun res!73132 () Bool)

(assert (=> b!154944 (=> (not res!73132) (not e!101214))))

(declare-datatypes ((V!3697 0))(
  ( (V!3698 (val!1563 Int)) )
))
(declare-datatypes ((ValueCell!1175 0))(
  ( (ValueCellFull!1175 (v!3429 V!3697)) (EmptyCell!1175) )
))
(declare-datatypes ((array!5113 0))(
  ( (array!5114 (arr!2414 (Array (_ BitVec 32) (_ BitVec 64))) (size!2692 (_ BitVec 32))) )
))
(declare-datatypes ((array!5115 0))(
  ( (array!5116 (arr!2415 (Array (_ BitVec 32) ValueCell!1175)) (size!2693 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1258 0))(
  ( (LongMapFixedSize!1259 (defaultEntry!3071 Int) (mask!7482 (_ BitVec 32)) (extraKeys!2812 (_ BitVec 32)) (zeroValue!2914 V!3697) (minValue!2914 V!3697) (_size!678 (_ BitVec 32)) (_keys!4846 array!5113) (_values!3054 array!5115) (_vacant!678 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1258)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5113 (_ BitVec 32)) Bool)

(assert (=> b!154944 (= res!73132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4846 thiss!1248) (mask!7482 thiss!1248)))))

(declare-fun mapNonEmpty!5198 () Bool)

(declare-fun mapRes!5198 () Bool)

(declare-fun tp!12230 () Bool)

(declare-fun e!101217 () Bool)

(assert (=> mapNonEmpty!5198 (= mapRes!5198 (and tp!12230 e!101217))))

(declare-fun mapRest!5198 () (Array (_ BitVec 32) ValueCell!1175))

(declare-fun mapKey!5198 () (_ BitVec 32))

(declare-fun mapValue!5198 () ValueCell!1175)

(assert (=> mapNonEmpty!5198 (= (arr!2415 (_values!3054 thiss!1248)) (store mapRest!5198 mapKey!5198 mapValue!5198))))

(declare-fun res!73133 () Bool)

(assert (=> start!15572 (=> (not res!73133) (not e!101214))))

(declare-fun valid!637 (LongMapFixedSize!1258) Bool)

(assert (=> start!15572 (= res!73133 (valid!637 thiss!1248))))

(assert (=> start!15572 e!101214))

(declare-fun e!101212 () Bool)

(assert (=> start!15572 e!101212))

(assert (=> start!15572 true))

(declare-fun b!154945 () Bool)

(declare-fun e!101216 () Bool)

(declare-fun tp_is_empty!3037 () Bool)

(assert (=> b!154945 (= e!101216 tp_is_empty!3037)))

(declare-fun b!154946 () Bool)

(assert (=> b!154946 (= e!101217 tp_is_empty!3037)))

(declare-fun mapIsEmpty!5198 () Bool)

(assert (=> mapIsEmpty!5198 mapRes!5198))

(declare-fun e!101215 () Bool)

(declare-fun array_inv!1523 (array!5113) Bool)

(declare-fun array_inv!1524 (array!5115) Bool)

(assert (=> b!154947 (= e!101212 (and tp!12229 tp_is_empty!3037 (array_inv!1523 (_keys!4846 thiss!1248)) (array_inv!1524 (_values!3054 thiss!1248)) e!101215))))

(declare-fun b!154948 () Bool)

(assert (=> b!154948 (= e!101214 false)))

(declare-fun lt!81363 () Bool)

(declare-datatypes ((List!1793 0))(
  ( (Nil!1790) (Cons!1789 (h!2398 (_ BitVec 64)) (t!6587 List!1793)) )
))
(declare-fun arrayNoDuplicates!0 (array!5113 (_ BitVec 32) List!1793) Bool)

(assert (=> b!154948 (= lt!81363 (arrayNoDuplicates!0 (_keys!4846 thiss!1248) #b00000000000000000000000000000000 Nil!1790))))

(declare-fun b!154949 () Bool)

(declare-fun res!73134 () Bool)

(assert (=> b!154949 (=> (not res!73134) (not e!101214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154949 (= res!73134 (validMask!0 (mask!7482 thiss!1248)))))

(declare-fun b!154950 () Bool)

(assert (=> b!154950 (= e!101215 (and e!101216 mapRes!5198))))

(declare-fun condMapEmpty!5198 () Bool)

(declare-fun mapDefault!5198 () ValueCell!1175)

(assert (=> b!154950 (= condMapEmpty!5198 (= (arr!2415 (_values!3054 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1175)) mapDefault!5198)))))

(declare-fun b!154951 () Bool)

(declare-fun res!73131 () Bool)

(assert (=> b!154951 (=> (not res!73131) (not e!101214))))

(assert (=> b!154951 (= res!73131 (and (= (size!2693 (_values!3054 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7482 thiss!1248))) (= (size!2692 (_keys!4846 thiss!1248)) (size!2693 (_values!3054 thiss!1248))) (bvsge (mask!7482 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2812 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2812 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2812 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!15572 res!73133) b!154943))

(assert (= (and b!154943 res!73135) b!154949))

(assert (= (and b!154949 res!73134) b!154951))

(assert (= (and b!154951 res!73131) b!154944))

(assert (= (and b!154944 res!73132) b!154948))

(assert (= (and b!154950 condMapEmpty!5198) mapIsEmpty!5198))

(assert (= (and b!154950 (not condMapEmpty!5198)) mapNonEmpty!5198))

(get-info :version)

(assert (= (and mapNonEmpty!5198 ((_ is ValueCellFull!1175) mapValue!5198)) b!154946))

(assert (= (and b!154950 ((_ is ValueCellFull!1175) mapDefault!5198)) b!154945))

(assert (= b!154947 b!154950))

(assert (= start!15572 b!154947))

(declare-fun m!189239 () Bool)

(assert (=> b!154949 m!189239))

(declare-fun m!189241 () Bool)

(assert (=> start!15572 m!189241))

(declare-fun m!189243 () Bool)

(assert (=> b!154944 m!189243))

(declare-fun m!189245 () Bool)

(assert (=> b!154947 m!189245))

(declare-fun m!189247 () Bool)

(assert (=> b!154947 m!189247))

(declare-fun m!189249 () Bool)

(assert (=> mapNonEmpty!5198 m!189249))

(declare-fun m!189251 () Bool)

(assert (=> b!154948 m!189251))

(check-sat (not b!154944) (not b!154948) (not start!15572) b_and!9663 (not b!154947) tp_is_empty!3037 (not mapNonEmpty!5198) (not b_next!3235) (not b!154949))
(check-sat b_and!9663 (not b_next!3235))
