; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15572 () Bool)

(assert start!15572)

(declare-fun b!154754 () Bool)

(declare-fun b_free!3235 () Bool)

(declare-fun b_next!3235 () Bool)

(assert (=> b!154754 (= b_free!3235 (not b_next!3235))))

(declare-fun tp!12230 () Bool)

(declare-fun b_and!9623 () Bool)

(assert (=> b!154754 (= tp!12230 b_and!9623)))

(declare-fun b!154749 () Bool)

(declare-fun res!73018 () Bool)

(declare-fun e!101089 () Bool)

(assert (=> b!154749 (=> (not res!73018) (not e!101089))))

(declare-datatypes ((V!3697 0))(
  ( (V!3698 (val!1563 Int)) )
))
(declare-datatypes ((ValueCell!1175 0))(
  ( (ValueCellFull!1175 (v!3422 V!3697)) (EmptyCell!1175) )
))
(declare-datatypes ((array!5107 0))(
  ( (array!5108 (arr!2410 (Array (_ BitVec 32) (_ BitVec 64))) (size!2689 (_ BitVec 32))) )
))
(declare-datatypes ((array!5109 0))(
  ( (array!5110 (arr!2411 (Array (_ BitVec 32) ValueCell!1175)) (size!2690 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1258 0))(
  ( (LongMapFixedSize!1259 (defaultEntry!3071 Int) (mask!7481 (_ BitVec 32)) (extraKeys!2812 (_ BitVec 32)) (zeroValue!2914 V!3697) (minValue!2914 V!3697) (_size!678 (_ BitVec 32)) (_keys!4845 array!5107) (_values!3054 array!5109) (_vacant!678 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1258)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5107 (_ BitVec 32)) Bool)

(assert (=> b!154749 (= res!73018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4845 thiss!1248) (mask!7481 thiss!1248)))))

(declare-fun b!154750 () Bool)

(declare-fun e!101092 () Bool)

(declare-fun tp_is_empty!3037 () Bool)

(assert (=> b!154750 (= e!101092 tp_is_empty!3037)))

(declare-fun b!154751 () Bool)

(declare-fun res!73019 () Bool)

(assert (=> b!154751 (=> (not res!73019) (not e!101089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154751 (= res!73019 (validMask!0 (mask!7481 thiss!1248)))))

(declare-fun b!154752 () Bool)

(declare-fun res!73015 () Bool)

(assert (=> b!154752 (=> (not res!73015) (not e!101089))))

(assert (=> b!154752 (= res!73015 (and (= (size!2690 (_values!3054 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7481 thiss!1248))) (= (size!2689 (_keys!4845 thiss!1248)) (size!2690 (_values!3054 thiss!1248))) (bvsge (mask!7481 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2812 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2812 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2812 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2812 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5198 () Bool)

(declare-fun mapRes!5198 () Bool)

(declare-fun tp!12229 () Bool)

(assert (=> mapNonEmpty!5198 (= mapRes!5198 (and tp!12229 e!101092))))

(declare-fun mapRest!5198 () (Array (_ BitVec 32) ValueCell!1175))

(declare-fun mapKey!5198 () (_ BitVec 32))

(declare-fun mapValue!5198 () ValueCell!1175)

(assert (=> mapNonEmpty!5198 (= (arr!2411 (_values!3054 thiss!1248)) (store mapRest!5198 mapKey!5198 mapValue!5198))))

(declare-fun mapIsEmpty!5198 () Bool)

(assert (=> mapIsEmpty!5198 mapRes!5198))

(declare-fun e!101088 () Bool)

(declare-fun e!101087 () Bool)

(declare-fun array_inv!1545 (array!5107) Bool)

(declare-fun array_inv!1546 (array!5109) Bool)

(assert (=> b!154754 (= e!101088 (and tp!12230 tp_is_empty!3037 (array_inv!1545 (_keys!4845 thiss!1248)) (array_inv!1546 (_values!3054 thiss!1248)) e!101087))))

(declare-fun b!154755 () Bool)

(assert (=> b!154755 (= e!101089 false)))

(declare-fun lt!81123 () Bool)

(declare-datatypes ((List!1814 0))(
  ( (Nil!1811) (Cons!1810 (h!2419 (_ BitVec 64)) (t!6607 List!1814)) )
))
(declare-fun arrayNoDuplicates!0 (array!5107 (_ BitVec 32) List!1814) Bool)

(assert (=> b!154755 (= lt!81123 (arrayNoDuplicates!0 (_keys!4845 thiss!1248) #b00000000000000000000000000000000 Nil!1811))))

(declare-fun b!154756 () Bool)

(declare-fun res!73016 () Bool)

(assert (=> b!154756 (=> (not res!73016) (not e!101089))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!154756 (= res!73016 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154757 () Bool)

(declare-fun e!101091 () Bool)

(assert (=> b!154757 (= e!101087 (and e!101091 mapRes!5198))))

(declare-fun condMapEmpty!5198 () Bool)

(declare-fun mapDefault!5198 () ValueCell!1175)

(assert (=> b!154757 (= condMapEmpty!5198 (= (arr!2411 (_values!3054 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1175)) mapDefault!5198)))))

(declare-fun res!73017 () Bool)

(assert (=> start!15572 (=> (not res!73017) (not e!101089))))

(declare-fun valid!630 (LongMapFixedSize!1258) Bool)

(assert (=> start!15572 (= res!73017 (valid!630 thiss!1248))))

(assert (=> start!15572 e!101089))

(assert (=> start!15572 e!101088))

(assert (=> start!15572 true))

(declare-fun b!154753 () Bool)

(assert (=> b!154753 (= e!101091 tp_is_empty!3037)))

(assert (= (and start!15572 res!73017) b!154756))

(assert (= (and b!154756 res!73016) b!154751))

(assert (= (and b!154751 res!73019) b!154752))

(assert (= (and b!154752 res!73015) b!154749))

(assert (= (and b!154749 res!73018) b!154755))

(assert (= (and b!154757 condMapEmpty!5198) mapIsEmpty!5198))

(assert (= (and b!154757 (not condMapEmpty!5198)) mapNonEmpty!5198))

(get-info :version)

(assert (= (and mapNonEmpty!5198 ((_ is ValueCellFull!1175) mapValue!5198)) b!154750))

(assert (= (and b!154757 ((_ is ValueCellFull!1175) mapDefault!5198)) b!154753))

(assert (= b!154754 b!154757))

(assert (= start!15572 b!154754))

(declare-fun m!188437 () Bool)

(assert (=> b!154755 m!188437))

(declare-fun m!188439 () Bool)

(assert (=> mapNonEmpty!5198 m!188439))

(declare-fun m!188441 () Bool)

(assert (=> start!15572 m!188441))

(declare-fun m!188443 () Bool)

(assert (=> b!154754 m!188443))

(declare-fun m!188445 () Bool)

(assert (=> b!154754 m!188445))

(declare-fun m!188447 () Bool)

(assert (=> b!154751 m!188447))

(declare-fun m!188449 () Bool)

(assert (=> b!154749 m!188449))

(check-sat (not b_next!3235) (not b!154754) (not b!154749) (not start!15572) (not b!154751) b_and!9623 tp_is_empty!3037 (not mapNonEmpty!5198) (not b!154755))
(check-sat b_and!9623 (not b_next!3235))
