; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15638 () Bool)

(assert start!15638)

(declare-fun b!155828 () Bool)

(declare-fun b_free!3301 () Bool)

(declare-fun b_next!3301 () Bool)

(assert (=> b!155828 (= b_free!3301 (not b_next!3301))))

(declare-fun tp!12428 () Bool)

(declare-fun b_and!9729 () Bool)

(assert (=> b!155828 (= tp!12428 b_and!9729)))

(declare-fun e!101806 () Bool)

(declare-fun tp_is_empty!3103 () Bool)

(declare-fun e!101807 () Bool)

(declare-datatypes ((V!3785 0))(
  ( (V!3786 (val!1596 Int)) )
))
(declare-datatypes ((ValueCell!1208 0))(
  ( (ValueCellFull!1208 (v!3462 V!3785)) (EmptyCell!1208) )
))
(declare-datatypes ((array!5245 0))(
  ( (array!5246 (arr!2480 (Array (_ BitVec 32) (_ BitVec 64))) (size!2758 (_ BitVec 32))) )
))
(declare-datatypes ((array!5247 0))(
  ( (array!5248 (arr!2481 (Array (_ BitVec 32) ValueCell!1208)) (size!2759 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1324 0))(
  ( (LongMapFixedSize!1325 (defaultEntry!3104 Int) (mask!7537 (_ BitVec 32)) (extraKeys!2845 (_ BitVec 32)) (zeroValue!2947 V!3785) (minValue!2947 V!3785) (_size!711 (_ BitVec 32)) (_keys!4879 array!5245) (_values!3087 array!5247) (_vacant!711 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1324)

(declare-fun array_inv!1565 (array!5245) Bool)

(declare-fun array_inv!1566 (array!5247) Bool)

(assert (=> b!155828 (= e!101806 (and tp!12428 tp_is_empty!3103 (array_inv!1565 (_keys!4879 thiss!1248)) (array_inv!1566 (_values!3087 thiss!1248)) e!101807))))

(declare-fun b!155829 () Bool)

(declare-fun e!101811 () Bool)

(assert (=> b!155829 (= e!101811 (not true))))

(declare-fun lt!81464 () Bool)

(declare-fun v!309 () V!3785)

(declare-fun valid!660 (LongMapFixedSize!1324) Bool)

(assert (=> b!155829 (= lt!81464 (valid!660 (LongMapFixedSize!1325 (defaultEntry!3104 thiss!1248) (mask!7537 thiss!1248) (bvor (extraKeys!2845 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2947 thiss!1248) (_size!711 thiss!1248) (_keys!4879 thiss!1248) (_values!3087 thiss!1248) (_vacant!711 thiss!1248))))))

(declare-datatypes ((tuple2!2764 0))(
  ( (tuple2!2765 (_1!1393 (_ BitVec 64)) (_2!1393 V!3785)) )
))
(declare-datatypes ((List!1817 0))(
  ( (Nil!1814) (Cons!1813 (h!2422 tuple2!2764) (t!6611 List!1817)) )
))
(declare-datatypes ((ListLongMap!1763 0))(
  ( (ListLongMap!1764 (toList!897 List!1817)) )
))
(declare-fun +!190 (ListLongMap!1763 tuple2!2764) ListLongMap!1763)

(declare-fun getCurrentListMap!565 (array!5245 array!5247 (_ BitVec 32) (_ BitVec 32) V!3785 V!3785 (_ BitVec 32) Int) ListLongMap!1763)

(assert (=> b!155829 (= (+!190 (getCurrentListMap!565 (_keys!4879 thiss!1248) (_values!3087 thiss!1248) (mask!7537 thiss!1248) (extraKeys!2845 thiss!1248) (zeroValue!2947 thiss!1248) (minValue!2947 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3104 thiss!1248)) (tuple2!2765 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!565 (_keys!4879 thiss!1248) (_values!3087 thiss!1248) (mask!7537 thiss!1248) (bvor (extraKeys!2845 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2947 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3104 thiss!1248)))))

(declare-datatypes ((Unit!4935 0))(
  ( (Unit!4936) )
))
(declare-fun lt!81465 () Unit!4935)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!72 (array!5245 array!5247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3785 V!3785 V!3785 Int) Unit!4935)

(assert (=> b!155829 (= lt!81465 (lemmaChangeZeroKeyThenAddPairToListMap!72 (_keys!4879 thiss!1248) (_values!3087 thiss!1248) (mask!7537 thiss!1248) (extraKeys!2845 thiss!1248) (bvor (extraKeys!2845 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2947 thiss!1248) v!309 (minValue!2947 thiss!1248) (defaultEntry!3104 thiss!1248)))))

(declare-fun b!155830 () Bool)

(declare-fun e!101810 () Bool)

(assert (=> b!155830 (= e!101810 tp_is_empty!3103)))

(declare-fun mapIsEmpty!5297 () Bool)

(declare-fun mapRes!5297 () Bool)

(assert (=> mapIsEmpty!5297 mapRes!5297))

(declare-fun mapNonEmpty!5297 () Bool)

(declare-fun tp!12427 () Bool)

(assert (=> mapNonEmpty!5297 (= mapRes!5297 (and tp!12427 e!101810))))

(declare-fun mapRest!5297 () (Array (_ BitVec 32) ValueCell!1208))

(declare-fun mapValue!5297 () ValueCell!1208)

(declare-fun mapKey!5297 () (_ BitVec 32))

(assert (=> mapNonEmpty!5297 (= (arr!2481 (_values!3087 thiss!1248)) (store mapRest!5297 mapKey!5297 mapValue!5297))))

(declare-fun res!73621 () Bool)

(assert (=> start!15638 (=> (not res!73621) (not e!101811))))

(assert (=> start!15638 (= res!73621 (valid!660 thiss!1248))))

(assert (=> start!15638 e!101811))

(assert (=> start!15638 e!101806))

(assert (=> start!15638 true))

(assert (=> start!15638 tp_is_empty!3103))

(declare-fun b!155831 () Bool)

(declare-fun e!101808 () Bool)

(assert (=> b!155831 (= e!101807 (and e!101808 mapRes!5297))))

(declare-fun condMapEmpty!5297 () Bool)

(declare-fun mapDefault!5297 () ValueCell!1208)

(assert (=> b!155831 (= condMapEmpty!5297 (= (arr!2481 (_values!3087 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1208)) mapDefault!5297)))))

(declare-fun b!155832 () Bool)

(assert (=> b!155832 (= e!101808 tp_is_empty!3103)))

(declare-fun b!155833 () Bool)

(declare-fun res!73620 () Bool)

(assert (=> b!155833 (=> (not res!73620) (not e!101811))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155833 (= res!73620 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!15638 res!73621) b!155833))

(assert (= (and b!155833 res!73620) b!155829))

(assert (= (and b!155831 condMapEmpty!5297) mapIsEmpty!5297))

(assert (= (and b!155831 (not condMapEmpty!5297)) mapNonEmpty!5297))

(get-info :version)

(assert (= (and mapNonEmpty!5297 ((_ is ValueCellFull!1208) mapValue!5297)) b!155830))

(assert (= (and b!155831 ((_ is ValueCellFull!1208) mapDefault!5297)) b!155832))

(assert (= b!155828 b!155831))

(assert (= start!15638 b!155828))

(declare-fun m!189701 () Bool)

(assert (=> b!155828 m!189701))

(declare-fun m!189703 () Bool)

(assert (=> b!155828 m!189703))

(declare-fun m!189705 () Bool)

(assert (=> b!155829 m!189705))

(declare-fun m!189707 () Bool)

(assert (=> b!155829 m!189707))

(assert (=> b!155829 m!189705))

(declare-fun m!189709 () Bool)

(assert (=> b!155829 m!189709))

(declare-fun m!189711 () Bool)

(assert (=> b!155829 m!189711))

(declare-fun m!189713 () Bool)

(assert (=> b!155829 m!189713))

(declare-fun m!189715 () Bool)

(assert (=> mapNonEmpty!5297 m!189715))

(declare-fun m!189717 () Bool)

(assert (=> start!15638 m!189717))

(check-sat (not b_next!3301) b_and!9729 (not b!155829) (not mapNonEmpty!5297) (not b!155828) (not start!15638) tp_is_empty!3103)
(check-sat b_and!9729 (not b_next!3301))
