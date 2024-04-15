; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15584 () Bool)

(assert start!15584)

(declare-fun b!154918 () Bool)

(declare-fun b_free!3247 () Bool)

(declare-fun b_next!3247 () Bool)

(assert (=> b!154918 (= b_free!3247 (not b_next!3247))))

(declare-fun tp!12266 () Bool)

(declare-fun b_and!9635 () Bool)

(assert (=> b!154918 (= tp!12266 b_and!9635)))

(declare-fun b!154911 () Bool)

(declare-fun res!73105 () Bool)

(declare-fun e!101200 () Bool)

(assert (=> b!154911 (=> (not res!73105) (not e!101200))))

(declare-datatypes ((V!3713 0))(
  ( (V!3714 (val!1569 Int)) )
))
(declare-datatypes ((ValueCell!1181 0))(
  ( (ValueCellFull!1181 (v!3428 V!3713)) (EmptyCell!1181) )
))
(declare-datatypes ((array!5131 0))(
  ( (array!5132 (arr!2422 (Array (_ BitVec 32) (_ BitVec 64))) (size!2701 (_ BitVec 32))) )
))
(declare-datatypes ((array!5133 0))(
  ( (array!5134 (arr!2423 (Array (_ BitVec 32) ValueCell!1181)) (size!2702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1270 0))(
  ( (LongMapFixedSize!1271 (defaultEntry!3077 Int) (mask!7491 (_ BitVec 32)) (extraKeys!2818 (_ BitVec 32)) (zeroValue!2920 V!3713) (minValue!2920 V!3713) (_size!684 (_ BitVec 32)) (_keys!4851 array!5131) (_values!3060 array!5133) (_vacant!684 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1270)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154911 (= res!73105 (validMask!0 (mask!7491 thiss!1248)))))

(declare-fun b!154912 () Bool)

(declare-fun res!73108 () Bool)

(assert (=> b!154912 (=> (not res!73108) (not e!101200))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!154912 (= res!73108 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!73109 () Bool)

(assert (=> start!15584 (=> (not res!73109) (not e!101200))))

(declare-fun valid!633 (LongMapFixedSize!1270) Bool)

(assert (=> start!15584 (= res!73109 (valid!633 thiss!1248))))

(assert (=> start!15584 e!101200))

(declare-fun e!101199 () Bool)

(assert (=> start!15584 e!101199))

(assert (=> start!15584 true))

(declare-fun b!154913 () Bool)

(declare-fun res!73107 () Bool)

(assert (=> b!154913 (=> (not res!73107) (not e!101200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5131 (_ BitVec 32)) Bool)

(assert (=> b!154913 (= res!73107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4851 thiss!1248) (mask!7491 thiss!1248)))))

(declare-fun b!154914 () Bool)

(declare-fun e!101196 () Bool)

(declare-fun tp_is_empty!3049 () Bool)

(assert (=> b!154914 (= e!101196 tp_is_empty!3049)))

(declare-fun mapIsEmpty!5216 () Bool)

(declare-fun mapRes!5216 () Bool)

(assert (=> mapIsEmpty!5216 mapRes!5216))

(declare-fun b!154915 () Bool)

(assert (=> b!154915 (= e!101200 false)))

(declare-fun lt!81141 () Bool)

(declare-datatypes ((List!1818 0))(
  ( (Nil!1815) (Cons!1814 (h!2423 (_ BitVec 64)) (t!6611 List!1818)) )
))
(declare-fun arrayNoDuplicates!0 (array!5131 (_ BitVec 32) List!1818) Bool)

(assert (=> b!154915 (= lt!81141 (arrayNoDuplicates!0 (_keys!4851 thiss!1248) #b00000000000000000000000000000000 Nil!1815))))

(declare-fun b!154916 () Bool)

(declare-fun e!101198 () Bool)

(assert (=> b!154916 (= e!101198 (and e!101196 mapRes!5216))))

(declare-fun condMapEmpty!5216 () Bool)

(declare-fun mapDefault!5216 () ValueCell!1181)

(assert (=> b!154916 (= condMapEmpty!5216 (= (arr!2423 (_values!3060 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1181)) mapDefault!5216)))))

(declare-fun mapNonEmpty!5216 () Bool)

(declare-fun tp!12265 () Bool)

(declare-fun e!101197 () Bool)

(assert (=> mapNonEmpty!5216 (= mapRes!5216 (and tp!12265 e!101197))))

(declare-fun mapValue!5216 () ValueCell!1181)

(declare-fun mapRest!5216 () (Array (_ BitVec 32) ValueCell!1181))

(declare-fun mapKey!5216 () (_ BitVec 32))

(assert (=> mapNonEmpty!5216 (= (arr!2423 (_values!3060 thiss!1248)) (store mapRest!5216 mapKey!5216 mapValue!5216))))

(declare-fun b!154917 () Bool)

(assert (=> b!154917 (= e!101197 tp_is_empty!3049)))

(declare-fun array_inv!1555 (array!5131) Bool)

(declare-fun array_inv!1556 (array!5133) Bool)

(assert (=> b!154918 (= e!101199 (and tp!12266 tp_is_empty!3049 (array_inv!1555 (_keys!4851 thiss!1248)) (array_inv!1556 (_values!3060 thiss!1248)) e!101198))))

(declare-fun b!154919 () Bool)

(declare-fun res!73106 () Bool)

(assert (=> b!154919 (=> (not res!73106) (not e!101200))))

(assert (=> b!154919 (= res!73106 (and (= (size!2702 (_values!3060 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7491 thiss!1248))) (= (size!2701 (_keys!4851 thiss!1248)) (size!2702 (_values!3060 thiss!1248))) (bvsge (mask!7491 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2818 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2818 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2818 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!15584 res!73109) b!154912))

(assert (= (and b!154912 res!73108) b!154911))

(assert (= (and b!154911 res!73105) b!154919))

(assert (= (and b!154919 res!73106) b!154913))

(assert (= (and b!154913 res!73107) b!154915))

(assert (= (and b!154916 condMapEmpty!5216) mapIsEmpty!5216))

(assert (= (and b!154916 (not condMapEmpty!5216)) mapNonEmpty!5216))

(get-info :version)

(assert (= (and mapNonEmpty!5216 ((_ is ValueCellFull!1181) mapValue!5216)) b!154917))

(assert (= (and b!154916 ((_ is ValueCellFull!1181) mapDefault!5216)) b!154914))

(assert (= b!154918 b!154916))

(assert (= start!15584 b!154918))

(declare-fun m!188521 () Bool)

(assert (=> b!154913 m!188521))

(declare-fun m!188523 () Bool)

(assert (=> start!15584 m!188523))

(declare-fun m!188525 () Bool)

(assert (=> b!154918 m!188525))

(declare-fun m!188527 () Bool)

(assert (=> b!154918 m!188527))

(declare-fun m!188529 () Bool)

(assert (=> b!154915 m!188529))

(declare-fun m!188531 () Bool)

(assert (=> b!154911 m!188531))

(declare-fun m!188533 () Bool)

(assert (=> mapNonEmpty!5216 m!188533))

(check-sat (not mapNonEmpty!5216) b_and!9635 (not start!15584) (not b_next!3247) (not b!154913) (not b!154918) tp_is_empty!3049 (not b!154911) (not b!154915))
(check-sat b_and!9635 (not b_next!3247))
