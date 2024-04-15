; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15668 () Bool)

(assert start!15668)

(declare-fun b!155931 () Bool)

(declare-fun b_free!3331 () Bool)

(declare-fun b_next!3331 () Bool)

(assert (=> b!155931 (= b_free!3331 (not b_next!3331))))

(declare-fun tp!12517 () Bool)

(declare-fun b_and!9719 () Bool)

(assert (=> b!155931 (= tp!12517 b_and!9719)))

(declare-fun b!155928 () Bool)

(declare-fun e!101971 () Bool)

(declare-fun tp_is_empty!3133 () Bool)

(assert (=> b!155928 (= e!101971 tp_is_empty!3133)))

(declare-fun res!73622 () Bool)

(declare-fun e!101970 () Bool)

(assert (=> start!15668 (=> (not res!73622) (not e!101970))))

(declare-datatypes ((V!3825 0))(
  ( (V!3826 (val!1611 Int)) )
))
(declare-datatypes ((ValueCell!1223 0))(
  ( (ValueCellFull!1223 (v!3470 V!3825)) (EmptyCell!1223) )
))
(declare-datatypes ((array!5299 0))(
  ( (array!5300 (arr!2506 (Array (_ BitVec 32) (_ BitVec 64))) (size!2785 (_ BitVec 32))) )
))
(declare-datatypes ((array!5301 0))(
  ( (array!5302 (arr!2507 (Array (_ BitVec 32) ValueCell!1223)) (size!2786 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1354 0))(
  ( (LongMapFixedSize!1355 (defaultEntry!3119 Int) (mask!7561 (_ BitVec 32)) (extraKeys!2860 (_ BitVec 32)) (zeroValue!2962 V!3825) (minValue!2962 V!3825) (_size!726 (_ BitVec 32)) (_keys!4893 array!5299) (_values!3102 array!5301) (_vacant!726 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1354)

(declare-fun valid!662 (LongMapFixedSize!1354) Bool)

(assert (=> start!15668 (= res!73622 (valid!662 thiss!1248))))

(assert (=> start!15668 e!101970))

(declare-fun e!101969 () Bool)

(assert (=> start!15668 e!101969))

(assert (=> start!15668 true))

(declare-fun b!155929 () Bool)

(declare-fun res!73618 () Bool)

(assert (=> b!155929 (=> (not res!73618) (not e!101970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5299 (_ BitVec 32)) Bool)

(assert (=> b!155929 (= res!73618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4893 thiss!1248) (mask!7561 thiss!1248)))))

(declare-fun b!155930 () Bool)

(declare-fun res!73619 () Bool)

(assert (=> b!155930 (=> (not res!73619) (not e!101970))))

(assert (=> b!155930 (= res!73619 (and (= (size!2786 (_values!3102 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7561 thiss!1248))) (= (size!2785 (_keys!4893 thiss!1248)) (size!2786 (_values!3102 thiss!1248))) (bvsge (mask!7561 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2860 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2860 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2860 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!101974 () Bool)

(declare-fun array_inv!1615 (array!5299) Bool)

(declare-fun array_inv!1616 (array!5301) Bool)

(assert (=> b!155931 (= e!101969 (and tp!12517 tp_is_empty!3133 (array_inv!1615 (_keys!4893 thiss!1248)) (array_inv!1616 (_values!3102 thiss!1248)) e!101974))))

(declare-fun mapNonEmpty!5342 () Bool)

(declare-fun mapRes!5342 () Bool)

(declare-fun tp!12518 () Bool)

(assert (=> mapNonEmpty!5342 (= mapRes!5342 (and tp!12518 e!101971))))

(declare-fun mapRest!5342 () (Array (_ BitVec 32) ValueCell!1223))

(declare-fun mapValue!5342 () ValueCell!1223)

(declare-fun mapKey!5342 () (_ BitVec 32))

(assert (=> mapNonEmpty!5342 (= (arr!2507 (_values!3102 thiss!1248)) (store mapRest!5342 mapKey!5342 mapValue!5342))))

(declare-fun b!155932 () Bool)

(declare-fun res!73620 () Bool)

(assert (=> b!155932 (=> (not res!73620) (not e!101970))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155932 (= res!73620 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!155933 () Bool)

(declare-fun res!73621 () Bool)

(assert (=> b!155933 (=> (not res!73621) (not e!101970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155933 (= res!73621 (validMask!0 (mask!7561 thiss!1248)))))

(declare-fun mapIsEmpty!5342 () Bool)

(assert (=> mapIsEmpty!5342 mapRes!5342))

(declare-fun b!155934 () Bool)

(assert (=> b!155934 (= e!101970 false)))

(declare-fun lt!81330 () Bool)

(declare-datatypes ((List!1844 0))(
  ( (Nil!1841) (Cons!1840 (h!2449 (_ BitVec 64)) (t!6637 List!1844)) )
))
(declare-fun arrayNoDuplicates!0 (array!5299 (_ BitVec 32) List!1844) Bool)

(assert (=> b!155934 (= lt!81330 (arrayNoDuplicates!0 (_keys!4893 thiss!1248) #b00000000000000000000000000000000 Nil!1841))))

(declare-fun b!155935 () Bool)

(declare-fun e!101973 () Bool)

(assert (=> b!155935 (= e!101974 (and e!101973 mapRes!5342))))

(declare-fun condMapEmpty!5342 () Bool)

(declare-fun mapDefault!5342 () ValueCell!1223)

(assert (=> b!155935 (= condMapEmpty!5342 (= (arr!2507 (_values!3102 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1223)) mapDefault!5342)))))

(declare-fun b!155936 () Bool)

(assert (=> b!155936 (= e!101973 tp_is_empty!3133)))

(assert (= (and start!15668 res!73622) b!155932))

(assert (= (and b!155932 res!73620) b!155933))

(assert (= (and b!155933 res!73621) b!155930))

(assert (= (and b!155930 res!73619) b!155929))

(assert (= (and b!155929 res!73618) b!155934))

(assert (= (and b!155935 condMapEmpty!5342) mapIsEmpty!5342))

(assert (= (and b!155935 (not condMapEmpty!5342)) mapNonEmpty!5342))

(get-info :version)

(assert (= (and mapNonEmpty!5342 ((_ is ValueCellFull!1223) mapValue!5342)) b!155928))

(assert (= (and b!155935 ((_ is ValueCellFull!1223) mapDefault!5342)) b!155936))

(assert (= b!155931 b!155935))

(assert (= start!15668 b!155931))

(declare-fun m!189193 () Bool)

(assert (=> b!155931 m!189193))

(declare-fun m!189195 () Bool)

(assert (=> b!155931 m!189195))

(declare-fun m!189197 () Bool)

(assert (=> start!15668 m!189197))

(declare-fun m!189199 () Bool)

(assert (=> b!155933 m!189199))

(declare-fun m!189201 () Bool)

(assert (=> b!155929 m!189201))

(declare-fun m!189203 () Bool)

(assert (=> b!155934 m!189203))

(declare-fun m!189205 () Bool)

(assert (=> mapNonEmpty!5342 m!189205))

(check-sat tp_is_empty!3133 (not b!155933) b_and!9719 (not start!15668) (not b!155929) (not b!155931) (not b_next!3331) (not mapNonEmpty!5342) (not b!155934))
(check-sat b_and!9719 (not b_next!3331))
