; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15678 () Bool)

(assert start!15678)

(declare-fun b!156267 () Bool)

(declare-fun b_free!3345 () Bool)

(declare-fun b_next!3345 () Bool)

(assert (=> b!156267 (= b_free!3345 (not b_next!3345))))

(declare-fun tp!12559 () Bool)

(declare-fun b_and!9759 () Bool)

(assert (=> b!156267 (= tp!12559 b_and!9759)))

(declare-fun b!156264 () Bool)

(declare-fun res!73819 () Bool)

(declare-fun e!102199 () Bool)

(assert (=> b!156264 (=> (not res!73819) (not e!102199))))

(declare-datatypes ((V!3843 0))(
  ( (V!3844 (val!1618 Int)) )
))
(declare-datatypes ((ValueCell!1230 0))(
  ( (ValueCellFull!1230 (v!3483 V!3843)) (EmptyCell!1230) )
))
(declare-datatypes ((array!5347 0))(
  ( (array!5348 (arr!2531 (Array (_ BitVec 32) (_ BitVec 64))) (size!2809 (_ BitVec 32))) )
))
(declare-datatypes ((array!5349 0))(
  ( (array!5350 (arr!2532 (Array (_ BitVec 32) ValueCell!1230)) (size!2810 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1368 0))(
  ( (LongMapFixedSize!1369 (defaultEntry!3126 Int) (mask!7573 (_ BitVec 32)) (extraKeys!2867 (_ BitVec 32)) (zeroValue!2969 V!3843) (minValue!2969 V!3843) (_size!733 (_ BitVec 32)) (_keys!4901 array!5347) (_values!3109 array!5349) (_vacant!733 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1368)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156264 (= res!73819 (validMask!0 (mask!7573 thiss!1248)))))

(declare-fun res!73821 () Bool)

(assert (=> start!15678 (=> (not res!73821) (not e!102199))))

(declare-fun valid!663 (LongMapFixedSize!1368) Bool)

(assert (=> start!15678 (= res!73821 (valid!663 thiss!1248))))

(assert (=> start!15678 e!102199))

(declare-fun e!102201 () Bool)

(assert (=> start!15678 e!102201))

(assert (=> start!15678 true))

(declare-fun b!156265 () Bool)

(assert (=> b!156265 (= e!102199 false)))

(declare-fun lt!81532 () Bool)

(declare-datatypes ((List!1850 0))(
  ( (Nil!1847) (Cons!1846 (h!2455 (_ BitVec 64)) (t!6652 List!1850)) )
))
(declare-fun arrayNoDuplicates!0 (array!5347 (_ BitVec 32) List!1850) Bool)

(assert (=> b!156265 (= lt!81532 (arrayNoDuplicates!0 (_keys!4901 thiss!1248) #b00000000000000000000000000000000 Nil!1847))))

(declare-fun b!156266 () Bool)

(declare-fun res!73818 () Bool)

(assert (=> b!156266 (=> (not res!73818) (not e!102199))))

(assert (=> b!156266 (= res!73818 (and (= (size!2810 (_values!3109 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7573 thiss!1248))) (= (size!2809 (_keys!4901 thiss!1248)) (size!2810 (_values!3109 thiss!1248))) (bvsge (mask!7573 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2867 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2867 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2867 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2867 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2867 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2867 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2867 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!102196 () Bool)

(declare-fun tp_is_empty!3147 () Bool)

(declare-fun array_inv!1599 (array!5347) Bool)

(declare-fun array_inv!1600 (array!5349) Bool)

(assert (=> b!156267 (= e!102201 (and tp!12559 tp_is_empty!3147 (array_inv!1599 (_keys!4901 thiss!1248)) (array_inv!1600 (_values!3109 thiss!1248)) e!102196))))

(declare-fun b!156268 () Bool)

(declare-fun e!102198 () Bool)

(declare-fun mapRes!5363 () Bool)

(assert (=> b!156268 (= e!102196 (and e!102198 mapRes!5363))))

(declare-fun condMapEmpty!5363 () Bool)

(declare-fun mapDefault!5363 () ValueCell!1230)

(assert (=> b!156268 (= condMapEmpty!5363 (= (arr!2532 (_values!3109 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1230)) mapDefault!5363)))))

(declare-fun b!156269 () Bool)

(declare-fun res!73820 () Bool)

(assert (=> b!156269 (=> (not res!73820) (not e!102199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5347 (_ BitVec 32)) Bool)

(assert (=> b!156269 (= res!73820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4901 thiss!1248) (mask!7573 thiss!1248)))))

(declare-fun b!156270 () Bool)

(declare-fun e!102197 () Bool)

(assert (=> b!156270 (= e!102197 tp_is_empty!3147)))

(declare-fun mapNonEmpty!5363 () Bool)

(declare-fun tp!12560 () Bool)

(assert (=> mapNonEmpty!5363 (= mapRes!5363 (and tp!12560 e!102197))))

(declare-fun mapRest!5363 () (Array (_ BitVec 32) ValueCell!1230))

(declare-fun mapValue!5363 () ValueCell!1230)

(declare-fun mapKey!5363 () (_ BitVec 32))

(assert (=> mapNonEmpty!5363 (= (arr!2532 (_values!3109 thiss!1248)) (store mapRest!5363 mapKey!5363 mapValue!5363))))

(declare-fun mapIsEmpty!5363 () Bool)

(assert (=> mapIsEmpty!5363 mapRes!5363))

(declare-fun b!156271 () Bool)

(assert (=> b!156271 (= e!102198 tp_is_empty!3147)))

(declare-fun b!156272 () Bool)

(declare-fun res!73822 () Bool)

(assert (=> b!156272 (=> (not res!73822) (not e!102199))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156272 (= res!73822 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!15678 res!73821) b!156272))

(assert (= (and b!156272 res!73822) b!156264))

(assert (= (and b!156264 res!73819) b!156266))

(assert (= (and b!156266 res!73818) b!156269))

(assert (= (and b!156269 res!73820) b!156265))

(assert (= (and b!156268 condMapEmpty!5363) mapIsEmpty!5363))

(assert (= (and b!156268 (not condMapEmpty!5363)) mapNonEmpty!5363))

(get-info :version)

(assert (= (and mapNonEmpty!5363 ((_ is ValueCellFull!1230) mapValue!5363)) b!156270))

(assert (= (and b!156268 ((_ is ValueCellFull!1230) mapDefault!5363)) b!156271))

(assert (= b!156267 b!156268))

(assert (= start!15678 b!156267))

(declare-fun m!189911 () Bool)

(assert (=> mapNonEmpty!5363 m!189911))

(declare-fun m!189913 () Bool)

(assert (=> start!15678 m!189913))

(declare-fun m!189915 () Bool)

(assert (=> b!156264 m!189915))

(declare-fun m!189917 () Bool)

(assert (=> b!156267 m!189917))

(declare-fun m!189919 () Bool)

(assert (=> b!156267 m!189919))

(declare-fun m!189921 () Bool)

(assert (=> b!156269 m!189921))

(declare-fun m!189923 () Bool)

(assert (=> b!156265 m!189923))

(check-sat (not b!156264) (not b_next!3345) tp_is_empty!3147 (not mapNonEmpty!5363) (not start!15678) (not b!156267) (not b!156269) (not b!156265) b_and!9759)
(check-sat b_and!9759 (not b_next!3345))
