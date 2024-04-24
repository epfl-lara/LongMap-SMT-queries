; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15584 () Bool)

(assert start!15584)

(declare-fun b!155113 () Bool)

(declare-fun b_free!3247 () Bool)

(declare-fun b_next!3247 () Bool)

(assert (=> b!155113 (= b_free!3247 (not b_next!3247))))

(declare-fun tp!12265 () Bool)

(declare-fun b_and!9675 () Bool)

(assert (=> b!155113 (= tp!12265 b_and!9675)))

(declare-fun b!155105 () Bool)

(declare-fun e!101323 () Bool)

(assert (=> b!155105 (= e!101323 false)))

(declare-fun lt!81381 () Bool)

(declare-datatypes ((V!3713 0))(
  ( (V!3714 (val!1569 Int)) )
))
(declare-datatypes ((ValueCell!1181 0))(
  ( (ValueCellFull!1181 (v!3435 V!3713)) (EmptyCell!1181) )
))
(declare-datatypes ((array!5137 0))(
  ( (array!5138 (arr!2426 (Array (_ BitVec 32) (_ BitVec 64))) (size!2704 (_ BitVec 32))) )
))
(declare-datatypes ((array!5139 0))(
  ( (array!5140 (arr!2427 (Array (_ BitVec 32) ValueCell!1181)) (size!2705 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1270 0))(
  ( (LongMapFixedSize!1271 (defaultEntry!3077 Int) (mask!7492 (_ BitVec 32)) (extraKeys!2818 (_ BitVec 32)) (zeroValue!2920 V!3713) (minValue!2920 V!3713) (_size!684 (_ BitVec 32)) (_keys!4852 array!5137) (_values!3060 array!5139) (_vacant!684 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1270)

(declare-datatypes ((List!1798 0))(
  ( (Nil!1795) (Cons!1794 (h!2403 (_ BitVec 64)) (t!6592 List!1798)) )
))
(declare-fun arrayNoDuplicates!0 (array!5137 (_ BitVec 32) List!1798) Bool)

(assert (=> b!155105 (= lt!81381 (arrayNoDuplicates!0 (_keys!4852 thiss!1248) #b00000000000000000000000000000000 Nil!1795))))

(declare-fun b!155106 () Bool)

(declare-fun e!101321 () Bool)

(declare-fun tp_is_empty!3049 () Bool)

(assert (=> b!155106 (= e!101321 tp_is_empty!3049)))

(declare-fun b!155107 () Bool)

(declare-fun res!73225 () Bool)

(assert (=> b!155107 (=> (not res!73225) (not e!101323))))

(assert (=> b!155107 (= res!73225 (and (= (size!2705 (_values!3060 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7492 thiss!1248))) (= (size!2704 (_keys!4852 thiss!1248)) (size!2705 (_values!3060 thiss!1248))) (bvsge (mask!7492 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2818 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2818 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2818 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2818 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155108 () Bool)

(declare-fun res!73224 () Bool)

(assert (=> b!155108 (=> (not res!73224) (not e!101323))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155108 (= res!73224 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!5216 () Bool)

(declare-fun mapRes!5216 () Bool)

(declare-fun tp!12266 () Bool)

(assert (=> mapNonEmpty!5216 (= mapRes!5216 (and tp!12266 e!101321))))

(declare-fun mapRest!5216 () (Array (_ BitVec 32) ValueCell!1181))

(declare-fun mapValue!5216 () ValueCell!1181)

(declare-fun mapKey!5216 () (_ BitVec 32))

(assert (=> mapNonEmpty!5216 (= (arr!2427 (_values!3060 thiss!1248)) (store mapRest!5216 mapKey!5216 mapValue!5216))))

(declare-fun res!73221 () Bool)

(assert (=> start!15584 (=> (not res!73221) (not e!101323))))

(declare-fun valid!641 (LongMapFixedSize!1270) Bool)

(assert (=> start!15584 (= res!73221 (valid!641 thiss!1248))))

(assert (=> start!15584 e!101323))

(declare-fun e!101324 () Bool)

(assert (=> start!15584 e!101324))

(assert (=> start!15584 true))

(declare-fun b!155109 () Bool)

(declare-fun res!73223 () Bool)

(assert (=> b!155109 (=> (not res!73223) (not e!101323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155109 (= res!73223 (validMask!0 (mask!7492 thiss!1248)))))

(declare-fun b!155110 () Bool)

(declare-fun e!101322 () Bool)

(assert (=> b!155110 (= e!101322 tp_is_empty!3049)))

(declare-fun mapIsEmpty!5216 () Bool)

(assert (=> mapIsEmpty!5216 mapRes!5216))

(declare-fun b!155111 () Bool)

(declare-fun e!101320 () Bool)

(assert (=> b!155111 (= e!101320 (and e!101322 mapRes!5216))))

(declare-fun condMapEmpty!5216 () Bool)

(declare-fun mapDefault!5216 () ValueCell!1181)

(assert (=> b!155111 (= condMapEmpty!5216 (= (arr!2427 (_values!3060 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1181)) mapDefault!5216)))))

(declare-fun b!155112 () Bool)

(declare-fun res!73222 () Bool)

(assert (=> b!155112 (=> (not res!73222) (not e!101323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5137 (_ BitVec 32)) Bool)

(assert (=> b!155112 (= res!73222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4852 thiss!1248) (mask!7492 thiss!1248)))))

(declare-fun array_inv!1533 (array!5137) Bool)

(declare-fun array_inv!1534 (array!5139) Bool)

(assert (=> b!155113 (= e!101324 (and tp!12265 tp_is_empty!3049 (array_inv!1533 (_keys!4852 thiss!1248)) (array_inv!1534 (_values!3060 thiss!1248)) e!101320))))

(assert (= (and start!15584 res!73221) b!155108))

(assert (= (and b!155108 res!73224) b!155109))

(assert (= (and b!155109 res!73223) b!155107))

(assert (= (and b!155107 res!73225) b!155112))

(assert (= (and b!155112 res!73222) b!155105))

(assert (= (and b!155111 condMapEmpty!5216) mapIsEmpty!5216))

(assert (= (and b!155111 (not condMapEmpty!5216)) mapNonEmpty!5216))

(get-info :version)

(assert (= (and mapNonEmpty!5216 ((_ is ValueCellFull!1181) mapValue!5216)) b!155106))

(assert (= (and b!155111 ((_ is ValueCellFull!1181) mapDefault!5216)) b!155110))

(assert (= b!155113 b!155111))

(assert (= start!15584 b!155113))

(declare-fun m!189323 () Bool)

(assert (=> b!155113 m!189323))

(declare-fun m!189325 () Bool)

(assert (=> b!155113 m!189325))

(declare-fun m!189327 () Bool)

(assert (=> start!15584 m!189327))

(declare-fun m!189329 () Bool)

(assert (=> b!155112 m!189329))

(declare-fun m!189331 () Bool)

(assert (=> mapNonEmpty!5216 m!189331))

(declare-fun m!189333 () Bool)

(assert (=> b!155109 m!189333))

(declare-fun m!189335 () Bool)

(assert (=> b!155105 m!189335))

(check-sat (not b!155105) (not b!155112) tp_is_empty!3049 (not b!155113) (not start!15584) b_and!9675 (not b!155109) (not mapNonEmpty!5216) (not b_next!3247))
(check-sat b_and!9675 (not b_next!3247))
